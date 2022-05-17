create or replace function tam_img(in_directory in varchar2,
                                   in_codigo    in number
                                   ) return number is
  l_r       number;
  l_fichero varchar2(100);
  l_foto    bfile;
begin
  l_fichero := 'cliente1.jpg';
  l_foto    := bfilename(directory => in_directory, filename => l_fichero);
  
  if dbms_lob.fileexists(file_loc => l_foto) = 1 then
    l_r := dbms_lob.getlength(l_foto);
  else
    l_r := 0;  
  end if;
  
  return l_r;
  
end tam_img;
/
