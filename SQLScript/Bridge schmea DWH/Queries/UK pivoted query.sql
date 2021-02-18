select X.date_actual, X.process_segment_name, X.availabilty, Y.effectivness, avg(Z.oee)
from(select anon_2.date_actual as date_actual, anon_1.process_segment_name as process_segment_name, 
	 date_id, location_id, personnel_id, equipment_id, material_id, process_segment_id, operation_definition_id 
	 ,operation_request_id,operation_response_id, sensor_id, customer_id,event_id, kpi_id, property_id,
	 reason_id, state_id, time_id, value_mean as availabilty 
	 from dwh.second_factJOIN 
	 (SELECT dwh.dim_process_segment.process_segment_name AS process_segment_name, dwh.dim_process_segment.id AS idFROM dwh.dim_process_segmentWHERE true) AS anon_1 ON anon_1.id = dwh.second_fact.process_segment_id
	 JOIN (SELECT dwh.dim_date.date_actual AS date_actualFROM dwh.dim_dateWHERE dwh.dim_date.date_actual IN ('2020-06-25')) AS anon_2 ON anon_2.date_actual = dwh.second_fact.date_idwhere dwh.second_fact.kpi_id =13)as X 
	 JOIN (select      date_id,location_id, personnel_id, equipment_id, material_id, process_segment_id, operation_definition_id ,operation_request_id,        operation_response_id, sensor_id, customer_id,event_id, kpi_id, property_id, reason_id, state_id, time_id,        value_mean as effectivness 
		   from dwh.second_fact where kpi_id =14) as Y      
		   ON        y.date_id = x.date_id        AND y.process_segment_id = x.process_segment_id        AND y.time_id = x.time_idJOIN (select      date_id,location_id, personnel_id, equipment_id, material_id, process_segment_id, operation_definition_id ,operation_request_id,        operation_response_id, sensor_id, customer_id,event_id, kpi_id, property_id, reason_id, state_id, time_id,        value_mean as oee 
																																		from dwh.second_fact where kpi_id =16) as Z        ON        z.date_id = x.date_id        AND z.process_segment_id = x.process_segment_id        AND z.time_id = x.time_id
																																		group by X.date_actual, X.process_segment_name, X.availabilty, Y.effectivness