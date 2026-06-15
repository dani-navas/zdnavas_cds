@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS AVG Type Connection'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_CDs_07_DNAVAS
  as select from /dmo/travel
{
  key travel_id,
  key agency_id,                               
      cast( total_price as abap.dec( 16, 2 ) ) as total_price,
      currency_code     
}
