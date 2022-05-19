declare
  l_foto bfile;
begin
    l_foto := bfilename('FICHERO', 'cliente1.jpg');
    
    dbms_lob.open(l_foto, dbms_lob.lob_readonly);
exception
  when dbms_lob.noexist_directory then
    raise_application_Error(-20000, 'El directorio no existe');
end;
/