const prisma = require('../config/database');
const { hashPassword } = require('../utils/password');
const { generateAccessToken } = require('../utils/jwt');
const { invalidateTenantCache } = require('../middleware/subscription');
const logger = require('../utils/logger');

// ─── Plan Defaults ────────────────────────────────────────────────────────────
const PLAN_DEFAULTS = {
    BASIC: { maxUsers: 5 },
    PRO: { maxUsers: 25 },
    ENTERPRISE: { maxUsers: 99999 },
    CUSTOM: { maxUsers: 10 },
};

const LICENSE_DATE_FORMAT_ERROR = 'Invalid date format provided for License dates.';
const LICENSE_DATE_RANGE_ERROR = 'License end date cannot be before the start date.';

const badRequestError = (message) => Object.assign(new Error(message), { statusCode: 400 });

const parseValidLicenseDate = (value) => {
    const parsedDate = value instanceof Date ? value : new Date(value);
    if (Number.isNaN(parsedDate.getTime())) {
        throw badRequestError(LICENSE_DATE_FORMAT_ERROR);
    }
    return parsedDate;
};

const validateLicenseDateRange = (startDate, endDate) => {
    if (endDate && endDate < startDate) {
        throw badRequestError(LICENSE_DATE_RANGE_ERROR);
    }
};

const resolveLicenseStartDateForCreate = (licenseStartDate) => {
    if (licenseStartDate === undefined || licenseStartDate === null || licenseStartDate === '') {
        return new Date();
    }
    return parseValidLicenseDate(licenseStartDate);
};

const resolveLicenseStartDateForUpdate = (licenseStartDate) => {
    if (licenseStartDate === null || licenseStartDate === '') {
        throw badRequestError(LICENSE_DATE_FORMAT_ERROR);
    }
    return parseValidLicenseDate(licenseStartDate);
};

const resolveLicenseEndDateForCreate = (licenseEndDate, trialDays) => {
    if (licenseEndDate === null || licenseEndDate === '') return null;
    if (licenseEndDate === undefined) {
        return new Date(Date.now() + trialDays * 24 * 60 * 60 * 1000);
    }
    return parseValidLicenseDate(licenseEndDate);
};

const resolveLicenseEndDateForUpdate = (licenseEndDate) => {
    if (licenseEndDate === null || licenseEndDate === '') return null;
    return parseValidLicenseDate(licenseEndDate);
};

// ─── Admin Audit Helper ───────────────────────────────────────────────────────
const logAdminAction = async (adminUserId, action, targetTenantId, details, ipAddress) => {
    try {
        await prisma.superAdminLog.create({
            data: {
                adminUserId,
                action,
                targetTenantId: targetTenantId || null,
                details: details || null,
                ipAddress: ipAddress || null,
            },
        });
    } catch (err) {
        logger.error(`SuperAdmin audit log failed: ${err.message}`);
    }
};

const getTenantUserIds = async (db, tenantId) => {
    const rows = await db.tenantMember.findMany({
        where: { tenantId, isActive: true },
        select: { userId: true },
        distinct: ['userId'],
    });
    return rows.map((row) => row.userId);
};

// ─── S1.1 — List Tenants ──────────────────────────────────────────────────────
const listTenants = async ({ page = 1, limit = 20, search, status } = {}) => {
    const pageNum = Number(page) || 1;
    const limitNum = Number(limit) || 20;

    const where = {};
    if (search) {
        where.OR = [
            { name: { contains: search, mode: 'insensitive' } },
            { slug: { contains: search, mode: 'insensitive' } },
        ];
    }
    if (status) {
        where.subStatus = status;
    }

    const tenants = await prisma.tenant.findMany({
        where,
        orderBy: { createdAt: 'desc' },
        include: {
            parent: { select: { name: true } },
            _count: { select: { memberships: true, locations: true } },
        },
    });

    const toTenantRow = (tenant) => ({
        ...tenant,
        email: tenant.email || null,
        parentName: tenant.parent?.name || null,
        usersCount: tenant._count?.memberships || 0,
    });

    const tenantRows = tenants.map(toTenantRow);
    const roots = tenantRows.filter((tenant) => !tenant.parentId);
    const branchesByParentId = new Map();

    for (const tenant of tenantRows) {
        if (!tenant.parentId) continue;
        const parentBranches = branchesByParentId.get(tenant.parentId) || [];
        parentBranches.push(tenant);
        branchesByParentId.set(tenant.parentId, parentBranches);
    }

    const total = roots.length;
    const skip = (pageNum - 1) * limitNum;
    const paginatedRoots = roots.slice(skip, skip + limitNum);
    const rows = paginatedRoots.map((root) => ({
        ...root,
        branches: branchesByParentId.get(root.id) || [],
    }));

    return { data: rows, total, page: pageNum, limit: limitNum };
};

