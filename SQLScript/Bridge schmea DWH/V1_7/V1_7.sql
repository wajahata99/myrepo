-- *************** SqlDBM: PostgreSQL ****************;
-- ***************************************************;
drop schema if exists "starSchemaV1_7" cascade;
create schema "starSchemaV1_7";

set search_path to "starSchemaV1_7";

-- ************************************** "dim_time"
-- *************** SqlDBM: PostgreSQL ****************;
-- ***************************************************;


-- ************************************** "dim_time"

CREATE TABLE IF NOT EXISTS "dim_time"
(
 "time_id"      time NOT NULL,
 "five_minutes" time NULL,
 "quarter_hour" time NULL,
 "hour_id"      time NULL,
 "shift"        integer NULL,
 CONSTRAINT "dim_time_pkey" PRIMARY KEY ( "time_id" )
);






-- ************************************** "dim_sensor"

CREATE TABLE IF NOT EXISTS "dim_sensor"
(
 "id"                    serial NOT NULL,
 "sensor_type_code"      text NULL,
 "sensor_type_name"      text NULL,
 "sensor_code"           text NULL,
 "sensor_name"           text NULL,
 "tag_code"              text NULL,
 "tag_name"              text NULL,
 "insert_date_time"      timestamp NULL,
 "last_update_date_time" timestamp NULL,
 "delete_flag"           boolean NULL,
 CONSTRAINT "dim_sensor_pkey" PRIMARY KEY ( "id" )
);








-- ************************************** "dim_property_definition"

CREATE TABLE IF NOT EXISTS "dim_property_definition"
(
 "id"                       serial NOT NULL,
 "concept_dimension_source" text NULL,
 "property_concept"         text NULL,
 "property_type"            text NULL,
 "property_code"            text NULL,
 "property_name"            text NULL,
 "attribute"                text NULL,
 "value"                    text NULL,
 "value_type"               text NULL,
 "insert_date_time"         timestamp NULL,
 "last_update_date_time"    timestamp NULL,
 "delete_flag"              boolean NULL,
 CONSTRAINT "PK_dim_property_definition" PRIMARY KEY ( "id" )
);








-- ************************************** "dim_process_segment"

CREATE TABLE IF NOT EXISTS "dim_process_segment"
(
 "id"                                   serial NOT NULL,
 "process_segment_code"                 text NULL,
 "process_segment_name"                 text NULL,
 "operation_type"                       text NULL,
 "process_segment_type_code"            text NULL,
 "process_segment_type_name"            text NULL,
 "stream_code"                          text NULL,
 "stream_name"                          text NULL,
 "personnel_segment_specification_code" text NULL,
 "personnel_segment_specification_name" text NULL,
 "equipment_segment_specification_code" text NULL,
 "equipment_segment_specification_name" text NULL,
 "material_segment_specification_code"  text NULL,
 "material_segment_specification_name"  text NULL,
 "personnel_segment_specification_use"  text NULL,
 "insert_date_time"                     timestamp NULL,
 "last_update_date_time"                timestamp NULL,
 "delete_flag"                          boolean NULL,
 CONSTRAINT "dim_process_segment_pkey" PRIMARY KEY ( "id" )
);








-- ************************************** "dim_personnel"

CREATE TABLE IF NOT EXISTS "dim_personnel"
(
 "id"                    serial NOT NULL,
 "personnel_code"        text NULL,
 "personnel_name"        text NULL,
 "personnel_type_code"   text NULL,
 "personnel_type_name"   text NULL,
 "team_code"             text NULL,
 "team_name"             text NULL,
 "team_type_code"        text NULL,
 "team_type_name"        text NULL,
 "insert_date_time"      timestamp NULL,
 "last_update_date_time" timestamp NULL,
 "delete_flag"           boolean NULL,
 CONSTRAINT "dim_personnel_pkey" PRIMARY KEY ( "id" )
);








-- ************************************** "dim_operation_response"

CREATE TABLE IF NOT EXISTS "dim_operation_response"
(
 "id"                                   serial NOT NULL,
 "operation_response_code"              text NULL,
 "operation_response_name"              text NULL,
 "segment_response_code"                text NULL,
 "segment_response_name"                text NULL,
 "personnel_actual_code"                varchar(20) NULL,
 "personnel_actual_name"                varchar(20) NULL,
 "equipment_actual_code"                varchar(20) NULL,
 "equipment_actual_name"                varchar(20) NULL,
 "material_actual_code"                 varchar(20) NULL,
 "material_actual_name"                 varchar(20) NULL,
 "material_actual_use"                  varchar(20) NULL,
 "execution_bill_of_material_code"      text NULL,
 "execution_bill_of_material_name"      text NULL,
 "execution_bill_of_material_item_code" text NULL,
 "execution_bill_of_material_item_name" text NULL,
 "execution_bill_of_material_item_use"  text NULL,
 "insert_date_time"                     timestamp NULL,
 "last_update_date_time"                timestamp NULL,
 "delete_flag"                          boolean NULL,
 CONSTRAINT "dim_operation_response_pkey" PRIMARY KEY ( "id" )
);








-- ************************************** "dim_operation_request"

CREATE TABLE IF NOT EXISTS "dim_operation_request"
(
 "id"                                     serial NOT NULL,
 "operation_request_code"                 text NULL,
 "operation_request_name"                 text NULL,
 "segment_requirement_code"               text NULL,
 "segment_requirement_name"               text NULL,
 "personnel_requirement_code"             varchar(20) NULL,
 "personnel_requirement_name"             varchar(20) NULL,
 "equipment_requirement_code"             varchar(20) NULL,
 "equipment_requirement_name"             varchar(20) NULL,
 "material_requirement_code"              varchar(20) NULL,
 "material_requirement_name"              varchar(20) NULL,
 "material_requirement_use"               varchar(20) NULL,
 "requirement_bill_of_material_code"      text NULL,
 "requirement_bill_of_material_name"      text NULL,
 "requirement_bill_of_material_item_code" text NULL,
 "requirement_bill_of_material_item_name" text NULL,
 "requirement_bill_of_material_item_use"  text NULL,
 "insert_date_time"                       timestamp NULL,
 "last_update_date_time"                  timestamp NULL,
 "delete_flag"                            boolean NULL,
 CONSTRAINT "dim_operation_request_pkey" PRIMARY KEY ( "id" )
);








-- ************************************** "dim_operation_definition"

CREATE TABLE IF NOT EXISTS "dim_operation_definition"
(
 "id"                                   serial NOT NULL,
 "operation_definition_code"            text NULL,
 "operation_definition_name"            text NULL,
 "operation_definition_version"         text NULL,
 "operations_type_definition"           text NULL,
 "operations_type_segment"              varchar(20) NULL,
 "operation_segment_code"               text NULL,
 "operation_segment_name"               text NULL,
 "operation_definition_type_code"       text NULL,
 "operation_definition_type_name"       text NULL,
 "operation_segment_type_code"          text NULL,
 "operation_segment_type_name"          text NULL,
 "personnel_specification_code"         varchar(20) NULL,
 "personnel_specification_name"         varchar(20) NULL,
 "equipment_specification_code"         varchar(20) NULL,
 "equipment_specification_name"         varchar(20) NULL,
 "material_specification_code"          varchar(20) NULL,
 "material_specification_name"          varchar(20) NULL,
 "material_specification_use"           varchar(20) NULL,
 "operation_bill_of_material_code"      text NULL,
 "operation_bill_of_material_name"      text NULL,
 "operation_bill_of_material_item_code" text NULL,
 "operation_bill_of_material_item_name" text NULL,
 "operation_bill_of_material_item_use"  text NULL,
 "insert_date_time"                     timestamp NULL,
 "last_update_date_time"                timestamp NULL,
 "delete_flag"                          boolean NULL,
 CONSTRAINT "dim_operation_definition_pkey" PRIMARY KEY ( "id" )
);








-- ************************************** "dim_material"

CREATE TABLE IF NOT EXISTS "dim_material"
(
 "id"                    serial NOT NULL,
 "material_code"         text NULL,
 "material_name"         text NULL,
 "material_type_code"    text NULL,
 "material_type_name"    text NULL,
 "material_lot_code"     text NULL,
 "material_lot_name"     text NULL,
 "material_sub_lot_code" text NULL,
 "material_sub_lot_name" text NULL,
 "insert_date_time"      timestamp NULL,
 "last_update_date_time" timestamp NULL,
 "delete_flag"           boolean NULL,
 CONSTRAINT "dim_material_pkey" PRIMARY KEY ( "id" )
);








-- ************************************** "dim_location"

