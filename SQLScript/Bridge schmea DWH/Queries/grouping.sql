SELECT anon_1.process_segment_name, anon_2.reason_code, public.second_fact.duration_mean 
FROM public.second_fact
JOIN (SELECT public.dim_process_segment.process_segment_name AS process_segment_name, public.dim_process_segment.id AS id 
FROM public.dim_process_segment 
WHERE public.dim_process_segment.process_segment_name IN ('Soap Line 1')) AS anon_1 ON anon_1.id = public.second_fact.process_segment_id 
JOIN (
    SELECT public.dim_reason.reason_code AS reason_code, public.dim_reason.id AS id 
FROM public.dim_reason 
WHERE public.dim_reason.reason_code IN ('uptime') 
     )
AS anon_2 ON anon_2.id = public.second_fact.reason_id
UNION ALL
SELECT anon_1.process_segment_name, 'grp-1' as grp, public.second_fact.duration_mean 
FROM public.second_fact JOIN (SELECT public.dim_process_segment.process_segment_name AS process_segment_name, public.dim_process_segment.id AS id 
FROM public.dim_process_segment 
WHERE public.dim_process_segment.process_segment_name IN ('Soap Line 1')) AS anon_1
ON anon_1.id = public.second_fact.process_segment_id JOIN (SELECT public.dim_reason.reason_code AS reason_code,
                                                       public.dim_reason.id AS id 
FROM public.dim_reason 
WHERE public.dim_reason.reason_code IN ('not_defined', 'uptime')) AS anon_2 ON anon_2.id = public.second_fact.reason_id
group by grp,  public.second_fact.duration_mean, anon_1.process_segment_name


-----------------------
--Unpivoted with cases (cases are not needed) to keep it general/consistent
select x.process_segment_name, 'grp-1' as grp,sum(x.group_1)
from(
SELECT
  p.process_segment_name,
  'grp-1' as grp,
  (CASE WHEN r.reason_category_name in ('Legal Losses', 'Unutilized Capacity Losses', 'Process Driven Losses', 'Manufacturing Performance Losses') THEN F.duration_mean END) "group_1"--case is not needed but it can be kept for symetry
  FROM 
  dim_date d, dim_process_segment p,  dim_reason r, second_fact f
	where d.date_actual=F.date_id
	AND d.mmyyyy = '092020'
	And p.id = F.process_segment_id  
	AND p.process_segment_name in ('soap_line 2')
	AND r.id = F.reason_id  
	AND r.reason_category_name in ('Legal Losses', 'Unutilized Capacity Losses', 'Process Driven Losses', 'Manufacturing Performance Losses')
) as x
group by x.process_segment_name, grp

union all

select x.process_segment_name, x.reason_category_name,sum(x.group_2)
from(
SELECT
  p.process_segment_name,
  r.reason_category_name,
  (CASE WHEN r.reason_category_name in ('Legal Losses', 'Unutilized Capacity Losses', 'Process Driven Losses', 'Manufacturing Performance Losses') THEN F.duration_mean END) "group_2"--case is not needed but it can be kept for symetry
  FROM 
  dim_date d, dim_process_segment p,  dim_reason r, second_fact f
	where d.date_actual=F.date_id
	AND d.mmyyyy = '092020'
	And p.id = F.process_segment_id  
	AND p.process_segment_name in ('soap_line 2')
	AND r.id = F.reason_id  
	AND r.reason_category_name in ('Legal Losses', 'Unutilised Capacity Losses', 'Process Driven Losses', 'Manufacturing Performance Losses')
) as x
group by x.process_segment_name,x.reason_category_name

--
--Unpivoted without cases
SELECT
  p.process_segment_name,
  'grp-1' as grp,
  sum(F.duration_mean)

  FROM 
  dim_date d, dim_process_segment p,  dim_reason r, second_fact f
	where d.date_actual=F.date_id
	AND d.date_actual in ('2020-09-01','2020-09-02','2020-09-03','2020-09-04','2020-09-05','2020-09-06','2020-09-07')
--	AND d.mmyyyy = '092020'
	And p.id = F.process_segment_id  
--	AND p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')
	AND p.process_segment_name in ('soap_line 2')
	AND r.id = F.reason_id  
	AND r.id in (1,2,3,4,5,6)
	group by   p.process_segment_name, grp


union all

SELECT
  p.process_segment_name,
  r.reason_name,
  sum(F.duration_mean) as "group_1"
  FROM 
  dim_date d, dim_process_segment p,  dim_reason r, second_fact f
	where d.date_actual=F.date_id
	AND d.date_actual in ('2020-09-01','2020-09-02','2020-09-03','2020-09-04','2020-09-05','2020-09-06','2020-09-07')
--	AND d.mmyyyy = '092020'
	And p.id = F.process_segment_id  
--	AND p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')
	AND p.process_segment_name in ('soap_line 2')

	AND r.id = F.reason_id  
	AND r.id in (3,4,5)
	group by p.process_segment_name,r.reason_name
--------------------------------------------------------------------------
