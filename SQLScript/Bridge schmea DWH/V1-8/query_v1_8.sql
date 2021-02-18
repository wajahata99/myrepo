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
--Inserting data from v1_7
--

INSERT INTO public.equipment_type_classification_bridge
SELECT *
FROM "starSchemaV1_7".equipment_type_classification_bridge;


INSERT INTO public.dim_equipment (
equipment_code, 
equipment_name, 
equipment_level,
equipment_type_code, 
equipment_type_name, 
insert_date_time, 
last_update_date_time, 
delete_flag)

SELECT "starSchemaV1_7".dim_equipment.equipment_code, 
"starSchemaV1_7".dim_equipment.equipment_name, 
"starSchemaV1_7".dim_equipment.equipment_level,
"starSchemaV1_7".dim_equipment.equipment_type_code, 
"starSchemaV1_7".dim_equipment.equipment_type_name, 
"starSchemaV1_7".dim_equipment.insert_date_time, 
"starSchemaV1_7".dim_equipment.last_update_date_time, 
"starSchemaV1_7".dim_equipment.delete_flag

FROM "starSchemaV1_7".dim_equipment;


--
--query without bridge
--

Select F.equipment_id, F.kpi_id, F.value_mean  

From dim_equipment e, dim_kpi k, dim_property_definition prop, second_fact F
Where 

e.id = F.equipment_id
AND e.equipment_type_name in ('AC Motor','Three Phase Induction Motor','DC Motor')

AND k.id = F.kpi_id   
AND k.Concept_Dimension_Source = 'dim_equipment'
AND k.kpi_concept = 'Equipment'
AND k.kpi_type_code = 'q'

AND prop.id=F.property_definition_id
AND Prop.Concept_Dimension_Source = 'dim_kpi'
AND Prop.property_Concept = 'KPI'
AND Prop.property_name = 'value'
;

--
--Fetch kpis associated with equipment type Motors.
--

Select e.equipment_type_name, k.kpi_type_name, F.value_mean  

From dim_equipment e, dim_kpi k, dim_property prop, second_fact F
Where 

F.equipment_id = e.id 
AND e.id IN (Select distinct(etcb.child_id)
					from equipment_type_classification_bridge etcb
					join dim_equipment de
					on etcb.parent_id = de.id
				    where de.equipment_type_name in ('Motor')
					and etcb.level !=0) 

AND k.id = F.kpi_id   
AND k.Concept_Dimension_Source = 'dim_equipment'
AND k.kpi_concept = 'Equipment'
AND k.kpi_type_code = 'q'

AND prop.id=F.property_id
AND Prop.Concept_Dimension_Source = 'dim_kpi'
AND Prop.property_Concept = 'KPI'
AND Prop.property_name = 'value'
;

--
--KPI Status
--

Select e.equipment_type_name, k.kpi_type_name, F.value_mean, prop.property_name,prop.value  

From dim_equipment e, dim_kpi k, dim_property_definition prop, second_fact F
Where 

F.equipment_id = e.id 
AND e.id IN (Select distinct(etcb.child_id)
					from equipment_type_classification_bridge etcb
					join dim_equipment de
					on etcb.parent_id = de.id
				    where de.equipment_type_name in ('Motor')
					and etcb.level !=0) 

AND k.id = F.kpi_id   
AND k.Concept_Dimension_Source = 'dim_equipment'
AND k.kpi_concept = 'Equipment'
AND k.kpi_type_code = 'q'

AND prop.id=F.property_definition_id
AND Prop.Concept_Dimension_Source = 'dim_kpi'
AND Prop.property_Concept = 'KPI'
AND Prop.property_name in ('value','KPI Status')
;

--varification of the bottom flag mapping for equipment type classification bridge
Select de.equipment_type_code,de2.equipment_type_code, etcb.level, etcb.bottom_flag
from equipment_type_classification_bridge etcb
join dim_equipment de
on etcb.parent_id = de.id
Join dim_equipment de2
on etcb.child_id = de2.id
where etcb.parent_id = 10 -- change parent ids here from 1 and 10
--and etcb.level = 1
order by parent_id, child_id
;

--varification of the bottom flag mapping for location entity bridge
Select de.location_name as "parent", de2.location_name as "child", etcb.level, etcb.bottom_flag
from location_entity_bridge etcb
join dim_location de
on etcb.parent_id = de.id
Join dim_location de2
on etcb.child_id = de2.id
where etcb.parent_id = 5-- selecting parent id 5 displays all the childs
--and etcb.level = 1
order by parent_id, child_id
;


