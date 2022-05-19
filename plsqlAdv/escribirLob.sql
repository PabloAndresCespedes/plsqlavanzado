create table prueba_log1(empleado clob);
/

create or replace procedure escribir_clob
is 
  cursor usuarios is select * from usuarios;
  l_temp clob;
  l_cant integer;
  l_name varchar2(100);
begin
  for i in usuarios loop
    -- crear lob temporal
    dbms_lob.createtemporary(l_temp, true);
    
    -- abrir lob para escribir
    dbms_lob.open(l_temp, dbms_lob.lob_readwrite);
    
    -- concatena valor
    l_name := i.nombre ||' '|| i.apellido;
    
    -- calc. longitud de la variable
    l_cant := length(l_name);
    
    -- escribir el lob con los datos
    dbms_lob.write(l_temp, l_cant, 1, l_name);
    
    -- insertar dato
    insert into prueba_log1 values(l_temp);
    
    -- cerrar fichero
    dbms_lob.close(l_temp);
  end loop;
end;
/

execute escribir_clob;
/

select * from prueba_log1;