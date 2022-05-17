PL/SQL Developer Test script 3.0
9
-- Created on 16-May-22 by CESPE 
declare
  l_foto bfile;
begin
  l_foto := bfilename( directory => 'FICHEROS', filename => 'runJsExample.png' );
  
  insert into ss_img(codigo, foto) values (1, l_foto);
  
end;
0
0
