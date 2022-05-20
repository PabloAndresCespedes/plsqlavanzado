create or replace function buscar_pac(in_id number)
return varchar2
is
    id_cursor integer;
    l_rows    integer;
    l_name    varchar2(255 char);
begin
    id_cursor := dbms_sql.open_cursor;
    
    dbms_sql.parse(id_cursor, 
        'select nombre, ci from pacientes where id =:in_id',
        dbms_sql.native
        );
    
    -- carga en el cursor
    -- CURSOR, POSICION, TIPO DATO (SE USA UNA VARIABLE), TAMANIO  
    dbms_sql.define_column(id_cursor, 1, l_name, 255);
    
    dbms_sql.bind_variable(id_cursor, ':in_id', in_id);
    
    l_rows := dbms_sql.execute(id_cursor);
    
    if dbms_sql.fetch_rows(id_cursor) = 0 then
        return 'No existe el paciente con el ID '||in_id;
    else
        -- carga dentro de la variable el valor que esta en el cursor
        dbms_sql.column_value(id_cursor, 1, l_name);
    end if;
    
    dbms_sql.close_cursor(id_cursor);
    
    return l_name;
end;
/

set serveroutput on;

begin
    dbms_output.put_line(buscar_pac(181127));
end;