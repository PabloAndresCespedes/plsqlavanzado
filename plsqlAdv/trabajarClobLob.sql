declare 
l_text varchar2(50 char) := 'texto de prueba para rellenar';
begin
  for i in 1 .. 5 loop
     update clientes set descripcion = l_text||i where codigo = i;
  end loop;
end;
/