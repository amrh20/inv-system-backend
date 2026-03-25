const jwt = require('jsonwebtoken');
const prisma = require('../config/database');
const logger = require('../utils/logger');
const { enforcetenantScope } = require('./tenantScope');
const { enforceSubscription } = require('./subscription');

/**
 * M01 — Authentication Middleware (SaaS-enhanced)
 * 1) Verifies JWT access token and attaches user context to req.user
 * 2) Chains tenantScope validation
 * 3) Chains subscription enforcement
 */
const authenticate = async (req, res, next) => {
    const authHeader = req.headers.authorization;

    if (!authHeader || !authHeader.startsWith('Bearer ')) {
        return res.status(401).json({
            success: false,
            message: 'Authentication required. Please provide a valid token.',
        });
    }

    const token = authHeader.split(' ')[1];

    try {
        const decoded = jwt.verify(token, process.env.JWT_SECRET);

        let membership = await prisma.tenantMember.findFirst({
            where: {
                userId: decoded.userId,
                tenantId: decoded.tenantId || null,
            },
            select: { isActive: true, role: true, tenantId: true },
        });

        // If there is no direct membership for this tenant context, allow ORG_MANAGER
        // inheritance: parent org manager can access child hotels.
        if (!membership && decoded.tenantId) {
            const targetTenant = await prisma.tenant.findUnique({
                where: { id: decoded.tenantId },
                select: { id: true, parentId: true, isActive: true },
            });

            if (!targetTenant || !targetTenant.isActive) {
                return res.status(401).json({
                    success: false,
                    message: 'Invalid token context.',
                });
            }

            if (targetTenant.parentId) {
                const parentOrgMembership = await prisma.tenantMember.findFirst({
                    where: {
                        userId: decoded.userId,
                        tenantId: targetTenant.parentId,
                        role: 'ORG_MANAGER',
                        isActive: true,
                        tenant: { is: { isActive: true, parentId: null } },
                    },
                    select: { isActive: true, role: true, tenantId: true },
                });

                if (parentOrgMembership) {
                    membership = {
                        tenantId: targetTenant.id,
                        role: 'ORG_MANAGER',
                        isActive: true,
                        isInherited: true,
                    };
                }
            }

            if (!membership) {
                return res.status(401).json({
                    success: false,
                    message: 'Invalid token context.',
                });
            }
        }

        if (membership && membership.isActive === false) {
            return res.status(401).json({
                error: 'ACCOUNT_INACTIVE',
                message: 'Your account has been deactivated by the admin.',
            });
        }

        let scopedTenantId = decoded.tenantId;
        const isOrgManager = membership?.role === 'ORG_MANAGER';
        const requestedTenantIdHeader = typeof req.headers['x-tenant-id'] === 'string'
            ? req.headers['x-tenant-id'].trim()
            : '';

        if (isOrgManager && requestedTenantIdHeader && requestedTenantIdHeader !== decoded.tenantId) {
            const allowedTenant = await prisma.tenant.findFirst({
                where: {
                    id: requestedTenantIdHeader,
                    OR: [
                        { id: decoded.tenantId },
                        { parentId: decoded.tenantId },
                    ],
                },
                select: { id: true },
            });

            if (!allowedTenant) {
                return res.status(403).json({
                    success: false,
                    message: 'ORG_MANAGER can only scope requests to their organization or child hotels.',
                });
            }

            scopedTenantId = allowedTenant.id;
        }

        req.user = {
            id: decoded.userId,
            tenantId: scopedTenantId,
            role: membership?.role || decoded.role,
            email: decoded.email,
            readOnly: decoded.readOnly || false,
            impersonatedBy: decoded.impersonatedBy || null,
        };

        // Chain: authenticate → tenantScope → subscription → next
        enforcetenantScope(req, res, (err) => {
            if (err) return next(err);
            enforceSubscription(req, res, next);
        });
    } catch (err) {
        if (err.name === 'TokenExpiredError') {
            return res.status(401).json({
                success: false,
                message: 'Token expired. Please login again.',
                code: 'TOKEN_EXPIRED',
            });
        }
        logger.warn(`Invalid token attempt: ${err.message}`);
        return res.status(401).json({
            success: false,
            message: 'Invalid token.',
        });
    }
};

module.exports = { authenticate };
