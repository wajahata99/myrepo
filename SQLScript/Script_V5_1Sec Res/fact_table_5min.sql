--5 minutes fact table
SET search_path TO public; -- Update with your desired schema

drop table if exists fact_table_5min cascade;
CREATE TABLE fact_table_5min(
	
	date_id	date,
	time_id Time,
	personnel_uid int,
	process_segment_uid int,
	equipment_uid int,
	material_uid int,
	sensor_uid int,
	customer_uid int,
	location_uid int,
	operation_def_uid int,
	operation_request_uid int,
	operation_response_uid int,
	record_type_uid int,
	
	record_count numeric(6,2),
	duration_min numeric(6,2),
	duration_mean numeric(6,2),
	duration_max numeric(6,2),
	duration_total numeric(6,2),
	duration_units numeric(20),
	value_min numeric(6,2),
	value_q1 numeric(6,2),
	value_mean numeric(6,2),
	value_q3 numeric(6,2),
	value_max numeric(6,2),
	value_total numeric(6,2),
	value_units numeric(20),
	------------------------------------
	foreign key (date_id) references dim_date (date_actual),
	foreign key (time_id) references dim_time (time_id),
	foreign key (personnel_uid) references dim_process_segment (id),
	foreign key (process_segment_uid) references dim_sensor (id),
	foreign key (equipment_uid) references dim_equipment (id),
	foreign key (material_uid) references dim_material (id),
	foreign key (sensor_uid) references dim_sensor (id),
	foreign key (customer_uid) references dim_customer (id),
	foreign key (location_uid) references dim_location (id),
	foreign key (operation_def_uid) references dim_operation_def (id),
	foreign key (operation_response_uid) references dim_operation_response (id),
	foreign key (operation_request_uid) references dim_operation_request (id),
	foreign key (record_type_uid) references dim_record_type (id));
	
--------------------------------------------------
drop function if exists fact_table_gen cascade;
CREATE FUNCTION fact_table_gen() returns integer AS $$

DECLARE
iterator int;
DateID date;
TimeID time;
personnelUIDV int;
ProcessSegmentUIDV int;
EquipmentUIDV int;
MaterialUIDV int;
SensorUIDV int;
customerUIDV int;
LocationUIDV int;
operationdefUIDV int;
operationresponseUIDV int;
operationrequest int;
recordtypeUIDV int;

BEGIN
--initial value
iterator:= 0;
DateID:=date '2019-01-01';
TimeID:=time '00:00:00';

while iterator < 1

LOOP
--mapping from the enriched tables is required

personnelUIDV := floor(random()*9+1);
ProcessSegmentUIDV := floor(random()*9+1);
EquipmentUIDV := floor(random()*9+1);
MaterialUIDV := floor(random()*9+1);
SensorUIDV := floor(random()*9+1);
customerUIDV := floor(random()*9+1);
LocationUIDV := floor(random()*9+1);
operationdefUIDV := floor(random()*9+1);
operationresponseUIDV := floor(random()*9+1);
operationrequest := floor(random()*9+1);
recordtypeUIDV := floor(random()*9+1);

--Inserting sensors value
INSERT INTO fact_table_5min
values(

DateID,
TimeID,
personnelUIDV,
ProcessSegmentUIDV,
EquipmentUIDV,
MaterialUIDV,
SensorUIDV,
customerUIDV,
LocationUIDV,
operationdefUIDV,
operationresponseUIDV,
operationrequest,
recordtypeUIDV
	
);

--Time and date stamp Updates

iterator := iterator + 1;
TimeID := TimeID +interval '300 second';
DateID := date '2019-01-01' + iterator*interval '300 second';


END LOOP;
RETURN 1;
END; $$

LANGUAGE PLPGSQL;

select fact_table_gen();

select * from fact_table_5min;

--select * from fact_table_5min order by date_id,time_id;

--select value_mean from fact_table_5min where date_id='2019-01-01' and time_id= '00:05:00';