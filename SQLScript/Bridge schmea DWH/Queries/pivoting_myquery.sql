--Simple use case of UK, i.e. one date and one process segment
--All conditions and aggregates inside
--Results mactch
select x.date_actual, x.process_segment_name, (x.availability), (y.effectiveness), (z.oee)
from (
Select  d.date_actual,  p.process_segment_name, k.id, round(avg(F.value_mean),2) as availability
From dim_date d, dim_process_segment p, dim_kpi k, second_fact F
Where 
d.date_actual=F.date_id
AND d.date_actual in ('2020-06-25')
And F.process_segment_id = p.id 
AND p.process_segment_name in ('Soap Line 1')
AND k.id = F.kpi_id  
AND k.id = (13)
group by d.date_actual,  p.process_segment_name, k.id
) as x,

(
Select  d.date_actual,  p.process_segment_name, k.id, round(avg(F.value_mean),2) as effectiveness
From dim_date d, dim_process_segment p, dim_kpi k, second_fact F
Where 
d.date_actual=F.date_id
AND d.date_actual in ('2020-06-25')
And F.process_segment_id = p.id 
AND p.process_segment_name in ('Soap Line 1')
AND k.id = F.kpi_id   
AND k.id = (14)
group by d.date_actual,  p.process_segment_name, k.id
) as y,

(
Select  d.date_actual,  p.process_segment_name, k.id,round(avg(F.value_mean),2) as oee
From dim_date d, dim_process_segment p, dim_kpi k, second_fact F
Where 
d.date_actual=F.date_id
AND d.date_actual in ('2020-06-25')
And F.process_segment_id = p.id 
AND p.process_segment_name in ('Soap Line 1')
AND k.id = F.kpi_id   
AND k.id = (16)
group by d.date_actual,  p.process_segment_name,k.id
) as z

--------------------------------------------------------------------
--2 Simple use case of UK, i.e. one date and one process segment
--All conditions and aggregates inside
--One non-aggregated and rest are aggregated
select x.date_actual, x.process_segment_name, (x.availability), (y.effectiveness), (z.oee)
from (
Select  d.date_actual,  p.process_segment_name, k.id, round((F.value_mean),2) as availability
From dim_date d, dim_process_segment p, dim_kpi k, second_fact F
Where 
d.date_actual=F.date_id
AND d.date_actual in ('2020-06-25')
And F.process_segment_id = p.id 
AND p.process_segment_name in ('Soap Line 1')
AND k.id = F.kpi_id  
AND k.id = (13)
--group by d.date_actual,  p.process_segment_name, k.id
) as x,

(
Select  d.date_actual,  p.process_segment_name, k.id, round(avg(F.value_mean),2) as effectiveness
From dim_date d, dim_process_segment p, dim_kpi k, second_fact F
Where 
d.date_actual=F.date_id
AND d.date_actual in ('2020-06-25')
And F.process_segment_id = p.id 
AND p.process_segment_name in ('Soap Line 1')
AND k.id = F.kpi_id   
AND k.id = (14)
group by d.date_actual,  p.process_segment_name, k.id
) as y,

(
Select  d.date_actual,  p.process_segment_name, k.id,round(avg(F.value_mean),2) as oee
From dim_date d, dim_process_segment p, dim_kpi k, second_fact F
Where 
d.date_actual=F.date_id
AND d.date_actual in ('2020-06-25')
And F.process_segment_id = p.id 
AND p.process_segment_name in ('Soap Line 1')
AND k.id = F.kpi_id   
AND k.id = (16)
group by d.date_actual,  p.process_segment_name,k.id
) as z

---------------------------------------------------------------------
--Use case 1
--All conditions and aggregates inside
-- Returns some extra rows
select y.date_actual ,y.process_segment_name, (x.availability), (y.effectiveness), (z.oee)
from (
Select  d.date_actual, p.process_segment_name, round(avg(F.value_mean),2) as availability
From dim_date d, dim_process_segment p, dim_kpi k, second_fact F
Where 
d.date_actual=F.date_id
AND d.date_actual in ('2020-09-01','2020-09-02','2020-09-03','2020-09-04','2020-09-05','2020-09-06','2020-09-07')
And F.process_segment_id = p.id 
AND p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')
AND k.id = F.kpi_id  
AND k.id = (13)
group by  p.process_segment_name, d.date_actual
) as x,

(
Select   d.date_actual,p.process_segment_name,  round(avg(F.value_mean),2) as effectiveness
From dim_date d, dim_process_segment p, dim_kpi k, second_fact F
Where 
d.date_actual=F.date_id
AND d.date_actual in ('2020-09-01','2020-09-02','2020-09-03','2020-09-04','2020-09-05','2020-09-06','2020-09-07')
And F.process_segment_id = p.id 
AND p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')
AND k.id = F.kpi_id   
AND k.id = (14)
group by  p.process_segment_name,d.date_actual
) as y,

