using { ResilienceCockpit as my } from '../db/schema.cds';

using { API_INFORECORD_PROCESS_SRV as external } from './external/API_INFORECORD_PROCESS_SRV';

@path : '/service/ResilienceCockpitService'
service ResilienceCockpitService
{
    @cds.redirection.target
    @odata.draft.bypass
    @odata.draft.enabled
    @restrict: [
        { grant: ['READ'] , to: ['NX-SC-USER' , 'NX-SC-ANL', 'NX-PR-ANL']},
        { grant: ['READ', 'WRITE'] , to: ['NX-SC-MGR']},
        { grant: ['READ', 'WRITE'] , to: ['NX-PR-ANL'], where: (createdBy = $user) }
    ]
    entity AlternateSuppliers as
        projection on my.AlternateSuppliers
        {
            *,
            0 as ShippingCost : Decimal(10,2),
            '' as ShippingCurrency : String(3)
        }
        // excluding
        // {
        //     Country
        // }
        actions
        {
            @requires:'NX-SC-MGR'
            function SupplierItemCount
            (
            )
            returns Integer;

            @requires:'NX-SC-MGR'
            action UpVote
            (
            )
            returns AlternateSuppliers;

            @requires:'NX-SC-MGR'
            action DownVote
            (
            )
            returns AlternateSuppliers;
        };

    @cds.redirection.target
    entity SupplierMaterials as
        projection on my.SupplierMaterials;

    
    @cds.redirection.target
    entity AlternativeMaterials as
        projection on my.AlternativeMaterials;

    @cds.redirection.target
    entity A_PurchasingInfoRecord as
        projection on external.A_PurchasingInfoRecord
        {
            *,
            0 as Lat : Decimal(10,8),
            0 as Lng : Decimal(10,8)

        }
        excluding
        {
            to_PurgInfoRecdOrgPlantData
        };
}

annotate ResilienceCockpitService with @requires :
[
    'NX-SC-USER'
];