CREATE TABLE IF NOT EXISTS "dim_location"
(
 "id"                    serial NOT NULL,
 "location_code"         text NULL,
 "location_name"         text NULL,
 "location_type_code"    text NULL,
 "location_type_name"    text NULL,
 "location_level"        text NULL,
 "insert_date_time"      timestamp NULL,
 "last_update_date_time" timestamp NULL,
 "delete_flag"           boolean NULL,
 CONSTRAINT "dim_location_pkey" PRIMARY KEY ( "id" )
);








-- ************************************** "dim_kpi"

CREATE TABLE IF NOT EXISTS "dim_kpi"
(
 "id"                       serial NOT NULL,
 "concept_dimension_source" text NULL,
 "kpi_concept"              text NULL,
 "kpi_category"             text NULL,
 "kpi_type_code"            text NULL,
 "kpi_type_name"            text NULL,
 "insert_date_time"         timestamp NULL,
 "last_update_date_time"    timestamp NULL,
 "delete_flag"              boolean NOT NULL,
 CONSTRAINT "PK_dim_kpi" PRIMARY KEY ( "id" )
);








-- ************************************** "dim_event"

CREATE TABLE IF NOT EXISTS "dim_event"
(
 "id"                       serial NOT NULL,
 "concept_dimension_source" text NULL,
 "event_concept"            text NULL,
 "abstract_event_type_code" text NULL,
 "abstract_event_type_name" text NULL,
 "concrete_event_type_code" text NULL,
 "concrete_event_type_name" text NULL,
 "insert_date_time"         timestamp NULL,
 "last_update_date_time"    timestamp NULL,
 "delete_flag"              boolean NULL,
 CONSTRAINT "PK_dim_event" PRIMARY KEY ( "id" )
);









-- ************************************** "dim_equipment"

CREATE TABLE IF NOT EXISTS "dim_equipment"
(
 "id"                    serial NOT NULL,
 "equipment_code"        text NULL,
 "equipment_name"        text NULL,
 "equipment_level"       text NULL,
 "equipment_type_code"   text NULL,
 "equipment_type_name"   text NULL,
 "insert_date_time"      timestamp NULL,
 "last_update_date_time" timestamp NULL,
 "delete_flag"           boolean NULL,
 CONSTRAINT "dim_equipment_pkey" PRIMARY KEY ( "id" )
);








-- ************************************** "dim_date"

CREATE TABLE IF NOT EXISTS "dim_date"
(
 "dateid"                 integer NOT NULL,
 "date_actual"            date NOT NULL,
 "epoch"                  bigint NOT NULL,
 "day_suffix"             varchar(4) NOT NULL,
 "day_name"               varchar(9) NOT NULL,
 "day_of_week"            integer NOT NULL,
 "day_of_month"           integer NOT NULL,
 "day_of_quarter"         integer NOT NULL,
 "day_of_year"            integer NOT NULL,
 "week_of_month"          integer NOT NULL,
 "week_of_year"           integer NOT NULL,
 "week_of_year_iso"       char(10) NOT NULL,
 "month_actual"           integer NOT NULL,
 "month_name"             varchar(9) NOT NULL,
 "month_name_abbreviated" char(3) NOT NULL,
 "quarter_actual"         integer NOT NULL,
 "quarter_name"           varchar(9) NOT NULL,
 "year_actual"            integer NOT NULL,
 "first_day_of_week"      date NOT NULL,
 "last_day_of_week"       date NOT NULL,
 "first_day_of_month"     date NOT NULL,
 "last_day_of_month"      date NOT NULL,
 "first_day_of_quarter"   date NOT NULL,
 "last_day_of_quarter"    date NOT NULL,
 "first_day_of_year"      date NOT NULL,
 "last_day_of_year"       date NOT NULL,
 "mmyyyy"                 char(6) NOT NULL,
 "mmddyyyy"               char(10) NOT NULL,
 "weekend_indr"           boolean NOT NULL,
 CONSTRAINT "dimdate_dim_id_pk1" PRIMARY KEY ( "date_actual" )
);








-- ************************************** "dim_customer"

CREATE TABLE IF NOT EXISTS "dim_customer"
(
 "id"                    serial NOT NULL,
 "customer_code"         text NULL,
 "customer_name"         text NULL,
 "customer_type_code"    text NULL,
 "customer_type_name"    text NULL,
 "insert_date_time"      timestamp NULL,
 "last_update_date_time" timestamp NULL,
 "delete_flag"           boolean NULL,
 CONSTRAINT "dim_customer_pkey" PRIMARY KEY ( "id" )
);








-- ************************************** "team_type_classification_bridge"

CREATE TABLE IF NOT EXISTS "team_type_classification_bridge"
(
 "id"                    serial NOT NULL,
 "parent_id"             integer NOT NULL,
 "child_id"              integer NOT NULL,
 "level"                 numeric NOT NULL,
 "top_flag"              boolean NOT NULL,
 "bottom_flag"           boolean NOT NULL,
 "insert_date_time"      timestamp NOT NULL,
 "last_update_date_time" timestamp NULL,
 "delete_flag"           boolean NOT NULL,
 CONSTRAINT "team_type_classification_dimension_bridge_pkey" PRIMARY KEY ( "id" ),
 CONSTRAINT "child_team_type_classification" FOREIGN KEY ( "child_id" ) REFERENCES "dim_personnel" ( "id" ),
 CONSTRAINT "parent_team_type_classification" FOREIGN KEY ( "parent_id" ) REFERENCES "dim_personnel" ( "id" )
);








-- ************************************** "sensor_type_classification_bridge"

CREATE TABLE IF NOT EXISTS "sensor_type_classification_bridge"
(
 "id"                    serial NOT NULL,
 "parent_id"             integer NOT NULL,
 "child_id"              integer NOT NULL,
 "level"                 numeric NOT NULL,
 "top_flag"              boolean NOT NULL,
 "bottom_flag"           boolean NOT NULL,
 "insert_date_time"      timestamp NOT NULL,
 "last_update_date_time" timestamp NULL,
 "delete_flag"           boolean NOT NULL,
 CONSTRAINT "PK_sensor_type_classification_bridge" PRIMARY KEY ( "id" ),
 CONSTRAINT "child_sensor_type_classification" FOREIGN KEY ( "child_id" ) REFERENCES "dim_sensor" ( "id" ),
 CONSTRAINT "parent_sensor_type_classification" FOREIGN KEY ( "parent_id" ) REFERENCES "dim_sensor" ( "id" )
);








-- ************************************** "segment_response_composition_bridge"

CREATE TABLE IF NOT EXISTS "segment_response_composition_bridge"
(
 "id"                    serial NOT NULL,
 "parent_id"             integer NOT NULL,
 "child_id"              integer NOT NULL,
 "level"                 numeric NOT NULL,
 "top_flag"              boolean NOT NULL,
 "bottom_flag"           boolean NOT NULL,
 "insert_date_time"      timestamp NOT NULL,
 "last_update_date_time" timestamp NULL,
 "delete_flag"           boolean NOT NULL,
 CONSTRAINT "segment_response_composition_dimension_bridge_pkey" PRIMARY KEY ( "id" ),
 CONSTRAINT "child_segment_response_composition" FOREIGN KEY ( "child_id" ) REFERENCES "dim_operation_response" ( "id" ),
 CONSTRAINT "parent_segment_response_composition" FOREIGN KEY ( "parent_id" ) REFERENCES "dim_operation_response" ( "id" )
);








-- ************************************** "segment_requirement_composition_bridge"

CREATE TABLE IF NOT EXISTS "segment_requirement_composition_bridge"
(
 "id"                    serial NOT NULL,
 "parent_id"             integer NOT NULL,
 "child_id"              integer NOT NULL,
 "level"                 numeric NOT NULL,
 "top_flag"              boolean NOT NULL,
 "bottom_flag"           boolean NOT NULL,
 "insert_date_time"      timestamp NOT NULL,
 "last_update_date_time" timestamp NULL,
 "delete_flag"           boolean NOT NULL,
 CONSTRAINT "segment_requirement_composition_dimension_bridge_pkey" PRIMARY KEY ( "id" ),
 CONSTRAINT "child_segment_requirement_composition" FOREIGN KEY ( "child_id" ) REFERENCES "dim_operation_request" ( "id" ),
 CONSTRAINT "parent_segment_requirement_composition" FOREIGN KEY ( "parent_id" ) REFERENCES "dim_operation_request" ( "id" )
);








-- ************************************** "process_segment_type_composition_bridge"

