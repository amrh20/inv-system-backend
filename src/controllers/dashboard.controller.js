const dashboardService = require('../services/dashboard.service');

const getSummary = async (req, res, next) => {
    try {
        const start = Date.now();
        const data = await dashboardService.getDashboardSummary(req.user.tenantId);
        const responseTime = Date.now() - start;
        res.json({ success: true, data, meta: { responseTimeMs: responseTime } });
    } catch (e) { next(e); }
};

const getCharts = async (req, res, next) => {
    try {
        const data = await dashboardService.getChartData(req.user.tenantId);
        res.json({ success: true, data });
    } catch (e) { next(e); }
};

module.exports = { getSummary, getCharts };
