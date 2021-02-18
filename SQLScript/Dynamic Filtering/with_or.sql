--Improvement_testing
--set search_path to public;

--1 
--Soap_line2 is selected
--Process_segment filter--> (master filter) 269 records
select distinct process_segment_id 
from second_fact;

--Reason_name Filter query --> 89 records
select distinct reason_id 
from second_fact 
where process_segment_id in ('200');

--Equipment filter query --> 9 records
select distinct equipment_id 
from second_fact 
where process_segment_id in ('200');

-- View query reason dimension --> 0.4 million records
select process_segment_id, reason_id, equipment_id
from second_fact f, dim_process_segment p, dim_equipment e, dim_reason r
where f.process_segment_id = p.id
and f.equipment_id = e.id
and f.reason_id = r.id
and process_segment_name in ('soap_line 2')

--2
--selection is made in reason_name filter (reason_id 36)
--Process_segment_filter_query --> 24 records
select distinct process_segment_id 
from second_fact 
where process_segment_id in (200)
or reason_id in (36)

--reason_name filter (master filter) -->89 records
select distinct reason_id 
from second_fact 
where process_segment_id in ('200');

--equipment_name filter --> 32 records
select distinct equipment_id from second_fact 
where process_segment_id in ('200')
or reason_id in (36);

-- note: total proces segments in the fact table are 269 however with filter they are only 24

-- View query
select process_segment_id, reason_id, equipment_id
from second_fact f, dim_process_segment p, dim_equipment e, dim_reason r
where f.process_segment_id = p.id
and f.equipment_id = e.id
and f.reason_id = r.id
and process_segment_name in ('soap_line 2')
and reason_name in ('BTU Head Problem')

-- 3 
-- User make another selection in Process_segment_name filter, i.e. soap_line3
-- process_segment filter --> 24 records
select distinct process_segment_id 
from second_fact 
where reason_id in (36)
or process_segment_id in (200,209)

-- View query
select process_segment_id, reason_id, equipment_id
from second_fact f, dim_process_segment p, dim_equipment e, dim_reason r
where f.process_segment_id = p.id
and f.equipment_id = e.id
and f.reason_id = r.id
and process_segment_name in ('soap_line 2','soap_line 3')
and reason_name in ('BTU Head Problem')

-- 4 
-- Equipment related to soapline2 (id 200) is selected
-- process_segment_filter --> 25 records
select distinct process_segment_id 
from second_fact 
where reason_id in (36)
or process_segment_id in (200,209)
or equipment_id in (200)

-- reason_name filter --> 89 records
select distinct reason_id 
from second_fact 
where reason_id in (36)
or process_segment_id in (200,209)
or equipment_id in (200)

-- equipment_name filter --> 39 records
select distinct equipment_id 
from second_fact 
where reason_id in (36)
or process_segment_id in (200,209)
or equipment_id in (200)



