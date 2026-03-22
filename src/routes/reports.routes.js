const express = require('express');
const router = express.Router();
const reportController = require('../controllers/report.controller');
const summaryReportController = require('../controllers/summaryReport.controller');
const { authenticate: protect } = require('../middleware/authenticate');

router.use(protect);

// New: Summary Inventory Report
router.get('/summary-inventory', summaryReportController.getSummary);

// Valuation Report — As-of-Date
router.get('/valuation', reportController.getValuationReport);

router.post('/generate', reportController.generateReport);
router.get('/history', reportController.getHistory);
router.get('/:id', reportController.getReportById);
router.get('/:id/pdf', reportController.exportPdf);
router.get('/:id/excel', reportController.exportExcel);

module.exports = router;
