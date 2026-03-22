const prisma = require('../config/database');
const { hashPassword } = require('../utils/password');

const listTenants = async (query = {}) => {
    const { page = 1, limit = 20, status, search } = query;
    const pageNum = Number(page) || 1;
    const limitNum = Number(limit) || 20;
    const skip = (pageNum - 1) * limitNum;

    const where = {};
    if (status) {
        where.subStatus = status;
    }
    if (search) {
        where.name = { contains: search, mode: 'insensitive' };
    }

    const [total, tenants] = await Promise.all([
        prisma.tenant.count({ where }),
        prisma.tenant.findMany({
            where,
            include: {
                _count: {
                    select: { users: true }
                }
            },
            orderBy: { createdAt: 'desc' },
            skip,
            take: limitNum,
        }),
    ]);

    return { tenants, total, page: pageNum, limit: limitNum };
};

const createTenant = async (data) => {
    // Check if slug or name exists
    const existing = await prisma.tenant.findFirst({
        where: {
            OR: [
                { name: data.name },
                { slug: data.slug }
            ]
        }
    });

    if (existing) {
        throw Object.assign(new Error('Tenant name or slug already exists.'), { statusCode: 400 });
    }

    // Hash the first admin's password
    const adminPasswordHash = await hashPassword(data.adminUser.password);

    // Create the tenant and its initial admin user in a transaction
    const result = await prisma.$transaction(async (tx) => {
        // 1. Create Tenant
        const newTenant = await tx.tenant.create({
            data: {
                name: data.name,
                slug: data.slug,
                planType: data.planType || 'BASIC',
                subStatus: data.subStatus || 'TRIAL',
                licenseStartDate: data.licenseStartDate ? new Date(data.licenseStartDate) : new Date(),
                licenseEndDate: data.licenseEndDate ? new Date(data.licenseEndDate) : null,
                maxUsers: Number(data.maxUsers) || 10,
                isActive: true
            }
        });

        // 2. Create the first Admin User
        await tx.user.create({
            data: {
                tenantId: newTenant.id,
                email: data.adminUser.email.toLowerCase(),
                passwordHash: adminPasswordHash,
                firstName: data.adminUser.firstName,
                lastName: data.adminUser.lastName,
                role: 'ADMIN',
                isActive: true
            }
        });

        return newTenant;
    });

    return result;
};

const updateTenantLicense = async (id, data) => {
    const tenant = await prisma.tenant.findUnique({ where: { id } });
    if (!tenant) throw Object.assign(new Error('Tenant not found.'), { statusCode: 404 });

    const updated = await prisma.tenant.update({
        where: { id },
        data: {
            planType: data.planType !== undefined ? data.planType : tenant.planType,
            subStatus: data.subStatus !== undefined ? data.subStatus : tenant.subStatus,
            maxUsers: data.maxUsers !== undefined ? Number(data.maxUsers) : tenant.maxUsers,
            licenseStartDate: data.licenseStartDate ? new Date(data.licenseStartDate) : tenant.licenseStartDate,
            licenseEndDate: data.licenseEndDate ? new Date(data.licenseEndDate) : tenant.licenseEndDate,
            isActive: data.isActive !== undefined ? data.isActive : tenant.isActive
        }
    });

    return updated;
};

const toggleTenantStatus = async (id) => {
    const tenant = await prisma.tenant.findUnique({ where: { id } });
    if (!tenant) throw Object.assign(new Error('Tenant not found.'), { statusCode: 404 });

    const updated = await prisma.tenant.update({
        where: { id },
        data: { isActive: !tenant.isActive }
    });

    return updated;
};

const getTenantById = async (id) => {
    const tenant = await prisma.tenant.findUnique({
        where: { id },
        include: { _count: { select: { users: true } } }
    });
    if (!tenant) throw Object.assign(new Error('Tenant not found.'), { statusCode: 404 });
    return tenant;
};

module.exports = {
    listTenants,
    createTenant,
    updateTenantLicense,
    toggleTenantStatus,
    getTenantById
};