(
Select  d.date_actual,p.process_segment_name, round(avg(F.value_mean),2) as oee
From dim_date d, dim_process_segment p, dim_kpi k, second_fact F
Where 
d.date_actual=F.date_id
AND d.date_actual in ('2020-09-01','2020-09-02','2020-09-03','2020-09-04','2020-09-05','2020-09-06','2020-09-07')
And F.process_segment_id = p.id 
AND p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')
AND k.id = F.kpi_id   
AND k.id = (16)
group by p.process_segment_name,d.date_actual
) as z

------------------------
-- Use case 2
-- All conditions and aggregates inside
-- Returns some extra rows-->group by is not working properly as usual
select x.date_actual,x.full_time ,x.process_segment_name, (x.availability), (y.effectiveness), (z.oee)
from (
Select  d.date_actual, t.full_time, p.process_segment_name, round(avg(F.value_mean),2) as availability
From dim_date d, dim_time_sec t, dim_process_segment p, dim_kpi k, second_fact F
Where 
d.date_actual=F.date_id
--AND d.date_actual in ('2020-09-01','2020-09-02','2020-09-03','2020-09-04','2020-09-05','2020-09-06','2020-09-07')
AND d.date_actual in ('2020-09-01')
And F.process_segment_id = p.id 
--AND p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')
AND p.process_segment_name in ('soap_line 2')
AND t.full_time = F.time_id
AND t.shift_end = true
AND k.id = F.kpi_id  
AND k.id = (13)	
group by d.date_actual, t.full_time, p.process_segment_name
) as x,

(
Select   d.date_actual,t.full_time,p.process_segment_name,  round(avg(F.value_mean),2) as effectiveness
From dim_date d, dim_time_sec t, dim_process_segment p, dim_kpi k, second_fact F
Where 
d.date_actual=F.date_id
--AND d.date_actual in ('2020-09-01','2020-09-02','2020-09-03','2020-09-04','2020-09-05','2020-09-06','2020-09-07')
AND d.date_actual in ('2020-09-01')
And F.process_segment_id = p.id 
--AND p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')
AND p.process_segment_name in ('soap_line 2')
AND t.full_time = F.time_id
AND t.shift_end = true
AND k.id = F.kpi_id   
AND k.id = (14)
group by  d.date_actual, t.full_time, p.process_segment_name
) as y,

(
Select  d.date_actual, t.full_time, p.process_segment_name, round(avg(F.value_mean),2) as oee
From dim_date d, dim_time_sec t, dim_process_segment p, dim_kpi k, second_fact F
Where 
d.date_actual=F.date_id
--AND d.date_actual in ('2020-09-01','2020-09-02','2020-09-03','2020-09-04','2020-09-05','2020-09-06','2020-09-07')
AND d.date_actual in ('2020-09-01')	
And F.process_segment_id = p.id 
--AND p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')
AND p.process_segment_name in ('soap_line 2')
AND t.full_time = F.time_id
AND t.shift_end = true
AND k.id = F.kpi_id   
AND k.id = (16)
group by d.date_actual, t.full_time, p.process_segment_name
) as z

--------------------------------------------------------------
-- Moving aggregations out and keeping conditions inside and providing a manual join
-- Use case 2
-- Only works correct for single values otherwise provides the problems in the group by

select x.process_segment_name, avg(x.availability), avg(y.effectiveness), avg(z.oee) --x.date_actual,x.full_time ,
from (
Select  d.date_actual, t.full_time, p.process_segment_name, round((F.value_mean),2) as availability
From dim_date d, dim_time_sec t, dim_process_segment p, dim_kpi k, second_fact F
Where 
d.date_actual=F.date_id
--AND d.date_actual in ('2020-09-01','2020-09-02','2020-09-03','2020-09-04','2020-09-05','2020-09-06','2020-09-07')
AND d.date_actual in ('2020-09-01')
And F.process_segment_id = p.id 
--AND p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')
AND p.process_segment_name in ('soap_line 2')
AND t.full_time = F.time_id
AND t.shift_end = true
AND k.id = F.kpi_id  
AND k.id = (13)	
--group by d.date_actual, t.full_time, p.process_segment_name
) as x

join

