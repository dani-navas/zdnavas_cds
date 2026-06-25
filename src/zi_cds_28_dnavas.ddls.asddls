@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Contrato Transaccional Interfaz Root'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_CDS_28_DNAVAS
  provider contract transactional_interface
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
      _Booking: redirected to composition child ZI_CDS_27_DNAVAS,
      _Customer
}
