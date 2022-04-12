PL/SQL Developer Test script 3.0
6
-- Created on 11-Apr-22 by CESPE 
declare 
  l_data paq1.c_var;
begin
  dbms_output.put_line(paq1.get_data(in_c => l_data, in_x => 2));
end;
0
0
