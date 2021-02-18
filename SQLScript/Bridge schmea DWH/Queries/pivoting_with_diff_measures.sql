-----------------
-- Simplified select statement
select X.date_actual, X.process_segment_name, avg(X.availabilty), avg(Y.effectivness), avg(Z.oee)
from
-- process_segment dimension, date dimension and fact table are joined for a certain kpi_id
(select anon_2.date_actual as date_actual, anon_1.process_segment_name as process_segment_name, date_id, process_segment_id,  value_mean as availabilty 
 	from public.second_fact--Fact table joins with Process Segment Dim
	JOIN (SELECT public.dim_process_segment.process_segment_name AS process_segment_name, public.dim_process_segment.id AS id
	FROM public.dim_process_segment
	WHERE true) AS anon_1 
 	ON anon_1.id = public.second_fact.process_segment_id --joining process_segment with the fact table
	JOIN --Joins the date dimension
 	(SELECT public.dim_date.date_actual AS date_actual
	FROM public.dim_date
	WHERE public.dim_date.date_actual IN ('2020-06-25')) AS anon_2 
 	ON anon_2.date_actual = public.second_fact.date_id
	where public.second_fact.kpi_id =13
)
as X
JOIN (select date_id, process_segment_id, kpi_id, time_id, value_mean as effectivness 
	  from public.second_fact where kpi_id =14) as Y
      ON y.date_id = x.date_id
      AND y.process_segment_id = x.process_segment_id
      --AND y.time_id = x.time_id
JOIN (select date_id, process_segment_id, kpi_id, time_id, value_mean as oee 
	  from public.second_fact where kpi_id =16) as Z
      ON  z.date_id = x.date_id
      AND z.process_segment_id = x.process_segment_id
      --AND z.time_id = x.time_id
group by X.date_actual, X.process_segment_name
----------------------------------------------------------------------------------
-----------------Rules
--select statement should be same, not selected at lower level can't be accessed at higher level
-- Simplified select statement 2
select X.date_actual, X.process_segment_name, round(avg(X.availabilty),2), round(avg(Y.effectivness),2), round(avg(Z.oee),2)
from
(select xx2.date_actual , xx.process_segment_name , process_segment_id,  value_mean as availabilty 
 	from public.second_fact
	JOIN (SELECT p.process_segment_name AS process_segment_name, p.id AS id
	FROM public.dim_process_segment p) AS xx 
 	ON xx.id = public.second_fact.process_segment_id 
	JOIN 
 	(SELECT d.date_actual
	FROM public.dim_date d
	WHERE d.date_actual IN ('2020-06-25')) AS xx2 
 	ON xx2.date_actual = public.second_fact.date_id
	where public.second_fact.kpi_id =13) as X
JOIN (select date_id, process_segment_id, kpi_id, time_id, value_mean as effectivness 
	  from public.second_fact where kpi_id =14) as Y
      ON y.date_id = x.date_actual
      AND y.process_segment_id = x.process_segment_id
JOIN (select date_id, process_segment_id, kpi_id, time_id, value_mean as oee 
	  from public.second_fact where kpi_id =16) as Z
      ON  z.date_id = x.date_actual
      AND z.process_segment_id = x.process_segment_id
group by X.date_actual, X.process_segment_name

------------------------------------------------------------------------------------
--modified
select X.date_actual, X.process_segment_name, X.availabilty, Y.effectivness, (Z.oee)
from
-- process_segment dimension, date dimension and fact table are joined for a certain kpi_id is 13 as X
(select anon_2.date_actual as date_actual, anon_1.process_segment_name as process_segment_name, date_id, process_segment_id, avg(value_mean) as availabilty 
 	from public.second_fact
	JOIN (SELECT public.dim_process_segment.process_segment_name AS process_segment_name, public.dim_process_segment.id AS id
	FROM public.dim_process_segment
	WHERE true) AS anon_1 
 	ON anon_1.id = public.second_fact.process_segment_id 
	JOIN 
 	(SELECT public.dim_date.date_actual AS date_actual
	FROM public.dim_date
	WHERE public.dim_date.date_actual IN ('2020-06-25')) AS anon_2 
 	ON anon_2.date_actual = public.second_fact.date_id
	where public.second_fact.kpi_id =13
    group by anon_2.date_actual, anon_1.process_segment_name , date_id, process_segment_id, time_id
)
as X

