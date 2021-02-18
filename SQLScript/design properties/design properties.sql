set search_path to public;
--Handling properties
select * from dim_property where property_concept = 'equipment'
--Equipment
INSERT INTO public.dim_property(
	id, concept_dimension_source, property_concept, property_code, property_name, property_value, property_value_type, insert_date_time, last_update_date_time, delete_flag)
	VALUES (200,'dim_equipment', 'equipment', 'power_rating', 'Power Rating', '50kW', 'design', '2021-01-01 00:00:00', '2021-01-01 00:00:00', false);
INSERT INTO public.dim_property(
	id, concept_dimension_source, property_concept, property_code, property_name, property_value, property_value_type, insert_date_time, last_update_date_time, delete_flag)
	VALUES (202,'dim_equipment', 'equipment', 'manufacturer', 'Manufacturer', 'Intech', 'design', '2021-01-01 00:00:00', '2021-01-01 00:00:00', false);


--P-seg
INSERT INTO public.dim_property(
	id, concept_dimension_source, property_concept, property_code, property_name, property_value, property_value_type, insert_date_time, last_update_date_time, delete_flag)
	VALUES (201,'dim_process_segment', 'process_segment', 'power_rating', 'Power Rating', '50kW', 'design', '2021-01-01 00:00:00', '2021-01-01 00:00:00', false);



CREATE TABLE IF NOT EXISTS equipment_properties_bridge (
   equipment_id int,
   property_id int,
	CONSTRAINT fk_1 FOREIGN KEY(equipment_id) REFERENCES dim_equipment(id),
	CONSTRAINT fk_2 FOREIGN KEY(property_id) REFERENCES dim_property(id)
);

delete from equipment_properties_bridge;
INSERT INTO equipment_properties_bridge(equipment_id, property_id)
VALUES (200,200),
		(200,202);
		
-- process Segment bridge
CREATE TABLE IF NOT EXISTS process_segment_properties_bridge (
   process_segment_id int,
   property_id int,
	CONSTRAINT fk_1 FOREIGN KEY(process_segment_id) REFERENCES dim_equipment(id),
	CONSTRAINT fk_2 FOREIGN KEY(property_id) REFERENCES dim_property(id)
);

delete from process_segment_properties_bridge;
INSERT INTO process_segment_properties_bridge(process_segment_id, property_id)
VALUES (200,201);

-----------------
--view Query
--Use case 1-->Search process segments having equipment's manufacturer intech
select A.process_segment_name, A.equipment_name
from  
(select anon_2.mmyyyy as mmyyyy, anon_1.process_segment_name as process_segment_name, anon_3.equipment_name as equipment_name,
 date_id, location_id, personnel_id, equipment_id, material_id,
 process_segment_id, operation_definition_id ,operation_request_id,
operation_response_id, sensor_id, customer_id,event_id,  reason_id, state_id,time_id  
 from public.second_fact
 
JOIN (SELECT public.dim_process_segment.process_segment_name AS process_segment_name, public.dim_process_segment.stream_name AS stream_name, 
public.dim_process_segment.id AS id 
FROM public.dim_process_segment 
WHERE true) AS anon_1 ON anon_1.id = public.second_fact.process_segment_id 

 
JOIN (SELECT public.dim_date.mmyyyy AS mmyyyy, public.dim_date.date_actual as date_actual
FROM public.dim_date 
WHERE mmyyyy IN ('092020')) AS anon_2 ON anon_2.date_actual = public.second_fact.date_id

JOIN (SELECT e.equipment_name AS equipment_name, 
	e.id AS id 
	FROM public.dim_equipment e 
	join public.equipment_properties_bridge epb
	on epb.equipment_id = e.id
	join dim_property p
	on p.id = epb.property_id
	WHERE p.property_name = 'Manufacturer'
	 and p.property_concept = 'equipment'
	 and p.property_value = 'Intech') AS anon_3 ON anon_3.id = public.second_fact.equipment_id   
 
group by anon_2.mmyyyy , anon_1.process_segment_name , anon_3.equipment_name,
 date_id, location_id, personnel_id, equipment_id, material_id,
 process_segment_id, operation_definition_id ,operation_request_id,
operation_response_id, sensor_id, customer_id,event_id,  reason_id, state_id,time_id
 
)
as A

--Use case 2-->Search process segments availability having power rating 50kW

