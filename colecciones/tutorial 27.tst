PL/SQL Developer Test script 3.0
28
-- Created on 11-Apr-22 by CESPE 
declare 
  -- tipo de tabla
  type departamentos is table of departamento.descripcion%type index by pls_integer;
    
  -- asignar el tipo   
  l_dep departamentos;
  
  type personales is table of personal_rh%rowtype index by pls_integer;
       
  l_emp personales;
  
  type nombres is table of personal_rh.nombre%type index by varchar2(2);
  
  l_name nombres;
begin
  -- Test statements here
  l_dep(1)  := 'DATA1';
  l_dep(2)  := 'DATA2';
  l_dep(50) := 'DATA50';
  l_dep(-10) := 'DATA-10';
  
  l_name('AA') := 'PABLO';
  
  dbms_output.put_line(l_dep(2)||' '||l_dep(50)||' '||l_dep(1)||' '||l_dep(-10));
  dbms_output.put_line(l_name('AA'));
  
end;
0
0