CREATE TABLE IF NOT EXISTS "process_segment_type_composition_bridge"
(
 "id"                    serial NOT NULL,
 "parent_id"             integer NOT NULL,
 "child_id"              integer NOT NULL,
 "level"                 numeric NOT NULL,
 "top_flag"              boolean NOT NULL,
 "bottom_flag"           boolean NOT NULL,
 "insert_date_time"      timestamp NOT NULL,
 "last_update_date_time" timestamp NULL,
 "delete_flag"           boolean NOT NULL,
 CONSTRAINT "process_segment_type_composition_dimension_bridge_pkey" PRIMARY KEY ( "id" ),
 CONSTRAINT "child_process_segment_type_composition" FOREIGN KEY ( "child_id" ) REFERENCES "dim_process_segment" ( "id" ),
 CONSTRAINT "parent_process_segment_type_composition" FOREIGN KEY ( "parent_id" ) REFERENCES "dim_process_segment" ( "id" )
);








-- ************************************** "process_segment_composition_bridge"

CREATE TABLE IF NOT EXISTS "process_segment_composition_bridge"
(
 "id"                    serial NOT NULL,
 "parent_id"             integer NOT NULL,
 "child_id"              integer NOT NULL,
 "level"                 numeric NOT NULL,
 "top_flag"              boolean NOT NULL,
 "bottom_flag"           boolean NOT NULL,
 "insert_date_time"      timestamp NOT NULL,
 "last_update_date_time" timestamp NULL,
 "delete_flag"           boolean NOT NULL,
 CONSTRAINT "process_segment_composition_dimension_bridge_pkey" PRIMARY KEY ( "id" ),
 CONSTRAINT "child_process_segment_composition" FOREIGN KEY ( "child_id" ) REFERENCES "dim_process_segment" ( "id" ),
 CONSTRAINT "parent_process_segment_composition" FOREIGN KEY ( "parent_id" ) REFERENCES "dim_process_segment" ( "id" )
);








-- ************************************** "personnel_type_classification_bridge"

CREATE TABLE IF NOT EXISTS "personnel_type_classification_bridge"
(
 "id"                    serial NOT NULL,
 "parent_id"             integer NOT NULL,
 "child_id"              integer NOT NULL,
 "level"                 numeric NOT NULL,
 "top_flag"              boolean NOT NULL,
 "bottom_flag"           boolean NOT NULL,
 "insert_date_time"      timestamp NOT NULL,
 "last_update_date_time" timestamp NULL,
 "delete_flag"           boolean NOT NULL,
 CONSTRAINT "personnel_type_classification_dimension_bridge_pkey" PRIMARY KEY ( "id" ),
 CONSTRAINT "child_personnel_type_classification" FOREIGN KEY ( "child_id" ) REFERENCES "dim_personnel" ( "id" ),
 CONSTRAINT "parent_personnel_type_classification" FOREIGN KEY ( "parent_id" ) REFERENCES "dim_personnel" ( "id" )
);








-- ************************************** "operation_segment_type_bridge"

CREATE TABLE IF NOT EXISTS "operation_segment_type_bridge"
(
 "id"                    serial NOT NULL,
 "parent_id"             integer NOT NULL,
 "child_id"              integer NOT NULL,
 "level"                 numeric NOT NULL,
 "top_flag"              boolean NOT NULL,
 "bottom_flag"           boolean NOT NULL,
 "insert_date_time"      timestamp NOT NULL,
 "last_update_date_time" timestamp NULL,
 "delete_flag"           boolean NOT NULL,
 CONSTRAINT "operation_segment_type_classification_dimension_bridge_pkey" PRIMARY KEY ( "id" ),
 CONSTRAINT "child_os_type" FOREIGN KEY ( "child_id" ) REFERENCES "dim_operation_definition" ( "id" ),
 CONSTRAINT "parent_os_type" FOREIGN KEY ( "parent_id" ) REFERENCES "dim_operation_definition" ( "id" )
);








-- ************************************** "operation_segment_composition_bridge"

CREATE TABLE IF NOT EXISTS "operation_segment_composition_bridge"
(
 "id"                    serial NOT NULL,
 "parent_id"             integer NOT NULL,
 "child_id"              integer NOT NULL,
 "level"                 numeric NOT NULL,
 "top_flag"              boolean NOT NULL,
 "bottom_flag"           boolean NOT NULL,
 "insert_date_time"      timestamp NOT NULL,
 "last_update_date_time" timestamp NULL,
 "delete_flag"           boolean NOT NULL,
 CONSTRAINT "operation_segment_type_composition_dimension_bridge_pkey" PRIMARY KEY ( "id" ),
 CONSTRAINT "child_os" FOREIGN KEY ( "child_id" ) REFERENCES "dim_operation_definition" ( "id" ),
 CONSTRAINT "parent_operation_segment" FOREIGN KEY ( "parent_id" ) REFERENCES "dim_operation_definition" ( "id" )
);








-- ************************************** "operation_request_composition_bridge"

CREATE TABLE IF NOT EXISTS "operation_request_composition_bridge"
(
 "id"                    serial NOT NULL,
 "parent_id"             integer NOT NULL,
 "child_id"              integer NOT NULL,
 "level"                 numeric NOT NULL,
 "top_flag"              boolean NOT NULL,
 "bottom_flag"           boolean NOT NULL,
 "insert_date_time"      timestamp NOT NULL,
 "last_update_date_time" timestamp NULL,
 "delete_flag"           boolean NOT NULL,
 CONSTRAINT "operation_request_composition_dimension_bridge_pkey" PRIMARY KEY ( "id" ),
 CONSTRAINT "child_operation_request_composition" FOREIGN KEY ( "child_id" ) REFERENCES "dim_operation_request" ( "id" ),
 CONSTRAINT "parent_operation_request_composition" FOREIGN KEY ( "parent_id" ) REFERENCES "dim_operation_request" ( "id" )
);








-- ************************************** "operation_definition_type_classification_bridge"

CREATE TABLE IF NOT EXISTS "operation_definition_type_classification_bridge"
(
 "id"                    serial NOT NULL,
 "parent_id"             integer NOT NULL,
 "child_id"              integer NOT NULL,
 "level"                 numeric NOT NULL,
 "top_flag"              boolean NOT NULL,
 "bottom_flag"           boolean NOT NULL,
 "insert_date_time"      timestamp NOT NULL,
 "last_update_date_time" timestamp NULL,
 "delete_flag"           boolean NOT NULL,
 CONSTRAINT "operation_definition_type_classification_bridge_pkey" PRIMARY KEY ( "id" ),
 CONSTRAINT "child_operation_definition_type_classificaiton" FOREIGN KEY ( "child_id" ) REFERENCES "dim_operation_definition" ( "id" ),
 CONSTRAINT "parent_operation_definition_type_classification" FOREIGN KEY ( "parent_id" ) REFERENCES "dim_operation_definition" ( "id" )
);








-- ************************************** "material_sublot_bridge"

CREATE TABLE IF NOT EXISTS "material_sublot_bridge"
(
 "id"                    serial NOT NULL,
 "parent_id"             integer NOT NULL,
 "child_id"              integer NOT NULL,
 "level"                 numeric NOT NULL,
 "top_flag"              boolean NOT NULL,
 "bottom_flag"           boolean NOT NULL,
 "insert_date_time"      timestamp NOT NULL,
 "last_update_date_time" timestamp NULL,
 "delete_flag"           boolean NOT NULL,
 CONSTRAINT "material_sublot_dimension_bridge_pkey" PRIMARY KEY ( "id" ),
 CONSTRAINT "child_material_sublot" FOREIGN KEY ( "child_id" ) REFERENCES "dim_material" ( "id" ),
 CONSTRAINT "parent_material_sublot" FOREIGN KEY ( "parent_id" ) REFERENCES "dim_material" ( "id" )
);








-- ************************************** "material_lot_bridge"

CREATE TABLE IF NOT EXISTS "material_lot_bridge"
(
 "id"                    serial NOT NULL,
 "parent_id"             integer NOT NULL,
 "child_id"              integer NOT NULL,
 "level"                 numeric NOT NULL,
 "top_flag"              boolean NOT NULL,
 "bottom_flag"           boolean NOT NULL,
 "insert_date_time"      timestamp NOT NULL,
 "last_update_date_time" timestamp NULL,
 "delete_flag"           boolean NOT NULL,
 CONSTRAINT "material_lot_dimension_bridge_pkey" PRIMARY KEY ( "id" ),
 CONSTRAINT "child_material_lot" FOREIGN KEY ( "child_id" ) REFERENCES "dim_material" ( "id" ),
 CONSTRAINT "parent_material_lot" FOREIGN KEY ( "parent_id" ) REFERENCES "dim_material" ( "id" )
);








-- ************************************** "material_definition_bridge"

CREATE TABLE IF NOT EXISTS "material_definition_bridge"
(
 "id"                    serial NOT NULL,
 "parent_id"             integer NOT NULL,
 "child_id"              integer NOT NULL,
 "level"                 numeric NOT NULL,
 "top_flag"              boolean NOT NULL,
 "bottom_flag"           boolean NOT NULL,
 "insert_date_time"      timestamp NOT NULL,
 "last_update_date_time" timestamp NULL,
 "delete_flag"           boolean NOT NULL,
 CONSTRAINT "material_definition_dimension_bridge_pkey" PRIMARY KEY ( "id" ),
 CONSTRAINT "child_material_definition" FOREIGN KEY ( "child_id" ) REFERENCES "dim_material" ( "id" ),
 CONSTRAINT "parent_material_definition" FOREIGN KEY ( "parent_id" ) REFERENCES "dim_material" ( "id" )
);








