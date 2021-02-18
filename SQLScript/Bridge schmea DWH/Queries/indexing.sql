--Indexing
CREATE INDEX fks_index
         ON second_fact (date_id,process_segment_id,reason_id,state_id,kpi_id);
		 
--Use case
explain analyze
--select x.process_segment_name, round(avg(x.availability),2) "availability", round(avg(x.effectiveness),2) "effectivness", round(avg(x.oee),2) "oee"
select x.process_segment_name, (avg(x.availability)) "availability", (avg(x.effectiveness)) "effectivness", (avg(x.oee)) "oee"
from(
SELECT
  d.date_actual,
  p.process_segment_name,
  (CASE WHEN k.id='13' THEN F.value_mean END) "availability",
  (CASE WHEN k.id='14' THEN F.value_mean END) "effectiveness",
  (CASE WHEN k.id='16' THEN F.value_mean END) "oee"

  FROM 
  
  dim_date d, dim_process_segment p,  dim_kpi k, second_fact f

	where d.date_actual=F.date_id
	AND d.year_actual = '2020'
	And p.id = F.process_segment_id  
	AND p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')
	AND k.id = F.kpi_id  
	AND k.id in (13,14,16)
) as x
group by x.process_segment_name

-- query 1- No table level aliasing--> why providing different results?
explain analyze
SELECT
  p.process_segment_name,
  avg(F.value_mean) Filter (WHERE k.id=13 and F.value_mean > 55) AS "availability",
  avg(F.value_mean) FILTER (WHERE k.id=14 and F.value_mean > 40) AS "effectiveness",
  avg(F.value_mean) FILTER (WHERE k.id=16 and F.value_mean > 25) AS "oee"
  
FROM dim_date d, dim_process_segment p,  dim_kpi k, second_fact f

where d.date_actual=F.date_id
AND d.year_actual = '2020'

And p.id = F.process_segment_id  
AND p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')

AND k.id = F.kpi_id
AND k.id in (13,14,16)

GROUP BY p.process_segment_name

---------------------------------
-- regular join--> does not use index either
explain analyze
select x.process_segment_name, (avg(x.availability)) "availability", (avg(x.effectiveness)) "effectivness", (avg(x.oee)) "oee"
from(
SELECT
  d.date_actual,
  p.process_segment_name,
  (CASE WHEN k.id='13' THEN F.value_mean END) "availability",
  (CASE WHEN k.id='14' THEN F.value_mean END) "effectiveness",
  (CASE WHEN k.id='16' THEN F.value_mean END) "oee"

  FROM  second_fact F join dim_date d 
	on F.date_id=d.date_actual
	join dim_process_segment p
	on p.id = F.process_segment_id
	join dim_kpi k
	on k.id = F.kpi_id
	where d.year_actual = '2020'
	AND p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')
	AND k.id in (13,14,16)
) as x
group by x.process_segment_name

