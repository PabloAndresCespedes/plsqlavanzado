-- BULK COLLECT
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
begin
    l_genero := 0;
    
    l_sql := q'[ select nombre||', '||apellido, codigo_archivo, user_web 
              from pacientes
              where genero_id = :l_genero
              and codigo_archivo is not null
              and user_web <> 'SG'
              order by nombre desc]';
                  
    execute immediate l_sql 
    bulk collect into l_pac
    using l_genero;
    
    l_rows := sql%rowcount;
    
    for x in 1 .. l_pac.count loop
        dbms_output.put_line(l_pac(x).nombre||', '||l_pac(x).cod||', '||l_pac(x).uAPEX);
    end loop;
    
    dbms_output.put_line(l_rows||' row(s)');
end;
/