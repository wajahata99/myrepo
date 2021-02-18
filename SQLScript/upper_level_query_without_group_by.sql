SELECT anon_2.anon_1_event_category AS dim_event__event_category, anon_2.anon_3_event_concept AS dim_event__event_concept, anon_2.anon_4_process_segment_name AS dim_process_segment__process_segment_name, anon_2.anon_5_operation_definition_name AS dim_operation_definition__operation_definition_name, anon_2.anon_6_shift AS dim_time_sec__shift, anon_2.anon_7_date_actual AS dim_date__date_actual 
FROM (SELECT public.second_fact.operation_request_id AS public_second_fact_operation_request_id, public.second_fact.operation_response_id AS public_second_fact_operation_response_id, public.second_fact.personnel_id AS public_second_fact_personnel_id, public.second_fact.process_segment_id AS public_second_fact_process_segment_id, public.second_fact.date_id AS public_second_fact_date_id, public.second_fact.operation_definition_id AS public_second_fact_operation_definition_id, public.second_fact.sensor_id AS public_second_fact_sensor_id, public.second_fact.customer_id AS public_second_fact_customer_id, public.second_fact.equipment_id AS public_second_fact_equipment_id, public.second_fact.event_id AS public_second_fact_event_id, public.second_fact.location_id AS public_second_fact_location_id, public.second_fact.material_id AS public_second_fact_material_id, public.second_fact.reason_id AS public_second_fact_reason_id, public.second_fact.state_id AS public_second_fact_state_id, public.second_fact.time_id AS public_second_fact_time_id, anon_1.event_category AS anon_1_event_category, anon_3.event_concept AS anon_3_event_concept, anon_4.process_segment_name AS anon_4_process_segment_name, anon_5.operation_definition_name AS anon_5_operation_definition_name, anon_6.shift AS anon_6_shift, anon_7.date_actual AS anon_7_date_actual, public.second_fact.timestamp AS public_second_fact_timestamp 
FROM public.second_fact JOIN (SELECT public.dim_event.event_category AS event_category, public.dim_event.id AS id 
FROM public.dim_event 
WHERE public.dim_event.event_category IN ('operational_state_event')) AS anon_1 ON anon_1.id = public.second_fact.event_id JOIN (SELECT public.dim_event.event_concept AS event_concept, public.dim_event.id AS id 
FROM public.dim_event 
WHERE public.dim_event.event_concept IN ('process_segment')) AS anon_3 ON anon_3.id = public.second_fact.event_id JOIN (SELECT public.dim_process_segment.process_segment_name AS process_segment_name, public.dim_process_segment.id AS id 
FROM public.dim_process_segment 
WHERE public.dim_process_segment.process_segment_name IN ('soap_line 2')) AS anon_4 ON anon_4.id = public.second_fact.process_segment_id JOIN (SELECT public.dim_operation_definition.operation_definition_name AS operation_definition_name, public.dim_operation_definition.id AS id 
FROM public.dim_operation_definition 
WHERE true) AS anon_5 ON anon_5.id = public.second_fact.operation_definition_id JOIN (SELECT public.dim_time_sec.shift AS shift, public.dim_time_sec.full_time AS full_time 
FROM public.dim_time_sec 
WHERE true) AS anon_6 ON anon_6.full_time = public.second_fact.time_id JOIN (SELECT public.dim_date.date_actual AS date_actual 
FROM public.dim_date 
WHERE true) AS anon_7 ON anon_7.date_actual = public.second_fact.date_id 
WHERE public.second_fact.timestamp > '2020-09-01T00:00:00' AND public.second_fact.timestamp < '2020-09-30T00:00:00') AS anon_2
--group by anon_2.anon_1_event_category , anon_2.anon_3_event_concept , anon_2.anon_4_process_segment_name , anon_2.anon_5_operation_definition_name , anon_2.anon_6_shift , anon_2.anon_7_date_actual
    
    
  
  

