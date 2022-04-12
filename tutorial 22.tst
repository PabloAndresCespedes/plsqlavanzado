PL/SQL Developer Test script 3.0
22
-- Created on 11-Apr-22 by CESPE 
declare 
  type c_var is ref cursor return personal_rh%rowtype;
  
  l_one c_var;
  l_two c_var;
  
  empleados personal_rh%rowtype;
  
begin
  open l_one for select * from personal_rh p order by p.apellido;
  fetch l_one into empleados;
  dbms_output.put_line('l_one: '||empleados.apellido||', '||empleados.nombre);
  
  l_two := l_one;
  
  fetch l_two into empleados;
  dbms_output.put_line('l_two: '||empleados.apellido ||', '||empleados.nombre);
  
  close l_one;
  
end;
0
0
