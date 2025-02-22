using CatalogService as service from '../../srv/CatalogService';

annotate service.PurchaseOrderSet with @(

UI.SelectionFields:[
    PO_ID,
    PARTNER_GUID.COMPANY_NAME,
    GROSS_AMOUNT,
    CURRENCY_code,
    OVERALL_STATUS
],

UI.LineItem:[
    {
         $Type : 'UI.DataField' ,
         Value : PO_ID
    },
    {
        $Type : 'UI.DataField',
        Value : PARTNER_GUID.COMPANY_NAME,
    },
    {
        $Type : 'UI.DataField',
        Value : PARTNER_GUID.ADDRESS_GUID.COUNTRY,
    },
    
    {
        $Type : 'UI.DataField',
        Value : GROSS_AMOUNT,
    },
    {
        $Type : 'UI.DataFieldForAction',
        Inline : true,
        Label : 'Boost',
        Action : 'CatalogService.boost'
    },
    
    {
        $Type : 'UI.DataField',
        Value : Overallstatus,
        Criticality: Criticality
    }
],

UI.HeaderInfo:{
    TypeName: 'Purchase Order',
    TypeNamePlural: 'PurchaseOrders',
    Title : {
        Value: PO_ID,
    },
    Description : {
        Value : PARTNER_GUID.COMPANY_NAME,
    },
    ImageUrl: 'data:image/png;base64,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',
    
},
UI.Facets:[
    {
        $Type : 'UI.CollectionFacet',
        Label : 'More Details',
        Facets: [
            {
               $Type : 'UI.ReferenceFacet', 
               Label : 'More Info',
               Target : '@UI.Identification',
               
            },
            {
                $Type : 'UI.ReferenceFacet',
                Label : 'Price Info',
                Target : '@UI.FieldGroup#PriceInfo',
            },
            {
                $Type : 'UI.ReferenceFacet',
                Label : 'Staus Info',
                Target : '@UI.FieldGroup#Satus',
            },

        ],
    },
    {
        $Type : 'UI.ReferenceFacet',
        Label : 'Line Item',
        Target : 'Items/@UI.LineItem',
    },
],

UI.Identification:[
    {
        $Type : 'UI.DataField',
          Label: 'Purchase Order ID',
        Value : PO_ID,
    },
    {
        $Type : 'UI.DataField',
        Label: 'Seller',
        Value : PARTNER_GUID_NODE_KEY,
    },
    {
        $Type : 'UI.DataField',
          Label: 'STATUS',
        Value : OVERALL_STATUS,
    },
],
UI.FieldGroup #PriceInfo:{
        Label : 'Price Details',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : GROSS_AMOUNT,
            },
             {
                $Type : 'UI.DataField',
                Value : NET_AMOUNT,
            },
             {
                $Type : 'UI.DataField',
                Value : TAX_AMOUNT,
            },
             {
                $Type : 'UI.DataField',
                Value : CURRENCY_code,
            }
        ]
        
    },

UI.FieldGroup #Satus:{
        Label : 'Staus',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : LIFECYCLE_STATUS,
            },
        ]
}
);

annotate service.PurchaseOrderItemSet with @(
    UI.LineItem:[
        {
            $Type : 'UI.DataField',
            Value : PO_ITEM_POS,

        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID_NODE_KEY,
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
        },
        {
         $Type : 'UI.DataField',
         Value : NET_AMOUNT,   
        },
        {
            $Type : 'UI.DataField',
            Value : TAX_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : CURRENCY_code,
        },
    ],
    UI.HeaderInfo:{
        TypeName: 'PO ITEM',
        TypeNamePlural: 'PO ITEMS'
    },
    UI.Facets:[
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'More Item Data',
            Target : '@UI.Identification',
        }
       
    ],
    UI.Identification:[
        {
            $Type : 'UI.DataField',
            Label : 'Item Position',
            Value: PO_ITEM_POS,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Product Id',
            Value: PRODUCT_GUID_NODE_KEY,
        },
        {
            $Type : 'UI.DataField',
            Value: GROSS_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : NET_AMOUNT,
        },
        {
            $Type :'UI.DataField',
            Value : TAX_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : CURRENCY_code,
        },

    ]
);





