--Aggregate table creation
-- Shrunken Dimension Date: Date dimension will be rolled up to month
-- Aggregate Fact: TableSensor value and sensor ulc will be rolled up

--------------------------------------------
--Date Shrunken dimension creation
drop table if exists sh_date;
create table sh_date(
	id serial primary key,
	day_name varchar(20)
);

INSERT INTO sh_date(day_name)

select day_name
from dim_date
group by day_name;

select * from sh_date;
---------------------------------------------
--Aggregate table creation
drop table if exists agri_1;
create table agri_1(
	sh_date int,
	sensor_val numeric(5,2),
	sensor_ucl numeric(5,2)	
);


---------------------
INSERT INTO agri_1(sh)

SELECT
  round(sum(F.Sensor_Val),2), round(sum(F.Sensor_ucl),2)
FROM fact_table F, Dim_Date D
WHERE F.Date_ID = D.Date_actual
	group by D.day_name
	;