-- ************************************** "material_class_bridge"

CREATE TABLE IF NOT EXISTS "material_class_bridge"
(
 "id"                    serial NOT NULL,
 "parent_id"             integer NOT NULL,
 "child_id"              integer NOT NULL,
 "level"                 numeric NOT NULL,
 "top_flag"              boolean NOT NULL,
 "bottom_flag"           boolean NOT NULL,
 "insert_date_time"      timestamp NOT NULL,
 "last_update_date_time" timestamp NULL,
 "delete_flag"           boolean NOT NULL,
 CONSTRAINT "material_class_dimension_bridge_pkey" PRIMARY KEY ( "id" ),
 CONSTRAINT "child_material_class" FOREIGN KEY ( "child_id" ) REFERENCES "dim_material" ( "id" ),
 CONSTRAINT "parent_material_class" FOREIGN KEY ( "parent_id" ) REFERENCES "dim_material" ( "id" )
);








-- ************************************** "location_type_classification_bridge"

CREATE TABLE IF NOT EXISTS "location_type_classification_bridge"
(
 "id"                    serial NOT NULL,
 "parent_id"             integer NOT NULL,
 "child_id"              integer NOT NULL,
 "level"                 numeric NOT NULL,
 "top_flag"              boolean NOT NULL,
 "bottom_flag"           boolean NOT NULL,
 "insert_date_time"      timestamp NOT NULL,
 "last_update_date_time" timestamp NULL,
 "delete_flag"           boolean NOT NULL,
 CONSTRAINT "location_type_bridge_pkey" PRIMARY KEY ( "id" ),
 CONSTRAINT "child_location_type" FOREIGN KEY ( "child_id" ) REFERENCES "dim_location" ( "id" ),
 CONSTRAINT "parent_location_type" FOREIGN KEY ( "parent_id" ) REFERENCES "dim_location" ( "id" )
);








-- ************************************** "location_entity_bridge"

CREATE TABLE IF NOT EXISTS "location_entity_bridge"
(
 "id"                    serial NOT NULL,
 "parent_id"             integer NOT NULL,
 "child_id"              integer NOT NULL,
 "level"                 numeric NOT NULL,
 "top_flag"              boolean NOT NULL,
 "bottom_flag"           boolean NOT NULL,
 "insert_date_time"      timestamp NOT NULL,
 "last_update_date_time" timestamp NULL,
 "delete_flag"           boolean NOT NULL,
 CONSTRAINT "location_entity_bridge_pkey" PRIMARY KEY ( "id" ),
 CONSTRAINT "child_location" FOREIGN KEY ( "child_id" ) REFERENCES "dim_location" ( "id" ),
 CONSTRAINT "parent_location" FOREIGN KEY ( "parent_id" ) REFERENCES "dim_location" ( "id" )
);








-- ************************************** "fact_table"

CREATE TABLE IF NOT EXISTS "fact_table"
(
 "date_id"                 date NOT NULL,
 "time_id"                 time NOT NULL,
 "location_id"             integer NOT NULL,
 "personnel_id"            integer NOT NULL,
 "equipment_id"            integer NOT NULL,
 "material_id"             integer NOT NULL,
 "process_segment_id"      integer NOT NULL,
 "operation_definition_id" integer NOT NULL,
 "operation_request_id"    integer NOT NULL,
 "operation_response_id"   integer NOT NULL,
 "sensor_id"               integer NOT NULL,
 "customer_id"             integer NOT NULL,
 "event_id"                integer NOT NULL,
 "kpi_id"                  integer NOT NULL,
 "record_count"            numeric(6,2) NULL,
 "value_min"               numeric(6,2) NULL,
 "value_q1"                numeric(6,2) NULL,
 "value_mean"              numeric(6,2) NULL,
 "value_q3"                numeric(6,2) NULL,
 "value_max"               numeric(6,2) NULL,
 "value_total"             numeric(6,2) NULL,
 "value_units"             text NULL,
 "value_string"            text NULL,
 "duration_min"            numeric(6,2) NULL,
 "duration_mean"           numeric(6,2) NULL,
 "duration_max"            numeric(6,2) NULL,
 "duration_total"          numeric(6,2) NULL,
 "duration_units"          numeric(20) NULL,
 "property_definition_id"  integer NOT NULL,
 CONSTRAINT "PK_fact_table" PRIMARY KEY ( "date_id", "time_id", "location_id", "personnel_id", "equipment_id", "material_id", "process_segment_id", "operation_definition_id", "operation_request_id", "operation_response_id", "sensor_id", "customer_id", "event_id", "kpi_id", "property_definition_id" ),
 CONSTRAINT "fact_table_customer_id_fkey" FOREIGN KEY ( "customer_id" ) REFERENCES "dim_customer" ( "id" ),
 CONSTRAINT "fact_table_date_id_fkey" FOREIGN KEY ( "date_id" ) REFERENCES "dim_date" ( "date_actual" ),
 CONSTRAINT "fact_table_equipment_id_fkey" FOREIGN KEY ( "equipment_id" ) REFERENCES "dim_equipment" ( "id" ),
 CONSTRAINT "fact_table_event_id_fkey" FOREIGN KEY ( "event_id" ) REFERENCES "dim_event" ( "id" ),
 CONSTRAINT "fact_table_kpi_id" FOREIGN KEY ( "kpi_id" ) REFERENCES "dim_kpi" ( "id" ),
 CONSTRAINT "fact_table_location_id_fkey" FOREIGN KEY ( "location_id" ) REFERENCES "dim_location" ( "id" ),
 CONSTRAINT "fact_table_material_id_fkey" FOREIGN KEY ( "material_id" ) REFERENCES "dim_material" ( "id" ),
 CONSTRAINT "fact_table_operation_definition_id_fkey" FOREIGN KEY ( "operation_definition_id" ) REFERENCES "dim_operation_definition" ( "id" ),
 CONSTRAINT "fact_table_operation_request_id_fkey" FOREIGN KEY ( "operation_request_id" ) REFERENCES "dim_operation_request" ( "id" ),
 CONSTRAINT "fact_table_operation_response_id_fkey" FOREIGN KEY ( "operation_response_id" ) REFERENCES "dim_operation_response" ( "id" ),
 CONSTRAINT "fact_table_personnel_id_fkey" FOREIGN KEY ( "personnel_id" ) REFERENCES "dim_personnel" ( "id" ),
 CONSTRAINT "fact_table_process_segment_id_fkey" FOREIGN KEY ( "process_segment_id" ) REFERENCES "dim_process_segment" ( "id" ),
 CONSTRAINT "fact_table_property_definition_id" FOREIGN KEY ( "property_definition_id" ) REFERENCES "dim_property_definition" ( "id" ),
 CONSTRAINT "fact_table_sensor_id_fkey" FOREIGN KEY ( "sensor_id" ) REFERENCES "dim_sensor" ( "id" ),
 CONSTRAINT "fact_table_time_id_fkey" FOREIGN KEY ( "time_id" ) REFERENCES "dim_time" ( "time_id" )
);








-- ************************************** "equipment_type_classification_bridge"

CREATE TABLE IF NOT EXISTS "equipment_type_classification_bridge"
(
 "id"                    serial NOT NULL,
 "parent_id"             integer NOT NULL,
 "child_id"              integer NOT NULL,
 "level"                 numeric NOT NULL,
 "top_flag"              boolean NOT NULL,
 "bottom_flag"           boolean NOT NULL,
 "insert_date_time"      timestamp NOT NULL,
 "last_update_date_time" timestamp NULL,
 "delete_flag"           boolean NOT NULL,
 CONSTRAINT "equipment_type_classification_dimension_bridge_pkey" PRIMARY KEY ( "id" ),
 CONSTRAINT "child_equipment_type_classification" FOREIGN KEY ( "child_id" ) REFERENCES "dim_equipment" ( "id" ),
 CONSTRAINT "parent_equipment_type_classification" FOREIGN KEY ( "parent_id" ) REFERENCES "dim_equipment" ( "id" )
);








-- ************************************** "equipment_composition_bridge"

