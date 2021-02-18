--pivoting

with pivot_1 as (SELECT
  d.date_actual, t.full_time, p.process_segment_name,  F.value_mean as "pq"
  FROM 
  dim_date d,dim_time_sec t ,dim_process_segment p,  dim_property prop, second_fact f

    where d.date_actual=F.date_id
    AND d.date_actual in ('2020-09-01') 
    AND t.full_time = F.time_id
	And p.id = F.process_segment_id  
    AND p.process_segment_name in ('soap_line 2')
    AND prop.id = F.kpi_id  
    AND prop.id in (8)
),
 pivot_2 as (
	SELECT
  d.date_actual,  t.full_time,  p.process_segment_name,  F.value_mean as "availability"
  FROM 
  dim_date d,dim_time_sec t ,dim_process_segment p,  dim_kpi k, second_fact f
    where d.date_actual=F.date_id
    AND d.date_actual in ('2020-09-01')
    AND t.full_time = F.time_id
	And p.id = F.process_segment_id  
    AND p.process_segment_name in ('soap_line 2')
    AND k.id = F.kpi_id  
    AND k.id in (13)
)

select p1.date_actual, p1.full_time, p1.process_segment_name, p1.pq, p2.availability  
from 
pivot_1 p1 left join pivot_2 p2
on p1.full_time = p2.full_time
and p1.date_actual = p2.date_actual

-------------------------------------------------------------------------------
select date_id, time_id, process_segment_id,property_id,kpi_id, value_mean
from second_fact
where date_id = '2020-09-01'
and property_id = 8
and process_segment_id in (select p.id from dim_process_segment p where process_segment_name = 'soap_line 2')
-------------------------------------------------------------------------------
select date_id, time_id, process_segment_id,property_id,kpi_id,  value_mean
from second_fact
where date_id = '2020-09-01'
and kpi_id = 13
and process_segment_id in (select p.id from dim_process_segment p where process_segment_name = 'soap_line 2')

-------------------------------------------------------------------------------
-- table level aliasing left join
select x.date_id, x.time_id, x.process_segment_id, x.value_mean as "pg", y.value_mean as "availability"
from
(select date_id, time_id, process_segment_id,property_id,kpi_id, value_mean
from second_fact
where date_id = '2020-09-01'
and property_id = 8
and process_segment_id in (select p.id from dim_process_segment p where process_segment_name = 'soap_line 2')) as x

left join

(select date_id, time_id, process_segment_id,property_id,kpi_id,  value_mean
from second_fact
where date_id = '2020-09-01'
and kpi_id = 13
and process_segment_id in (select p.id from dim_process_segment p where process_segment_name = 'soap_line 2')) as y

on x.date_id = y.date_id
and x.time_id=y.time_id
-----------------------------------------------------------------------------
-- outter join 


select x.date_id, x.time_id, x.process_segment_id,  y.value_mean as "availability", x.value_mean as "pg", z.value_mean as "oee"
from

(select date_id, time_id, process_segment_id,property_id,kpi_id,  value_mean
from second_fact
where date_id = '2020-09-01'
and kpi_id = 13
and process_segment_id in (select p.id from dim_process_segment p where process_segment_name = 'soap_line 2')) as y

FULL OUTER JOIN

(select date_id, time_id, process_segment_id,property_id,kpi_id, value_mean
from second_fact
where date_id = '2020-09-01'
and property_id = 8
and process_segment_id in (select p.id from dim_process_segment p where process_segment_name = 'soap_line 2')) as x

on x.date_id = y.date_id
and x.time_id=y.time_id
	
FULL OUTER JOIN

(select date_id, time_id, process_segment_id,property_id,kpi_id,  value_mean
from second_fact
where date_id = '2020-09-01'
and kpi_id = 16
and process_segment_id in (select p.id from dim_process_segment p where process_segment_name = 'soap_line 2')) as z

on y.date_id = z.date_id
and y.time_id=z.time_id

