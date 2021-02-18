
--5Min Roll Up
--Loading Aggregated Data from Enriched Tables to the Fact Table

--RM Fact Table without time
drop table if exists Rollup1 cascade;
CREATE TABLE Rollup1(
	Id SERIAL PRIMARY KEY,
	TimeStampIDSensor timestamp,
	TimeStampIDEvent timestamp,
	DateID	date,
	TimeID Time,
	EventID VARCHAR(50),
  	ConditionName VARCHAR(50), --Fact
	SubConditionName VARCHAR(50), --Fact
	EventUserDefinedParameter VARCHAR(50), --Fact
	SensorID VARCHAR(50),
	SensorMin numeric(5,1),
	SensorQ1 numeric(5,1), 
	SensorMed numeric(5,1),
	SensorQ3 numeric(5,1),
	SensorMax numeric(5,1),
	SensorUCL numeric(5,1),
	SensorLCL numeric(5,1),
	SensorSetpoint numeric(15,3), --Fact
	foreign key (DateID) references DimDate (date_actual),
	foreign key (TimeID) references DimTime (TimeID),
--	foreign key (ProcessSegmentID) references DimProcessSegment (ProcessSegmentID),
	foreign key (SensorID) references DimSensor (SensorID),
--	foreign key (EquipmentID) references DimEquipment (EquipmentID),
--	foreign key (MaterialID) references DimMaterial (MaterialID),
--	foreign key (RecipeID) references DimRecipe (RecipeID),
	foreign key (EventID) references DimEvent (EventID)
--	foreign key (LocationID) references DimLocation (LocationID),
--	foreign key (OrderID) references DimOrder (OrderID),
--	foreign key (PersonnelID) references DimPersonnel (PersonnelID)
);

--Staged Sensor
drop table if exists staged_sensor2 cascade;
create table staged_sensor2(
	Id SERIAL PRIMARY KEY,
	TimeStampIDsensor timestamp,
	SensorID VARCHAR(50),
	SensorMin numeric(5,1),
	SensorQ1 numeric(5,1), --Fact numeric(number of digits,precision)
	SensorMed numeric(5,1),
	SensorQ3 numeric(5,1),
	SensorMax numeric(5,1),
	SensorUCL numeric(5,1), 
	SensorLCL numeric(5,1), 
	SensorSetpoint numeric(15,3) --Fact
);

--Staged Events
drop table if exists Staged_events2 cascade;
CREATE TABLE Staged_events2(
	Id SERIAL PRIMARY KEY,
	TimeStampIDevent timestamp,
	EventID VARCHAR(50),--Dim Table not included
  	ConditionName VARCHAR(50), --Fact
	SubConditionName VARCHAR(50), --Fact
	EventUserDefinedParameter VARCHAR(50) --Fact
);

--Roll up and grain alignment
drop function if exists Rollup_15min cascade; 
CREATE FUNCTION Rollup_15min() returns integer AS $$

DECLARE
iterator int;
DateID date;
TimeID time;
TimeStampIDStart timestamp;
TimeStampIDend timestamp;

BEGIN
--initial value
iterator:= 0;
DateID:=date '2019-01-01';
TimeID:=time '00:00:00';
TimeStampIDStart:= timestamp '2019-01-01 00:00:00';
TimeStampIDend:= timestamp '2019-01-01 00:15:00';

while iterator < 9*96 --number of days time 96

LOOP

--Staging sensors
INSERT INTO staged_sensor2(TimeStampIDsensor,sensorID, sensormin, sensorQ1,SensorMed,SensorQ3,SensorMax,sensorucl, sensorlcl, sensorsetpoint)
select
	max(TimeStampIDsensor),
	sensorID,
	min(sensormin),
	round(avg(SensorQ1),2),
	round(avg(SensorMed),2),
	round(avg(SensorQ3),2),
	max(sensorMax),
	round(avg(sensorucl),2),
	round(avg(sensorlcl),2),
	round(avg(sensorsetpoint),2)
	
from ResourceMonitoring1
where TimeStampIDSensor
between TimeStampIDStart 
and TimeStampIDend
group by sensorID;

--staged events
INSERT INTO staged_events2(TimeStampIDevent, EventID, ConditionName, SubConditionName,EventUserDefinedParameter)
select max(TimeStampIDevent),EventID,count(ConditionName), count(SubConditionName),count(EventUserDefinedParameter)
from ResourceMonitoring1
where TimeStampIDEvent
between TimeStampIDStart 
and TimeStampIDend
group by EventID;

--Creating joined view
drop view if exists staged_joined2 cascade;
create view staged_joined2 as

select ss.timestampIDsensor,se.TimeStampIDevent,ss.sensorID,se.EventID,se.ConditionName,se.SubConditionName,
								se.EventUserDefinedParameter, ss.sensormin,ss.sensorQ1,ss.sensormed,ss.sensorQ3,ss.sensormax,
								ss.sensorucl, ss.sensorlcl,ss.sensorsetpoint
from staged_sensor2 ss full join staged_events2 se
on ss.id=se.id;

INSERT INTO Rollup1(DateID,TimeID,TimestampIDSensor,TimeStampIDEvent,sensorID,EventID,ConditionName,SubConditionName,
								EventUserDefinedParameter, sensormin, sensorQ1,SensorMed,SensorQ3,SensorMax, sensorucl, sensorlcl, sensorsetpoint)

select DateID,TimeID,TimestampIDSensor,TimeStampIDEvent,sensorID,EventID,ConditionName,SubConditionName,
								EventUserDefinedParameter, sensormin, sensorQ1,SensorMed,SensorQ3,SensorMax, sensorucl, sensorlcl, sensorsetpoint

from staged_joined2;

--Reseting the staged tables id because join is being carried out at the ID
delete from staged_sensor2;
ALTER SEQUENCE staged_sensor2_id_seq RESTART WITH 1;

delete from staged_events2;
ALTER SEQUENCE staged_events2_id_seq RESTART WITH 1;

--Updates

iterator := iterator + 1;
TimeStampIDStart := TimeStampIDStart +interval '900 second';
TimeStampIDend := TimeStampIDEnd + interval '900 second';
TimeID := TimeID +interval '900 second';
DateID := date '2019-01-01' + iterator*interval '900 second';

END LOOP;
RETURN 1;
END; $$

LANGUAGE PLPGSQL;

drop index if exists idx_Rollup1;
CREATE INDEX idx_Rollup1 ON Rollup1(DateID, TimeID,EventID, SensorID);

select Rollup_15min();

select * from Rollup1;

