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

        const membership = await prisma.tenantMember.findFirst({
            where: {
                userId: decoded.userId,
                tenantId: decoded.tenantId || null,
            },
            select: { isActive: true },
        });

        if (membership && membership.isActive === false) {
            return res.status(401).json({
                error: 'ACCOUNT_INACTIVE',
                message: 'Your account has been deactivated by the admin.',
            });
        }

        req.user = {
            id: decoded.userId,
            tenantId: decoded.tenantId,
            role: decoded.role,
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
