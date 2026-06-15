@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Conversión Importe'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_CDs_08_DNAVAS
    with parameters 
    pfromcurrency : abap.cuky,
    ptocurrency : abap.cuky
  as select from /dmo/travel
{

  key travel_id                                                  as TravelId,

      @Semantics.amount.currencyCode: 'OrigCurrencyCode'
      total_price                                                as OrigTotalPrice,
      currency_code                                              as OrigCurrencyCode,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion( amount             => total_price,
                           source_currency    => currency_code,
                           target_currency    => cast( 'USD' as abap.cuky ),
                           exchange_rate_date => $session.system_date,
                           CLIENT             => $session.client,
                           error_handling     => 'SET_TO_NULL' ) as CurrencyConv,
      cast( 'USD' as abap.cuky )                                 as CurrencyCode

} where currency_code = 'EUR';
