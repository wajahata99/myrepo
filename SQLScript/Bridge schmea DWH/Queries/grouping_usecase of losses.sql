
--Query 1
(select x.process_segment_name, 'grp-1' as grp,sum(x.group_1)
from(
SELECT
  p.process_segment_name,
  'grp-1' as grp,
  (CASE WHEN r.reason_category_name in ('Legal Losses', 'Unutilized Capacity Losses','Process Driven Losses', 'Manufacturing Performance Losses') THEN F.duration_mean END) "group_1"--case is not needed but it can be kept for symetry
  FROM 
  dim_process_segment p,  dim_reason r, second_fact f
	where p.id = F.process_segment_id  
	AND p.process_segment_name in ('soap_line 2')
	AND r.id = F.reason_id  
	AND r.reason_category_name in ('Legal Losses','Unutilized Capacity Losses', 'Process Driven Losses', 'Manufacturing Performance Losses')
) as x
group by x.process_segment_name, grp)

union all

(select x.process_segment_name, x.reason_category_name,sum(x.group_2)
from(
SELECT
  p.process_segment_name,
  r.reason_category_name,
  (CASE WHEN r.reason_category_name in ('Legal Losses', 'Unutilized Capacity Losses','Process Driven Losses', 'Manufacturing Performance Losses') THEN F.duration_mean END) "group_2"--case is not needed but it can be kept for symetry
  FROM 
  dim_process_segment p,  dim_reason r, second_fact f
	where p.id = F.process_segment_id  
	AND p.process_segment_name in ('soap_line 2')
	AND r.id = F.reason_id  
	AND r.reason_category_name in ('Legal Losses', 'Unutilized Capacity Losses','Process Driven Losses', 'Manufacturing Performance Losses')
) as x
group by x.process_segment_name,x.reason_category_name)

--Query 1.1--> no case statements
(SELECT
  p.process_segment_name,
  'total losses' as grp,
  sum(F.duration_mean)

  FROM 
  dim_process_segment p,  dim_reason r, second_fact f
	where p.id = F.process_segment_id  
	AND p.process_segment_name in ('soap_line 2')
	AND r.id = F.reason_id  
	AND r.reason_category_name in ('Legal Losses','Unutilized Capacity Losses', 'Process Driven Losses', 'Manufacturing Performance Losses')
	group by   p.process_segment_name, grp)


union all

(SELECT
  p.process_segment_name,
  r.reason_category_name,
  sum(F.duration_mean) as "group_1"
  FROM 
  dim_process_segment p,  dim_reason r, second_fact f
	where p.id = F.process_segment_id  
	AND p.process_segment_name in ('soap_line 2')

	AND r.id = F.reason_id  
	AND r.reason_category_name in ('Legal Losses','Unutilized Capacity Losses', 'Process Driven Losses', 'Manufacturing Performance Losses')
	group by p.process_segment_name,r.reason_category_name)


--Query 2

(SELECT anon_1.process_segment_name, 'total losses' as grp, sum(public.second_fact.duration_mean), avg(public.second_fact.duration_mean) 
	FROM public.second_fact 
	JOIN (SELECT public.dim_process_segment.process_segment_name AS process_segment_name, public.dim_process_segment.id AS id 
	FROM public.dim_process_segment 
	WHERE public.dim_process_segment.process_segment_name IN ('soap_line 2')) AS anon_1
	ON anon_1.id = public.second_fact.process_segment_id 
	JOIN (SELECT public.dim_reason.reason_category_name AS reason_category_name, public.dim_reason.id AS id 
	 	FROM public.dim_reason 
		WHERE public.dim_reason.reason_category_name IN ('Legal Losses', 'Unutilized Capacity Losses', 'Process Driven Losses', 'Manufacturing Performance Losses')) AS anon_2 
		ON anon_2.id = public.second_fact.reason_id
		group by anon_1.process_segment_name, grp)

UNION ALL

(SELECT anon_1.process_segment_name, anon_2.reason_category_name, sum(public.second_fact.duration_mean), avg(public.second_fact.duration_mean) 
	FROM public.second_fact
	JOIN (SELECT public.dim_process_segment.process_segment_name AS process_segment_name, public.dim_process_segment.id AS id 
	FROM public.dim_process_segment 
	WHERE public.dim_process_segment.process_segment_name IN ('soap_line 2')) AS anon_1 ON anon_1.id = public.second_fact.process_segment_id 
		JOIN (SELECT public.dim_reason.reason_category_name AS reason_category_name, public.dim_reason.id AS id 
		FROM public.dim_reason 
		WHERE public.dim_reason.reason_category_name IN ('Legal Losses', 'Unutilized Capacity Losses', 'Process Driven Losses', 'Manufacturing Performance Losses'))AS anon_2 
		ON anon_2.id = public.second_fact.reason_id
		group by anon_1.process_segment_name, anon_2.reason_category_name)
		