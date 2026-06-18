CLASS zcl_execcds_dnavas DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_execcds_dnavas IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*Query con Path Expression
    SELECT FROM zi_cds_19_dnavas AS Agency
    FIELDS Agency~AgencyId,
           Agency~City,
           Agency~street,
           \_Travel-TravelId,
           \_Travel\_Customer-customer_id,
           concat_with_space( \_Travel\_Customer-first_name, \_Travel\_Customer-last_name, 1  ) AS CustomerName
     WHERE Agency~CountryCode = 'US'
     INTO TABLE @DATA(lt_table).

    OUT->WRITE( LT_TABLE ).

  ENDMETHOD.
ENDCLASS.