CREATE TABLE IF NOT EXISTS "equipment_composition_bridge"
(
 "id"                    serial NOT NULL,
 "parent_id"             integer NOT NULL,
 "child_id"              integer NOT NULL,
 "level"                 numeric NOT NULL,
 "top_flag"              boolean NOT NULL,
 "bottom_flag"           boolean NOT NULL,
 "insert_date_time"      timestamp NOT NULL,
 "last_update_date_time" timestamp NULL,
 "delete_flag"           boolean NOT NULL,
 CONSTRAINT "equipment_composition_dimension_bridge_pkey" PRIMARY KEY ( "id" ),
 CONSTRAINT "child_equipment_composition" FOREIGN KEY ( "child_id" ) REFERENCES "dim_equipment" ( "id" ),
 CONSTRAINT "parent_equipment_composition" FOREIGN KEY ( "parent_id" ) REFERENCES "dim_equipment" ( "id" )
);








-- ************************************** "customer_type_bridge"

CREATE TABLE IF NOT EXISTS "customer_type_bridge"
(
 "id"                    serial NOT NULL,
 "parent_id"             integer NOT NULL,
 "child_id"              integer NOT NULL,
 "level"                 numeric NOT NULL,
 "top_flag"              boolean NOT NULL,
 "bottom_flag"           boolean NOT NULL,
 "insert_date_time"      timestamp NOT NULL,
 "last_update_date_time" timestamp NULL,
 "delete_flag"           boolean NOT NULL,
 CONSTRAINT "parent_customer_dimension_bridge_pkey" PRIMARY KEY ( "id" ),
 CONSTRAINT "child_customer_type" FOREIGN KEY ( "child_id" ) REFERENCES "dim_customer" ( "id" ),
 CONSTRAINT "parent_customer_type" FOREIGN KEY ( "parent_id" ) REFERENCES "dim_customer" ( "id" )
);


















--
--Date dimension data
--

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










--
-- Data for Name: dim_equipment; Type: TABLE DATA; Schema: starSchemaV1_5; Owner: postgres
--

INSERT INTO dim_equipment VALUES (1, NULL, NULL, 'equipment_unit', 'motor', 'Motor', NULL, NULL, NULL);
INSERT INTO dim_equipment VALUES (2, NULL, NULL, 'equipment_unit', 'ac_motor', 'AC Motor', NULL, NULL, NULL);
INSERT INTO dim_equipment VALUES (3, NULL, NULL, 'equipment_unit', 'dc_motor', 'DC Motor', NULL, NULL, NULL);
INSERT INTO dim_equipment VALUES (4, NULL, NULL, 'equipment_unit', 'ac_commutator_motor', 'AC Commutator Motor', NULL, NULL, NULL);
INSERT INTO dim_equipment VALUES (5, NULL, NULL, 'equipment_unit', 'induction_motor', 'Induction Motor', NULL, NULL, NULL);
INSERT INTO dim_equipment VALUES (6, NULL, NULL, 'equipment_unit', 'three_phase_induction_motor', 'Three Phase Induction Motor', NULL, NULL, NULL);
INSERT INTO dim_equipment VALUES (7, NULL, NULL, 'equipment_unit', 'mixing_machine', 'Mixing Machine', NULL, NULL, NULL);
INSERT INTO dim_equipment VALUES (8, NULL, NULL, 'equipment_unit', 'pressing_machine', 'Pressing Machine', NULL, NULL, NULL);
INSERT INTO dim_equipment VALUES (9, NULL, NULL, 'equipment_unit', 'drying_machine', 'Drying Machine', NULL, NULL, NULL);
INSERT INTO dim_equipment VALUES (10, NULL, NULL, 'equipment_unit', 'finishing_machine', 'Finishing Machine', NULL, NULL, NULL);
INSERT INTO dim_equipment VALUES (11, NULL, NULL, 'equipment_unit', 'slitter_machine', 'Slitter Machine', NULL, NULL, NULL);
INSERT INTO dim_equipment VALUES (12, 'mixer_101', 'Mixer 101', 'equipment_unit', 'mixing_machine', 'Mixing Machine', NULL, NULL, NULL);
INSERT INTO dim_equipment VALUES (13, 'pressing_machine_101', 'Pressing Machine 101', 'equipment_unit', 'pressing_machine', 'Pressing Machine', NULL, NULL, NULL);
INSERT INTO dim_equipment VALUES (14, 'drying_machine_101', 'Drying Machine 101', 'equipment_unit', 'drying_machine', 'Drying Machine', NULL, NULL, NULL);
INSERT INTO dim_equipment VALUES (15, 'finishing_machine_101', 'Finishing Machine 101', 'equipment_unit', 'finishing_machine', 'Finishing Machine', NULL, NULL, NULL);
INSERT INTO dim_equipment VALUES (16, 'slitter_machine_101', 'Slitter Machine 101', 'equipment_unit', 'slitter_machine', 'Slitter Machine', NULL, NULL, NULL);


--
-- Data for Name: dim_location; Type: TABLE DATA; Schema: starSchemaV1_5; Owner: postgres
--



--
-- Data for Name: dim_material; Type: TABLE DATA; Schema: starSchemaV1_5; Owner: postgres
--

