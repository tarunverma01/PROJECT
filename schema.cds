/*using { managed } from '@sap/cds/common'; // Import the built-in aspect

 namespace my.erp.project;

 entity customers : managed {
    key ID : Integer;
    name: String;
    email : String @assert.unique;
    tickets : Composition of many SupportTickets on tickets.customer = $self;
 }
entity SupportTickets : managed {
    key ID : Integer;
    issue : String;
    customer_ID : Integer;
    status : String default `Open`;
    priority: String(10) default `Medium`;//adds a new field medium in it 

    customer : Association to customers
        on customer.ID = customer_ID;
}
 entity TicketNotes : managed {
   key ID : Integer;
   noteText : String @assert.unique;
   parentTicket : Association to SupportTickets;// links the TicketNotes to the SupportTickets(basically a foreign key)
 }*/



namespace db;

using { cuid, managed } from '@sap/cds/common';

entity Companies : cuid, managed {
    key ID : Integer;
    name        : String(100);
    role        : String(100);
    package_CTC : Integer;
    min_GPA     : Decimal(3,2);
    applications : Composition of many JobApplications
        on applications.company = $self;
}

entity Students : cuid, managed {
    key ID : Integer;
    name           : String(100);
    branch         : String(50);
    current_GPA    : Decimal(3,2);
    placed_status  : Boolean default false;
    applications : Composition of many JobApplications
        on applications.student = $self;
}

entity JobApplications : cuid, managed {
    student : Association to Students;
    company : Association to Companies;
    application_status : String(20);
}