--------------------------------------------------
-- More sub queries
explain analyze
select x.process_segment_id, (avg(x.availability)) "availability", (avg(x.effectiveness)) "effectivness", (avg(x.oee)) "oee"
from(
SELECT
  F.date_id,
  F.process_segment_id,
  (CASE WHEN F.kpi_id='13' THEN F.value_mean END) "availability",
  (CASE WHEN F.kpi_id='14' THEN F.value_mean END) "effectiveness",
  (CASE WHEN F.kpi_id='16' THEN F.value_mean END) "oee"

  FROM  second_fact F
	where F.date_id in (select d.date_actual from dim_date d where d.year_actual = '2020')
	and F.process_segment_id in (select p.id as "process_segment_name" from dim_process_segment p
								 where p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7'))
	and F.kpi_id in (select k.id from dim_kpi k 
								 where k.id in (13,14,16))
) as x
group by x.process_segment_id

-------------------------------------------------
-- Query 1.1
-- More sub queries and join dims one by one with fact table
--> almost same performance because join operation itself perform join one by one in case of multiple joins.
explain analyze
select x.process_segment_name, (avg(x.availability)) "availability", (avg(x.effectiveness)) "effectivness", (avg(x.oee)) "oee"
from(
SELECT
  dd.date_actual,
  pp.process_segment_name,
  (CASE WHEN kk.id='13' THEN F.value_mean END) "availability",
  (CASE WHEN kk.id='14' THEN F.value_mean END) "effectiveness",
  (CASE WHEN kk.id='16' THEN F.value_mean END) "oee"

  FROM  second_fact F join (select d.date_actual from dim_date d where d.year_actual = '2020') dd
	on F.date_id=dd.date_actual
	join (select p.id, p.process_segment_name from dim_process_segment p where p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')) pp
	on pp.id = F.process_segment_id
	join (select k.id from dim_kpi k where k.id in (13,14,16)) kk
	on kk.id = F.kpi_id
) as x
group by x.process_segment_name
----

-----------------------------
--Query 2

explain analyze
select X.process_segment_name, avg(X.availabilty), avg(Y.effectivness), avg(Z.oee) 
from  
(select anon_2.mmyyyy as mmyyyy, anon_1.process_segment_name as process_segment_name,
 date_id, location_id, personnel_id, equipment_id, material_id,
 process_segment_id, operation_definition_id ,operation_request_id,
operation_response_id, sensor_id, customer_id,event_id, kpi_id, property_id, reason_id, state_id,time_id,
 value_mean as availabilty from public.second_fact 
JOIN (SELECT public.dim_process_segment.process_segment_name AS process_segment_name, public.dim_process_segment.id AS id 
FROM public.dim_process_segment 
WHERE process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')) AS anon_1 ON anon_1.id = public.second_fact.process_segment_id 
JOIN (SELECT public.dim_date.mmyyyy AS mmyyyy, public.dim_date.date_actual as date_actual
FROM public.dim_date 
) AS anon_2 ON anon_2.date_actual = public.second_fact.date_id
JOIN (SELECT public.dim_time_sec.full_time AS full_time 
FROM public.dim_time_sec 
WHERE true) AS anon_3 ON anon_3.full_time = public.second_fact.time_id
where public.second_fact.kpi_id =13


)
as X
JOIN (select
      date_id,location_id, personnel_id, equipment_id, material_id, process_segment_id, operation_definition_id ,operation_request_id,
        operation_response_id, sensor_id, customer_id,event_id, kpi_id, property_id, reason_id, state_id, time_id,
        value_mean as effectivness from public.second_fact where kpi_id =14) as Y
        ON 
        y.date_id = x.date_id
        AND y.process_segment_id = x.process_segment_id
        AND y.time_id = x.time_id
JOIN (select
      date_id,location_id, personnel_id, equipment_id, material_id, process_segment_id, operation_definition_id ,operation_request_id,
        operation_response_id, sensor_id, customer_id,event_id, kpi_id, property_id, reason_id, state_id, time_id,
        value_mean as oee from public.second_fact where kpi_id =16) as Z
        ON 
        z.date_id = x.date_id 
        AND z.process_segment_id = x.process_segment_id
        AND z.time_id = x.time_id
group by X.process_segment_name

-- query 2 - cleaned-- does not complete
explain 
select x.date_actual,X.process_segment_name, (avg(X.availabilty)), (avg(Y.effectivness)), (avg(Z.oee))
from
(select xx2.date_actual , xx.process_segment_name , process_segment_id, kpi_id, value_mean as availabilty 
 	from public.second_fact
	JOIN (SELECT p.process_segment_name AS process_segment_name, p.id AS id
	FROM public.dim_process_segment p
    where p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')) AS xx 
 	ON xx.id = public.second_fact.process_segment_id 
	JOIN 
 	(SELECT d.date_actual
	FROM public.dim_date d
	where d.year_actual = '2020') AS xx2 
 	ON xx2.date_actual = public.second_fact.date_id
	where public.second_fact.kpi_id =13) as x
JOIN (select date_id, process_segment_id, kpi_id, value_mean as effectivness 
	  from public.second_fact where kpi_id =14) as Y
      ON y.date_id = x.date_actual
      AND y.process_segment_id = x.process_segment_id
JOIN (select date_id, process_segment_id, kpi_id,value_mean as oee 
	  from public.second_fact where kpi_id =16) as Z
      ON  z.date_id = x.date_actual
      AND z.process_segment_id = x.process_segment_id
group by X.date_actual, X.process_segment_name
------------
--index sizing
SELECT *, pg_size_pretty(total_bytes) AS total
    , pg_size_pretty(index_bytes) AS index
    , pg_size_pretty(toast_bytes) AS toast
    , pg_size_pretty(table_bytes) AS table
  FROM (
  SELECT *, total_bytes-index_bytes-coalesce(toast_bytes,0) AS table_bytes FROM (
      SELECT c.oid,nspname AS table_schema, relname AS table_name
              , c.reltuples AS row_estimate
              , pg_total_relation_size(c.oid) AS total_bytes
              , pg_indexes_size(c.oid) AS index_bytes
              , pg_total_relation_size(reltoastrelid) AS toast_bytes
          FROM pg_class c
          LEFT JOIN pg_namespace n ON n.oid = c.relnamespace
          WHERE relkind = 'r'
  ) a
) a;

-----------------
--total indexes
SELECT

tablename,
    indexname,
    indexdef

FROM
    pg_indexes
WHERE
    schemaname = 'public'
ORDER BY
    tablename,
    indexname;
	
--
select *
from pg_indexes
where tablename = 'second_fact';