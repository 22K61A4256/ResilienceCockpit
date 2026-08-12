using { ResilienceCockpit as my } from '../db/schema.cds';

using { API_INFORECORD_PROCESS_SRV as external } from './external/API_INFORECORD_PROCESS_SRV';

using
{
    sap.common.Countries as Countries
}
from '@sap/cds/common';


@path : '/service/ResilienceCockpitService'
service ResilienceCockpitService
{
    entity CommonCountries as projection on Countries;
    @cds.redirection.target
    @odata.draft.bypass
    @odata.draft.enabled
    entity AlternateSuppliers as
        projection on my.AlternateSuppliers
        {
            *,
            Country.name as CountryName,
            Country.name as Country,
            Country.code as CountryCode
        }
       // excluding
        // {
        //    Country
        // }
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
    'authenticated-user'
];