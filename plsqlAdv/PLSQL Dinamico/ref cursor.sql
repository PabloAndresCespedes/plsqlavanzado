-- CURSOR
declare
    -- crear tipo
    type cliSG is record(
      nombre varchar2(255),
      cod    varchar2(100),
      uAPEX  varchar2(255)
    );
    
    -- crea table index
    type pac is table of cliSG index by pls_integer;
    
    l_pac pac;
    l_sql varchar2(4000);
    l_genero number;
    l_rows number;
    
    -- crear cursor
    type v_cursor is ref cursor;
    l_c v_cursor;
    
begin
    l_genero := 0;
    
    l_sql := q'[ select nombre||', '||apellido, codigo_archivo, user_web 
              from pacientes
              where genero_id = :l_genero
              and codigo_archivo is not null
              and user_web <> 'SG'
              order by nombre desc]';
                  
    open l_c for l_sql using l_genero;
    fetch l_c bulk collect into l_pac;
    
    l_rows := l_c%rowcount;
    
    for x in 1 .. l_pac.count loop
        dbms_output.put_line(l_pac(x).nombre||', '||l_pac(x).cod||', '||l_pac(x).uAPEX);
    end loop;
    
    dbms_output.put_line(l_rows||' row(s)');
end;
/