--KPI cPOC

--KPI Config tables
----------------------------------------------------------
--KPI Def

drop table if exists kpi_def cascade;
create table kpi_Def(
	kpi_def_id varchar(20) primary key, 
	entity_with_Kpi varchar(20),
	Class_id varchar(20)
);

insert into kpi_def(kpi_def_id,Entity_with_kpi,class_id)
values('oee1','equipmentID1','equipmentClass1'),
      ('oee2','equipmentID2','equipmentClass1'),
	  ('A1','equipmentID3','equipmentClass1')
	   ;

select * from kpi_def;

--------------------------------------------------------
--KPI Type
drop table if exists kpi_type cascade;
create table kpi_type(
	kpi_type_id varchar(20) primary key, 
	Kpi_name varchar(20),
	kpi_description varchar(100),
	kpi_logic varchar(1000));

insert into kpi_type(kpi_type_id,kpi_name,kpi_description,kpi_logic)
values('kpi_id1','OEE','Overall equipment effectiveness','A*P*Q'),
 	  ('kpi_id2','A','Availability','APT/PBT');

select * from kpi_type;
---------------------------------------------------------
--KPI def and type bridge table

drop table if exists kpi_def_type_bridge cascade;
create table kpi_def_type_bridge(
	kpi_type_id varchar(20), 
	kpi_def_id varchar(20),
	foreign key (kpi_type_id) references kpi_type (kpi_type_id),
	foreign key (kpi_def_id) references kpi_def (kpi_def_id)
    );

insert into kpi_def_type_bridge(kpi_type_id,kpi_def_id)
values('kpi_id1','oee1'),
      ('kpi_id2','A1');

select * from kpi_def_type_bridge;

---------------------------------------------------------
---------------------------------------------------------
--5 minutes fact table
SET search_path TO public; -- Update with your desired schema

drop table if exists fact_table_5min cascade;
CREATE TABLE fact_table_5min(
	ts timestamp,
	date_id	date,
	time_id Time,
	recipe_uid Serial,
	process_segment_uid Serial,
	equipment_uid Serial,
	material_uid Serial,
	sensor_uid Serial,
	event_uid Serial,
	location_uid Serial,
	operation_uid serial,
	recordtype_uid serial,
	
	PBT numeric(6,2),
	APT numeric(6,2),
	
	Availability numeric(6,2),
	Performance numeric(6,2),
	Quality numeric(6,2),
	
	OEE numeric(6,2), 

	------------------------------------
	
	foreign key (date_id) references dim_date (date_actual),
	foreign key (time_id) references dim_time (time_id),
	foreign key (recipe_uid) references dim_process_segment (id),
	foreign key (process_segment_uid) references dim_sensor (id),
	foreign key (equipment_uid) references dim_equipment (id),
	foreign key (material_uid) references dim_material (id),
	foreign key (sensor_uid) references dim_sensor (id),
	foreign key (event_uid) references dim_event (id),
	foreign key (location_uid) references dim_location (id),
	foreign key (operation_uid) references dim_operation (id),
	foreign key (recordtype_uid) references dim_recordtype (id));
------------------------------------------------------------------
------------------------------------------------------------------
drop function if exists fact_table_gen cascade;
CREATE FUNCTION fact_table_gen() returns integer AS $$

DECLARE
iterator int;
TS TimeStamp;
DateID date;
TimeID time;
TimeStampIDSensor timestamp;
TimeStampIDEvent timestamp;
RecipeUIDV int;
ProcessSegmentUIDV int;
EquipmentUIDV int;
MaterialUIDV int;
SensorUIDV int;
EventUIDV int;
LocationUIDV int;
OperationUIDV int;
recordtypeUIDV int;



BEGIN
--initial value
iterator:= 0;
DateID:=date '2019-01-01';
TimeID:=time '00:00:00';

while iterator < 1

LOOP
--mapping from the enriched tables is required

RecipeUIDV := floor(random()*19+1);
ProcessSegmentUIDV := floor(random()*19+1);
EquipmentUIDV := floor(random()*79+1);
MaterialUIDV := floor(random()*19+1);
SensorUIDV := floor(random()*19+1);
EventUIDV := floor(random()*198+1);
LocationUIDV := floor(random()*2+1);
OperationUIDV := floor(random()*19+1);
recordtypeUIDV := floor(random()*22+1);

