create or replace procedure carga_comentarios
is
  cursor cli is select * from clientes for update;
  l_fichero varchar2(100);
  l_comentario bfile;
  l_temporal   blob;
begin
  for i in cli loop
     l_fichero := 'comentario'||i.codigo||'.txt';
     
     l_comentario := bfilename('FICHEROS', l_fichero);
     
     -- abrir fichero
     dbms_lob.open(l_comentario, dbms_lob.lob_readonly);
     
     -- crear temporal
     dbms_lob.createtemporary(l_temporal, true);
     
     -- cargar fichero a la variable temp
     dbms_lob.loadfromfile( l_temporal, l_comentario, dbms_lob.getlength(l_comentario));
     
     -- actualiza registro
     update clientes c
     set  c.comentarios = l_temporal where current of cli;
     
     -- cerrar fichero
     dbms_lob.close(l_comentario);
     
  end loop;
  
end;