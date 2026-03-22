const express = require('express');
const router = express.Router();
const unitController = require('../controllers/unit.controller');
const { authenticate: protect } = require('../middleware/authenticate');
const { authorize } = require('../middleware/authorize');

router.use(protect);

router
    .route('/')
    .post(authorize('superadmin', 'admin', 'inventory_manager'), unitController.createUnit)
    .get(unitController.getUnits);

router
    .route('/:id')
    .get(unitController.getUnit)
    .put(authorize('superadmin', 'admin', 'inventory_manager'), unitController.updateUnit);

module.exports = router;
