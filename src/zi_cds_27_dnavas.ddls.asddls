@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Contrato Transaccional Interfaz'
@Metadata.ignorePropagatedAnnotations: true
define  view entity ZI_CDS_27_DNAVAS
  as projection on ZI_CDS_26_DNAVAS
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
      _Travel: redirected to parent ZI_CDS_28_DNAVAS
}
