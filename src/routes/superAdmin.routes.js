const express = require('express');
const router = express.Router();
const { authenticate } = require('../middleware/authenticate');
const { requireSuperAdmin } = require('../middleware/requireSuperAdmin');
const ctrl = require('../controllers/superAdmin.controller');

// ─── All Super Admin routes require JWT + SUPER_ADMIN role ───────────────────
router.use(authenticate, requireSuperAdmin);

// ─── Tenant Management ────────────────────────────────────────────────────────
router.get('/tenants', ctrl.listTenants);
router.post('/tenants', ctrl.createTenant);
router.get('/tenants/:id', ctrl.getTenant);
router.put('/tenants/:id', ctrl.updateTenant);
router.post('/tenants/:id/activate', ctrl.activateTenant);
router.post('/tenants/:id/suspend', ctrl.suspendTenant);
router.put('/tenants/:id/subscription', ctrl.setSubscription);
router.post('/tenants/:id/force-logout', ctrl.forceLogout);
router.post('/tenants/:id/impersonate', ctrl.impersonate);

// ─── Admin Audit Logs ─────────────────────────────────────────────────────────
router.get('/logs', ctrl.getAdminLogs);

module.exports = router;
