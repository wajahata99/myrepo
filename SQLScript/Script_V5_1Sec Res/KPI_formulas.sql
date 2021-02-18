--APT formula function
Drop Function if exists APT_func cascade;
CREATE OR REPLACE FUNCTION APT_func(date_id_start_V date, date_id_end_V date, time_id_start_V time, time_id_end_V time, process_seg_code_V varchar)
    RETURNS void 
	AS $$
declare
date_id_VV date;
time_id_VV time;
value_mean_VV numeric;
process_segment_uid_VV int;

BEGIN
   date_id_VV = date_id_end_V;
   time_id_VV = time_id_end_V;
   process_segment_uid_VV = (select id from dim_process_segment where process_segment_code = process_seg_code_V);
   value_mean_VV = (SELECT
      round(avg(F.value_mean),2)  
   FROM fact_table F, Dim_Date D, Dim_TIME T, Dim_record_type R, Dim_process_segment P
   WHERE F.Date_ID = D.Date_actual
		AND D.date_actual between date_id_start_V and date_id_end_V
		AND T.Time_ID = F.Time_ID
		AND T.Time_ID between time_id_start_V and time_id_end_V
		AND R.ID = F.record_type_UID  
		AND R.record_type = 'CEPEvent'
		AND R.record_category = 'StateEvent' 
        AND P.ID = F.process_segment_uid
		AND P.process_segment_code in (process_seg_code_V));	
		
	insert into fact_table_5min (date_id,time_id,value_mean, process_segment_uid)
	values (date_id_VV, time_id_VV, value_mean_VV, process_segment_uid_VV);
	
END;
$$ LANGUAGE plpgsql;
-------------------------------------
--APT formula function 
DO
$$
declare
date_id_start_VV date;
date_id_end_VV date;
time_id_start_VV time;
time_id_end_VV time;
process_segment_uid_VV int;
record_type_VV varchar;
record_category_VV varchar;
value_mean_VV numeric;


BEGIN
	date_id_start_VV := $1;
	date_id_end_VV := $2;
	time_id_start_VV := $3;
	time_id_end_VV := $4;
	process_segment_uid_VV := $5;
	record_type_VV := $6;
	record_category_VV := $7;
	
   process_segment_uid_VV = (select id from dim_process_segment where process_segment_code = process_seg_code_V);
   value_mean_VV = (SELECT
      round(avg(F.value_mean),2)  
   FROM fact_table F, Dim_Date D, Dim_TIME T, Dim_record_type R, Dim_process_segment P
   WHERE F.Date_ID = D.Date_actual
		AND D.date_actual between date_id_start_V and date_id_end_V
		AND T.Time_ID = F.Time_ID
		AND T.Time_ID between time_id_start_V and time_id_end_V
		AND R.ID = F.record_type_UID  
		AND R.record_type = 'CEPEvent'
		AND R.record_category = 'StateEvent' 
        AND P.ID = F.process_segment_uid
		AND P.process_segment_code in (process_seg_code_V));	
		
	insert into fact_table_5min (date_id,time_id,value_mean, process_segment_uid)
	values (date_id_start_VV, date_id_end_VV, time_id_start_VV, time_id_end_VV, value_mean_VV, process_segment_uid_VV);
	
END;
$$ LANGUAGE plpgsql;

---------------------------------------
/*
SELECT
      round(avg(F.value_mean),2)  
   FROM fact_table F, Dim_Date D, Dim_TIME T, Dim_record_type R, Dim_process_segment P
   WHERE F.Date_ID = D.Date_actual
		AND D.date_actual = date '2019-01-01'
		AND T.Time_ID = F.Time_ID
		AND T.Time_ID between time '00:00:00' and time '00:05:00'
		AND R.ID = F.record_type_UID  
		AND R.record_type = 'CEPEvent'
		AND R.record_category = 'StateEvent' 
        AND P.ID = F.process_segment_uid
		AND P.process_segment_code in ('Instance_ID_1');
		
*/