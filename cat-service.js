// const cds = require('@sap/cds');

// module.exports = cds.service.impl(async function() {
//     // We define the entities INSIDE the function
//     const { SupportTickets, Customers } = this.entities;
//     // 1. Validation for Support Tickets
//     this.before('CREATE', 'SupportTickets', (req) => {
//         const { issue } = req.data;
//         if (issue && issue.length < 10) {
//             req.error(400, `The issue description "${issue}" is too short. Please provide at least 10 characters.`);
//         }
//     });
//     // 2. Logger for Customers (Optional but good for testing)
//     this.after('CREATE', 'Customers', (each) => {
//         console.log(`Successfully created customer: ${each.name}`);
//     });
// });


const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {

    const { Students, Companies } = this.entities;

    this.before('CREATE', 'JobApplications', async (req) => {

        const { student_ID, company_ID } = req.data;

        const student = await SELECT.one.from(Students).where({ ID: student_ID });
        const company = await SELECT.one.from(Companies).where({ ID: company_ID });

        if (!student || !company) {
            return req.error(400, 'Invalid student or company.');
        }

        if (student.current_GPA < company.min_GPA) {
            return req.error(400, 'Eligibility failed: Your GPA does not meet the company requirements.');
        }

    });

});
