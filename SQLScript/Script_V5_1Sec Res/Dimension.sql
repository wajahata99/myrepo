/*
DROP SCHEMA public CASCADE;
CREATE SCHEMA public;
*/

SET search_path TO public; -- Update with your desired schema

DROP TABLE if exists dim_date cascade;

CREATE TABLE dim_date
(
  dateid    	           INT NOT NULL,-- in use
  date_actual              DATE NOT NULL,-- in use
  epoch                    BIGINT NOT NULL,-- in use
  day_suffix               VARCHAR(4) NOT NULL,
  day_name                 VARCHAR(9) NOT NULL,
  day_of_week              INT NOT NULL,
  day_of_month             INT NOT NULL,
  day_of_quarter           INT NOT NULL,
  day_of_year              INT NOT NULL,
  week_of_month            INT NOT NULL,
  week_of_year             INT NOT NULL,
  week_of_year_iso         CHAR(10) NOT NULL,
  month_actual             INT NOT NULL,
  month_name               VARCHAR(9) NOT NULL,
  month_name_abbreviated   CHAR(3) NOT NULL,
  quarter_actual           INT NOT NULL,
  quarter_name             VARCHAR(9) NOT NULL,
  year_actual              INT NOT NULL,
  first_day_of_week        DATE NOT NULL,
  last_day_of_week         DATE NOT NULL,
  first_day_of_month       DATE NOT NULL,
  last_day_of_month        DATE NOT NULL,
  first_day_of_quarter     DATE NOT NULL,
  last_day_of_quarter      DATE NOT NULL,
  first_day_of_year        DATE NOT NULL,
  last_day_of_year         DATE NOT NULL,
  mmyyyy                   CHAR(6) NOT NULL,
  mmddyyyy                 CHAR(10) NOT NULL,
  weekend_indr             BOOLEAN NOT NULL
);

--ALTER TABLE public.DimDate ADD CONSTRAINT dimdate_dim_id_pk PRIMARY KEY (dateid);
ALTER TABLE dim_date ADD CONSTRAINT dimdate_dim_id_pk1 PRIMARY KEY (date_actual);

CREATE INDEX dim_date_date_actual_idx
  ON dim_date(date_actual);

INSERT INTO dim_date
SELECT TO_CHAR(datum,'yyyymmdd')::INT AS dateid,
       datum AS date_actual,
       EXTRACT(epoch FROM datum) AS epoch,
       TO_CHAR(datum,'fmDDth') AS day_suffix,
       TO_CHAR(datum,'Day') AS day_name,
       EXTRACT(isodow FROM datum) AS day_of_week,
       EXTRACT(DAY FROM datum) AS day_of_month,
       datum - DATE_TRUNC('quarter',datum)::DATE +1 AS day_of_quarter,
       EXTRACT(doy FROM datum) AS day_of_year,
       TO_CHAR(datum,'W')::INT AS week_of_month,
       EXTRACT(week FROM datum) AS week_of_year,
       TO_CHAR(datum,'YYYY"-W"IW-') || EXTRACT(isodow FROM datum) AS week_of_year_iso,
       EXTRACT(MONTH FROM datum) AS month_actual,
       TO_CHAR(datum,'Month') AS month_name,
       TO_CHAR(datum,'Mon') AS month_name_abbreviated,
       EXTRACT(quarter FROM datum) AS quarter_actual,
       CASE
         WHEN EXTRACT(quarter FROM datum) = 1 THEN 'First'
         WHEN EXTRACT(quarter FROM datum) = 2 THEN 'Second'
         WHEN EXTRACT(quarter FROM datum) = 3 THEN 'Third'
         WHEN EXTRACT(quarter FROM datum) = 4 THEN 'Fourth'
       END AS quarter_name,
       EXTRACT(isoyear FROM datum) AS year_actual,
       datum +(1 -EXTRACT(isodow FROM datum))::INT AS first_day_of_week,
       datum +(7 -EXTRACT(isodow FROM datum))::INT AS last_day_of_week,
       datum +(1 -EXTRACT(DAY FROM datum))::INT AS first_day_of_month,
       (DATE_TRUNC('MONTH',datum) +INTERVAL '1 MONTH - 1 day')::DATE AS last_day_of_month,
       DATE_TRUNC('quarter',datum)::DATE AS first_day_of_quarter,
       (DATE_TRUNC('quarter',datum) +INTERVAL '3 MONTH - 1 day')::DATE AS last_day_of_quarter,
       TO_DATE(EXTRACT(isoyear FROM datum) || '-01-01','YYYY-MM-DD') AS first_day_of_year,
       TO_DATE(EXTRACT(isoyear FROM datum) || '-12-31','YYYY-MM-DD') AS last_day_of_year,
       TO_CHAR(datum,'mmyyyy') AS mmyyyy,
       TO_CHAR(datum,'mmddyyyy') AS mmddyyyy,
       CASE
         WHEN EXTRACT(isodow FROM datum) IN (6,7) THEN TRUE
         ELSE FALSE
       END AS weekend_indr
