--where true and 'and'

-- 1st selection in process segment -->200 (soap_line2)
-- 2nd selection in reason -->36
-- 3rd selection in process segment again -->209 (soap_line3)

-- query for reason
select distinct reason_id 
from second_fact 
where process_segment_id in (200,209)
and equipment_id in (200)

and reason_id in (36)

--process_segments attached with reason_id 36
select process_segment_id from second_fact
where reason_id = 36

--with or or union etc.
select distinct reason_id 
from second_fact 
where process_segment_id in (200)
or reason_id in (36)
-- union
select distinct reason_id from second_fact where process_segment_id in (200)
union
select distinct reason_id from second_fact where reason_id in (36)

--where true
select distinct process_segment_id 
from second_fact f
join dim_reason r on f.reason_id = r.id
join dim_process_segment p on f.process_segment_id = p.id
where process_segment_id in (200)
and reason_id in (36)

