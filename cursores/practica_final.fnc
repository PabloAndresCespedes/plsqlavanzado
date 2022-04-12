create or replace function personal_sueldo(in_salario in number) return sys_refcursor is
  type c_nominas is ref cursor return nomina%rowtype;
  empleado c_nominas;
begin
  open empleado for select * from nomina n
                    where nvl(n.monto_salario, 0) = in_salario
                    and nvl(n.fecha_vigencia, current_date+1) <= current_date;
  return empleado;
end personal_sueldo;
/
