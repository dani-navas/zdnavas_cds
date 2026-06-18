@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Asociación Nav. con Path Express'
@Metadata.ignorePropagatedAnnotations: true 
/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ]  } */
define view entity ZI_CDS_19_DNAVAS
  as select from /dmo/agency
    association [1..1] to ZI_CDS_18_DNAVAS as _Travel on _Travel.AgencyId = $projection.AgencyId
{
  key agency_id    as AgencyId,
      name         as Name,
      street       as Street,
      postal_code  as PostalCode,
      city         as City,
      country_code as CountryCode,
      _Travel
}
