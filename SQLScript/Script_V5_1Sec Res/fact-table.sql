SET search_path TO public; -- Update with your desired schema


drop table if exists fact_table cascade;
CREATE TABLE fact_table(
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

------------------------------------------------------------------
drop function if exists fact_table_gen cascade;
CREATE FUNCTION fact_table_gen() returns integer AS $$

DECLARE
iterator int;
TS TimeStamp;
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

recordCountV int;
duration_minV int;
duration_meanV int;
duration_maxV int;
duration_totalV int;
duration_unitsV int;
value_minV int;
value_q1V int;
value_meanV int;
value_q3V int;
value_maxV int;
value_totalV int;
value_unitsV int;

BEGIN
--initial value
iterator:= 0;
DateID:=date '2019-01-01';
TimeID:=time '00:00:00';

while iterator < 86400*3

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
recordtypeUIDV := floor(random()*20+1);
recordcountV := floor(random()*9+1);
duration_minV := floor(random()*9+1);
duration_meanV := floor(random()*9+1);
duration_maxV := floor(random()*9+1);
duration_totalV := floor(random()*9+1);
duration_unitsV := floor(random()*9+1);
value_minV := floor(random()*9+1);
value_q1V := floor(random()*9+1);
value_meanV := floor(random()*9+1);
value_q3V := floor(random()*9+1);
value_maxV := floor(random()*9+1);
value_totalV := floor(random()*9+1);
value_unitsV := floor(random()*9+1);

--Inserting sensors value
INSERT INTO fact_table
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
recordtypeUIDV,
recordcountV,
duration_minV ,
duration_meanV ,
duration_maxV ,
duration_totalV ,
duration_unitsV ,
value_minV ,
value_q1V ,
value_meanV ,
value_q3V ,
value_maxV ,
value_totalV, 
value_unitsV
);

--Time and date stamp Updates

iterator := iterator + 1;
TimeID := TimeID +interval '1 second';
DateID := date '2019-01-01' + iterator*interval '1 second';


END LOOP;
RETURN 1;
END; $$

LANGUAGE PLPGSQL;

select fact_table_gen();

select equipment_uid,record_type_uid from fact_table where record_type_uid=2;
