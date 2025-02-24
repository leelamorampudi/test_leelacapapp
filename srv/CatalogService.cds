using { leela.db.master, leela.db.transaction} from '../db/datamodel';

//service CatalogService @(path: 'CatalogService') {
service CatalogService @(path : 'CatalogService', requires: 'authenticated-user') {

//entity EmployeeSet as projection on master.employees;
entity EmployeeSet @(restrict: [ 
                        { grant: ['READ'], to: 'Viewer', where: 'bankName = $user.BankName' },
                        { grant: ['WRITE'], to: 'Admin' }
                        ]) as projection on master.employees;

entity BusinessPartnerSet as projection on master.businesspartner;
entity ProductSet as projection on master.product;
entity BPAddressSet as projection on master.address;
entity PurchaseOrderSet @(
    odata.draft.enabled: true
)as projection on transaction.purchaseorder{
    *,
    case OVERALL_STATUS
        when 'O' then 'Open'
        when 'A' then 'Approved'
        when 'X' then 'Rejected'
        when 'N' then 'New'
        when 'D' then 'Delivered'
        when 'P' then 'Pending'
        end as Overallstatus : String(10)  ,

    case OVERALL_STATUS
        when 'O' then 0
        when 'A' then 0
        when 'X' then 3
        when 'N' then 1
        when 'D' then 2
        when 'P' then 2
        end as Criticality : String(10),
} actions{
    @cds.odata.bindingparameter.name : '_Leela'
    @Common.SideEffects : {
        TargetProperties : ['_Leela/GROSS_AMOUNT'],
    }
    action boost();
    function largestOrder() returns array of PurchaseOrderSet;
};
entity PurchaseOrderItemSet as projection on transaction.poitems;
}

