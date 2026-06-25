@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Contrato Transaccional Query Root'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_CDS_29_DNAVAS
  provider contract transactional_query
  as projection on ZI_CDS_25_DNAVAS
{
  key TravelId,
      AgencyId,
      CustomerId,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      CurrencyCode,
      Description,
      Status,
      Createdby,
      Createdat,
      Lastchangedby,
      Lastchangedat,
      /* Associations */
      _Agency,
      _Booking: redirected to composition child ZI_CDS_30_DNAVAS,
      _Customer
}