-----------------------------------------------------------------------------
select x.process_segment_name, round((x.availability),2) "availability", round((x.effectiveness),2) "effectivness", round((x.pg),2) "oee"
from(
SELECT
  d.date_actual,
  t.shift_end,
  p.process_segment_name,
  (CASE WHEN k.id='13' THEN F.value_mean END) "availability",
  (CASE WHEN k.id='14' THEN F.value_mean END) "effectiveness",
  (CASE WHEN prop.id='8' THEN F.value_mean END) "pg"

  FROM 
  
  dim_date d,dim_time_sec t ,dim_process_segment p,  dim_kpi k, dim_property prop,second_fact f

    where d.date_actual=F.date_id
    AND d.date_actual in ('2020-09-01')
	AND t.full_time = F.time_id
    AND t.shift = 'Morning'

    AND p.id = F.process_segment_id  
	AND p.process_segment_name in ('soap_line 2')

    AND k.id = F.kpi_id  
    AND k.id in (13,14,16)
	
	or F.property_id =  8
) as x
--------------------------
--anon1 dim_process_seg, anon2 dim date, anon3 is time, 
select A.process_segment_name,A.stream_name, A.full_time, X.availability, Y.effectivness, Z.pq 
from  
(select anon_2.date_actual as date_actual, anon_1.process_segment_name as process_segment_name,anon_1.stream_name as stream_name, anon_3.full_time as full_time,
 date_id, location_id, personnel_id, equipment_id, material_id,
 process_segment_id, operation_definition_id ,operation_request_id,
operation_response_id, sensor_id, customer_id,event_id, kpi_id, property_id, reason_id, state_id,time_id
  from public.second_fact 
JOIN (SELECT public.dim_process_segment.process_segment_name AS process_segment_name, public.dim_process_segment.stream_name AS stream_name, 
public.dim_process_segment.id AS id 
FROM public.dim_process_segment 
WHERE process_segment_name in ('soap_line 2') and (stream_name in ('soap_ribbon_stream_ps2') or stream_name is null)) AS anon_1 ON anon_1.id = public.second_fact.process_segment_id 
JOIN (SELECT public.dim_date.date_actual AS date_actual 
FROM public.dim_date 
WHERE public.dim_date.date_actual IN ('2020-09-01')) AS anon_2 ON anon_2.date_actual = public.second_fact.date_id
JOIN (SELECT  public.dim_time_sec.full_time as full_time 
FROM public.dim_time_sec 
WHERE true) AS anon_3 ON anon_3.full_time = public.second_fact.time_id
where public.second_fact.kpi_id in (13,14) or public.second_fact.property_id in (8) 
)
as A

left JOIN (select
      date_id,location_id, personnel_id, equipment_id, material_id, process_segment_id, operation_definition_id ,operation_request_id,
        operation_response_id, sensor_id, customer_id,event_id, kpi_id, property_id, reason_id, state_id, time_id,
        value_mean as availability from public.second_fact where kpi_id =13) as X
        ON 
        x.date_id = A.date_id
        AND x.process_segment_id = A.process_segment_id
        AND x.time_id = A.time_id

left JOIN (select
      date_id,location_id, personnel_id, equipment_id, material_id, process_segment_id, operation_definition_id ,operation_request_id,
        operation_response_id, sensor_id, customer_id,event_id, kpi_id, property_id, reason_id, state_id, time_id,
        value_mean as effectivness from public.second_fact where kpi_id =14) as Y
        ON y.date_id = A.date_id
        AND y.process_segment_id = A.process_segment_id
        AND y.time_id = A.time_id

left JOIN (select
      date_id,location_id, personnel_id, equipment_id, material_id, process_segment_id, operation_definition_id ,operation_request_id,
        operation_response_id, sensor_id, customer_id,event_id, kpi_id, property_id, reason_id, state_id, time_id,
        value_mean as pq from public.second_fact where property_id =8) as Z
        ON z.date_id = A.date_id 
        AND z.process_segment_id = A.process_segment_id
        AND z.time_id = A.time_id
group by A.process_segment_name,A.stream_name,A.full_time, X.availability, Y.effectivness,Z.pq order by full_time