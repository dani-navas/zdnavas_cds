@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Travel'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType: {
        serviceQuality: #X,
        sizeCategory: #S,
        dataClass: #MIXED
    }
//@ObjectModel.semanticKey: [ 'ID', 'CONEXION', 'FECHA_VUELO' ]
define view entity ZI_CDs_01_DNAVAS
  as select from /dmo/flight
{
  key carrier_id                             as ID,
  key connection_id                          as Conexion,
  key flight_date                            as Fecha_Vuelo,
      @Semantics.amount.currencyCode: 'MONEDA'
      @EndUserText.label: 'Price'
      price                                  as precio,
      currency_code                          as moneda,

      'USD'                                  as mon_doc,

      '20260614'                             as fecha,
      cast( '20260614' as abap.dats )        as fecha_actual,

      1.2                                    as numerofloat,
      fltp_to_dec( 1.2 as abap.dec( 2, 2 ) ) as num_float 

//       cast( 'E' as abap.lang )   as idioma

}
