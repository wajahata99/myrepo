-- 2 million rows

SELECT
d.date_actual,
p.process_segment_name,
f.availability,
f.performance,
f.oee
FROM 
dim_date d, dim_process_segment p,  dim_kpi k, kpi_fact f
where d.date_actual=F.date_id
--	AND d.date_actual in ('2020-09-01','2020-09-02','2020-09-03','2020-09-04','2020-09-05','2020-09-06','2020-09-07')
AND d.mmyyyy = '092020'
And p.id = F.process_segment_id  
AND p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')

--group by p.process_segment_name