// ─── S1.2 — Get Tenant Detail ─────────────────────────────────────────────────
const getTenant = async (tenantId) => {
    const tenant = await prisma.tenant.findUnique({
        where: { id: tenantId },
        include: {
            _count: {
                select: { memberships: true, locations: true, movementDocuments: true, items: true },
            },
        },
    });
    if (!tenant) throw Object.assign(new Error('Tenant not found.'), { statusCode: 404 });
    return {
        ...tenant,
        usersCount: tenant._count?.memberships || 0,
    };
};

// ─── S1.3 — Create Tenant ─────────────────────────────────────────────────────
const createTenant = async (data, adminUserId, ipAddress) => {
    const {
        name,
        slug,
        email,
        parentId = null,
        hasBranches = false,
        maxBranches = 0,
        planType = 'BASIC',
        subStatus = 'TRIAL',
        licenseStartDate,
        licenseEndDate,
        maxUsers,
        adminEmail,
        adminPassword,
        adminFirstName = 'Admin',
        adminLastName,
        // Legacy support
        trialDays = 30,
    } = data;

    // Check uniqueness
    const existing = await prisma.tenant.findFirst({
        where: { OR: [{ slug }, { name }] },
    });
    if (existing) {
        throw Object.assign(
            new Error(`Tenant name or slug already exists.`),
            { statusCode: 409 }
        );
    }

    const limits = PLAN_DEFAULTS[planType] || PLAN_DEFAULTS.BASIC;
    let resolvedParentId = null;
    let resolvedHasBranches = Boolean(hasBranches);
    let resolvedMaxBranches = Number(maxBranches) || 0;

    // Parent/child hierarchy rules:
    // - Child tenants inherit strict branch settings (cannot have branches at creation).
    // - Parent tenant must explicitly allow branches and stay under branch limit.
    if (parentId) {
        const parentTenant = await prisma.tenant.findUnique({
            where: { id: parentId },
            select: { id: true, hasBranches: true, maxBranches: true, _count: { select: { children: true } } },
        });

        if (!parentTenant) {
            throw Object.assign(new Error('Parent tenant not found.'), { statusCode: 404 });
        }
        if (!parentTenant.hasBranches) {
            throw Object.assign(
                new Error('This parent tenant is not authorized to have branches.'),
                { statusCode: 400 }
            );
        }
        if (parentTenant.maxBranches > 0 && parentTenant._count.children >= parentTenant.maxBranches) {
            throw Object.assign(
                new Error('Branch limit reached for this parent.'),
                { statusCode: 400 }
            );
        }

        resolvedParentId = parentTenant.id;
        resolvedHasBranches = false;
        resolvedMaxBranches = 0;
    }

    const startDate = resolveLicenseStartDateForCreate(licenseStartDate);
    // Lifetime license when null/empty string; fallback to trial only when not provided.
    const endDate = resolveLicenseEndDateForCreate(licenseEndDate, trialDays);
    validateLicenseDateRange(startDate, endDate);

    const tenant = await prisma.$transaction(async (tx) => {
        // 1. Create Tenant
        const t = await tx.tenant.create({
            data: {
                name,
                slug,
                email: email !== undefined ? email : (adminEmail ? adminEmail.toLowerCase() : null),
                parentId: resolvedParentId,
                hasBranches: resolvedHasBranches,
                maxBranches: resolvedMaxBranches,
                planType,
                subStatus,
                licenseStartDate: startDate,
                licenseEndDate: endDate,
                maxUsers: maxUsers !== undefined ? Number(maxUsers) : limits.maxUsers,
                isActive: true,
            },
        });

        // 2. Create first Admin user
        if (adminEmail) {
            const normalizedAdminEmail = adminEmail.toLowerCase();
            let adminUser = await tx.user.findUnique({
                where: { email: normalizedAdminEmail },
            });

            if (!adminUser) {
                if (!adminPassword) {
                    throw Object.assign(
                        new Error('adminPassword is required when assigning a new admin email.'),
                        { statusCode: 400 }
                    );
                }
                const passwordHash = await hashPassword(adminPassword);
                adminUser = await tx.user.create({
                    data: {
                        email: normalizedAdminEmail,
                        passwordHash,
                        firstName: adminFirstName,
                        lastName: adminLastName || name,
                        isActive: true,
                    },
                });
            }

            await tx.tenantMember.upsert({
                where: { tenantId_userId: { tenantId: t.id, userId: adminUser.id } },
                create: {
                    tenantId: t.id,
                    userId: adminUser.id,
                    role: 'ADMIN',
                    isActive: true,
                },
                update: {
                    role: 'ADMIN',
                    isActive: true,
                },
            });
        }

        return t;
    });

    await logAdminAction(adminUserId, 'TENANT_CREATED', tenant.id, { name, slug, planType }, ipAddress);
    return tenant;
};

