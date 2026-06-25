CLASS zcl_query_prov_dnavas DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_rap_query_provider.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_query_prov_dnavas IMPLEMENTATION.
  METHOD if_rap_query_provider~select.

    DATA lt_result    TYPE STANDARD TABLE OF zi_cds_20_dnavas.
    DATA lt_abstract  TYPE STANDARD TABLE OF zi_cds_21_dnavas.

    TRY.

        IF io_request->is_data_requested( ).
          DATA(l_skip) = io_request->get_paging( )->get_offset( ).
          DATA(l_rows) = io_request->get_paging( )->get_page_size( ).


          SELECT FROM /dmo/travel
          FIELDS travel_id, agency_id, customer_id
          ORDER BY travel_id
          INTO TABLE @lt_result
          OFFSET  @l_skip
          UP TO @l_rows ROWS.

          IF sy-subrc = 0.
            io_response->set_total_number_of_records(  lines( lt_result ) ).
            io_response->set_data( it_data =  lt_result ).
          ENDIF.
        ENDIF.

      CATCH cx_rap_query_response_set_twic INTO DATA(l_error).

    ENDTRY.


  ENDMETHOD.

ENDCLASS.
