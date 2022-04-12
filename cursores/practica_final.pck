create or replace package paq_cursor is

  -- Author  : CESPE
  -- Created : 11-Apr-22 21:11:22
  -- Purpose : udemy curso pacr
  
  -- creo el cursor tipado
  type c_nomina is ref cursor return nomina%rowtype;
  
  -- cabecera paquete utilizando el tipo ref cursor C_NOMINA
  function media_salario(
    in_personal_nomina c_nomina
  )return number;

end paq_cursor;
/
create or replace package body paq_cursor is

  function media_salario(
    in_personal_nomina c_nomina
  )return number is
   l_salario number  := 0;
   l_media   number  := 0;
   l_num_emp integer := 0;
   l_nomina  nomina%rowtype;
  
  begin
    <<conteo>>
    loop
      -- obtener primer reg del en la posicion del loop
      fetch in_personal_nomina into l_nomina;
      
      -- salir del bucle si no hay datos
      exit when in_personal_nomina%notfound;
      
      -- sumar el valor anterior del salario con el nuevo monto
      l_salario := l_salario + l_nomina.monto_salario;
      
      -- contar la cantidad de empleados
      l_num_emp := l_num_emp + 1;
      
    end loop conteo;
    
    -- media: dividir total salarios por numero de empleados
    l_media := l_salario / l_num_emp;
    
    return l_media;
    
  end media_salario;
  
end paq_cursor;
/