// ─── S1.4 — Update Tenant Info ────────────────────────────────────────────────
const updateTenant = async (tenantId, data, adminUserId, ipAddress) => {
    const tenant = await prisma.tenant.findUnique({
        where: { id: tenantId },
        select: {
            id: true,
            parentId: true,
            hasBranches: true,
            licenseStartDate: true,
            licenseEndDate: true,
            _count: { select: { children: true } },
        },
    });
    if (!tenant) throw Object.assign(new Error('Tenant not found.'), { statusCode: 404 });

    const hasParentIdInPayload = Object.prototype.hasOwnProperty.call(data, 'parentId');
    const hasHasBranchesInPayload = Object.prototype.hasOwnProperty.call(data, 'hasBranches');
    const requestedParentId = hasParentIdInPayload ? (data.parentId || null) : tenant.parentId;
    const isParentChanging = hasParentIdInPayload && requestedParentId !== tenant.parentId;

    // Guardrail: cannot disable branching while children still exist.
    if (hasHasBranchesInPayload && tenant.hasBranches && data.hasBranches === false && tenant._count.children > 0) {
        throw Object.assign(
            new Error('Cannot disable branches for a tenant that already has active branches.'),
            { statusCode: 400 }
        );
    }

    // Re-parenting validations
    if (isParentChanging && requestedParentId) {
        if (requestedParentId === tenantId) {
            throw Object.assign(new Error('A tenant cannot be assigned as its own parent.'), { statusCode: 400 });
        }

        const newParent = await prisma.tenant.findUnique({
            where: { id: requestedParentId },
            select: { id: true, hasBranches: true, maxBranches: true, _count: { select: { children: true } } },
        });
        if (!newParent) {
            throw Object.assign(new Error('Parent tenant not found.'), { statusCode: 404 });
        }
        if (!newParent.hasBranches) {
            throw Object.assign(
                new Error('This parent tenant is not authorized to have branches.'),
                { statusCode: 400 }
            );
        }

        const parentChildCountExcludingThis =
            newParent._count.children - (tenant.parentId === newParent.id ? 1 : 0);
        if (newParent.maxBranches > 0 && parentChildCountExcludingThis >= newParent.maxBranches) {
            throw Object.assign(new Error('Branch limit reached for this parent.'), { statusCode: 400 });
        }

        // Optional circular-reference protection:
        // new parent cannot be any descendant of current tenant.
        let cursor = requestedParentId;
        while (cursor) {
            if (cursor === tenantId) {
                throw Object.assign(
                    new Error('Invalid hierarchy: parent assignment creates a circular reference.'),
                    { statusCode: 400 }
                );
            }
            const node = await prisma.tenant.findUnique({
                where: { id: cursor },
                select: { parentId: true },
            });
            cursor = node?.parentId || null;
        }
    }

    // If moving to a parent (becoming branch), disallow tenants that already have their own branches.
    if (isParentChanging && requestedParentId && tenant._count.children > 0) {
        throw Object.assign(
            new Error('Cannot convert a tenant with active branches into a child branch.'),
            { statusCode: 400 }
        );
    }

    const hasLicenseStartDateInPayload = Object.prototype.hasOwnProperty.call(data, 'licenseStartDate');
    const hasLicenseEndDateInPayload = Object.prototype.hasOwnProperty.call(data, 'licenseEndDate');
    const nextLicenseStartDate = hasLicenseStartDateInPayload
        ? resolveLicenseStartDateForUpdate(data.licenseStartDate)
        : tenant.licenseStartDate;
    const nextLicenseEndDate = hasLicenseEndDateInPayload
        ? resolveLicenseEndDateForUpdate(data.licenseEndDate)
        : tenant.licenseEndDate;
    validateLicenseDateRange(nextLicenseStartDate, nextLicenseEndDate);

    // Normalize hierarchy branch flags:
    // - Child tenant => hasBranches=false, maxBranches=0
    // - Root tenant => can use payload values.
    const updateData = {
        ...(data.name !== undefined ? { name: data.name } : {}),
        ...(data.phone !== undefined ? { phone: data.phone } : {}),
        ...(data.email !== undefined ? { email: data.email } : {}),
        ...(data.address !== undefined ? { address: data.address } : {}),
        ...(data.logoUrl !== undefined ? { logoUrl: data.logoUrl } : {}),
        // License fields
        ...(data.planType !== undefined ? { planType: data.planType } : {}),
        ...(data.subStatus !== undefined ? { subStatus: data.subStatus } : {}),
        ...(data.maxUsers !== undefined ? { maxUsers: Number(data.maxUsers) } : {}),
        ...(hasLicenseStartDateInPayload ? { licenseStartDate: nextLicenseStartDate } : {}),
        ...(hasLicenseEndDateInPayload ? { licenseEndDate: nextLicenseEndDate } : {}),
        ...(data.isActive !== undefined ? { isActive: data.isActive } : {}),
        ...(hasParentIdInPayload ? { parentId: requestedParentId } : {}),
    };

    if (requestedParentId) {
        updateData.hasBranches = false;
        updateData.maxBranches = 0;
    } else {
        if (hasHasBranchesInPayload) updateData.hasBranches = Boolean(data.hasBranches);
        if (Object.prototype.hasOwnProperty.call(data, 'maxBranches')) {
            updateData.maxBranches = Number(data.maxBranches) || 0;
        }
    }

    const updated = await prisma.tenant.update({
        where: { id: tenantId },
        data: updateData,
    });

    // Invalidate subscription cache so changes take effect immediately
    invalidateTenantCache(tenantId);

    await logAdminAction(adminUserId, 'TENANT_UPDATED', tenantId, data, ipAddress);
    return updated;
};

