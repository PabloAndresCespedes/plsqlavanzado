declare
  cursor cli is select * from clientes for update;
  l_temp clob;
  l_cant integer := 5;
  l_pos  integer  := 1;
begin
   for c1 in cli loop
     -- abrir fichero
     dbms_lob.open(c1.descripcion, dbms_lob.lob_readonly);
     
     -- leer desde la posicion de nuestro campo descripcion y lo dejamos en la variable temp
     dbms_lob.read(c1.descripcion, l_cant, l_pos, l_temp);
     
     -- insert
     insert into prueba_lob values(l_temp);
     
     --cierre lob
     dbms_lob.close(c1.descripcion);
   end loop;
end;
/