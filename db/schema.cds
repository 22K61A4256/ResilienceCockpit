namespace ResilienceCockpit;

using
{
    cuid,
    managed,
    Country
}
from '@sap/cds/common';

using from '@sap/cds-common-content';

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
    PossibleAlternates : Association to many AlternativeMaterials on PossibleAlternates.AlternativeMaterial = $self;
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
    PercentageMatch : Integer;
    AlternativeMaterial : Association to one SupplierMaterials;
}