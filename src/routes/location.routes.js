const express = require('express');
const router = express.Router();
const locationController = require('../controllers/location.controller');
const { authenticate: protect } = require('../middleware/authenticate');
const { authorize } = require('../middleware/authorize');

router.use(protect);

router
    .route('/')
    .post(authorize('superadmin', 'admin', 'inventory_manager'), locationController.createLocation)
    .get(locationController.getLocations);

router
    .route('/:id')
    .get(locationController.getLocation)
    .put(authorize('superadmin', 'admin', 'inventory_manager'), locationController.updateLocation)
    .delete(authorize('superadmin', 'admin'), locationController.deleteLocation);

router
    .route('/:id/users')
    .post(authorize('superadmin', 'admin', 'inventory_manager'), locationController.assignUser);

router
    .route('/:id/users/:userId')
    .delete(authorize('superadmin', 'admin', 'inventory_manager'), locationController.removeUser);

// ── Location ↔ Category associations ─────────────────────────────────────────
router
    .route('/:id/categories')
    .get(locationController.getLocationCategories)
    .put(authorize('superadmin', 'admin', 'inventory_manager'), locationController.setLocationCategories);

module.exports = router;
