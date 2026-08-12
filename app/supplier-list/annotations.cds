using ResilienceCockpitService as service from '../../srv/service';
annotate service.AlternateSuppliers with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Supplier Number',
                Value : SupplierNumber,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Supplier Name',
                Value : SupplierName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Address',
                Value : Address,
            },
            {
                Label : 'Country',
                $Type : 'UI.DataField',
                Value : CountryCode,
            },
            {
                $Type : 'UI.DataFieldForAction',
                Action : 'ResilienceCockpitService.UpVote',
                Label : 'UpVote',
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Supplier Materials',
            ID : 'SupplierMaterials',
            Target : 'SupplierMaterials/@UI.LineItem#SupplierMaterials',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Supplier Number',
            Value : SupplierNumber,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Supplier Name',
            Value : SupplierName,
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : '@UI.DataPoint#SupplierRating1',
            Label : 'SupplierRating',
        },
        {
            $Type : 'UI.DataField',
            Label : 'Address',
            Value : Address,
        },
        {
            $Type : 'UI.DataFieldForActionGroup',
            Actions : [
                {
                    $Type : 'UI.DataFieldForAction',
                    Action : 'ResilienceCockpitService.UpVote',
                    Label : 'UpVote',
                },
                {
                    $Type : 'UI.DataFieldForAction',
                    Action : 'ResilienceCockpitService.DownVote',
                    Label : 'DownVote',
                },
            ],
            ID : 'UpdateRatings',
            Label : 'Update Ratings',
        },
    ],
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : SupplierName,
        },
        TypeName : '',
        TypeNamePlural : '',
        Description : {
            $Type : 'UI.DataField',
            Value : SupplierNumber,
        },
    },
    UI.DataPoint #SupplierRating : {
        Value : SupplierRating,
        Visualization : #Rating,
        TargetValue : 100,
    },
    UI.DataPoint #SupplierRating1 : {
        Value : SupplierRating,
        Visualization : #Rating,
        TargetValue : 5,
    },
);

annotate service.SupplierMaterials with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Material Information',
            ID : 'MaterialInformation',
            Target : '@UI.FieldGroup#MaterialInformation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Alternatives for Original Materials',
            ID : 'AlternativesforOriginalMaterials',
            Target : 'PossibleAlternates/@UI.LineItem#AlternativesforOriginalMaterials',
        },
    ],
    UI.FieldGroup #MaterialInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : LeadTime,
                Label : 'LeadTime',
            },
            {
                $Type : 'UI.DataField',
                Value : PartNumber,
                Label : 'PartNumber',
            },
            {
                $Type : 'UI.DataField',
                Value : Specifications_Dimentions_Length,
                Label : 'Specifications_Dimentions_Length',
            },
            {
                $Type : 'UI.DataField',
                Value : Specifications_Dimentions_Height,
                Label : 'Specifications_Dimentions_Height',
            },
            {
                $Type : 'UI.DataField',
                Value : Specifications_Voltage,
                Label : 'Specifications_Voltage',
            },
            {
                $Type : 'UI.DataField',
                Value : Specifications_Dimentions_Width,
                Label : 'Specifications_Dimentions_Width',
            },
        ],
    },
    UI.LineItem #SupplierMaterials : [
        {
            $Type : 'UI.DataField',
            Value : PartNumber,
            Label : 'PartNumber',
        },
        {
            $Type : 'UI.DataField',
            Value : Specifications_Dimentions_Height,
            Label : 'Specifications_Dimentions_Height',
        },
        {
            $Type : 'UI.DataField',
            Value : Specifications_Dimentions_Length,
            Label : 'Specifications_Dimentions_Length',
        },
        {
            $Type : 'UI.DataField',
            Value : Specifications_Dimentions_Width,
            Label : 'Specifications_Dimentions_Width',
        },
        {
            $Type : 'UI.DataField',
            Value : LeadTime,
            Label : 'LeadTime',
        },
        {
            $Type : 'UI.DataField',
            Value : Specifications_Voltage,
            Label : 'Specifications_Voltage',
        },
    ],
);

annotate service.AlternateSuppliers with {
    CountryCode @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'CommonCountries',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : CountryCode,
                    ValueListProperty : 'name',
                },
            ]
        },
        Common.ValueListWithFixedValues : true,
)};

annotate service.CommonCountries with {
    code @(
        Common.Text : name,
        Common.Text.@UI.TextArrangement : #TextFirst,
)};

annotate service.CommonCountries with {
    name @(
        Common.Text : descr,
        Common.Text.@UI.TextArrangement : #TextFirst,
)};

annotate service.AlternativeMaterials with @(
    UI.LineItem #AlternativesforOriginalMaterials : [
        {
            $Type : 'UI.DataField',
            Value : AlternativeMaterial_ID,
            Label : 'AlternativeMaterial_ID',
        },
        {
            $Type : 'UI.DataField',
            Value : PercentageMatch,
            Label : 'PercentageMatch',
        },
        {
            $Type : 'UI.DataField',
            Value : OriginalMaterialNumber,
            Label : 'OriginalMaterialNumber',
        },
    ]
);

annotate service.AlternativeMaterials with {
    OriginalMaterialNumber @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'A_PurchasingInfoRecord',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : OriginalMaterialNumber,
                    ValueListProperty : 'Material',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'MaterialGroup',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'Manufacturer',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'IsRegularSupplier',
                },
            ],
            Label : 'Material',
        },
        Common.ValueListWithFixedValues : false,
)};

