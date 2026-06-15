@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Case'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_CDs_02_DNAVAS
  as select from /dmo/customer
{
  key customer_id as Cliente_id,
  key first_name  as Nombre,
  key last_name   as Apellido_1,

      case country_code
       when 'US' then concat_with_space( 'United State', concat_with_space( customer_id, $session.system_date, 2  ), 1 )
       when 'ES' then 'Spain'
       when 'DE' then 'Germany'
      else  'S/N'
      end         as case1,

      case
      when substring( first_name, 1, 1 ) = 'J'   then case title
                                                    when 'Mr.' then  concat( 'Mr.', last_name )
                                                    end
      when  cast( '20251231' as abap.dats ) < dats_add_days( $session.system_date, -30, 'NULL' ) then  $session.system_date
      else 'No aplica'
      end         as case2
}
