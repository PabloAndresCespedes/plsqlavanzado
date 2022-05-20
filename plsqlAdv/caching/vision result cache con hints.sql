-- COMO SYSTEM
execute dbms_result_cache.memory_report;

-- limpiar cache
execute dbms_result_cache.flush;

-- USUARIO NORMAL 
select /*+ RESULT_CACHE */ AVG(ID)
FROM SG.PACIENTES;

SELECT /*+ RESULT_CACHE */ *
FROM SG.PACIENTES;