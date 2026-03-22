const express = require('express');
const router = express.Router();
const categoryController = require('../controllers/category.controller');
const { authenticate: protect } = require('../middleware/authenticate');
const { authorize } = require('../middleware/authorize');

// Apply protection to all category routes
router.use(protect);

// Categories
router
    .route('/')
    .post(authorize('superadmin', 'admin', 'inventory_manager'), categoryController.createCategory)
    .get(categoryController.getCategories);

router
    .route('/:id')
    .get(categoryController.getCategory)
    .put(authorize('superadmin', 'admin', 'inventory_manager'), categoryController.updateCategory)
    .delete(authorize('superadmin', 'admin'), categoryController.deleteCategory);

// Subcategories
router
    .route('/:categoryId/subcategories')
    .post(authorize('superadmin', 'admin', 'inventory_manager'), categoryController.createSubcategory);

router
    .route('/subcategories/:subcategoryId')
    .put(authorize('superadmin', 'admin', 'inventory_manager'), categoryController.updateSubcategory)
    .delete(authorize('superadmin', 'admin'), categoryController.deleteSubcategory);

module.exports = router;