FROM (SELECT '2000-01-01'::DATE+ SEQUENCE.DAY AS datum
      FROM GENERATE_SERIES (0,7304) AS SEQUENCE (DAY)
      GROUP BY SEQUENCE.DAY) DQ
ORDER BY 1;

select * from dim_date;
-----------------------------------------------------------------------------------------------------
--Dim Time
-------------------
--Time Dimension has the value at the start of time interval. For hour column
--starts with the 00:00:00 and stays the same for one hour.
-------------------
drop table if exists dim_time cascade;
create table dim_time(
	time_id time primary key,
	five_minutes time,
	quarter_hour time,
	hour_id time,
	shift int
);

drop function if exists fill_time cascade;
CREATE FUNCTION fill_time() returns integer AS $$

DECLARE
iterator int:=0;
time_id time := time '00:00:00';
five_minutes time := time '00:00:00';
quarter_hour time :=time '00:00:00';
hour_id time := time '00:00:00';
shift_id int := 0;

BEGIN
while iterator < 86400
LOOP
time_id := time '00:00' + iterator*interval '1 second';

IF iterator%300 = 0 THEN
   five_minutes := time '00:00' + iterator*interval '1 second';
END IF;

IF iterator%900 = 0 THEN
   quarter_hour := time '00:00' + iterator*interval '1 second';
END IF;

IF iterator%3600 = 0 THEN
   hour_id := time '00:00' + iterator*interval '1 second';
END IF;

IF iterator%28800 = 0 THEN
   shift_id := shift_id+1;
END IF;

iterator := iterator + 1;

INSERT INTO dim_time(time_id, five_minutes, quarter_hour, hour_id, shift)
values (time_id, five_minutes, quarter_hour,hour_id, shift_id);

END LOOP;
RETURN 1;
END; $$
LANGUAGE PLPGSQL;

select fill_time();

select* from dim_time;

-------------------------------------------------------------------------------------------------------
--Porcess Seg
drop table if exists dim_process_segment cascade;
CREATE TABLE dim_process_segment(
	id SERIAL PRIMARY KEY,
    process_segment_code varchar(20),
	process_segment_name varchar(20),
	process_segment_prnt_compo_l1 varchar(20),
	process_segment_prnt_cls_l11 varchar(20),
	process_segment_prnt_cls_l12 varchar(20),
	process_segment_prnt_cls_l13 varchar(20),
	process_segment_prnt_cls_l14 varchar(20),
	process_segment_prnt_compo_l2 varchar(20),
	process_segment_prnt_cls_l21 varchar(20),
	process_segment_prnt_cls_l22 varchar(20),
	process_segment_prnt_cls_l23 varchar(20),
	process_segment_prnt_cls_l24 varchar(20),
	process_segment_prnt_compo_l3 varchar(20),
	process_segment_prnt_cls_l31 varchar(20),
	process_segment_prnt_cls_l32 varchar(20),
	process_segment_prnt_cls_l33 varchar(20),
	process_segment_prnt_cls_l34 varchar(20),
	process_segment_prnt_compo_l4 varchar(20),
	process_segment_prnt_cls_l41 varchar(20),
	process_segment_prnt_cls_l42 varchar(20),
	process_segment_prnt_cls_l43 varchar(20),
	process_segment_prnt_cls_l44 varchar(20),
	process_segment_type_code varchar(20),
	process_segment_type_name varchar(20),
	process_segment_prnt_cls_l1 varchar(20),
	process_segment_prnt_cls_l2 varchar(20),
	process_segment_prnt_cls_l3 varchar(20),
	process_segment_prnt_cls_l4 varchar(20),
	stream_code varchar(20),
	stream_name varchar(20),
	personnel_segment_specification varchar(20),
	equipment_segment_specification varchar(20),
	material_segment_specification varchar(20),
	personnel_segment_specification_use varchar(20),
	insert_date_time varchar(20),
	last_update_date_time varchar(20),
	date_flag varchar(20),
	user_dimension_fields varchar(20)
);
----------------------------
INSERT INTO dim_process_segment
SELECT
  seq, 
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT
  