(
Select   d.date_actual,t.full_time,p.process_segment_name,  round((F.value_mean),2) as effectiveness
From dim_date d, dim_time_sec t, dim_process_segment p, dim_kpi k, second_fact F
Where 
d.date_actual=F.date_id
--AND d.date_actual in ('2020-09-01','2020-09-02','2020-09-03','2020-09-04','2020-09-05','2020-09-06','2020-09-07')
AND d.date_actual in ('2020-09-01')
And F.process_segment_id = p.id 
--AND p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')
AND p.process_segment_name in ('soap_line 2')
AND t.full_time = F.time_id
AND t.shift_end = true
AND k.id = F.kpi_id   
AND k.id = (14)
--group by  d.date_actual, t.full_time, p.process_segment_name
) as y

on x.date_actual = y.date_actual
join
(
Select  d.date_actual, t.full_time, p.process_segment_name, round((F.value_mean),2) as oee
From dim_date d, dim_time_sec t, dim_process_segment p, dim_kpi k, second_fact F
Where 
d.date_actual=F.date_id
--AND d.date_actual in ('2020-09-01','2020-09-02','2020-09-03','2020-09-04','2020-09-05','2020-09-06','2020-09-07')
AND d.date_actual in ('2020-09-01')	
And F.process_segment_id = p.id 
--AND p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')
AND p.process_segment_name in ('soap_line 2')
AND t.full_time = F.time_id
AND t.shift_end = true
AND k.id = F.kpi_id   
AND k.id = (16)
--group by d.date_actual, t.full_time, p.process_segment_name
) as z
on y.date_actual=z.date_actual
--where x.date_actual = y.date_actual
--and y.date_actual = z.date_actual
--and x.process_segment_name = y.process_segment_name
--and y.process_segment_name = z.process_segment_name
--and x.full_time = y.full_time
--and z.full_time = z.full_time
group by x.process_segment_name --x.date_actual,x.full_time ,
 
--group by y.date_actual ,y.process_segment_name
--------------------------------------------------------------------
--Simple use case of UK, i.e. one date and one process segment
--All conditions inside and aggregations outside
select x.date_actual, x.process_segment_name, avg(x.availability), avg(y.effectiveness), avg(z.oee)
from (
Select  d.date_actual,  p.process_segment_name, k.id, round((F.value_mean),2) as availability
From dim_date d, dim_process_segment p, dim_kpi k, second_fact F
Where 
d.date_actual=F.date_id
AND d.date_actual in ('2020-06-25')
And F.process_segment_id = p.id 
AND p.process_segment_name in ('Soap Line 1')
AND k.id = F.kpi_id  
AND k.id = (13)
--group by d.date_actual,  p.process_segment_name, k.id
) as x,

(
Select  d.date_actual,  p.process_segment_name, k.id, round((F.value_mean),2) as effectiveness
From dim_date d, dim_process_segment p, dim_kpi k, second_fact F
Where 
d.date_actual=F.date_id
AND d.date_actual in ('2020-06-25')
And F.process_segment_id = p.id 
AND p.process_segment_name in ('Soap Line 1')
AND k.id = F.kpi_id   
AND k.id = (14)
--group by d.date_actual,  p.process_segment_name, k.id
) as y,

(
Select  d.date_actual,  p.process_segment_name, k.id,round((F.value_mean),2) as oee
From dim_date d, dim_process_segment p, dim_kpi k, second_fact F
Where 
d.date_actual=F.date_id
AND d.date_actual in ('2020-06-25')
And F.process_segment_id = p.id 
AND p.process_segment_name in ('Soap Line 1')
AND k.id = F.kpi_id   
AND k.id = (16)
--group by d.date_actual,  p.process_segment_name,k.id
) as z

group by x.date_actual, x.process_segment_name

--------------------------------------------------------------------
--All conditions inside and aggregations outside
--use case one
-- Takes too much time
select x.date_actual, x.process_segment_name, avg(x.availability), avg(y.effectiveness), avg(z.oee)
from (
Select  d.date_actual,  p.process_segment_name, k.id, round((F.value_mean),2) as availability
From dim_date d, dim_process_segment p, dim_kpi k, second_fact F
Where 
d.date_actual=F.date_id
AND d.date_actual in ('2020-09-01','2020-09-02','2020-09-03','2020-09-04','2020-09-05','2020-09-06','2020-09-07')
And F.process_segment_id = p.id 
AND p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')
AND k.id = F.kpi_id  
AND k.id = (13)
--group by d.date_actual,  p.process_segment_name, k.id
) as x,

(
Select  d.date_actual,  p.process_segment_name, k.id, round((F.value_mean),2) as effectiveness
From dim_date d, dim_process_segment p, dim_kpi k, second_fact F
Where 
d.date_actual=F.date_id
AND d.date_actual in ('2020-09-01','2020-09-02','2020-09-03','2020-09-04','2020-09-05','2020-09-06','2020-09-07')
And F.process_segment_id = p.id 
AND p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')
AND k.id = F.kpi_id   
AND k.id = (14)
--group by d.date_actual,  p.process_segment_name, k.id
) as y,

