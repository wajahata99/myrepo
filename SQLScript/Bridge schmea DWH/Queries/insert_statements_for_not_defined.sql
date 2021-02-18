INSERT INTO public.dim_customer(
	id, customer_code, customer_name, customer_type_code, customer_type_name, insert_date_time, last_update_date_time, delete_flag)
	VALUES (0, 'not_defined', 'not_defined','not_defined', 'not_defined',null, null, null);
	
INSERT INTO public.dim_equipment(
	id, equipment_code, equipment_name, equipment_level, equipment_type_code, equipment_type_name, insert_date_time, last_update_date_time, delete_flag)
	VALUES (0, 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', '2000-01-01 00:00:00', null, false);

INSERT INTO public.dim_event(
	id, concept_dimension_source, event_concept, abstract_event_type_code, abstract_event_type_name, concrete_event_type_code, concrete_event_type_name, insert_date_time, last_update_date_time, delete_flag, event_category, event_definition_code, event_definition_name)
	VALUES (0, 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined','not_defined', '2000-01-01 00:00:00', null, false,'not_defined','not_defined','not_defined');
	
INSERT INTO public.dim_kpi(
	id, concept_dimension_source, kpi_concept, kpi_value_type, kpi_type_code, kpi_type_name, insert_date_time, last_update_date_time, delete_flag)
	VALUES (0, 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', '2000-01-01 00:00:00', null, false);
	
INSERT INTO public.dim_location(
	id, location_code, location_name, location_type_code, location_type_name, location_level, insert_date_time, last_update_date_time, delete_flag)
	VALUES (0, 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', '2000-01-01 00:00:00', null, false);
	
INSERT INTO public.dim_material(
	id, material_code, material_name, material_type_code, material_type_name, material_lot_code, material_lot_name, material_sub_lot_code, material_sub_lot_name, insert_date_time, last_update_date_time, delete_flag)
	VALUES (0, 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', '2000-01-01 00:00:00', null, false);
	
INSERT INTO public.dim_operation_definition(
	id, operation_definition_code, operation_definition_name, operation_definition_version, operations_type_definition, operations_type_segment, operation_segment_code, operation_segment_name, operation_definition_type_code, operation_definition_type_name, operation_segment_type_code, operation_segment_type_name, personnel_specification_code, personnel_specification_name, equipment_specification_code, equipment_specification_name, material_specification_code, material_specification_name, material_specification_use, operation_bill_of_material_code, operation_bill_of_material_name, operation_bill_of_material_item_code, operation_bill_of_material_item_name, operation_bill_of_material_item_use, insert_date_time, last_update_date_time, delete_flag)
	VALUES (0, 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', '2000-01-01 00:00:00', null, false);
	
INSERT INTO public.dim_operation_request(
	id, operation_request_code, operation_request_name, segment_requirement_code, segment_requirement_name, personnel_requirement_code, personnel_requirement_name, equipment_requirement_code, equipment_requirement_name, material_requirement_code, material_requirement_name, material_requirement_use, requirement_bill_of_material_code, requirement_bill_of_material_name, requirement_bill_of_material_item_code, requirement_bill_of_material_item_name, requirement_bill_of_material_item_use, insert_date_time, last_update_date_time, delete_flag, operation_schedule_code, operation_schedule_name)
	VALUES (0, 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', '2000-01-01 00:00:00', null, false, 'not_defined', 'not_defined');
	
INSERT INTO public.dim_operation_response(
	id, operation_response_code, operation_response_name, segment_response_code, segment_response_name, personnel_actual_code, personnel_actual_name, equipment_actual_code, equipment_actual_name, material_actual_code, material_actual_name, material_actual_use, execution_bill_of_material_code, execution_bill_of_material_name, execution_bill_of_material_item_code, execution_bill_of_material_item_name, execution_bill_of_material_item_use, insert_date_time, last_update_date_time, delete_flag, operations_performance_code, operations_performance_name)
	VALUES (0, 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', '2000-01-01 00:00:00', null, false, 'not_defined', 'not_defined');
	
INSERT INTO public.dim_personnel(
	id, personnel_code, personnel_name, personnel_type_code, personnel_type_name, team_code, team_name, team_type_code, team_type_name, insert_date_time, last_update_date_time, delete_flag)
	VALUES (0, 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', '2000-01-01 00:00:00', null, false);
	
INSERT INTO public.dim_process_segment(
	id, process_segment_code, process_segment_name, operations_type, process_segment_type_code, process_segment_type_name, stream_code, stream_name, personnel_segment_specification_code, personnel_segment_specification_name, equipment_segment_specification_code, equipment_segment_specification_name, material_segment_specification_code, material_segment_specification_name, material_segment_specification_use, insert_date_time, last_update_date_time, delete_flag)
	VALUES (0, 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', '2000-01-01 00:00:00', null, false);
	
INSERT INTO public.dim_property(
	id, concept_dimension_source, property_concept, property_type, property_code, property_name, property_attribute, property_value, property_value_type, insert_date_time, last_update_date_time, delete_flag)
	VALUES (0, 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', '2000-01-01 00:00:00', null, false);
	
INSERT INTO public.dim_reason(
	id, reason_category_code, reason_category_name, reason_subcategory_code, reason_subcategory_name, reason_code, reason_name, insert_date_time, update_date_time, delete_flag)
	VALUES (0, 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', '2000-01-01 00:00:00', null, false);

INSERT INTO public.dim_sensor(
	id, sensor_type_code, sensor_type_name, sensor_code, sensor_name, tag_code, tag_name, insert_date_time, last_update_date_time, delete_flag)
	VALUES (0, 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', 'not_defined', '2000-01-01 00:00:00', null, false);
	
INSERT INTO public.dim_state(
	id, concept_dimension_source, state_concept, state_code, state_name, insert_date_time, last_update_date_time, delete_flag)
	VALUES (0, 'not_defined', 'not_defined', 'not_defined', 'not_defined', '2000-01-01 00:00:00', null, false);
	
---------------------------------------
--insert statements for bridge tables

INSERT INTO public.equipment_composition_bridge(
	id, parent_id, child_id, level, top_flag, bottom_flag, insert_date_time, last_update_date_time, delete_flag)
	VALUES (0, 0, 0, 0, true, true, '2000-01-01 00:00:00' , null, false);	
	
INSERT INTO public.customer_type_bridge(
	id, parent_id, child_id, level, top_flag, bottom_flag, insert_date_time, last_update_date_time, delete_flag)
	VALUES (0, 0, 0, 0, true, true, '2000-01-01 00:00:00' , null, false);

INSERT INTO public.location_entity_bridge(
	id, parent_id, child_id, level, top_flag, bottom_flag, insert_date_time, last_update_date_time, delete_flag)
	VALUES (0, 0, 0, 0, true, true, '2000-01-01 00:00:00' , null, false);

INSERT INTO public.location_type_classification_bridge(
	id, parent_id, child_id, level, top_flag, bottom_flag, insert_date_time, last_update_date_time, delete_flag)
	VALUES (0, 0, 0, 0, true, true, '2000-01-01 00:00:00' , null, false);

INSERT INTO public.material_class_bridge(
	id, parent_id, child_id, level, top_flag, bottom_flag, insert_date_time, last_update_date_time, delete_flag)
	VALUES (0, 0, 0, 0, true, true, '2000-01-01 00:00:00' , null, false);

INSERT INTO public.material_definition_bridge(
	id, parent_id, child_id, level, top_flag, bottom_flag, insert_date_time, last_update_date_time, delete_flag)
	VALUES (0, 0, 0, 0, true, true, '2000-01-01 00:00:00' , null, false);

INSERT INTO public.material_lot_bridge(
	id, parent_id, child_id, level, top_flag, bottom_flag, insert_date_time, last_update_date_time, delete_flag)
	VALUES (0, 0, 0, 0, true, true, '2000-01-01 00:00:00' , null, false);

INSERT INTO public.material_sublot_bridge(
	id, parent_id, child_id, level, top_flag, bottom_flag, insert_date_time, last_update_date_time, delete_flag)
	VALUES (0, 0, 0, 0, true, true, '2000-01-01 00:00:00' , null, false);

INSERT INTO public.operation_definition_type_classification_bridge(
	id, parent_id, child_id, level, top_flag, bottom_flag, insert_date_time, last_update_date_time, delete_flag)
	VALUES (0, 0, 0, 0, true, true, '2000-01-01 00:00:00' , null, false);

INSERT INTO public.operation_request_composition_bridge(
	id, parent_id, child_id, level, top_flag, bottom_flag, insert_date_time, last_update_date_time, delete_flag)
	VALUES (0, 0, 0, 0, true, true, '2000-01-01 00:00:00' , null, false);


INSERT INTO public.operation_segment_composition_bridge(
	id, parent_id, child_id, level, top_flag, bottom_flag, insert_date_time, last_update_date_time, delete_flag)
	VALUES (0, 0, 0, 0, true, true, '2000-01-01 00:00:00' , null, false);

INSERT INTO public.operation_segment_type_bridge(
	id, parent_id, child_id, level, top_flag, bottom_flag, insert_date_time, last_update_date_time, delete_flag)
	VALUES (0, 0, 0, 0, true, true, '2000-01-01 00:00:00' , null, false);

INSERT INTO public.personnel_type_classification_bridge(
	id, parent_id, child_id, level, top_flag, bottom_flag, insert_date_time, last_update_date_time, delete_flag)
	VALUES (0, 0, 0, 0, true, true, '2000-01-01 00:00:00' , null, false);

INSERT INTO public.process_segment_composition_bridge(
	id, parent_id, child_id, level, top_flag, bottom_flag, insert_date_time, last_update_date_time, delete_flag)
	VALUES (0, 0, 0, 0, true, true, '2000-01-01 00:00:00' , null, false);

INSERT INTO public.process_segment_type_composition_bridge(
	id, parent_id, child_id, level, top_flag, bottom_flag, insert_date_time, last_update_date_time, delete_flag)
	VALUES (0, 0, 0, 0, true, true, '2000-01-01 00:00:00' , null, false);

INSERT INTO public.reason_bridge(
	id, process_segment_id, state_id, reason_tree_id, equipment_id)
	VALUES (0, 0, 0, 0, 0);

INSERT INTO public.segment_requirement_composition_bridge(
	id, parent_id, child_id, level, top_flag, bottom_flag, insert_date_time, last_update_date_time, delete_flag)
	VALUES (0, 0, 0, 0, true, true, '2000-01-01 00:00:00' , null, false);
	
INSERT INTO public.segment_response_composition_bridge(
	id, parent_id, child_id, level, top_flag, bottom_flag, insert_date_time, last_update_date_time, delete_flag)
	VALUES (0, 0, 0, 0, true, true, '2000-01-01 00:00:00' , null, false);
	
INSERT INTO public.sensor_type_classification_bridge(
	id, parent_id, child_id, level, top_flag, bottom_flag, insert_date_time, last_update_date_time, delete_flag)
	VALUES (0, 0, 0, 0, true, true, '2000-01-01 00:00:00' , null, false);

INSERT INTO public.team_type_classification_bridge(
	id, parent_id, child_id, level, top_flag, bottom_flag, insert_date_time, last_update_date_time, delete_flag)
	VALUES (0, 0, 0, 0, true, true, '2000-01-01 00:00:00' , null, false);