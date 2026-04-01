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

annotate CatalogService.SupportTickets with {
    customer @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Customers',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : customer_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name',
                },
            ],
        }
    );
};