(
Select  d.date_actual,  p.process_segment_name, k.id,round((F.value_mean),2) as oee
From dim_date d, dim_process_segment p, dim_kpi k, second_fact F
Where 
d.date_actual=F.date_id
AND d.date_actual in ('2020-09-01','2020-09-02','2020-09-03','2020-09-04','2020-09-05','2020-09-06','2020-09-07')
And F.process_segment_id = p.id 
AND p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')
AND k.id = F.kpi_id   
AND k.id = (16)
--group by d.date_actual,  p.process_segment_name,k.id
) as z

group by x.date_actual, x.process_segment_name


----------------------------------------------
--Conditions outside and aggregations inside-->possibility of wrong results because aggreagations don't have enough and conditions.
--However, rest of the conditions are provided outside. The only problem is aggregating on the process etc which are outside.
select d.date_actual, p.process_segment_name, x.availability, y.effectiveness, z.oee
from 
(
Select  k.id, round(avg(F.value_mean),2) as availability
From dim_kpi k, second_fact F
Where 
k.id = F.kpi_id   
AND k.id = 13
group by k.id
) x,

(
Select  k.id, round(avg(F.value_mean),2) as effectiveness
From dim_kpi k, second_fact F
Where 
k.id = F.kpi_id   
AND k.id = 14
group by k.id
) y,

(
Select  k.id, round(avg(F.value_mean),2) as oee
From dim_kpi k, second_fact F
Where 
k.id = F.kpi_id   
AND k.id = 16
group by k.id
) z,


dim_date d,
dim_process_segment p,
second_fact F

Where 
d.date_actual=F.date_id
AND d.date_actual in ('2020-06-25')
--AND d.date_actual in ('2020-09-01','2020-09-02','2020-09-03','2020-09-04','2020-09-05','2020-09-06','2020-09-07')

--AND t.full_time = F.time_id
And F.process_segment_id = p.id 
AND p.process_segment_name in ('Soap Line 1')
--AND p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')

------------------
--Conditions outside and aggregations outside as well
-->group by at sub query level will be removed and applied at higher level--> possible problem is slow performance because 
-- of large data at the sub-query level
--> takess too much time
select p.process_segment_name, avg(x.availability), avg(y.effectiveness), avg(z.oee)
from 
(
Select  k.id, round((F.value_mean),2) as availability
From dim_kpi k, second_fact F
Where 
k.id = F.kpi_id   
AND k.id = 13
--group by k.id
) x,

(
Select  k.id, round((F.value_mean),2) as effectiveness
From dim_kpi k, second_fact F
Where 
k.id = F.kpi_id   
AND k.id = 14
--group by k.id
) y,

(
Select  k.id, round((F.value_mean),2) as oee
From dim_kpi k, second_fact F
Where 
k.id = F.kpi_id   
AND k.id = 16
--group by k.id
) z,


dim_date d,
dim_process_segment p,
second_fact F

Where 
d.date_actual=F.date_id
AND d.date_actual in ('2020-06-25')
--AND d.date_actual in ('2020-09-01','2020-09-02','2020-09-03','2020-09-04','2020-09-05','2020-09-06','2020-09-07')

--AND t.full_time = F.time_id
And F.process_segment_id = p.id 
AND p.process_segment_name in ('Soap Line 1')
--AND p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')
group by p.process_segment_name

--------------------------------
--Removing fact table and kpi dim id join from the subqueries as well
--> takes too much time 
create index index_complete_facttable on second_fact (kpi_id)

select F.date_id, p.process_segment_name, avg(x.availability), avg(y.effectiveness), avg(z.oee)
from 
(
Select  (F.value_mean) as availability
From second_fact F
Where 
F.kpi_id = 13 
) x,

(
Select (F.value_mean) as effectiveness
From second_fact F
Where 
F.kpi_id = 14
) y,

(
Select  F.value_mean as oee
From second_fact F
Where 
F.kpi_id = 16
) z,


dim_date d,
dim_process_segment p,
second_fact F

Where 
F.date_id in ('2020-06-25')
--AND d.date_actual in ('2020-09-01','2020-09-02','2020-09-03','2020-09-04','2020-09-05','2020-09-06','2020-09-07')

--AND t.full_time = F.time_id
AND F.kpi_id in (13,14,16)
And F.process_segment_id = p.id 
AND p.process_segment_name in ('Soap Line 1')
--AND p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')
group by F.date_id,p.process_segment_name