select A.process_segment_name, avg(A.availability)
from  
(select anon_2.mmyyyy as mmyyyy, anon_1.process_segment_name as process_segment_name, 
 date_id, location_id, personnel_id, equipment_id, material_id,
 process_segment_id, operation_definition_id ,operation_request_id,
operation_response_id, sensor_id, customer_id,event_id,  reason_id, state_id,time_id,
  
 Max(CASE WHEN second_fact.kpi_id='13' THEN second_fact.value_mean END) "availability"
 
 from public.second_fact
 
JOIN (SELECT e.process_segment_name AS process_segment_name, e.stream_name AS stream_name, 
e.id AS id 
FROM public.dim_process_segment e
join public.process_segment_properties_bridge epb
	on epb.process_segment_id = e.id
	join dim_property p
	on p.id = epb.property_id
	WHERE p.property_name = 'Power Rating'
	 and p.property_concept = 'process_segment') AS anon_1 ON anon_1.id = public.second_fact.process_segment_id 

 
JOIN (SELECT public.dim_date.mmyyyy AS mmyyyy, public.dim_date.date_actual as date_actual
FROM public.dim_date 
WHERE mmyyyy IN ('092020')) AS anon_2 ON anon_2.date_actual = public.second_fact.date_id

 Where public.second_fact.kpi_id IN (13)
group by anon_2.mmyyyy , anon_1.process_segment_name ,
 date_id, location_id, personnel_id, equipment_id, material_id,
 process_segment_id, operation_definition_id ,operation_request_id,
operation_response_id, sensor_id, customer_id,event_id,  reason_id, state_id,time_id
 
)
as A

group by A.process_segment_name


---
--Use case 3-->Search process segments availability having equipment's manufacturer intech
select * from second_fact where 
kpi_id = 13 and process_segment_id =200
-- No result in following query because equipment is not_defined when kpi is ingested.

select A.process_segment_name, A.equipment_name,avg(A.availability)
from  
(select anon_2.mmyyyy as mmyyyy, anon_1.process_segment_name as process_segment_name, anon_3.equipment_name as equipment_name,
 date_id, location_id, personnel_id, equipment_id, material_id,
 process_segment_id, operation_definition_id ,operation_request_id,
operation_response_id, sensor_id, customer_id,event_id,  reason_id, state_id,time_id,
  
 Max(CASE WHEN second_fact.kpi_id='13' THEN second_fact.value_mean END) "availability"
 
 from public.second_fact
 
JOIN (SELECT public.dim_process_segment.process_segment_name AS process_segment_name, public.dim_process_segment.stream_name AS stream_name, 
public.dim_process_segment.id AS id 
FROM public.dim_process_segment 
WHERE true) AS anon_1 ON anon_1.id = public.second_fact.process_segment_id 

 
JOIN (SELECT public.dim_date.mmyyyy AS mmyyyy, public.dim_date.date_actual as date_actual
FROM public.dim_date 
WHERE mmyyyy IN ('092020')) AS anon_2 ON anon_2.date_actual = public.second_fact.date_id

JOIN (SELECT e.equipment_name AS equipment_name, 
	e.id AS id 
	FROM public.dim_equipment e 
	join public.equipment_properties_bridge epb
	on epb.equipment_id = e.id
	join dim_property p
	on p.id = epb.property_id
	WHERE p.property_name = 'Manufacturer'
	 and p.property_concept = 'equipment') AS anon_3 ON anon_3.id = public.second_fact.equipment_id   
 
 Where public.second_fact.kpi_id IN (13)
group by anon_2.mmyyyy , anon_1.process_segment_name , anon_3.equipment_name,
 date_id, location_id, personnel_id, equipment_id, material_id,
 process_segment_id, operation_definition_id ,operation_request_id,
operation_response_id, sensor_id, customer_id,event_id,  reason_id, state_id,time_id
 
)
as A

group by A.process_segment_name, A.equipment_name

----
select e.equipment_name, ep.property_name, ep.property_value,f.availability 
from equipment_properties ep, equipment_properties_bridge epb, dim_equipment e, kpi_fact f
where ep.id = epb.equipment_property_ID
and epb.equipment_id = e.id
and e.id=f.equipment_id
and ep.id in (select id from equipment_properties where property_name in ('power_ratting','nominal_pressure') 
			  and property_value in ('20kW','20bar'))

----------------------
INSERT INTO equipment_properties(id,property_name, property_value, property_value_type)
VALUES (1,'nominal_pressure','20bar','categorical'),
		(2,'nominal_pressure','50bar','categorical'),
		(3,'power_ratting','20kW','categorical'),
		(4,'power_ratting','50kW','categorical');
		
----------
--Query to display respective properties values in the filters
--Option 1
select ep.property_value
from equipment_properties ep, equipment_properties_bridge epb, dim_equipment e
where ep.id = epb.equipment_property_ID
and epb.equipment_id = e.id
and ep.property_name = 'power_ratting';

--Option 2-->Query to display respective properties values in the filters
select property_value from equipment_properties
where property_name = 'power_ratting';	

--Query to display respective properties of a dimension in dimensions section
--Option 1
select distinct(property_name)
from equipment_properties ep, equipment_properties_bridge epb, dim_equipment e
where ep.id = epb.equipment_property_ID
and epb.equipment_id = e.id;

--Option 2-->assumption --> only properties associated have with dimension are ingested.
select distinct(property_name) from equipment_properties;