FROM GENERATE_SERIES(1, 10) seq;

SELECT * FROM dim_equipment;


------------------------------------------------------------------------------
--Dim Sensor
drop table if exists dim_sensor cascade;
CREATE TABLE dim_sensor(
	id SERIAL PRIMARY KEY,
  	sensor_code varchar(20),
	sensor_name varchar(20),
	sensor_type_parent_class_l1 varchar(20),
	sensor_type_parent_class_l2 varchar(20),
	sensor_type_parent_class_l3 varchar(20),
	sensor_type_parent_class_l4 varchar(20),
	tag_code varchar(20),
	insert_date_time varchar(20),
	last_update_date_time varchar(20),
	date_flag varchar(20),
	user_dimension_fields varchar(20)

);

-------------------------
INSERT INTO dim_sensor
SELECT
  seq, 
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT
  
FROM GENERATE_SERIES(1, 10) seq;

SELECT * FROM dim_sensor;

------------------------------------------------------
--Dim customer dimension
drop table if exists dim_customer cascade;
CREATE TABLE dim_customer(
	id SERIAL PRIMARY KEY,
  	customer_code varchar(20),
	customer_name varchar(20),
	customer_composition_parent_class_l1 varchar(20),
	customer_composition_parent_class_l2 varchar(20),
	customer_type_code varchar(20),
	customer_type_name varchar(20),
	insert_date_time varchar(20),
	last_update_date_time varchar(20),
	date_flag varchar(20),
	user_dimension_fields varchar(20)
);

------------------------------
INSERT INTO dim_customer
SELECT
  seq, 
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT
  
FROM GENERATE_SERIES(1, 10) seq;

SELECT * FROM dim_customer;


-----------------------------------------------------------------------------------
-- Dim-Record Type
drop table if exists dim_record_type cascade;
CREATE TABLE dim_record_type(
	id SERIAL PRIMARY KEY,
    record_concept varchar(50),
	record_category varchar(50),
	record_type varchar(50),
	
	record_property_type varchar(50),
	record_property_code varchar(50),
	record_property_attribute varchar(50),
	record_value varchar(50),
	record_data_type varchar(50));

COPY Dim_record_type
FROM 'D:\SQLScript\Script_V5_1Sec Res\dim-record-type.csv' DELIMITER ',' CSV HEADER;

select * from dim_record_type;

select * from dim_record_type
where record_concept = 'Equipment'
-----------------------------------------------------------------------------------
-- Dim-Equipment
drop table if exists dim_equipment cascade;
CREATE TABLE dim_equipment(
	id SERIAL PRIMARY KEY,
    eqmt_code varchar(20),
	eqmt_name varchar(20),
	eqmt_prnt_compo_l1 varchar(20),
	eqmt_prnt_cls_l11 varchar(20),
	eqmt_prnt_cls_l12 varchar(20),
	eqmt_prnt_cls_l13 varchar(20),
	eqmt_prnt_cls_l14 varchar(20),
	eqmt_prnt_compo_l2 varchar(20),
	eqmt_prnt_cls_l21 varchar(20),
	eqmt_prnt_cls_l22 varchar(20),
	eqmt_prnt_cls_l23 varchar(20),
	eqmt_prnt_cls_l24 varchar(20),
	eqmt_prnt_compo_l3 varchar(20),
	eqmt_prnt_cls_l31 varchar(20),
	eqmt_prnt_cls_l32 varchar(20),
	eqmt_prnt_cls_l33 varchar(20),
	eqmt_prnt_cls_l34 varchar(20),
	eqmt_prnt_compo_l4 varchar(20),
	eqmt_prnt_cls_l41 varchar(20),
	eqmt_prnt_cls_l42 varchar(20),
	eqmt_prnt_cls_l43 varchar(20),
	eqmt_prnt_cls_l44 varchar(20),	
	eqmt_type_code varchar(20),
	eqmt_type_name varchar(20),
	eqmt_prnt_cls_l1 varchar(20),
	eqmt_prnt_cls_l2 varchar(20),
	eqmt_prnt_cls_l3 varchar(20),
	eqmt_prnt_cls_l4 varchar(20),
	eqmt_lvl varchar(20),
	insert_date_time varchar(20),
	last_update_date_time varchar(20),
	date_flag varchar(20),
	user_dimension_fields varchar(20)
	
);
--------------------------
INSERT INTO dim_equipment
SELECT
  seq, 
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT
  
