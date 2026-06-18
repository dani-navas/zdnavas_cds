@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Asociación con Parámeters'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_cDS_13_DNAVAS
  with parameters
    p_CountryCode : land1
  as select from /dmo/agency
{
  key agency_id             as AgencyId,
      name                  as Name,
      street                as Street,
      postal_code           as PostalCode,
      city                  as City,
      country_code          as CountryCode,
      phone_number          as PhoneNumber,
      email_address         as EmailAddress,
      web_address           as WebAddress,
      attachment            as Attachment,
      mime_type             as MimeType,
      filename              as Filename,
      local_created_by      as LocalCreatedBy,
      local_created_at      as LocalCreatedAt,
      local_last_changed_by as LocalLastChangedBy,
      local_last_changed_at as LocalLastChangedAt,
      last_changed_at       as LastChangedAt,
      dummy_field           as DummyField,
      /dmo/zzsloganzag

}
where
  country_code = $parameters.p_CountryCode
