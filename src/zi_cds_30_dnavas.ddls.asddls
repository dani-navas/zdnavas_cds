@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Contrato Transaccional Query Child'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_CDS_30_DNAVAS as projection on  ZI_CDS_26_DNAVAS
{
    key TravelId,
    key BookingId,
    BookingDate,
    CustomerId,
    CarrierId,
    ConnectionId,
    FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    FlightPrice,
    CurrencyCode,
    /* Associations */
    _Customer,
    _Travel: redirected to parent ZI_CDS_29_DNAVAS
}
