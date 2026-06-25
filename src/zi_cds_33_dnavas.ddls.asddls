@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'CDS Transcient View Entity'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [#ANALYTICAL_QUERY]
define transient view entity ZI_CDS_33_DNAVAS
  provider contract analytical_query
  as projection on ZI_CDS_32_DNAVAS
{
  @AnalyticsDetails.query.axis: #FREE
  SoKey                             as SalesOrderKey,

  @AnalyticsDetails.query.axis: #ROWS
  LifecycleStatus,

  @AnalyticsDetails.query.axis: #COLUMNS
  QuantitySum,
  UomSum,

  @ObjectModel.text.element: [ 'CurrencyName' ]
  CurrencySum,
  _Currency._Text.CurrencyName      as CurrencyName : localized,

  @Aggregation.default: #FORMULA  
  cast( '0.05' as abap.decfloat34 ) as Discount,
  
  @Aggregation.default: #FORMULA  
  @Semantics.quantity.unitOfMeasure: 'AmperQuantity'
  curr_to_decfloat_amount( AmountSum ) / $projection.quantitysum  as AmountperQuantity,
  
  virtual AmperQuantity : dd_cds_calculated_unit,  
  
  @Aggregation.default: #FORMULA
  @Semantics.amount.currencyCode: 'TargetCurrency'
  currency_conversion( amount => curr_to_decfloat_amount( AmountSum ) , 
                       source_currency => CurrencySum, 
                       target_currency => abap.cuky'EUR', 
                       exchange_rate_date => CreateOn )  as ConvertedAmount,
  
  virtual TargetCurrency : abap.cuky  
 
}
