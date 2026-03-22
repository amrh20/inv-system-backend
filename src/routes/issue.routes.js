'use strict';
const express = require('express');
const router = express.Router();
const { authenticate } = require('../middleware/authenticate');
const ctrl = require('../controllers/issue.controller');

router.use(authenticate);

router.post('/', ctrl.createIssue);   // STOREKEEPER guard in controller
router.get('/', ctrl.listIssues);
router.get('/:id', ctrl.getIssue);
router.patch('/:id', ctrl.updateIssue);   // DRAFT only
router.delete('/:id', ctrl.deleteIssue);   // DRAFT only
router.post('/:id/post', ctrl.postIssue);    // Atomic posting

module.exports = router;
