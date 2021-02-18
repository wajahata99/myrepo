/*
Base Case:
•Four dimensions(Date,Time,Sensor,Event) are selected
•Recipe dimension is not selected but its fields will be filtered out accordingly.
Note: RecipeID are being generated randomly so the effect of filtering might not be visible initially in filtering of the dimension tables.

*/

-- First Filter Selected of date range and day
drop materialized view if exists q1 cascade;
create materialized view q1 as

SELECT F.DateID, F.TimeID, D.day_name, F.EventUID,F.SensorUID, F.RecipeUID, F.SensorVal
  FROM FactTable F, DimDate D, DimTIME T, DimSensor S, DimEvent E
  WHERE F.DateID = D.Date_actual
  	    AND D.date_actual between date '2019-01-01' and date '2019-01-07'
		AND D.day_name = 'Wednesday'
        AND T.TimeID = F.TimeID
		--AND T.TimeID between time '00:00:00' and time '12:00:00' 
        AND S.ID = F.SensorUID  
		--AND S.ID in (1,2,3) 
        AND E.ID = F.EventUID 
		--AND E.ID in (1,2,3)
		;
		
select * from q1;
--------------------------------------------
--Updating Dimension tables based on filters applied

drop materialized view if exists fltrd_event; 
create materialized view fltrd_event as
select Distinct EventID from DimEvent
where DimEvent.ID in (select distinct EventUID from q1);
select * from fltrd_event;

drop materialized view if exists fltrd_recipe; 
create materialized view fltrd_recipe as
select distinct RecipeID from DimRecipe
where DimRecipe.ID in (select distinct RecipeUID from q1);
select * from fltrd_recipe;

drop materialized view if exists fltrd_sensor; 
create materialized view fltrd_sensor as
select distinct sensorID from DimSensor
where DimSensor.ID in (select distinct sensorUID from q1);
select * from fltrd_sensor;
------------------------------------------------------
-- First Filter Selected of date range and day
-- Second Filter applied for Sensor
drop materialized view if exists q1 cascade;
create materialized view q1 as

SELECT F.DateID, F.TimeID, D.day_name, F.EventUID,F.SensorUID, F.RecipeUID, F.SensorVal
  FROM FactTable F, DimDate D, DimTIME T, DimSensor S, DimEvent E
  WHERE F.DateID = D.Date_actual
  	    AND D.date_actual between date '2019-01-01' and date '2019-01-07'
		AND D.day_name = 'Wednesday'
        AND T.TimeID = F.TimeID
		--AND T.TimeID between time '00:00:00' and time '12:00:00' 
        AND S.ID = F.SensorUID  
		AND S.ID in (1,2,3) 
        AND E.ID = F.EventUID 
		--AND E.ID in (1,2,3)
		;
		
select * from q1;
--------------------------------------------
--Updating Dimension tables based on filters applied

drop materialized view if exists fltrd_event; 
create materialized view fltrd_event as
select Distinct EventID from DimEvent
where DimEvent.ID in (select distinct EventUID from q1);
select * from fltrd_event;

drop materialized view if exists fltrd_recipe; 
create materialized view fltrd_recipe as
select distinct RecipeID from DimRecipe
where DimRecipe.ID in (select distinct RecipeUID from q1);
select * from fltrd_recipe;

drop materialized view if exists fltrd_sensor; 
create materialized view fltrd_sensor as
select distinct sensorID from DimSensor
where DimSensor.ID in (select distinct sensorUID from q1);
select * from fltrd_sensor;
------------------------------------------------------
------------------------------------------------------
-- First Filter Selected of date range and day
-- Second Filter applied for SensorID
-- Third Filter applied for eventID
drop materialized view if exists q1 cascade;
create materialized view q1 as

SELECT F.DateID, F.TimeID, D.day_name, F.EventUID,F.SensorUID, F.RecipeUID, F.SensorVal
  FROM FactTable F, DimDate D, DimTIME T, DimSensor S, DimEvent E
  WHERE F.DateID = D.Date_actual
  	    AND D.date_actual between date '2019-01-01' and date '2019-01-07'
		AND D.day_name = 'Wednesday'
        AND T.TimeID = F.TimeID
		--AND T.TimeID between time '00:00:00' and time '12:00:00' 
        AND S.ID = F.SensorUID  
		AND S.ID in (1,2,3) 
        AND E.ID = F.EventUID 
		AND E.ID in (1,2,3)
		;
		
select * from q1;
--------------------------------------------
--Updating Dimension tables based on filters applied

drop materialized view if exists fltrd_event; 
create materialized view fltrd_event as
select Distinct EventID from DimEvent
where DimEvent.ID in (select distinct EventUID from q1);
select * from fltrd_event;

drop materialized view if exists fltrd_recipe; 
create materialized view fltrd_recipe as
select distinct RecipeID from DimRecipe
where DimRecipe.ID in (select distinct RecipeUID from q1);
select * from fltrd_recipe;

drop materialized view if exists fltrd_sensor; 
create materialized view fltrd_sensor as
select distinct sensorID from DimSensor
where DimSensor.ID in (select distinct sensorUID from q1);
select * from fltrd_sensor;
------------------------------------------------------
------------------------------------------------------
-- First Filter Selected of date range and day
-- Second Filter applied for SensorID
-- Third Filter applied for eventID
-- Fourth Filter applied for Time range
drop materialized view if exists q1 cascade;
create materialized view q1 as

SELECT F.DateID, F.TimeID, D.day_name, F.EventUID,F.SensorUID, F.RecipeUID, F.SensorVal
  FROM FactTable F, DimDate D, DimTIME T, DimSensor S, DimEvent E
  WHERE F.DateID = D.Date_actual
  	    AND D.date_actual between date '2019-01-01' and date '2019-01-07'
		AND D.day_name = 'Wednesday'
        AND T.TimeID = F.TimeID
		AND T.TimeID between time '00:00:00' and time '12:00:00' 
        AND S.ID = F.SensorUID  
		AND S.ID in (1,2,3) 
        AND E.ID = F.EventUID 
		AND E.ID in (1,2,3)
		;
		
select * from q1;
--------------------------------------------
--Updating Dimension tables based on filters applied

drop materialized view if exists fltrd_event; 
create materialized view fltrd_event as
select Distinct EventID from DimEvent
where DimEvent.ID in (select distinct EventUID from q1);
select * from fltrd_event;

drop materialized view if exists fltrd_recipe; 
create materialized view fltrd_recipe as
select distinct RecipeID from DimRecipe
where DimRecipe.ID in (select distinct RecipeUID from q1);
select * from fltrd_recipe;

drop materialized view if exists fltrd_sensor; 
create materialized view fltrd_sensor as
select distinct sensorID from DimSensor
where DimSensor.ID in (select distinct sensorUID from q1);
select * from fltrd_sensor;
------------------------------------------------------

