 
select A.process_segment_name,A.stream_name,A.date_actual,A.full_time,count(X.availability), count(Y.effectivness), Z.pq 
from  
(select distinct date_actual, process_segment_name,stream_name, full_time,
 date_id, location_id, personnel_id, equipment_id, material_id,
process_segment_id, operation_definition_id ,operation_request_id,
operation_response_id, sensor_id, customer_id,event_id,reason_id,state_id,time_id
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
        ON 
        y.date_id = A.date_id
        AND y.process_segment_id = A.process_segment_id
        AND y.time_id = A.time_id
        
left JOIN (select
      date_id,location_id, personnel_id, equipment_id, material_id, process_segment_id, operation_definition_id ,operation_request_id,
        operation_response_id, sensor_id, customer_id,event_id, kpi_id, property_id, reason_id, state_id, time_id,
        value_mean as pq from public.second_fact where property_id =8) as Z
        ON 
        z.date_id = A.date_id 
        AND z.process_segment_id = A.process_segment_id
        AND z.time_id = A.time_id
        
group by A.process_segment_name,A.stream_name,A.date_actual,A.full_time, X.availability, Y.effectivness, Z.pq order by date_actual, full_time
