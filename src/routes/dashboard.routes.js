const express = require('express');
const router = express.Router();
const { authenticate } = require('../middleware/authenticate');
const ctrl = require('../controllers/dashboard.controller');

router.use(authenticate);

router.get('/summary', ctrl.getSummary);
router.get('/charts', ctrl.getCharts);

module.exports = router;
