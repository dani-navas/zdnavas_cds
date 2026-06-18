@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Asociación'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_CDS_15_DNAVAS
  as select from /dmo/travel as Travel
  association [1..1] to /dmo/booking  as _Booking  on _Booking.customer_id = $projection.CustomerId  //Travel.customer_id
  association [1..1] to /dmo/customer as _Customer on _Customer.customer_id = $projection.CustomerId //Travel.customer_id
  association [0..*] to /dmo/agency   as _Agency   on _Agency.agency_id = $projection.AgencyId //Travel.agency_id
{

  key Travel.customer_id as CustomerId,
      Travel.begin_date  as BeginDate,
      Travel.agency_id   as AgencyId,
      _Customer,
      _Agency,
      _Booking
}
