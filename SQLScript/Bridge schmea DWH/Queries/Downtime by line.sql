-- Dummy data population
Select * from dim_process_segment;
select * from dim_reason; where reason_name in ('Product Changeover', 'Format Changeover', 'Utility Problem');-- ids 26, 27, 38

select * from second_fact;

select * from dim_time_sec;

--inserting data for soap_line1_date 2020_07_29
INSERT INTO second_fact(date_id, location_id,personnel_id,equipment_id,material_id,process_segment_id,operation_definition_id,operation_request_id,operation_response_id,sensor_id,customer_id,event_id, kpi_id,record_count,value_min,value_q1,value_mean,value_q3,value_max,value_total,value_units,value_string,duration_units, property_id,duration_total,duration_min,duration_mean,duration_max,time_id, state_id,reason_id)
VALUES ('2020-07-29', 100, 100, 100,  100, 2, 100, 100, 100,100,100,  100,--event_id
		100,--kpi_id 
		null, null, null, null,null, null,null,null,null,null,100,null,null,'00:30:00',null,
	   '06:00:00',--time_id
	   100,26),
		('2020-07-29', 100, 100, 100,  100, 2, 100, 100, 100,100,100,  100,--event_id
		100,--kpi_id 
		null, null, null, null,null, null,null,null,null,null,100,null,null,'00:30:00',null,
	   '06:00:00',--time_id
	   100,27),
     	('2020-07-29', 100, 100, 100,  100, 2, 100, 100, 100,100,100,  100,--event_id
		100,--kpi_id 
		null, null, null, null,null, null,null,null,null,null,100,null,null,'00:30:00',null,
	   '06:00:00',--time_id
	   100,28)
RETURNING *;

--inserting data for soap_line1_date 2020_07_28

INSERT INTO second_fact(date_id, location_id,personnel_id,equipment_id,material_id,process_segment_id,operation_definition_id,operation_request_id,operation_response_id,sensor_id,customer_id,event_id, kpi_id,record_count,value_min,value_q1,value_mean,value_q3,value_max,value_total,value_units,value_string,duration_units, property_id,duration_total,duration_min,duration_mean,duration_max,time_id, state_id,reason_id)
VALUES ('2020-07-28', 100, 100, 100,  100, 2, 100, 100, 100,100,100,  100,--event_id
		100,--kpi_id 
		null, null, null, null,null, null,null,null,null,null,100,null,null,'00:30:00',null,
	   '06:00:00',--time_id
	   100,26),
		('2020-07-28', 100, 100, 100,  100, 2, 100, 100, 100,100,100,  100,--event_id
		100,--kpi_id 
		null, null, null, null,null, null,null,null,null,null,100,null,null,'00:30:00',null,
	   '06:00:00',--time_id
	   100,27),
     	('2020-07-28', 100, 100, 100,  100, 2, 100, 100, 100,100,100,  100,--event_id
		100,--kpi_id 
		null, null, null, null,null, null,null,null,null,null,100,null,null,'00:30:00',null,
	   '06:00:00',--time_id
	   100,38)
RETURNING *;

--
--Query for grid
--
Select  d.date_actual, t.full_time, p.process_segment_name, r.reason_name, F.duration_mean  

From dim_date d, dim_time_sec t, dim_process_segment p, dim_reason r, second_fact F

Where 
d.date_actual=F.date_id
AND d.date_actual in ('2020-07-29','2020-07-28')

AND t.full_time = F.time_id
And t.shift_end = True

And p.id = F.process_segment_id   
AND p.process_segment_name in ('Soap Line 1')

AND r.id = F.reason_id
And r.reason_name in ('Product Changeover', 'Format Changeover', 'Preparatory & close out time losses (previously startup & ramp down)','Utility Problem')
;

--
--Query for bar chart with sum measure
--
Select p.process_segment_name, r.reason_name, sum(F.duration_mean)  

From dim_date d, dim_time_sec t, dim_process_segment p, dim_reason r, second_fact F

Where 
d.date_actual=F.date_id
AND d.date_actual in ('2020-07-29','2020-07-28')

AND t.full_time = F.time_id
And t.shift_end = True

And p.id = F.process_segment_id   
AND p.process_segment_name in ('Soap Line 1')

AND r.id = F.reason_id
And r.reason_name in ('Product Changeover', 'Format Changeover', 'Preparatory & close out time losses (previously startup & ramp down)','Utility Problem')

group by p.process_segment_name, r.reason_name
;


--
--Questio(?)/comments(!)
--

--Pivoting is not needed for this particular slice 
--

--
--Query settings
--

--Process Segment Name(Soap lines) --> group by
--Reason_name --> break down by
--fact value(sum of duration) --> metrics









