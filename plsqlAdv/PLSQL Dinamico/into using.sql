create or replace function numArt(in_iva number, in_user varchar2)
return number
is
 l_sql varchar2(255);
 l_can number;
begin
    l_sql := 'select count(1) x from articulos where iva_id = :in_iva and user_web = :in_user';
    execute immediate l_sql into l_can using in_iva, in_user;
    
    return l_can;
end numArt;
/

set serveroutput on;

declare
    l_iva number;
    l_user varchar2(100);
begin
    l_iva := 2;
    l_user := 'ADMIN';
    dbms_output.put_line('Articulos con IVA_ID '||l_iva||' del usuario '||l_user||': '||numArt(in_iva => l_iva, in_user => l_user)||' registro/s');
end;