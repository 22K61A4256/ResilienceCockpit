/* checksum : 02529da0afada36b048fc47dc7139083 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service API_INFORECORD_PROCESS_SRV {
  @cds.external : true
  @cds.persistence.skip : true
  @sap.deletable : 'false'
  @sap.content.version : '1'
  @sap.label : 'Purchasing Info Record'
  entity A_PurchasingInfoRecord {
    @sap.display.format : 'UpperCase'
    @sap.label : 'Purchasing Info Rec.'
    @sap.quickinfo : 'Purchasing Info Record Number'
    key PurchasingInfoRecord : String(10) not null;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Supplier'
    @sap.quickinfo : 'Supplier''s Account Number'
    Supplier : String(10);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Material'
    @sap.quickinfo : 'Material Number'
    Material : String(40);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Material Group'
    MaterialGroup : String(9);
    @sap.display.format : 'Date'
    @sap.label : 'Created On'
    @sap.quickinfo : 'Record Creation Date'
    CreationDate : Date;
    @sap.label : 'Complete info record'
    @sap.quickinfo : 'Purchasing info: General data flagged for deletion'
    IsDeleted : Boolean;
    @sap.label : 'Info Short Text'
    @sap.quickinfo : 'Short Text for Purchasing Info Record'
    PurchasingInfoRecordDesc : String(40);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Sort Term'
    @sap.quickinfo : 'Sort Term for Non-Stock Info Records'
    PurgInfoRecNonStockItmSortTerm : String(10);
    @sap.label : 'Order Unit'
    @sap.quickinfo : 'Purchase Order Unit of Measure'
    @sap.semantics : 'unit-of-measure'
    PurgDocOrderQuantityUnit : String(3);
    @sap.label : 'Equal To'
    @sap.quickinfo : 'Numerator for Conversion of Order Unit to Base Unit'
    OrderItemQtyToBaseQtyNmrtr : Decimal(5, 0);
    @sap.label : 'Denominator'
    @sap.quickinfo : 'Denominator for Conversion of Order Unit to Base Unit'
    OrderItemQtyToBaseQtyDnmntr : Decimal(5, 0);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Supplier Mat. No.'
    @sap.quickinfo : 'Material Number Used by Supplier'
    SupplierMaterialNumber : String(35);
    @sap.label : 'Salesperson'
    @sap.quickinfo : 'Salesperson Responsible in the Event of Queries'
    SupplierRespSalesPersonName : String(30);
    @sap.label : 'Telephone'
    @sap.quickinfo : 'Supplier''s Telephone Number'
    SupplierPhoneNumber : String(16);
    @sap.label : 'Base Unit of Measure'
    @sap.semantics : 'unit-of-measure'
    BaseUnit : String(3);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Suppl. Mat. Grp'
    @sap.quickinfo : 'Supplier Material Group'
    SupplierMaterialGroup : String(18);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Prior Supplier'
    PriorSupplier : String(10);
    @sap.display.format : 'Date'
    @sap.label : 'Available from'
    @sap.quickinfo : 'Available (Deliverable) From'
    AvailabilityStartDate : Date;
    @sap.display.format : 'Date'
    @sap.label : 'Available to'
    @sap.quickinfo : 'Available (Deliverable) Until'
    AvailabilityEndDate : Date;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Var. Order Unit'
    @sap.quickinfo : 'Variable Purchase Order Unit Active'
    VarblPurOrdUnitIsActive : String(1);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Manufacturer'
    Manufacturer : String(10);
    @sap.label : 'Regular Supplier'
    IsRegularSupplier : Boolean;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Supplier Subrange'
    SupplierSubrange : String(6);
    @sap.label : '1st Reminder/Exped.'
    @sap.quickinfo : 'Number of Days for First Reminder/Expediter'
    NoDaysReminder1 : Decimal(3, 0);
    @sap.label : '2nd Reminder/Exped.'
    @sap.quickinfo : 'Number of Days for Second Reminder/Expediter'
    NoDaysReminder2 : Decimal(3, 0);
    @sap.label : '3rd Reminder/Exped.'
    @sap.quickinfo : 'Number of Days for Third Reminder/Expediter'
    NoDaysReminder3 : Decimal(3, 0);
    @sap.unit : 'ProductPurchasePointsQtyUnit'
    @sap.label : 'Points'
    @sap.quickinfo : 'Number of Points'
    ProductPurchasePointsQty : Decimal(13, 3);
    @sap.label : 'Points Unit'
    @sap.semantics : 'unit-of-measure'
    ProductPurchasePointsQtyUnit : String(3);
    @sap.display.format : 'NonNegative'
    @sap.label : 'SSR Sort Seq. Number'
    @sap.quickinfo : 'Sort Sequence Number'
    SupplierSubrangeSortNumber : String(5);
    @odata.Type : 'Edm.DateTimeOffset'
    @odata.Precision : 7
    @sap.label : 'Time Stamp'
    @sap.quickinfo : 'UTC Time Stamp in Long Form (YYYYMMDDhhmmssmmmuuun)'
    LastChangeDateTime : Timestamp;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Busin. Purp. Cmpltd.'
    @sap.quickinfo : 'Business Purpose Completed'
    IsEndOfPurposeBlocked : String(1);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Ctry/Reg. of Origin'
    @sap.quickinfo : 'Country/Region of Issue of Certificate of Origin'
    SupplierCertOriginCountry : String(3);
    to_PurgInfoRecdOrgPlantData : Composition of many A_PurgInfoRecdOrgPlantData {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  @sap.label : 'Purchasing Info Record General Notes'
  entity A_PurchasingInfoRecordNote {
    @sap.display.format : 'UpperCase'
    @sap.label : 'Text ID'
    key TextObjectType : String(4) not null;
    @sap.label : 'Language Key'
    key Language : String(2) not null;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Purchasing Info Rec.'
    @sap.quickinfo : 'Purchasing Info Record Number'
    key PurchasingInfoRecord : String(10) not null;
    @sap.label : 'Long Text'
    NoteDescription : String;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Supplier'
    @sap.quickinfo : 'Supplier''s Account Number'
    Supplier : String(10);
    to_PurchasingInfoRecord : Association to A_PurchasingInfoRecord {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  @sap.label : 'Purchasing Info Recd Organisation Notes'
  entity A_PurgInfoRecdOrganizationNote {
    @sap.display.format : 'UpperCase'
    @sap.label : 'Text ID'
    key TextObjectType : String(4) not null;
    @sap.label : 'Language Key'
    key Language : String(2) not null;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Purchasing Info Rec.'
    @sap.quickinfo : 'Purchasing Info Record Number'
    key PurchasingInfoRecord : String(10) not null;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Purch. Organization'
    @sap.quickinfo : 'Purchasing Organization'
    key PurchasingOrganization : String(4) not null;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Info Record Category'
    @sap.quickinfo : 'Purchasing info record category'
    key PurchasingInfoRecordCategory : String(1) not null;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Plant'
    key Plant : String(4) not null;
    @sap.label : 'Long Text'
    NoteDescription : String;
    to_PurgInfoRecdOrgPlantData : Association to A_PurgInfoRecdOrgPlantData {  };
    to_PurgInfoRecord : Association to A_PurchasingInfoRecord {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.deletable : 'false'
  @sap.content.version : '1'
  @sap.label : 'Purchasing Info Record Purch. Org. Data'
  entity A_PurgInfoRecdOrgPlantData {
    @sap.display.format : 'UpperCase'
    @sap.label : 'Purchasing Info Rec.'
    @sap.quickinfo : 'Purchasing Info Record Number'
    key PurchasingInfoRecord : String(10) not null;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Info Record Category'
    @sap.quickinfo : 'Purchasing info record category'
    key PurchasingInfoRecordCategory : String(1) not null;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Purch. Organization'
    @sap.quickinfo : 'Purchasing Organization'
    key PurchasingOrganization : String(4) not null;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Plant'
    key Plant : String(4) not null;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Created By'
    @sap.quickinfo : 'Name of Person Responsible for Creating the Object'
    CreatedByUser : String(12);
    @sap.display.format : 'Date'
    @sap.label : 'Created On'
    @sap.quickinfo : 'Record Creation Date'
    CreationDate : Date;
    @sap.label : 'Deltn Ind PurgOrgDta'
    @sap.quickinfo : 'Deletion Indicator for Purchasing Org Data for Info Records'
    IsMarkedForDeletion : Boolean;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Purchasing Group'
    PurchasingGroup : String(3);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Currency'
    @sap.quickinfo : 'Currency Key'
    @sap.semantics : 'currency-code'
    Currency : String(5);
    @sap.unit : 'PurchaseOrderPriceUnit'
    @sap.label : 'Minimum Qty'
    @sap.quickinfo : 'Minimum Purchase Order Quantity'
    MinimumPurchaseOrderQuantity : Decimal(13, 3);
    @sap.unit : 'PurchaseOrderPriceUnit'
    @sap.label : 'Standard PO Quantity'
    @sap.quickinfo : 'Standard Purchase Order Quantity'
    StandardPurchaseOrderQuantity : Decimal(13, 3);
    @sap.label : 'Planned Deliv. Time'
    @sap.quickinfo : 'Planned Delivery Time in Days'
    MaterialPlannedDeliveryDurn : Decimal(3, 0);
    @sap.label : 'Overdeliv. Tolerance'
    @sap.quickinfo : 'Overdelivery Tolerance'
    OverdelivTolrtdLmtRatioInPct : Decimal(3, 1);
    @sap.label : 'Underdel. Tolerance'
    @sap.quickinfo : 'Underdelivery Tolerance'
    UnderdelivTolrtdLmtRatioInPct : Decimal(3, 1);
    @sap.label : 'Unltd Overdelivery'
    @sap.quickinfo : 'Unlimited Overdelivery Allowed'
    UnlimitedOverdeliveryIsAllowed : Boolean;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Purchasing Document'
    @sap.quickinfo : 'Purchasing Document Number'
    LastReferencingPurchaseOrder : String(10);
    @sap.display.format : 'NonNegative'
    @sap.label : 'Item'
    @sap.quickinfo : 'Item Number of Purchasing Document'
    LastReferencingPurOrderItem : String(5);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Material'
    @sap.quickinfo : 'Material Number'
    Material : String(40);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Supplier'
    @sap.quickinfo : 'Supplier''s Account Number'
    Supplier : String(10);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Material Group'
    MaterialGroup : String(9);
    @sap.label : 'Order Unit'
    @sap.quickinfo : 'Purchase Order Unit of Measure'
    @sap.semantics : 'unit-of-measure'
    PurgDocOrderQuantityUnit : String(3);
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    NetPriceQuantityUnit : String(50);
    @sap.unit : 'Currency'
    @sap.label : 'Net Price'
    @sap.quickinfo : 'Net Price in Purchasing Info Record'
    NetPriceAmount : Decimal(12, 3);
    @sap.unit : 'Currency'
    @sap.label : 'Effective Price'
    @sap.quickinfo : 'Effective Price in Purchasing Info Record'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    PurgInfoRecdEffctvPrc : Decimal(12, 3);
    @sap.unit : 'PurchaseOrderPriceUnit'
    @sap.label : 'Price Unit'
    MaterialPriceUnitQty : Decimal(5, 0);
    @sap.label : 'Order Price Unit'
    @sap.quickinfo : 'Order Price Unit (Purchasing)'
    @sap.semantics : 'unit-of-measure'
    PurchaseOrderPriceUnit : String(3);
    @sap.label : 'Quantity Conversion'
    @sap.quickinfo : 'Numerator for Conversion of Order Price Unit into Order Unit'
    OrderPriceUnitToOrderUnitNmrtr : Decimal(5, 0);
    @sap.label : 'Quantity Conversion'
    @sap.quickinfo : 'Denominator for Conv. of Order Price Unit into Order Unit'
    OrdPriceUnitToOrderUnitDnmntr : Decimal(5, 0);
    @sap.display.format : 'Date'
    @sap.label : 'Valid To'
    @sap.quickinfo : 'Price Valid Until'
    PriceValidityEndDate : Date;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Shipping Instruction'
    @sap.quickinfo : 'Shipping Instructions'
    ShippingInstruction : String(2);
    @sap.label : 'GR-Based Inv. Verif.'
    @sap.quickinfo : 'Indicator: GR-Based Invoice Verification'
    InvoiceIsGoodsReceiptBased : Boolean;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Tax Code'
    @sap.quickinfo : 'Tax on Sales/Purchases Code'
    TaxCode : String(2);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Incoterms'
    @sap.quickinfo : 'Incoterms (Part 1)'
    IncotermsClassification : String(3);
    @sap.label : 'Incoterms (Part 2)'
    IncotermsTransferLocation : String(28);
    @sap.label : 'Incoterms Location 1'
    IncotermsLocation1 : String(70);
    @sap.unit : 'PurchaseOrderPriceUnit'
    @sap.label : 'Max. Order Quantity'
    @sap.quickinfo : 'Maximum Purchase Order Quantity'
    MaximumOrderQuantity : Decimal(13, 3);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Auto. Sourcing'
    @sap.quickinfo : 'Relevant for Automatic Sourcing'
    IsRelevantForAutomSrcg : String(1);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Quotation'
    @sap.quickinfo : 'Quotation Number'
    SupplierQuotation : String(10);
    @sap.display.format : 'Date'
    @sap.label : 'Quotation Valid from'
    @sap.quickinfo : 'Quotation Validity Date'
    SupplierQuotationDate : Date;
    @sap.label : 'Min. Rem. Shelf Life'
    @sap.quickinfo : 'Minimum Remaining Shelf Life'
    MinRemainingShelfLife : Decimal(4, 0);
    @sap.label : 'No ERS'
    @sap.quickinfo : 'No Evaluated Receipt Settlement (ERS)'
    IsEvaluatedRcptSettlmtAllowed : Boolean;
    @sap.label : 'New PO for inc. Del.'
    @sap.quickinfo : 'Create Purchase Order for Delivery Without Reference'
    IsPurOrderAllwdForInbDeliv : Boolean;
    @sap.label : 'Acknowledgment Reqd.'
    @sap.quickinfo : 'Order Acknowledgment Requirement'
    IsOrderAcknRqd : Boolean;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Supplier RMA Requird'
    @sap.quickinfo : 'Supplier RMA Number Required'
    IsRetMatlAuthznRqdBySupplier : String(1);
    @sap.label : 'No Cash Discount'
    @sap.quickinfo : 'Item Does Not Qualify for Cash Discount'
    IsCashDiscountGranted : Boolean;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Condition Group'
    @sap.quickinfo : 'Condition Group with Supplier'
    MaterialConditionGroup : String(4);
    @sap.display.format : 'Date'
    @sap.label : 'Date of Document'
    @sap.quickinfo : 'Date of Last PO or Sched. Agreement Document in Info Record'
    PurchasingDocumentDate : Date;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Period Ind. for SLED'
    @sap.quickinfo : 'Period Indicator for Shelf Life Expiration Date'
    ShelfLifeExpirationDatePeriod : String(1);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Busin. Purp. Cmpltd.'
    @sap.quickinfo : 'Business Purpose Completed'
    IsEndOfPurposeBlocked : String(1);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Confirmation Control'
    @sap.quickinfo : 'Confirmation Control Key'
    SupplierConfirmationControlKey : String(4);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Pricing Date Control'
    @sap.quickinfo : 'Price Determination (Pricing) Date Control'
    PricingDateControl : String(1);
    @sap.display.format : 'Date'
    @sap.label : 'Tax Rate Valid-From'
    @sap.quickinfo : 'Valid-From Date of the Tax Rate'
    TimeDependentTaxValidFromDate : Date;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Tax Ctry/Reg.'
    @sap.quickinfo : 'Tax Reporting Country/Region'
    TaxCountry : String(3);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Rounding Profile'
    MaterialRoundingProfile : String(4);
    @sap.label : 'No Material Text'
    @sap.quickinfo : 'Material Master Record PO Text Not Relevant'
    MatlMstrTxtIsNotRlvtForPOItm : Boolean;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Production Version'
    ProductionVersion : String(4);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Procedure'
    PurgDocExportImportProcedure : String(8);
    to_PurgInfoRecd : Association to A_PurchasingInfoRecord {  };
    to_PurInfoRecdPrcgCndnValidity : Association to many A_PurInfoRecdPrcgCndnValidity {  };
    to_PurInfoRecdPurOrgText : Association to many A_PurgInfoRecdOrgPOText {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  @sap.label : 'Purchase Info Record PO Text'
  entity A_PurgInfoRecdOrgPOText {
    @sap.label : 'Language Key'
    key Language : String(2) not null;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Text ID'
    key DocumentText : String(4) not null;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Text object'
    @sap.quickinfo : 'Texts: application object'
    key TechnicalObjectType : String(10) not null;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Text Name'
    @sap.quickinfo : 'Name'
    key ArchObjectNumber : String(70) not null;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Purchasing Info Rec.'
    @sap.quickinfo : 'Purchasing Info Record Number'
    key PurchasingInfoRecord : String(10) not null;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Purch. Organization'
    @sap.quickinfo : 'Purchasing Organization'
    key PurchasingOrganization : String(4) not null;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Info Record Category'
    @sap.quickinfo : 'Purchasing info record category'
    key PurchasingInfoRecordCategory : String(1) not null;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Plant'
    key Plant : String(4) not null;
    @sap.label : 'Long Text'
    NoteDescription : String;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.deletable : 'false'
  @sap.content.version : '1'
  @sap.label : 'Pricing Conditions'
  entity A_PurInfoRecdPrcgCndn {
    @sap.display.format : 'UpperCase'
    @sap.label : 'Condition Record No.'
    @sap.quickinfo : 'Number of Condition Record'
    key ConditionRecord : String(10) not null;
    @sap.display.format : 'NonNegative'
    @sap.label : 'Sequent. No. of Cond'
    @sap.quickinfo : 'Sequential number of the condition'
    ConditionSequentialNumber : String(2);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Application'
    ConditionApplication : String(2);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Condition Type'
    ConditionType : String(4);
    @sap.display.format : 'Date'
    @sap.label : 'Valid To'
    @sap.quickinfo : 'Valid To Date'
    ConditionValidityEndDate : Date;
    @sap.display.format : 'Date'
    @sap.label : 'Valid From'
    @sap.quickinfo : 'Valid-From Date'
    ConditionValidityStartDate : Date;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Created By'
    @sap.quickinfo : 'Name of Person Responsible for Creating the Object'
    CreatedByUser : String(12);
    @sap.display.format : 'Date'
    @sap.label : 'Created On'
    @sap.quickinfo : 'Record Creation Date'
    CreationDate : Date;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Text number'
    @sap.quickinfo : 'Number of texts'
    ConditionTextID : String(10);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Scale Type'
    PricingScaleType : String(1);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Scale Base Type'
    PricingScaleBasis : String(1);
    @sap.unit : 'ConditionScaleQuantityUnit'
    @sap.label : 'Scale Quantity'
    @sap.quickinfo : 'Condition Scale Quantity'
    ConditionScaleQuantity : Decimal(15, 3);
    @sap.label : 'Scale Unit of Meas.'
    @sap.quickinfo : 'Condition Scale Unit of Measure'
    @sap.semantics : 'unit-of-measure'
    ConditionScaleQuantityUnit : String(3);
    @sap.unit : 'ConditionScaleAmountCurrency'
    @sap.label : 'Scale Value'
    ConditionScaleAmount : Decimal(16, 3);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Scale Currency'
    @sap.semantics : 'currency-code'
    ConditionScaleAmountCurrency : String(5);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Calculation Type'
    @sap.quickinfo : 'Calculation Type for Condition'
    ConditionCalculationType : String(1);
    @sap.unit : 'ConditionRateValueUnit'
    @sap.label : 'Condition Amount'
    @sap.quickinfo : 'Condition amount or percentage where no scale exists'
    ConditionRateValue : Decimal(12, 3);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Condition Currency'
    @sap.quickinfo : 'Condition Unit (Currency or Percentage)'
    @sap.semantics : 'currency-code'
    ConditionRateValueUnit : String(5);
    @sap.label : 'Unit of Measure'
    @sap.semantics : 'unit-of-measure'
    ConditionRateRatioUnit : String(3);
    @sap.unit : 'ConditionRateRatioUnit'
    @sap.label : 'Ratio'
    @sap.quickinfo : 'Condition Ratio (in Percent or Per Mille)'
    ConditionRateRatio : Decimal(24, 9);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Condition Currency'
    @sap.quickinfo : 'Condition Unit (Currency or Percentage)'
    @sap.semantics : 'currency-code'
    ConditionCurrency : String(5);
    @sap.unit : 'ConditionCurrency'
    @sap.label : 'Amount'
    @sap.quickinfo : 'Condition Amount or Percentage'
    ConditionRateAmount : Decimal(24, 9);
    @sap.unit : 'ConditionQuantityUnit'
    @sap.label : 'Pricing Unit'
    @sap.quickinfo : 'Condition Pricing Unit'
    ConditionQuantity : Decimal(5, 0);
    @sap.label : 'Unit of Measure'
    @sap.quickinfo : 'Condition Unit'
    @sap.semantics : 'unit-of-measure'
    ConditionQuantityUnit : String(3);
    @sap.label : 'NumeratorForConvers.'
    @sap.quickinfo : 'Numerator for converting condition units to base units'
    ConditionToBaseQtyNmrtr : Decimal(5, 0);
    @sap.label : 'Denom.for Conversion'
    @sap.quickinfo : 'Denominator for converting condition units to base units'
    ConditionToBaseQtyDnmntr : Decimal(5, 0);
    @sap.label : 'Base Unit of Measure'
    @sap.semantics : 'unit-of-measure'
    BaseUnit : String(3);
    @sap.unit : 'ConditionAlternativeCurrency'
    @sap.label : 'Lower limit'
    @sap.quickinfo : 'Lower limit of the condition rate/amount'
    ConditionLowerLimit : Decimal(12, 3);
    @sap.unit : 'ConditionAlternativeCurrency'
    @sap.label : 'Upper limit'
    @sap.quickinfo : 'Upper limit for the condition rate'
    ConditionUpperLimit : Decimal(12, 3);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Condition Currency'
    @sap.quickinfo : 'Condition Currency (for Cumulation Fields)'
    @sap.semantics : 'currency-code'
    ConditionAlternativeCurrency : String(5);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Exclusion'
    @sap.quickinfo : 'Condition exclusion indicator'
    ConditionExclusion : String(1);
    @sap.label : 'Deletion Indicator'
    @sap.quickinfo : 'Deletion Indicator for Condition Record'
    ConditionIsDeleted : Boolean;
    @sap.display.format : 'NonNegative'
    @sap.label : 'Addit. Value Days'
    @sap.quickinfo : 'Additional Value Days'
    AdditionalValueDays : String(2);
    @sap.display.format : 'Date'
    @sap.label : 'Fixed Value Date'
    FixedValueDate : Date;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Terms of Payment'
    @sap.quickinfo : 'Key for Terms of Payment'
    PaymentTerms : String(4);
    @sap.display.format : 'NonNegative'
    @sap.label : 'Max.number.of.orders'
    @sap.quickinfo : 'Maximum number of sales orders per condition record'
    CndnMaxNumberOfSalesOrders : String(2);
    @sap.unit : 'ConditionQuantityUnit'
    @sap.label : 'Min.cond.base value'
    @sap.quickinfo : 'Minimum condition base value'
    MinimumConditionBasisValue : Decimal(15, 3);
    @sap.unit : 'ConditionQuantityUnit'
    @sap.label : 'Max.cond.base value'
    @sap.quickinfo : 'Maximum condition base value'
    MaximumConditionBasisValue : Decimal(15, 3);
    @sap.unit : 'ConditionAlternativeCurrency'
    @sap.label : 'Max.condition value'
    @sap.quickinfo : 'Maximum condition value'
    MaximumConditionAmount : Decimal(14, 3);
    @sap.display.format : 'NonNegative'
    @sap.label : 'Incremental scale'
    @sap.quickinfo : 'Number of incremental scale'
    IncrementalScale : String(4);
    @sap.display.format : 'NonNegative'
    @sap.label : 'Pricing scale'
    @sap.quickinfo : 'Scale number for pricing'
    PricingScaleLine : String(4);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Release Status'
    ConditionReleaseStatus : String(1);
    to_PurgInfoPricingCndnRecdScale : Association to many A_PurInfoRecdPrcgCndnScale {  };
    to_PurInfoRecdPrcgCndnValidity : Association to many A_PurInfoRecdPrcgCndnValidity {  };
    to_PurInfoRecdSuplmntPrcgCndn : Association to many A_PurInfoRecdSuplmntPrcgCndn {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  @sap.label : 'Pricing Condition Scales'
  entity A_PurInfoRecdPrcgCndnScale {
    @sap.display.format : 'UpperCase'
    @sap.label : 'Condition Record No.'
    @sap.quickinfo : 'Number of Condition Record'
    key ConditionRecord : String(10) not null;
    @sap.display.format : 'NonNegative'
    @sap.label : 'Sequent. No. of Cond'
    @sap.quickinfo : 'Sequential number of the condition'
    key ConditionSequentialNumber : String(2) not null;
    @sap.display.format : 'NonNegative'
    @sap.label : 'Line number'
    @sap.quickinfo : 'Current number of the line scale'
    key ConditionScaleLine : String(4) not null;
    @sap.unit : 'ConditionScaleQuantityUnit'
    @sap.label : 'Scale Quantity'
    @sap.quickinfo : 'Condition Scale Quantity'
    ConditionScaleQuantity : Decimal(15, 3);
    @sap.label : 'Scale Unit of Meas.'
    @sap.quickinfo : 'Condition Scale Unit of Measure'
    @sap.semantics : 'unit-of-measure'
    ConditionScaleQuantityUnit : String(3);
    @sap.unit : 'ConditionScaleAmountCurrency'
    @sap.label : 'Scale Value'
    ConditionScaleAmount : Decimal(16, 3);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Scale Currency'
    @sap.semantics : 'currency-code'
    ConditionScaleAmountCurrency : String(5);
    @sap.unit : 'ConditionRateValueUnit'
    @sap.label : 'Amount'
    @sap.quickinfo : 'Condition Amount or Percentage'
    ConditionRateValue : Decimal(12, 3);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Condition Currency'
    @sap.quickinfo : 'Condition Unit (Currency or Percentage)'
    @sap.semantics : 'currency-code'
    ConditionRateValueUnit : String(5);
    @sap.label : 'Unit of Measure'
    @sap.semantics : 'unit-of-measure'
    ConditionRateRatioUnit : String(3);
    @sap.unit : 'ConditionRateRatioUnit'
    @sap.label : 'Ratio'
    @sap.quickinfo : 'Condition Ratio (in Percent or Per Mille)'
    ConditionRateRatio : Decimal(24, 9);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Condition Currency'
    @sap.quickinfo : 'Condition Unit (Currency or Percentage)'
    @sap.semantics : 'currency-code'
    ConditionCurrency : String(5);
    @sap.unit : 'ConditionCurrency'
    @sap.label : 'Amount'
    @sap.quickinfo : 'Condition Amount or Percentage'
    ConditionRateAmount : Decimal(24, 9);
    @sap.label : 'Deletion Indicator'
    @sap.quickinfo : 'Deletion Indicator for Condition Record'
    ConditionScaleIsDeleted : Boolean;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.deletable : 'false'
  @sap.content.version : '1'
  @sap.label : 'Pricing Condition Validity'
  entity A_PurInfoRecdPrcgCndnValidity {
    @sap.display.format : 'UpperCase'
    @sap.label : 'Condition Record No.'
    @sap.quickinfo : 'Number of Condition Record'
    key ConditionRecord : String(10) not null;
    @sap.display.format : 'Date'
    @sap.label : 'Valid To'
    @sap.quickinfo : 'Validity end date of the condition record'
    key ConditionValidityEndDate : Date not null;
    @sap.display.format : 'Date'
    @sap.label : 'Valid From'
    @sap.quickinfo : 'Validity start date of the condition record'
    ConditionValidityStartDate : Date;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Application'
    ConditionApplication : String(2);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Condition Type'
    ConditionType : String(4);
    @sap.label : 'Order Unit'
    @sap.quickinfo : 'Purchase Order Unit of Measure'
    @sap.semantics : 'unit-of-measure'
    PurgDocOrderQuantityUnit : String(3);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Purch. Organization'
    @sap.quickinfo : 'Purchasing Organization'
    PurchasingOrganization : String(4);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Info Record Category'
    @sap.quickinfo : 'Purchasing info record category'
    PurchasingInfoRecordCategory : String(1);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Purchasing Info Rec.'
    @sap.quickinfo : 'Purchasing Info Record Number'
    PurchasingInfoRecord : String(10);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Supplier'
    @sap.quickinfo : 'Supplier''s Account Number'
    Supplier : String(10);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Material Group'
    MaterialGroup : String(9);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Material'
    @sap.quickinfo : 'Material Number'
    Material : String(40);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Plant'
    Plant : String(4);
    to_PurgInfoRecd : Association to A_PurchasingInfoRecord {  };
    to_PurgInfoRecdOrgPlantData : Association to A_PurgInfoRecdOrgPlantData {  };
    to_PurInfoRecdPrcgCndn : Association to A_PurInfoRecdPrcgCndn {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  @sap.label : 'Supplementary Pricing Conditions'
  entity A_PurInfoRecdSuplmntPrcgCndn {
    @sap.display.format : 'UpperCase'
    @sap.label : 'Condition Record No.'
    @sap.quickinfo : 'Number of Condition Record'
    key ConditionRecord : String(10) not null;
    @sap.display.format : 'NonNegative'
    @sap.label : 'Sequent. No. of Cond'
    @sap.quickinfo : 'Sequential number of the condition'
    key ConditionSequentialNumber : String(2) not null;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Application'
    ConditionApplication : String(2);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Condition Type'
    ConditionType : String(4);
    @sap.display.format : 'Date'
    @sap.label : 'Valid To'
    @sap.quickinfo : 'Valid To Date'
    ConditionValidityEndDate : Date;
    @sap.display.format : 'Date'
    @sap.label : 'Valid From'
    @sap.quickinfo : 'Valid-From Date'
    ConditionValidityStartDate : Date;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Created By'
    @sap.quickinfo : 'Name of Person Responsible for Creating the Object'
    CreatedByUser : String(12);
    @sap.display.format : 'Date'
    @sap.label : 'Created On'
    @sap.quickinfo : 'Record Creation Date'
    CreationDate : Date;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Text number'
    @sap.quickinfo : 'Number of texts'
    ConditionTextID : String(10);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Scale Type'
    PricingScaleType : String(1);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Scale Base Type'
    PricingScaleBasis : String(1);
    @sap.unit : 'BaseUnit'
    @sap.label : 'Scale Quantity'
    @sap.quickinfo : 'Condition Scale Quantity'
    ConditionScaleQuantity : Decimal(15, 3);
    @sap.label : 'Scale Unit of Meas.'
    @sap.quickinfo : 'Condition Scale Unit of Measure'
    @sap.semantics : 'unit-of-measure'
    ConditionScaleQuantityUnit : String(3);
    @sap.unit : 'ConditionRateValueUnit'
    @sap.label : 'Scale Value'
    ConditionScaleAmount : Decimal(16, 3);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Scale Currency'
    @sap.semantics : 'currency-code'
    ConditionScaleAmountCurrency : String(5);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Calculation Type'
    @sap.quickinfo : 'Calculation Type for Condition'
    ConditionCalculationType : String(1);
    @sap.unit : 'ConditionRateValueUnit'
    @sap.label : 'Condition Amount'
    @sap.quickinfo : 'Condition amount or percentage where no scale exists'
    ConditionRateValue : Decimal(12, 3);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Condition Currency'
    @sap.quickinfo : 'Condition Unit (Currency or Percentage)'
    @sap.semantics : 'currency-code'
    ConditionRateValueUnit : String(5);
    @sap.label : 'Unit of Measure'
    @sap.semantics : 'unit-of-measure'
    ConditionRateRatioUnit : String(3);
    @sap.unit : 'ConditionRateRatioUnit'
    @sap.label : 'Ratio'
    @sap.quickinfo : 'Condition Ratio (in Percent or Per Mille)'
    ConditionRateRatio : Decimal(24, 9);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Condition Currency'
    @sap.quickinfo : 'Condition Unit (Currency or Percentage)'
    @sap.semantics : 'currency-code'
    ConditionCurrency : String(5);
    @sap.unit : 'ConditionCurrency'
    @sap.label : 'Amount'
    @sap.quickinfo : 'Condition Amount or Percentage'
    ConditionRateAmount : Decimal(24, 9);
    @sap.unit : 'ConditionQuantityUnit'
    @sap.label : 'Pricing Unit'
    @sap.quickinfo : 'Condition Pricing Unit'
    ConditionQuantity : Decimal(5, 0);
    @sap.label : 'Unit of Measure'
    @sap.quickinfo : 'Condition Unit'
    @sap.semantics : 'unit-of-measure'
    ConditionQuantityUnit : String(3);
    @sap.label : 'NumeratorForConvers.'
    @sap.quickinfo : 'Numerator for converting condition units to base units'
    ConditionToBaseQtyNmrtr : Decimal(5, 0);
    @sap.label : 'Denom.for Conversion'
    @sap.quickinfo : 'Denominator for converting condition units to base units'
    ConditionToBaseQtyDnmntr : Decimal(5, 0);
    @sap.label : 'Base Unit of Measure'
    @sap.semantics : 'unit-of-measure'
    BaseUnit : String(3);
    @sap.unit : 'ConditionRateValueUnit'
    @sap.label : 'Lower limit'
    @sap.quickinfo : 'Lower limit of the condition rate/amount'
    ConditionLowerLimit : Decimal(12, 3);
    @sap.unit : 'ConditionRateValueUnit'
    @sap.label : 'Upper limit'
    @sap.quickinfo : 'Upper limit for the condition rate'
    ConditionUpperLimit : Decimal(12, 3);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Condition Currency'
    @sap.quickinfo : 'Condition Currency (for Cumulation Fields)'
    @sap.semantics : 'currency-code'
    ConditionAlternativeCurrency : String(5);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Exclusion'
    @sap.quickinfo : 'Condition exclusion indicator'
    ConditionExclusion : String(1);
    @sap.label : 'Deletion Indicator'
    @sap.quickinfo : 'Deletion Indicator for Condition Record'
    ConditionIsDeleted : Boolean;
    @sap.display.format : 'NonNegative'
    @sap.label : 'Addit. Value Days'
    @sap.quickinfo : 'Additional Value Days'
    AdditionalValueDays : String(2);
    @sap.display.format : 'Date'
    @sap.label : 'Fixed Value Date'
    FixedValueDate : Date;
    @sap.display.format : 'UpperCase'
    @sap.label : 'Terms of Payment'
    @sap.quickinfo : 'Key for Terms of Payment'
    PaymentTerms : String(4);
    @sap.display.format : 'NonNegative'
    @sap.label : 'Max.number.of.orders'
    @sap.quickinfo : 'Maximum number of sales orders per condition record'
    CndnMaxNumberOfSalesOrders : String(2);
    @sap.unit : 'BaseUnit'
    @sap.label : 'Min.cond.base value'
    @sap.quickinfo : 'Minimum condition base value'
    MinimumConditionBasisValue : Decimal(15, 3);
    @sap.unit : 'BaseUnit'
    @sap.label : 'Max.cond.base value'
    @sap.quickinfo : 'Maximum condition base value'
    MaximumConditionBasisValue : Decimal(15, 3);
    @sap.unit : 'ConditionAlternativeCurrency'
    @sap.label : 'Max.condition value'
    @sap.quickinfo : 'Maximum condition value'
    MaximumConditionAmount : Decimal(14, 3);
    @sap.display.format : 'NonNegative'
    @sap.label : 'Incremental scale'
    @sap.quickinfo : 'Number of incremental scale'
    IncrementalScale : String(4);
    @sap.display.format : 'NonNegative'
    @sap.label : 'Pricing scale'
    @sap.quickinfo : 'Scale number for pricing'
    PricingScaleLine : String(4);
    @sap.display.format : 'UpperCase'
    @sap.label : 'Release Status'
    ConditionReleaseStatus : String(1);
    to_PurgInfoPricingCndnRecdScale : Association to many A_PurInfoRecdPrcgCndnScale {  };
    to_PurInfoRecdPrcgCndn : Association to A_PurInfoRecdPrcgCndn {  };
    to_PurInfoRecdPrcgCndnValidity : Association to many A_PurInfoRecdPrcgCndnValidity {  };
  };
};

