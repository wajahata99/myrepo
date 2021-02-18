drop view if exists aggregate_stage;
create view aggregate_stage as
SELECT
      F.Date_ID, F.Time_ID, D.day_name, F.Event_UID,F.Sensor_UID, F.Recipe_UID, F.Sensor_Val
   FROM fact_table F, Dim_Date D, Dim_TIME T, Dim_Sensor S, Dim_Event E
   WHERE F.Date_ID = D.Date_actual
		AND D.date_actual between date '2019-01-01' and date '2019-01-07'
		AND D.day_name = 'Wednesday'
		AND T.Time_ID = F.Time_ID
		AND T.Time_ID between time '00:00:00' and time '12:00:00'
		AND S.ID = F.Sensor_UID  
		AND S.ID in (1,3) 
        AND E.ID = F.Event_UID 
		AND E.ID in (1,2)
		;

SELECT
   AA.Date_ID, AA.Time_ID, AA.day_name, AA.Event_UID,AA.Sensor_UID, AA.Recipe_UID,sum(AA.Sensor_Val) 
FROM
    Aggregate_stage AA
GROUP BY 
    ROLLUP (AA.Date_ID, AA.Time_ID, AA.day_name, AA.Event_UID,AA.Sensor_UID, AA.Recipe_UID);