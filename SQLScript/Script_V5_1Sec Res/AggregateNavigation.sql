--Aggregate Navigation


--		
SELECT column_name
  FROM information_schema.columns
 WHERE table_schema = 'public'
   AND table_name   = 'dim_date'
     ;		
--

select * from dim_date where false;