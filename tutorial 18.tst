PL/SQL Developer Test script 3.0
27
-- Created on 11-Apr-22 by CESPE 
declare 
  type cursor_var is ref cursor;
  l_one cursor_var;
  
  personales       personal_rh%rowtype;
  departamentos    departamento%rowtype;
begin
  open l_one for select * from personal_rh;
  fetch l_one into personales;
  dbms_output.put_line(a => personales.apellido);
  close l_one;
  
  open l_one for select * from departamento;
  fetch l_one into departamentos;
  dbms_output.put_line(a => departamentos.descripcion);
  close l_one;
  
  open l_one for select * from departamento;
  fetch l_one into departamentos;
  while l_one%found loop
        dbms_output.put_line(a => departamentos.descripcion);
        fetch l_one into departamentos;
  end loop;
  close l_one;
  
end;
0
0
