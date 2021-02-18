--DB Function

drop function if exists KPI_ingestion cascade;
CREATE FUNCTION KPI_ingestion() returns integer AS $$

BEGIN

while iterator < 10

LOOP



END LOOP;
RETURN 1;
END; $$

LANGUAGE PLPGSQL;

select fact_table_gen();


CREATE OR REPLACE FUNCTION for_loop_through_query(   n INTEGER DEFAULT 10) 
RETURNS VOID AS 
$$DECLARE    
rec RECORD;
BEGIN    FOR rec IN SELECT title           
FROM film           
ORDER BY title          
LIMIT n     
LOOP

select

RAISE NOTICE '%', rec.title;    
END LOOP;
END;$$ 
LANGUAGE plpgsql;