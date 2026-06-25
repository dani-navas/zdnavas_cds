@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'CDS Modelo Jerárquico'
@Metadata.ignorePropagatedAnnotations: true
/*+[hideWarning] { "IDS" : [ "KEY_CHECK" ]  } */
define view entity ZI_cDS_22_DNAVAS
  as select from zempleado_dnavas
  association [0..1] to ZI_cDS_22_DNAVAS as _Manager on _Manager.Empleado = $projection.Manager 
{
  empleado        as Empleado,
  manager         as Manager,
  nombre_empleado as Nombre_Empleado, 
  _Manager

}
