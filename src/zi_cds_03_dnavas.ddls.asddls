@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Variables del Sistema'
@Metadata.ignorePropagatedAnnotations: true


//@ClientHandling.algorithm: #SESSION_VARIABLE no se usa porque automaticamente ya lo hace la cds
define view entity ZI_CDs_03_DNAVAS
  as select from /dmo/customer
{

  customer_id              as ClienteID,
  //    $session.bs_instance_id AS BS_INSTANCE NO SE PUEDE USAR
  //    $session.bs_zone_id AS BS_ZONE NO SE PUEDE USAR
  $session.client          as mandante,
  $session.system_date     as Fecha_sistema,
  $session.system_language as idioma,
  $session.user            as usuario_sap,
  $session.user_date       as fecha_usuario,
  $session.user_timezone   as zona_horario
}
