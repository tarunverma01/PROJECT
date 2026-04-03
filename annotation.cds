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
