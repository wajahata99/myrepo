select *
from public.second_fact F, public.dim_property P

where F.property_id = P.id
and P.id = 13;

-- Results of this query show the equipments (with ids 11 to 18) which have property manufacturer with id 13. Most of the FKs are irrelevant and have not_defined value FK i.e. 100. 

-----------------------
-- inserting kpi oee for equipment with id 11
INSERT INTO second_fact(date_id, location_id,personnel_id,equipment_id,material_id,process_segment_id,operation_definition_id,operation_request_id,operation_response_id,sensor_id,customer_id,event_id, kpi_id,record_count,value_min,value_q1,value_mean,value_q3,value_max,value_total,value_units,value_string,duration_units, property_id,duration_total,duration_min,duration_mean,duration_max,time_id, state_id,reason_id, timestamp, value_timestamp, comments)
VALUES  	('2020-07-29', 100, 100, 11,--equipment_id
			 100, 2, 100, 100, 100,100,100,  100,--event_id
		26,--kpi_id 
		null, null, null, null,null, null,null,null,null,null,100,null,null,'00:30:00',null,
	   '06:00:00',--time_id
	   100,28,'2020-07-29','2020-07-29',null)
RETURNING *;
------------------------
-- searching for oee for equipments with property id 13
select *
from public.second_fact F, public.dim_equipment E, public.dim_kpi K, public.dim_property P

where F.equipment_id = E.id
and F.kpi_id=K.id
and K.id = 26 -- id for oee for equipment concept.
and F.property_id = P.id
and P.id = 13;
-- No result returned because when property will be ingested, kpi will not be ingested. And when kpi will be ingested property will not be ingested because design properties are ingested only once.
--------------------------
select * from public.second_fact;
select * from public.dim_kpi;
select * from public.dim_property;
