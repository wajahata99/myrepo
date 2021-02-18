--reason fact dont have 24th sep data where as kpi_fact has 24th data.
-- http://blog.chrisadamson.com/2011/12/three-ways-to-drill-across.html
-- conformed dimensions in use are date and process_segment

-- Implementation method 3 -->Subqueries

select A.date_actual, A.process_segment_name,A.availability,B.reason_fact_1 from 
(SELECT
d.date_actual,
p.process_segment_name,
f.availability
FROM 
dim_date d, dim_time_sec t,dim_process_segment p,  dim_kpi k, kpi_fact f
where d.date_actual=F.date_id
AND t.full_time=f.time_id
AND t.shift_end = true
AND d.date_actual in ('2020-09-24')
And p.id = F.process_segment_id  
AND p.process_segment_name in ('soap_line 2','soap_line 3')
order by d.date_actual) as A

full outer join

(SELECT
d.date_actual,
p.process_segment_name,
f.reason_fact_1
FROM 
dim_date d, dim_time_sec t, dim_process_segment p,  dim_kpi k, reason_fact f
where d.date_actual=F.date_id
AND d.date_actual in ('2020-09-25')
AND t.full_time=f.time_id
AND t.shift_end = true
And p.id = F.process_segment_id  
AND p.process_segment_name in ('soap_line 2','soap_line 3')
order by  d.date_actual) as B

on A.date_actual=B.date_actual
and A.process_segment_name=B.process_segment_name
--on A.process_segment_name = B.process_segment_name

---------------------
-- Implementation method 2--> Temp tables

--temp table 1
drop table if exists temp_2;
SELECT
--    d.date_actual,	t.full_time,
	f.timestamp,
	p.process_segment_name,
	r.reason_category_name,
	f.reason_fact_1
INTO TEMPORARY TABLE temp_2
FROM
    dim_date d, dim_time_sec t, dim_process_segment p,  dim_reason r, reason_fact f
WHERE
d.date_actual=F.date_id
AND d.date_actual in ('2020-09-25')
AND t.full_time=f.time_id
AND t.full_time between '00:00:00' and '00:30:00'
And p.id = F.process_segment_id  
AND p.process_segment_name in ('soap_line 2','soap_line 3')
AND r.id = f.reason_id
AND r.id in (1)
order by  d.date_actual;
select * from temp_2;

--Temp table 
drop table if exists temp_3;
SELECT
--	d.date_actual,	t.full_time,
	f.timestamp,
	k.kpi_type_name,
	p.process_segment_name,
	f.availability
INTO TEMPORARY TABLE temp_3
FROM
	dim_date d, dim_time_sec t,dim_process_segment p, dim_kpi k, kpi_fact f
WHERE
d.date_actual=F.date_id
AND t.full_time=f.time_id
AND t.full_time between '00:00:00' and '00:30:00'
AND d.date_actual in ('2020-09-25')
And p.id = F.process_segment_id  
AND p.process_segment_name in ('soap_line 3')
AND k.id = f.kpi_id
AND k.id in (13)
order by d.date_actual;
select * from temp_3;


set enable_hashjoin = off;
explain analyze

--select temp_2.date_actual,temp_2.process_segment_name,temp_2.reason_fact_1,temp_3.availability from 
select temp_2.timestamp,temp_2.process_segment_name,temp_2.reason_fact_1,temp_3.availability from 
--select * from
temp_2 full join temp_3
on temp_2.timestamp = temp_3.timestamp
--on temp_2.date_actual=temp_3.date_actual;

------------------
--additional step
select *
from
(select temp_2.timestamp,temp_2.process_segment_name 
from temp_2 full join temp_3
on temp_2.timestamp = temp_3.timestamp) as A

left join
(select temp_2.timestamp, temp_2.reason_fact_1,temp_3.availability 
from temp_2 full join temp_3
on temp_2.timestamp = temp_3.timestamp) as B
on A.timestamp = B.timestamp

--on temp_2.date_actual=temp_3.date_actual;

-------------------
--sort merge test
create table A(
	id int primary key,
	process_seg text
)

insert into A(id,process_seg)
values(1,'seg1')
insert into A(id,process_seg)
values(2,'seg2')
insert into A(id,process_seg)
values(3,'seg3')
insert into A(id,process_seg)
values(5,'seg5')

create table B(
	id int primary key,
	fact1 int
)

insert into B(id,fact1)
values(1,11)
insert into B(id,fact1)
values(2,22)
insert into B(id,fact1)
values(3,33)
insert into B(id,fact1)
values(4,44)


explain analyze
select A.process_seg,B.fact1

select *
from A full join B
on A.id=B.id









