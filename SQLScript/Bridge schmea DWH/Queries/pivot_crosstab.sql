CREATE extension tablefunc;

-----------------------------------------
--Why no aggregates are returning so less rows?
SELECT * 
FROM crosstab(
'SELECT
  p.process_segment_name,
  K.kpi_type_name,
  F.value_mean
  FROM 
  
  dim_date d, dim_process_segment p,  dim_kpi k, second_fact f

	where d.date_actual=F.date_id
	And p.id = F.process_segment_id
	AND p.process_segment_name in (''soap_line 2'',''soap_line 3'',''soap_line 4'')
	AND k.id = F.kpi_id  
	AND k.id in (13,14,16)
	order by p.process_segment_name, K.kpi_type_name'
)
	As final_result(process_segment TEXT, availability numeric, oee numeric, performance numeric)
--
-- where as there is much more data
SELECT
  p.process_segment_name,
  K.kpi_type_name,
  F.value_mean
  FROM 
  
  dim_date d, dim_process_segment p,  dim_kpi k, second_fact f

	where d.date_actual=F.date_id
	And p.id = F.process_segment_id
	AND p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4')
	AND k.id = F.kpi_id  
	AND k.id in (13,14,16)
	order by p.process_segment_name, K.kpi_type_name

---------------------------------------------------
--aggregate function applied
SELECT process_segment_name, (availability), (oee), (performance)
FROM crosstab(
'SELECT
  F.timestamp,
  K.kpi_type_name,
  F.value_mean
  FROM 
  
  dim_date d, dim_process_segment p,  dim_kpi k, second_fact f

	where d.date_actual=F.date_id
	And p.id = F.process_segment_id  
	AND k.id = F.kpi_id  
	AND k.id in (13,14,16)
	order by K.kpi_type_name'
)
	As final_result(process_segment_name timestamp, availability numeric, oee numeric, performance numeric)
--------------------------------------------------
--aggregate function on two columns and no aggregate on one column
--> wrong results because no-aggregate is providing wrong results
SELECT process_segment_name, avg(availability), avg(oee), performance
FROM crosstab(
'SELECT
  p.process_segment_name,
  K.kpi_type_name,
  F.value_mean
  FROM 
  
  dim_date d, dim_process_segment p,  dim_kpi k, second_fact f

	where d.date_actual=F.date_id
	And p.id = F.process_segment_id  
	AND k.id = F.kpi_id  
	AND k.id in (13,14,16)
	order by p.process_segment_name, K.kpi_type_name'
)
	As final_result(process_segment_name TEXT, availability numeric, oee numeric, performance numeric)
	group by process_segment_name, performance

---------------------------------------------------
