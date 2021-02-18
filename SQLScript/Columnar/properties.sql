--Handling properties

CREATE TABLE IF NOT EXISTS equipment_properties (
   id int primary key,
   property_name text,
   property_value text,
   property_value_type text
);

INSERT INTO equipment_properties(id,property_name, property_value, property_value_type)
VALUES (1,'nominal_pressure','20bar','categorical'),
		(2,'nominal_pressure','50bar','categorical'),
		(3,'power_ratting','20kW','categorical'),
		(4,'power_ratting','50kW','categorical');

CREATE TABLE IF NOT EXISTS equipment_properties_bridge (
   equipment_id int,
   equipment_property_id int,
	CONSTRAINT fk_1 FOREIGN KEY(equipment_id) REFERENCES dim_equipment(id),
	CONSTRAINT fk_2 FOREIGN KEY(equipment_property_id) REFERENCES equipment_properties(id)
);

INSERT INTO equipment_properties_bridge(equipment_id, equipment_property_id)
VALUES (11,1),
		(11,3),
		(12,2),
		(12,4);
		
--------------
--Scenario 1
--Query to display respective properties of a dimension in dimensions section
--Option 1
select distinct(property_name)
from equipment_properties ep, equipment_properties_bridge epb, dim_equipment e
where ep.id = epb.equipment_property_ID
and epb.equipment_id = e.id;

--Option 2-->assumption --> only properties associated have with dimension are ingested.
select distinct(property_name) from equipment_properties;

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

------------
--Query for the grid
--Use case-->Search equipments having nominal_pressure 20bar and power_ratting of 50kW
--> draw back --> property values have to be distinct, i.e. query can't distinguih between "20" bar and "20" kW.
			  --> Same fact is repeated equal to the number of times there are properties.	
select e.equipment_name, ep.property_name, ep.property_value,f.availability 
from equipment_properties ep, equipment_properties_bridge epb, dim_equipment e, kpi_fact f
where ep.id = epb.equipment_property_ID
and epb.equipment_id = e.id
and e.id=f.equipment_id
and ep.id in (select id from equipment_properties where property_name in ('power_ratting','nominal_pressure') 
			  and property_value in ('20kW','20bar'))

------------------------------
--Scenario 2
--Search equipment's ooe having nominal_pressure 20bar and power_ratting of 50kW 
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
