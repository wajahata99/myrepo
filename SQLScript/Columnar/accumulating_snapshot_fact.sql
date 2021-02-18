--Accumulating snapshot fact
select * from second_fact 
where timestamp between '2020-09-09 00:00:00' and '2020-09-09 01:00:00'
and duration_mean is not null

-----------------
select reason_category_name, reason_subcategory_name,reason_name,process_segment_id,reason_tree_id,equipment_id from 
dim_reason r join reason_bridge rb
on r.id=rb.id