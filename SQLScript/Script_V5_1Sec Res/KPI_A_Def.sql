---------------------------
--
DO
LANGUAGE plpgsql
$$
DECLARE

  time_id_start_V time;
  time_id_end_V time;
  date_id_start_V date;
  date_id_end_V date;
  --
  process_seg_code_V varchar;
  record_type_V varchar;
  record_category_V varchar;
  record_category_2_V  varchar;
--  record_state_V varchar;
  
  frequency varchar;
  --
  stmt text;
  stmt_result numeric;
  
BEGIN
	--
	time_id_end_V := select ;
	date_id_end_V := date_id_start_V + interval '600 second';
	--
	--Reading information from the KPI configuration table
	process_seg_code_V := (select entity_with_Kpi from kpi_def where kpi_def_id='APT123');
	record_type_V := 'subKPI';
	record_category_V := 'APT';
	record_category_2_V := 'PBT';
--	record_state_V := 'running';
	frequency := (select frequency_in_seconds from kpi_def where kpi_def_id='APT123');
    --
	stmt := (select kpi_logic from kpi_type where kpi_type_id= 'kpi_id3');
	--
	execute stmt
	into stmt_result
    using date_id_end_V, time_id_end_V, record_type_V, record_category_V, process_seg_code_V, 
	record_category_2_V;
	--
	insert into fact_table_5min (date_id, time_id, value_mean)
	values (date_id_end_V, time_id_end_V, stmt_result);

END;
$$;

select date_id, time_id, record_type_uid,value_mean, duration_mean from fact_table_5min;