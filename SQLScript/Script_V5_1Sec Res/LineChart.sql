--Line chart
drop view if exists linechart;
create view linechart as
SELECT
  F.Date_ID, F.Time_ID, D.day_name, F.Event_UID,F.Sensor_UID, F.Recipe_UID, F.Sensor_Val
FROM fact_table F, Dim_Date D, Dim_TIME T, Dim_Sensor S, Dim_Event E
WHERE F.Date_ID = D.Date_actual
	AND D.date_actual between date '2019-01-01' and date '2019-01-07'
	--AND D.day_name = 'Wednesday'
	AND T.Time_ID = F.Time_ID
	AND T.Time_ID between time '00:00:00' and time '12:00:00'
	AND S.ID = F.Sensor_UID  
	AND S.ID in (1,2,3,4) 
	AND E.ID = F.Event_UID 
	AND E.ID in (1,2)
	;
------------------------------------------
--Assume a case where two dimensions are selected (date and sensor) and one measure (sensor_val)
--At a given time on the chart one dimension will be ploted only. Which will be toggled by 
--rollup and drill down and only one of the query will run. 
--Similarly, Multiple measures can be selected. 
------------------------------------------
--Line chart with one dimension (Sensor) and one measure(Sensor_val)	
select sensor_UID, round(avg(lc.sensor_val),2) 
from
linechart lc
group by sensor_UID;

--Line chart with the other selected dimensions (date) and one measure(Sensor_val)	
select date_id, round(avg(lc.sensor_val),2) 
from
linechart lc
group by date_id;