JOIN (select date_id, process_segment_id, kpi_id, time_id, avg(value_mean) as effectivness 
	  from public.second_fact where kpi_id =14
	  group by date_id, process_segment_id, kpi_id, time_id) as Y
      ON y.date_id = x.date_id
      AND y.process_segment_id = x.process_segment_id
      --AND y.time_id = x.time_id

JOIN (select date_id, process_segment_id, kpi_id, time_id, avg(value_mean) as oee 
	  from public.second_fact where kpi_id =16
	  group by date_id, process_segment_id, kpi_id, time_id) as Z
      ON  z.date_id = x.date_id
      AND z.process_segment_id = x.process_segment_id
      --AND z.time_id = x.time_id

---------------------------------------------------
--from bilal

select X.date_actual, X.process_segment_name, avg(X.availabilty), avg(Y.effectivness), avg(Z.oee) 
from  
(select anon_2.date_actual as date_actual, anon_1.process_segment_name as process_segment_name,
 date_id, location_id, personnel_id, equipment_id, material_id,
 process_segment_id, operation_definition_id ,operation_request_id,
operation_response_id, sensor_id, customer_id,event_id, kpi_id, property_id, reason_id, state_id, 
 value_mean as availabilty from public.second_fact 
JOIN (SELECT public.dim_process_segment.process_segment_name AS process_segment_name, public.dim_process_segment.id AS id 
FROM public.dim_process_segment 
WHERE true) AS anon_1 ON anon_1.id = public.second_fact.process_segment_id 
JOIN (SELECT public.dim_date.date_actual AS date_actual 
FROM public.dim_date 
WHERE public.dim_date.date_actual IN ('2020-06-25')) AS anon_2 ON anon_2.date_actual = public.second_fact.date_id
where public.second_fact.kpi_id =13
)
as X
JOIN (select
      date_id,location_id, personnel_id, equipment_id, material_id, process_segment_id, operation_definition_id ,operation_request_id,
        operation_response_id, sensor_id, customer_id,event_id, kpi_id, property_id, reason_id, state_id, time_id,
        value_mean as effectivness from public.second_fact where kpi_id =14) as Y
        ON 
        y.date_id = x.date_id
        AND y.process_segment_id = x.process_segment_id
        --AND y.time_id = x.time_id
JOIN (select
      date_id,location_id, personnel_id, equipment_id, material_id, process_segment_id, operation_definition_id ,operation_request_id,
        operation_response_id, sensor_id, customer_id,event_id, kpi_id, property_id, reason_id, state_id, time_id,
        value_mean as oee from public.second_fact where kpi_id =16) as Z
        ON 
        z.date_id = x.date_id 
        AND z.process_segment_id = x.process_segment_id
        --AND z.time_id = x.time_id
group by X.date_actual, X.process_segment_name


--
--my query
--

select x.availability, y.effectiveness
from (
Select  d.date_actual,  p.process_segment_name, k.kpi_type_name, round(avg(F.value_mean),2) as availability

From dim_date d, dim_time_sec t, dim_process_segment p, dim_kpi k, second_fact F

Where 
d.date_actual=F.date_id
AND d.date_actual in ('2020-06-25')

And F.process_segment_id = p.id 
AND p.process_segment_name in ('Soap Line 1')

AND k.id = F.kpi_id   
AND k.id = (13)

group by d.date_actual,  p.process_segment_name, k.kpi_type_name
) as x,

(
Select  d.date_actual,  p.process_segment_name, k.kpi_type_name, round(avg(F.value_mean),2) as effectiveness

From dim_date d, dim_time_sec t, dim_process_segment p, dim_kpi k, second_fact F

Where 
d.date_actual=F.date_id
AND d.date_actual in ('2020-06-25')

And F.process_segment_id = p.id 
AND p.process_segment_name in ('Soap Line 1')

AND k.id = F.kpi_id   
AND k.id = (14)

group by d.date_actual,  p.process_segment_name, k.kpi_type_name
) as y
----------
--my query 2
select x.date_actual, x.process_segment_name, x.availability, y.effectiveness, z.oee
from (
Select  d.date_actual,  p.process_segment_name, k.id, round(avg(F.value_mean),2) as availability
From dim_date d, dim_time_sec t, dim_process_segment p, dim_kpi k, second_fact F
Where 
d.date_actual=F.date_id
AND d.date_actual in ('2020-09-01','2020-09-02','2020-09-03','2020-09-04','2020-09-05','2020-09-06','2020-09-07')
And F.process_segment_id = p.id 
AND p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')
AND k.id = F.kpi_id  
AND k.id = (13)
group by d.date_actual,  p.process_segment_name, k.id
) as x,

