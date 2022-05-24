create or replace procedure DEBUGPLSQL
as
    l_n number := 0;
begin
  dbms_output.put_line(l_n);
  select count(1) into l_n
  from pacientes;
  dbms_output.put_line(l_n);
end;
/

set serveroutput on;

alter procedure DEBUGPLSQL compile debug;

alter procedure DEBUGPLSQL compile;
-- inicia trace de todos los obj en debug
execute dbms_trace.set_plsql_trace( dbms_trace.trace_enabled_sql + dbms_trace.trace_enabled_calls );

-- ejecuto el proceso
execute DEBUGPLSQL;

-- finaliza el trace
execute dbms_trace.clear_plsql_trace;

select * from plsql_trace_events where event_unit='DEBUGPLSQL';


