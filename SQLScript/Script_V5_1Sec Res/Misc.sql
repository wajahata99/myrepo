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
	
---------------------------------------------
Drop Function if exists DimUpdate cascade;
CREATE OR REPLACE FUNCTION DimUpdate(q1 text)
    RETURNS TABLE (fltrdEvent int) AS $$
BEGIN
    RETURN QUERY EXECUTE
        format('select distinct q1.Event_UID from %I',q1);
END;
$$ LANGUAGE plpgsql;

select * from DimUpdate('q1');

select distinct q1.event_uid from q1;
---------------------------------------
Drop Function if exists summing_function cascade;
CREATE OR REPLACE FUNCTION summing_function(q1 text)
    RETURNS TABLE (fltrdEvent int,fltrdSensor int) AS $$
BEGIN
    RETURN QUERY EXECUTE
        format('select distinct q1.Event_UID, q1.Sensor_UID from %I',q1);
END;
$$ LANGUAGE plpgsql;

select * from summing_function('q1');
------------------------------------

INSERT INTO dim_equipment(eqmt_code)
SELECT
  'EquipmentID_'|| (RANDOM() * 10)::INT
  
FROM GENERATE_SERIES(1, 10) seq;

SELECT * FROM dim_equipment;

------------------
select (RANDOM() * 10)::INT;

-------------------------
--Cron loop of a specific KPI
DO
LANGUAGE plpgsql
$$
DECLARE
  stmt text;
BEGIN
  FOR stmt IN
    SELECT kpi_logic_instance FROM kpi_def
  LOOP
    EXECUTE stmt;
  END LOOP;
END;
$$;
----------
--Execute statement
DO
LANGUAGE plpgsql
$$

BEGIN

execute 'select $1 from dim_date'
using '2019-01-01';

END;
$$;


