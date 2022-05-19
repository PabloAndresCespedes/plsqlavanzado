create or replace package sobrecarga as
    function concatenar(a varchar2, b varchar2) return varchar2;
    function concatenar(a number, b number) return number;
    function concatenar(a date, b number) return date;
end;
/

create or replace
package body sobrecarga as

  function concatenar(a varchar2, b varchar2) return varchar2 as
  begin
    -- todo: implementation required for function sobrecarga.concatenar
    return a||' '||b;
  end concatenar;

  function concatenar(a number, b number) return number as
  begin
    -- todo: implementation required for function sobrecarga.concatenar
    return a+b;
  end concatenar;

  function concatenar(a date, b number) return date as
  begin
    -- todo: implementation required for function sobrecarga.concatenar
    return a+b;
  end concatenar;

end sobrecarga;
/

select sobrecarga.concatenar('hello', 'world') x from dual;
select sobrecarga.concatenar(1, 2) x from dual;
select sobrecarga.concatenar(sysdate, 3) x from dual;