(
Select  d.date_actual,  p.process_segment_name, k.id, round(avg(F.value_mean),2) as effectiveness
From dim_date d, dim_time_sec t, dim_process_segment p, dim_kpi k, second_fact F
Where 
d.date_actual=F.date_id
AND d.date_actual in ('2020-09-01','2020-09-02','2020-09-03','2020-09-04','2020-09-05','2020-09-06','2020-09-07')
And F.process_segment_id = p.id 
AND p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')
AND k.id = F.kpi_id   
AND k.id = (14)
group by d.date_actual,  p.process_segment_name, k.id
) as y,

(
Select  d.date_actual,  p.process_segment_name, k.id,round(avg(F.value_mean),2) as oee
From dim_date d, dim_time_sec t, dim_process_segment p, dim_kpi k, second_fact F
Where 
d.date_actual=F.date_id
AND d.date_actual in ('2020-09-01','2020-09-02','2020-09-03','2020-09-04','2020-09-05','2020-09-06','2020-09-07')
And F.process_segment_id = p.id 
AND p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')
AND k.id = F.kpi_id   
AND k.id = (16)
group by d.date_actual,  p.process_segment_name,k.id
) as z


----------------------------------------
--my query 3 --> combined where statement
select d.date_actual, p.process_segment_name, x.availability, y.effectiveness
from 
(
Select  k.id, round(avg(F.value_mean),2) as availability
From dim_kpi k, second_fact F
Where 
k.id = F.kpi_id   
AND k.id = 13
group by k.id
) as x,

(
Select  k.id, round(avg(F.value_mean),2) as effectiveness
From dim_kpi k, second_fact F
Where 
k.id = F.kpi_id   
AND k.id = 14
group by k.id
) as y,
dim_date d,
dim_process_segment p,
second_fact F

Where 
d.date_actual=F.date_id
AND d.date_actual in ('2020-06-25')

And F.process_segment_id = p.id 
AND p.process_segment_name in ('Soap Line 1')

-------------------------------

--my query 4
select d.date_actual, t.full_time, p.process_segment_name, x.availability, y.effectiveness
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
dim_date d,
dim_time_sec t,
dim_process_segment p,
second_fact F

Where 
d.date_actual=F.date_id
AND d.date_actual in ('2020-09-01','2020-09-02','2020-09-03','2020-09-04','2020-09-05','2020-09-06','2020-09-07')

AND t.full_time = F.time_id
And F.process_segment_id = p.id 
AND p.process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')

--------------------------------------------------------
-- Close to UK structure--> Aggregations outside the sub query--> takes too much time
--my query 5
select xx.date, xx.p_seg, avg(xx.availability), avg(y.effectiveness)
from
(select x.date_actual as date, x.process_segment_name as p_seg, x.availability as availability
from 
(Select  d.date_actual,p.process_segment_name, F.value_mean as availability
From dim_date dd, dim_process_segment pp, dim_kpi kk, second_fact FF
Where d.date_actual = F.date_id
AND F.process_segment_id = p.id 
AND p.process_segment_name in ('Soap Line 1')	
AND k.id = FF.kpi_id   
AND k.id = 13
) x,
dim_date d,
dim_process_segment p,
second_fact F
Where 
d.date_actual=F.date_id
AND d.date_actual in ('2020-06-25')
And F.process_segment_id = p.id 
AND p.process_segment_name in ('Soap Line 1')

group by d.date_actual, p.process_segment_name) xx,

