using { managed } from '@sap/cds/common'; // Import the built-in aspect

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
 }
