sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"nexus/supplierlist/test/integration/pages/AlternateSuppliersList.gen",
	"nexus/supplierlist/test/integration/pages/AlternateSuppliersObjectPage.gen",
	"nexus/supplierlist/test/integration/pages/SupplierMaterialsObjectPage.gen"
], function (JourneyRunner, AlternateSuppliersListGenerated, AlternateSuppliersObjectPageGenerated, SupplierMaterialsObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('nexus/supplierlist') + '/test/flp.html#app-preview',
        pages: {
			onTheAlternateSuppliersListGenerated: AlternateSuppliersListGenerated,
			onTheAlternateSuppliersObjectPageGenerated: AlternateSuppliersObjectPageGenerated,
			onTheSupplierMaterialsObjectPageGenerated: SupplierMaterialsObjectPageGenerated
        },
        async: true
    });

    return runner;
});

