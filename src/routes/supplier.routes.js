const express = require('express');
const router = express.Router();
const supplierController = require('../controllers/supplier.controller');
const { authenticate: protect } = require('../middleware/authenticate');
const { authorize } = require('../middleware/authorize');

router.use(protect);

router
    .route('/')
    .post(authorize('superadmin', 'admin', 'inventory_manager'), supplierController.createSupplier)
    .get(supplierController.getSuppliers);

router
    .route('/:id')
    .get(supplierController.getSupplier)
    .put(authorize('superadmin', 'admin', 'inventory_manager'), supplierController.updateSupplier);

router
    .route('/:id/status')
    .patch(authorize('superadmin', 'admin'), supplierController.toggleStatus);

module.exports = router;
