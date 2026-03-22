/**
 * create-super-admin.js
 * Run: node prisma/create-super-admin.js
 *
 * Creates a SUPER_ADMIN user (no tenant) in the database.
 */

const { PrismaClient } = require('@prisma/client');
const bcrypt = require('bcryptjs');

const prisma = new PrismaClient();

async function main() {
    const email = 'super@ose.local';
    const password = 'SuperAdmin@123';
    const firstName = 'Super';
    const lastName = 'Admin';

    // Check if already exists
    const existing = await prisma.user.findFirst({ where: { email } });
    if (existing) {
        console.log(`\n✅  SUPER_ADMIN already exists: ${email}`);
        console.log(`    Role: ${existing.role}`);
        return;
    }

    const hashed = await bcrypt.hash(password, 12);

    const user = await prisma.user.create({
        data: {
            email,
            password: hashed,
            firstName,
            lastName,
            role: 'SUPER_ADMIN',
            isActive: true,
            // tenantId is NULL — Super Admin doesn't belong to any tenant
        }
    });

    console.log('\n🎉  SUPER_ADMIN user created successfully!');
    console.log('─────────────────────────────────────');
    console.log(`  Email   : ${email}`);
    console.log(`  Password: ${password}`);
    console.log(`  ID      : ${user.id}`);
    console.log('─────────────────────────────────────');
    console.log('  Use these credentials in the Login page.');
    console.log('  Change the password after first login.\n');
}

main()
    .catch(e => {
        console.error('\n❌  Error:', e.message);
        process.exit(1);
    })
    .finally(() => prisma.$disconnect());
