@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Asociación con Filtro'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_CDS_16_DNAVAS
  as select from /dmo/travel as Travel
  association [0..*] to I_CurrencyText as _CurrencyText on _CurrencyText.Currency = $projection.CurrencyCode
{
  key Travel.travel_id                                                  as TravelId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Travel.total_price                                                as TotalPrice,
      Travel.currency_code                                              as CurrencyCode,
      _CurrencyText[1: Language = $session.system_language ].CurrencyName as CurrencyText
}
