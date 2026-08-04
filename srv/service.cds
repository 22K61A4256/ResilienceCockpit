using { ResilienceCockpit as my } from '../db/schema.cds';

using { API_INFORECORD_PROCESS_SRV as external } from './external/API_INFORECORD_PROCESS_SRV';

@path : '/service/ResilienceCockpitService'
service ResilienceCockpitService
{
    @cds.redirection.target
    @odata.draft.bypass
    @odata.draft.enabled
    entity AlternateSuppliers as
        projection on my.AlternateSuppliers
        {
            *,
            Country.name as CountryName,
            Country.code as CountryCode
        }
        excluding
        {
            Country
        }
        actions
        {
            function SupplierItemCount
            (
            )
            returns Integer;

            action UpVote
            (
            )
            returns AlternateSuppliers;
        };

    @cds.redirection.target
    @odata.draft.enabled
    entity AleternativeMaterials as
        projection on my.AlternativeMaterials;

    @cds.redirection.target
    entity A_PurchasingInfoRecord as
        projection on external.A_PurchasingInfoRecord
        {
            *
        }
        excluding
        {
            to_PurgInfoRecdOrgPlantData
        };
}

annotate ResilienceCockpitService with @requires :
[
    'authenticated-user'
];