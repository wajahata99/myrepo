--Use case 1
--Only one measure
------------------------------------
--Questions
--1. Doing aliasing via subquery. What should be the business rule for that.
------------------------------------
SELECT
      F.Date_id, F.equipment_uid, r.record_property_code, round(avg(F.value_mean),2)
   FROM dim_date d, Dim_equipment E, fact_table F, dim_record_type r
   WHERE F.Date_ID = D.Date_actual
		AND D.date_actual between date '2019-01-01' and date '2019-01-03'
		AND r.id = F.record_type_uid
		AND r.record_concept = 'Equipment'
		AND r.record_category = 'DTProperty'
		AND r.record_property_type = 'Temperature'
		AND r.record_property_code in ('OutletTemperature','InletTemperature','ExhaustTemperature')
		AND E.ID = F.Equipment_UID
		AND E.ID = 1
		group by F.Date_id, r.record_property_code, F.equipment_uid
		;

-------------------------
--with don't aggregate measure
-------------------------
SELECT
      F.Date_id, F.equipment_uid, r.record_property_code, F.value_mean
   FROM dim_date d, Dim_equipment E, fact_table F, dim_record_type r
   WHERE F.Date_ID = D.Date_actual
		AND D.date_actual between date '2019-01-01' and date '2019-01-03'
		AND r.id = F.record_type_uid
		AND r.record_concept = 'Equipment'
		AND r.record_category = 'DTProperty'
		AND r.record_property_type = 'Temperature'
		AND r.record_property_code in ('OutletTemperature','InletTemperature','ExhaustTemperature')
		AND E.ID = F.Equipment_UID
		AND E.ID = 1
		;

---------------------------------------
--Use Case 2
-- Different items from the record type dimension have different measures, 
-- i.e. outlet temperature has average measure and inlet temperature has minimum as a measure.
-------------------
-- what querry is doing--> 
--applying two different measures on both temperatures,i.e. selected measur is applied on all columns.
--------------------
SELECT
      F.Date_id, F.equipment_uid, r.record_property_code, round(avg(F.value_mean),2) as "avg", round(min(F.value_mean),2) as "min"
   FROM dim_date d, Dim_equipment E, fact_table F, dim_record_type r
   WHERE F.Date_ID = D.Date_actual
		AND D.date_actual between date '2019-01-01' and date '2019-01-03'
		AND r.id = F.record_type_uid
		AND r.record_concept = 'Equipment'
		AND r.record_category = 'DTProperty'
		AND r.record_property_type = 'Temperature'
		AND r.record_property_code in ('OutletTemperature','InletTemperature')
		AND E.ID = F.Equipment_UID
		AND E.ID = 1
		group by F.Date_id, r.record_property_code, F.equipment_uid
		;

----------------------------------
-- Use Case 3
-- 2 temperatures with different measures and one value is un aggregated

SELECT
      F.Date_id, F.equipment_uid, r.record_property_code, F.value_mean, round(avg(F.value_mean),2) as "avg", round(min(F.value_mean),2) as "min", round(max(F.value_mean),2) as "max"
   FROM dim_date d, Dim_equipment E, fact_table F, dim_record_type r
   WHERE F.Date_ID = D.Date_actual
		AND D.date_actual between date '2019-01-01' and date '2019-01-03'
		AND r.id = F.record_type_uid
		AND r.record_concept = 'Equipment'
		AND r.record_category = 'DTProperty'
		AND r.record_property_type = 'Temperature'
		AND r.record_property_code in ('OutletTemperature','InletTemperature','Exhausttemperature')
		AND E.ID = F.Equipment_UID
		AND E.ID = 1
		group by F.Date_id, r.record_property_code, F.equipment_uid, F.value_mean
		;
		
--General questions
-- What should be the name of record property code column in the grid?