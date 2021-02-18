--use case 1
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

--use case 1--> outter aggregate is removed
select A.process_segment_name,(A.availability), (A.effectivness), (A.oee)  
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

--use case 1--> inner aggregate removed
select A.process_segment_name,avg(A.availability), avg(A.effectivness), avg(A.oee)  
from  
(select anon_1.process_segment_name as process_segment_name,
 (CASE WHEN second_fact.kpi_id='13' THEN second_fact.value_mean END) "availability",
 (CASE WHEN second_fact.kpi_id='14' THEN second_fact.value_mean END) "effectivness",
 (CASE WHEN second_fact.kpi_id='16' THEN second_fact.value_mean END) "oee"
 
 from public.second_fact
 
JOIN (SELECT public.dim_process_segment.process_segment_name AS process_segment_name, public.dim_process_segment.stream_name AS stream_name, 
public.dim_process_segment.id AS id 
FROM public.dim_process_segment 
WHERE process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')) AS anon_1 ON anon_1.id = public.second_fact.process_segment_id 

JOIN (SELECT public.dim_date.mmyyyy AS mmyyyy, public.dim_date.date_actual as date_actual
FROM public.dim_date 
WHERE mmyyyy IN ('092020')) AS anon_2 ON anon_2.date_actual = public.second_fact.date_id
 
 Where public.second_fact.kpi_id IN (13,14,16)
)
as A

group by A.process_segment_name

--use case 1--> inner aggregate removed and aggregate removed from outer query as well--> diagonal issue

select A.process_segment_name,(A.availability), (A.effectivness), (A.oee)  
from  
(select anon_1.process_segment_name as process_segment_name,
 (CASE WHEN second_fact.kpi_id='13' THEN second_fact.value_mean END) "availability",
 (CASE WHEN second_fact.kpi_id='14' THEN second_fact.value_mean END) "effectivness",
 (CASE WHEN second_fact.kpi_id='16' THEN second_fact.value_mean END) "oee"
 
 from public.second_fact
 
JOIN (SELECT public.dim_process_segment.process_segment_name AS process_segment_name, public.dim_process_segment.stream_name AS stream_name, 
public.dim_process_segment.id AS id 
FROM public.dim_process_segment 
WHERE process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')) AS anon_1 ON anon_1.id = public.second_fact.process_segment_id 

JOIN (SELECT public.dim_date.mmyyyy AS mmyyyy, public.dim_date.date_actual as date_actual
FROM public.dim_date 
WHERE mmyyyy IN ('092020')) AS anon_2 ON anon_2.date_actual = public.second_fact.date_id
 
 Where public.second_fact.kpi_id IN (13,14,16)
)
as A
----------------------------------------
--Use Case 11
select A.process_segment_name,A.state_name,A.full_time, A.duration_mean
from  
(select  anon_1.process_segment_name as process_segment_name, anon_4.state_name as state_name, anon_4.state_concept as state_concept,anon_3.full_time as full_time, anon_2.date_actual as date_actual,
 date_id, location_id, personnel_id, equipment_id, material_id,
 process_segment_id, operation_definition_id ,operation_request_id,
operation_response_id, sensor_id, customer_id,event_id,  reason_id, state_id,time_id,
 
  Max(CASE WHEN second_fact.state_id in (1,2,3) THEN second_fact.duration_mean END) "duration_mean"
 
  from public.second_fact 
JOIN (SELECT public.dim_process_segment.process_segment_name AS process_segment_name, public.dim_process_segment.id AS id 
FROM public.dim_process_segment 
WHERE process_segment_name in ('soap_line 2')) AS anon_1 ON anon_1.id = public.second_fact.process_segment_id 
JOIN (SELECT public.dim_date.date_actual AS date_actual 
FROM public.dim_date 
WHERE public.dim_date.date_actual IN ('2020-09-01')) AS anon_2 ON anon_2.date_actual = public.second_fact.date_id
JOIN (SELECT public.dim_time_sec.full_time as full_time 
FROM public.dim_time_sec 
WHERE true) AS anon_3 ON anon_3.full_time = public.second_fact.time_id

JOIN (SELECT public.dim_state.state_name AS state_name,public.dim_state.state_concept AS state_concept, public.dim_state.id AS id 
FROM public.dim_state 
WHERE state_name in ('Breakdown','Un scheduled','Running') and state_concept in ('process_segment')) AS anon_4 ON anon_4.id = public.second_fact.state_id 

where state_id in (1,2,3)
 
 group by anon_1.process_segment_name, anon_4.state_name, anon_4.state_concept ,anon_3.full_time , anon_2.date_actual,
 date_id, location_id, personnel_id, equipment_id, material_id,
 process_segment_id, operation_definition_id ,operation_request_id,
operation_response_id, sensor_id, customer_id,event_id,  reason_id, state_id,time_id

)
as A
order by A.full_time
limit 10

--Use case 11--> no aggregate condition added.
select A.process_segment_name,A.state_name,A.full_time, A.duration_mean
from  
(select  anon_1.process_segment_name as process_segment_name, anon_4.state_name as state_name, anon_4.state_concept as state_concept,anon_3.full_time as full_time, anon_2.date_actual as date_actual,
 date_id, location_id, personnel_id, equipment_id, material_id,
 process_segment_id, operation_definition_id ,operation_request_id,
operation_response_id, sensor_id, customer_id,event_id,  reason_id, state_id,time_id,
 
  Max(CASE WHEN second_fact.state_id in (1,2,3) THEN second_fact.duration_mean END) "duration_mean"
 
  from public.second_fact 
JOIN (SELECT public.dim_process_segment.process_segment_name AS process_segment_name, public.dim_process_segment.id AS id 
FROM public.dim_process_segment 
WHERE process_segment_name in ('soap_line 2')) AS anon_1 ON anon_1.id = public.second_fact.process_segment_id 
JOIN (SELECT public.dim_date.date_actual AS date_actual 
FROM public.dim_date 
WHERE public.dim_date.date_actual IN ('2020-09-01')) AS anon_2 ON anon_2.date_actual = public.second_fact.date_id
JOIN (SELECT public.dim_time_sec.full_time as full_time 
FROM public.dim_time_sec 
WHERE true) AS anon_3 ON anon_3.full_time = public.second_fact.time_id

JOIN (SELECT public.dim_state.state_name AS state_name,public.dim_state.state_concept AS state_concept, public.dim_state.id AS id 
FROM public.dim_state 
WHERE state_name in ('Breakdown','Un scheduled','Running') and state_concept in ('process_segment')) AS anon_4 ON anon_4.id = public.second_fact.state_id 

where state_id in (1,2,3)
 
 group by anon_1.process_segment_name, anon_4.state_name, anon_4.state_concept ,anon_3.full_time , anon_2.date_actual,
 date_id, location_id, personnel_id, equipment_id, material_id,
 process_segment_id, operation_definition_id ,operation_request_id,
 operation_response_id, sensor_id, customer_id,event_id,  reason_id, state_id,time_id
 
)
as A
group by A.process_segment_name,A.state_name,A.full_time, A.duration_mean
having A.duration_mean > '00:05:00'
order by A.full_time
limit 10

--
--Use case 11--> no aggregate condition added and inner aggregate removed
select A.process_segment_name,A.state_name,A.full_time, A.duration_mean
from  
(select  anon_1.process_segment_name as process_segment_name, anon_4.state_name as state_name, anon_4.state_concept as state_concept,anon_3.full_time as full_time, anon_2.date_actual as date_actual,
 (CASE WHEN second_fact.state_id in (1,2,3) THEN second_fact.duration_mean END) "duration_mean"
 
  from public.second_fact 
JOIN (SELECT public.dim_process_segment.process_segment_name AS process_segment_name, public.dim_process_segment.id AS id 
FROM public.dim_process_segment 
WHERE process_segment_name in ('soap_line 2')) AS anon_1 ON anon_1.id = public.second_fact.process_segment_id 
JOIN (SELECT public.dim_date.date_actual AS date_actual 
FROM public.dim_date 
WHERE public.dim_date.date_actual IN ('2020-09-01')) AS anon_2 ON anon_2.date_actual = public.second_fact.date_id
JOIN (SELECT public.dim_time_sec.full_time as full_time 
FROM public.dim_time_sec 
WHERE true) AS anon_3 ON anon_3.full_time = public.second_fact.time_id

JOIN (SELECT public.dim_state.state_name AS state_name,public.dim_state.state_concept AS state_concept, public.dim_state.id AS id 
FROM public.dim_state 
WHERE state_name in ('Breakdown','Un scheduled','Running') and state_concept in ('process_segment')) AS anon_4 ON anon_4.id = public.second_fact.state_id 

where state_id in (1,2,3)

)
as A
group by A.process_segment_name,A.state_name,A.full_time, A.duration_mean
having A.duration_mean > '00:05:00'
order by A.full_time
limit 10