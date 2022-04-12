PL/SQL Developer Test script 3.0
10
-- Created on 11-Apr-22 by CESPE 
declare 
  l_nominas paq_cursor.c_nomina;
  l_media   number;
begin
  -- Test statements here
  open l_nominas for select * from nomina n where n.fecha_vigencia <= current_Date and nvl(n.monto_salario, 0) > 0;
  l_media := paq_cursor.media_salario(in_personal_nomina => l_nominas);
  dbms_output.put_line('La media de los salarios del SAH es: '||round(l_media, 0));
end;
0
0
