'use strict';
const express = require('express');
const router = express.Router();
const { authenticate } = require('../middleware/authenticate');
const ctrl = require('../controllers/grn.controller');

router.use(authenticate);

// ── Excel Template & Import Preview (no file needed for template) ──
router.get('/template', ctrl.downloadTemplate);
router.post('/import/preview', ctrl.uploadExcel, ctrl.previewExcel);
router.post('/import/pdf-preview', ctrl.uploadPdf, ctrl.previewPdf);

// ── Create GRN (multipart: invoice file + JSON body) ──
router.post('/', ctrl.uploadInvoice, ctrl.createGrn);

// ── List & Detail ──
router.get('/', ctrl.listGrns);
router.get('/:id', ctrl.getGrn);

// ── State Machine ──
router.post('/:id/validate', ctrl.validateGrn);
router.post('/:id/submit', ctrl.submitGrn);
router.post('/:id/approve', ctrl.approveGrn);
router.post('/:id/reject', ctrl.rejectGrn);
router.post('/:id/post', ctrl.postGrn);

// ── Mutations ──
router.patch('/:id', ctrl.updateGrn);
router.delete('/:id', ctrl.deleteGrn);

module.exports = router;
