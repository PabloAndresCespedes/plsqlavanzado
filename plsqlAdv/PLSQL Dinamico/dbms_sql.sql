create or replace procedure crear_tabla(in_name varchar2, in_columns varchar2)
authid current_user
is
    id_cursor integer;
    l_rows    integer;
begin
    -- asociar una zona de trabajo al cursos, devuelve un numero
    id_cursor := dbms_sql.open_cursor;
    
    dbms_sql.parse(id_cursor, 'create table '||in_name||' ('||in_columns||')', dbms_sql.native);
    
    l_rows := dbms_sql.execute(id_cursor);
    
    dbms_sql.close_cursor(id_cursor);
    
    dbms_output.put_line(l_rows);
    
end;
/

set SERVEROUTPUT on;

begin
    crear_tabla('regiones', 'cod number, datos varchar2(100)');
end;