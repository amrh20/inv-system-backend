const express = require('express');
const router = express.Router();
const ctrl = require('../controllers/department.controller');
const { authenticate } = require('../middleware/authenticate');
const { authorize } = require('../middleware/authorize');

router.use(authenticate);

router.route('/')
    .post(authorize('superadmin', 'admin'), ctrl.createDepartment)
    .get(ctrl.getDepartments);

router.route('/:id')
    .get(ctrl.getDepartment)
    .put(authorize('superadmin', 'admin'), ctrl.updateDepartment)
    .delete(authorize('superadmin', 'admin'), ctrl.deleteDepartment);

router.patch('/:id/toggle', authorize('superadmin', 'admin'), ctrl.toggleDepartment);

module.exports = router;
