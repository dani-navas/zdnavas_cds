@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS VDM Virtual Data Model'
@Metadata.ignorePropagatedAnnotations: true

@Search.searchable: true
@VDM.viewType: #BASIC
define view entity ZI_CDS_31_DNAVAS
  as select from I_Currency
  association [0..*] to I_CurrencyText as _Text on _Text.Currency = $projection.Currency
{
  key Currency,
      Decimals,
      
      @Search.defaultSearchElement: true
      @Search.ranking: #HIGH
      @Search.fuzzinessThreshold: 0.8
      CurrencyISOCode,
      AlternativeCurrencyKey,
      IsPrimaryCurrencyForISOCrcy,
      
      /* Associations */
      _Text
}
