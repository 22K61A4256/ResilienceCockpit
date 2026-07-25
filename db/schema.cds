namespace resilience.cockpit;

using from '@sap/cds-common-content';

using
{
    cuid,
    managed,
    Country
}
from '@sap/cds/common';

entity AlternateSuppliers : cuid, managed
{
    SupplierNumber : String(100);
    SupplierName : String(100);
    Address : String(500);
    Country : Country;
    SupplierRating : Integer;
    SupplierMaterials : Composition of many SupplierMaterials on SupplierMaterials.AlternateSupplier = $self;
}

entity SupplierMaterials : cuid, managed
{
    PartNumber : Integer;
    LeadTime : Integer;
    Specifications : SpecificationType;
    AlternateSupplier : Association to one AlternateSuppliers;
    PossibleAlternates : Composition of many AlternativeMaterials on PossibleAlternates.AlternativeMaterials = $self;
}

type SpecificationType
{
    Voltage : Decimal(5,2);
    Dimentions : DimentionType;
}

type DimentionType
{
    Length : Decimal(5,2);
    Width : Decimal(5,2);
    Height : Decimal(5,2);
}

entity AlternativeMaterials : cuid
{
    OriginalMaterialNumber : String(30);
    PercentMatch : Integer;
    AlternativeMaterials : Association to one SupplierMaterials;
}
