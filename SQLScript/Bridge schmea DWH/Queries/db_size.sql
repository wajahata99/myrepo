SELECT pg_size_pretty( pg_total_relation_size('dim_date') );

SELECT pg_size_pretty( pg_database_size('year_bulk_data') );

SELECT pg_size_pretty( pg_database_size('kpi_db') );

SELECT COUNT(*) FROM load_testing_month_bulk_data.second_fact;

-------------------------
    
SELECT *, pg_size_pretty(total_bytes) AS total
    , pg_size_pretty(index_bytes) AS index
    , pg_size_pretty(toast_bytes) AS toast
    , pg_size_pretty(table_bytes) AS table
  FROM (
  SELECT *, total_bytes-index_bytes-coalesce(toast_bytes,0) AS table_bytes FROM (
      SELECT c.oid,nspname AS table_schema, relname AS table_name
              , c.reltuples AS row_estimate
              , pg_total_relation_size(c.oid) AS total_bytes
              , pg_indexes_size(c.oid) AS index_bytes
              , pg_total_relation_size(reltoastrelid) AS toast_bytes
          FROM pg_class c
          LEFT JOIN pg_namespace n ON n.oid = c.relnamespace
          WHERE relkind = 'r'
  ) a
) a;
-------------------------

select
    sum(pg_column_size(value_mean)) as total_size,
    avg(pg_column_size(value_mean)) as average_size,
    sum(pg_column_size(value_mean)) * 100.0 / pg_relation_size('second_fact') as percentage
from second_fact;

