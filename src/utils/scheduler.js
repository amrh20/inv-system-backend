const cron = require('node-cron');
const { PrismaClient } = require('@prisma/client');
const notificationService = require('../services/notification.service');
const emailService = require('../services/email.service');
const winston = require('winston');

const prisma = new PrismaClient();
const logger = winston.createLogger({
    level: 'info',
    format: winston.format.combine(
        winston.format.timestamp(),
        winston.format.json()
    ),
    transports: [new winston.transports.Console()],
});

// Run every day at 8:00 AM
cron.schedule('0 8 * * *', async () => {
    logger.info('[CRON] Starting Daily Stock Alert check...');
    try {
        // Find all active tenants
        const tenants = await prisma.user.findMany({
            where: { role: 'ADMIN', isActive: true },
            select: { tenantId: true, email: true },
            distinct: ['tenantId']
        });

        for (const admin of tenants) {
            const tenantId = admin.tenantId;
            const alerts = await notificationService.getLowStockAlerts(tenantId);
            const criticalAlerts = alerts.filter(a => a.severity === 'critical');

            if (criticalAlerts.length > 0) {
                logger.info(`[CRON] Found ${criticalAlerts.length} critical alerts for tenant ${tenantId}. Sending email...`);
                // For a more robust solution, you'd aggregate all admins/purchasing managers for the tenant
                await emailService.sendCriticalStockAlert(criticalAlerts, admin.email);
            }
        }
    } catch (error) {
        logger.error('[CRON] Failed to run Daily Stock Alert check', error);
    }
});

logger.info('[CRON] Scheduler initialized.');
