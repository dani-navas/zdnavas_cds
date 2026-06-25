@EndUserText.label: 'CDS Custom Entity'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_QUERY_PROV_DNAVAS'
define custom entity ZI_CDS_20_DNAVAS
  // with parameters parameter_name : parameter_type
{
  key travel_id   : /dmo/travel_id;
      agency_id   : /dmo/agency_id;
      customer_id : /dmo/customer_id;

}
