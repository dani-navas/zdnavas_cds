@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Asociación'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_CDS_17_DNAVAS
  as select from /dmo/travel as Travel
  association [1..1] to /dmo/booking  as _Booking  on _Booking.customer_id = $projection.CustomerId  //Travel.customer_id
  association [1..1] to /dmo/customer as _Customer on _Customer.customer_id = $projection.CustomerId //Travel.customer_id
{

  key Travel.customer_id                                                              as CustomerId,
      Travel.begin_date                                                               as BeginDate,
      _Booking[inner].flight_date                                                         as FlightDate, 
      concat_with_space( _Customer[inner].first_name, _Customer[inner].last_name, 2 ) as CustomerName

}
