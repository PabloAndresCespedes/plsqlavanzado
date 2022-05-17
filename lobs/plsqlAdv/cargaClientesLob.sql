create or replace procedure carga_clientes
is
  cursor cli is select * from clientes for update;
  l_fichero varchar2(100);
begin
  for i in cli loop
     l_fichero := 'cliente'||i.codigo||'.jpg';
     
     update clientes c
     set  c.foto = bfilename('FICHEROS', l_fichero),
          c.longitud = tam_img(in_directory=>'FICHEROS',in_codigo=>i.codigo)
     where current of cli;
  end loop;
  
end;