// ─── S1.5 — Activate Tenant ──────────────────────────────────────────────────
const activateTenant = async (tenantId, adminUserId, ipAddress) => {
    const tenant = await prisma.tenant.findUnique({ where: { id: tenantId } });
    if (!tenant) throw Object.assign(new Error('Tenant not found.'), { statusCode: 404 });

    const updated = await prisma.tenant.update({
        where: { id: tenantId },
        data: { isActive: true, subStatus: 'ACTIVE' },
    });

    invalidateTenantCache(tenantId);
    await logAdminAction(adminUserId, 'TENANT_ACTIVATED', tenantId, null, ipAddress);
    return updated;
};

// ─── S1.6 — Suspend Tenant ──────────────────────────────────────────────────
const suspendTenant = async (tenantId, adminUserId, ipAddress) => {
    const tenant = await prisma.tenant.findUnique({ where: { id: tenantId } });
    if (!tenant) throw Object.assign(new Error('Tenant not found.'), { statusCode: 404 });

    await prisma.$transaction(async (tx) => {
        // 1. Mark tenant as suspended
        await tx.tenant.update({
            where: { id: tenantId },
            data: { isActive: false, subStatus: 'SUSPENDED' },
        });

        // 2. Revoke all active refresh tokens for this tenant's users
        const userIds = await getTenantUserIds(tx, tenantId);

        if (userIds.length > 0) {
            await tx.refreshToken.updateMany({
                where: { userId: { in: userIds }, revokedAt: null },
                data: { revokedAt: new Date() },
            });
        }
    });

    invalidateTenantCache(tenantId);
    await logAdminAction(adminUserId, 'TENANT_SUSPENDED', tenantId, null, ipAddress);
};