INSERT INTO dim_material VALUES (1, NULL, NULL, 'virgin_tissue', 'Virgin Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (2, NULL, NULL, 'mix_tissue', 'Mix Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (3, NULL, NULL, 'recycled_tissue', 'Recycled Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (4, NULL, NULL, 'virgin_pulp', 'Virgin Pulp', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (5, NULL, NULL, 'non_virgin_pulp', 'Non Virgin Pulp', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (6, 'facial_ultrasoft_13.5', 'FACIAL 13.5 g(Ultra Soft)', 'virgin_tissue', 'Virgin Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (7, 'n_fold_virgin_32', 'N - Fold 32 g(Virgin) ', 'virgin_tissue', 'Virgin Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (8, 'facial_13.5', 'FACIAL 13.5 gsm', 'virgin_tissue', 'Virgin Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (9, 'napkin_2_ply_16', 'Napkin 2-Ply 16 gsm', 'virgin_tissue', 'Virgin Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (10, 'whie_slim_facial_15', 'Whie Slim Facial 15 gsm', 'virgin_tissue', 'Virgin Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (11, 'toilet_15', 'TOILET 15 gsm', 'mix_tissue', 'Mix Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (12, 'paper_towel', 'Paper Towel  24 gsm', 'mix_tissue', 'Mix Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (13, 'white_party_pack_2ply_22', 'White Party Pack (2ply) 22 g', 'mix_tissue', 'Mix Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (14, 'white_tulip_toilet_22', 'WHITE Tulip Toilet 22 gsm', 'recycled_tissue', 'Recycled Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (15, 'party_pack_20', 'Party Pack  20 gsm', 'recycled_tissue', 'Recycled Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (16, 'double_horse_25', 'Double Horse 25 gsm', 'recycled_tissue', 'Recycled Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (17, 'jumbo_roll_25', 'Jumbo Roll  25 gsm', 'recycled_tissue', 'Recycled Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (18, 'n_fold_rtp_32', 'N - Fold 32 g(RTP) ', 'recycled_tissue', 'Recycled Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (19, 'toilet_htensile_15_2750', 'TOILET 15 g(H-Tensile)2750', 'virgin_tissue', 'Virgin Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (20, 'facial_htensile_13.5', 'FACIAL 13.5 g(H-Tensile)', 'virgin_tissue', 'Virgin Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (21, 'white_napkin_1ply_22', 'White Napkin (1ply) 22 g', 'recycled_tissue', 'Recycled Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (22, '1ply_napkin_20', '1ply-Napkin 20 gsm', 'recycled_tissue', 'Recycled Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (23, '1ply_napkin_25_rtp', '1ply-Napkin (RTP) 25 gsm', 'recycled_tissue', 'Recycled Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (24, 'paper_towel_htensile_24_2740', 'Paper Towel 24 g(H-Tensile)2740', 'mix_tissue', 'Mix Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (25, 'double_horse_20', 'Double Horse 20 gsm', 'recycled_tissue', 'Recycled Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (26, 'n_fold_19', 'N - Fold 19 gsm', 'recycled_tissue', 'Recycled Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (27, 'soft_wood', 'Soft Wood', 'virgin_pulp', 'Virgin Pulp', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (28, 'hard_wood', 'Hard Wood', 'virgin_pulp', 'Virgin Pulp', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (29, 'bctmp', 'BCTMP', 'non_virgin_pulp', 'Non Virgin Pulp', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (30, 'paper_plates_trims', 'PAPER PLATES/TRIMS', 'non_virgin_pulp', 'Non Virgin Pulp', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (31, 'bbc', 'BBC', 'non_virgin_pulp', 'Non Virgin Pulp', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (32, 'duplex_board', 'Duplex board(Blower cuttings)', 'non_virgin_pulp', 'Non Virgin Pulp', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (33, 'facial_ultrasoft_13.5_jumbo', 'FACIAL 13.5 g(Ultra Soft) Jumbo Reel', 'virgin_tissue', 'Virgin Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (34, 'n_fold_virgin_32_jumbo', 'N - Fold 32 g(Virgin)  Jumbo Reel', 'virgin_tissue', 'Virgin Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (35, 'facial_13.5_jumbo', 'FACIAL 13.5 gsm Jumbo Reel', 'virgin_tissue', 'Virgin Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (36, 'napkin_2_ply_16_jumbo', 'Napkin 2-Ply 16 gsm Jumbo Reel', 'virgin_tissue', 'Virgin Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (37, 'whie_slim_facial_15_jumbo', 'Whie Slim Facial 15 gsm Jumbo Reel', 'virgin_tissue', 'Virgin Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (38, 'toilet_15_jumbo', 'TOILET 15 gsm Jumbo Reel', 'mix_tissue', 'Mix Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (39, 'paper_towel_jumbo', 'Paper Towel  24 gsm Jumbo Reel', 'mix_tissue', 'Mix Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (40, 'white_party_pack_2ply_22_jumbo', 'White Party Pack (2ply) 22 g Jumbo Reel', 'mix_tissue', 'Mix Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (41, 'white_tulip_toilet_22_jumbo', 'WHITE Tulip Toilet 22 gsm Jumbo Reel', 'recycled_tissue', 'Recycled Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (42, 'party_pack_20_jumbo', 'Party Pack  20 gsm Jumbo Reel', 'recycled_tissue', 'Recycled Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (43, 'double_horse_25_jumbo', 'Double Horse 25 gsm Jumbo Reel', 'recycled_tissue', 'Recycled Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (44, 'jumbo_roll_25_jumbo', 'Jumbo Roll  25 gsm Jumbo Reel', 'recycled_tissue', 'Recycled Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (45, 'n_fold_rtp_32_jumbo', 'N - Fold 32 g(RTP)  Jumbo Reel', 'recycled_tissue', 'Recycled Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (46, 'toilet_htensile_15_2750_jumbo', 'TOILET 15 g(H-Tensile)2750 Jumbo Reel', 'virgin_tissue', 'Virgin Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (47, 'facial_htensile_13.5_jumbo', 'FACIAL 13.5 g(H-Tensile) Jumbo Reel', 'virgin_tissue', 'Virgin Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (48, 'white_napkin_1ply_22_jumbo', 'White Napkin (1ply) 22 g Jumbo  Reel', 'recycled_tissue', 'Recycled Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (49, '1ply_napkin_20_jumbo', '1ply-Napkin 20 gsm Jumbo Reel', 'recycled_tissue', 'Recycled Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (50, '1ply_napkin_25_rtp_jumbo', '1ply-Napkin (RTP) 25 gsm Jumbo Reel', 'recycled_tissue', 'Recycled Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (51, 'paper_towel_htensile_24_2740_jumbo', 'Paper Towel 24 g(H-Tensile)2740 Jumbo Reel', 'mix_tissue', 'Mix Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (52, 'double_horse_20_jumbo', 'Double Horse 20 gsm Jumbo Reel', 'recycled_tissue', 'Recycled Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_material VALUES (53, 'n_fold_19_jumbo', 'N - Fold 19 gsm Jumbo Reel', 'recycled_tissue', 'Recycled Tissue', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: dim_operation_definition; Type: TABLE DATA; Schema: starSchemaV1_5; Owner: postgres
--

INSERT INTO dim_operation_definition VALUES (1, NULL, NULL, '1', 'Production', NULL, NULL, NULL, 'tissue_manufacturing', 'Tissue Manufacturing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_operation_definition VALUES (2, NULL, NULL, '1', 'Production', 'Production', NULL, NULL, 'tissue_manufacturing', 'Tissue Manufacturing', 'paper_manufacturing', 'Paper Manufacturing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_operation_definition VALUES (3, NULL, NULL, '1', 'Production', 'Inventory', NULL, NULL, 'tissue_manufacturing', 'Tissue Manufacturing', 'warehouse_delivery', 'Warehouse Delivery', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_operation_definition VALUES (4, 'n_fold_virgin_32', 'N - Fold 32 g(Virgin) ', '1', 'Production', NULL, NULL, NULL, 'tissue_manufacturing', 'Tissue Manufacturing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_operation_definition VALUES (5, 'n_fold_virgin_32', 'N - Fold 32 g(Virgin) ', '1', 'Production', 'Production', 'paper_manufacturing_9', 'Paper Manufacturing 9', 'tissue_manufacturing', 'Tissue Manufacturing', 'paper_manufacturing', 'Paper Manufacturing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_operation_definition VALUES (6, 'n_fold_virgin_32', 'N - Fold 32 g(Virgin) ', '1', 'Production', 'Inventory', 'tissue_delivery_pm9', 'Tissue Delivery PM9', 'tissue_manufacturing', 'Tissue Manufacturing', 'warehouse_delivery', 'Warehouse Delivery', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_operation_definition VALUES (7, 'facial_13.5', 'FACIAL 13.5 gsm', '1', 'Production', NULL, NULL, NULL, 'tissue_manufacturing', 'Tissue Manufacturing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_operation_definition VALUES (8, 'napkin_2_ply_16', 'Napkin 2-Ply 16 gsm', '1', 'Production', NULL, NULL, NULL, 'tissue_manufacturing', 'Tissue Manufacturing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_operation_definition VALUES (9, 'whie_slim_facial_15', 'Whie Slim Facial 15 gsm', '1', 'Production', NULL, NULL, NULL, 'tissue_manufacturing', 'Tissue Manufacturing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_operation_definition VALUES (10, 'toilet_15', 'TOILET 15 gsm', '1', 'Production', NULL, NULL, NULL, 'tissue_manufacturing', 'Tissue Manufacturing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_operation_definition VALUES (11, 'paper_towel', 'Paper Towel  24 gsm', '1', 'Production', NULL, NULL, NULL, 'tissue_manufacturing', 'Tissue Manufacturing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_operation_definition VALUES (12, 'white_party_pack_2ply_22', 'White Party Pack (2ply) 22 g', '1', 'Production', NULL, NULL, NULL, 'tissue_manufacturing', 'Tissue Manufacturing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_operation_definition VALUES (13, 'white_tulip_toilet_22', 'WHITE Tulip Toilet 22 gsm', '1', 'Production', NULL, NULL, NULL, 'tissue_manufacturing', 'Tissue Manufacturing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_operation_definition VALUES (14, 'party_pack_20', 'Party Pack  20 gsm', '1', 'Production', NULL, NULL, NULL, 'tissue_manufacturing', 'Tissue Manufacturing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_operation_definition VALUES (15, 'double_horse_25', 'Double Horse 25 gsm', '1', 'Production', NULL, NULL, NULL, 'tissue_manufacturing', 'Tissue Manufacturing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_operation_definition VALUES (16, 'jumbo_roll_25', 'Jumbo Roll  25 gsm', '1', 'Production', NULL, NULL, NULL, 'tissue_manufacturing', 'Tissue Manufacturing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_operation_definition VALUES (17, 'n_fold_rtp_32', 'N - Fold 32 g(RTP) ', '1', 'Production', NULL, NULL, NULL, 'tissue_manufacturing', 'Tissue Manufacturing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_operation_definition VALUES (18, 'toilet_htensile_15_2750', 'TOILET 15 g(H-Tensile)2750', '1', 'Production', NULL, NULL, NULL, 'tissue_manufacturing', 'Tissue Manufacturing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_operation_definition VALUES (19, 'facial_htensile_13.5', 'FACIAL 13.5 g(H-Tensile)', '1', 'Production', NULL, NULL, NULL, 'tissue_manufacturing', 'Tissue Manufacturing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_operation_definition VALUES (20, 'white_napkin_1ply_22', 'White Napkin (1ply) 22 g', '1', 'Production', NULL, NULL, NULL, 'tissue_manufacturing', 'Tissue Manufacturing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_operation_definition VALUES (21, '1ply_napkin_20', '1ply-Napkin 20 gsm', '1', 'Production', NULL, NULL, NULL, 'tissue_manufacturing', 'Tissue Manufacturing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_operation_definition VALUES (22, '1ply_napkin_25_rtp', '1ply-Napkin (RTP) 25 gsm', '1', 'Production', NULL, NULL, NULL, 'tissue_manufacturing', 'Tissue Manufacturing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_operation_definition VALUES (23, 'paper_towel_htensile_24_2740', 'Paper Towel 24 g(H-Tensile)2740', '1', 'Production', NULL, NULL, NULL, 'tissue_manufacturing', 'Tissue Manufacturing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_operation_definition VALUES (24, 'double_horse_20', 'Double Horse 20 gsm', '1', 'Production', NULL, NULL, NULL, 'tissue_manufacturing', 'Tissue Manufacturing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_operation_definition VALUES (25, 'n_fold_19', 'N - Fold 19 gsm', '1', 'Production', NULL, NULL, NULL, 'tissue_manufacturing', 'Tissue Manufacturing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: dim_operation_request; Type: TABLE DATA; Schema: starSchemaV1_5; Owner: postgres
--

INSERT INTO dim_operation_request VALUES (1, 'mo_nestle_101', 'MO Nestle 101', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_operation_request VALUES (2, 'mo_nestle_101', 'MO Nestle 101', 'paper_manufacturing_sr_1', 'Paper Manufacturing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_operation_request VALUES (3, 'mo_nestle_101', 'MO Nestle 101', 'tissue_delivery_sr_1', 'Tissue Delivery', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_operation_request VALUES (4, 'mo_nestle_102', 'MO Nestle 101', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_operation_request VALUES (5, 'mo_nestle_102', 'MO Nestle 101', 'paper_manufacturing_sr_2', 'Paper Manufacturing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_operation_request VALUES (6, 'mo_nestle_102', 'MO Nestle 101', 'tissue_delivery_sr_2', 'Tissue Delivery', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: dim_operation_response; Type: TABLE DATA; Schema: starSchemaV1_5; Owner: postgres
--



--
-- Data for Name: dim_personnel; Type: TABLE DATA; Schema: starSchemaV1_5; Owner: postgres
--



--
-- Data for Name: dim_process_segment; Type: TABLE DATA; Schema: starSchemaV1_5; Owner: postgres
--

INSERT INTO dim_process_segment VALUES (1, NULL, NULL, 'Production', 'paper_making_machine', 'Paper Making Machine', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_process_segment VALUES (2, NULL, NULL, 'Inventory', 'warehouse_delivery', 'Warehouse Delivery', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_process_segment VALUES (3, 'paper_making_machine_9', 'Paper Making Machine 9', 'Production', 'paper_making_machine', 'Paper Making Machine', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_process_segment VALUES (4, 'paper_making_machine_9', 'Paper Making Machine 9', 'Production', 'paper_making_machine', 'Paper Making Machine', 's1', 'Stream 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_process_segment VALUES (5, 'paper_making_machine_9', 'Paper Making Machine 9', 'Production', 'paper_making_machine', 'Paper Making Machine', 's2', 'Stream 2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_process_segment VALUES (6, 'paper_making_machine_9', 'Paper Making Machine 9', 'Production', 'paper_making_machine', 'Paper Making Machine', 's3', 'Stream 3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_process_segment VALUES (7, 'paper_making_machine_9', 'Paper Making Machine 9', 'Production', 'paper_making_machine', 'Paper Making Machine', 's4', 'Stream 4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_process_segment VALUES (8, 'paper_making_machine_9', 'Paper Making Machine 9', 'Production', 'paper_making_machine', 'Paper Making Machine', 's5', 'Stream 5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO dim_process_segment VALUES (9, 'paper_making_machine_9', 'Paper Making Machine 9', 'Production', 'paper_making_machine', 'Paper Making Machine', 's6', 'Stream 6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Data for dim_events
--
COPY Dim_event
FROM 'D:\SQLScript\Bridge schmea DWH\V1_7\dim_event.csv' DELIMITER ',' CSV HEADER;

--
-- Data for dim_kpi
--
COPY Dim_kpi
FROM 'D:\SQLScript\Bridge schmea DWH\V1_7\dim_kpi.csv' DELIMITER ',' CSV HEADER;

--
-- Data for dim_kpi
--
COPY Dim_property_definition
FROM 'D:\SQLScript\Bridge schmea DWH\V1_7\dim_property_definition.csv' DELIMITER ',' CSV HEADER;




-------------------------------------------------------------------------------
--Bridge tables
--
-- Data for Name: equipment_composition_bridge; Type: TABLE DATA; Schema: starSchemaV1_5; Owner: postgres
--

INSERT INTO equipment_composition_bridge VALUES (1,12, 12, 0, true, false,'2020-06-21 11:26:00',null,false);
INSERT INTO equipment_composition_bridge VALUES (2,13, 13, 0, true, false, '2020-06-21 11:26:00',null,false);
INSERT INTO equipment_composition_bridge VALUES (3,14, 14, 0, true, false, '2020-06-21 11:26:00',null,false);
INSERT INTO equipment_composition_bridge VALUES (4,15, 15, 0, true, false, '2020-06-21 11:26:00',null,false);
INSERT INTO equipment_composition_bridge VALUES (5,16, 16, 0, true, false, '2020-06-21 11:26:00',null,false);
INSERT INTO equipment_composition_bridge VALUES (6,15, 16, 1, false, true, '2020-06-21 11:26:00',null,false);


--
-- Data for Name: equipment_type_classification_bridge; Type: TABLE DATA; Schema: starSchemaV1_5; Owner: postgres
--
/*
INSERT INTO equipment_type_classification_bridge VALUES (1, 1, 0, true, false, 1);
INSERT INTO equipment_type_classification_bridge VALUES (1, 2, 1, false, false, 2);
INSERT INTO equipment_type_classification_bridge VALUES (2, 2, 0, true, false, 3);
INSERT INTO equipment_type_classification_bridge VALUES (1, 3, 1, false, false, 4);
INSERT INTO equipment_type_classification_bridge VALUES (3, 3, 0, true, false, 5);
INSERT INTO equipment_type_classification_bridge VALUES (1, 4, 2, false, false, 6);
INSERT INTO equipment_type_classification_bridge VALUES (2, 4, 1, false, false, 7);
INSERT INTO equipment_type_classification_bridge VALUES (4, 4, 0, true, false, 8);
INSERT INTO equipment_type_classification_bridge VALUES (1, 5, 2, false, false, 9);
INSERT INTO equipment_type_classification_bridge VALUES (2, 5, 1, false, false, 10);
INSERT INTO equipment_type_classification_bridge VALUES (5, 5, 0, true, false, 11);
INSERT INTO equipment_type_classification_bridge VALUES (1, 6, 3, false, false, 12);
INSERT INTO equipment_type_classification_bridge VALUES (2, 6, 2, false, false, 13);
INSERT INTO equipment_type_classification_bridge VALUES (5, 6, 1, false, false, 14);
INSERT INTO equipment_type_classification_bridge VALUES (6, 6, 0, true, false, 15);
*/

--Highest parent flag fixed
INSERT INTO equipment_type_classification_bridge VALUES (1,1, 1, 0, true, false, '2020-06-21 11:26:00',null,false);
INSERT INTO equipment_type_classification_bridge VALUES (2,1, 2, 1, true, false, '2020-06-21 11:26:00',null,false);
INSERT INTO equipment_type_classification_bridge VALUES (3,2, 2, 0, false, false, '2020-06-21 11:26:00',null,false);
INSERT INTO equipment_type_classification_bridge VALUES (4,1, 3, 1, true, true, '2020-06-21 11:26:00',null,false);
INSERT INTO equipment_type_classification_bridge VALUES (5,3, 3, 0, false, false, '2020-06-21 11:26:00',null,false);
INSERT INTO equipment_type_classification_bridge VALUES (6,1, 4, 2, true, true, '2020-06-21 11:26:00',null,false);
INSERT INTO equipment_type_classification_bridge VALUES (7,2, 4, 1, false, true, '2020-06-21 11:26:00',null,false);
INSERT INTO equipment_type_classification_bridge VALUES (8,4, 4, 0, true, true, '2020-06-21 11:26:00',null,false);
INSERT INTO equipment_type_classification_bridge VALUES (9,1, 5, 2, true, false, '2020-06-21 11:26:00',null,false);
INSERT INTO equipment_type_classification_bridge VALUES (10,2, 5, 1, false, false, '2020-06-21 11:26:00',null,false);
INSERT INTO equipment_type_classification_bridge VALUES (11,5, 5, 0, true, false, '2020-06-21 11:26:00',null,false);
INSERT INTO equipment_type_classification_bridge VALUES (12,1, 6, 3, true, true, '2020-06-21 11:26:00',null,false);
INSERT INTO equipment_type_classification_bridge VALUES (13,2, 6, 2, false, true, '2020-06-21 11:26:00',null,false);
INSERT INTO equipment_type_classification_bridge VALUES (14,5, 6, 1, false, true, '2020-06-21 11:26:00',null,false);
INSERT INTO equipment_type_classification_bridge VALUES (15,6, 6, 0, true, true, '2020-06-21 11:26:00',null,false);

/*
INSERT INTO equipment_type_classification_bridge VALUES (1,1, 1, 0, true, false, '2020-06-21 11:26:00',null,false);
INSERT INTO equipment_type_classification_bridge VALUES (2,1, 2, 1, true, false, '2020-06-21 11:26:00',null,false);
INSERT INTO equipment_type_classification_bridge VALUES (3,1, 3, 1, true, true, '2020-06-21 11:26:00',null,false);
INSERT INTO equipment_type_classification_bridge VALUES (4,2, 2, 0, false, false, '2020-06-21 11:26:00',null,false);
INSERT INTO equipment_type_classification_bridge VALUES (5,2, 4, 1, false, true, '2020-06-21 11:26:00',null,false);
INSERT INTO equipment_type_classification_bridge VALUES (6,2, 5, 1, false, true, '2020-06-21 11:26:00',null,false);
INSERT INTO equipment_type_classification_bridge VALUES (7,3, 3, 0, false, true, '2020-06-21 11:26:00',null,false);
INSERT INTO equipment_type_classification_bridge VALUES (8,4, 4, 0, false, true, '2020-06-21 11:26:00',null,false);
INSERT INTO equipment_type_classification_bridge VALUES (9,5, 5, 0, false, true, '2020-06-21 11:26:00',null,false);
*/
------------------------------------------------------------------------------------------
--Bridge Table's data below need to be reviewed
------------------------------------------------------------------------------------------
--
-- Data for Name: material_class_bridge; Type: TABLE DATA; Schema: starSchemaV1_5; Owner: postgres
--
/*
INSERT INTO material_class_bridge VALUES (1, 1, 0, true, false, 1);
INSERT INTO material_class_bridge VALUES (2, 2, 0, true, false, 2);
INSERT INTO material_class_bridge VALUES (3, 3, 0, true, false, 3);
INSERT INTO material_class_bridge VALUES (4, 4, 0, true, false, 4);
INSERT INTO material_class_bridge VALUES (5, 5, 0, true, false, 5);


--
-- Data for Name: material_definition_bridge; Type: TABLE DATA; Schema: starSchemaV1_5; Owner: postgres
--

INSERT INTO material_definition_bridge VALUES (6, 6, 0, true, false, 1);
INSERT INTO material_definition_bridge VALUES (7, 7, 0, true, false, 2);
INSERT INTO material_definition_bridge VALUES (8, 8, 0, true, false, 3);
INSERT INTO material_definition_bridge VALUES (9, 9, 0, true, false, 4);
INSERT INTO material_definition_bridge VALUES (10, 10, 0, true, false, 5);
INSERT INTO material_definition_bridge VALUES (11, 11, 0, true, false, 6);
INSERT INTO material_definition_bridge VALUES (12, 12, 0, true, false, 7);
INSERT INTO material_definition_bridge VALUES (13, 13, 0, true, false, 8);
INSERT INTO material_definition_bridge VALUES (14, 14, 0, true, false, 9);
INSERT INTO material_definition_bridge VALUES (15, 15, 0, true, false, 10);
INSERT INTO material_definition_bridge VALUES (16, 16, 0, true, false, 11);
INSERT INTO material_definition_bridge VALUES (17, 17, 0, true, false, 12);
INSERT INTO material_definition_bridge VALUES (18, 18, 0, true, false, 13);
INSERT INTO material_definition_bridge VALUES (19, 19, 0, true, false, 14);
INSERT INTO material_definition_bridge VALUES (20, 20, 0, true, false, 15);
INSERT INTO material_definition_bridge VALUES (21, 21, 0, true, false, 16);
INSERT INTO material_definition_bridge VALUES (22, 22, 0, true, false, 17);
INSERT INTO material_definition_bridge VALUES (23, 23, 0, true, false, 18);
INSERT INTO material_definition_bridge VALUES (24, 24, 0, true, false, 19);
INSERT INTO material_definition_bridge VALUES (25, 25, 0, true, false, 20);
INSERT INTO material_definition_bridge VALUES (26, 26, 0, true, false, 21);
INSERT INTO material_definition_bridge VALUES (27, 27, 0, true, false, 22);
INSERT INTO material_definition_bridge VALUES (28, 28, 0, true, false, 23);
INSERT INTO material_definition_bridge VALUES (29, 29, 0, true, false, 24);
INSERT INTO material_definition_bridge VALUES (30, 30, 0, true, false, 25);
INSERT INTO material_definition_bridge VALUES (31, 31, 0, true, false, 26);
INSERT INTO material_definition_bridge VALUES (32, 32, 0, true, false, 27);
INSERT INTO material_definition_bridge VALUES (33, 33, 0, true, false, 28);
INSERT INTO material_definition_bridge VALUES (34, 34, 0, true, false, 29);
INSERT INTO material_definition_bridge VALUES (35, 35, 0, true, false, 30);
INSERT INTO material_definition_bridge VALUES (36, 36, 0, true, false, 31);
INSERT INTO material_definition_bridge VALUES (37, 37, 0, true, false, 32);
INSERT INTO material_definition_bridge VALUES (38, 38, 0, true, false, 33);
INSERT INTO material_definition_bridge VALUES (39, 39, 0, true, false, 34);
INSERT INTO material_definition_bridge VALUES (40, 40, 0, true, false, 35);
INSERT INTO material_definition_bridge VALUES (41, 41, 0, true, false, 36);
INSERT INTO material_definition_bridge VALUES (42, 42, 0, true, false, 37);
INSERT INTO material_definition_bridge VALUES (43, 43, 0, true, false, 38);
INSERT INTO material_definition_bridge VALUES (44, 44, 0, true, false, 39);
INSERT INTO material_definition_bridge VALUES (45, 45, 0, true, false, 40);
INSERT INTO material_definition_bridge VALUES (46, 46, 0, true, false, 41);
INSERT INTO material_definition_bridge VALUES (47, 47, 0, true, false, 42);
INSERT INTO material_definition_bridge VALUES (48, 48, 0, true, false, 43);
INSERT INTO material_definition_bridge VALUES (49, 49, 0, true, false, 44);
INSERT INTO material_definition_bridge VALUES (50, 50, 0, true, false, 45);
INSERT INTO material_definition_bridge VALUES (51, 51, 0, true, false, 46);
INSERT INTO material_definition_bridge VALUES (52, 52, 0, true, false, 47);
INSERT INTO material_definition_bridge VALUES (53, 53, 0, true, false, 48);


--
-- Data for Name: material_lot_bridge; Type: TABLE DATA; Schema: starSchemaV1_5; Owner: postgres
--



--
-- Data for Name: material_sublot_bridge; Type: TABLE DATA; Schema: starSchemaV1_5; Owner: postgres
--



--
-- Data for Name: operation_definition_type_classification_bridge; Type: TABLE DATA; Schema: starSchemaV1_5; Owner: postgres
--

INSERT INTO operation_definition_type_classification_bridge VALUES (1, 1, 0, true, false, 1,null,null,null);


--
-- Data for Name: operation_request_composition_bridge; Type: TABLE DATA; Schema: starSchemaV1_5; Owner: postgres
--

INSERT INTO operation_request_composition_bridge VALUES (1, 1, 0, true, false, 1);
INSERT INTO operation_request_composition_bridge VALUES (4, 4, 0, true, false, 2);


--
-- Data for Name: operation_segment_composition_bridge; Type: TABLE DATA; Schema: starSchemaV1_5; Owner: postgres
--

INSERT INTO operation_segment_composition_bridge VALUES (5, 5, 0, true, false, 1);
INSERT INTO operation_segment_composition_bridge VALUES (6, 6, 0, true, false, 2);


--
-- Data for Name: operation_segment_type_bridge; Type: TABLE DATA; Schema: starSchemaV1_5; Owner: postgres
--

INSERT INTO operation_segment_type_bridge VALUES (2, 3, 0, true, false, 1);
INSERT INTO operation_segment_type_bridge VALUES (2, 3, 0, true, false, 2);


--
-- Data for Name: personnel_type_classification_bridge; Type: TABLE DATA; Schema: starSchemaV1_5; Owner: postgres
--



--
-- Data for Name: process_segment_composition_bridge; Type: TABLE DATA; Schema: starSchemaV1_5; Owner: postgres
--

INSERT INTO process_segment_composition_bridge VALUES (3, 3, 0, true, false, 1);


--
-- Data for Name: process_segment_type_composition_bridge; Type: TABLE DATA; Schema: starSchemaV1_5; Owner: postgres
--

INSERT INTO process_segment_type_composition_bridge VALUES (1, 1, 0, true, false, 1);
INSERT INTO process_segment_type_composition_bridge VALUES (2, 2, 0, true, false, 2);


--
-- Data for Name: segment_requirement_composition_bridge; Type: TABLE DATA; Schema: starSchemaV1_5; Owner: postgres
--

INSERT INTO segment_requirement_composition_bridge VALUES (2, 2, 0, true, false, 1);
INSERT INTO segment_requirement_composition_bridge VALUES (3, 3, 0, true, false, 2);
INSERT INTO segment_requirement_composition_bridge VALUES (5, 5, 0, true, false, 3);
INSERT INTO segment_requirement_composition_bridge VALUES (6, 6, 0, true, false, 4);

*/