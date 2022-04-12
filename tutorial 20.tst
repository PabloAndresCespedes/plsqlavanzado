PL/SQL Developer Test script 3.0
16
-- Created on 11-Apr-22 by CESPE 
declare 
  type c1 is ref cursor return departamento%rowtype;
  
  l_one c1;
  l_dep departamento%rowtype;
begin
  open l_one for select * from departamento d where d.descripcion like 'SAMA%';
  fetch l_one into l_dep;
  while l_one%found loop
        dbms_output.put_line(a => l_dep.descripcion);
        fetch l_one into l_dep;
  end loop;
  close l_one;
  
end;
0
0
