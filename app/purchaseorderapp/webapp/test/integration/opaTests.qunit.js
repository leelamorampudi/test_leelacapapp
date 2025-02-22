sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'leela/app/purchaseorderapp/test/integration/FirstJourney',
		'leela/app/purchaseorderapp/test/integration/pages/PurchaseOrderSetList',
		'leela/app/purchaseorderapp/test/integration/pages/PurchaseOrderSetObjectPage',
		'leela/app/purchaseorderapp/test/integration/pages/PurchaseOrderItemSetObjectPage'
    ],
    function(JourneyRunner, opaJourney, PurchaseOrderSetList, PurchaseOrderSetObjectPage, PurchaseOrderItemSetObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('leela/app/purchaseorderapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePurchaseOrderSetList: PurchaseOrderSetList,
					onThePurchaseOrderSetObjectPage: PurchaseOrderSetObjectPage,
					onThePurchaseOrderItemSetObjectPage: PurchaseOrderItemSetObjectPage
                }
            },
            opaJourney.run
        );
    }
);