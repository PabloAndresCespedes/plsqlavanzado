/*
create table nom(v1 number, v2 varchar2(100));
*/
create or replace procedure crear_tabla(in_name varchar2, in_columns varchar2)
authid current_user 
/*
  Options for Authid:
  * current_user: la persona que llama el procedimiento
  * definer: la persona que creo el procedimiento
*/ 
as
l_sql varchar2(255 char);
begin
    l_sql := 'create table '||in_name||'('||in_columns||')';
    dbms_output.put_line(l_sql);
    execute immediate l_sql;
    
end crear_tabla;
/

begin
  crear_tabla('td', 'v1 number, v2 varchar2(100)');
end;
/
set serveroutput on;

insert into td values(1, 'd1');
insert into td values(2, 'd2');
insert into td values(3, 'd3');

create or replace function sample_dml(in_where varchar2)
return number
authid current_user
is
 l_sql varchar2(100);
 l_row number;
begin
    l_sql := 'delete from td where '||in_where;
    dbms_output.put_line(l_sql);
    
    execute immediate l_sql;
    
    l_row := sql%rowcount;
    
    return l_row;
end sample_dml;
/

select * from td;

declare
  l_where varchar2(400);
begin
    l_where := 'v1 = 2 or lower(v2) = ''d3''';
    dbms_output.put_line('Se eliminaron '||sample_dml(l_where)||' filas');
end;
/

select * from td;