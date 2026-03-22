'use strict';
const express = require('express');
const router = express.Router();
const { authenticate } = require('../middleware/authenticate');
const ctrl = require('../controllers/transfer.controller');

router.use(authenticate);

router.post('/', ctrl.createTransfer);   // Create DRAFT
router.get('/', ctrl.listTransfers);
router.get('/:id', ctrl.getTransfer);
router.patch('/:id', ctrl.updateTransfer);    // DRAFT only → 423 otherwise
router.delete('/:id', ctrl.deleteTransfer);    // DRAFT only

// State machine
router.post('/:id/submit', ctrl.submitTransfer);
router.post('/:id/approve', ctrl.approveTransfer);    // Manager guard
router.post('/:id/reject', ctrl.rejectTransfer);     // Manager guard
router.post('/:id/dispatch', ctrl.dispatchTransfer);   // Storekeeper — APPROVED → IN_TRANSIT
router.post('/:id/receive', ctrl.receiveTransfer);    // Storekeeper — atomic dual-post

module.exports = router;
