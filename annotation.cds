/*
// using { CatalogService } from '../srv/cat-service';

annotate CatalogService.SupportTickets with @(

    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'Ticket Number',
        },
        {
            $Type : 'UI.DataField',
            Value : issue,
            Label : 'Problem Description',
        },
        {
            $Type : 'UI.DataField',
            Value : status,
            Label : 'Current Status',
        },
        {
            $Type : 'UI.DataField',
            Value : priority,
            Label : 'Priority'
        },
        {
            $Type : 'UI.DataField',
            Value : customer_ID,
            Label : 'Customer'
        }
    ],
    UI.HeaderInfo : {
        TypeName       : 'Support Ticket',
        TypeNamePlural : 'Support Tickets',
        Title          : { Value: issue } // This makes the issue text the bold title!
    },
    UI.FieldGroup #General : {
        Data : [
            {
                $Type : 'UI.DataField',
                Value : customer_ID
            },
            {
                $Type : 'UI.DataField',
                Value : issue
            },
            {
                $Type : 'UI.DataField',
                Value : status
            }
        ]
    }
);

// using { CatalogService } from '../srv/cat-service';

annotate CatalogService.SupportTickets with {
    customer_ID @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',

            CollectionPath : 'customers',

            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : customer_ID,
                    ValueListProperty : 'ID'
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name'
                }
            ]
        }
    );
};

*/


using CatalogService from '../srv/cat-service';

annotate CatalogService.JobApplications with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : student_ID,
            Label : 'Applicant Name'
        },
        {
            $Type : 'UI.DataField',
            Value : company_ID,
            Label : 'Company Name'
        },
        {
            $Type : 'UI.DataField',
            Value : application_status,
            Label : 'Current Status'
        }
    ],
    UI.HeaderInfo : {
        TypeName       : 'Job Application',
        TypeNamePlural : 'Job Applications',
        Title          : { Value: application_status } 
    }
);

annotate CatalogService.JobApplications with {
    
    student @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Students',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : student_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name',
                }
            ],
        }
    );

    company @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Companies',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : company_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name', 
                }
            ],
        }
    );
};

annotate CatalogService.Students with {
    ID @Common.Text : name @Common.TextArrangement : #TextOnly;
};

annotate CatalogService.Companies with {
    ID @Common.Text : name @Common.TextArrangement : #TextOnly;
};
