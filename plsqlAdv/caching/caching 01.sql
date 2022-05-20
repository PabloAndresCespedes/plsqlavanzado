show parameter cache;
select name, value from v$parameter where name like '%cache%';

-- TAMANIO CACHE
ALTER SYSTEM SET RESULT_CACHE_MAX_SIZE=100M;

-- result_cache_max_size: tamanio max de la zona de resultados
-- result_cache_mode: forma de activar
-- result_cache_max_result: % max que un comando usara para cache

/*
  TIPOS MODOS
   MANUAL
   FORCE (NO SIEMPRE ES ADECUADO)
*/
ALTER SYSTEM SET RESULT_CACHE_MODE='MANUAL'
