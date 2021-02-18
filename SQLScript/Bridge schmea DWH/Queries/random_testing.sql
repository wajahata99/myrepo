select count(value_mean) 
from second_fact f, dim_process_segment p, dim_kpi k 
where f.kpi_id=k.id
and f.process_segment_id= p.id
and k.kpi_type_name = 'Overall Equipment Effectiveness Index'
and k.kpi_concept = 'process_segment'
