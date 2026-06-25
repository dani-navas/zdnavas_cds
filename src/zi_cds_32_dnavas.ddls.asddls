@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Cube'
@Metadata.ignorePropagatedAnnotations: true

@Analytics.dataCategory: #CUBE
define view entity ZI_CDS_32_DNAVAS
  as select from zso_dnavas as SalesOrder
  association [0..1] to ZI_CDS_31_DNAVAS as _Currency on _Currency.Currency = $projection.CurrencySum
{
  key SalesOrder.so_key           as SoKey,
      SalesOrder.lifecycle_status as LifecycleStatus,
      SalesOrder.company_code     as CompanyCode,

      @DefaultAggregation: #SUM
      @Semantics.amount.currencyCode: 'CurrencySum'
      SalesOrder.amount_sum       as AmountSum,
      
            
      @ObjectModel.foreignKey.association: '_Currency'
      currency_sum                as CurrencySum,
      
      @DefaultAggregation: #SUM
      @Semantics.quantity.unitOfMeasure: 'UomSum'
      SalesOrder.quantity_sum     as QuantitySum,
      SalesOrder.uom_sum          as UomSum,

       @DefaultAggregation: #NONE
      create_by                   as CreateBy,
      create_on                   as CreateOn,
      _Currency
}
