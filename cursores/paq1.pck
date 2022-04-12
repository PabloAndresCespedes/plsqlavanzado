create or replace package paq1 as

  -- Author  : CESPE
  -- Created : 11-Apr-22 20:19:31
  -- Purpose : curso udemy pacr
  
  type c_var is ref cursor;
  
  function get_data(
    in_c in out c_var,
    in_x number
  ) return varchar2;

end paq1;
/
create or replace package body paq1 is

  function get_data(
    in_c in out c_var,
    in_x number
  ) return varchar2 is
    personales personal_rh%rowtype;
    departamentos departamento%rowtype;
  begin
    if in_x = 1 then
      open in_c for select * from personal_rh;
      fetch in_c into personales;
      return personales.apellido;
    else
      open in_c for select * from departamento;
      fetch in_c into departamentos;
      return departamentos.descripcion;
    end if;
  end get_data;
  
end paq1;
/
