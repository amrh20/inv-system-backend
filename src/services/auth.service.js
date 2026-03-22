const prisma = require('../config/database');
const { hashPassword, comparePassword } = require('../utils/password');
const { generateAccessToken, generateRefreshToken, verifyRefreshToken, getRefreshTokenExpiry } = require('../utils/jwt');
const logger = require('../utils/logger');

/**
 * M01 — Auth Service
 */

/**
 * Login: verify credentials, issue tokens, store refresh token in DB
 */
const login = async ({ email, password, tenantSlug, ipAddress, userAgent }) => {

    // ── SUPER_ADMIN path: no tenant slug required ─────────────────────────────
    if (!tenantSlug) {
        const superUser = await prisma.user.findFirst({
            where: { email: email.toLowerCase(), role: 'SUPER_ADMIN' },
        });

        if (!superUser || !superUser.isActive) {
            throw Object.assign(new Error('Invalid credentials.'), { statusCode: 401 });
        }

        const passwordValid = await comparePassword(password, superUser.passwordHash);
        if (!passwordValid) {
            throw Object.assign(new Error('Invalid credentials.'), { statusCode: 401 });
        }

        const tokenPayload = {
            userId: superUser.id,
            tenantId: null,
            role: 'SUPER_ADMIN',
            email: superUser.email,
        };
        const accessToken = generateAccessToken(tokenPayload);
        const refreshToken = generateRefreshToken(tokenPayload);

        await prisma.refreshToken.create({
            data: {
                userId: superUser.id,
                token: refreshToken,
                expiresAt: getRefreshTokenExpiry(),
                ipAddress,
                userAgent,
            },
        });

        await prisma.user.update({
            where: { id: superUser.id },
            data: { lastLoginAt: new Date() },
        });

        logger.info(`SUPER_ADMIN logged in: ${superUser.email}`);

        return {
            accessToken,
            refreshToken,
            user: {
                id: superUser.id,
                email: superUser.email,
                firstName: superUser.firstName,
                lastName: superUser.lastName,
                role: 'SUPER_ADMIN',
                tenantId: null,
                tenantName: null,
            },
        };
    }

    // ── Regular tenant user path ──────────────────────────────────────────────
    const tenant = await prisma.tenant.findUnique({
        where: { slug: tenantSlug },
    });

    if (!tenant || !tenant.isActive) {
        throw Object.assign(new Error('Tenant not found or inactive.'), { statusCode: 401 });
    }

    // Find user within tenant
    const user = await prisma.user.findUnique({
        where: { tenantId_email: { tenantId: tenant.id, email: email.toLowerCase() } },
    });

    if (!user || !user.isActive) {
        throw Object.assign(new Error('Invalid credentials.'), { statusCode: 401 });
    }

    const passwordValid = await comparePassword(password, user.passwordHash);
    if (!passwordValid) {
        throw Object.assign(new Error('Invalid credentials.'), { statusCode: 401 });
    }

    // Generate tokens
    const tokenPayload = { userId: user.id, tenantId: tenant.id, role: user.role, email: user.email };
    const accessToken = generateAccessToken(tokenPayload);
    const refreshToken = generateRefreshToken(tokenPayload);

    // Store refresh token
    await prisma.refreshToken.create({
        data: {
            userId: user.id,
            token: refreshToken,
            expiresAt: getRefreshTokenExpiry(),
            ipAddress,
            userAgent,
        },
    });

    // Update last login
    await prisma.user.update({
        where: { id: user.id },
        data: { lastLoginAt: new Date() },
    });

    logger.info(`User logged in: ${user.email} [tenant: ${tenant.slug}]`);

    return {
        accessToken,
        refreshToken,
        user: {
            id: user.id,
            email: user.email,
            firstName: user.firstName,
            lastName: user.lastName,
            role: user.role,
            department: user.department,
            tenantId: tenant.id,
            tenantName: tenant.name,
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

    const newAccessToken = generateAccessToken({
        userId: user.id,
        tenantId: user.tenantId,
        role: user.role,
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
    const user = await prisma.user.findFirst({
        where: { id: userId, tenantId },
        select: {
            id: true,
            email: true,
            firstName: true,
            lastName: true,
            role: true,
            department: true,
            phone: true,
            isActive: true,
            lastLoginAt: true,
            createdAt: true,
            tenant: {
                select: { id: true, name: true, slug: true, logoUrl: true },
            },
        },
    });

    if (!user) {
        throw Object.assign(new Error('User not found.'), { statusCode: 404 });
    }

    return user;
};

module.exports = { login, refresh, logout, getMe };
