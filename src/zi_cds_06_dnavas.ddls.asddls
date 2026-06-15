@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Fn. Agregación'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_CDs_06_DNAVAS
  as select from ZI_CDs_07_DNAVAS
{

  key travel_id                               as TravelId,
  key agency_id                               as Agencyid,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      min( total_price )                      as MinTotalPrice,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      max( total_price )                      as MaxTotalPrice,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      sum( total_price )                      as SumTotalPrice,
      count( distinct total_price )           as CountTotalPrice,
      count( * )                              as AllTotalPrice,
      avg( total_price as abap.dec( 16, 2 ) ) as AvgTotalPrice,
      currency_code                           as CurrencyCode

}
group by
  travel_id,
  agency_id,
  currency_code;
