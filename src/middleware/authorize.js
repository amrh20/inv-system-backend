/**
 * M01 — Role-Based Authorization Middleware
 * Usage: authorize('ADMIN', 'COST_CONTROL')  →  only those roles can proceed
 */
const authorize = (...roles) => {
    return (req, res, next) => {
        if (!req.user) {
            return res.status(401).json({ success: false, message: 'Authentication required.' });
        }

        const normalizedRoles = roles.map(r => r.toUpperCase());
        const userRole = req.user.role.toUpperCase();
        const canActAsAdmin = userRole === 'ORG_MANAGER' && normalizedRoles.includes('ADMIN');

        if (!normalizedRoles.includes(userRole) && !canActAsAdmin) {
            return res.status(403).json({
                success: false,
                message: `Access denied. Required role(s): ${roles.join(', ')}. Your role: ${req.user.role}`,
            });
        }

        next();
    };
};

/**
 * Permission matrix — defines what each role can do
 * Used for fine-grained checks beyond simple role matching
 */
const PERMISSIONS = {
    // Master data
    MANAGE_MASTER_DATA: ['ADMIN'],
    VIEW_MASTER_DATA: ['ADMIN', 'STOREKEEPER', 'DEPT_MANAGER', 'COST_CONTROL', 'FINANCE_MANAGER', 'AUDITOR'],

    // Generic inventory read/write (used by M08, M10)
    MANAGE_INVENTORY: ['ADMIN', 'STOREKEEPER', 'DEPT_MANAGER'],
    VIEW_INVENTORY: ['ADMIN', 'STOREKEEPER', 'DEPT_MANAGER', 'COST_CONTROL', 'FINANCE_MANAGER', 'AUDITOR'],

    // Movements (no approval)
    CREATE_MOVEMENT: ['ADMIN', 'STOREKEEPER'],
    CREATE_ISSUE: ['ADMIN', 'STOREKEEPER', 'DEPT_MANAGER'],
    VIEW_MOVEMENTS: ['ADMIN', 'STOREKEEPER', 'DEPT_MANAGER', 'COST_CONTROL', 'FINANCE_MANAGER', 'AUDITOR'],

    // Controlled movements
    CREATE_BREAKAGE: ['ADMIN', 'STOREKEEPER', 'DEPT_MANAGER'],
    CREATE_ADJUSTMENT: ['ADMIN', 'STOREKEEPER'],

    // Approvals — any of the 3 approver roles + ADMIN can call approve/reject
    APPROVE_BREAKAGE: ['ADMIN', 'DEPT_MANAGER', 'COST_CONTROL', 'FINANCE_MANAGER'],

    // Stock count
    MANAGE_COUNT: ['ADMIN', 'STOREKEEPER'],
    VIEW_COUNT: ['ADMIN', 'STOREKEEPER', 'COST_CONTROL', 'FINANCE_MANAGER', 'AUDITOR'],

    // Reports
    VIEW_REPORTS: ['ADMIN', 'STOREKEEPER', 'DEPT_MANAGER', 'COST_CONTROL', 'FINANCE_MANAGER', 'AUDITOR'],
    EXPORT_REPORTS: ['ADMIN', 'STOREKEEPER', 'COST_CONTROL', 'FINANCE_MANAGER', 'AUDITOR'],

    // Admin only
    MANAGE_USERS: ['ADMIN'],
    MANAGE_SETTINGS: ['ADMIN'],
    VIEW_AUDIT_LOG: ['ADMIN', 'AUDITOR', 'FINANCE_MANAGER', 'SECURITY_MANAGER'],
    MANAGE_IMPORTS: ['ADMIN', 'STOREKEEPER'],

    // Get Pass (Asset Loans) — approval workflow
    CREATE_GET_PASS: ['ADMIN', 'STOREKEEPER'],
    VIEW_GET_PASS: ['ADMIN', 'STOREKEEPER', 'SECURITY_MANAGER', 'FINANCE_MANAGER', 'AUDITOR'],
    APPROVE_GET_PASS_EXIT:   ['SECURITY_MANAGER', 'ADMIN'],   // last approval before items leave
    APPROVE_GET_PASS_RETURN: ['SECURITY_MANAGER', 'ADMIN'],   // first to confirm items arrived back
    REGISTER_GET_PASS_RETURN: ['ADMIN', 'STOREKEEPER'],       // store mgr registers the physical return
};

/**
 * Check a specific permission
 * Usage: hasPermission(req.user.role, 'CREATE_MOVEMENT')
 */
const hasPermission = (role, permission) => {
    return PERMISSIONS[permission]?.includes(role) ?? false;
};

/**
 * Middleware: check specific permission key
 * Usage: requirePermission('MANAGE_MASTER_DATA')
 */
const requirePermission = (permission) => {
    return (req, res, next) => {
        if (!req.user || !hasPermission(req.user.role, permission)) {
            return res.status(403).json({
                success: false,
                message: `Access denied. Insufficient permissions.`,
                required: permission,
            });
        }
        next();
    };
};

module.exports = { authorize, hasPermission, requirePermission, PERMISSIONS };
