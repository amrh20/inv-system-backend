const prisma = require('../config/database');
const { hashPassword, comparePassword } = require('../utils/password');
const { generateAccessToken, generateRefreshToken, verifyRefreshToken, getRefreshTokenExpiry } = require('../utils/jwt');
const logger = require('../utils/logger');

/**
 * M01 — Auth Service
 */

const formatMembershipOption = (membership) => ({
    tenantId: membership.tenantId,
    tenantSlug: membership.tenant?.slug || null,
    tenantName: membership.tenant?.name || null,
    parentId: membership.tenant?.parentId || null,
    role: membership.role,
    isInherited: Boolean(membership.isInherited),
    isSuperAdmin: membership.tenantId === null,
});

const buildAccountInactiveError = () => Object.assign(
    new Error('Your account has been deactivated by the admin.'),
    {
        statusCode: 401,
        code: 'ACCOUNT_INACTIVE',
    }
);

const buildInheritedOrgManagerMemberships = async (activeMemberships) => {
    const mergedMemberships = activeMemberships.map((membership) => ({ ...membership }));
    const parentOrgMemberships = activeMemberships.filter(
        (membership) => membership.role === 'ORG_MANAGER' && membership.tenant?.parentId === null && membership.tenantId
    );

    if (parentOrgMemberships.length === 0) return mergedMemberships;

    const parentOrgIds = [...new Set(parentOrgMemberships.map((membership) => membership.tenantId))];

    for (const orgId of parentOrgIds) {
        // CRITICAL: must be strictly scoped to the specific parent org.
        const children = await prisma.tenant.findMany({
            where: {
                parentId: orgId,
                isActive: true,
            },
            select: {
                id: true,
                name: true,
                slug: true,
                parentId: true,
                isActive: true,
            },
        });

        for (const child of children) {
            const existingIndex = mergedMemberships.findIndex((membership) => membership.tenantId === child.id);
            if (existingIndex >= 0) {
                mergedMemberships[existingIndex] = {
                    ...mergedMemberships[existingIndex],
                    role: 'ORG_MANAGER',
                    tenant: { ...(mergedMemberships[existingIndex].tenant || {}), ...child },
                    isInherited: true,
                    isActive: true,
                };
                continue;
            }

            mergedMemberships.push({
                tenantId: child.id,
                role: 'ORG_MANAGER',
                tenant: child,
                isActive: true,
                isInherited: true,
            });
        }
    }

    return mergedMemberships;
};

const issueSessionForMembership = async ({
    user,
    membership,
    ipAddress,
    userAgent,
}) => {
    const tokenPayload = {
        userId: user.id,
        tenantId: membership.tenantId,
        role: membership.role,
        email: user.email,
    };
    const accessToken = generateAccessToken(tokenPayload);
    const refreshToken = generateRefreshToken(tokenPayload);

    await prisma.refreshToken.create({
        data: {
            userId: user.id,
            token: refreshToken,
            expiresAt: getRefreshTokenExpiry(),
            ipAddress,
            userAgent,
        },
    });

    await prisma.user.update({
        where: { id: user.id },
        data: { lastLoginAt: new Date() },
    });

    return {
        accessToken,
        refreshToken,
        user: {
            id: user.id,
            email: user.email,
            firstName: user.firstName,
            lastName: user.lastName,
            role: membership.role,
            department: user.department,
            tenantId: membership.tenantId,
            tenantName: membership.tenant?.name || null,
        },
    };
};

/**
 * Login: verify credentials, then either issue session or return tenant choices
 */
