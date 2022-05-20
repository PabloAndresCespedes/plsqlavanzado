declare
    id_cursor integer;
    l_rows    integer;
    
    l_codigos dbms_sql.number_table; --> table of number index by pls_integer
    l_esp     dbms_sql.varchar2_table;
begin
    l_codigos(1) := 10;
    l_codigos(2) := 20;
    l_codigos(3) := 30;
    
    l_esp(1):='CARDIOLOGIA';
    l_esp(2):='CLINICA';
    l_esp(3):='GINECOLOGIA';
    
    id_cursor := dbms_sql.open_cursor;
    
    dbms_sql.parse(id_cursor,
        'insert into aa values (:l_codigos, :l_esp)',
        dbms_sql.native
        );
        
    dbms_sql.bind_array(id_cursor, ':l_codigos', l_codigos);
    dbms_sql.bind_array(id_cursor, ':l_esp', l_esp);
    
    l_rows := dbms_sql.execute(id_cursor);
    
    dbms_sql.close_cursor(id_cursor);
    
end;
/

select * from aa;