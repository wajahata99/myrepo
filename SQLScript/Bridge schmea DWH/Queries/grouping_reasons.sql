-- OEE by linee 
-- Dummy data population
Select * from dim_reason;
select * from second_fact;
select * from dim_time_sec;

--
-- Aggregation without grouping
--
Select  r.reason_subcategory_name, sum(F.duration_mean)  

From dim_reason r, second_fact F

Where 
r.id=F.reason_id

group by r.reason_subcategory_name
;

--
-- picking two reasons only
--
Select  r.reason_subcategory_name, sum(F.duration_mean)  

From dim_reason r, second_fact F

Where 
r.id=F.reason_id
and r.reason_subcategory_name in ('Uptime','Cleaning & Sanitization time')

group by r.reason_subcategory_name
;


--
-- picking two reasons and only fact.
--

Select  sum(F.duration_mean) as "group 1" 
From dim_reason r, second_fact F
Where 
r.id=F.reason_id
and r.reason_subcategory_name in ('Uptime','Cleaning & Sanitization time')
;

--
-- Complete query
--

select sum(F.duration_mean)
from dim_reason r, second_fact F
where
r.id in (
Select  r.id From dim_reason r Where r.reason_subcategory_name in ('Uptime','Cleaning & Sanitization time'));

Select  r.id From dim_reason r Where r.reason_subcategory_name in ('Breakdown & Equipment failure time','Minor stoppage & idling losses');

select x.group_1
from (
Select  sum(F.duration_mean) as "group_1" 
From dim_reason r, second_fact F
Where 
r.id=F.reason_id
and r.reason_subcategory_name in ('Uptime','Cleaning & Sanitization time')) as x;


Select  sum(F.duration_mean) as "group 1" 
From dim_reason r, second_fact F
Where 
r.id=F.reason_id
and r.reason_subcategory_name in ('Breakdown & Equipment failure time','Minor stoppage & idling losses')
;


---------------------
SELECT
	--GROUPING(Select  r.id From dim_reason r Where r.reason_subcategory_name in ('Uptime','Cleaning & Sanitization time'))) grouping_1,
	SUM (F.duration_mean)
FROM
	dim_reason r, second_fact F
GROUP BY
	GROUPING SETS (
		(Select  r.id From dim_reason r Where r.reason_subcategory_name in ('Uptime','Cleaning & Sanitization time')));
