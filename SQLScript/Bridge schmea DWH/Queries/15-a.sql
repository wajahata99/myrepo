explain analyze
select A.process_segment_name,A.reason_name, sum(X.duration)  
from  
(select distinct anon_2.mmyyyy as mmyyyy, anon_1.process_segment_name as process_segment_name, anon_4.reason_name as reason_name,
 date_id, location_id, personnel_id, equipment_id, material_id,
 process_segment_id, operation_definition_id ,operation_request_id,
operation_response_id, sensor_id, customer_id,event_id,  reason_id, state_id,time_id
  from public.second_fact 
JOIN (SELECT public.dim_process_segment.process_segment_name AS process_segment_name, public.dim_process_segment.id AS id 
FROM public.dim_process_segment 
WHERE process_segment_name in ('soap_line 2')) AS anon_1 ON anon_1.id = public.second_fact.process_segment_id 
JOIN (SELECT public.dim_date.mmyyyy AS mmyyyy, public.dim_date.date_actual as date_actual
FROM public.dim_date 
WHERE mmyyyy IN ('092020')) AS anon_2 ON anon_2.date_actual = public.second_fact.date_id

JOIN (SELECT  public.dim_time_sec.full_time as full_time 
FROM public.dim_time_sec 
WHERE true) AS anon_3 ON anon_3.full_time = public.second_fact.time_id

JOIN (SELECT public.dim_reason.reason_name AS reason_name, public.dim_reason.id AS id 
FROM public.dim_reason 
WHERE true) AS anon_4 ON anon_4.id = public.second_fact.reason_id 
)
as A

full outer join (select
      date_id,location_id, personnel_id, equipment_id, material_id, process_segment_id, operation_definition_id ,operation_request_id,
        operation_response_id, sensor_id, customer_id,event_id, kpi_id, property_id, reason_id, state_id, time_id,
        duration_mean as duration from public.second_fact
		  
		  JOIN (SELECT public.dim_process_segment.process_segment_name AS process_segment_name, public.dim_process_segment.id AS id 
FROM public.dim_process_segment 
WHERE process_segment_name in ('soap_line 2')) AS anon_50 ON anon_50.id = public.second_fact.process_segment_id 
JOIN (SELECT public.dim_date.mmyyyy AS mmyyyy, public.dim_date.date_actual as date_actual
FROM public.dim_date 
WHERE mmyyyy IN ('092020')) AS anon_51 ON anon_51.date_actual = public.second_fact.date_id

JOIN (SELECT  public.dim_time_sec.full_time as full_time 
FROM public.dim_time_sec 
WHERE true) AS anon_52 ON anon_52.full_time = public.second_fact.time_id

JOIN (SELECT public.dim_reason.reason_name AS reason_name, public.dim_reason.id AS id 
FROM public.dim_reason 
WHERE true) AS anon_53 ON anon_53.id = public.second_fact.reason_id 
		  
		  ) as X
        ON 
        x.date_id = A.date_id
		And x.location_id=A.location_id
		And x.personnel_id=A.personnel_id
		And x.equipment_id=A.equipment_id
		And x.material_id=A.material_id
		And x.process_segment_id=A.process_segment_id
		And x.operation_definition_id=A.operation_definition_id
		And x.operation_request_id=A.operation_request_id
		And x.operation_response_id=A.operation_response_id
		And x.sensor_id=A.sensor_id
		And x.customer_id=A.customer_id
		And x.event_id=A.event_id
		And x.reason_id=A.reason_id
		And x.state_id=A.state_id
        AND x.process_segment_id = A.process_segment_id
        AND x.time_id = A.time_id

group by A.process_segment_name, A.reason_name
