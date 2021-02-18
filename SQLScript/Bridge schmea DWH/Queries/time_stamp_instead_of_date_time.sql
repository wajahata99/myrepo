--Usecase 3
explain analyze
select A.process_segment_name,avg(X.availability), avg(Y.effectivness), avg(Z.oee)  
from  
(select distinct anon_2.date_actual as date_actual, anon_1.process_segment_name as process_segment_name,anon_3.shift_end as shift_end,
 date_id, location_id, personnel_id, equipment_id, material_id,
 process_segment_id, operation_definition_id ,operation_request_id,
operation_response_id, sensor_id, customer_id,event_id,  reason_id, state_id,time_id
  from public.second_fact 
JOIN (SELECT public.dim_process_segment.process_segment_name AS process_segment_name, public.dim_process_segment.stream_name AS stream_name, 
public.dim_process_segment.id AS id 
FROM public.dim_process_segment 
WHERE process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')) AS anon_1 ON anon_1.id = public.second_fact.process_segment_id 
JOIN (SELECT public.dim_date.date_actual AS date_actual 
FROM public.dim_date 
WHERE public.dim_date.date_actual IN ('2020-09-01','2020-09-02','2020-09-03','2020-09-04','2020-09-05','2020-09-06','2020-09-07')) AS anon_2 ON anon_2.date_actual = public.second_fact.date_id



JOIN (SELECT public.dim_time_sec.shift_end AS shift_end, public.dim_time_sec.full_time as full_time 
FROM public.dim_time_sec 
WHERE shift_end IN (TRUE)) AS anon_3 ON anon_3.full_time = public.second_fact.time_id


where public.second_fact.kpi_id in (13,14,16)
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
        value_mean as oee from public.second_fact where kpi_id =16) as Z
        ON 
        z.date_id = A.date_id 
        AND z.process_segment_id = A.process_segment_id
        AND z.time_id = A.time_id
group by A.process_segment_name
-------------------------------------
--using time stamp instead of time and date
select A.process_segment_name,avg(X.availability), avg(Y.effectivness), avg(Z.oee)  
from  
(select distinct anon_1.process_segment_name as process_segment_name,
 date_id, location_id, personnel_id, equipment_id, material_id,
 process_segment_id, operation_definition_id ,operation_request_id,
operation_response_id, sensor_id, customer_id,event_id,  reason_id, state_id,time_id,timestamp
  from public.second_fact 
JOIN (SELECT public.dim_process_segment.process_segment_name AS process_segment_name, public.dim_process_segment.stream_name AS stream_name, 
public.dim_process_segment.id AS id 
FROM public.dim_process_segment 
WHERE process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')) AS anon_1 ON anon_1.id = public.second_fact.process_segment_id 

--JOIN (SELECT public.dim_date.date_actual AS date_actual 
--FROM public.dim_date 
--WHERE public.dim_date.date_actual IN ('2020-09-01','2020-09-02','2020-09-03','2020-09-04','2020-09-05','2020-09-06','2020-09-07')) AS anon_2 ON anon_2.date_actual = public.second_fact.date_id



--JOIN (SELECT public.dim_time_sec.shift_end AS shift_end, public.dim_time_sec.full_time as full_time 
--FROM public.dim_time_sec 
--WHERE shift_end IN (TRUE)) AS anon_3 ON anon_3.full_time = public.second_fact.time_id


where public.second_fact.kpi_id in (13,14,16)
and public.second_fact.timestamp in (select timestamp from public.second_fact where date_id in (SELECT public.dim_date.date_actual AS date_actual FROM public.dim_date 
WHERE public.dim_date.date_actual IN ('2020-09-01','2020-09-02','2020-09-03','2020-09-04','2020-09-05','2020-09-06','2020-09-07')) 
and time_id in (SELECT public.dim_time_sec.full_time as full_time FROM public.dim_time_sec WHERE shift_end IN (TRUE)))
)
as A

 

left JOIN (select
      date_id,location_id, personnel_id, equipment_id, material_id, process_segment_id, operation_definition_id ,operation_request_id,
        operation_response_id, sensor_id, customer_id,event_id, kpi_id, property_id, reason_id, state_id, time_id, timestamp,
        value_mean as availability from public.second_fact where kpi_id =13) as X
        ON
		x.timestamp = A.timestamp
        --x.date_id = A.date_id
        AND x.process_segment_id = A.process_segment_id
        --AND x.time_id = A.time_id
 

 

left JOIN (select
      date_id,location_id, personnel_id, equipment_id, material_id, process_segment_id, operation_definition_id ,operation_request_id,
        operation_response_id, sensor_id, customer_id,event_id, kpi_id, property_id, reason_id, state_id, time_id,timestamp,
        value_mean as effectivness from public.second_fact where kpi_id =14) as Y
        ON 
		y.timestamp = A.timestamp
        --y.date_id = A.date_id
        AND y.process_segment_id = A.process_segment_id
        --AND y.time_id = A.time_id 
left JOIN (select
      date_id,location_id, personnel_id, equipment_id, material_id, process_segment_id, operation_definition_id ,operation_request_id,
        operation_response_id, sensor_id, customer_id,event_id, kpi_id, property_id, reason_id, state_id, time_id,timestamp,
        value_mean as oee from public.second_fact where kpi_id =16) as Z
        ON
		z.timestamp = A.timestamp
        --z.date_id = A.date_id 
        AND z.process_segment_id = A.process_segment_id
        --AND z.time_id = A.time_id
group by A.process_segment_name
--------------
--use case 4
explain analyze
select A.process_segment_name,avg(X.availability), avg(Y.effectivness), avg(Z.oee)  
from  
(select distinct anon_2.mmyyyy as mmyyyy, anon_1.process_segment_name as process_segment_name,anon_3.shift_end as shift_end,
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


JOIN (SELECT public.dim_time_sec.shift_end AS shift_end, public.dim_time_sec.full_time as full_time 
FROM public.dim_time_sec 
WHERE shift_end IN (TRUE)) AS anon_3 ON anon_3.full_time = public.second_fact.time_id


where public.second_fact.kpi_id in (13,14,16)
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
        value_mean as oee from public.second_fact where kpi_id =16) as Z
        ON 
        z.date_id = A.date_id 
        AND z.process_segment_id = A.process_segment_id
        AND z.time_id = A.time_id
group by A.process_segment_name
--------------------------
--use case 10
explain analyze
select A.process_segment_name,avg(X.availability), avg(Y.effectivness), avg(Z.oee)  
from  
(select distinct anon_2.mmyyyy as mmyyyy, anon_1.process_segment_name as process_segment_name,anon_3.shift_end as shift_end,
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
WHERE true) AS anon_2 ON anon_2.date_actual = public.second_fact.date_id


JOIN (SELECT public.dim_time_sec.shift_end AS shift_end, public.dim_time_sec.full_time as full_time 
FROM public.dim_time_sec 
WHERE shift_end IN (TRUE)) AS anon_3 ON anon_3.full_time = public.second_fact.time_id


where public.second_fact.kpi_id in (13,14,16)
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
        value_mean as oee from public.second_fact where kpi_id =16) as Z
        ON 
        z.date_id = A.date_id 
        AND z.process_segment_id = A.process_segment_id
        AND z.time_id = A.time_id
group by A.process_segment_name
