alter session set plsql_code_type = 'INTERPRETED';
/

alter session set plsql_code_type = 'NATIVE';
/
SET SERVEROUTPUT ON
create or replace procedure n1 as
    v varchar2(1000) := 'A';
    x date;
    z varchar2(1000);
begin
    dbms_output.put_line(to_char(sysdate, 'mi:ss'));
    for i in 1 .. 100000000 loop
        for x in 1 .. 15 loop
            v:='A'||substr('AAAAAA',1,5);
        end loop;
    end loop;
    dbms_output.put_line(to_char(sysdate, 'mi:ss'));
end;
/

select * from user_plsql_object_settings where name like 'N1';
/

execute n1;
