using { resilience.cockpit as db } from '../db/schema';

service ResilienceService {

    entity AlternateSuppliers
        as projection on db.AlternateSuppliers;

    entity SupplierMaterials
        as projection on db.SupplierMaterials;

    entity AlternativeMaterials
        as projection on db.AlternativeMaterials;
}