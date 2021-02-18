EXPLAIN
SELECT
  F.Date_ID, F.Time_ID, D.day_name, F.Event_UID,F.Sensor_UID, F.Recipe_UID, F.Sensor_Val
FROM fact_table F, Dim_Date D, Dim_TIME T, Dim_Sensor S, Dim_Event E
WHERE F.Date_ID = D.Date_actual
	AND D.date_actual between date '2019-01-01' and date '2019-01-07'
	AND D.day_name = 'Wednesday'
	AND T.Time_ID = F.Time_ID
	AND T.Time_ID between time '00:00:00' and time '12:00:00'
	AND S.ID = F.Sensor_UID  
	AND S.ID in (1,2,3,4) 
	AND E.ID = F.Event_UID 
	AND E.ID in (1,2,3,4)
	;
		
EXPLAIN		
select F.Date_ID, F.Time_ID, Sub_DD.day_name, F.Event_UID, F.Sensor_UID, F.Recipe_UID, F.Sensor_Val
from (Select DE.ID from Dim_Event DE
	  Where DE.ID in (1,2,3,4)) as sub_DE 
join fact_table F
on Sub_DE.ID=F.Event_UID

join (Select DS.ID from Dim_Sensor DS 
	  Where DS.ID in (1,2,3,4)) as sub_DS
on Sub_DS.ID=F.Sensor_UID

join (Select DD.date_actual,DD.day_name from Dim_Date DD 
	  Where DD.date_actual between date '2019-01-01' and date '2019-01-07'
	  and DD.day_name = 'Wednesday') as sub_DD	  
on Sub_DD.date_actual = F.Date_ID

join (Select DT.Time_ID from Dim_Time DT 
	  Where DT.Time_ID between time '00:00:00' and time '12:00:00') as sub_DT
on Sub_DT.Time_ID=F.Time_ID;
