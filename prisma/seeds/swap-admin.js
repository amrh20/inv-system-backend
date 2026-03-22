const { PrismaClient } = require('@prisma/client');
const bcrypt = require('bcryptjs');
const p = new PrismaClient();

async function main() {
    const tenant = await p.tenant.findFirst({ where: { slug: 'grand-horizon' } });

    // Update Sarah's account to be Amr instead
    const hash = await bcrypt.hash('Admin@123', 12);
    const amr = await p.user.update({
        where: { tenantId_email: { tenantId: tenant.id, email: 'admin@grandhorizon.com' } },
        data: {
            email: 'admin@admin.com',
            firstName: 'Amr',
            lastName: 'Admin',
            passwordHash: hash,
        }
    });
    console.log(`✅ Updated admin: ${amr.firstName} ${amr.lastName} (${amr.email})`);
}

main().catch(e => console.error('❌', e.message)).finally(() => p.$disconnect());
