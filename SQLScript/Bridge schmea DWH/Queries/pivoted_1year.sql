-- Use case 1
-- Query 1
explain
select x.process_segment_name, round(avg(x.availability),2) "availability", round(avg(x.effectiveness),2) "effectivness", round(avg(x.oee),2) "oee"
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
--	AND d.year_actual = '2020'
	And p.id = F.process_segment_id  
	AND p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')

	AND k.id = F.kpi_id  
	AND k.id in (13,14,16)
) as x
group by x.process_segment_name
-----------------------------
--Query 2
explain
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

--Use case 2
--Query 1
select x.process_segment_name, round(avg(x.availability),2) "availability", round(avg(x.effectiveness),2) "effectivness", round(avg(x.oee),2) "oee"
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
	AND d.date_actual in ('2020-09-01','2020-09-02','2020-09-03','2020-09-04','2020-09-05','2020-09-06','2020-09-07')
--	AND d.mmyyyy = '092020'
	And p.id = F.process_segment_id  
	AND p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')

	AND k.id = F.kpi_id  
	AND k.id in (13,14,16)
) as x
group by x.process_segment_name

--query 2
 select X.process_segment_name, avg(X.availabilty), avg(Y.effectivness), avg(Z.oee) 
from  
(select anon_2.date_actual as date_actual, anon_1.process_segment_name as process_segment_name,
 date_id, location_id, personnel_id, equipment_id, material_id,
 process_segment_id, operation_definition_id ,operation_request_id,
operation_response_id, sensor_id, customer_id,event_id, kpi_id, property_id, reason_id, state_id,time_id,
 value_mean as availabilty from public.second_fact 
JOIN (SELECT public.dim_process_segment.process_segment_name AS process_segment_name, public.dim_process_segment.id AS id 
FROM public.dim_process_segment 
WHERE process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')) AS anon_1 ON anon_1.id = public.second_fact.process_segment_id 
JOIN (SELECT public.dim_date.date_actual AS date_actual 
FROM public.dim_date 
WHERE public.dim_date.date_actual IN ('2020-09-01','2020-09-02','2020-09-03','2020-09-04','2020-09-05','2020-09-06','2020-09-07')) AS anon_2 ON anon_2.date_actual = public.second_fact.date_id
JOIN (SELECT public.dim_time_sec.full_time as full_time 
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

--Use case 3
--Query 1
select x.process_segment_name, x.shift_end, round(avg(x.availability),2) "availability", round(avg(x.effectiveness),2) "effectivness", round(avg(x.oee),2) "oee"
from(
SELECT
  d.date_actual,
  t.shift_end,
  p.process_segment_name,
  (CASE WHEN k.id='13' THEN F.value_mean END) "availability",
  (CASE WHEN k.id='14' THEN F.value_mean END) "effectiveness",
  (CASE WHEN k.id='16' THEN F.value_mean END) "oee"

  FROM 
  
  dim_date d,dim_time_sec t ,dim_process_segment p,  dim_kpi k, second_fact f

    where d.date_actual=F.date_id
    AND d.date_actual in ('2020-09-01','2020-09-02','2020-09-03','2020-09-04','2020-09-05','2020-09-06','2020-09-07')
--	AND d.mmyyyy = '092020'
	AND t.full_time = F.time_id
    AND t.shift_end = true

    And p.id = F.process_segment_id  
    AND p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')

    AND k.id = F.kpi_id  
    AND k.id in (13,14,16)
) as x
group by x.process_segment_name, x.shift_end

-- Query 2

select X.process_segment_name, avg(X.availabilty), avg(Y.effectivness), avg(Z.oee) 
from  
(select anon_2.date_actual as date_actual, anon_1.process_segment_name as process_segment_name, anon_3.shift_end as shift_end,
 date_id, location_id, personnel_id, equipment_id, material_id,
 process_segment_id, operation_definition_id ,operation_request_id,
operation_response_id, sensor_id, customer_id,event_id, kpi_id, property_id, reason_id, state_id,time_id,
 value_mean as availabilty from public.second_fact 
JOIN (SELECT public.dim_process_segment.process_segment_name AS process_segment_name, public.dim_process_segment.id AS id 
FROM public.dim_process_segment 
WHERE process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')) AS anon_1 ON anon_1.id = public.second_fact.process_segment_id 
JOIN (SELECT public.dim_date.date_actual AS date_actual 
FROM public.dim_date 
WHERE public.dim_date.date_actual IN ('2020-09-01','2020-09-02','2020-09-03','2020-09-04','2020-09-05','2020-09-06','2020-09-07')) AS anon_2 ON anon_2.date_actual = public.second_fact.date_id
JOIN (SELECT public.dim_time_sec.shift_end AS shift_end, public.dim_time_sec.full_time as full_time 
FROM public.dim_time_sec 
WHERE shift_end IN (TRUE)) AS anon_3 ON anon_3.full_time = public.second_fact.time_id
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


-- Use case 4
-- Query 1

select x.process_segment_name, x.shift_end, round(avg(x.availability),2) "availability", round(avg(x.effectiveness),2) "effectivness", round(avg(x.oee),2) "oee"
from(
SELECT
  d.date_actual,
  t.shift_end,
  p.process_segment_name,
  (CASE WHEN k.id='13' THEN F.value_mean END) "availability",
  (CASE WHEN k.id='14' THEN F.value_mean END) "effectiveness",
  (CASE WHEN k.id='16' THEN F.value_mean END) "oee"

  FROM 
  
  dim_date d,dim_time_sec t ,dim_process_segment p,  dim_kpi k, second_fact f

    where d.date_actual=F.date_id
--  AND d.date_actual in ('2020-09-01','2020-09-02','2020-09-03','2020-09-04','2020-09-05','2020-09-06','2020-09-07')
	AND d.mmyyyy = '092020'
	AND t.full_time = F.time_id
    AND t.shift_end = true

    And p.id = F.process_segment_id  
    AND p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')

    AND k.id = F.kpi_id  
    AND k.id in (13,14,16)
) as x
group by x.process_segment_name, x.shift_end

--Query 2
select X.process_segment_name, avg(X.availabilty), avg(Y.effectivness), avg(Z.oee) 
from  
(select anon_2.mmyyyy as mmyyyy, anon_1.process_segment_name as process_segment_name, anon_3.shift_end as shift_end,
 date_id, location_id, personnel_id, equipment_id, material_id,
 process_segment_id, operation_definition_id ,operation_request_id,
operation_response_id, sensor_id, customer_id,event_id, kpi_id, property_id, reason_id, state_id,time_id,
 value_mean as availabilty from public.second_fact 
JOIN (SELECT public.dim_process_segment.process_segment_name AS process_segment_name, public.dim_process_segment.id AS id 
FROM public.dim_process_segment 
WHERE process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')) AS anon_1 ON anon_1.id = public.second_fact.process_segment_id 
JOIN (SELECT public.dim_date.mmyyyy AS mmyyyy, public.dim_date.date_actual as date_actual
FROM public.dim_date 
WHERE mmyyyy IN ('092020')) AS anon_2 ON anon_2.date_actual = public.second_fact.date_id
JOIN (SELECT public.dim_time_sec.shift_end AS shift_end, public.dim_time_sec.full_time as full_time 
FROM public.dim_time_sec 
WHERE shift_end IN (TRUE)) AS anon_3 ON anon_3.full_time = public.second_fact.time_id
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

-- Use case 5
--Query 1

select x.process_segment_name, round((x.availability),2) "availability", round((x.effectiveness),2) "effectivness", round((x.oee),2) "oee"
from(
SELECT
  d.date_actual,
  t.shift_end,
  p.process_segment_name,
  (CASE WHEN k.id='13' THEN F.value_mean END) "availability",
  (CASE WHEN k.id='14' THEN F.value_mean END) "effectiveness",
  (CASE WHEN k.id='16' THEN F.value_mean END) "oee"

  FROM 
  
  dim_date d,dim_time_sec t ,dim_process_segment p,  dim_kpi k, second_fact f

    where d.date_actual=F.date_id
    AND d.date_actual in ('2020-09-01')
--  AND d.date_actual in ('2020-09-01','2020-09-02','2020-09-03','2020-09-04','2020-09-05','2020-09-06','2020-09-07')
--	AND d.mmyyyy = '092020'
	AND t.full_time = F.time_id
    AND t.shift = 'Morning'

    And p.id = F.process_segment_id  
--  AND p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')
	AND p.process_segment_name in ('soap_line 2')

    AND k.id = F.kpi_id  
    AND k.id in (13,14,16)
) as x
--group by x.process_segment_name, x.shift_end

--Query 2
select X.process_segment_name, X.full_time,X.availabilty, Y.effectivness, Z.oee 
from  
(select anon_2.date_actual as date_actual, anon_1.process_segment_name as process_segment_name, anon_3.full_time as full_time,
 date_id, location_id, personnel_id, equipment_id, material_id,
 process_segment_id, operation_definition_id ,operation_request_id,
operation_response_id, sensor_id, customer_id,event_id, kpi_id, property_id, reason_id, state_id,time_id,
 value_mean as availabilty from public.second_fact 
JOIN (SELECT public.dim_process_segment.process_segment_name AS process_segment_name, public.dim_process_segment.id AS id 
FROM public.dim_process_segment 
WHERE process_segment_name in ('soap_line 2')) AS anon_1 ON anon_1.id = public.second_fact.process_segment_id 
JOIN (SELECT public.dim_date.date_actual AS date_actual 
FROM public.dim_date 
WHERE public.dim_date.date_actual IN ('2020-09-01')) AS anon_2 ON anon_2.date_actual = public.second_fact.date_id
JOIN (SELECT public.dim_time_sec.shift AS shift, public.dim_time_sec.full_time as full_time 
FROM public.dim_time_sec 
WHERE shift IN ('Morning')) AS anon_3 ON anon_3.full_time = public.second_fact.time_id
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
group by X.process_segment_name,X.full_time, X.availabilty, Y.effectivness,Z.oee order by full_time


-- Use case 6
--Query 1

select x.process_segment_name, x.full_time,round((x.availability),2) "availability"--, round((x.effectiveness),2) "effectivness", round((x.oee),2) "oee"
from(
SELECT
  d.date_actual,
  t.full_time,
  p.process_segment_name,
  (CASE WHEN k.id='13' THEN F.value_mean END) "availability",
  (CASE WHEN k.id='14' THEN F.value_mean END) "effectiveness",
  (CASE WHEN k.id='16' THEN F.value_mean END) "oee"

  FROM 
  
  dim_date d, dim_time_sec t ,dim_process_segment p,  dim_kpi k, second_fact f

    where d.date_actual=F.date_id
    AND d.date_actual in ('2020-09-01')
--  AND d.date_actual in ('2020-09-01','2020-09-02','2020-09-03','2020-09-04','2020-09-05','2020-09-06','2020-09-07')
--	AND d.mmyyyy = '092020'
	AND t.full_time = F.time_id
    AND t.shift = 'Morning'

    And p.id = F.process_segment_id  
--  AND p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')
	AND p.process_segment_name in ('soap_line 2')

    AND k.id = F.kpi_id  
    AND k.id in (13,14,16)
) as x

order by x.full_time DESC Limit 1

-- query 2

select X.process_segment_name,X.availabilty , X.full_time
from  
(select anon_2.date_actual as date_actual, anon_1.process_segment_name as process_segment_name, anon_3.full_time as full_time,
 date_id, location_id, personnel_id, equipment_id, material_id,
 process_segment_id, operation_definition_id ,operation_request_id,
operation_response_id, sensor_id, customer_id,event_id, kpi_id, property_id, reason_id, state_id,time_id,
 value_mean as availabilty from public.second_fact 
JOIN (SELECT public.dim_process_segment.process_segment_name AS process_segment_name, public.dim_process_segment.id AS id 
FROM public.dim_process_segment 
WHERE process_segment_name in ('soap_line 2')) AS anon_1 ON anon_1.id = public.second_fact.process_segment_id 
JOIN (SELECT public.dim_date.date_actual AS date_actual 
FROM public.dim_date 
WHERE public.dim_date.date_actual IN ('2020-09-01')) AS anon_2 ON anon_2.date_actual = public.second_fact.date_id
JOIN (SELECT public.dim_time_sec.shift AS shift, public.dim_time_sec.full_time as full_time 
FROM public.dim_time_sec 
WHERE shift IN ('Morning')) AS anon_3 ON anon_3.full_time = public.second_fact.time_id
where public.second_fact.kpi_id =13


)
as X

group by X.process_segment_name,X.availabilty,X.full_time order by full_time DESC Limit 1

--Use case 7
--Query 1
select x.process_segment_name, x.operation_definition_name ,round(sum(x.produced_quantity),2) "produced quantity"
from(
SELECT
  d.date_actual,
  o.operation_definition_name,
  p.process_segment_name,
  (CASE WHEN prp.id='8' THEN F.value_mean END) "produced_quantity"

  FROM 
  
  dim_date d, dim_time_sec t ,dim_process_segment p,  dim_operation_definition o, dim_event e, dim_property prp, second_fact f

    where d.date_actual=F.date_id
    AND d.date_actual in ('2020-09-01')
	AND t.full_time = F.time_id
    AND t.shift = 'Morning'
	AND e.id =f.event_id
	AND e.event_concept = 'process_segment'

    And p.id = F.process_segment_id  
	AND p.process_segment_name in ('soap_line 2')
    AND o.id = F.operation_definition_id 

) as x

group by x.process_segment_name, x.operation_definition_name 

--query 2
select X.process_segment_name, X.operation_definition_name, sum(X.produced_quantity) 
from  
(select anon_2.date_actual as date_actual, anon_1.process_segment_name as process_segment_name, anon_3.shift as shift, anon_4.operation_definition_name as 
 operation_definition_name, anon_5.event_concept as event_concept,
 date_id, location_id, personnel_id, equipment_id, material_id,
 process_segment_id, operation_definition_id ,operation_request_id,
operation_response_id, sensor_id, customer_id,event_id, kpi_id, property_id, reason_id, state_id,time_id,
 value_mean as produced_quantity from public.second_fact 
JOIN (SELECT public.dim_process_segment.process_segment_name AS process_segment_name, public.dim_process_segment.id AS id 
FROM public.dim_process_segment 
WHERE process_segment_name in ('soap_line 2')) AS anon_1 ON anon_1.id = public.second_fact.process_segment_id 
JOIN (SELECT public.dim_date.date_actual AS date_actual 
FROM public.dim_date 
WHERE public.dim_date.date_actual IN ('2020-09-01')) AS anon_2 ON anon_2.date_actual = public.second_fact.date_id
JOIN (SELECT public.dim_time_sec.shift AS shift, public.dim_time_sec.full_time as full_time 
FROM public.dim_time_sec 
WHERE shift IN ('Morning')) AS anon_3 ON anon_3.full_time = public.second_fact.time_id
JOIN (SELECT public.dim_operation_definition.operation_definition_name AS operation_definition_name, public.dim_operation_definition.id AS id 
FROM public.dim_operation_definition 
WHERE true) AS anon_4 ON anon_4.id = public.second_fact.operation_definition_id
 
JOIN (SELECT public.dim_event.event_concept AS event_concept, public.dim_event.id AS id 
FROM public.dim_event
WHERE event_concept in ('process_segment')) AS anon_5 ON anon_5.id = public.second_fact.event_id
 
where public.second_fact.property_id =8


)
as X

group by X.process_segment_name,X.operation_definition_name

--Use case 8
--Query 1

select x.process_segment_name, x.operation_definition_name ,round(sum(x.produced_quantity),2) "produced quantity"
from(
SELECT
  d.date_actual,
  o.operation_definition_name,
  p.process_segment_name,
  (CASE WHEN prp.id='8' THEN F.value_mean END) "produced_quantity"

  FROM 
  
  dim_date d, dim_time_sec t ,dim_process_segment p,  dim_operation_definition o, dim_event e, dim_property prp, second_fact f

    where d.date_actual=F.date_id
    AND d.date_actual in ('2020-09-01')
	AND t.full_time = F.time_id
    --AND t.shift = 'Morning'
	AND e.id =f.event_id
	AND e.event_concept = 'process_segment'

    And p.id = F.process_segment_id  
	AND p.process_segment_name in ('soap_line 2')
    AND o.id = F.operation_definition_id 

) as x

group by x.process_segment_name, x.operation_definition_name 

-- Query 2
select X.process_segment_name, X.operation_definition_name, sum(X.produced_quantity) 
from  
(select anon_2.date_actual as date_actual, anon_1.process_segment_name as process_segment_name,  anon_4.operation_definition_name as 
 operation_definition_name, anon_5.event_concept as event_concept,
 date_id, location_id, personnel_id, equipment_id, material_id,
 process_segment_id, operation_definition_id ,operation_request_id,
operation_response_id, sensor_id, customer_id,event_id, kpi_id, property_id, reason_id, state_id,time_id,
 value_mean as produced_quantity from public.second_fact 
JOIN (SELECT public.dim_process_segment.process_segment_name AS process_segment_name, public.dim_process_segment.id AS id 
FROM public.dim_process_segment 
WHERE process_segment_name in ('soap_line 2')) AS anon_1 ON anon_1.id = public.second_fact.process_segment_id 
JOIN (SELECT public.dim_date.date_actual AS date_actual 
FROM public.dim_date 
WHERE public.dim_date.date_actual IN ('2020-09-01')) AS anon_2 ON anon_2.date_actual = public.second_fact.date_id
JOIN (SELECT public.dim_time_sec.full_time as full_time 
FROM public.dim_time_sec 
WHERE true) AS anon_3 ON anon_3.full_time = public.second_fact.time_id
JOIN (SELECT public.dim_operation_definition.operation_definition_name AS operation_definition_name, public.dim_operation_definition.id AS id 
FROM public.dim_operation_definition 
WHERE true) AS anon_4 ON anon_4.id = public.second_fact.operation_definition_id
 
JOIN (SELECT public.dim_event.event_concept AS event_concept, public.dim_event.id AS id 
FROM public.dim_event
WHERE event_concept in ('process_segment')) AS anon_5 ON anon_5.id = public.second_fact.event_id
 
where public.second_fact.property_id =8


)
as X

group by X.process_segment_name,X.operation_definition_name

--------------------------------------------------
---------------------
--works If aggregates are on every column
SELECT
  p.process_segment_name,
  avg(F.value_mean) Filter (WHERE k.id=13 and F.value_mean > 55) AS "availability",
  avg(F.value_mean) FILTER (WHERE k.id=14 and F.value_mean > 40) AS "effectiveness",
  avg(F.value_mean) FILTER (WHERE k.id=16 and F.value_mean > 25) AS "oee"
  
FROM dim_date d, dim_process_segment p,  dim_kpi k, second_fact f

where d.date_actual=F.date_id
AND d.date_actual in ('2020-09-01','2020-09-02','2020-09-03','2020-09-04','2020-09-05','2020-09-06','2020-09-07')

And p.id = F.process_segment_id  
AND p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')

AND k.id = F.kpi_id  

GROUP BY p.process_segment_name

-------------------------------------------------
-- Use case: independent filters for kpi
-- Query 1
select x.process_segment_name, round((x.availability),2) "availability", round(avg(x.effectiveness),2) "effectivness", round(avg(x.oee),2) "oee"
from(
SELECT
  d.date_actual,
  p.process_segment_name,
  (CASE WHEN k.id='13' and F.value_mean > 40 THEN F.value_mean END) "availability",
  (CASE WHEN k.id='14' and F.value_mean < 50 THEN F.value_mean END) "effectiveness",
  (CASE WHEN k.id='16'  THEN F.value_mean END) "oee"

  FROM 
  
  dim_date d, dim_process_segment p,  dim_kpi k, second_fact f

	where d.date_actual=F.date_id
--	AND d.date_actual in ('2020-09-01','2020-09-02','2020-09-03','2020-09-04','2020-09-05','2020-09-06','2020-09-07')
	AND d.date_actual in ('2020-09-01')
--	AND d.mmyyyy = '092020'
	And p.id = F.process_segment_id  
	AND p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')

	AND k.id = F.kpi_id  
	AND k.id in (13,14,16)
) as x
group by x.process_segment_name,x.availability

------------------------------------------
-- Following features are covered in this query

-- Pivoting--> Separate column of each fact 
-- Independent filtering on facts including "And" and "Or" conditions
-- Independent filtering on dimensions
-- Aggregated and non-aggregated columns
-- Grouping

-- Following use cases are not handled

-- querying based on design properties

-------------------------------------------
select x.process_segment_name, round((x.availability),2) "availability", round(avg(x.effectiveness),2) "Avg-effectivness", 
round(avg(x.oee),2) "Avg-oee"

from(

SELECT
  d.date_actual,
  p.process_segment_name,
  (CASE WHEN (k.id='13' and F.value_mean > 40 or F.value_mean<70) THEN F.value_mean END) "availability",
  (CASE WHEN (k.id='14' and F.value_mean > 40 and F.value_mean<40) THEN F.value_mean END) "effectiveness",
  (CASE WHEN k.id='16'  THEN F.value_mean END) "oee"

  FROM 
  
  dim_date d, dim_process_segment p,  dim_kpi k, second_fact f

	where d.date_actual=F.date_id
	AND d.date_actual in ('2020-09-01')
	And p.id = F.process_segment_id  
	AND p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')

	AND k.id = F.kpi_id  
	AND k.id in (13,14,16)
) as x
group by x.process_segment_name,x.availability
