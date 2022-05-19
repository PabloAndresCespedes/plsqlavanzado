select * from clientes;

-- SUBSTR
select descri o, dbms_lob.substr(descri, 3, 1) x
from prueba_lob;

-- INSTR: Busca la posicion buscada
select descri o, dbms_lob.instr(descri, 'ext') x
from prueba_lob;


select * 
from clientes;