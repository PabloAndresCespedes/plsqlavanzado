PL/SQL Developer Test script 3.0
15
-- Created on 11-Apr-22 by CESPE 
declare 
  l_one sys_refcursor;
  
  departamentos departamento%rowtype;
begin
  open l_one for select * from departamento order by 1;
  fetch l_one into departamentos;
  while l_one%found loop
    dbms_output.put_line(departamentos.descripcion);
    fetch l_one into departamentos;
  end loop;
  close l_one;
  
end;
0
0
