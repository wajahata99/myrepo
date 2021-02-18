--KPI testing
select * from second_fact
where kpi_id != 100
limit 100

---deleting rows where kpi id is not 100
--delete from second_fact
--where kpi_id != 100


--count rows in the fact table
set search_path to dwh;
select count(*) from second_fact

select distinct kpi_id
from second_fact

select * from second_fact where event_id = 2

--
-- Creating new kpi instance for testing
INSERT INTO public.kpi_instance(
	id, code, name, description, uom, trend, timing, production_methodology, min_value, max_value, target_value, kpi_definition_id, sort_order, is_deleted)
	VALUES (200, 'availability_t1', 'Availability_t1', null,'%', 'The higher, the better', 'Periodic', 'Batch', 0, 100, null, 14, null, false);

INSERT INTO public.kpi_instance(
	id, code, name, description, uom, trend, timing, production_methodology, min_value, max_value, target_value, kpi_definition_id, sort_order, is_deleted)
	VALUES (201, 'effectiveness_t1', 'Effectiveness_t1', null,'%', 'The higher, the better', 'Periodic', 'Batch', 0, 100, null, 15, null, false);
	
INSERT INTO public.kpi_instance(
	id, code, name, description, uom, trend, timing, production_methodology, min_value, max_value, target_value, kpi_definition_id, sort_order, is_deleted)
	VALUES (202, 'oee_t1', 'Oee_t1', null,'%', 'The higher, the better', 'Periodic', 'Batch', 0, 100, null, 17, null, false);
	
--KPI_instance Time range
INSERT INTO public.kpi_instance_time_range(
	id, start_time, end_time, last_execution_time, recurrence, duration, kpi_instance)
	VALUES (200, '2020-09-01 00:15:00', null, '2020-09-01 00:15:00', '00:15:00', null, 200);
	
INSERT INTO public.kpi_instance_time_range(
	id, start_time, end_time, last_execution_time, recurrence, duration, kpi_instance)
	VALUES (201, '2020-09-01 00:15:00', null, '2020-09-01 00:15:00', '00:15:00', null, 201);

INSERT INTO public.kpi_instance_time_range(
	id, start_time, end_time, last_execution_time, recurrence, duration, kpi_instance)
	VALUES (202, '2020-09-01 00:15:00', null, '2020-09-01 00:15:00', '00:15:00', null, 202);
	
--KPI_instance_resource_reference
INSERT INTO public.kpi_instance_resource_reference(
	id, dimension_table, resource_context, resource_code, kpi_instance)
	VALUES (200, 'dim_process_segment', 'process_segment_code', 'soap_line_1', 200);

INSERT INTO public.kpi_instance_resource_reference(
	id, dimension_table, resource_context, resource_code, kpi_instance)
	VALUES (201, 'dim_process_segment', 'process_segment_code', 'soap_line_1', 201);

INSERT INTO public.kpi_instance_resource_reference(
	id, dimension_table, resource_context, resource_code, kpi_instance)
	VALUES (202, 'dim_process_segment', 'process_segment_code', 'soap_line_1', 202);

--
