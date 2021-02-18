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


	

