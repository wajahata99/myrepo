CREATE OR REPLACE FUNCTION dwh.FactTableIngestion() 
  RETURNS VOID 
AS
$$
DECLARE 
   kpi_result varchar(20);
   kpi_def dwh.kpi_def%rowtype;
   kpi_type dwh.kpi_type%rowtype;
   selected_entity_id varchar(20);
   datetime_filter text;
   id_filter text;
   start_time time;
   end_time time;
   current_date_dim_id date;
   current_time_dim_id time;
   col_name text;
   entity_result dwh.fact_table%rowtype;
   apt_fk int;
   pbt_fk int;
BEGIN
	end_time := (select date_trunc('second', now()::time));
	start_time := end_time - Interval '5 minutes';
	current_date_dim_id := (select date_actual from dwh.dim_date where date_actual = current_date);
	current_time_dim_id := (select time_id from dwh.dim_time where time_id = end_time);
	apt_fk := (select id from dwh.dim_recordtype where record_category = 'APT' and record_type = 'subKPI');
	pbt_fk := (select id from dwh.dim_recordtype where record_category = 'PBT' and record_type = 'subKPI');

	datetime_filter := 'and date_id = $1
	and time_id in (select time_id from dwh.dim_time where time_id > $2 and time_id < $3)';
    FOR kpi_def in SELECT * FROM dwh.kpi_def LOOP
		FOR kpi_type in SELECT * FROM dwh.kpi_type 
			where kpi_type_id in (select kpi_type_id from dwh.kpi_def_type_bridge where kpi_def_id = kpi_def.kpi_def_id) LOOP
			IF kpi_def.class_id = 'dimMaterial' THEN
				selected_entity_id:= (select distinct id from dwh.dim_material where material_id = kpi_def.entity_with_kpi);
				id_filter:= ' where material_uid = $4 ::int ';

			ELSIF kpi_def.class_id = 'dimEquipment' THEN
				selected_entity_id:= (select distinct id from dwh.dim_equipment where equipment_id = kpi_def.entity_with_kpi);
				id_filter:= ' where equipment_uid = $4 ::int ';
			END IF;

			EXECUTE 'select * from dwh.fact_table' || id_filter || datetime_filter || ' limit 1'
			into entity_result 
			using current_date_dim_id, start_time, end_time, selected_entity_id;


			EXECUTE kpi_type.kpi_logic || id_filter || datetime_filter
			into 
			using current_date_dim_id, start_time, end_time, selected_entity_id;
			
			IF kpi_type.kpi_name = 'pbt' Then
				raise notice '%', kpi_type.kpi_name;
				Execute 'insert into dwh.fact_table_5min (date_id, time_id, sensor_val, recipe_uid, process_segment_uid, equipment_uid,
				material_uid, sensor_uid, event_uid, location_uid, operation_uid, recordtype_uid)
				values ($1, $2, $3 ::numeric, $4::int, $5, $6, $7, $8, $9, $10, $11, $12)'
				using current_date_dim_id, current_time_dim_id, kpi_result, entity_result.recipe_uid, entity_result.process_segment_uid,
				entity_result.equipment_uid, entity_result.material_uid, entity_result.sensor_uid, entity_result.event_uid, entity_result.location_uid,
				entity_result.operation_uid, pbt_fk;

			ELSIF kpi_type.kpi_name = 'apt' Then
				raise notice '%', kpi_type.kpi_name;
				Execute 'insert into dwh.fact_table_5min (date_id, time_id, sensor_val, recipe_uid, process_segment_uid, equipment_uid,
				material_uid, sensor_uid, event_uid, location_uid, operation_uid, recordtype_uid)
				values ($1, $2, $3 ::numeric, $4::int, $5, $6, $7, $8, $9, $10, $11, $12)'
				using current_date_dim_id, current_time_dim_id, kpi_result, entity_result.recipe_uid, entity_result.process_segment_uid,
				entity_result.equipment_uid, entity_result.material_uid, entity_result.sensor_uid, entity_result.event_uid, entity_result.location_uid,
				entity_result.operation_uid, apt_fk;

			END IF;
		END LOOP;
    END LOOP;
END;
$$ 
LANGUAGE plpgsql;

select * from dwh.FactTableIngestion();

raise notice '%', kpi_type.kpi_name;

