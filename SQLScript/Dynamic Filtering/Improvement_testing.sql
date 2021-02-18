--Improvement_testing
--set search_path to public;

--1 Soap_line2 is selected
--Reason_name Filter query
select distinct reason_id from second_fact 
where process_segment_id != 100;
where process_segment_id in (select id from dim_process_segment where process_segment_name in ('soap_line 2'))
and date_id in (select date_actual from dim_date where date_actual in ('2020-09-01'))
--and date_id in (select date_actual from dim_date where month_actual in (9))

-- View query
select count(distinct process_segment_id)
from second_fact f, dim_process_segment p, dim_date d
where f.process_segment_id = p.id
and f.date_id = d.date_actual
and process_segment_name in ('soap_line 2')
and date_actual in ('2020-09-01')

--2 selection is made in reason_name filter
--Process_segment_filter_query
select distinct process_segment_id 
from second_fact 
where reason_id in (select id from dim_reason where reason_name in ('Uptime'))
and process_segment_id != 100
and date_id in (select date_actual from dim_date where date_actual in ('2020-09-01'))

-- View query
select count(distinct process_segment_id)
from second_fact f, dim_process_segment p, dim_date d, dim_reason r
where f.process_segment_id = p.id
and f.date_id = d.date_actual
and f.reason_id = r.id
and process_segment_name in ('soap_line 2')
and date_actual in ('2020-09-01')
and reason_name in ('Uptime')

-- 3 User make anyother selection in Process_segment_name filter



--and process_segment_id in (select id from dim_process_segment where process_segment_name in ('soap_line 2'))

-- Process_segment filter when selection is made in equipment dimension
select distinct process_segment_name 
from second_fact f, dim_equipment e, dim_process_segment p
where f.equipment_id = e.id
and f.process_segment_id = p.id

and equipment_name in ('Mixer soap_line2','Mixer soap_line3') 

--
select distinct process_segment_id from second_fact 
where equipment_id in (select id from dim_equipment where equipment_name in ('Mixer soap_line2','Mixer soap_line3'))
and date_id in (select date_actual from dim_date where month_actual in (9))



-- Process_segment filter when selection is made in equipment dimension and reason dimension
select distinct process_segment_name 
from second_fact f, dim_equipment e, dim_process_segment p, dim_reason r
where f.equipment_id = e.id
and f.process_segment_id = p.id
and f.reason_id = r.id

and equipment_name in ('Mixer soap_line1') 

and reason_name in ('Uptime')

--
select distinct process_segment_id from second_fact 
where equipment_id in (select id from dim_equipment where equipment_name in ('Mixer soap_line2','Mixer soap_line3'))
and reason_id in (select id from dim_reason where reason_name in ('BTU Head Problem'))
and date_id in (select date_actual from dim_date where month_actual in (9))
--and date_id in (select date_actual from dim_date where date_actual in ('2020-09-01'))

------------------------------------------------------
select A.process_segment_name,avg(A.availability), avg(A.effectivness), avg(A.oee)  
from  
(select anon_2.mmyyyy as mmyyyy, anon_1.process_segment_name as process_segment_name,
 date_id, location_id, personnel_id, equipment_id, material_id,
 process_segment_id, operation_definition_id ,operation_request_id,
operation_response_id, sensor_id, customer_id,event_id,  reason_id, state_id,time_id,
  
 Max(CASE WHEN second_fact.kpi_id='13' THEN second_fact.value_mean END) "availability",
  Max(CASE WHEN second_fact.kpi_id='14' THEN second_fact.value_mean END) "effectivness",
  Max(CASE WHEN second_fact.kpi_id='16' THEN second_fact.value_mean END) "oee"
 
 from public.second_fact
 
JOIN (SELECT public.dim_process_segment.process_segment_name AS process_segment_name, public.dim_process_segment.stream_name AS stream_name, 
public.dim_process_segment.id AS id 
FROM public.dim_process_segment 
WHERE process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')) AS anon_1 ON anon_1.id = public.second_fact.process_segment_id 

JOIN (SELECT public.dim_date.mmyyyy AS mmyyyy, public.dim_date.date_actual as date_actual
FROM public.dim_date 
WHERE mmyyyy IN ('092020')) AS anon_2 ON anon_2.date_actual = public.second_fact.date_id
 
 Where public.second_fact.kpi_id IN (13,14,16)
group by anon_2.mmyyyy , anon_1.process_segment_name ,
 date_id, location_id, personnel_id, equipment_id, material_id,
 process_segment_id, operation_definition_id ,operation_request_id,
operation_response_id, sensor_id, customer_id,event_id,  reason_id, state_id,time_id
 
)
as A

group by A.process_segment_name