const login = async ({ email, password, tenantSlug, ipAddress, userAgent }) => {
    const normalizedEmail = email.toLowerCase();
    const user = await prisma.user.findUnique({
        where: { email: normalizedEmail },
    });

    if (!user || !user.isActive) {
        throw Object.assign(new Error('Invalid credentials.'), { statusCode: 401 });
    }

    const passwordValid = await comparePassword(password, user.passwordHash);
    if (!passwordValid) {
        throw Object.assign(new Error('Invalid credentials.'), { statusCode: 401 });
    }

    const memberships = await prisma.tenantMember.findMany({
        where: { userId: user.id },
        include: { tenant: true },
    });

    console.log('DEBUG: Found memberships count:', memberships.length);
    console.log('DEBUG: Memberships IDs:', memberships.map((m) => m.tenantId));
    console.log('DEBUG: Provided tenantSlug:', tenantSlug);

    let activeMemberships = memberships.filter((membership) => membership.isActive);

    // Strict Membership Guard at login-time:
    // If user is an ORG_MANAGER of any root org, they must only see that org (or orgs)
    // and its direct children — even if legacy "stray" memberships exist in DB.
    const rootOrgManagerOrgIds = [
        ...new Set(
            activeMemberships
                .filter(
                    (m) =>
                        m.role === 'ORG_MANAGER' &&
                        m.tenantId &&
                        m.tenant &&
                        m.tenant.parentId === null
                )
                .map((m) => m.tenantId)
        ),
    ];

    if (rootOrgManagerOrgIds.length > 0) {
        activeMemberships = activeMemberships.filter((m) => {
            // Keep super-admin context untouched (tenantId null), if it exists.
            if (!m.tenantId) return true;
            if (!m.tenant) return false;

            // Keep membership if it's the root org itself OR a direct child of that org.
            return (
                rootOrgManagerOrgIds.includes(m.tenantId) ||
                (m.tenant.parentId && rootOrgManagerOrgIds.includes(m.tenant.parentId))
            );
        });
    }

    const inheritedOrMergedMemberships = await buildInheritedOrgManagerMemberships(activeMemberships);
    const activeMembershipsWithInheritance = inheritedOrMergedMemberships.length > 0
        ? inheritedOrMergedMemberships
        : activeMemberships;

    const normalizedTenantSlug = typeof tenantSlug === 'string' ? tenantSlug.trim() : '';
    const totalMemberships = activeMembershipsWithInheritance.length;

    if (totalMemberships > 1 && !normalizedTenantSlug) {
        console.log('DEBUG: Triggering Tenant Selection Response');
        return {
            success: true,
            requiresTenantSelection: true,
            data: {
                memberships: activeMembershipsWithInheritance.map(formatMembershipOption),
            },
        };
    }

    if (activeMemberships.length === 0) {
        if (memberships.length > 0) {
            throw buildAccountInactiveError();
        }
        throw Object.assign(new Error('No active tenant membership found for this user.'), { statusCode: 403 });
    }

    if (normalizedTenantSlug) {
        const selectedMembership = activeMembershipsWithInheritance
            .find((membership) => membership.tenant?.slug === normalizedTenantSlug);
        if (!selectedMembership) {
            const inactiveDirectMembership = memberships.find(
                (membership) => membership.tenant?.slug === normalizedTenantSlug && !membership.isActive
            );
            if (inactiveDirectMembership) {
                throw buildAccountInactiveError();
            }
            throw Object.assign(new Error('You are not authorized for this tenant.'), { statusCode: 403 });
        }
        if (!selectedMembership.isActive) {
            throw buildAccountInactiveError();
        }

        const result = await issueSessionForMembership({
            user,
            membership: selectedMembership,
            ipAddress,
            userAgent,
        });
        logger.info(`User logged in: ${user.email} [tenant: ${normalizedTenantSlug}]`);
        return result;
    }

    if (totalMemberships === 1) {
        const selected = activeMembershipsWithInheritance[0];
        const result = await issueSessionForMembership({ user, membership: selected, ipAddress, userAgent });
        logger.info(`User logged in: ${user.email} [tenant: ${selected.tenant?.slug || 'super-admin'}]`);
        return result;
    }

    if (totalMemberships > 1) {
        return {
            success: true,
            requiresTenantSelection: true,
            data: {
                memberships: activeMembershipsWithInheritance.map(formatMembershipOption),
            },
        };
    }

    throw Object.assign(new Error('No active tenant membership found for this user.'), { statusCode: 403 });
};

/**
 * Refresh: validate stored refresh token, issue new access token
 */
const refresh = async (refreshToken) => {
    let decoded;
    try {
        decoded = verifyRefreshToken(refreshToken);
    } catch {
        throw Object.assign(new Error('Invalid or expired refresh token.'), { statusCode: 401 });
    }

    // Ensure token exists in DB and is not revoked
    const storedToken = await prisma.refreshToken.findUnique({
        where: { token: refreshToken },
        include: { user: true },
    });

    if (!storedToken || storedToken.revokedAt || storedToken.expiresAt < new Date()) {
        throw Object.assign(new Error('Refresh token is invalid or has been revoked.'), { statusCode: 401 });
    }

    const { user } = storedToken;

    let membership;
    if (decoded.tenantId) {
        membership = await prisma.tenantMember.findFirst({
            where: {
                userId: user.id,
                tenantId: decoded.tenantId,
                isActive: true,
                tenant: { is: { isActive: true } },
            },
            include: { tenant: { select: { id: true } } },
        });

        if (!membership) {
            const targetTenant = await prisma.tenant.findUnique({
                where: { id: decoded.tenantId },
                select: { id: true, parentId: true, isActive: true },
            });

            if (targetTenant?.isActive && targetTenant.parentId) {
                const parentOrgMembership = await prisma.tenantMember.findFirst({
                    where: {
                        userId: user.id,
                        tenantId: targetTenant.parentId,
                        role: 'ORG_MANAGER',
                        isActive: true,
                        tenant: { is: { isActive: true, parentId: null } },
                    },
                    select: { role: true },
                });

                if (parentOrgMembership) {
                    membership = {
                        tenantId: targetTenant.id,
                        role: 'ORG_MANAGER',
                        tenant: { id: targetTenant.id },
                    };
                }
            }
        }
    } else {
        membership = await prisma.tenantMember.findFirst({
            where: {
                userId: user.id,
                tenantId: null,
                role: 'SUPER_ADMIN',
                isActive: true,
            },
        });
    }

    if (!membership) {
        throw Object.assign(new Error('Refresh token context is no longer valid.'), { statusCode: 401 });
    }

    const newAccessToken = generateAccessToken({
        userId: user.id,
        tenantId: membership.tenantId,
        role: membership.role,
        email: user.email,
    });

    return { accessToken: newAccessToken };
};

