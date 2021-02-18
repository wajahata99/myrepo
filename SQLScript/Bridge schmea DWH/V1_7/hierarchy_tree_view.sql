--Query v1_7
--
--Bridge schema querying
--
--SET search_path to "starSchemaV1_7";

select * from dim_date;
select * from dim_equipment;
select * from dim_material;
select * from dim_event;
select * from dim_sensor;
select * from material_class_bridge;
select * from dim_operation_definition;
select * from dim_operation_request;
select * from dim_operation_response;
select * from operation_segment_composition_bridge;
select * from dim_location;
select * from dim_sensor;
select * from equipment_type_classification_bridge;
select * from dim_process_segment;
select * from dim_property_definition;
select * from dim_kpi;
select * from equipment_composition_bridge;

--
--Classification tree
-- Example tree

--                     motor(ID:1)
--              ac motor(2)                     dc motor(3)
--   induction(5)        ac commuter motor(4)
--three phase induction(6)

-- objective
-- upon clicking motor, ac and dc motor options show up
-- upon clicking ac motor induction and ac communter motor options show up
-- upon clicking induction motor , three phase induction motor show up

--
-- regular join
Select de.equipment_type_code,de2.equipment_type_code, etcb.parent_id,etcb.child_id,etcb.top_flag, etcb.bottom_flag, etcb.level
from equipment_type_classification_bridge etcb
join dim_equipment de
on etcb.parent_id = de.id
Join dim_equipment de2
on etcb.child_id = de2.id
order by parent_id, child_id
;

---- upon clicking parent , child ids are shown. 
Select de.equipment_type_code,de2.equipment_type_code, etcb.parent_id,etcb.child_id,etcb.top_flag, etcb.bottom_flag, etcb.level
from equipment_type_classification_bridge etcb
join dim_equipment de
on etcb.parent_id = de.id
Join dim_equipment de2
on etcb.child_id = de2.id
where etcb.parent_id = 7-- change parent ids here
and etcb.level = 1
order by parent_id, child_id
;
-------------------------------------------
--For location dimension
-- regular join
Select de.location_name,de2.location_name, etcb.parent_id,etcb.child_id,etcb.top_flag, etcb.bottom_flag, etcb.level
from location_entity_bridge etcb
join dim_location de
on etcb.parent_id = de.id
Join dim_location de2
on etcb.child_id = de2.id
order by parent_id, child_id
;

---- upon clicking parent , child ids are shown. 
Select de.location_name,de2.location_name, etcb.parent_id,etcb.child_id,etcb.top_flag, etcb.bottom_flag, etcb.level
from location_entity_bridge etcb
join dim_location de
on etcb.parent_id = de.id
Join dim_location de2
on etcb.child_id = de2.id
where etcb.parent_id = 2-- change parent ids here
and etcb.level = 1
order by parent_id, child_id
;