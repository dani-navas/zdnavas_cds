CLASS zcl_execute_dnavas DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_execute_dnavas IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    MODIFY zempleado_dnavas FROM TABLE @( VALUE #( ( empleado = '1'  manager =  ''   nombre_empleado = 'Empleado 1' )
                                                   ( empleado = '2'  manager =  '1'  nombre_empleado = 'Empleado 2' )
                                                   ( empleado = '3'  manager =  '1'  nombre_empleado = 'Empleado 3' )
                                                   ( empleado = '4'  manager =  ''   nombre_empleado = 'Empleado 4' )
                                                   ( empleado = '5'  manager =  '2'  nombre_empleado = 'Empleado 5' )
                                                   ( empleado = '6'  manager =  '4'  nombre_empleado = 'Empleado 6' )
                                                   ( empleado = '7'  manager =  ''   nombre_empleado = 'Empleado 7' )
                                                   ( empleado = '8'  manager =  '9'  nombre_empleado = 'Empleado 8' )
                                                   ( empleado = '9'  manager =  '8'  nombre_empleado = 'Empleado 9' )
                                                   ( empleado = '10' manager =  '1'  nombre_empleado = 'Empleado 10' ) ) ) .


  ENDMETHOD.
ENDCLASS.
