const express = require('express');
const usersController = require('../controllers/users.controller');
const { authenticate } = require('../middleware/authenticate');
const { authorize } = require('../middleware/authorize');
const {
    createUserValidator,
    updateUserValidator,
    updateRoleValidator,
    paginationValidator,
    searchExistingUsersValidator,
} = require('../utils/validators');

const router = express.Router();

// All users routes require authentication
router.use(authenticate);

// GET /api/users  — Admin only
router.get('/', authorize('ADMIN'), paginationValidator, usersController.listUsers);

// GET /api/users/search-existing  — Admin only
router.get('/search-existing', authorize('ADMIN'), searchExistingUsersValidator, usersController.searchExistingUsers);

// GET /api/users/:id  — Admin only
router.get('/:id', authorize('ADMIN'), usersController.getUser);

// POST /api/users  — Admin only
router.post('/', authorize('ADMIN'), createUserValidator, usersController.createUser);

// PUT /api/users/:id  — Admin or self (controller enforces self-edit limits)
router.put('/:id', authorize('ADMIN'), updateUserValidator, usersController.updateUser);

// PUT /api/users/:id/role  — Admin only
router.put('/:id/role', authorize('ADMIN'), updateRoleValidator, usersController.updateUserRole);

module.exports = router;
