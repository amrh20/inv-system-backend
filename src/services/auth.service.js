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
    role: membership.role,
    isSuperAdmin: membership.tenantId === null,
});

const buildAccountInactiveError = () => Object.assign(
    new Error('Your account has been deactivated by the admin.'),
    {
        statusCode: 401,
        code: 'ACCOUNT_INACTIVE',
    }
);

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

    const activeMemberships = memberships.filter((membership) => membership.isActive);

    if (activeMemberships.length > 1 && !tenantSlug) {
        console.log('DEBUG: Triggering Tenant Selection Response');
        return {
            success: true,
            requiresTenantSelection: true,
            data: {
                memberships: activeMemberships.map(formatMembershipOption),
            },
        };
    }

    if (activeMemberships.length === 0) {
        if (memberships.length > 0) {
            throw buildAccountInactiveError();
        }
        throw Object.assign(new Error('No active tenant membership found for this user.'), { statusCode: 403 });
    }

    const normalizedTenantSlug = typeof tenantSlug === 'string' ? tenantSlug.trim() : '';

    if (normalizedTenantSlug) {
        const selectedMembership = memberships.find((membership) => membership.tenant?.slug === normalizedTenantSlug);
        if (!selectedMembership) {
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

    if (activeMemberships.length === 1) {
        const selected = activeMemberships[0];
        const result = await issueSessionForMembership({ user, membership: selected, ipAddress, userAgent });
        logger.info(`User logged in: ${user.email} [tenant: ${selected.tenant?.slug || 'super-admin'}]`);
        return result;
    }

    return {
        success: true,
        requiresTenantSelection: true,
        data: {
            memberships: activeMemberships.map(formatMembershipOption),
        },
    };
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

    const membership = await prisma.tenantMember.findFirst({
        where: {
            userId,
            tenant: { is: { slug: normalizedTenantSlug, isActive: true } },
        },
        include: {
            tenant: { select: { id: true, slug: true, name: true } },
        },
    });
    if (!membership) {
        throw Object.assign(new Error('You are not authorized for this tenant.'), { statusCode: 403 });
    }
    if (!membership.isActive) {
        throw buildAccountInactiveError();
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
