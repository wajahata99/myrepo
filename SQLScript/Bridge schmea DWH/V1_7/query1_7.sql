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
where etcb.parent_id = 3-- change parent ids here
and etcb.level = 1
order by parent_id, child_id
;

------------------------------------------
--Testing typical queries
------------------------------------------
--
--How many equipments fall under motor classification?
--
/*
Select equipment_type_code, parent_id, child_id, top_flag, bottom_flag, level

FROM equipment_type_classification_bridge
JOIN dim_equipment
on equipment_type_classification_bridge.parent_id = dim_equipment.id
where equipment_type_code = 'motor'
and top_flag = 'false';
*/
---------------------
--KPI query
Select p.personnel_name, k.kpi_type_name, F.value_mean  

From dim_personnel p, personnel_type_classification_bridge ep, dim_kpi k,dim_property_definition prop, fact_table F
Where 
F.personnel_id IN (select p.id 
					From dim_personnel p 
					Join personnel_type_classification_bridge pb
					ON p.id=pb.parent_id
					WHERE pb.bottom_flag = True)
		
AND F.kpi_id  = k.id
AND k.Concept_Dimension_Source = 'DT'
AND k.kpi_concept = 'Personnel'
AND k.kpi_Category = 'Performance'
AND k.kpi_type_name = 'Personnel_Performance'

AND F.property_definition_id=prop.id
AND Prop.Concept_Dimension_Source = 'DT'
AND Prop.property_Concept = 'KPI'
AND Prop.property_Name = 'value'
;

-----
--KPI query without bottom flag
Select p.personnel_name, k.kpi_type_name, F.value_mean  

From dim_personnel p, personnel_type_classification_bridge ep, dim_kpi k,dim_property_definition prop, fact_table F
Where 
F.personnel_id IN (select p.id 
					From dim_personnel p 
					Join personnel_type_classification_bridge pb
					ON p.id=pb.parent_id
					WHERE pb.bottom_flag = True)
		
AND F.kpi_id  = k.id
AND k.Concept_Dimension_Source = 'DT'
AND k.kpi_concept = 'Personnel'
AND k.kpi_Category = 'Performance'
AND k.kpi_type_name = 'Personnel_Performance'

AND F.property_definition_id=prop.id
AND Prop.Concept_Dimension_Source = 'DT'
AND Prop.property_Concept = 'KPI'
AND Prop.property_Name = 'value'
;
