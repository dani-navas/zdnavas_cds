@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Inner Join'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_CDs_10_DNAVAS
  as select from /dmo/travel  as Travel
    inner join   /dmo/booking as Booking on Travel.travel_id = Booking.travel_id
{
  key Travel.travel_id      as TravelId,
  key Booking.travel_id     as BookingTravelId,
      Travel.begin_date     as BeginDate,
      Travel.end_date       as EndDate,
      Booking.booking_id    as BookingId,
      Booking.flight_date   as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Booking.flight_price  as FlightPrice,
      Booking.currency_code as CurrencyCode
}
