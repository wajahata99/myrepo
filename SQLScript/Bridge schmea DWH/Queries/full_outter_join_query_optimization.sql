select A.process_segment_name,avg(X.availability), avg(Y.effectivness), avg(Z.oee)  
from  
(select distinct anon_2.mmyyyy as mmyyyy, anon_1.process_segment_name as process_segment_name,
 date_id, location_id, personnel_id, equipment_id, material_id,
 process_segment_id, operation_definition_id ,operation_request_id,
operation_response_id, sensor_id, customer_id,event_id,  reason_id, state_id,time_id
  from public.second_fact 
JOIN (SELECT public.dim_process_segment.process_segment_name AS process_segment_name, public.dim_process_segment.stream_name AS stream_name, 
public.dim_process_segment.id AS id 
FROM public.dim_process_segment 
WHERE process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')) AS anon_1 ON anon_1.id = public.second_fact.process_segment_id 
JOIN (SELECT public.dim_date.mmyyyy AS mmyyyy, public.dim_date.date_actual as date_actual
FROM public.dim_date 
WHERE mmyyyy IN ('092020')) AS anon_2 ON anon_2.date_actual = public.second_fact.date_id

JOIN (SELECT  public.dim_time_sec.full_time as full_time 
FROM public.dim_time_sec 
WHERE true) AS anon_3 ON anon_3.full_time = public.second_fact.time_id
where public.second_fact.kpi_id in (13,14,16)
)
as A

full outer join (select
      date_id,location_id, personnel_id, equipment_id, material_id, process_segment_id, operation_definition_id ,operation_request_id,
        operation_response_id, sensor_id, customer_id,event_id,  reason_id, state_id, time_id,
        value_mean as availability from public.second_fact 
		   
		   JOIN (SELECT public.dim_process_segment.process_segment_name AS process_segment_name, public.dim_process_segment.stream_name AS stream_name, 
public.dim_process_segment.id AS id 
FROM public.dim_process_segment 
WHERE process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')) AS anon_50 ON anon_50.id = public.second_fact.process_segment_id 
JOIN (SELECT public.dim_date.mmyyyy AS mmyyyy, public.dim_date.date_actual as date_actual
FROM public.dim_date 
WHERE mmyyyy IN ('092020')) AS anon_51 ON anon_51.date_actual = public.second_fact.date_id

JOIN (SELECT  public.dim_time_sec.full_time as full_time 
FROM public.dim_time_sec 
WHERE true) AS anon_52 ON anon_52.full_time = public.second_fact.time_id
		   
		   where kpi_id =13) as X
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

full outer join (select
      date_id,location_id, personnel_id, equipment_id, material_id, process_segment_id, operation_definition_id ,operation_request_id,
        operation_response_id, sensor_id, customer_id,event_id,  reason_id, state_id, time_id,
        value_mean as effectivness from public.second_fact 
		   
		   JOIN (SELECT public.dim_process_segment.process_segment_name AS process_segment_name, public.dim_process_segment.stream_name AS stream_name, 
public.dim_process_segment.id AS id 
FROM public.dim_process_segment 
WHERE process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')) AS anon_55 ON anon_55.id = public.second_fact.process_segment_id 
JOIN (SELECT public.dim_date.mmyyyy AS mmyyyy, public.dim_date.date_actual as date_actual
FROM public.dim_date 
WHERE mmyyyy IN ('092020')) AS anon_56 ON anon_56.date_actual = public.second_fact.date_id

JOIN (SELECT  public.dim_time_sec.full_time as full_time 
FROM public.dim_time_sec 
WHERE true) AS anon_57 ON anon_57.full_time = public.second_fact.time_id
		   
		   where kpi_id =14) as Y
        ON 
        y.date_id = A.date_id
		And y.location_id=A.location_id
		And Y.personnel_id=A.personnel_id
		And Y.equipment_id=A.equipment_id
		And y.material_id=A.material_id
		And y.process_segment_id=A.process_segment_id
		And Y.operation_definition_id=A.operation_definition_id
		And Y.operation_request_id=A.operation_request_id
		And Y.operation_response_id=A.operation_response_id
		And y.sensor_id=A.sensor_id
		And y.customer_id=A.customer_id
		And Y.event_id=A.event_id
		And y.reason_id=A.reason_id
		And y.state_id=A.state_id
        AND y.process_segment_id = A.process_segment_id
        AND Y.time_id = A.time_id
full outer join (select
      date_id,location_id, personnel_id, equipment_id, material_id, process_segment_id, operation_definition_id ,operation_request_id,
        operation_response_id, sensor_id, customer_id,event_id,  reason_id, state_id, time_id,
        value_mean as oee from public.second_fact 
		   
		   JOIN (SELECT public.dim_process_segment.process_segment_name AS process_segment_name, public.dim_process_segment.stream_name AS stream_name, 
public.dim_process_segment.id AS id 
FROM public.dim_process_segment 
WHERE process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')) AS anon_60 ON anon_60.id = public.second_fact.process_segment_id 
JOIN (SELECT public.dim_date.mmyyyy AS mmyyyy, public.dim_date.date_actual as date_actual
FROM public.dim_date 
WHERE mmyyyy IN ('092020')) AS anon_61 ON anon_61.date_actual = public.second_fact.date_id

JOIN (SELECT  public.dim_time_sec.full_time as full_time 
FROM public.dim_time_sec 
WHERE true) AS anon_62 ON anon_62.full_time = public.second_fact.time_id
		   
		where    kpi_id =16) as Z
        ON 
        z.date_id = A.date_id
		And Z.location_id=A.location_id
		And Z.personnel_id=A.personnel_id
		And Z.equipment_id=A.equipment_id
		And Z.material_id=A.material_id
		And Z.process_segment_id=A.process_segment_id
		And Z.operation_definition_id=A.operation_definition_id
		And Z.operation_request_id=A.operation_request_id
		And Z.operation_response_id=A.operation_response_id
		And Z.sensor_id=A.sensor_id
		And Z.customer_id=A.customer_id
		And Z.event_id=A.event_id
		And Z.reason_id=A.reason_id
		And Z.state_id=A.state_id
        AND Z.process_segment_id = A.process_segment_id
        AND Z.time_id = A.time_id
group by A.process_segment_name


--------------------------


select A.process_segment_name,avg(X.availability), avg(Y.effectivness), avg(Z.oee)  
from  
(select distinct anon_2.mmyyyy as mmyyyy, anon_1.process_segment_name as process_segment_name,
 date_id, location_id, personnel_id, equipment_id, material_id,
 process_segment_id, operation_definition_id ,operation_request_id,
operation_response_id, sensor_id, customer_id,event_id,  reason_id, state_id,time_id
  from public.second_fact 
JOIN (SELECT public.dim_process_segment.process_segment_name AS process_segment_name, public.dim_process_segment.stream_name AS stream_name, 
public.dim_process_segment.id AS id 
FROM public.dim_process_segment 
WHERE process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')) AS anon_1 ON anon_1.id = public.second_fact.process_segment_id 
JOIN (SELECT public.dim_date.mmyyyy AS mmyyyy, public.dim_date.date_actual as date_actual
FROM public.dim_date 
WHERE mmyyyy IN ('092020')) AS anon_2 ON anon_2.date_actual = public.second_fact.date_id

JOIN (SELECT  public.dim_time_sec.full_time as full_time 
FROM public.dim_time_sec 
WHERE true) AS anon_3 ON anon_3.full_time = public.second_fact.time_id
where public.second_fact.kpi_id in (13,14,16)
)
as A

full outer join (select
      date_id,location_id, personnel_id, equipment_id, material_id, process_segment_id, operation_definition_id ,operation_request_id,
        operation_response_id, sensor_id, customer_id,event_id,  reason_id, state_id, time_id,
        value_mean as availability from public.second_fact 
		   
		   JOIN (SELECT public.dim_process_segment.process_segment_name AS process_segment_name, public.dim_process_segment.stream_name AS stream_name, 
public.dim_process_segment.id AS id 
FROM public.dim_process_segment 
WHERE process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')) AS anon_50 ON anon_50.id = public.second_fact.process_segment_id 
JOIN (SELECT public.dim_date.mmyyyy AS mmyyyy, public.dim_date.date_actual as date_actual
FROM public.dim_date 
WHERE mmyyyy IN ('092020')) AS anon_51 ON anon_51.date_actual = public.second_fact.date_id

JOIN (SELECT  public.dim_time_sec.full_time as full_time 
FROM public.dim_time_sec 
WHERE true) AS anon_52 ON anon_52.full_time = public.second_fact.time_id
		   
		   where kpi_id =13) as X
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

full outer join (select
      date_id,location_id, personnel_id, equipment_id, material_id, process_segment_id, operation_definition_id ,operation_request_id,
        operation_response_id, sensor_id, customer_id,event_id,  reason_id, state_id, time_id,
        value_mean as effectivness from public.second_fact 
		   
		   JOIN (SELECT public.dim_process_segment.process_segment_name AS process_segment_name, public.dim_process_segment.stream_name AS stream_name, 
public.dim_process_segment.id AS id 
FROM public.dim_process_segment 
WHERE process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')) AS anon_55 ON anon_55.id = public.second_fact.process_segment_id 
JOIN (SELECT public.dim_date.mmyyyy AS mmyyyy, public.dim_date.date_actual as date_actual
FROM public.dim_date 
WHERE mmyyyy IN ('092020')) AS anon_56 ON anon_56.date_actual = public.second_fact.date_id

JOIN (SELECT  public.dim_time_sec.full_time as full_time 
FROM public.dim_time_sec 
WHERE true) AS anon_57 ON anon_57.full_time = public.second_fact.time_id
		   
		   where kpi_id =14) as Y
        ON 
        y.date_id = A.date_id
		And y.location_id=A.location_id
		And Y.personnel_id=A.personnel_id
		And Y.equipment_id=A.equipment_id
		And y.material_id=A.material_id
		And y.process_segment_id=A.process_segment_id
		And Y.operation_definition_id=A.operation_definition_id
		And Y.operation_request_id=A.operation_request_id
		And Y.operation_response_id=A.operation_response_id
		And y.sensor_id=A.sensor_id
		And y.customer_id=A.customer_id
		And Y.event_id=A.event_id
		And y.reason_id=A.reason_id
		And y.state_id=A.state_id
        AND y.process_segment_id = A.process_segment_id
        AND Y.time_id = A.time_id
full outer join (select
      date_id,location_id, personnel_id, equipment_id, material_id, process_segment_id, operation_definition_id ,operation_request_id,
        operation_response_id, sensor_id, customer_id,event_id,  reason_id, state_id, time_id,
        value_mean as oee from public.second_fact 
		   
		   JOIN (SELECT public.dim_process_segment.process_segment_name AS process_segment_name, public.dim_process_segment.stream_name AS stream_name, 
public.dim_process_segment.id AS id 
FROM public.dim_process_segment 
WHERE process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')) AS anon_60 ON anon_60.id = public.second_fact.process_segment_id 
JOIN (SELECT public.dim_date.mmyyyy AS mmyyyy, public.dim_date.date_actual as date_actual
FROM public.dim_date 
WHERE mmyyyy IN ('092020')) AS anon_61 ON anon_61.date_actual = public.second_fact.date_id

JOIN (SELECT  public.dim_time_sec.full_time as full_time 
FROM public.dim_time_sec 
WHERE true) AS anon_62 ON anon_62.full_time = public.second_fact.time_id
		   
		where    kpi_id =16) as Z
        ON 
        z.date_id = A.date_id
		And Z.location_id=A.location_id
		And Z.personnel_id=A.personnel_id
		And Z.equipment_id=A.equipment_id
		And Z.material_id=A.material_id
		And Z.process_segment_id=A.process_segment_id
		And Z.operation_definition_id=A.operation_definition_id
		And Z.operation_request_id=A.operation_request_id
		And Z.operation_response_id=A.operation_response_id
		And Z.sensor_id=A.sensor_id
		And Z.customer_id=A.customer_id
		And Z.event_id=A.event_id
		And Z.reason_id=A.reason_id
		And Z.state_id=A.state_id
        AND Z.process_segment_id = A.process_segment_id
        AND Z.time_id = A.time_id
group by A.process_segment_name