FROM GENERATE_SERIES(1, 10) seq;

SELECT * FROM dim_equipment;

-----------------------------------------------------------------------------------
-- Dim-Material
drop table if exists dim_material cascade;
CREATE TABLE dim_material(
	id SERIAL PRIMARY KEY,
    material_code varchar(20),
	material_name varchar(20),
	material_prnt_compo_l1 varchar(20),
	material_prnt_cls_l11 varchar(20),
	material_prnt_cls_l12 varchar(20),
	material_prnt_cls_l13 varchar(20),
	material_prnt_cls_l14 varchar(20),
	material_prnt_compo_l2 varchar(20),
	material_prnt_cls_l21 varchar(20),
	material_prnt_cls_l22 varchar(20),
	material_prnt_cls_l23 varchar(20),
	material_prnt_cls_l24 varchar(20),
	material_prnt_compo_l3 varchar(20),
	material_prnt_cls_l31 varchar(20),
	material_prnt_cls_l32 varchar(20),
	material_prnt_cls_l33 varchar(20),
	material_prnt_cls_l34 varchar(20),
	material_prnt_compo_l4 varchar(20),
	material_prnt_cls_l41 varchar(20),
	material_prnt_cls_l42 varchar(20),
	material_prnt_cls_l43 varchar(20),
	material_prnt_cls_l44 varchar(20),
	material_type_code varchar(20),
	material_type_name varchar(20),
	material_prnt_cls_l1 varchar(20),
	material_prnt_cls_l2 varchar(20),
	material_prnt_cls_l3 varchar(20),
	material_prnt_cls_l4 varchar(20),
	material_lot_code varchar(20),
	material_lot_name varchar(20),
	material_lot_parent_composition_l1 varchar(20),
	material_parent_definition_l11 varchar(20),
	material_parent_classification_l11 varchar(20),
	material_lot_parent_composition_l2 varchar(20),
	material_parent_definition_l21 varchar(20),
	material_parent_classification_l21 varchar(20),
	insert_date_time varchar(20),
	last_update_date_time varchar(20),
	date_flag varchar(20),
	user_dimension_fields varchar(20)
);

-------------------------------------
INSERT INTO dim_material
SELECT

  seq, 
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT
  
FROM GENERATE_SERIES(1, 10) seq;

select * from dim_material;

-----------------------------------------------------------------------------------
-- DimOperation
drop table if exists dim_operation_def cascade;
CREATE TABLE dim_operation_def(
	id SERIAL  PRIMARY KEY,
    operation_definition_code varchar(20),
	operation_definition_name varchar(20),
	operation_definition_version varchar(20),
	operation_definition_type_code varchar(20),
	operation_definition_type_name varchar(20),
	operation_definition_parent_class_level1 varchar(20),
	operation_segment_code varchar(20),
	operation_segment_name varchar(20),
	operation_segment_parent_composition_level1 varchar(20),
	operation_segment_parent_classification_level1 varchar(20),
	operation_segment_parent_composition_level2 varchar(20),
	operation_segment_parent_classification_level21 varchar(20),
	operation_segment_parent_composition_level3 varchar(20),
	operation_segment_parent_classification_level31 varchar(20),
	operation_segment_parent_composition_level4 varchar(20),
	operation_segment_parent_classification_level41 varchar(20),
	personnel_specification varchar (20),
	equipment_specification varchar (20),
	material_specification varchar (20),
	material_specification_use varchar (20),
	operation_segment_type_code varchar(20),
	operation_segment_type_name varchar(20),
	operation_segment_type_classification_l1 varchar(20),
	operation_bill_of_material_code varchar(20),
	operation_bill_of_material_name varchar(20),
	operation_bill_of_material_item_code varchar(20),
	operation_bill_of_material_item_name varchar(20),
	operation_bill_of_material_item_use varchar(20),
	operation_type varchar(20),
	insert_date_time varchar(20),
	last_update_date_time varchar(20),
	date_flag varchar(20),
	user_dimension_fields varchar(20)	
);

----------------------
INSERT INTO dim_operation_def
SELECT

  seq, 
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT
  
FROM GENERATE_SERIES(1, 10) seq;

