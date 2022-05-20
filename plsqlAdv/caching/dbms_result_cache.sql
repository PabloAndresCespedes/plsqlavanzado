-- como system
set serveroutput on;

begin
    -- si esta habilitado el cache
    dbms_output.put_line( dbms_result_cache.status );
    
    -- resumen de la memoria cache
    dbms_result_cache.memory_report;
    
    -- limpiar la memoria
    dbms_result_cache.flush;
end;
/