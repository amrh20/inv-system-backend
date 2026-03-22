const prisma = require('../config/database');
const { hashPassword } = require('../utils/password');

/**
 * M01 — User Management Service (Admin operations)
 */

const listUsers = async (tenantId, { page = 1, limit = 20, role, isActive, search } = {}) => {
    const pageNum = Number(page) || 1;
    const limitNum = Number(limit) || 20;
    const skip = (pageNum - 1) * limitNum;

    const where = {
        tenantId,
        ...(role ? { role } : {}),
        ...(isActive !== undefined ? { isActive: isActive === 'true' } : {}),
        ...(search
            ? {
                OR: [
                    { firstName: { contains: search, mode: 'insensitive' } },
                    { lastName: { contains: search, mode: 'insensitive' } },
                    { email: { contains: search, mode: 'insensitive' } },
                ],
            }
            : {}),
    };

    const [total, users] = await Promise.all([
        prisma.user.count({ where }),
        prisma.user.findMany({
            where,
            select: {
                id: true,
                email: true,
                firstName: true,
                lastName: true,
                role: true,
                department: true,
                phone: true,
                isActive: true,
                lastLoginAt: true,
                createdAt: true,
            },
            orderBy: [{ role: 'asc' }, { firstName: 'asc' }],
            skip,
            take: limitNum,
        }),
    ]);

    return { users, total, page: pageNum, limit: limitNum };
};

const createUser = async (tenantId, data) => {
    const passwordHash = await hashPassword(data.password);

    const user = await prisma.user.create({
        data: {
            tenantId,
            email: data.email.toLowerCase(),
            passwordHash,
            firstName: data.firstName,
            lastName: data.lastName,
            role: data.role,
            department: data.department || null,
            phone: data.phone || null,
        },
        select: {
            id: true,
            email: true,
            firstName: true,
            lastName: true,
            role: true,
            department: true,
            phone: true,
            isActive: true,
            createdAt: true,
        },
    });

    return user;
};

const updateUser = async (tenantId, userId, data) => {
    const user = await prisma.user.findFirst({ where: { id: userId, tenantId } });
    if (!user) {
        throw Object.assign(new Error('User not found.'), { statusCode: 404 });
    }

    const updateData = {};
    if (data.firstName) updateData.firstName = data.firstName;
    if (data.lastName) updateData.lastName = data.lastName;
    if (data.department !== undefined) updateData.department = data.department;
    if (data.phone !== undefined) updateData.phone = data.phone;
    if (data.isActive !== undefined) updateData.isActive = data.isActive;
    if (data.password) updateData.passwordHash = await hashPassword(data.password);

    const updated = await prisma.user.update({
        where: { id: userId },
        data: updateData,
        select: {
            id: true,
            email: true,
            firstName: true,
            lastName: true,
            role: true,
            department: true,
            phone: true,
            isActive: true,
            updatedAt: true,
        },
    });

    return updated;
};

const updateUserRole = async (tenantId, userId, role, requestingUserId) => {
    // Prevent self role change
    if (userId === requestingUserId) {
        throw Object.assign(new Error('You cannot change your own role.'), { statusCode: 400 });
    }

    const user = await prisma.user.findFirst({ where: { id: userId, tenantId } });
    if (!user) {
        throw Object.assign(new Error('User not found.'), { statusCode: 404 });
    }

    const updated = await prisma.user.update({
        where: { id: userId },
        data: { role },
        select: {
            id: true,
            email: true,
            firstName: true,
            lastName: true,
            role: true,
        },
    });

    return updated;
};

const getUserById = async (tenantId, userId) => {
    const user = await prisma.user.findFirst({
        where: { id: userId, tenantId },
        select: {
            id: true,
            email: true,
            firstName: true,
            lastName: true,
            role: true,
            department: true,
            phone: true,
            isActive: true,
            lastLoginAt: true,
            createdAt: true,
            locationUsers: {
                include: { location: { select: { id: true, name: true, type: true } } },
            },
        },
    });

    if (!user) {
        throw Object.assign(new Error('User not found.'), { statusCode: 404 });
    }

    return user;
};

module.exports = { listUsers, createUser, updateUser, updateUserRole, getUserById };
