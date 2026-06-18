@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Asociación Nav. con Path Express'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_CDS_18_DNAVAS
  as select from /dmo/travel as Travel
  association [1..1] to /dmo/agency as _Agency on _Agency.agency_id = $projection.AgencyId
  association [1..1] to /dmo/customer as _Customer on _Customer.customer_id = $projection.CustomerId
{
  key Travel.travel_id as TravelId,
      Travel.agency_id as AgencyId,
      customer_id      as CustomerId,
      begin_date       as BeginDate,
      end_date         as EndDate,
      _Agency,
      _Customer
}
