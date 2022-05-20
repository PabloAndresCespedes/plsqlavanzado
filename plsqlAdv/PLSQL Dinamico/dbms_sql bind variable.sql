create table aa  as select * from especialidades;
/

select * from aa;
/

create or replace procedure upd_column(in_table varchar2, in_column varchar2, in_val_old varchar2, in_val_new varchar2)
authid current_user
is
    id_cursor integer;
    l_rows    integer;
begin
    id_cursor := dbms_sql.open_cursor;
    
    dbms_sql.parse(id_cursor,
                   'update '||in_table||' set '||in_column||'=:in_val_new where '||in_column||'=:in_val_old',
                   dbms_sql.native
                 );
    
    dbms_sql.bind_variable(id_cursor, ':in_val_old', in_val_old);
    dbms_sql.bind_variable(id_cursor, ':in_val_new', in_val_new);
    
    l_rows := dbms_sql.execute(id_cursor);
    
    dbms_sql.close_cursor(id_cursor);
    
    dbms_output.put_line(l_rows);
end;
/

set serveroutput on;

delete from aa;
begin
    upd_column(in_table=>'AA',in_column=>'DESCRIPCION',in_val_old=>'CARDIOLOGIA',in_val_new=>'CARDIO');
end;
