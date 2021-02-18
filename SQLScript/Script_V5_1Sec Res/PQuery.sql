drop function if exists BIFilter cascade;
CREATE FUNCTION BIFilter (var1 int,var2 int,var3 int) 
   RETURNS 
   TABLE (
	  DateID date,TimeID time,DayName varchar,Event_UID int, Sensor_UID int, Recipe_UID int, SensorVal numeric) 
AS $$
BEGIN 
   
   RETURN QUERY
   
   SELECT
      F.Date_ID, F.Time_ID, D.day_name, F.Event_UID,F.Sensor_UID, F.Recipe_UID, F.Sensor_Val
   FROM fact_table F, Dim_Date D, Dim_TIME T, Dim_Sensor S, Dim_Event E
   WHERE F.Date_ID = D.Date_actual
		AND D.date_actual between date '2019-01-01' and date '2019-01-07'
		AND D.day_name = 'Wednesday'
		AND T.Time_ID = F.Time_ID
		AND T.Time_ID between time '00:00:00' and time '12:00:00'
		AND S.ID = F.Sensor_UID  
		AND S.ID in (var1,var3) 
        AND E.ID = F.Event_UID 
		AND E.ID in (var1,var2)
		;
		
END; $$ 
LANGUAGE 'plpgsql';


--------------------------------------------
Drop Function if exists DimUpdate cascade;
CREATE OR REPLACE FUNCTION DimUpdate(q1 text)
    RETURNS void 
	AS $$
BEGIN

drop materialized view if exists fltrd_event; 
create materialized view fltrd_event as
select Distinct Event_ID from Dim_Event
where Dim_Event.ID in (select distinct q1.Event_UID from q1);

drop materialized view if exists fltrd_recipe; 
create materialized view fltrd_recipe as
select distinct Recipe_ID from Dim_Recipe
where Dim_Recipe.ID in (select distinct q1.Recipe_UID from q1);

drop materialized view if exists fltrd_sensor; 
create materialized view fltrd_sensor as
select distinct sensor_ID from Dim_Sensor
where Dim_Sensor.ID in (select distinct q1.sensor_UID from q1);

END;
$$ LANGUAGE plpgsql;
----------------------------------------
----------------------------------------
----------------------------------------
drop materialized view if exists q1 cascade;
create materialized view q1 as
select * from BIFilter (1,3,10);
select * from q1;

select DimUpdate('q1');
select * from fltrd_event;
select * from fltrd_recipe;
select * from fltrd_sensor;
----------------------------------------
----------------------------------------
----------------------------------------
-- Group by query--> aggregating on one row and not aggregating on the other row
--> If in a grid one column is not being aggregated and the other columns are being aggregated. 
-- Then non aggregated column moves to the group by--> sensor value is not being aggregated with
-- sum as an aggregate function.

   SELECT
      F.Event_UID, (F.Sensor_UID), sum(F.Sensor_Val)
   FROM fact_table F, Dim_Date D, Dim_TIME T, Dim_Sensor S, Dim_Event E
   WHERE F.Date_ID = D.Date_actual
		AND D.date_actual between date '2019-01-01' and date '2019-01-07'
		--AND D.day_name = 'Wednesday'
		AND T.Time_ID = F.Time_ID
		AND T.Time_ID between time '00:00:00' and time '12:00:00'
		AND S.ID = F.Sensor_UID  
		AND S.ID in (1,2,3) 
        AND E.ID = F.Event_UID 
		AND E.ID in (1,2,3)
	group by F.Event_UID,F.Sensor_UID
		;
----------------------------------------------------------------------
--KPI view query

   SELECT
--      P.proc_seg_id, R.record_type, R.record_category, F.sensor_val  
	  T.five_minutes, round(avg(F.sensor_val),2)  --Five minute grain
   FROM fact_table F, Dim_Date D, Dim_TIME T, Dim_recordtype R, Dim_process_segment P
   WHERE F.Date_ID = D.Date_actual
		AND D.date_actual between date '2019-01-01' and date '2019-01-05'
		AND D.day_name = 'Wednesday'
		AND T.Time_ID = F.Time_ID
		AND R.ID = F.recordtype_UID  
		AND R.record_type = 'subKPI'
		--AND R.record_category in ('Performance','Quality','OEE') 
        AND P.ID = F.process_segment_uid
		AND P.proc_seg_id in ('ProcessSegID1','ProcessSegID2','ProcessSegID3')
		group by T.five_minutes
		;

select record_type,record_category from dim_recordtype;
--where record_type = 'subKPI';		
-----------------------------------------------------------		
--Calculating subKPI from the base grain fact table. 
select (SELECT
      round(avg(F.sensor_val),2)  
   FROM fact_table F, Dim_Date D, Dim_TIME T, Dim_recordtype R, Dim_process_segment P
   WHERE F.Date_ID = D.Date_actual
		AND D.date_actual = date '2019-01-02'
		AND T.Time_ID = F.Time_ID
		AND T.Time_ID between time '00:00:00' and time '00:05:00'
		AND R.ID = F.recordtype_UID  
		AND R.record_type = 'CEPEvent'
		AND R.record_category = 'StateEvent' 
        AND P.ID = F.process_segment_uid
		AND P.proc_seg_id in ('ProcessSegID1'))*
		(SELECT
      round(avg(F.sensor_val),2)  
   FROM fact_table F, Dim_Date D, Dim_TIME T, Dim_recordtype R, Dim_process_segment P
   WHERE F.Date_ID = D.Date_actual
		AND D.date_actual = date '2019-01-02'
		AND T.Time_ID = F.Time_ID
		AND T.Time_ID between time '00:00:00' and time '00:05:00'
		AND R.ID = F.recordtype_UID  
		AND R.record_type = 'CEPEvent'
		AND R.record_category = 'StateEvent' 
        AND P.ID = F.process_segment_uid
		AND P.proc_seg_id in ('ProcessSegID1'));
		
-----------------------