--Inserting sensors value
INSERT INTO
--All UIDs, and sensorID
fact_table_5min(date_id, time_id,
	recipe_uid, process_segment_uid, equipment_uid, material_uid,
	sensor_uid, event_uid, location_uid, operation_uid, recordtype_uid)
values(
	DateID,
	TimeID,
	RecipeUIDV,
	ProcessSegmentUIDV,
	EquipmentUIDV,
	MaterialUIDV,
	SensorUIDV,
	EventUIDV,
	LocationUIDV,
	OperationUIDV,
	recordtypeUIDV
);


-----------------------------------------------
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
--------------------------------------------------
--------------------------------------------------
--Calculating subKPI from the base grain fact table
UPDATE fact_table_5min
SET apt = (SELECT
      round(avg(F.sensor_val),2)  
   FROM fact_table F, Dim_Date D, Dim_TIME T, Dim_recordtype R, Dim_process_segment P
   WHERE F.Date_ID = D.Date_actual
		AND D.date_actual = date '2019-01-02'
		AND T.Time_ID = F.Time_ID
		AND T.Time_ID between time '00:00:00' and time '00:05:00'
		AND R.ID = F.recordtype_UID  
		AND R.record_type = 'CEPEvent'
		AND R.record_category = 'StateEvent' 
        AND P.ID = F.process_segment_uid
		AND P.proc_seg_id in ('ProcessSegID1'))*
		(SELECT
      round(avg(F.sensor_val),2)  
   FROM fact_table F, Dim_Date D, Dim_TIME T, Dim_recordtype R, Dim_process_segment P
   WHERE F.Date_ID = D.Date_actual
		AND D.date_actual = date '2019-01-02'
		AND T.Time_ID = F.Time_ID
		AND T.Time_ID between time '00:00:00' and time '00:05:00'
		AND R.ID = F.recordtype_UID  
		AND R.record_type = 'CEPEvent'
		AND R.record_category = 'StateEvent' 
        AND P.ID = F.process_segment_uid
		AND P.proc_seg_id in ('ProcessSegID1')),
----------------------------------
pbt = (SELECT
      round(avg(F.sensor_val),2)  
   FROM fact_table F, Dim_Date D, Dim_TIME T, Dim_recordtype R, Dim_process_segment P
   WHERE F.Date_ID = D.Date_actual
		AND D.date_actual = date '2019-01-02'
		AND T.Time_ID = F.Time_ID
		AND T.Time_ID between time '00:00:00' and time '00:05:00'
		AND R.ID = F.recordtype_UID  
		AND R.record_type = 'CEPEvent'
		AND R.record_category = 'StateEvent' 
        AND P.ID = F.process_segment_uid
		AND P.proc_seg_id in ('ProcessSegID1'))*
		(SELECT
      round(avg(F.sensor_val),2)  
   FROM fact_table F, Dim_Date D, Dim_TIME T, Dim_recordtype R, Dim_process_segment P
   WHERE F.Date_ID = D.Date_actual
		AND D.date_actual = date '2019-01-02'
		AND T.Time_ID = F.Time_ID
		AND T.Time_ID between time '00:00:00' and time '00:05:00'
		AND R.ID = F.recordtype_UID  
		AND R.record_type = 'CEPEvent'
		AND R.record_category = 'StateEvent' 
        AND P.ID = F.process_segment_uid
		AND P.proc_seg_id in ('ProcessSegID1'))	
		
WHERE
   Date_id='2019-01-01';
----------------------------------------
--Calculating second layer of KPIs
--Calculating Availability and using dummy values of performance and quality, which should be calculated from subKPIs.
UPDATE fact_table_5min
SET availability = (select apt/pbt from fact_table_5min), 
    performance = .8,
	quality = .8
WHERE
   Date_id='2019-01-01';
--Add time in where clause as well   

--------------------
-- Calculating third layer of KPIs
UPDATE fact_table_5min
SET oee = (select performance*availability*quality from fact_table_5min) 
WHERE
   Date_id='2019-01-01';   
--------------------   

--Question: Should there be separate columns for KPIs and subKPIs?
--The role of KPI configuration screen is in FK's figuring out or in finding the logic.
   
-----------------------------------------------
-- cron testing
SELECT cron.schedule('30 3 * * 6', $$DELETE FROM events WHERE event_time < now() - interval '1 week'$$);
