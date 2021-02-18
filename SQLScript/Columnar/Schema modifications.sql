CREATE TABLE kpi_fact AS 
TABLE second_fact;

select min(date_id) from kpi_fact
select count(*) from kpi_fact
delete from kpi_fact where date_id between '2020-09-15' and '2020-09-23'


ALTER TABLE kpi_fact DROP COLUMN record_count;
ALTER TABLE kpi_fact DROP COLUMN value_units;
ALTER TABLE kpi_fact DROP COLUMN value_string;
ALTER TABLE kpi_fact DROP COLUMN duration_total;
ALTER TABLE kpi_fact DROP COLUMN duration_min;
ALTER TABLE kpi_fact DROP COLUMN duration_mean;
ALTER TABLE kpi_fact DROP COLUMN duration_max;


ALTER TABLE kpi_fact 
RENAME COLUMN value_min TO availability;
update public.kpi_fact
    set availability = floor(random() * 80 + 1)::int;

ALTER TABLE kpi_fact 
RENAME COLUMN value_q1 TO performance;
update public.kpi_fact
    set performance = floor(random() * 80 + 1)::int;

ALTER TABLE kpi_fact 
RENAME COLUMN value_mean TO oee;
update public.kpi_fact
    set oee = floor(random() * 80 + 1)::int;

ALTER TABLE kpi_fact 
RENAME COLUMN value_q3 TO apt;
update public.kpi_fact
    set apt = floor(random() * 80 + 1)::int;
	
ALTER TABLE kpi_fact 
RENAME COLUMN value_max TO quality;
update public.kpi_fact
    set quality = floor(random() * 80 + 1)::int;
	

------------------
CREATE TABLE reason_fact AS 
TABLE kpi_fact;

select * from reason_fact

ALTER TABLE reason_fact 
RENAME COLUMN apt TO reason_fact_1;

ALTER TABLE reason_fact 
RENAME COLUMN quality TO reason_fact_2;
	
select count(*) from reason_fact
delete from reason_fact where date_id between '2020-09-15' and '2020-09-24'
