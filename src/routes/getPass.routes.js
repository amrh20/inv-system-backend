const express = require('express');
const router = express.Router();
const getPassController = require('../controllers/getPass.controller');
const { authenticate: protect } = require('../middleware/authenticate');
const { authorize } = require('../middleware/authorize');

router.use(protect);
// Allow all roles involved in Get Pass workflow to access the base endpoints
router.use(authorize('ADMIN', 'STOREKEEPER', 'DEPT_MANAGER', 'FINANCE_MANAGER', 'SECURITY_MANAGER', 'AUDITOR', 'COST_CONTROL'));

// Basic CRUD
router.post('/', getPassController.createGetPass);
router.get('/', getPassController.getGetPasses);
router.get('/:id', getPassController.getGetPassById);
router.put('/:id', getPassController.updateGetPass);
router.delete('/:id', getPassController.deleteGetPass);
router.get('/:id/pdf', getPassController.exportPdf);

// Workflow Actions
router.post('/:id/submit', getPassController.submitGetPass);
router.post('/:id/approve', getPassController.approveGetPass);
router.post('/:id/checkout', getPassController.checkoutGetPass);
router.post('/:id/return', getPassController.returnGetPass);
router.post('/:id/close', getPassController.closeGetPass);

module.exports = router;
