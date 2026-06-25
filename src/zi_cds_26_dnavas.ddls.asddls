@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Association to Parent'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_CDS_26_DNAVAS
  as select from /dmo/booking as Booking
  association        to parent ZI_CDS_25_DNAVAS as _Travel   on _Travel.TravelId = $projection.TravelId
  association [1..1] to /DMO/I_Customer         as _Customer on _Customer.CustomerID = $projection.CustomerId
{
  key Booking.travel_id     as TravelId,
  key Booking.booking_id    as BookingId,
      Booking.booking_date  as BookingDate,
      Booking.customer_id   as CustomerId,
      Booking.carrier_id    as CarrierId,
      Booking.connection_id as ConnectionId,
      Booking.flight_date   as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Booking.flight_price  as FlightPrice,
      Booking.currency_code as CurrencyCode,
      _Travel,
      _Customer
}
