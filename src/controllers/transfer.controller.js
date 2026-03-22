'use strict';

const svc = require('../services/transfer.service');
const MANAGER_ROLES = ['DEPT_MANAGER', 'FINANCE_MANAGER', 'ADMIN'];
const STOREKEEPER_ROLES = ['STOREKEEPER', 'FINANCE_MANAGER', 'COST_CONTROL', 'ADMIN'];

const ok = (res, data, status = 200) => res.status(status).json({ success: true, data });
const err = (res, e) => res.status(e.status || e.statusCode || 500).json({ success: false, message: e.message, details: e.details });
const assertManager = (req) => { if (!MANAGER_ROLES.includes(req.user?.role)) throw Object.assign(new Error('Manager role required'), { status: 403 }); };
const assertStorekeeper = (req) => { if (!STOREKEEPER_ROLES.includes(req.user?.role)) throw Object.assign(new Error('Storekeeper role required'), { status: 403 }); };

const createTransfer = async (req, res) => { try { ok(res, await svc.createTransfer({ tenantId: req.user.tenantId, userId: req.user.id, ...req.body }), 201); } catch (e) { err(res, e); } };
const listTransfers = async (req, res) => { try { ok(res, await svc.listTransfers(req.user.tenantId, { ...req.query, page: +req.query.page || 1, limit: +req.query.limit || 20 })); } catch (e) { err(res, e); } };
const getTransfer = async (req, res) => { try { ok(res, await svc.getTransfer(req.params.id, req.user.tenantId)); } catch (e) { err(res, e); } };
const updateTransfer = async (req, res) => { try { ok(res, await svc.updateTransfer(req.params.id, req.user.tenantId, req.body)); } catch (e) { err(res, e); } };
const deleteTransfer = async (req, res) => { try { await svc.deleteTransfer(req.params.id, req.user.tenantId); res.json({ success: true, message: 'Transfer deleted.' }); } catch (e) { err(res, e); } };

const submitTransfer = async (req, res) => { try { ok(res, await svc.submitTransfer(req.params.id, req.user.tenantId)); } catch (e) { err(res, e); } };
const approveTransfer = async (req, res) => { try { assertManager(req); ok(res, await svc.approveTransfer(req.params.id, req.user.tenantId, req.user.id)); } catch (e) { err(res, e); } };
const rejectTransfer = async (req, res) => { try { assertManager(req); ok(res, await svc.rejectTransfer(req.params.id, req.user.tenantId, req.user.id, req.body.reason)); } catch (e) { err(res, e); } };
const dispatchTransfer = async (req, res) => { try { assertStorekeeper(req); ok(res, await svc.dispatchTransfer(req.params.id, req.user.tenantId, req.user.id)); } catch (e) { err(res, e); } };
const receiveTransfer = async (req, res) => { try { assertStorekeeper(req); ok(res, await svc.receiveTransfer(req.params.id, req.user.tenantId, req.user.id, req.body.receivedLines)); } catch (e) { err(res, e); } };

module.exports = {
    createTransfer, listTransfers, getTransfer, updateTransfer, deleteTransfer,
    submitTransfer, approveTransfer, rejectTransfer, dispatchTransfer, receiveTransfer,
};
