const express = require('express');
const tenantController = require('../controllers/tenant.controller');
const { authenticate } = require('../middleware/authenticate');
const { authorize } = require('../middleware/authorize');

const router = express.Router();

// Tenant listing/creation supports hierarchy roles.
router.use(authenticate);
router.use(authorize('SUPER_ADMIN', 'ORG_MANAGER', 'ADMIN'));

// GET /api/admin/tenants
router.get('/', tenantController.listTenants);

// POST /api/admin/tenants
router.post('/', tenantController.createTenant);

// GET /api/admin/tenants/:id
router.get('/:id', tenantController.getTenant);

// PUT /api/admin/tenants/:id
router.put('/:id', tenantController.updateTenant);

// PATCH /api/admin/tenants/:id/toggle
router.patch('/:id/toggle', tenantController.toggleTenant);

module.exports = router;