select * from dim_operation_def;
-----------------------------------------------------------------------------------
-- DimOperation_request
drop table if exists dim_operation_request cascade;
CREATE TABLE dim_operation_request(
	id SERIAL  PRIMARY KEY,
    operation_request_code varchar(20),
	operation_request_name varchar(20),
	operation_request_parent_code varchar(20),
	operation_request_parent_name varchar(20),
	operation_requirement_code varchar(20),
	operation_requirement_name varchar(20),
	operation_requirement_parent_level1 varchar(20),
	operation_requirement_parent_level2 varchar(20),
	operation_requirement_parent_level3 varchar(20),
	operation_requirement_parent_level4 varchar(20),
	personnel_requirement varchar (20),
	equipment_requirement varchar (20),
	material_requirement varchar (20),
	material_requirement_use varchar (20),
	requirement_bill_of_material_code varchar(20),
	requirement_bill_of_material_name varchar(20),
	requirement_bill_of_material_item_code varchar(20),
	requirement_bill_of_material_item_name varchar(20),
	requirement_bill_of_material_item_use varchar(20),
	insert_date_time varchar(20),
	last_update_date_time varchar(20),
	date_flag varchar(20),
	user_dimension_fields varchar(20)	
);

INSERT INTO dim_operation_request
SELECT

  seq, 
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT
  
FROM GENERATE_SERIES(1, 10) seq;

select * from dim_operation_request;
-----------------------------------------------------------------
-- DimOperation_response
drop table if exists dim_operation_response cascade;
CREATE TABLE dim_operation_response(
	id SERIAL  PRIMARY KEY,
    operation_response_code varchar(20),
	operation_response_name varchar(20),
	segment_response_code varchar(20),
	segment_response_name varchar(20),
	segment_response_parent_level1 varchar(20),
	segment_response_parent_level2 varchar(20),
	segment_response_parent_level3 varchar(20),
	segment_response_parent_level4 varchar(20),
	personnel_actual varchar (20),
	equipment_actual varchar (20),
	material_actual varchar (20),
	material_actual_use varchar (20),
	execution_bill_of_material_code varchar(20),
	execution_bill_of_material_name varchar(20),
	execution_bill_of_material_item_code varchar(20),
	execution_bill_of_material_item_name varchar(20),
	execution_bill_of_material_item_use varchar(20),
	insert_date_time varchar(20),
	last_update_date_time varchar(20),
	date_flag varchar(20),
	user_dimension_fields varchar(20)	
);

----------------------
INSERT INTO dim_operation_response
SELECT

  seq, 
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT
  
FROM GENERATE_SERIES(1, 10) seq;

select * from dim_operation_response;
--------------------------------------------------------------------
-- Dim-Location
drop table if exists dim_location cascade;
CREATE TABLE dim_location(
	id SERIAL PRIMARY KEY,
    Enterprise_name varchar(20),
	Enterprise_type_code varchar(20),
	Enterprise_type_name varchar(20),
	site_code varchar(20),
	sit_name varchar(20),
	site_type_code varchar(20),
	site_type_name varchar(20),
	work_center_code varchar(20),
	work_center_name varchar(20),
	work_center_type_code varchar(20),
	work_center_type_name varchar(20),
	insert_date_time varchar(20),
	last_update_date_time varchar(20),
	date_flag varchar(20),
	user_dimension_fields varchar(20)
	
);

-----------------------------
INSERT INTO dim_location
SELECT

  seq, 
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT
  
FROM GENERATE_SERIES(1, 10) seq;


select * from dim_location;
--------------------------------------------------------------------
-- Dim-Personnel
drop table if exists dim_personnel cascade;
CREATE TABLE dim_personnel(
	id SERIAL PRIMARY KEY,
    personnel_code varchar(20),
	personnel_name varchar(20),
	personnel_type_code varchar(20),
	personnel_type_name varchar(20),
	personnel_parent_classification_level1 varchar(20),
	personnel_parent_classification_level2 varchar(20),
	personnel_parent_classification_level3 varchar(20),
	personnel_parent_classification_level4 varchar(20),
	team_code varchar(20),
	team_name varchar(20),
	team_type_code varchar(20),
	team_parent_classification_level1 varchar(20),
	team_parent_classification_level2 varchar(20),
	team_parent_classification_level3 varchar(20),
	team_parent_classification_level4 varchar(20),
	insert_date_time varchar(20),
	last_update_date_time varchar(20),
	date_flag varchar(20),
	user_dimension_fields varchar(20)
);
----------------------------------
INSERT INTO dim_personnel
SELECT

  seq, 
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT,
  'Instance_ID_'|| (RANDOM() * 10)::INT
  
FROM GENERATE_SERIES(1, 10) seq;

select * from dim_personnel;
--------------------------------------------------------------------
