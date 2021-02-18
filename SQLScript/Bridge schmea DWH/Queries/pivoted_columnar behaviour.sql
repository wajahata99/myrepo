-- columnar behaviour
----------------
select y.date_actual, y.shift, y.process_segment_name, y.availability , y.effectiveness, y.oeee
from
(select x.date_actual, x.shift, x.process_segment_name, round((x.availability),2) "availability", round((x.effectiveness),2) "effectiveness", round((x.oee),2) "oeee"
from(
SELECT
  d.date_actual,
  t.shift,
  p.process_segment_name,
  (CASE WHEN (k.id='13') THEN F.value_mean END) "availability",
  (CASE WHEN (k.id='14') THEN F.value_mean END) "effectiveness",
  (CASE WHEN (k.id='16') THEN F.value_mean END) "oee"

  FROM 
  
  dim_date d,dim_time_sec t ,dim_process_segment p,  dim_kpi k, second_fact f

    where d.date_actual=F.date_id
    AND d.date_actual in ('2020-09-01')
--  AND d.date_actual in ('2020-09-01','2020-09-02','2020-09-03','2020-09-04','2020-09-05','2020-09-06','2020-09-07')
--	AND d.mmyyyy = '092020'
	AND t.full_time = F.time_id
    AND t.shift = 'Morning'

    And p.id = F.process_segment_id  
--  AND p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')
	AND p.process_segment_name in ('soap_line 2')

    AND k.id = F.kpi_id  
    AND k.id in (13,14,16)
	--AND k.id in (select k.id from dim_kpi k where F.value_mean >50 and k.id in (13,14,16))
) as x
) as y
where y.oeee > 36

-----------------------------------
-- columnar behaviour
----------------
select x.date_actual, x.shift, x.process_segment_name, round((x.availability),2) , round((x.effectiveness),2) , round((x.oee),2) 
from(
SELECT
  d.date_actual,
  t.full_time,
  t.shift,
  p.process_segment_name,
  (CASE WHEN (k.id='13') THEN F.value_mean END) "availability",
  (CASE WHEN (k.id='14') THEN F.value_mean END) "effectiveness",
  (CASE WHEN (k.id='16' and F.value_mean>36) THEN F.value_mean END) "oee"

  FROM 
  
  dim_date d,dim_time_sec t ,dim_process_segment p,  dim_kpi k, second_fact f

    where d.date_actual=F.date_id
    AND d.date_actual in ('2020-09-01')
--  AND d.date_actual in ('2020-09-01','2020-09-02','2020-09-03','2020-09-04','2020-09-05','2020-09-06','2020-09-07')
--	AND d.mmyyyy = '092020'
	AND t.full_time = F.time_id
    AND t.shift = 'Morning'

    And p.id = F.process_segment_id  
--  AND p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')
	AND p.process_segment_name in ('soap_line 2')

    AND k.id = F.kpi_id  
    AND k.id in (13,14,16)

) as x
where x.full_time not in (select y.full_time from ((
SELECT
  d.date_actual,
  t.full_time,
  t.shift,
  p.process_segment_name,
  (CASE WHEN (k.id='13') THEN F.value_mean END) "availability",
  (CASE WHEN (k.id='14') THEN F.value_mean END) "effectiveness",
  (CASE WHEN (k.id='16' and F.value_mean>36) THEN F.value_mean END) "oee"

  FROM 
  
  dim_date d,dim_time_sec t ,dim_process_segment p,  dim_kpi k, second_fact f

    where d.date_actual=F.date_id
    AND d.date_actual in ('2020-09-01')
--  AND d.date_actual in ('2020-09-01','2020-09-02','2020-09-03','2020-09-04','2020-09-05','2020-09-06','2020-09-07')
--	AND d.mmyyyy = '092020'
	AND t.full_time = F.time_id
    AND t.shift = 'Morning'

    And p.id = F.process_segment_id  
--  AND p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')
	AND p.process_segment_name in ('soap_line 2')

    AND k.id = F.kpi_id  
    AND k.id in (13)

) as y),dim_kpi k where k.id=16)
and x.date_actual not in (select x.date_actual from x,dim_kpi k where k.id=16)
