@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Conversión Cantidad'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_CDs_09_DNAVAS
  with parameters
    PFROMUNIT     : abap.unit( 3 ),
    PTOUNIT       : abap.unit( 3 ),
    @Environment.systemField: #SYSTEM_DATE
    pdocumentdate : abap.dats
  as select from zqfty_dnavas
{

  key product                                               as Product,
      @Semantics.quantity.unitOfMeasure: 'OrigUnit'
      quantity                                              as OrigQuantity,
      unit                                                  as OrigUnit,

      @Semantics.quantity.unitOfMeasure: 'UnitConv'
      unit_conversion( quantity => quantity,
                       source_unit => $parameters.PFROMUNIT,
                       target_unit => $parameters.PTOUNIT ) as QuantityConv,
      $parameters.PTOUNIT                                   as UnitConv

}
where
  unit = $parameters.PFROMUNIT;