(Select  d.date_actual, k.id, F.value_mean as effectivness
From dim_date d,dim_kpi k, dim_process_segment p,second_fact F
Where F.date_id = d.date_actual
AND F.process_segment_id = p.id 
AND p.process_segment_name in ('Soap Line 1')	
AND k.id = F.kpi_id   
AND k.id = 14
) y
where y.date_actual = xx.date
group by xx.date, xx.p_seg
--------use case 1 Bilal
select X.process_segment_name, avg(X.availabilty), avg(Y.effectivness), avg(Z.oee) 
from  
(select anon_2.date_actual as date_actual, anon_1.process_segment_name as process_segment_name,
 date_id, location_id, personnel_id, equipment_id, material_id,
 process_segment_id, operation_definition_id ,operation_request_id,
operation_response_id, sensor_id, customer_id,event_id, kpi_id, property_id, reason_id, state_id,time_id,
 value_mean as availabilty from public.second_fact 
JOIN (SELECT public.dim_process_segment.process_segment_name AS process_segment_name, public.dim_process_segment.id AS id 
FROM public.dim_process_segment 
WHERE process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')) AS anon_1 ON anon_1.id = public.second_fact.process_segment_id 
JOIN (SELECT public.dim_date.date_actual AS date_actual 
FROM public.dim_date 
WHERE public.dim_date.date_actual IN ('2020-09-01','2020-09-02','2020-09-03','2020-09-04','2020-09-05','2020-09-06','2020-09-07')) AS anon_2 ON anon_2.date_actual = public.second_fact.date_id
JOIN (SELECT public.dim_time_sec.full_time as full_time 
FROM public.dim_time_sec 
WHERE true) AS anon_3 ON anon_3.full_time = public.second_fact.time_id
where public.second_fact.kpi_id =13


)
as X
JOIN (select
      date_id,location_id, personnel_id, equipment_id, material_id, process_segment_id, operation_definition_id ,operation_request_id,
        operation_response_id, sensor_id, customer_id,event_id, kpi_id, property_id, reason_id, state_id, time_id,
        value_mean as effectivness from public.second_fact where kpi_id =14) as Y
        ON 
        y.date_id = x.date_id
        AND y.process_segment_id = x.process_segment_id
        AND y.time_id = x.time_id
JOIN (select
      date_id,location_id, personnel_id, equipment_id, material_id, process_segment_id, operation_definition_id ,operation_request_id,
        operation_response_id, sensor_id, customer_id,event_id, kpi_id, property_id, reason_id, state_id, time_id,
        value_mean as oee from public.second_fact where kpi_id =16) as Z
        ON 
        z.date_id = x.date_id 
        AND z.process_segment_id = x.process_segment_id
        AND z.time_id = x.time_id
group by X.process_segment_name

------use case 2
select X.process_segment_name, avg(X.availabilty), avg(Y.effectivness), avg(Z.oee) 
from  
(select anon_2.date_actual as date_actual, anon_1.process_segment_name as process_segment_name, anon_3.shift_end as shift_end,
 date_id, location_id, personnel_id, equipment_id, material_id,
 process_segment_id, operation_definition_id ,operation_request_id,
operation_response_id, sensor_id, customer_id,event_id, kpi_id, property_id, reason_id, state_id,time_id,
 value_mean as availabilty from public.second_fact 
JOIN (SELECT public.dim_process_segment.process_segment_name AS process_segment_name, public.dim_process_segment.id AS id 
FROM public.dim_process_segment 
WHERE process_segment_name in ('soap_line 2','soap_line 3','soap_line 4', 'soap_line 5', 'soap_line 6','soap_line 7')) AS anon_1 ON anon_1.id = public.second_fact.process_segment_id 
JOIN (SELECT public.dim_date.date_actual AS date_actual 
FROM public.dim_date 
WHERE public.dim_date.date_actual IN ('2020-09-01','2020-09-02','2020-09-03','2020-09-04','2020-09-05','2020-09-06','2020-09-07')) AS anon_2 ON anon_2.date_actual = public.second_fact.date_id
JOIN (SELECT public.dim_time_sec.shift_end AS shift_end, public.dim_time_sec.full_time as full_time 
FROM public.dim_time_sec 
WHERE shift_end IN (TRUE)) AS anon_3 ON anon_3.full_time = public.second_fact.time_id
where public.second_fact.kpi_id =13


)
as X
JOIN (select
      date_id,location_id, personnel_id, equipment_id, material_id, process_segment_id, operation_definition_id ,operation_request_id,
        operation_response_id, sensor_id, customer_id,event_id, kpi_id, property_id, reason_id, state_id, time_id,
        value_mean as effectivness from public.second_fact where kpi_id =14) as Y
        ON 
        y.date_id = x.date_id
        AND y.process_segment_id = x.process_segment_id
        AND y.time_id = x.time_id
JOIN (select
      date_id,location_id, personnel_id, equipment_id, material_id, process_segment_id, operation_definition_id ,operation_request_id,
        operation_response_id, sensor_id, customer_id,event_id, kpi_id, property_id, reason_id, state_id, time_id,
        value_mean as oee from public.second_fact where kpi_id =16) as Z
        ON 
        z.date_id = x.date_id 
        AND z.process_segment_id = x.process_segment_id
        AND z.time_id = x.time_id
group by X.process_segment_name

