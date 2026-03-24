const { body, query, param, validationResult } = require('express-validator');

/**
 * Validate and extract errors from express-validator results
 */
const validate = (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        return res.status(400).json({
            success: false,
            message: 'Validation failed.',
            errors: errors.array().map((e) => ({ field: e.path, message: e.msg })),
        });
    }
    next();
};

// ─── Auth Validators ───────────────────────────────────────────────────────
const loginValidator = [
    body('email').isEmail().normalizeEmail().withMessage('Valid email required.'),
    body('password').notEmpty().withMessage('Password is required.'),
    body('tenantSlug').optional().trim(), // Optional — SUPER_ADMIN logs in without a tenant
    validate,
];

const refreshValidator = [
    body('refreshToken').notEmpty().withMessage('Refresh token is required.'),
    validate,
];

// ─── User Validators ───────────────────────────────────────────────────────
const createUserValidator = [
    body('email').isEmail().normalizeEmail().withMessage('Valid email required.'),
    body('password').optional().isLength({ min: 8 }).withMessage('Password must be at least 8 characters.'),
    body('firstName').optional().notEmpty().trim(),
    body('lastName').optional().notEmpty().trim(),
    body('role')
        .isIn(['ADMIN', 'STOREKEEPER', 'DEPT_MANAGER', 'COST_CONTROL', 'FINANCE_MANAGER', 'AUDITOR'])
        .withMessage('Invalid role.'),
    body('departmentId').optional({ nullable: true }).isUUID().withMessage('departmentId must be a valid UUID.'),
    validate,
];

const updateUserValidator = [
    body('firstName').optional().notEmpty().trim(),
    body('lastName').optional().notEmpty().trim(),
    body('password').optional().isLength({ min: 8 }).withMessage('Password must be at least 8 characters.'),
    body('isActive').optional().isBoolean(),
    validate,
];

const updateRoleValidator = [
    body('role')
        .isIn(['ADMIN', 'STOREKEEPER', 'DEPT_MANAGER', 'COST_CONTROL', 'FINANCE_MANAGER', 'AUDITOR'])
        .withMessage('Invalid role.'),
    validate,
];

// ─── Pagination Validator ──────────────────────────────────────────────────
const paginationValidator = [
    query('page').optional().isInt({ min: 1 }).toInt(),
    query('limit').optional().isInt({ min: 1, max: 100 }).toInt(),
    validate,
];

const searchExistingUsersValidator = [
    query('email')
        .notEmpty()
        .withMessage('email query is required.')
        .bail()
        .isLength({ min: 2 })
        .withMessage('email query must be at least 2 characters.')
        .trim(),
    validate,
];

module.exports = {
    validate,
    loginValidator,
    refreshValidator,
    createUserValidator,
    updateUserValidator,
    updateRoleValidator,
    paginationValidator,
    searchExistingUsersValidator,
};