/**
 * Logout: revoke the stored refresh token
 */
const logout = async (refreshToken) => {
    if (!refreshToken) return;

    await prisma.refreshToken.updateMany({
        where: { token: refreshToken, revokedAt: null },
        data: { revokedAt: new Date() },
    });
};

/**
 * Me: return current user profile
 */
const getMe = async (userId, tenantId) => {
    const user = await prisma.user.findUnique({
        where: { id: userId },
        select: {
            id: true,
            email: true,
            firstName: true,
            lastName: true,
            department: true,
            phone: true,
            isActive: true,
            lastLoginAt: true,
            createdAt: true,
        },
    });
    if (!user) {
        throw Object.assign(new Error('User not found.'), { statusCode: 404 });
    }

    const membership = await prisma.tenantMember.findFirst({
        where: {
            userId,
            tenantId: tenantId || null,
            isActive: true,
        },
        include: {
            tenant: { select: { id: true, name: true, slug: true, logoUrl: true } },
        },
    });
    if (!membership) {
        throw Object.assign(new Error('Membership not found for this context.'), { statusCode: 404 });
    }

    return {
        ...user,
        role: membership.role,
        tenant: membership.tenant || null,
    };
};

/**
 * Switch tenant context for an authenticated user
 */
const switchTenant = async ({ userId, tenantSlug, ipAddress, userAgent }) => {
    const normalizedTenantSlug = typeof tenantSlug === 'string' ? tenantSlug.trim() : '';
    if (!normalizedTenantSlug) {
        throw Object.assign(new Error('tenantSlug is required.'), { statusCode: 400 });
    }

    const user = await prisma.user.findUnique({
        where: { id: userId },
        select: {
            id: true,
            email: true,
            firstName: true,
            lastName: true,
            department: true,
            isActive: true,
        },
    });
    if (!user || !user.isActive) {
        throw Object.assign(new Error('User not found or inactive.'), { statusCode: 401 });
    }

    const targetTenant = await prisma.tenant.findFirst({
        where: {
            slug: normalizedTenantSlug,
            isActive: true,
        },
        select: { id: true, slug: true, name: true, parentId: true },
    });

    if (!targetTenant) {
        throw Object.assign(new Error('You are not authorized for this tenant.'), { statusCode: 403 });
    }

    // Strict switch guard:
    // If user is an ORG_MANAGER of any root org, they may only switch to that org
    // or its direct children, even if legacy direct memberships exist elsewhere.
    const rootOrgManagerOrgMemberships = await prisma.tenantMember.findMany({
        where: {
            userId,
            role: 'ORG_MANAGER',
            isActive: true,
            tenantId: { not: null },
            tenant: { is: { parentId: null, isActive: true } },
        },
        select: { tenantId: true },
        distinct: ['tenantId'],
    });

    const rootOrgIds = rootOrgManagerOrgMemberships.map((m) => m.tenantId).filter(Boolean);
    if (rootOrgIds.length > 0) {
        const allowed =
            rootOrgIds.includes(targetTenant.id) ||
            (targetTenant.parentId && rootOrgIds.includes(targetTenant.parentId));

        if (!allowed) {
            throw Object.assign(new Error('You are not authorized for this tenant.'), { statusCode: 403 });
        }
    }

    const directMembership = await prisma.tenantMember.findFirst({
        where: { userId, tenantId: targetTenant.id },
        include: {
            tenant: { select: { id: true, slug: true, name: true, parentId: true } },
        },
    });

    if (directMembership && !directMembership.isActive) {
        throw buildAccountInactiveError();
    }

    let membership = directMembership;
    let inheritedOrgManagerAccess = false;

    if (targetTenant.parentId) {
        const parentOrgMembership = await prisma.tenantMember.findFirst({
            where: {
                userId,
                tenantId: targetTenant.parentId,
                role: 'ORG_MANAGER',
                isActive: true,
                tenant: { is: { isActive: true, parentId: null } },
            },
            select: { role: true },
        });

        if (parentOrgMembership) {
            inheritedOrgManagerAccess = true;
            membership = {
                tenantId: targetTenant.id,
                role: 'ORG_MANAGER',
                tenant: targetTenant,
                isActive: true,
                isInherited: true,
            };
        }
    }

    if (!membership) {
        throw Object.assign(new Error('You are not authorized for this tenant.'), { statusCode: 403 });
    }

    if (inheritedOrgManagerAccess) {
        membership = {
            ...membership,
            role: 'ORG_MANAGER',
            tenant: membership.tenant || targetTenant,
            isInherited: true,
            isActive: true,
        };
    }

    const result = await issueSessionForMembership({
        user,
        membership,
        ipAddress,
        userAgent,
    });

    logger.info(`User switched tenant: ${user.email} [tenant: ${normalizedTenantSlug}]`);
    return result;
};

module.exports = { login, refresh, logout, getMe, switchTenant };
