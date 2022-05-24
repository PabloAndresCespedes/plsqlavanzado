-- como system
select * from v$result_cache_statistics r;

-- limpiar cache 
execute dbms_result_cache.flush;

-- lista de cache
select *
from v$result_cache_objects o
where o.cache_id = '7rjwu0tkj7dnj7ks9hrvyqquzy';

select * from table(dbms_xplan.display_cursor(sql_id=>'c5wzs1r6pd0zq', format=>'ALLSTATS LAST'));
