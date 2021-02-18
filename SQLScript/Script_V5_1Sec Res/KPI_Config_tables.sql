
--KPI calcs POC
--------------------------------------------------------
--KPI Type
drop table if exists kpi_type cascade;
create table kpi_type(
	kpi_type_id varchar(20) primary key, 
	Kpi_name varchar(20),
	kpi_description varchar(100),
	kpi_logic varchar(2000),
	entity_type_on_which_kpi_is_applicable varchar(20));

insert into kpi_type(
	kpi_type_id,
	kpi_name,
	kpi_description,
	kpi_logic,
	entity_type_on_which_kpi_is_applicable)
	
values  ('kpi_id1','APT','Actual Planned Time', 
	   'SELECT round(avg(F.value_mean),2)
   FROM fact_table F, Dim_Date D, Dim_TIME T, Dim_record_type R, Dim_process_segment P
   WHERE F.Date_ID = D.Date_actual
		AND D.date_actual between $1 and $2
		AND T.Time_ID = F.Time_ID
		AND T.Time_ID between $3 and $4
		AND R.ID = F.record_type_UID  
		AND R.record_type = $6
		AND R.record_category = $7
	    AND R.record_state_group = $8 
        AND P.ID = F.process_segment_uid
		AND P.process_segment_code in ($5)',
	   'motor'),
		
	  ('kpi_id2','PBT','Planned Busy time',
	   'SELECT round(avg(F.value_mean),2)
   FROM fact_table F, Dim_Date D, Dim_TIME T, Dim_record_type R, Dim_process_segment P
   WHERE F.Date_ID = D.Date_actual
		AND D.date_actual between $1 and $2
		AND T.Time_ID = F.Time_ID
		AND T.Time_ID between $3 and $4
		AND R.ID = F.record_type_UID  
		AND R.record_type = $6
		AND R.record_category = $7
	    AND R.record_state_group = $8
        AND P.ID = F.process_segment_uid
		AND P.process_segment_code in ($5)',
	   'motor'),
		
	  ('kpi_id3','A','Availability',
	   '
	  select (SELECT F.duration_mean
   FROM fact_table_5min F, Dim_Date D, Dim_TIME T, Dim_record_type R, Dim_process_segment P
   WHERE F.Date_ID = D.Date_actual
		AND D.date_actual = $1
		AND T.Time_ID = F.Time_ID
		AND T.Time_ID = $2
		AND R.ID = F.record_type_UID  
		AND R.record_type = $3
		AND R.record_category = $4
        AND P.ID = F.process_segment_uid
		AND P.process_segment_code in ($5))
	   *
	   (SELECT F.duration_mean
   FROM fact_table_5min F, Dim_Date D, Dim_TIME T, Dim_record_type R, Dim_process_segment P
   WHERE F.Date_ID = D.Date_actual
		AND D.date_actual = $1
		AND T.Time_ID = F.Time_ID
		AND T.Time_ID = $2
		AND R.ID = F.record_type_UID  
		AND R.record_type = $3
		AND R.record_category = $6
        AND P.ID = F.process_segment_uid
		AND P.process_segment_code in ($5))',
	   'motor'),
		
	  ('kpi_id4','Q','Quality',null,'pump')
	  ;

select * from kpi_type;
----------------------------------------------------------
--KPI Def
drop table if exists kpi_def cascade;
create table kpi_def(
	kpi_def_id varchar(20) primary key, 
	entity_with_Kpi varchar(20),
	Entity_type varchar(20),
	frequency_in_seconds varchar(20),
	foreign key (Entity_type) references kpi_type (kpi_type_id)
);

insert into kpi_def(kpi_def_id,Entity_with_kpi,entity_type,frequency_in_seconds)
values('OEE123','Instance_ID_1','kpi_id1', '600 seconds'),
      ('APT123','Instance_ID_1','kpi_id2', '600 seconds'),
	  ('P123','Instance_ID_1','kpi_id3', '600 seconds'),
	  ('Q123','Instance_ID_1','kpi_id4', '600 seconds')
	   ;

select * from kpi_def;
----------------------------------------------
/*
F.date_id,
	F.time_id,
	F.personnel_uid,
	F.process_segment_uid,
	F.equipment_uid,
	F.material_uid,
	F.sensor_uid,
	F.customer_uid,
	F.location_uid,
	F.operation_def_uid,
	F.operation_request_uid,
	F.operation_response_uid,
	F.record_type_uid,
	
	F.record_count ,
	F.duration_min ,
	F.duration_mean ,
	F.duration_max ,
	F.duration_total ,
	F.duration_units,
	F.value_min ,
	F.value_q1 ,
	round(avg(F.value_mean),2) ,
	F.value_q3 ,
	F.value_max ,
	F.value_total,
	F.value_units
	
	*/select * from dim_record_type;
	