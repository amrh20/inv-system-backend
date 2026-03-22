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

// ─── S1.1 — List Tenants ──────────────────────────────────────────────────────
const listTenants = async ({ page = 1, limit = 20, search, status } = {}) => {
    const pageNum = Number(page) || 1;
    const limitNum = Number(limit) || 20;
    const skip = (pageNum - 1) * limitNum;

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

    const [total, tenants] = await Promise.all([
        prisma.tenant.count({ where }),
        prisma.tenant.findMany({
            where,
            skip,
            take: limitNum,
            orderBy: { createdAt: 'desc' },
            include: {
                _count: { select: { users: true, locations: true } },
            },
        }),
    ]);
    return { data: tenants, total, page: pageNum, limit: limitNum };
};

// ─── S1.2 — Get Tenant Detail ─────────────────────────────────────────────────
const getTenant = async (tenantId) => {
    const tenant = await prisma.tenant.findUnique({
        where: { id: tenantId },
        include: {
            _count: {
                select: { users: true, locations: true, movementDocuments: true, items: true },
            },
        },
    });
    if (!tenant) throw Object.assign(new Error('Tenant not found.'), { statusCode: 404 });
    return tenant;
};

// ─── S1.3 — Create Tenant ─────────────────────────────────────────────────────
const createTenant = async (data, adminUserId, ipAddress) => {
    const {
        name,
        slug,
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

    // Compute license end date: use provided value, or calculate from trialDays
    const endDate = licenseEndDate
        ? new Date(licenseEndDate)
        : new Date(Date.now() + trialDays * 24 * 60 * 60 * 1000);

    const tenant = await prisma.$transaction(async (tx) => {
        // 1. Create Tenant
        const t = await tx.tenant.create({
            data: {
                name,
                slug,
                planType,
                subStatus,
                licenseStartDate: licenseStartDate ? new Date(licenseStartDate) : new Date(),
                licenseEndDate: endDate,
                maxUsers: maxUsers !== undefined ? Number(maxUsers) : limits.maxUsers,
                isActive: true,
            },
        });

        // 2. Create first Admin user
        if (adminEmail && adminPassword) {
            const passwordHash = await hashPassword(adminPassword);
            await tx.user.create({
                data: {
                    tenantId: t.id,
                    email: adminEmail.toLowerCase(),
                    passwordHash,
                    firstName: adminFirstName,
                    lastName: adminLastName || name,
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
    const tenant = await prisma.tenant.findUnique({ where: { id: tenantId } });
    if (!tenant) throw Object.assign(new Error('Tenant not found.'), { statusCode: 404 });

    const updated = await prisma.tenant.update({
        where: { id: tenantId },
        data: {
            ...(data.name !== undefined ? { name: data.name } : {}),
            ...(data.phone !== undefined ? { phone: data.phone } : {}),
            ...(data.email !== undefined ? { email: data.email } : {}),
            ...(data.address !== undefined ? { address: data.address } : {}),
            ...(data.logoUrl !== undefined ? { logoUrl: data.logoUrl } : {}),
            // License fields
            ...(data.planType !== undefined ? { planType: data.planType } : {}),
            ...(data.subStatus !== undefined ? { subStatus: data.subStatus } : {}),
            ...(data.maxUsers !== undefined ? { maxUsers: Number(data.maxUsers) } : {}),
            ...(data.licenseStartDate ? { licenseStartDate: new Date(data.licenseStartDate) } : {}),
            ...(data.licenseEndDate ? { licenseEndDate: new Date(data.licenseEndDate) } : {}),
            ...(data.isActive !== undefined ? { isActive: data.isActive } : {}),
        },
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
        const userIds = (
            await tx.user.findMany({ where: { tenantId }, select: { id: true } })
        ).map((u) => u.id);

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

    const userIds = (
        await prisma.user.findMany({ where: { tenantId }, select: { id: true } })
    ).map((u) => u.id);

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
    const adminUser = await prisma.user.findFirst({
        where: { tenantId, role: 'ADMIN', isActive: true },
    });
    if (!adminUser) {
        throw Object.assign(
            new Error('No active admin user in target tenant.'),
            { statusCode: 404 }
        );
    }

    const token = generateAccessToken({
        userId: adminUser.id,
        tenantId,
        role: adminUser.role,
        email: adminUser.email,
        readOnly: true,
        impersonatedBy: adminUserId,
    });

    await logAdminAction(
        adminUserId,
        'IMPERSONATION_STARTED',
        tenantId,
        { asUser: adminUser.email },
        ipAddress
    );

    return {
        token,
        expiresIn: '15m',
        tenant: tenant.name,
        asUser: adminUser.email,
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
