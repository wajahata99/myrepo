-- OEE by linee 
-- Dummy data population
Select * from dim_process_segment;
select * from dim_kpi;--pk to insert in fact table 1,2,3 
select * from second_fact;
select * from dim_time_sec;

--inserting data for soap_line1_date 2020_07_29
INSERT INTO second_fact(date_id, location_id,personnel_id,equipment_id,material_id,process_segment_id,operation_definition_id,operation_request_id,operation_response_id,sensor_id,customer_id,event_id, kpi_id,record_count,value_min,value_q1,value_mean,value_q3,value_max,value_total,value_units,value_string,duration_units, property_id,duration_total,duration_min,duration_mean,duration_max,time_id, state_id,reason_id)
VALUES ('2020-07-29', 100, 100, 100,  100, 2, 100, 100, 100,100,100,  100,--event_id
		1,--kpi_id 
		null, null, null, null,null, null,null,null,null,null,100,null,null,'00:15:00',null,
	   '06:00:00',--time_id
	   100,100),
		('2020-07-29', 100, 100, 100,  100, 2, 100, 100, 100,100,100,  100,--event_id
		2,--kpi_id 
		null, null, null, null,null, null,null,null,null,null,100,null,null,'00:15:00',null,
	   '06:00:00',--time_id
	   100,100),
     	('2020-07-29', 100, 100, 100,  100, 2, 100, 100, 100,100,100,  100,--event_id
		3,--kpi_id 
		null, null, null, null,null, null,null,null,null,null,100,null,null,'00:15:00',null,
	   '06:00:00',--time_id
	   100,100)
RETURNING *;

--inserting data for soap_line1_date 2020_07_28

INSERT INTO second_fact(date_id, location_id,personnel_id,equipment_id,material_id,process_segment_id,operation_definition_id,operation_request_id,operation_response_id,sensor_id,customer_id,event_id, kpi_id,record_count,value_min,value_q1,value_mean,value_q3,value_max,value_total,value_units,value_string,duration_units, property_id,duration_total,duration_min,duration_mean,duration_max,time_id, state_id,reason_id)
VALUES ('2020-07-28', 100, 100, 100,  100, 2, 100, 100, 100,100,100,  100,--event_id
		1,--kpi_id 
		null, null, null, null,null, null,null,null,null,null,100,null,null,'00:15:00',null,
	   '06:00:00',--time_id
	   100,100),
		('2020-07-28', 100, 100, 100,  100, 2, 100, 100, 100,100,100,  100,--event_id
		2,--kpi_id 
		null, null, null, null,null, null,null,null,null,null,100,null,null,'00:15:00',null,
	   '06:00:00',--time_id
	   100,100),
     	('2020-07-28', 100, 100, 100,  100, 2, 100, 100, 100,100,100,  100,--event_id
		3,--kpi_id 
		null, null, null, null,null, null,null,null,null,null,100,null,null,'00:15:00',null,
	   '06:00:00',--time_id
	   100,100)
RETURNING *;

--
--Query for grid
--
Select  d.date_actual, t.full_time, p.process_segment_name, k.kpi_type_name, F.duration_mean  

From dim_date d, dim_time_sec t, dim_process_segment p, dim_kpi k, second_fact F

Where 
d.date_actual=F.date_id
AND d.date_actual in ('2020-07-29','2020-07-28')

AND t.full_time = F.time_id
And t.shift_end = True

And F.process_segment_id = p.id 
AND p.process_segment_name in ('Soap Line 1')

AND k.id = F.kpi_id   
AND k.kpi_concept = 'Process Segment'
AND k.kpi_type_name in ('Actual Production Time','Actual Unit Setup Time','Actual Unit Delay Time')
;

--
--Query for bar chart with sum measure acting as a surugate for the percent measure
--
Select  p.process_segment_name, k.kpi_type_name, sum(F.duration_mean)  

From dim_date d, dim_time_sec t, dim_process_segment p, dim_kpi k, second_fact F

Where 
d.date_actual=F.date_id
--AND d.date_actual in ('2020-07-29','2020-07-28')

AND t.full_time = F.time_id
And t.shift_end = True

And F.process_segment_id = p.id 
AND p.process_segment_name in ('Soap Line 1')

AND k.id = F.kpi_id   
AND k.kpi_concept = 'Process Segment'
AND k.kpi_type_name in ('Actual Production Time','Actual Unit Setup Time','Actual Unit Delay Time')

group by p.process_segment_name, k.kpi_type_name
;


--
--Questio(?)/comments(!)
--

--Percentage meausure implementation?
--Query at a slice design time performs group by after the results are returned without group by as shown in the grid view query?
--Things can work without pivoting in this case and may be in most slices created for unilever! 

--
--Query settings
--

--Process Segment Name(Soap lines) --> group by
--Kpi_type_name --> break down by
--fact value(duration) --> metrics