// ─── S1.7 — Set Subscription / License ─────────────────────────────────────
const setSubscription = async (tenantId, data, adminUserId, ipAddress) => {
    const tenant = await prisma.tenant.findUnique({ where: { id: tenantId } });
    if (!tenant) throw Object.assign(new Error('Tenant not found.'), { statusCode: 404 });

    const { planType, status, endDate, maxUsers } = data;
    const limits = planType ? (PLAN_DEFAULTS[planType] || {}) : {};

    const updated = await prisma.tenant.update({
        where: { id: tenantId },
        data: {
            ...(planType !== undefined ? { planType } : {}),
            ...(status !== undefined ? { subStatus: status } : {}),
            ...(endDate ? { licenseEndDate: new Date(endDate) } : {}),
            ...(maxUsers !== undefined ? { maxUsers: Number(maxUsers) }
                : limits.maxUsers !== undefined ? { maxUsers: limits.maxUsers } : {}),
            isActive: true, // Re-activating on subscription set
        },
    });

    invalidateTenantCache(tenantId);
    await logAdminAction(adminUserId, 'PLAN_CHANGED', tenantId, data, ipAddress);
    return updated;
};

// ─── S1.8 — Force Logout ─────────────────────────────────────────────────────
const forceLogoutTenant = async (tenantId, adminUserId, ipAddress) => {
    const tenant = await prisma.tenant.findUnique({ where: { id: tenantId } });
    if (!tenant) throw Object.assign(new Error('Tenant not found.'), { statusCode: 404 });

    const userIds = await getTenantUserIds(prisma, tenantId);

    let revokedCount = 0;
    if (userIds.length > 0) {
        const result = await prisma.refreshToken.updateMany({
            where: { userId: { in: userIds }, revokedAt: null },
            data: { revokedAt: new Date() },
        });
        revokedCount = result.count;
        logger.info(`Force logout: revoked ${revokedCount} tokens for tenant ${tenantId}`);
    }

    await logAdminAction(
        adminUserId,
        'FORCE_LOGOUT',
        tenantId,
        { revokedTokens: revokedCount },
        ipAddress
    );
};

// ─── S1.9 — Impersonate (Read-only Token) ────────────────────────────────────
const impersonateTenant = async (tenantId, adminUserId, ipAddress) => {
    const tenant = await prisma.tenant.findUnique({ where: { id: tenantId } });
    if (!tenant) throw Object.assign(new Error('Tenant not found.'), { statusCode: 404 });

    // Find first admin user in tenant for the token payload
    const adminMembership = await prisma.tenantMember.findFirst({
        where: { tenantId, role: 'ADMIN', isActive: true, user: { isActive: true } },
        include: { user: true },
    });
    if (!adminMembership) {
        throw Object.assign(
            new Error('No active admin user in target tenant.'),
            { statusCode: 404 }
        );
    }

    const token = generateAccessToken({
        userId: adminMembership.user.id,
        tenantId,
        role: adminMembership.role,
        email: adminMembership.user.email,
        readOnly: true,
        impersonatedBy: adminUserId,
    });

    await logAdminAction(
        adminUserId,
        'IMPERSONATION_STARTED',
        tenantId,
        { asUser: adminMembership.user.email },
        ipAddress
    );

    return {
        token,
        expiresIn: '15m',
        tenant: tenant.name,
        asUser: adminMembership.user.email,
        readOnly: true,
    };
};

// ─── S1.10 — Get Admin Logs ──────────────────────────────────────────────────
const getAdminLogs = async ({ page = 1, limit = 50, targetTenantId, action } = {}) => {
    const pageNum = Number(page) || 1;
    const limitNum = Number(limit) || 50;
    const skip = (pageNum - 1) * limitNum;

    const where = {
        ...(targetTenantId ? { targetTenantId } : {}),
        ...(action ? { action } : {}),
    };

    const [total, logs] = await Promise.all([
        prisma.superAdminLog.count({ where }),
        prisma.superAdminLog.findMany({
            where,
            skip,
            take: limitNum,
            orderBy: { createdAt: 'desc' },
            include: {
                adminUser: {
                    select: { id: true, firstName: true, lastName: true, email: true },
                },
            },
        }),
    ]);

    return { data: logs, total, page: pageNum, limit: limitNum };
};

module.exports = {
    PLAN_DEFAULTS,
    listTenants,
    getTenant,
    createTenant,
    updateTenant,
    activateTenant,
    suspendTenant,
    setSubscription,
    forceLogoutTenant,
    impersonateTenant,
    getAdminLogs,
};
