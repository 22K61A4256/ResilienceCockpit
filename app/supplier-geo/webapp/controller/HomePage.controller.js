sap.ui.define([
    "sap/ui/core/mvc/Controller"
], (Controller) => {
    "use strict";

    return Controller.extend("nexus.suppliergeo.controller.HomePage", {
        onInit() {
			const oProvider = this.byId("mapProvider");
			const osm = sap.ui.require.toUrl("nexus/suppliergeo/model/osm.json");
			setTimeout(() => {
				// oProvider.setStyleUrl(`${window.location.origin}/${osm}`);
				oProvider.setStyleUrl(`${osm}`);
			});
        },
        onAfterRendering() {
          this.getView().getModel().read("/A_PurchasingInfoRecord", {
            success: (oData) => {
              console.log("Data fetched successfully:", oData);
            },
            error: (oError) => {
              console.error("Error fetching data:", oError);
            }
          });  
        },


        spotClick: function (oEvent) {
            console.log("Spot clicked", oEvent);
            const oSpot = oEvent.getSource();
            const oData = oSpot.getBindingContext().getObject();
            const sMessage = `You clicked on the Supplier with ID: ${oData.Supplier} and PurchasingInfoRecord: ${oData.PurchasingInfoRecord}`;
            sap.m.MessageToast.show(sMessage);
        }

    });
});