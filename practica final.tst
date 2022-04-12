PL/SQL Developer Test script 3.0
16
-- Created on 11-Apr-22 by CESPE 
declare 
  empleados sys_refcursor;
  salario number;
  nominas  nomina%rowtype;
  
begin
  salario := 2289324;
  empleados := personal_sueldo(salario);
  
  loop
    fetch empleados into nominas;
    dbms_output.put_line('CODIGO PERSONAL: '||nominas.personal_r_id_personal_rh||' SALARIO: '||nominas.monto_salario);
    exit when empleados%notfound;
  end loop;
end;
0
0
