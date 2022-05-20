create or replace procedure buscar_pac_genero(in_genero number)
is
    id_cursor integer;
    l_rows    integer;
    l_name    varchar2(255 char);
    l_ci    varchar2(255 char);
    l_last_name    varchar2(255 char);
begin
    id_cursor := dbms_sql.open_cursor;
    
    dbms_sql.parse(id_cursor, 
        'select nombre, apellido, ci from pacientes where genero_id =:in_genero',
        dbms_sql.native
        );
    
    -- carga en el cursor
    -- CURSOR, POSICION, TIPO DATO (SE USA UNA VARIABLE), TAMANIO  
    dbms_sql.define_column(id_cursor, 1, l_name, 255);
    dbms_sql.define_column(id_cursor, 2, l_last_name, 255);
    dbms_sql.define_column(id_cursor, 3, l_ci, 255);
    
    dbms_sql.bind_variable(id_cursor, ':in_genero', in_genero);
    
    l_rows := dbms_sql.execute(id_cursor);
    
    loop
        if dbms_sql.fetch_rows(id_cursor) = 0 then
            exit;
        else
            -- carga dentro de la variable el valor que esta en el cursor
            dbms_sql.column_value(id_cursor, 1, l_name);
            dbms_sql.column_value(id_cursor, 2, l_last_name);
            dbms_sql.column_value(id_cursor, 3, l_ci);
            
            dbms_output.put_line(l_name||', '||l_last_name||' con CI '||l_ci);
        end if;
    end loop;
    
    dbms_sql.close_cursor(id_cursor);
    
end;
/

set serveroutput on;

begin
    buscar_pac_genero(4);
end;