create or replace function estados_cache(in_estado number)
return varchar2 
result_cache relies_on (estados)
is
l_r varchar2(255);
begin
    select e.descripcion
    into l_r
    from estados e
    where e.id = in_estado;
    
    return l_r;
end estados_cache;

select c.estado_id, estados_cache(in_estado => c.estado_id) x
from cuentas_por_paciente c;