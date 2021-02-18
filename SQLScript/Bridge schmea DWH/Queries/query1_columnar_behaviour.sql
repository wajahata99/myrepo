select x.process_segment_name, x.full_time, round((x.availability),2) "availability", round((x.effectiveness),2) "effectivness", round((x.oee),2) "oee"
from(
SELECT
  d.date_actual,
  t.full_time,
  p.process_segment_name,
  (CASE WHEN k.id='13' THEN F.value_mean END) "availability",
  (CASE WHEN k.id='14' THEN F.value_mean END) "effectiveness",
  (CASE WHEN k.id='16' THEN F.value_mean END) "oee"

  FROM 
  
  dim_date d,dim_time_sec t ,dim_process_segment p,  dim_kpi k, second_fact f

    where d.date_actual=F.date_id
    AND d.date_actual in ('2020-09-01')
    
    AND t.full_time = F.time_id
    AND t.shift = 'Morning'

	And p.id = F.process_segment_id  
    AND p.process_segment_name in ('soap_line 2')

    AND k.id = F.kpi_id  
    AND k.id in (13,14,16)
        
) as x
group by x.process_segment_name, x.full_time , x.availability, x .effectiveness, x.oee
having availability > 10
-----------
with x        
as (SELECT
  d.date_actual,
  t.full_time,
  p.process_segment_name,
  (CASE WHEN k.id='13' THEN F.value_mean END) "availability",
  (CASE WHEN k.id='14' THEN F.value_mean END) "effectiveness",
  (CASE WHEN k.id='16' THEN F.value_mean END) "oee"

  FROM 
  
  dim_date d,dim_time_sec t ,dim_process_segment p,  dim_kpi k, second_fact f

    where d.date_actual=F.date_id
    AND d.date_actual in ('2020-09-01')
    
    AND t.full_time = F.time_id
    AND t.shift = 'Morning'

	And p.id = F.process_segment_id  
    AND p.process_segment_name in ('soap_line 2')

    AND k.id = F.kpi_id  
    AND k.id in (13,14,16))

select x.process_segment_name, x.full_time, round((x.availability),2) "availability", round((x.effectiveness),2) "effectivness", round((x.oee),2) "oee"

from x
--group by x.process_segment_name, x.full_time , x.availability, x .effectiveness, x.oee
where x.availability > 10
and x.