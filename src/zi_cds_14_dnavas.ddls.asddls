@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Asociación con Parámeters'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_cDS_14_DNAVAS
  with parameters
    p_CountryCode : land1
  as select from /dmo/travel as Travel
  association [1..1] to ZI_cDS_13_DNAVAS as _Agency on _Agency.AgencyId = $projection.TravelAgencyId
{

  key Travel.agency_id                                                as TravelAgencyId,
  key Travel.customer_id                                              as CustomerId,
      _Agency( p_CountryCode: $parameters.p_CountryCode ).City        as City,
      _Agency( p_CountryCode: $parameters.p_CountryCode ).CountryCode as CountryCode

}
