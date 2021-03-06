PGDMP                         x            bridge_schema    11.4    11.4 �   7           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            8           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            9           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            :           1262    166582    bridge_schema    DATABASE     �   CREATE DATABASE bridge_schema WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_Pakistan.1252' LC_CTYPE = 'English_Pakistan.1252';
    DROP DATABASE bridge_schema;
             postgres    false                        2615    175466    starSchemaV1_5    SCHEMA         CREATE SCHEMA "starSchemaV1_5";
    DROP SCHEMA "starSchemaV1_5";
             postgres    false            ;           0    0    SCHEMA "starSchemaV1_5"    COMMENT     P   COMMENT ON SCHEMA "starSchemaV1_5" IS 'Bridge Table based Star Schema (V 1.5)';
                  postgres    false    8            	            2615    186565    starSchemaV1_7    SCHEMA         CREATE SCHEMA "starSchemaV1_7";
    DROP SCHEMA "starSchemaV1_7";
             postgres    false            �            1259    175467    customer_dimensional_bridge    TABLE     �   CREATE TABLE "starSchemaV1_5".customer_dimensional_bridge (
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    level numeric NOT NULL,
    top_flag boolean NOT NULL,
    bottom_flag boolean NOT NULL,
    id integer NOT NULL
);
 9   DROP TABLE "starSchemaV1_5".customer_dimensional_bridge;
       starSchemaV1_5         postgres    false    8            �            1259    175473    dim_customer    TABLE     4  CREATE TABLE "starSchemaV1_5".dim_customer (
    id integer NOT NULL,
    customer_code text,
    customer_name text,
    customer_type_code text,
    customer_type_name text,
    insert_date_time timestamp without time zone,
    last_update_date_time timestamp without time zone,
    delete_flag boolean
);
 *   DROP TABLE "starSchemaV1_5".dim_customer;
       starSchemaV1_5         postgres    false    8            �            1259    175479    dim_customer_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_5".dim_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE "starSchemaV1_5".dim_customer_id_seq;
       starSchemaV1_5       postgres    false    8    199            <           0    0    dim_customer_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE "starSchemaV1_5".dim_customer_id_seq OWNED BY "starSchemaV1_5".dim_customer.id;
            starSchemaV1_5       postgres    false    200            �            1259    175481    dim_date    TABLE     l  CREATE TABLE "starSchemaV1_5".dim_date (
    dateid integer NOT NULL,
    date_actual date NOT NULL,
    epoch bigint NOT NULL,
    day_suffix character varying(4) NOT NULL,
    day_name character varying(9) NOT NULL,
    day_of_week integer NOT NULL,
    day_of_month integer NOT NULL,
    day_of_quarter integer NOT NULL,
    day_of_year integer NOT NULL,
    week_of_month integer NOT NULL,
    week_of_year integer NOT NULL,
    week_of_year_iso character(10) NOT NULL,
    month_actual integer NOT NULL,
    month_name character varying(9) NOT NULL,
    month_name_abbreviated character(3) NOT NULL,
    quarter_actual integer NOT NULL,
    quarter_name character varying(9) NOT NULL,
    year_actual integer NOT NULL,
    first_day_of_week date NOT NULL,
    last_day_of_week date NOT NULL,
    first_day_of_month date NOT NULL,
    last_day_of_month date NOT NULL,
    first_day_of_quarter date NOT NULL,
    last_day_of_quarter date NOT NULL,
    first_day_of_year date NOT NULL,
    last_day_of_year date NOT NULL,
    mmyyyy character(6) NOT NULL,
    mmddyyyy character(10) NOT NULL,
    weekend_indr boolean NOT NULL
);
 &   DROP TABLE "starSchemaV1_5".dim_date;
       starSchemaV1_5         postgres    false    8            �            1259    175484    dim_equipment    TABLE     S  CREATE TABLE "starSchemaV1_5".dim_equipment (
    id integer NOT NULL,
    equipment_code text,
    equipment_name text,
    equipment_level text,
    equipment_type_code text,
    equipment_type_name text,
    insert_date_time timestamp without time zone,
    last_update_date_time timestamp without time zone,
    delete_flag boolean
);
 +   DROP TABLE "starSchemaV1_5".dim_equipment;
       starSchemaV1_5         postgres    false    8            �            1259    175490    dim_equipment_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_5".dim_equipment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE "starSchemaV1_5".dim_equipment_id_seq;
       starSchemaV1_5       postgres    false    202    8            =           0    0    dim_equipment_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE "starSchemaV1_5".dim_equipment_id_seq OWNED BY "starSchemaV1_5".dim_equipment.id;
            starSchemaV1_5       postgres    false    203            �            1259    175492    dim_location    TABLE     H  CREATE TABLE "starSchemaV1_5".dim_location (
    id integer NOT NULL,
    location_code text,
    location_name text,
    location_type_code text,
    location_type_name text,
    location_level text,
    insert_date_time timestamp without time zone,
    last_update_date_time timestamp without time zone,
    date_flag text
);
 *   DROP TABLE "starSchemaV1_5".dim_location;
       starSchemaV1_5         postgres    false    8            �            1259    175498    dim_location_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_5".dim_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE "starSchemaV1_5".dim_location_id_seq;
       starSchemaV1_5       postgres    false    8    204            >           0    0    dim_location_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE "starSchemaV1_5".dim_location_id_seq OWNED BY "starSchemaV1_5".dim_location.id;
            starSchemaV1_5       postgres    false    205            �            1259    175500    dim_material    TABLE     �  CREATE TABLE "starSchemaV1_5".dim_material (
    id integer NOT NULL,
    material_code text,
    material_name text,
    material_type_code text,
    material_type_name text,
    material_lot_code text,
    material_lot_name text,
    material_sub_lot_code text,
    material_sub_lot_name text,
    insert_date_time timestamp without time zone,
    last_update_date_time timestamp without time zone,
    delete_flag boolean
);
 *   DROP TABLE "starSchemaV1_5".dim_material;
       starSchemaV1_5         postgres    false    8            �            1259    175506    dim_material_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_5".dim_material_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE "starSchemaV1_5".dim_material_id_seq;
       starSchemaV1_5       postgres    false    206    8            ?           0    0    dim_material_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE "starSchemaV1_5".dim_material_id_seq OWNED BY "starSchemaV1_5".dim_material.id;
            starSchemaV1_5       postgres    false    207            �            1259    175508    dim_operation_definition    TABLE     �  CREATE TABLE "starSchemaV1_5".dim_operation_definition (
    id integer NOT NULL,
    operation_definition_code text,
    operation_definition_name text,
    operation_definition_version text,
    operations_type_definition text,
    operations_type_segment character varying(20),
    operation_segment_code text,
    operation_segment_name text,
    operation_definition_type_code text,
    operation_definition_type_name text,
    operation_segment_type_code text,
    operation_segment_type_name text,
    personnel_specification_code character varying(20),
    personnel_specification_name character varying(20),
    equipment_specification_code character varying(20),
    equipment_specification_name character varying(20),
    material_specification_code character varying(20),
    material_specification_name character varying(20),
    material_specification_use character varying(20),
    operation_bill_of_material_code text,
    operation_bill_of_material_name text,
    operation_bill_of_material_item_code text,
    operation_bill_of_material_item_name text,
    operation_bill_of_material_item_use text,
    insert_date_time timestamp without time zone,
    last_update_date_time timestamp without time zone,
    delete_flag boolean
);
 6   DROP TABLE "starSchemaV1_5".dim_operation_definition;
       starSchemaV1_5         postgres    false    8            �            1259    175514    dim_operation_request    TABLE     �  CREATE TABLE "starSchemaV1_5".dim_operation_request (
    id integer NOT NULL,
    operation_request_code text,
    operation_request_name text,
    segment_requirement_code text,
    segment_requirement_name text,
    personnel_requirement_code character varying(20),
    personnel_requirement_name character varying(20),
    equipment_requirement_code character varying(20),
    equipment_requirement_name character varying(20),
    material_requirement_code character varying(20),
    material_requirement_name character varying(20),
    material_requirement_use character varying(20),
    requirement_bill_of_material_code text,
    requirement_bill_of_material_name text,
    requirement_bill_of_material_item_code text,
    requirement_bill_of_material_item_name text,
    requirement_bill_of_material_item_use text,
    insert_date_time timestamp without time zone,
    last_update_date_time timestamp without time zone,
    delete_flag boolean
);
 3   DROP TABLE "starSchemaV1_5".dim_operation_request;
       starSchemaV1_5         postgres    false    8            �            1259    175520    dim_operation_request_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_5".dim_operation_request_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE "starSchemaV1_5".dim_operation_request_id_seq;
       starSchemaV1_5       postgres    false    8    209            @           0    0    dim_operation_request_id_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE "starSchemaV1_5".dim_operation_request_id_seq OWNED BY "starSchemaV1_5".dim_operation_request.id;
            starSchemaV1_5       postgres    false    210            �            1259    175522    dim_operation_response    TABLE     �  CREATE TABLE "starSchemaV1_5".dim_operation_response (
    id integer NOT NULL,
    operation_response_code text,
    operation_response_name text,
    segment_response_code text,
    segment_response_name text,
    personnel_actual_code character varying(20),
    personnel_actual_name character varying(20),
    equipment_actual_code character varying(20),
    equipment_actual_name character varying(20),
    material_actual_code character varying(20),
    material_actual_name character varying(20),
    material_actual_use character varying(20),
    execution_bill_of_material_code text,
    execution_bill_of_material_name text,
    execution_bill_of_material_item_code text,
    execution_bill_of_material_item_name text,
    execution_bill_of_material_item_use text,
    insert_date_time timestamp without time zone,
    last_update_date_time timestamp without time zone,
    delete_flag boolean
);
 4   DROP TABLE "starSchemaV1_5".dim_operation_response;
       starSchemaV1_5         postgres    false    8            �            1259    175528    dim_operation_response_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_5".dim_operation_response_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE "starSchemaV1_5".dim_operation_response_id_seq;
       starSchemaV1_5       postgres    false    8    211            A           0    0    dim_operation_response_id_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE "starSchemaV1_5".dim_operation_response_id_seq OWNED BY "starSchemaV1_5".dim_operation_response.id;
            starSchemaV1_5       postgres    false    212            �            1259    175530    dim_personnel    TABLE     �  CREATE TABLE "starSchemaV1_5".dim_personnel (
    id integer NOT NULL,
    personnel_code text,
    personnel_name text,
    personnel_type_code text,
    personnel_type_name text,
    team_code text,
    team_name text,
    team_type_code text,
    team_type_name text,
    insert_date_time timestamp without time zone,
    last_update_date_time timestamp without time zone,
    delete_flag boolean
);
 +   DROP TABLE "starSchemaV1_5".dim_personnel;
       starSchemaV1_5         postgres    false    8            �            1259    175536    dim_personnel_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_5".dim_personnel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE "starSchemaV1_5".dim_personnel_id_seq;
       starSchemaV1_5       postgres    false    213    8            B           0    0    dim_personnel_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE "starSchemaV1_5".dim_personnel_id_seq OWNED BY "starSchemaV1_5".dim_personnel.id;
            starSchemaV1_5       postgres    false    214            �            1259    175538    dim_process_segment    TABLE     �  CREATE TABLE "starSchemaV1_5".dim_process_segment (
    id integer NOT NULL,
    process_segment_code text,
    process_segment_name text,
    operation_type text,
    process_segment_type_code text,
    process_segment_type_name text,
    stream_code text,
    stream_name text,
    personnel_segment_specification_code text,
    personnel_segment_specification_name text,
    equipment_segment_specification_code text,
    equipment_segment_specification_name text,
    material_segment_specification_code text,
    material_segment_specification_name text,
    personnel_segment_specification_use text,
    insert_date_time timestamp without time zone,
    last_update_date_time timestamp without time zone,
    delete_flag boolean
);
 1   DROP TABLE "starSchemaV1_5".dim_process_segment;
       starSchemaV1_5         postgres    false    8            �            1259    175544    dim_process_segment_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_5".dim_process_segment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE "starSchemaV1_5".dim_process_segment_id_seq;
       starSchemaV1_5       postgres    false    8    215            C           0    0    dim_process_segment_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE "starSchemaV1_5".dim_process_segment_id_seq OWNED BY "starSchemaV1_5".dim_process_segment.id;
            starSchemaV1_5       postgres    false    216            �            1259    175546    dim_record_type    TABLE     �  CREATE TABLE "starSchemaV1_5".dim_record_type (
    id integer NOT NULL,
    record_dimension_table text,
    record_concept text,
    record_category text,
    record_type text,
    record_property_code text,
    record_property_attribute text,
    record_property_type text,
    record_value text,
    record_value_type text,
    insert_date_time timestamp without time zone,
    last_update_date_time timestamp without time zone,
    delete_flag boolean
);
 -   DROP TABLE "starSchemaV1_5".dim_record_type;
       starSchemaV1_5         postgres    false    8            �            1259    175552    dim_record_type_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_5".dim_record_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE "starSchemaV1_5".dim_record_type_id_seq;
       starSchemaV1_5       postgres    false    217    8            D           0    0    dim_record_type_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE "starSchemaV1_5".dim_record_type_id_seq OWNED BY "starSchemaV1_5".dim_record_type.id;
            starSchemaV1_5       postgres    false    218            �            1259    175554 
   dim_sensor    TABLE     P  CREATE TABLE "starSchemaV1_5".dim_sensor (
    id integer NOT NULL,
    sensor_code text,
    sensor_name text,
    sensor_type_code text,
    sensor_type_name text,
    tag_code text,
    tag_name text,
    insert_date_time timestamp without time zone,
    last_update_date_time timestamp without time zone,
    delete_flag boolean
);
 (   DROP TABLE "starSchemaV1_5".dim_sensor;
       starSchemaV1_5         postgres    false    8            �            1259    175560    dim_sensor_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_5".dim_sensor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE "starSchemaV1_5".dim_sensor_id_seq;
       starSchemaV1_5       postgres    false    8    219            E           0    0    dim_sensor_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE "starSchemaV1_5".dim_sensor_id_seq OWNED BY "starSchemaV1_5".dim_sensor.id;
            starSchemaV1_5       postgres    false    220            �            1259    175562    dim_time    TABLE     �   CREATE TABLE "starSchemaV1_5".dim_time (
    time_id time without time zone NOT NULL,
    five_minutes time without time zone,
    quarter_hour time without time zone,
    hour_id time without time zone,
    shift integer
);
 &   DROP TABLE "starSchemaV1_5".dim_time;
       starSchemaV1_5         postgres    false    8            �            1259    175565    equipment_composition_bridge    TABLE     �   CREATE TABLE "starSchemaV1_5".equipment_composition_bridge (
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    level numeric NOT NULL,
    top_flag boolean NOT NULL,
    bottom_flag boolean NOT NULL,
    uuid integer NOT NULL
);
 :   DROP TABLE "starSchemaV1_5".equipment_composition_bridge;
       starSchemaV1_5         postgres    false    8            �            1259    175571 $   equipment_type_classification_bridge    TABLE     �   CREATE TABLE "starSchemaV1_5".equipment_type_classification_bridge (
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    level numeric NOT NULL,
    top_flag boolean NOT NULL,
    bottom_flag boolean NOT NULL,
    uuid integer NOT NULL
);
 B   DROP TABLE "starSchemaV1_5".equipment_type_classification_bridge;
       starSchemaV1_5         postgres    false    8            �            1259    175577 
   fact_table    TABLE     >  CREATE TABLE "starSchemaV1_5".fact_table (
    date_id date,
    time_id time without time zone,
    location_id integer,
    personnel_id integer,
    equipment_id integer,
    material_id integer,
    process_segment_id integer,
    operation_definition_id integer,
    operation_request_id integer,
    operation_response_id integer,
    record_type_id integer,
    sensor_id integer,
    customer_id integer,
    record_count numeric(6,2),
    value_min numeric(6,2),
    value_q1 numeric(6,2),
    value_mean numeric(6,2),
    value_q3 numeric(6,2),
    value_max numeric(6,2),
    value_total numeric(6,2),
    value_units numeric(20,0),
    value_string text,
    duration_min numeric(6,2),
    duration_mean numeric(6,2),
    duration_max numeric(6,2),
    duration_total numeric(6,2),
    duration_units numeric(20,0)
);
 (   DROP TABLE "starSchemaV1_5".fact_table;
       starSchemaV1_5         postgres    false    8            �            1259    175583    location_entity_bridge    TABLE     �   CREATE TABLE "starSchemaV1_5".location_entity_bridge (
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    level numeric NOT NULL,
    top_flag boolean NOT NULL,
    bottom_flag boolean NOT NULL,
    id integer NOT NULL
);
 4   DROP TABLE "starSchemaV1_5".location_entity_bridge;
       starSchemaV1_5         postgres    false    8            �            1259    175589 #   location_type_classification_bridge    TABLE     �   CREATE TABLE "starSchemaV1_5".location_type_classification_bridge (
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    level numeric NOT NULL,
    top_flag boolean NOT NULL,
    bottom_flag boolean NOT NULL,
    id integer NOT NULL
);
 A   DROP TABLE "starSchemaV1_5".location_type_classification_bridge;
       starSchemaV1_5         postgres    false    8            �            1259    175595    material_class_bridge    TABLE     �   CREATE TABLE "starSchemaV1_5".material_class_bridge (
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    level numeric NOT NULL,
    top_flag boolean NOT NULL,
    bottom_flag boolean NOT NULL,
    uuid integer NOT NULL
);
 3   DROP TABLE "starSchemaV1_5".material_class_bridge;
       starSchemaV1_5         postgres    false    8            �            1259    175601    material_definition_bridge    TABLE     �   CREATE TABLE "starSchemaV1_5".material_definition_bridge (
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    level numeric NOT NULL,
    top_flag boolean NOT NULL,
    bottom_flag boolean NOT NULL,
    uuid integer NOT NULL
);
 8   DROP TABLE "starSchemaV1_5".material_definition_bridge;
       starSchemaV1_5         postgres    false    8            �            1259    175607    material_lot_bridge    TABLE     �   CREATE TABLE "starSchemaV1_5".material_lot_bridge (
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    level numeric NOT NULL,
    top_flag boolean NOT NULL,
    bottom_flag boolean NOT NULL,
    id integer NOT NULL
);
 1   DROP TABLE "starSchemaV1_5".material_lot_bridge;
       starSchemaV1_5         postgres    false    8            �            1259    175613    material_sublot_bridge    TABLE     �   CREATE TABLE "starSchemaV1_5".material_sublot_bridge (
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    level numeric NOT NULL,
    top_flag boolean NOT NULL,
    bottom_flag boolean NOT NULL,
    id integer NOT NULL
);
 4   DROP TABLE "starSchemaV1_5".material_sublot_bridge;
       starSchemaV1_5         postgres    false    8            �            1259    175619 /   operation_definition_type_classification_bridge    TABLE       CREATE TABLE "starSchemaV1_5".operation_definition_type_classification_bridge (
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    level numeric NOT NULL,
    top_flag boolean NOT NULL,
    bottom_flag boolean NOT NULL,
    id integer NOT NULL
);
 M   DROP TABLE "starSchemaV1_5".operation_definition_type_classification_bridge;
       starSchemaV1_5         postgres    false    8            �            1259    175625 $   operation_request_composition_bridge    TABLE     �   CREATE TABLE "starSchemaV1_5".operation_request_composition_bridge (
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    level numeric NOT NULL,
    top_flag boolean NOT NULL,
    bottom_flag boolean NOT NULL,
    id integer NOT NULL
);
 B   DROP TABLE "starSchemaV1_5".operation_request_composition_bridge;
       starSchemaV1_5         postgres    false    8            �            1259    175631 $   operation_segment_composition_bridge    TABLE     �   CREATE TABLE "starSchemaV1_5".operation_segment_composition_bridge (
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    level numeric NOT NULL,
    top_flag boolean NOT NULL,
    bottom_flag boolean NOT NULL,
    id integer NOT NULL
);
 B   DROP TABLE "starSchemaV1_5".operation_segment_composition_bridge;
       starSchemaV1_5         postgres    false    8            �            1259    175637    operation_segment_type_bridge    TABLE     �   CREATE TABLE "starSchemaV1_5".operation_segment_type_bridge (
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    level numeric NOT NULL,
    top_flag boolean NOT NULL,
    bottom_flag boolean NOT NULL,
    id integer NOT NULL
);
 ;   DROP TABLE "starSchemaV1_5".operation_segment_type_bridge;
       starSchemaV1_5         postgres    false    8            �            1259    175643 $   personnel_type_classification_bridge    TABLE     �   CREATE TABLE "starSchemaV1_5".personnel_type_classification_bridge (
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    level numeric NOT NULL,
    top_flag boolean NOT NULL,
    bottom_flag boolean NOT NULL,
    id integer NOT NULL
);
 B   DROP TABLE "starSchemaV1_5".personnel_type_classification_bridge;
       starSchemaV1_5         postgres    false    8            �            1259    175649 "   process_segment_composition_bridge    TABLE     �   CREATE TABLE "starSchemaV1_5".process_segment_composition_bridge (
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    level numeric NOT NULL,
    top_flag boolean NOT NULL,
    bottom_flag boolean NOT NULL,
    uuid integer NOT NULL
);
 @   DROP TABLE "starSchemaV1_5".process_segment_composition_bridge;
       starSchemaV1_5         postgres    false    8            �            1259    175655 '   process_segment_type_composition_bridge    TABLE       CREATE TABLE "starSchemaV1_5".process_segment_type_composition_bridge (
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    level numeric NOT NULL,
    top_flag boolean NOT NULL,
    bottom_flag boolean NOT NULL,
    uuid integer NOT NULL
);
 E   DROP TABLE "starSchemaV1_5".process_segment_type_composition_bridge;
       starSchemaV1_5         postgres    false    8            �            1259    175661 &   segment_requirement_composition_bridge    TABLE     �   CREATE TABLE "starSchemaV1_5".segment_requirement_composition_bridge (
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    level numeric NOT NULL,
    top_flag boolean NOT NULL,
    bottom_flag boolean NOT NULL,
    id integer NOT NULL
);
 D   DROP TABLE "starSchemaV1_5".segment_requirement_composition_bridge;
       starSchemaV1_5         postgres    false    8            �            1259    175667 #   segment_response_composition_bridge    TABLE     �   CREATE TABLE "starSchemaV1_5".segment_response_composition_bridge (
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    level numeric NOT NULL,
    top_flag boolean NOT NULL,
    bottom_flag boolean NOT NULL,
    id integer NOT NULL
);
 A   DROP TABLE "starSchemaV1_5".segment_response_composition_bridge;
       starSchemaV1_5         postgres    false    8            �            1259    175673 !   sensor_type_classification_bridge    TABLE     �   CREATE TABLE "starSchemaV1_5".sensor_type_classification_bridge (
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    level numeric NOT NULL,
    top_flag boolean NOT NULL,
    bottom_flag boolean NOT NULL,
    uuid integer NOT NULL
);
 ?   DROP TABLE "starSchemaV1_5".sensor_type_classification_bridge;
       starSchemaV1_5         postgres    false    8            �            1259    175679    team_type_classification_bridge    TABLE     �   CREATE TABLE "starSchemaV1_5".team_type_classification_bridge (
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    level numeric NOT NULL,
    top_flag boolean NOT NULL,
    bottom_flag boolean NOT NULL,
    id integer NOT NULL
);
 =   DROP TABLE "starSchemaV1_5".team_type_classification_bridge;
       starSchemaV1_5         postgres    false    8            6           1259    187203    customer_type_bridge    TABLE     �  CREATE TABLE "starSchemaV1_7".customer_type_bridge (
    id integer NOT NULL,
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    level numeric NOT NULL,
    top_flag boolean NOT NULL,
    bottom_flag boolean NOT NULL,
    insert_date_time timestamp without time zone NOT NULL,
    last_update_date_time timestamp without time zone,
    delete_flag boolean NOT NULL
);
 2   DROP TABLE "starSchemaV1_7".customer_type_bridge;
       starSchemaV1_7         postgres    false    9            5           1259    187201    customer_type_bridge_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_7".customer_type_bridge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE "starSchemaV1_7".customer_type_bridge_id_seq;
       starSchemaV1_7       postgres    false    310    9            F           0    0    customer_type_bridge_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE "starSchemaV1_7".customer_type_bridge_id_seq OWNED BY "starSchemaV1_7".customer_type_bridge.id;
            starSchemaV1_7       postgres    false    309                       1259    186710    dim_customer    TABLE     4  CREATE TABLE "starSchemaV1_7".dim_customer (
    id integer NOT NULL,
    customer_code text,
    customer_name text,
    customer_type_code text,
    customer_type_name text,
    insert_date_time timestamp without time zone,
    last_update_date_time timestamp without time zone,
    delete_flag boolean
);
 *   DROP TABLE "starSchemaV1_7".dim_customer;
       starSchemaV1_7         postgres    false    9                       1259    186708    dim_customer_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_7".dim_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE "starSchemaV1_7".dim_customer_id_seq;
       starSchemaV1_7       postgres    false    269    9            G           0    0    dim_customer_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE "starSchemaV1_7".dim_customer_id_seq OWNED BY "starSchemaV1_7".dim_customer.id;
            starSchemaV1_7       postgres    false    268                       1259    186703    dim_date    TABLE     l  CREATE TABLE "starSchemaV1_7".dim_date (
    dateid integer NOT NULL,
    date_actual date NOT NULL,
    epoch bigint NOT NULL,
    day_suffix character varying(4) NOT NULL,
    day_name character varying(9) NOT NULL,
    day_of_week integer NOT NULL,
    day_of_month integer NOT NULL,
    day_of_quarter integer NOT NULL,
    day_of_year integer NOT NULL,
    week_of_month integer NOT NULL,
    week_of_year integer NOT NULL,
    week_of_year_iso character(10) NOT NULL,
    month_actual integer NOT NULL,
    month_name character varying(9) NOT NULL,
    month_name_abbreviated character(3) NOT NULL,
    quarter_actual integer NOT NULL,
    quarter_name character varying(9) NOT NULL,
    year_actual integer NOT NULL,
    first_day_of_week date NOT NULL,
    last_day_of_week date NOT NULL,
    first_day_of_month date NOT NULL,
    last_day_of_month date NOT NULL,
    first_day_of_quarter date NOT NULL,
    last_day_of_quarter date NOT NULL,
    first_day_of_year date NOT NULL,
    last_day_of_year date NOT NULL,
    mmyyyy character(6) NOT NULL,
    mmddyyyy character(10) NOT NULL,
    weekend_indr boolean NOT NULL
);
 &   DROP TABLE "starSchemaV1_7".dim_date;
       starSchemaV1_7         postgres    false    9            
           1259    186694    dim_equipment    TABLE     S  CREATE TABLE "starSchemaV1_7".dim_equipment (
    id integer NOT NULL,
    equipment_code text,
    equipment_name text,
    equipment_level text,
    equipment_type_code text,
    equipment_type_name text,
    insert_date_time timestamp without time zone,
    last_update_date_time timestamp without time zone,
    delete_flag boolean
);
 +   DROP TABLE "starSchemaV1_7".dim_equipment;
       starSchemaV1_7         postgres    false    9            	           1259    186692    dim_equipment_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_7".dim_equipment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE "starSchemaV1_7".dim_equipment_id_seq;
       starSchemaV1_7       postgres    false    9    266            H           0    0    dim_equipment_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE "starSchemaV1_7".dim_equipment_id_seq OWNED BY "starSchemaV1_7".dim_equipment.id;
            starSchemaV1_7       postgres    false    265                       1259    186683 	   dim_event    TABLE     �  CREATE TABLE "starSchemaV1_7".dim_event (
    id integer NOT NULL,
    concept_dimension_source text,
    event_concept text,
    abstract_event_type_code text,
    abstract_event_type_name text,
    concrete_event_type_code text,
    concrete_event_type_name text,
    insert_date_time timestamp without time zone,
    last_update_date_time timestamp without time zone,
    delete_flag boolean
);
 '   DROP TABLE "starSchemaV1_7".dim_event;
       starSchemaV1_7         postgres    false    9                       1259    186681    dim_event_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_7".dim_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE "starSchemaV1_7".dim_event_id_seq;
       starSchemaV1_7       postgres    false    9    264            I           0    0    dim_event_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE "starSchemaV1_7".dim_event_id_seq OWNED BY "starSchemaV1_7".dim_event.id;
            starSchemaV1_7       postgres    false    263                       1259    186672    dim_kpi    TABLE     N  CREATE TABLE "starSchemaV1_7".dim_kpi (
    id integer NOT NULL,
    concept_dimension_source text,
    kpi_concept text,
    kpi_category text,
    kpi_type_code text,
    kpi_type_name text,
    insert_date_time timestamp without time zone,
    last_update_date_time timestamp without time zone,
    delete_flag boolean NOT NULL
);
 %   DROP TABLE "starSchemaV1_7".dim_kpi;
       starSchemaV1_7         postgres    false    9                       1259    186670    dim_kpi_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_7".dim_kpi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE "starSchemaV1_7".dim_kpi_id_seq;
       starSchemaV1_7       postgres    false    262    9            J           0    0    dim_kpi_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE "starSchemaV1_7".dim_kpi_id_seq OWNED BY "starSchemaV1_7".dim_kpi.id;
            starSchemaV1_7       postgres    false    261                       1259    186661    dim_location    TABLE     M  CREATE TABLE "starSchemaV1_7".dim_location (
    id integer NOT NULL,
    location_code text,
    location_name text,
    location_type_code text,
    location_type_name text,
    location_level text,
    insert_date_time timestamp without time zone,
    last_update_date_time timestamp without time zone,
    delete_flag boolean
);
 *   DROP TABLE "starSchemaV1_7".dim_location;
       starSchemaV1_7         postgres    false    9                       1259    186659    dim_location_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_7".dim_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE "starSchemaV1_7".dim_location_id_seq;
       starSchemaV1_7       postgres    false    260    9            K           0    0    dim_location_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE "starSchemaV1_7".dim_location_id_seq OWNED BY "starSchemaV1_7".dim_location.id;
            starSchemaV1_7       postgres    false    259                       1259    186650    dim_material    TABLE     �  CREATE TABLE "starSchemaV1_7".dim_material (
    id integer NOT NULL,
    material_code text,
    material_name text,
    material_type_code text,
    material_type_name text,
    material_lot_code text,
    material_lot_name text,
    material_sub_lot_code text,
    material_sub_lot_name text,
    insert_date_time timestamp without time zone,
    last_update_date_time timestamp without time zone,
    delete_flag boolean
);
 *   DROP TABLE "starSchemaV1_7".dim_material;
       starSchemaV1_7         postgres    false    9                       1259    186648    dim_material_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_7".dim_material_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE "starSchemaV1_7".dim_material_id_seq;
       starSchemaV1_7       postgres    false    258    9            L           0    0    dim_material_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE "starSchemaV1_7".dim_material_id_seq OWNED BY "starSchemaV1_7".dim_material.id;
            starSchemaV1_7       postgres    false    257                        1259    186639    dim_operation_definition    TABLE     �  CREATE TABLE "starSchemaV1_7".dim_operation_definition (
    id integer NOT NULL,
    operation_definition_code text,
    operation_definition_name text,
    operation_definition_version text,
    operations_type_definition text,
    operations_type_segment character varying(20),
    operation_segment_code text,
    operation_segment_name text,
    operation_definition_type_code text,
    operation_definition_type_name text,
    operation_segment_type_code text,
    operation_segment_type_name text,
    personnel_specification_code character varying(20),
    personnel_specification_name character varying(20),
    equipment_specification_code character varying(20),
    equipment_specification_name character varying(20),
    material_specification_code character varying(20),
    material_specification_name character varying(20),
    material_specification_use character varying(20),
    operation_bill_of_material_code text,
    operation_bill_of_material_name text,
    operation_bill_of_material_item_code text,
    operation_bill_of_material_item_name text,
    operation_bill_of_material_item_use text,
    insert_date_time timestamp without time zone,
    last_update_date_time timestamp without time zone,
    delete_flag boolean
);
 6   DROP TABLE "starSchemaV1_7".dim_operation_definition;
       starSchemaV1_7         postgres    false    9            �            1259    186637    dim_operation_definition_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_7".dim_operation_definition_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE "starSchemaV1_7".dim_operation_definition_id_seq;
       starSchemaV1_7       postgres    false    9    256            M           0    0    dim_operation_definition_id_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE "starSchemaV1_7".dim_operation_definition_id_seq OWNED BY "starSchemaV1_7".dim_operation_definition.id;
            starSchemaV1_7       postgres    false    255            �            1259    186628    dim_operation_request    TABLE     �  CREATE TABLE "starSchemaV1_7".dim_operation_request (
    id integer NOT NULL,
    operation_request_code text,
    operation_request_name text,
    segment_requirement_code text,
    segment_requirement_name text,
    personnel_requirement_code character varying(20),
    personnel_requirement_name character varying(20),
    equipment_requirement_code character varying(20),
    equipment_requirement_name character varying(20),
    material_requirement_code character varying(20),
    material_requirement_name character varying(20),
    material_requirement_use character varying(20),
    requirement_bill_of_material_code text,
    requirement_bill_of_material_name text,
    requirement_bill_of_material_item_code text,
    requirement_bill_of_material_item_name text,
    requirement_bill_of_material_item_use text,
    insert_date_time timestamp without time zone,
    last_update_date_time timestamp without time zone,
    delete_flag boolean
);
 3   DROP TABLE "starSchemaV1_7".dim_operation_request;
       starSchemaV1_7         postgres    false    9            �            1259    186626    dim_operation_request_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_7".dim_operation_request_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE "starSchemaV1_7".dim_operation_request_id_seq;
       starSchemaV1_7       postgres    false    254    9            N           0    0    dim_operation_request_id_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE "starSchemaV1_7".dim_operation_request_id_seq OWNED BY "starSchemaV1_7".dim_operation_request.id;
            starSchemaV1_7       postgres    false    253            �            1259    186617    dim_operation_response    TABLE     �  CREATE TABLE "starSchemaV1_7".dim_operation_response (
    id integer NOT NULL,
    operation_response_code text,
    operation_response_name text,
    segment_response_code text,
    segment_response_name text,
    personnel_actual_code character varying(20),
    personnel_actual_name character varying(20),
    equipment_actual_code character varying(20),
    equipment_actual_name character varying(20),
    material_actual_code character varying(20),
    material_actual_name character varying(20),
    material_actual_use character varying(20),
    execution_bill_of_material_code text,
    execution_bill_of_material_name text,
    execution_bill_of_material_item_code text,
    execution_bill_of_material_item_name text,
    execution_bill_of_material_item_use text,
    insert_date_time timestamp without time zone,
    last_update_date_time timestamp without time zone,
    delete_flag boolean
);
 4   DROP TABLE "starSchemaV1_7".dim_operation_response;
       starSchemaV1_7         postgres    false    9            �            1259    186615    dim_operation_response_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_7".dim_operation_response_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE "starSchemaV1_7".dim_operation_response_id_seq;
       starSchemaV1_7       postgres    false    252    9            O           0    0    dim_operation_response_id_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE "starSchemaV1_7".dim_operation_response_id_seq OWNED BY "starSchemaV1_7".dim_operation_response.id;
            starSchemaV1_7       postgres    false    251            �            1259    186606    dim_personnel    TABLE     �  CREATE TABLE "starSchemaV1_7".dim_personnel (
    id integer NOT NULL,
    personnel_code text,
    personnel_name text,
    personnel_type_code text,
    personnel_type_name text,
    team_code text,
    team_name text,
    team_type_code text,
    team_type_name text,
    insert_date_time timestamp without time zone,
    last_update_date_time timestamp without time zone,
    delete_flag boolean
);
 +   DROP TABLE "starSchemaV1_7".dim_personnel;
       starSchemaV1_7         postgres    false    9            �            1259    186604    dim_personnel_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_7".dim_personnel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE "starSchemaV1_7".dim_personnel_id_seq;
       starSchemaV1_7       postgres    false    250    9            P           0    0    dim_personnel_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE "starSchemaV1_7".dim_personnel_id_seq OWNED BY "starSchemaV1_7".dim_personnel.id;
            starSchemaV1_7       postgres    false    249            �            1259    186595    dim_process_segment    TABLE     �  CREATE TABLE "starSchemaV1_7".dim_process_segment (
    id integer NOT NULL,
    process_segment_code text,
    process_segment_name text,
    operation_type text,
    process_segment_type_code text,
    process_segment_type_name text,
    stream_code text,
    stream_name text,
    personnel_segment_specification_code text,
    personnel_segment_specification_name text,
    equipment_segment_specification_code text,
    equipment_segment_specification_name text,
    material_segment_specification_code text,
    material_segment_specification_name text,
    personnel_segment_specification_use text,
    insert_date_time timestamp without time zone,
    last_update_date_time timestamp without time zone,
    delete_flag boolean
);
 1   DROP TABLE "starSchemaV1_7".dim_process_segment;
       starSchemaV1_7         postgres    false    9            �            1259    186593    dim_process_segment_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_7".dim_process_segment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE "starSchemaV1_7".dim_process_segment_id_seq;
       starSchemaV1_7       postgres    false    248    9            Q           0    0    dim_process_segment_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE "starSchemaV1_7".dim_process_segment_id_seq OWNED BY "starSchemaV1_7".dim_process_segment.id;
            starSchemaV1_7       postgres    false    247            �            1259    186584    dim_property_definition    TABLE     �  CREATE TABLE "starSchemaV1_7".dim_property_definition (
    id integer NOT NULL,
    concept_dimension_source text,
    property_concept text,
    property_type text,
    property_code text,
    property_name text,
    attribute text,
    value text,
    value_type text,
    insert_date_time timestamp without time zone,
    last_update_date_time timestamp without time zone,
    delete_flag boolean
);
 5   DROP TABLE "starSchemaV1_7".dim_property_definition;
       starSchemaV1_7         postgres    false    9            �            1259    186582    dim_property_definition_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_7".dim_property_definition_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE "starSchemaV1_7".dim_property_definition_id_seq;
       starSchemaV1_7       postgres    false    246    9            R           0    0    dim_property_definition_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE "starSchemaV1_7".dim_property_definition_id_seq OWNED BY "starSchemaV1_7".dim_property_definition.id;
            starSchemaV1_7       postgres    false    245            �            1259    186573 
   dim_sensor    TABLE     P  CREATE TABLE "starSchemaV1_7".dim_sensor (
    id integer NOT NULL,
    sensor_type_code text,
    sensor_type_name text,
    sensor_code text,
    sensor_name text,
    tag_code text,
    tag_name text,
    insert_date_time timestamp without time zone,
    last_update_date_time timestamp without time zone,
    delete_flag boolean
);
 (   DROP TABLE "starSchemaV1_7".dim_sensor;
       starSchemaV1_7         postgres    false    9            �            1259    186571    dim_sensor_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_7".dim_sensor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE "starSchemaV1_7".dim_sensor_id_seq;
       starSchemaV1_7       postgres    false    9    244            S           0    0    dim_sensor_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE "starSchemaV1_7".dim_sensor_id_seq OWNED BY "starSchemaV1_7".dim_sensor.id;
            starSchemaV1_7       postgres    false    243            �            1259    186566    dim_time    TABLE     �   CREATE TABLE "starSchemaV1_7".dim_time (
    time_id time without time zone NOT NULL,
    five_minutes time without time zone,
    quarter_hour time without time zone,
    hour_id time without time zone,
    shift integer
);
 &   DROP TABLE "starSchemaV1_7".dim_time;
       starSchemaV1_7         postgres    false    9            4           1259    187182    equipment_composition_bridge    TABLE     �  CREATE TABLE "starSchemaV1_7".equipment_composition_bridge (
    id integer NOT NULL,
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    level numeric NOT NULL,
    top_flag boolean NOT NULL,
    bottom_flag boolean NOT NULL,
    insert_date_time timestamp without time zone NOT NULL,
    last_update_date_time timestamp without time zone,
    delete_flag boolean NOT NULL
);
 :   DROP TABLE "starSchemaV1_7".equipment_composition_bridge;
       starSchemaV1_7         postgres    false    9            3           1259    187180 #   equipment_composition_bridge_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_7".equipment_composition_bridge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE "starSchemaV1_7".equipment_composition_bridge_id_seq;
       starSchemaV1_7       postgres    false    9    308            T           0    0 #   equipment_composition_bridge_id_seq    SEQUENCE OWNED BY        ALTER SEQUENCE "starSchemaV1_7".equipment_composition_bridge_id_seq OWNED BY "starSchemaV1_7".equipment_composition_bridge.id;
            starSchemaV1_7       postgres    false    307            2           1259    187161 $   equipment_type_classification_bridge    TABLE     �  CREATE TABLE "starSchemaV1_7".equipment_type_classification_bridge (
    id integer NOT NULL,
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    level numeric NOT NULL,
    top_flag boolean NOT NULL,
    bottom_flag boolean NOT NULL,
    insert_date_time timestamp without time zone NOT NULL,
    last_update_date_time timestamp without time zone,
    delete_flag boolean NOT NULL
);
 B   DROP TABLE "starSchemaV1_7".equipment_type_classification_bridge;
       starSchemaV1_7         postgres    false    9            1           1259    187159 +   equipment_type_classification_bridge_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_7".equipment_type_classification_bridge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 L   DROP SEQUENCE "starSchemaV1_7".equipment_type_classification_bridge_id_seq;
       starSchemaV1_7       postgres    false    306    9            U           0    0 +   equipment_type_classification_bridge_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE "starSchemaV1_7".equipment_type_classification_bridge_id_seq OWNED BY "starSchemaV1_7".equipment_type_classification_bridge.id;
            starSchemaV1_7       postgres    false    305            0           1259    187076 
   fact_table    TABLE     �  CREATE TABLE "starSchemaV1_7".fact_table (
    date_id date NOT NULL,
    time_id time without time zone NOT NULL,
    location_id integer NOT NULL,
    personnel_id integer NOT NULL,
    equipment_id integer NOT NULL,
    material_id integer NOT NULL,
    process_segment_id integer NOT NULL,
    operation_definition_id integer NOT NULL,
    operation_request_id integer NOT NULL,
    operation_response_id integer NOT NULL,
    sensor_id integer NOT NULL,
    customer_id integer NOT NULL,
    event_id integer NOT NULL,
    kpi_id integer NOT NULL,
    record_count numeric(6,2),
    value_min numeric(6,2),
    value_q1 numeric(6,2),
    value_mean numeric(6,2),
    value_q3 numeric(6,2),
    value_max numeric(6,2),
    value_total numeric(6,2),
    value_units text,
    value_string text,
    duration_min numeric(6,2),
    duration_mean numeric(6,2),
    duration_max numeric(6,2),
    duration_total numeric(6,2),
    duration_units numeric(20,0),
    property_definition_id integer NOT NULL
);
 (   DROP TABLE "starSchemaV1_7".fact_table;
       starSchemaV1_7         postgres    false    9            /           1259    187057    location_entity_bridge    TABLE     �  CREATE TABLE "starSchemaV1_7".location_entity_bridge (
    id integer NOT NULL,
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    level numeric NOT NULL,
    top_flag boolean NOT NULL,
    bottom_flag boolean NOT NULL,
    insert_date_time timestamp without time zone NOT NULL,
    last_update_date_time timestamp without time zone,
    delete_flag boolean NOT NULL
);
 4   DROP TABLE "starSchemaV1_7".location_entity_bridge;
       starSchemaV1_7         postgres    false    9            .           1259    187055    location_entity_bridge_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_7".location_entity_bridge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE "starSchemaV1_7".location_entity_bridge_id_seq;
       starSchemaV1_7       postgres    false    303    9            V           0    0    location_entity_bridge_id_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE "starSchemaV1_7".location_entity_bridge_id_seq OWNED BY "starSchemaV1_7".location_entity_bridge.id;
            starSchemaV1_7       postgres    false    302            -           1259    187036 #   location_type_classification_bridge    TABLE     �  CREATE TABLE "starSchemaV1_7".location_type_classification_bridge (
    id integer NOT NULL,
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    level numeric NOT NULL,
    top_flag boolean NOT NULL,
    bottom_flag boolean NOT NULL,
    insert_date_time timestamp without time zone NOT NULL,
    last_update_date_time timestamp without time zone,
    delete_flag boolean NOT NULL
);
 A   DROP TABLE "starSchemaV1_7".location_type_classification_bridge;
       starSchemaV1_7         postgres    false    9            ,           1259    187034 *   location_type_classification_bridge_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_7".location_type_classification_bridge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 K   DROP SEQUENCE "starSchemaV1_7".location_type_classification_bridge_id_seq;
       starSchemaV1_7       postgres    false    9    301            W           0    0 *   location_type_classification_bridge_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE "starSchemaV1_7".location_type_classification_bridge_id_seq OWNED BY "starSchemaV1_7".location_type_classification_bridge.id;
            starSchemaV1_7       postgres    false    300            +           1259    187015    material_class_bridge    TABLE     �  CREATE TABLE "starSchemaV1_7".material_class_bridge (
    id integer NOT NULL,
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    level numeric NOT NULL,
    top_flag boolean NOT NULL,
    bottom_flag boolean NOT NULL,
    insert_date_time timestamp without time zone NOT NULL,
    last_update_date_time timestamp without time zone,
    delete_flag boolean NOT NULL
);
 3   DROP TABLE "starSchemaV1_7".material_class_bridge;
       starSchemaV1_7         postgres    false    9            *           1259    187013    material_class_bridge_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_7".material_class_bridge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE "starSchemaV1_7".material_class_bridge_id_seq;
       starSchemaV1_7       postgres    false    9    299            X           0    0    material_class_bridge_id_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE "starSchemaV1_7".material_class_bridge_id_seq OWNED BY "starSchemaV1_7".material_class_bridge.id;
            starSchemaV1_7       postgres    false    298            )           1259    186994    material_definition_bridge    TABLE     �  CREATE TABLE "starSchemaV1_7".material_definition_bridge (
    id integer NOT NULL,
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    level numeric NOT NULL,
    top_flag boolean NOT NULL,
    bottom_flag boolean NOT NULL,
    insert_date_time timestamp without time zone NOT NULL,
    last_update_date_time timestamp without time zone,
    delete_flag boolean NOT NULL
);
 8   DROP TABLE "starSchemaV1_7".material_definition_bridge;
       starSchemaV1_7         postgres    false    9            (           1259    186992 !   material_definition_bridge_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_7".material_definition_bridge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE "starSchemaV1_7".material_definition_bridge_id_seq;
       starSchemaV1_7       postgres    false    297    9            Y           0    0 !   material_definition_bridge_id_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE "starSchemaV1_7".material_definition_bridge_id_seq OWNED BY "starSchemaV1_7".material_definition_bridge.id;
            starSchemaV1_7       postgres    false    296            '           1259    186973    material_lot_bridge    TABLE       CREATE TABLE "starSchemaV1_7".material_lot_bridge (
    id integer NOT NULL,
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    level numeric NOT NULL,
    top_flag boolean NOT NULL,
    bottom_flag boolean NOT NULL,
    insert_date_time timestamp without time zone NOT NULL,
    last_update_date_time timestamp without time zone,
    delete_flag boolean NOT NULL
);
 1   DROP TABLE "starSchemaV1_7".material_lot_bridge;
       starSchemaV1_7         postgres    false    9            &           1259    186971    material_lot_bridge_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_7".material_lot_bridge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE "starSchemaV1_7".material_lot_bridge_id_seq;
       starSchemaV1_7       postgres    false    9    295            Z           0    0    material_lot_bridge_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE "starSchemaV1_7".material_lot_bridge_id_seq OWNED BY "starSchemaV1_7".material_lot_bridge.id;
            starSchemaV1_7       postgres    false    294            %           1259    186952    material_sublot_bridge    TABLE     �  CREATE TABLE "starSchemaV1_7".material_sublot_bridge (
    id integer NOT NULL,
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    level numeric NOT NULL,
    top_flag boolean NOT NULL,
    bottom_flag boolean NOT NULL,
    insert_date_time timestamp without time zone NOT NULL,
    last_update_date_time timestamp without time zone,
    delete_flag boolean NOT NULL
);
 4   DROP TABLE "starSchemaV1_7".material_sublot_bridge;
       starSchemaV1_7         postgres    false    9            $           1259    186950    material_sublot_bridge_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_7".material_sublot_bridge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE "starSchemaV1_7".material_sublot_bridge_id_seq;
       starSchemaV1_7       postgres    false    9    293            [           0    0    material_sublot_bridge_id_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE "starSchemaV1_7".material_sublot_bridge_id_seq OWNED BY "starSchemaV1_7".material_sublot_bridge.id;
            starSchemaV1_7       postgres    false    292            #           1259    186931 /   operation_definition_type_classification_bridge    TABLE     �  CREATE TABLE "starSchemaV1_7".operation_definition_type_classification_bridge (
    id integer NOT NULL,
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    level numeric NOT NULL,
    top_flag boolean NOT NULL,
    bottom_flag boolean NOT NULL,
    insert_date_time timestamp without time zone NOT NULL,
    last_update_date_time timestamp without time zone,
    delete_flag boolean NOT NULL
);
 M   DROP TABLE "starSchemaV1_7".operation_definition_type_classification_bridge;
       starSchemaV1_7         postgres    false    9            "           1259    186929 6   operation_definition_type_classification_bridge_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_7".operation_definition_type_classification_bridge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 W   DROP SEQUENCE "starSchemaV1_7".operation_definition_type_classification_bridge_id_seq;
       starSchemaV1_7       postgres    false    291    9            \           0    0 6   operation_definition_type_classification_bridge_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE "starSchemaV1_7".operation_definition_type_classification_bridge_id_seq OWNED BY "starSchemaV1_7".operation_definition_type_classification_bridge.id;
            starSchemaV1_7       postgres    false    290            !           1259    186910 $   operation_request_composition_bridge    TABLE     �  CREATE TABLE "starSchemaV1_7".operation_request_composition_bridge (
    id integer NOT NULL,
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    level numeric NOT NULL,
    top_flag boolean NOT NULL,
    bottom_flag boolean NOT NULL,
    insert_date_time timestamp without time zone NOT NULL,
    last_update_date_time timestamp without time zone,
    delete_flag boolean NOT NULL
);
 B   DROP TABLE "starSchemaV1_7".operation_request_composition_bridge;
       starSchemaV1_7         postgres    false    9                        1259    186908 +   operation_request_composition_bridge_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_7".operation_request_composition_bridge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 L   DROP SEQUENCE "starSchemaV1_7".operation_request_composition_bridge_id_seq;
       starSchemaV1_7       postgres    false    9    289            ]           0    0 +   operation_request_composition_bridge_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE "starSchemaV1_7".operation_request_composition_bridge_id_seq OWNED BY "starSchemaV1_7".operation_request_composition_bridge.id;
            starSchemaV1_7       postgres    false    288                       1259    186889 $   operation_segment_composition_bridge    TABLE     �  CREATE TABLE "starSchemaV1_7".operation_segment_composition_bridge (
    id integer NOT NULL,
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    level numeric NOT NULL,
    top_flag boolean NOT NULL,
    bottom_flag boolean NOT NULL,
    insert_date_time timestamp without time zone NOT NULL,
    last_update_date_time timestamp without time zone,
    delete_flag boolean NOT NULL
);
 B   DROP TABLE "starSchemaV1_7".operation_segment_composition_bridge;
       starSchemaV1_7         postgres    false    9                       1259    186887 +   operation_segment_composition_bridge_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_7".operation_segment_composition_bridge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 L   DROP SEQUENCE "starSchemaV1_7".operation_segment_composition_bridge_id_seq;
       starSchemaV1_7       postgres    false    9    287            ^           0    0 +   operation_segment_composition_bridge_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE "starSchemaV1_7".operation_segment_composition_bridge_id_seq OWNED BY "starSchemaV1_7".operation_segment_composition_bridge.id;
            starSchemaV1_7       postgres    false    286                       1259    186868    operation_segment_type_bridge    TABLE     �  CREATE TABLE "starSchemaV1_7".operation_segment_type_bridge (
    id integer NOT NULL,
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    level numeric NOT NULL,
    top_flag boolean NOT NULL,
    bottom_flag boolean NOT NULL,
    insert_date_time timestamp without time zone NOT NULL,
    last_update_date_time timestamp without time zone,
    delete_flag boolean NOT NULL
);
 ;   DROP TABLE "starSchemaV1_7".operation_segment_type_bridge;
       starSchemaV1_7         postgres    false    9                       1259    186866 $   operation_segment_type_bridge_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_7".operation_segment_type_bridge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE "starSchemaV1_7".operation_segment_type_bridge_id_seq;
       starSchemaV1_7       postgres    false    9    285            _           0    0 $   operation_segment_type_bridge_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE "starSchemaV1_7".operation_segment_type_bridge_id_seq OWNED BY "starSchemaV1_7".operation_segment_type_bridge.id;
            starSchemaV1_7       postgres    false    284                       1259    186847 $   personnel_type_classification_bridge    TABLE     �  CREATE TABLE "starSchemaV1_7".personnel_type_classification_bridge (
    id integer NOT NULL,
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    level numeric NOT NULL,
    top_flag boolean NOT NULL,
    bottom_flag boolean NOT NULL,
    insert_date_time timestamp without time zone NOT NULL,
    last_update_date_time timestamp without time zone,
    delete_flag boolean NOT NULL
);
 B   DROP TABLE "starSchemaV1_7".personnel_type_classification_bridge;
       starSchemaV1_7         postgres    false    9                       1259    186845 +   personnel_type_classification_bridge_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_7".personnel_type_classification_bridge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 L   DROP SEQUENCE "starSchemaV1_7".personnel_type_classification_bridge_id_seq;
       starSchemaV1_7       postgres    false    9    283            `           0    0 +   personnel_type_classification_bridge_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE "starSchemaV1_7".personnel_type_classification_bridge_id_seq OWNED BY "starSchemaV1_7".personnel_type_classification_bridge.id;
            starSchemaV1_7       postgres    false    282                       1259    186826 "   process_segment_composition_bridge    TABLE     �  CREATE TABLE "starSchemaV1_7".process_segment_composition_bridge (
    id integer NOT NULL,
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    level numeric NOT NULL,
    top_flag boolean NOT NULL,
    bottom_flag boolean NOT NULL,
    insert_date_time timestamp without time zone NOT NULL,
    last_update_date_time timestamp without time zone,
    delete_flag boolean NOT NULL
);
 @   DROP TABLE "starSchemaV1_7".process_segment_composition_bridge;
       starSchemaV1_7         postgres    false    9                       1259    186824 )   process_segment_composition_bridge_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_7".process_segment_composition_bridge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 J   DROP SEQUENCE "starSchemaV1_7".process_segment_composition_bridge_id_seq;
       starSchemaV1_7       postgres    false    9    281            a           0    0 )   process_segment_composition_bridge_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE "starSchemaV1_7".process_segment_composition_bridge_id_seq OWNED BY "starSchemaV1_7".process_segment_composition_bridge.id;
            starSchemaV1_7       postgres    false    280                       1259    186805 '   process_segment_type_composition_bridge    TABLE     �  CREATE TABLE "starSchemaV1_7".process_segment_type_composition_bridge (
    id integer NOT NULL,
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    level numeric NOT NULL,
    top_flag boolean NOT NULL,
    bottom_flag boolean NOT NULL,
    insert_date_time timestamp without time zone NOT NULL,
    last_update_date_time timestamp without time zone,
    delete_flag boolean NOT NULL
);
 E   DROP TABLE "starSchemaV1_7".process_segment_type_composition_bridge;
       starSchemaV1_7         postgres    false    9                       1259    186803 .   process_segment_type_composition_bridge_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_7".process_segment_type_composition_bridge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 O   DROP SEQUENCE "starSchemaV1_7".process_segment_type_composition_bridge_id_seq;
       starSchemaV1_7       postgres    false    9    279            b           0    0 .   process_segment_type_composition_bridge_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE "starSchemaV1_7".process_segment_type_composition_bridge_id_seq OWNED BY "starSchemaV1_7".process_segment_type_composition_bridge.id;
            starSchemaV1_7       postgres    false    278                       1259    186784 &   segment_requirement_composition_bridge    TABLE     �  CREATE TABLE "starSchemaV1_7".segment_requirement_composition_bridge (
    id integer NOT NULL,
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    level numeric NOT NULL,
    top_flag boolean NOT NULL,
    bottom_flag boolean NOT NULL,
    insert_date_time timestamp without time zone NOT NULL,
    last_update_date_time timestamp without time zone,
    delete_flag boolean NOT NULL
);
 D   DROP TABLE "starSchemaV1_7".segment_requirement_composition_bridge;
       starSchemaV1_7         postgres    false    9                       1259    186782 -   segment_requirement_composition_bridge_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_7".segment_requirement_composition_bridge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 N   DROP SEQUENCE "starSchemaV1_7".segment_requirement_composition_bridge_id_seq;
       starSchemaV1_7       postgres    false    277    9            c           0    0 -   segment_requirement_composition_bridge_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE "starSchemaV1_7".segment_requirement_composition_bridge_id_seq OWNED BY "starSchemaV1_7".segment_requirement_composition_bridge.id;
            starSchemaV1_7       postgres    false    276                       1259    186763 #   segment_response_composition_bridge    TABLE     �  CREATE TABLE "starSchemaV1_7".segment_response_composition_bridge (
    id integer NOT NULL,
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    level numeric NOT NULL,
    top_flag boolean NOT NULL,
    bottom_flag boolean NOT NULL,
    insert_date_time timestamp without time zone NOT NULL,
    last_update_date_time timestamp without time zone,
    delete_flag boolean NOT NULL
);
 A   DROP TABLE "starSchemaV1_7".segment_response_composition_bridge;
       starSchemaV1_7         postgres    false    9                       1259    186761 *   segment_response_composition_bridge_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_7".segment_response_composition_bridge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 K   DROP SEQUENCE "starSchemaV1_7".segment_response_composition_bridge_id_seq;
       starSchemaV1_7       postgres    false    9    275            d           0    0 *   segment_response_composition_bridge_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE "starSchemaV1_7".segment_response_composition_bridge_id_seq OWNED BY "starSchemaV1_7".segment_response_composition_bridge.id;
            starSchemaV1_7       postgres    false    274                       1259    186742 !   sensor_type_classification_bridge    TABLE     �  CREATE TABLE "starSchemaV1_7".sensor_type_classification_bridge (
    id integer NOT NULL,
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    level numeric NOT NULL,
    top_flag boolean NOT NULL,
    bottom_flag boolean NOT NULL,
    insert_date_time timestamp without time zone NOT NULL,
    last_update_date_time timestamp without time zone,
    delete_flag boolean NOT NULL
);
 ?   DROP TABLE "starSchemaV1_7".sensor_type_classification_bridge;
       starSchemaV1_7         postgres    false    9                       1259    186740 (   sensor_type_classification_bridge_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_7".sensor_type_classification_bridge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 I   DROP SEQUENCE "starSchemaV1_7".sensor_type_classification_bridge_id_seq;
       starSchemaV1_7       postgres    false    9    273            e           0    0 (   sensor_type_classification_bridge_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE "starSchemaV1_7".sensor_type_classification_bridge_id_seq OWNED BY "starSchemaV1_7".sensor_type_classification_bridge.id;
            starSchemaV1_7       postgres    false    272                       1259    186721    team_type_classification_bridge    TABLE     �  CREATE TABLE "starSchemaV1_7".team_type_classification_bridge (
    id integer NOT NULL,
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    level numeric NOT NULL,
    top_flag boolean NOT NULL,
    bottom_flag boolean NOT NULL,
    insert_date_time timestamp without time zone NOT NULL,
    last_update_date_time timestamp without time zone,
    delete_flag boolean NOT NULL
);
 =   DROP TABLE "starSchemaV1_7".team_type_classification_bridge;
       starSchemaV1_7         postgres    false    9                       1259    186719 &   team_type_classification_bridge_id_seq    SEQUENCE     �   CREATE SEQUENCE "starSchemaV1_7".team_type_classification_bridge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 G   DROP SEQUENCE "starSchemaV1_7".team_type_classification_bridge_id_seq;
       starSchemaV1_7       postgres    false    9    271            f           0    0 &   team_type_classification_bridge_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE "starSchemaV1_7".team_type_classification_bridge_id_seq OWNED BY "starSchemaV1_7".team_type_classification_bridge.id;
            starSchemaV1_7       postgres    false    270            )           2604    175685    dim_customer id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_5".dim_customer ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_5".dim_customer_id_seq'::regclass);
 H   ALTER TABLE "starSchemaV1_5".dim_customer ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_5       postgres    false    200    199            *           2604    175686    dim_equipment id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_5".dim_equipment ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_5".dim_equipment_id_seq'::regclass);
 I   ALTER TABLE "starSchemaV1_5".dim_equipment ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_5       postgres    false    203    202            +           2604    175687    dim_location id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_5".dim_location ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_5".dim_location_id_seq'::regclass);
 H   ALTER TABLE "starSchemaV1_5".dim_location ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_5       postgres    false    205    204            ,           2604    175688    dim_material id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_5".dim_material ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_5".dim_material_id_seq'::regclass);
 H   ALTER TABLE "starSchemaV1_5".dim_material ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_5       postgres    false    207    206            -           2604    175689    dim_operation_request id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_5".dim_operation_request ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_5".dim_operation_request_id_seq'::regclass);
 Q   ALTER TABLE "starSchemaV1_5".dim_operation_request ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_5       postgres    false    210    209            .           2604    175690    dim_operation_response id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_5".dim_operation_response ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_5".dim_operation_response_id_seq'::regclass);
 R   ALTER TABLE "starSchemaV1_5".dim_operation_response ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_5       postgres    false    212    211            /           2604    175691    dim_personnel id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_5".dim_personnel ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_5".dim_personnel_id_seq'::regclass);
 I   ALTER TABLE "starSchemaV1_5".dim_personnel ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_5       postgres    false    214    213            0           2604    175692    dim_process_segment id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_5".dim_process_segment ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_5".dim_process_segment_id_seq'::regclass);
 O   ALTER TABLE "starSchemaV1_5".dim_process_segment ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_5       postgres    false    216    215            1           2604    175693    dim_record_type id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_5".dim_record_type ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_5".dim_record_type_id_seq'::regclass);
 K   ALTER TABLE "starSchemaV1_5".dim_record_type ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_5       postgres    false    218    217            2           2604    175694    dim_sensor id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_5".dim_sensor ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_5".dim_sensor_id_seq'::regclass);
 F   ALTER TABLE "starSchemaV1_5".dim_sensor ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_5       postgres    false    220    219            S           2604    187206    customer_type_bridge id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_7".customer_type_bridge ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_7".customer_type_bridge_id_seq'::regclass);
 P   ALTER TABLE "starSchemaV1_7".customer_type_bridge ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_7       postgres    false    309    310    310            ?           2604    186713    dim_customer id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_7".dim_customer ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_7".dim_customer_id_seq'::regclass);
 H   ALTER TABLE "starSchemaV1_7".dim_customer ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_7       postgres    false    269    268    269            >           2604    186697    dim_equipment id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_7".dim_equipment ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_7".dim_equipment_id_seq'::regclass);
 I   ALTER TABLE "starSchemaV1_7".dim_equipment ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_7       postgres    false    266    265    266            =           2604    186686    dim_event id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_7".dim_event ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_7".dim_event_id_seq'::regclass);
 E   ALTER TABLE "starSchemaV1_7".dim_event ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_7       postgres    false    263    264    264            <           2604    186675 
   dim_kpi id    DEFAULT     |   ALTER TABLE ONLY "starSchemaV1_7".dim_kpi ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_7".dim_kpi_id_seq'::regclass);
 C   ALTER TABLE "starSchemaV1_7".dim_kpi ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_7       postgres    false    262    261    262            ;           2604    186664    dim_location id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_7".dim_location ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_7".dim_location_id_seq'::regclass);
 H   ALTER TABLE "starSchemaV1_7".dim_location ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_7       postgres    false    259    260    260            :           2604    186653    dim_material id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_7".dim_material ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_7".dim_material_id_seq'::regclass);
 H   ALTER TABLE "starSchemaV1_7".dim_material ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_7       postgres    false    258    257    258            9           2604    186642    dim_operation_definition id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_7".dim_operation_definition ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_7".dim_operation_definition_id_seq'::regclass);
 T   ALTER TABLE "starSchemaV1_7".dim_operation_definition ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_7       postgres    false    255    256    256            8           2604    186631    dim_operation_request id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_7".dim_operation_request ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_7".dim_operation_request_id_seq'::regclass);
 Q   ALTER TABLE "starSchemaV1_7".dim_operation_request ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_7       postgres    false    254    253    254            7           2604    186620    dim_operation_response id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_7".dim_operation_response ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_7".dim_operation_response_id_seq'::regclass);
 R   ALTER TABLE "starSchemaV1_7".dim_operation_response ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_7       postgres    false    251    252    252            6           2604    186609    dim_personnel id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_7".dim_personnel ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_7".dim_personnel_id_seq'::regclass);
 I   ALTER TABLE "starSchemaV1_7".dim_personnel ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_7       postgres    false    249    250    250            5           2604    186598    dim_process_segment id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_7".dim_process_segment ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_7".dim_process_segment_id_seq'::regclass);
 O   ALTER TABLE "starSchemaV1_7".dim_process_segment ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_7       postgres    false    247    248    248            4           2604    186587    dim_property_definition id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_7".dim_property_definition ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_7".dim_property_definition_id_seq'::regclass);
 S   ALTER TABLE "starSchemaV1_7".dim_property_definition ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_7       postgres    false    246    245    246            3           2604    186576    dim_sensor id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_7".dim_sensor ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_7".dim_sensor_id_seq'::regclass);
 F   ALTER TABLE "starSchemaV1_7".dim_sensor ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_7       postgres    false    243    244    244            R           2604    187185    equipment_composition_bridge id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_7".equipment_composition_bridge ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_7".equipment_composition_bridge_id_seq'::regclass);
 X   ALTER TABLE "starSchemaV1_7".equipment_composition_bridge ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_7       postgres    false    308    307    308            Q           2604    187164 '   equipment_type_classification_bridge id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_7".equipment_type_classification_bridge ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_7".equipment_type_classification_bridge_id_seq'::regclass);
 `   ALTER TABLE "starSchemaV1_7".equipment_type_classification_bridge ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_7       postgres    false    305    306    306            P           2604    187060    location_entity_bridge id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_7".location_entity_bridge ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_7".location_entity_bridge_id_seq'::regclass);
 R   ALTER TABLE "starSchemaV1_7".location_entity_bridge ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_7       postgres    false    303    302    303            O           2604    187039 &   location_type_classification_bridge id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_7".location_type_classification_bridge ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_7".location_type_classification_bridge_id_seq'::regclass);
 _   ALTER TABLE "starSchemaV1_7".location_type_classification_bridge ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_7       postgres    false    300    301    301            N           2604    187018    material_class_bridge id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_7".material_class_bridge ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_7".material_class_bridge_id_seq'::regclass);
 Q   ALTER TABLE "starSchemaV1_7".material_class_bridge ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_7       postgres    false    298    299    299            M           2604    186997    material_definition_bridge id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_7".material_definition_bridge ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_7".material_definition_bridge_id_seq'::regclass);
 V   ALTER TABLE "starSchemaV1_7".material_definition_bridge ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_7       postgres    false    297    296    297            L           2604    186976    material_lot_bridge id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_7".material_lot_bridge ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_7".material_lot_bridge_id_seq'::regclass);
 O   ALTER TABLE "starSchemaV1_7".material_lot_bridge ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_7       postgres    false    294    295    295            K           2604    186955    material_sublot_bridge id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_7".material_sublot_bridge ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_7".material_sublot_bridge_id_seq'::regclass);
 R   ALTER TABLE "starSchemaV1_7".material_sublot_bridge ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_7       postgres    false    293    292    293            J           2604    186934 2   operation_definition_type_classification_bridge id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_7".operation_definition_type_classification_bridge ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_7".operation_definition_type_classification_bridge_id_seq'::regclass);
 k   ALTER TABLE "starSchemaV1_7".operation_definition_type_classification_bridge ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_7       postgres    false    290    291    291            I           2604    186913 '   operation_request_composition_bridge id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_7".operation_request_composition_bridge ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_7".operation_request_composition_bridge_id_seq'::regclass);
 `   ALTER TABLE "starSchemaV1_7".operation_request_composition_bridge ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_7       postgres    false    289    288    289            H           2604    186892 '   operation_segment_composition_bridge id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_7".operation_segment_composition_bridge ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_7".operation_segment_composition_bridge_id_seq'::regclass);
 `   ALTER TABLE "starSchemaV1_7".operation_segment_composition_bridge ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_7       postgres    false    287    286    287            G           2604    186871     operation_segment_type_bridge id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_7".operation_segment_type_bridge ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_7".operation_segment_type_bridge_id_seq'::regclass);
 Y   ALTER TABLE "starSchemaV1_7".operation_segment_type_bridge ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_7       postgres    false    285    284    285            F           2604    186850 '   personnel_type_classification_bridge id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_7".personnel_type_classification_bridge ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_7".personnel_type_classification_bridge_id_seq'::regclass);
 `   ALTER TABLE "starSchemaV1_7".personnel_type_classification_bridge ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_7       postgres    false    283    282    283            E           2604    186829 %   process_segment_composition_bridge id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_7".process_segment_composition_bridge ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_7".process_segment_composition_bridge_id_seq'::regclass);
 ^   ALTER TABLE "starSchemaV1_7".process_segment_composition_bridge ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_7       postgres    false    280    281    281            D           2604    186808 *   process_segment_type_composition_bridge id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_7".process_segment_type_composition_bridge ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_7".process_segment_type_composition_bridge_id_seq'::regclass);
 c   ALTER TABLE "starSchemaV1_7".process_segment_type_composition_bridge ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_7       postgres    false    279    278    279            C           2604    186787 )   segment_requirement_composition_bridge id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_7".segment_requirement_composition_bridge ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_7".segment_requirement_composition_bridge_id_seq'::regclass);
 b   ALTER TABLE "starSchemaV1_7".segment_requirement_composition_bridge ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_7       postgres    false    277    276    277            B           2604    186766 &   segment_response_composition_bridge id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_7".segment_response_composition_bridge ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_7".segment_response_composition_bridge_id_seq'::regclass);
 _   ALTER TABLE "starSchemaV1_7".segment_response_composition_bridge ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_7       postgres    false    275    274    275            A           2604    186745 $   sensor_type_classification_bridge id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_7".sensor_type_classification_bridge ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_7".sensor_type_classification_bridge_id_seq'::regclass);
 ]   ALTER TABLE "starSchemaV1_7".sensor_type_classification_bridge ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_7       postgres    false    273    272    273            @           2604    186724 "   team_type_classification_bridge id    DEFAULT     �   ALTER TABLE ONLY "starSchemaV1_7".team_type_classification_bridge ALTER COLUMN id SET DEFAULT nextval('"starSchemaV1_7".team_type_classification_bridge_id_seq'::regclass);
 [   ALTER TABLE "starSchemaV1_7".team_type_classification_bridge ALTER COLUMN id DROP DEFAULT;
       starSchemaV1_7       postgres    false    271    270    271            �          0    175467    customer_dimensional_bridge 
   TABLE DATA               v   COPY "starSchemaV1_5".customer_dimensional_bridge (parent_id, child_id, level, top_flag, bottom_flag, id) FROM stdin;
    starSchemaV1_5       postgres    false    198   S      �          0    175473    dim_customer 
   TABLE DATA               �   COPY "starSchemaV1_5".dim_customer (id, customer_code, customer_name, customer_type_code, customer_type_name, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_5       postgres    false    199   4S      �          0    175481    dim_date 
   TABLE DATA               �  COPY "starSchemaV1_5".dim_date (dateid, date_actual, epoch, day_suffix, day_name, day_of_week, day_of_month, day_of_quarter, day_of_year, week_of_month, week_of_year, week_of_year_iso, month_actual, month_name, month_name_abbreviated, quarter_actual, quarter_name, year_actual, first_day_of_week, last_day_of_week, first_day_of_month, last_day_of_month, first_day_of_quarter, last_day_of_quarter, first_day_of_year, last_day_of_year, mmyyyy, mmddyyyy, weekend_indr) FROM stdin;
    starSchemaV1_5       postgres    false    201   QS      �          0    175484    dim_equipment 
   TABLE DATA               �   COPY "starSchemaV1_5".dim_equipment (id, equipment_code, equipment_name, equipment_level, equipment_type_code, equipment_type_name, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_5       postgres    false    202   nS      �          0    175492    dim_location 
   TABLE DATA               �   COPY "starSchemaV1_5".dim_location (id, location_code, location_name, location_type_code, location_type_name, location_level, insert_date_time, last_update_date_time, date_flag) FROM stdin;
    starSchemaV1_5       postgres    false    204   �T      �          0    175500    dim_material 
   TABLE DATA                 COPY "starSchemaV1_5".dim_material (id, material_code, material_name, material_type_code, material_type_name, material_lot_code, material_lot_name, material_sub_lot_code, material_sub_lot_name, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_5       postgres    false    206   �T      �          0    175508    dim_operation_definition 
   TABLE DATA               *  COPY "starSchemaV1_5".dim_operation_definition (id, operation_definition_code, operation_definition_name, operation_definition_version, operations_type_definition, operations_type_segment, operation_segment_code, operation_segment_name, operation_definition_type_code, operation_definition_type_name, operation_segment_type_code, operation_segment_type_name, personnel_specification_code, personnel_specification_name, equipment_specification_code, equipment_specification_name, material_specification_code, material_specification_name, material_specification_use, operation_bill_of_material_code, operation_bill_of_material_name, operation_bill_of_material_item_code, operation_bill_of_material_item_name, operation_bill_of_material_item_use, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_5       postgres    false    208   IX      �          0    175514    dim_operation_request 
   TABLE DATA               T  COPY "starSchemaV1_5".dim_operation_request (id, operation_request_code, operation_request_name, segment_requirement_code, segment_requirement_name, personnel_requirement_code, personnel_requirement_name, equipment_requirement_code, equipment_requirement_name, material_requirement_code, material_requirement_name, material_requirement_use, requirement_bill_of_material_code, requirement_bill_of_material_name, requirement_bill_of_material_item_code, requirement_bill_of_material_item_name, requirement_bill_of_material_item_use, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_5       postgres    false    209   �Z      �          0    175522    dim_operation_response 
   TABLE DATA               $  COPY "starSchemaV1_5".dim_operation_response (id, operation_response_code, operation_response_name, segment_response_code, segment_response_name, personnel_actual_code, personnel_actual_name, equipment_actual_code, equipment_actual_name, material_actual_code, material_actual_name, material_actual_use, execution_bill_of_material_code, execution_bill_of_material_name, execution_bill_of_material_item_code, execution_bill_of_material_item_name, execution_bill_of_material_item_use, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_5       postgres    false    211   ;[      �          0    175530    dim_personnel 
   TABLE DATA               �   COPY "starSchemaV1_5".dim_personnel (id, personnel_code, personnel_name, personnel_type_code, personnel_type_name, team_code, team_name, team_type_code, team_type_name, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_5       postgres    false    213   X[      �          0    175538    dim_process_segment 
   TABLE DATA                 COPY "starSchemaV1_5".dim_process_segment (id, process_segment_code, process_segment_name, operation_type, process_segment_type_code, process_segment_type_name, stream_code, stream_name, personnel_segment_specification_code, personnel_segment_specification_name, equipment_segment_specification_code, equipment_segment_specification_name, material_segment_specification_code, material_segment_specification_name, personnel_segment_specification_use, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_5       postgres    false    215   u[      �          0    175546    dim_record_type 
   TABLE DATA                 COPY "starSchemaV1_5".dim_record_type (id, record_dimension_table, record_concept, record_category, record_type, record_property_code, record_property_attribute, record_property_type, record_value, record_value_type, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_5       postgres    false    217   ;\      �          0    175554 
   dim_sensor 
   TABLE DATA               �   COPY "starSchemaV1_5".dim_sensor (id, sensor_code, sensor_name, sensor_type_code, sensor_type_name, tag_code, tag_name, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_5       postgres    false    219   X\      �          0    175562    dim_time 
   TABLE DATA               a   COPY "starSchemaV1_5".dim_time (time_id, five_minutes, quarter_hour, hour_id, shift) FROM stdin;
    starSchemaV1_5       postgres    false    221   u\      �          0    175565    equipment_composition_bridge 
   TABLE DATA               y   COPY "starSchemaV1_5".equipment_composition_bridge (parent_id, child_id, level, top_flag, bottom_flag, uuid) FROM stdin;
    starSchemaV1_5       postgres    false    222   �\      �          0    175571 $   equipment_type_classification_bridge 
   TABLE DATA               �   COPY "starSchemaV1_5".equipment_type_classification_bridge (parent_id, child_id, level, top_flag, bottom_flag, uuid) FROM stdin;
    starSchemaV1_5       postgres    false    223   �\      �          0    175577 
   fact_table 
   TABLE DATA               �  COPY "starSchemaV1_5".fact_table (date_id, time_id, location_id, personnel_id, equipment_id, material_id, process_segment_id, operation_definition_id, operation_request_id, operation_response_id, record_type_id, sensor_id, customer_id, record_count, value_min, value_q1, value_mean, value_q3, value_max, value_total, value_units, value_string, duration_min, duration_mean, duration_max, duration_total, duration_units) FROM stdin;
    starSchemaV1_5       postgres    false    224   ;]      �          0    175583    location_entity_bridge 
   TABLE DATA               q   COPY "starSchemaV1_5".location_entity_bridge (parent_id, child_id, level, top_flag, bottom_flag, id) FROM stdin;
    starSchemaV1_5       postgres    false    225   X]      �          0    175589 #   location_type_classification_bridge 
   TABLE DATA               ~   COPY "starSchemaV1_5".location_type_classification_bridge (parent_id, child_id, level, top_flag, bottom_flag, id) FROM stdin;
    starSchemaV1_5       postgres    false    226   u]      �          0    175595    material_class_bridge 
   TABLE DATA               r   COPY "starSchemaV1_5".material_class_bridge (parent_id, child_id, level, top_flag, bottom_flag, uuid) FROM stdin;
    starSchemaV1_5       postgres    false    227   �]      �          0    175601    material_definition_bridge 
   TABLE DATA               w   COPY "starSchemaV1_5".material_definition_bridge (parent_id, child_id, level, top_flag, bottom_flag, uuid) FROM stdin;
    starSchemaV1_5       postgres    false    228   �]      �          0    175607    material_lot_bridge 
   TABLE DATA               n   COPY "starSchemaV1_5".material_lot_bridge (parent_id, child_id, level, top_flag, bottom_flag, id) FROM stdin;
    starSchemaV1_5       postgres    false    229   �^      �          0    175613    material_sublot_bridge 
   TABLE DATA               q   COPY "starSchemaV1_5".material_sublot_bridge (parent_id, child_id, level, top_flag, bottom_flag, id) FROM stdin;
    starSchemaV1_5       postgres    false    230   _      �          0    175619 /   operation_definition_type_classification_bridge 
   TABLE DATA               �   COPY "starSchemaV1_5".operation_definition_type_classification_bridge (parent_id, child_id, level, top_flag, bottom_flag, id) FROM stdin;
    starSchemaV1_5       postgres    false    231   "_      �          0    175625 $   operation_request_composition_bridge 
   TABLE DATA                  COPY "starSchemaV1_5".operation_request_composition_bridge (parent_id, child_id, level, top_flag, bottom_flag, id) FROM stdin;
    starSchemaV1_5       postgres    false    232   K_      �          0    175631 $   operation_segment_composition_bridge 
   TABLE DATA                  COPY "starSchemaV1_5".operation_segment_composition_bridge (parent_id, child_id, level, top_flag, bottom_flag, id) FROM stdin;
    starSchemaV1_5       postgres    false    233   z_      �          0    175637    operation_segment_type_bridge 
   TABLE DATA               x   COPY "starSchemaV1_5".operation_segment_type_bridge (parent_id, child_id, level, top_flag, bottom_flag, id) FROM stdin;
    starSchemaV1_5       postgres    false    234   �_      �          0    175643 $   personnel_type_classification_bridge 
   TABLE DATA                  COPY "starSchemaV1_5".personnel_type_classification_bridge (parent_id, child_id, level, top_flag, bottom_flag, id) FROM stdin;
    starSchemaV1_5       postgres    false    235   �_      �          0    175649 "   process_segment_composition_bridge 
   TABLE DATA                  COPY "starSchemaV1_5".process_segment_composition_bridge (parent_id, child_id, level, top_flag, bottom_flag, uuid) FROM stdin;
    starSchemaV1_5       postgres    false    236   �_      �          0    175655 '   process_segment_type_composition_bridge 
   TABLE DATA               �   COPY "starSchemaV1_5".process_segment_type_composition_bridge (parent_id, child_id, level, top_flag, bottom_flag, uuid) FROM stdin;
    starSchemaV1_5       postgres    false    237   `      �          0    175661 &   segment_requirement_composition_bridge 
   TABLE DATA               �   COPY "starSchemaV1_5".segment_requirement_composition_bridge (parent_id, child_id, level, top_flag, bottom_flag, id) FROM stdin;
    starSchemaV1_5       postgres    false    238   K`      �          0    175667 #   segment_response_composition_bridge 
   TABLE DATA               ~   COPY "starSchemaV1_5".segment_response_composition_bridge (parent_id, child_id, level, top_flag, bottom_flag, id) FROM stdin;
    starSchemaV1_5       postgres    false    239   �`      �          0    175673 !   sensor_type_classification_bridge 
   TABLE DATA               ~   COPY "starSchemaV1_5".sensor_type_classification_bridge (parent_id, child_id, level, top_flag, bottom_flag, uuid) FROM stdin;
    starSchemaV1_5       postgres    false    240   �`      �          0    175679    team_type_classification_bridge 
   TABLE DATA               z   COPY "starSchemaV1_5".team_type_classification_bridge (parent_id, child_id, level, top_flag, bottom_flag, id) FROM stdin;
    starSchemaV1_5       postgres    false    241   �`      4          0    187203    customer_type_bridge 
   TABLE DATA               �   COPY "starSchemaV1_7".customer_type_bridge (id, parent_id, child_id, level, top_flag, bottom_flag, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_7       postgres    false    310   �`                0    186710    dim_customer 
   TABLE DATA               �   COPY "starSchemaV1_7".dim_customer (id, customer_code, customer_name, customer_type_code, customer_type_name, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_7       postgres    false    269   �`      	          0    186703    dim_date 
   TABLE DATA               �  COPY "starSchemaV1_7".dim_date (dateid, date_actual, epoch, day_suffix, day_name, day_of_week, day_of_month, day_of_quarter, day_of_year, week_of_month, week_of_year, week_of_year_iso, month_actual, month_name, month_name_abbreviated, quarter_actual, quarter_name, year_actual, first_day_of_week, last_day_of_week, first_day_of_month, last_day_of_month, first_day_of_quarter, last_day_of_quarter, first_day_of_year, last_day_of_year, mmyyyy, mmddyyyy, weekend_indr) FROM stdin;
    starSchemaV1_7       postgres    false    267   a                0    186694    dim_equipment 
   TABLE DATA               �   COPY "starSchemaV1_7".dim_equipment (id, equipment_code, equipment_name, equipment_level, equipment_type_code, equipment_type_name, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_7       postgres    false    266   6a                0    186683 	   dim_event 
   TABLE DATA               �   COPY "starSchemaV1_7".dim_event (id, concept_dimension_source, event_concept, abstract_event_type_code, abstract_event_type_name, concrete_event_type_code, concrete_event_type_name, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_7       postgres    false    264   _b                0    186672    dim_kpi 
   TABLE DATA               �   COPY "starSchemaV1_7".dim_kpi (id, concept_dimension_source, kpi_concept, kpi_category, kpi_type_code, kpi_type_name, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_7       postgres    false    262   �c                0    186661    dim_location 
   TABLE DATA               �   COPY "starSchemaV1_7".dim_location (id, location_code, location_name, location_type_code, location_type_name, location_level, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_7       postgres    false    260   fe                 0    186650    dim_material 
   TABLE DATA                 COPY "starSchemaV1_7".dim_material (id, material_code, material_name, material_type_code, material_type_name, material_lot_code, material_lot_name, material_sub_lot_code, material_sub_lot_name, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_7       postgres    false    258   �e      �          0    186639    dim_operation_definition 
   TABLE DATA               *  COPY "starSchemaV1_7".dim_operation_definition (id, operation_definition_code, operation_definition_name, operation_definition_version, operations_type_definition, operations_type_segment, operation_segment_code, operation_segment_name, operation_definition_type_code, operation_definition_type_name, operation_segment_type_code, operation_segment_type_name, personnel_specification_code, personnel_specification_name, equipment_specification_code, equipment_specification_name, material_specification_code, material_specification_name, material_specification_use, operation_bill_of_material_code, operation_bill_of_material_name, operation_bill_of_material_item_code, operation_bill_of_material_item_name, operation_bill_of_material_item_use, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_7       postgres    false    256   i      �          0    186628    dim_operation_request 
   TABLE DATA               T  COPY "starSchemaV1_7".dim_operation_request (id, operation_request_code, operation_request_name, segment_requirement_code, segment_requirement_name, personnel_requirement_code, personnel_requirement_name, equipment_requirement_code, equipment_requirement_name, material_requirement_code, material_requirement_name, material_requirement_use, requirement_bill_of_material_code, requirement_bill_of_material_name, requirement_bill_of_material_item_code, requirement_bill_of_material_item_name, requirement_bill_of_material_item_use, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_7       postgres    false    254   rk      �          0    186617    dim_operation_response 
   TABLE DATA               $  COPY "starSchemaV1_7".dim_operation_response (id, operation_response_code, operation_response_name, segment_response_code, segment_response_name, personnel_actual_code, personnel_actual_name, equipment_actual_code, equipment_actual_name, material_actual_code, material_actual_name, material_actual_use, execution_bill_of_material_code, execution_bill_of_material_name, execution_bill_of_material_item_code, execution_bill_of_material_item_name, execution_bill_of_material_item_use, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_7       postgres    false    252   
l      �          0    186606    dim_personnel 
   TABLE DATA               �   COPY "starSchemaV1_7".dim_personnel (id, personnel_code, personnel_name, personnel_type_code, personnel_type_name, team_code, team_name, team_type_code, team_type_name, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_7       postgres    false    250   'l      �          0    186595    dim_process_segment 
   TABLE DATA                 COPY "starSchemaV1_7".dim_process_segment (id, process_segment_code, process_segment_name, operation_type, process_segment_type_code, process_segment_type_name, stream_code, stream_name, personnel_segment_specification_code, personnel_segment_specification_name, equipment_segment_specification_code, equipment_segment_specification_name, material_segment_specification_code, material_segment_specification_name, personnel_segment_specification_use, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_7       postgres    false    248   Dl      �          0    186584    dim_property_definition 
   TABLE DATA               �   COPY "starSchemaV1_7".dim_property_definition (id, concept_dimension_source, property_concept, property_type, property_code, property_name, attribute, value, value_type, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_7       postgres    false    246   
m      �          0    186573 
   dim_sensor 
   TABLE DATA               �   COPY "starSchemaV1_7".dim_sensor (id, sensor_type_code, sensor_type_name, sensor_code, sensor_name, tag_code, tag_name, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_7       postgres    false    244   �q      �          0    186566    dim_time 
   TABLE DATA               a   COPY "starSchemaV1_7".dim_time (time_id, five_minutes, quarter_hour, hour_id, shift) FROM stdin;
    starSchemaV1_7       postgres    false    242   �q      2          0    187182    equipment_composition_bridge 
   TABLE DATA               �   COPY "starSchemaV1_7".equipment_composition_bridge (id, parent_id, child_id, level, top_flag, bottom_flag, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_7       postgres    false    308   �q      0          0    187161 $   equipment_type_classification_bridge 
   TABLE DATA               �   COPY "starSchemaV1_7".equipment_type_classification_bridge (id, parent_id, child_id, level, top_flag, bottom_flag, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_7       postgres    false    306   Lr      .          0    187076 
   fact_table 
   TABLE DATA               �  COPY "starSchemaV1_7".fact_table (date_id, time_id, location_id, personnel_id, equipment_id, material_id, process_segment_id, operation_definition_id, operation_request_id, operation_response_id, sensor_id, customer_id, event_id, kpi_id, record_count, value_min, value_q1, value_mean, value_q3, value_max, value_total, value_units, value_string, duration_min, duration_mean, duration_max, duration_total, duration_units, property_definition_id) FROM stdin;
    starSchemaV1_7       postgres    false    304   �r      -          0    187057    location_entity_bridge 
   TABLE DATA               �   COPY "starSchemaV1_7".location_entity_bridge (id, parent_id, child_id, level, top_flag, bottom_flag, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_7       postgres    false    303   s      +          0    187036 #   location_type_classification_bridge 
   TABLE DATA               �   COPY "starSchemaV1_7".location_type_classification_bridge (id, parent_id, child_id, level, top_flag, bottom_flag, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_7       postgres    false    301   !s      )          0    187015    material_class_bridge 
   TABLE DATA               �   COPY "starSchemaV1_7".material_class_bridge (id, parent_id, child_id, level, top_flag, bottom_flag, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_7       postgres    false    299   >s      '          0    186994    material_definition_bridge 
   TABLE DATA               �   COPY "starSchemaV1_7".material_definition_bridge (id, parent_id, child_id, level, top_flag, bottom_flag, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_7       postgres    false    297   [s      %          0    186973    material_lot_bridge 
   TABLE DATA               �   COPY "starSchemaV1_7".material_lot_bridge (id, parent_id, child_id, level, top_flag, bottom_flag, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_7       postgres    false    295   xs      #          0    186952    material_sublot_bridge 
   TABLE DATA               �   COPY "starSchemaV1_7".material_sublot_bridge (id, parent_id, child_id, level, top_flag, bottom_flag, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_7       postgres    false    293   �s      !          0    186931 /   operation_definition_type_classification_bridge 
   TABLE DATA               �   COPY "starSchemaV1_7".operation_definition_type_classification_bridge (id, parent_id, child_id, level, top_flag, bottom_flag, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_7       postgres    false    291   �s                0    186910 $   operation_request_composition_bridge 
   TABLE DATA               �   COPY "starSchemaV1_7".operation_request_composition_bridge (id, parent_id, child_id, level, top_flag, bottom_flag, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_7       postgres    false    289   �s                0    186889 $   operation_segment_composition_bridge 
   TABLE DATA               �   COPY "starSchemaV1_7".operation_segment_composition_bridge (id, parent_id, child_id, level, top_flag, bottom_flag, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_7       postgres    false    287   �s                0    186868    operation_segment_type_bridge 
   TABLE DATA               �   COPY "starSchemaV1_7".operation_segment_type_bridge (id, parent_id, child_id, level, top_flag, bottom_flag, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_7       postgres    false    285   	t                0    186847 $   personnel_type_classification_bridge 
   TABLE DATA               �   COPY "starSchemaV1_7".personnel_type_classification_bridge (id, parent_id, child_id, level, top_flag, bottom_flag, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_7       postgres    false    283   &t                0    186826 "   process_segment_composition_bridge 
   TABLE DATA               �   COPY "starSchemaV1_7".process_segment_composition_bridge (id, parent_id, child_id, level, top_flag, bottom_flag, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_7       postgres    false    281   Ct                0    186805 '   process_segment_type_composition_bridge 
   TABLE DATA               �   COPY "starSchemaV1_7".process_segment_type_composition_bridge (id, parent_id, child_id, level, top_flag, bottom_flag, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_7       postgres    false    279   `t                0    186784 &   segment_requirement_composition_bridge 
   TABLE DATA               �   COPY "starSchemaV1_7".segment_requirement_composition_bridge (id, parent_id, child_id, level, top_flag, bottom_flag, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_7       postgres    false    277   }t                0    186763 #   segment_response_composition_bridge 
   TABLE DATA               �   COPY "starSchemaV1_7".segment_response_composition_bridge (id, parent_id, child_id, level, top_flag, bottom_flag, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_7       postgres    false    275   �t                0    186742 !   sensor_type_classification_bridge 
   TABLE DATA               �   COPY "starSchemaV1_7".sensor_type_classification_bridge (id, parent_id, child_id, level, top_flag, bottom_flag, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_7       postgres    false    273   �t                0    186721    team_type_classification_bridge 
   TABLE DATA               �   COPY "starSchemaV1_7".team_type_classification_bridge (id, parent_id, child_id, level, top_flag, bottom_flag, insert_date_time, last_update_date_time, delete_flag) FROM stdin;
    starSchemaV1_7       postgres    false    271   �t      g           0    0    dim_customer_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('"starSchemaV1_5".dim_customer_id_seq', 1, false);
            starSchemaV1_5       postgres    false    200            h           0    0    dim_equipment_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('"starSchemaV1_5".dim_equipment_id_seq', 1, false);
            starSchemaV1_5       postgres    false    203            i           0    0    dim_location_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('"starSchemaV1_5".dim_location_id_seq', 1, false);
            starSchemaV1_5       postgres    false    205            j           0    0    dim_material_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('"starSchemaV1_5".dim_material_id_seq', 1, false);
            starSchemaV1_5       postgres    false    207            k           0    0    dim_operation_request_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('"starSchemaV1_5".dim_operation_request_id_seq', 1, false);
            starSchemaV1_5       postgres    false    210            l           0    0    dim_operation_response_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('"starSchemaV1_5".dim_operation_response_id_seq', 1, false);
            starSchemaV1_5       postgres    false    212            m           0    0    dim_personnel_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('"starSchemaV1_5".dim_personnel_id_seq', 1, false);
            starSchemaV1_5       postgres    false    214            n           0    0    dim_process_segment_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('"starSchemaV1_5".dim_process_segment_id_seq', 1, false);
            starSchemaV1_5       postgres    false    216            o           0    0    dim_record_type_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('"starSchemaV1_5".dim_record_type_id_seq', 1, false);
            starSchemaV1_5       postgres    false    218            p           0    0    dim_sensor_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('"starSchemaV1_5".dim_sensor_id_seq', 1, false);
            starSchemaV1_5       postgres    false    220            q           0    0    customer_type_bridge_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('"starSchemaV1_7".customer_type_bridge_id_seq', 1, false);
            starSchemaV1_7       postgres    false    309            r           0    0    dim_customer_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('"starSchemaV1_7".dim_customer_id_seq', 1, false);
            starSchemaV1_7       postgres    false    268            s           0    0    dim_equipment_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('"starSchemaV1_7".dim_equipment_id_seq', 1, false);
            starSchemaV1_7       postgres    false    265            t           0    0    dim_event_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('"starSchemaV1_7".dim_event_id_seq', 1, false);
            starSchemaV1_7       postgres    false    263            u           0    0    dim_kpi_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('"starSchemaV1_7".dim_kpi_id_seq', 1, false);
            starSchemaV1_7       postgres    false    261            v           0    0    dim_location_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('"starSchemaV1_7".dim_location_id_seq', 1, false);
            starSchemaV1_7       postgres    false    259            w           0    0    dim_material_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('"starSchemaV1_7".dim_material_id_seq', 1, false);
            starSchemaV1_7       postgres    false    257            x           0    0    dim_operation_definition_id_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('"starSchemaV1_7".dim_operation_definition_id_seq', 1, false);
            starSchemaV1_7       postgres    false    255            y           0    0    dim_operation_request_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('"starSchemaV1_7".dim_operation_request_id_seq', 1, false);
            starSchemaV1_7       postgres    false    253            z           0    0    dim_operation_response_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('"starSchemaV1_7".dim_operation_response_id_seq', 1, false);
            starSchemaV1_7       postgres    false    251            {           0    0    dim_personnel_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('"starSchemaV1_7".dim_personnel_id_seq', 1, false);
            starSchemaV1_7       postgres    false    249            |           0    0    dim_process_segment_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('"starSchemaV1_7".dim_process_segment_id_seq', 1, false);
            starSchemaV1_7       postgres    false    247            }           0    0    dim_property_definition_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('"starSchemaV1_7".dim_property_definition_id_seq', 1, false);
            starSchemaV1_7       postgres    false    245            ~           0    0    dim_sensor_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('"starSchemaV1_7".dim_sensor_id_seq', 1, false);
            starSchemaV1_7       postgres    false    243                       0    0 #   equipment_composition_bridge_id_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('"starSchemaV1_7".equipment_composition_bridge_id_seq', 1, false);
            starSchemaV1_7       postgres    false    307            �           0    0 +   equipment_type_classification_bridge_id_seq    SEQUENCE SET     d   SELECT pg_catalog.setval('"starSchemaV1_7".equipment_type_classification_bridge_id_seq', 1, false);
            starSchemaV1_7       postgres    false    305            �           0    0    location_entity_bridge_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('"starSchemaV1_7".location_entity_bridge_id_seq', 1, false);
            starSchemaV1_7       postgres    false    302            �           0    0 *   location_type_classification_bridge_id_seq    SEQUENCE SET     c   SELECT pg_catalog.setval('"starSchemaV1_7".location_type_classification_bridge_id_seq', 1, false);
            starSchemaV1_7       postgres    false    300            �           0    0    material_class_bridge_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('"starSchemaV1_7".material_class_bridge_id_seq', 1, false);
            starSchemaV1_7       postgres    false    298            �           0    0 !   material_definition_bridge_id_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('"starSchemaV1_7".material_definition_bridge_id_seq', 1, false);
            starSchemaV1_7       postgres    false    296            �           0    0    material_lot_bridge_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('"starSchemaV1_7".material_lot_bridge_id_seq', 1, false);
            starSchemaV1_7       postgres    false    294            �           0    0    material_sublot_bridge_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('"starSchemaV1_7".material_sublot_bridge_id_seq', 1, false);
            starSchemaV1_7       postgres    false    292            �           0    0 6   operation_definition_type_classification_bridge_id_seq    SEQUENCE SET     o   SELECT pg_catalog.setval('"starSchemaV1_7".operation_definition_type_classification_bridge_id_seq', 1, false);
            starSchemaV1_7       postgres    false    290            �           0    0 +   operation_request_composition_bridge_id_seq    SEQUENCE SET     d   SELECT pg_catalog.setval('"starSchemaV1_7".operation_request_composition_bridge_id_seq', 1, false);
            starSchemaV1_7       postgres    false    288            �           0    0 +   operation_segment_composition_bridge_id_seq    SEQUENCE SET     d   SELECT pg_catalog.setval('"starSchemaV1_7".operation_segment_composition_bridge_id_seq', 1, false);
            starSchemaV1_7       postgres    false    286            �           0    0 $   operation_segment_type_bridge_id_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('"starSchemaV1_7".operation_segment_type_bridge_id_seq', 1, false);
            starSchemaV1_7       postgres    false    284            �           0    0 +   personnel_type_classification_bridge_id_seq    SEQUENCE SET     d   SELECT pg_catalog.setval('"starSchemaV1_7".personnel_type_classification_bridge_id_seq', 1, false);
            starSchemaV1_7       postgres    false    282            �           0    0 )   process_segment_composition_bridge_id_seq    SEQUENCE SET     b   SELECT pg_catalog.setval('"starSchemaV1_7".process_segment_composition_bridge_id_seq', 1, false);
            starSchemaV1_7       postgres    false    280            �           0    0 .   process_segment_type_composition_bridge_id_seq    SEQUENCE SET     g   SELECT pg_catalog.setval('"starSchemaV1_7".process_segment_type_composition_bridge_id_seq', 1, false);
            starSchemaV1_7       postgres    false    278            �           0    0 -   segment_requirement_composition_bridge_id_seq    SEQUENCE SET     f   SELECT pg_catalog.setval('"starSchemaV1_7".segment_requirement_composition_bridge_id_seq', 1, false);
            starSchemaV1_7       postgres    false    276            �           0    0 *   segment_response_composition_bridge_id_seq    SEQUENCE SET     c   SELECT pg_catalog.setval('"starSchemaV1_7".segment_response_composition_bridge_id_seq', 1, false);
            starSchemaV1_7       postgres    false    274            �           0    0 (   sensor_type_classification_bridge_id_seq    SEQUENCE SET     a   SELECT pg_catalog.setval('"starSchemaV1_7".sensor_type_classification_bridge_id_seq', 1, false);
            starSchemaV1_7       postgres    false    272            �           0    0 &   team_type_classification_bridge_id_seq    SEQUENCE SET     _   SELECT pg_catalog.setval('"starSchemaV1_7".team_type_classification_bridge_id_seq', 1, false);
            starSchemaV1_7       postgres    false    270            W           2606    175696    dim_customer dim_customer_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY "starSchemaV1_5".dim_customer
    ADD CONSTRAINT dim_customer_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY "starSchemaV1_5".dim_customer DROP CONSTRAINT dim_customer_pkey;
       starSchemaV1_5         postgres    false    199            \           2606    175698     dim_equipment dim_equipment_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY "starSchemaV1_5".dim_equipment
    ADD CONSTRAINT dim_equipment_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY "starSchemaV1_5".dim_equipment DROP CONSTRAINT dim_equipment_pkey;
       starSchemaV1_5         postgres    false    202            ^           2606    175700    dim_location dim_location_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY "starSchemaV1_5".dim_location
    ADD CONSTRAINT dim_location_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY "starSchemaV1_5".dim_location DROP CONSTRAINT dim_location_pkey;
       starSchemaV1_5         postgres    false    204            `           2606    175702    dim_material dim_material_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY "starSchemaV1_5".dim_material
    ADD CONSTRAINT dim_material_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY "starSchemaV1_5".dim_material DROP CONSTRAINT dim_material_pkey;
       starSchemaV1_5         postgres    false    206            b           2606    175704 6   dim_operation_definition dim_operation_definition_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY "starSchemaV1_5".dim_operation_definition
    ADD CONSTRAINT dim_operation_definition_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY "starSchemaV1_5".dim_operation_definition DROP CONSTRAINT dim_operation_definition_pkey;
       starSchemaV1_5         postgres    false    208            d           2606    175706 0   dim_operation_request dim_operation_request_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY "starSchemaV1_5".dim_operation_request
    ADD CONSTRAINT dim_operation_request_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY "starSchemaV1_5".dim_operation_request DROP CONSTRAINT dim_operation_request_pkey;
       starSchemaV1_5         postgres    false    209            f           2606    175708 2   dim_operation_response dim_operation_response_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY "starSchemaV1_5".dim_operation_response
    ADD CONSTRAINT dim_operation_response_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY "starSchemaV1_5".dim_operation_response DROP CONSTRAINT dim_operation_response_pkey;
       starSchemaV1_5         postgres    false    211            h           2606    175710     dim_personnel dim_personnel_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY "starSchemaV1_5".dim_personnel
    ADD CONSTRAINT dim_personnel_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY "starSchemaV1_5".dim_personnel DROP CONSTRAINT dim_personnel_pkey;
       starSchemaV1_5         postgres    false    213            j           2606    175712 ,   dim_process_segment dim_process_segment_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY "starSchemaV1_5".dim_process_segment
    ADD CONSTRAINT dim_process_segment_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY "starSchemaV1_5".dim_process_segment DROP CONSTRAINT dim_process_segment_pkey;
       starSchemaV1_5         postgres    false    215            l           2606    175714 $   dim_record_type dim_record_type_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY "starSchemaV1_5".dim_record_type
    ADD CONSTRAINT dim_record_type_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY "starSchemaV1_5".dim_record_type DROP CONSTRAINT dim_record_type_pkey;
       starSchemaV1_5         postgres    false    217            n           2606    175716    dim_sensor dim_sensor_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY "starSchemaV1_5".dim_sensor
    ADD CONSTRAINT dim_sensor_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY "starSchemaV1_5".dim_sensor DROP CONSTRAINT dim_sensor_pkey;
       starSchemaV1_5         postgres    false    219            p           2606    175718    dim_time dim_time_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY "starSchemaV1_5".dim_time
    ADD CONSTRAINT dim_time_pkey PRIMARY KEY (time_id);
 J   ALTER TABLE ONLY "starSchemaV1_5".dim_time DROP CONSTRAINT dim_time_pkey;
       starSchemaV1_5         postgres    false    221            Z           2606    175720    dim_date dimdate_dim_id_pk1 
   CONSTRAINT     l   ALTER TABLE ONLY "starSchemaV1_5".dim_date
    ADD CONSTRAINT dimdate_dim_id_pk1 PRIMARY KEY (date_actual);
 O   ALTER TABLE ONLY "starSchemaV1_5".dim_date DROP CONSTRAINT dimdate_dim_id_pk1;
       starSchemaV1_5         postgres    false    201            r           2606    175722 H   equipment_composition_bridge equipment_composition_dimension_bridge_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".equipment_composition_bridge
    ADD CONSTRAINT equipment_composition_dimension_bridge_pkey PRIMARY KEY (uuid);
 |   ALTER TABLE ONLY "starSchemaV1_5".equipment_composition_bridge DROP CONSTRAINT equipment_composition_dimension_bridge_pkey;
       starSchemaV1_5         postgres    false    222            t           2606    175724 X   equipment_type_classification_bridge equipment_type_classification_dimension_bridge_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".equipment_type_classification_bridge
    ADD CONSTRAINT equipment_type_classification_dimension_bridge_pkey PRIMARY KEY (uuid);
 �   ALTER TABLE ONLY "starSchemaV1_5".equipment_type_classification_bridge DROP CONSTRAINT equipment_type_classification_dimension_bridge_pkey;
       starSchemaV1_5         postgres    false    223            v           2606    175726 2   location_entity_bridge location_entity_bridge_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY "starSchemaV1_5".location_entity_bridge
    ADD CONSTRAINT location_entity_bridge_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY "starSchemaV1_5".location_entity_bridge DROP CONSTRAINT location_entity_bridge_pkey;
       starSchemaV1_5         postgres    false    225            x           2606    175728 =   location_type_classification_bridge location_type_bridge_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".location_type_classification_bridge
    ADD CONSTRAINT location_type_bridge_pkey PRIMARY KEY (id);
 q   ALTER TABLE ONLY "starSchemaV1_5".location_type_classification_bridge DROP CONSTRAINT location_type_bridge_pkey;
       starSchemaV1_5         postgres    false    226            z           2606    175730 :   material_class_bridge material_class_dimension_bridge_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".material_class_bridge
    ADD CONSTRAINT material_class_dimension_bridge_pkey PRIMARY KEY (uuid);
 n   ALTER TABLE ONLY "starSchemaV1_5".material_class_bridge DROP CONSTRAINT material_class_dimension_bridge_pkey;
       starSchemaV1_5         postgres    false    227            |           2606    175732 D   material_definition_bridge material_definition_dimension_bridge_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".material_definition_bridge
    ADD CONSTRAINT material_definition_dimension_bridge_pkey PRIMARY KEY (uuid);
 x   ALTER TABLE ONLY "starSchemaV1_5".material_definition_bridge DROP CONSTRAINT material_definition_dimension_bridge_pkey;
       starSchemaV1_5         postgres    false    228            ~           2606    175734 6   material_lot_bridge material_lot_dimension_bridge_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY "starSchemaV1_5".material_lot_bridge
    ADD CONSTRAINT material_lot_dimension_bridge_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY "starSchemaV1_5".material_lot_bridge DROP CONSTRAINT material_lot_dimension_bridge_pkey;
       starSchemaV1_5         postgres    false    229            �           2606    175736 <   material_sublot_bridge material_sublot_dimension_bridge_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".material_sublot_bridge
    ADD CONSTRAINT material_sublot_dimension_bridge_pkey PRIMARY KEY (id);
 p   ALTER TABLE ONLY "starSchemaV1_5".material_sublot_bridge DROP CONSTRAINT material_sublot_dimension_bridge_pkey;
       starSchemaV1_5         postgres    false    230            �           2606    175738 n   operation_definition_type_classification_bridge operation_definition_type_classification_dimension_bridge_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".operation_definition_type_classification_bridge
    ADD CONSTRAINT operation_definition_type_classification_dimension_bridge_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY "starSchemaV1_5".operation_definition_type_classification_bridge DROP CONSTRAINT operation_definition_type_classification_dimension_bridge_pkey;
       starSchemaV1_5         postgres    false    231            �           2606    175740 X   operation_request_composition_bridge operation_request_composition_dimension_bridge_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".operation_request_composition_bridge
    ADD CONSTRAINT operation_request_composition_dimension_bridge_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY "starSchemaV1_5".operation_request_composition_bridge DROP CONSTRAINT operation_request_composition_dimension_bridge_pkey;
       starSchemaV1_5         postgres    false    232            �           2606    175742 Y   operation_segment_type_bridge operation_segment_type_classification_dimension_bridge_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".operation_segment_type_bridge
    ADD CONSTRAINT operation_segment_type_classification_dimension_bridge_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY "starSchemaV1_5".operation_segment_type_bridge DROP CONSTRAINT operation_segment_type_classification_dimension_bridge_pkey;
       starSchemaV1_5         postgres    false    234            �           2606    175744 ]   operation_segment_composition_bridge operation_segment_type_composition_dimension_bridge_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".operation_segment_composition_bridge
    ADD CONSTRAINT operation_segment_type_composition_dimension_bridge_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY "starSchemaV1_5".operation_segment_composition_bridge DROP CONSTRAINT operation_segment_type_composition_dimension_bridge_pkey;
       starSchemaV1_5         postgres    false    233            U           2606    175746 A   customer_dimensional_bridge parent_customer_dimension_bridge_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".customer_dimensional_bridge
    ADD CONSTRAINT parent_customer_dimension_bridge_pkey PRIMARY KEY (id);
 u   ALTER TABLE ONLY "starSchemaV1_5".customer_dimensional_bridge DROP CONSTRAINT parent_customer_dimension_bridge_pkey;
       starSchemaV1_5         postgres    false    198            �           2606    175748 X   personnel_type_classification_bridge personnel_type_classification_dimension_bridge_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".personnel_type_classification_bridge
    ADD CONSTRAINT personnel_type_classification_dimension_bridge_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY "starSchemaV1_5".personnel_type_classification_bridge DROP CONSTRAINT personnel_type_classification_dimension_bridge_pkey;
       starSchemaV1_5         postgres    false    235            �           2606    175750 T   process_segment_composition_bridge process_segment_composition_dimension_bridge_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".process_segment_composition_bridge
    ADD CONSTRAINT process_segment_composition_dimension_bridge_pkey PRIMARY KEY (uuid);
 �   ALTER TABLE ONLY "starSchemaV1_5".process_segment_composition_bridge DROP CONSTRAINT process_segment_composition_dimension_bridge_pkey;
       starSchemaV1_5         postgres    false    236            �           2606    175752 ^   process_segment_type_composition_bridge process_segment_type_composition_dimension_bridge_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".process_segment_type_composition_bridge
    ADD CONSTRAINT process_segment_type_composition_dimension_bridge_pkey PRIMARY KEY (uuid);
 �   ALTER TABLE ONLY "starSchemaV1_5".process_segment_type_composition_bridge DROP CONSTRAINT process_segment_type_composition_dimension_bridge_pkey;
       starSchemaV1_5         postgres    false    237            �           2606    175754 \   segment_requirement_composition_bridge segment_requirement_composition_dimension_bridge_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".segment_requirement_composition_bridge
    ADD CONSTRAINT segment_requirement_composition_dimension_bridge_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY "starSchemaV1_5".segment_requirement_composition_bridge DROP CONSTRAINT segment_requirement_composition_dimension_bridge_pkey;
       starSchemaV1_5         postgres    false    238            �           2606    175756 V   segment_response_composition_bridge segment_response_composition_dimension_bridge_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".segment_response_composition_bridge
    ADD CONSTRAINT segment_response_composition_dimension_bridge_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY "starSchemaV1_5".segment_response_composition_bridge DROP CONSTRAINT segment_response_composition_dimension_bridge_pkey;
       starSchemaV1_5         postgres    false    239            �           2606    175758 R   sensor_type_classification_bridge sensor_type_classification_dimension_bridge_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".sensor_type_classification_bridge
    ADD CONSTRAINT sensor_type_classification_dimension_bridge_pkey PRIMARY KEY (uuid);
 �   ALTER TABLE ONLY "starSchemaV1_5".sensor_type_classification_bridge DROP CONSTRAINT sensor_type_classification_dimension_bridge_pkey;
       starSchemaV1_5         postgres    false    240            �           2606    175760 N   team_type_classification_bridge team_type_classification_dimension_bridge_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".team_type_classification_bridge
    ADD CONSTRAINT team_type_classification_dimension_bridge_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY "starSchemaV1_5".team_type_classification_bridge DROP CONSTRAINT team_type_classification_dimension_bridge_pkey;
       starSchemaV1_5         postgres    false    241            �           2606    186691    dim_event PK_dim_event 
   CONSTRAINT     `   ALTER TABLE ONLY "starSchemaV1_7".dim_event
    ADD CONSTRAINT "PK_dim_event" PRIMARY KEY (id);
 L   ALTER TABLE ONLY "starSchemaV1_7".dim_event DROP CONSTRAINT "PK_dim_event";
       starSchemaV1_7         postgres    false    264            �           2606    186680    dim_kpi PK_dim_kpi 
   CONSTRAINT     \   ALTER TABLE ONLY "starSchemaV1_7".dim_kpi
    ADD CONSTRAINT "PK_dim_kpi" PRIMARY KEY (id);
 H   ALTER TABLE ONLY "starSchemaV1_7".dim_kpi DROP CONSTRAINT "PK_dim_kpi";
       starSchemaV1_7         postgres    false    262            �           2606    186592 2   dim_property_definition PK_dim_property_definition 
   CONSTRAINT     |   ALTER TABLE ONLY "starSchemaV1_7".dim_property_definition
    ADD CONSTRAINT "PK_dim_property_definition" PRIMARY KEY (id);
 h   ALTER TABLE ONLY "starSchemaV1_7".dim_property_definition DROP CONSTRAINT "PK_dim_property_definition";
       starSchemaV1_7         postgres    false    246            �           2606    187083    fact_table PK_fact_table 
   CONSTRAINT     B  ALTER TABLE ONLY "starSchemaV1_7".fact_table
    ADD CONSTRAINT "PK_fact_table" PRIMARY KEY (date_id, time_id, location_id, personnel_id, equipment_id, material_id, process_segment_id, operation_definition_id, operation_request_id, operation_response_id, sensor_id, customer_id, event_id, kpi_id, property_definition_id);
 N   ALTER TABLE ONLY "starSchemaV1_7".fact_table DROP CONSTRAINT "PK_fact_table";
       starSchemaV1_7         postgres    false    304    304    304    304    304    304    304    304    304    304    304    304    304    304    304            �           2606    186750 F   sensor_type_classification_bridge PK_sensor_type_classification_bridge 
   CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".sensor_type_classification_bridge
    ADD CONSTRAINT "PK_sensor_type_classification_bridge" PRIMARY KEY (id);
 |   ALTER TABLE ONLY "starSchemaV1_7".sensor_type_classification_bridge DROP CONSTRAINT "PK_sensor_type_classification_bridge";
       starSchemaV1_7         postgres    false    273            �           2606    186718    dim_customer dim_customer_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY "starSchemaV1_7".dim_customer
    ADD CONSTRAINT dim_customer_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY "starSchemaV1_7".dim_customer DROP CONSTRAINT dim_customer_pkey;
       starSchemaV1_7         postgres    false    269            �           2606    186702     dim_equipment dim_equipment_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY "starSchemaV1_7".dim_equipment
    ADD CONSTRAINT dim_equipment_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY "starSchemaV1_7".dim_equipment DROP CONSTRAINT dim_equipment_pkey;
       starSchemaV1_7         postgres    false    266            �           2606    186669    dim_location dim_location_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY "starSchemaV1_7".dim_location
    ADD CONSTRAINT dim_location_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY "starSchemaV1_7".dim_location DROP CONSTRAINT dim_location_pkey;
       starSchemaV1_7         postgres    false    260            �           2606    186658    dim_material dim_material_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY "starSchemaV1_7".dim_material
    ADD CONSTRAINT dim_material_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY "starSchemaV1_7".dim_material DROP CONSTRAINT dim_material_pkey;
       starSchemaV1_7         postgres    false    258            �           2606    186647 6   dim_operation_definition dim_operation_definition_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY "starSchemaV1_7".dim_operation_definition
    ADD CONSTRAINT dim_operation_definition_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY "starSchemaV1_7".dim_operation_definition DROP CONSTRAINT dim_operation_definition_pkey;
       starSchemaV1_7         postgres    false    256            �           2606    186636 0   dim_operation_request dim_operation_request_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY "starSchemaV1_7".dim_operation_request
    ADD CONSTRAINT dim_operation_request_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY "starSchemaV1_7".dim_operation_request DROP CONSTRAINT dim_operation_request_pkey;
       starSchemaV1_7         postgres    false    254            �           2606    186625 2   dim_operation_response dim_operation_response_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY "starSchemaV1_7".dim_operation_response
    ADD CONSTRAINT dim_operation_response_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY "starSchemaV1_7".dim_operation_response DROP CONSTRAINT dim_operation_response_pkey;
       starSchemaV1_7         postgres    false    252            �           2606    186614     dim_personnel dim_personnel_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY "starSchemaV1_7".dim_personnel
    ADD CONSTRAINT dim_personnel_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY "starSchemaV1_7".dim_personnel DROP CONSTRAINT dim_personnel_pkey;
       starSchemaV1_7         postgres    false    250            �           2606    186603 ,   dim_process_segment dim_process_segment_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY "starSchemaV1_7".dim_process_segment
    ADD CONSTRAINT dim_process_segment_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY "starSchemaV1_7".dim_process_segment DROP CONSTRAINT dim_process_segment_pkey;
       starSchemaV1_7         postgres    false    248            �           2606    186581    dim_sensor dim_sensor_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY "starSchemaV1_7".dim_sensor
    ADD CONSTRAINT dim_sensor_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY "starSchemaV1_7".dim_sensor DROP CONSTRAINT dim_sensor_pkey;
       starSchemaV1_7         postgres    false    244            �           2606    186570    dim_time dim_time_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY "starSchemaV1_7".dim_time
    ADD CONSTRAINT dim_time_pkey PRIMARY KEY (time_id);
 J   ALTER TABLE ONLY "starSchemaV1_7".dim_time DROP CONSTRAINT dim_time_pkey;
       starSchemaV1_7         postgres    false    242            �           2606    186707    dim_date dimdate_dim_id_pk1 
   CONSTRAINT     l   ALTER TABLE ONLY "starSchemaV1_7".dim_date
    ADD CONSTRAINT dimdate_dim_id_pk1 PRIMARY KEY (date_actual);
 O   ALTER TABLE ONLY "starSchemaV1_7".dim_date DROP CONSTRAINT dimdate_dim_id_pk1;
       starSchemaV1_7         postgres    false    267            �           2606    187190 H   equipment_composition_bridge equipment_composition_dimension_bridge_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".equipment_composition_bridge
    ADD CONSTRAINT equipment_composition_dimension_bridge_pkey PRIMARY KEY (id);
 |   ALTER TABLE ONLY "starSchemaV1_7".equipment_composition_bridge DROP CONSTRAINT equipment_composition_dimension_bridge_pkey;
       starSchemaV1_7         postgres    false    308            �           2606    187169 X   equipment_type_classification_bridge equipment_type_classification_dimension_bridge_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".equipment_type_classification_bridge
    ADD CONSTRAINT equipment_type_classification_dimension_bridge_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY "starSchemaV1_7".equipment_type_classification_bridge DROP CONSTRAINT equipment_type_classification_dimension_bridge_pkey;
       starSchemaV1_7         postgres    false    306            �           2606    187065 2   location_entity_bridge location_entity_bridge_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY "starSchemaV1_7".location_entity_bridge
    ADD CONSTRAINT location_entity_bridge_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY "starSchemaV1_7".location_entity_bridge DROP CONSTRAINT location_entity_bridge_pkey;
       starSchemaV1_7         postgres    false    303            �           2606    187044 =   location_type_classification_bridge location_type_bridge_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".location_type_classification_bridge
    ADD CONSTRAINT location_type_bridge_pkey PRIMARY KEY (id);
 q   ALTER TABLE ONLY "starSchemaV1_7".location_type_classification_bridge DROP CONSTRAINT location_type_bridge_pkey;
       starSchemaV1_7         postgres    false    301            �           2606    187023 :   material_class_bridge material_class_dimension_bridge_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".material_class_bridge
    ADD CONSTRAINT material_class_dimension_bridge_pkey PRIMARY KEY (id);
 n   ALTER TABLE ONLY "starSchemaV1_7".material_class_bridge DROP CONSTRAINT material_class_dimension_bridge_pkey;
       starSchemaV1_7         postgres    false    299            �           2606    187002 D   material_definition_bridge material_definition_dimension_bridge_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".material_definition_bridge
    ADD CONSTRAINT material_definition_dimension_bridge_pkey PRIMARY KEY (id);
 x   ALTER TABLE ONLY "starSchemaV1_7".material_definition_bridge DROP CONSTRAINT material_definition_dimension_bridge_pkey;
       starSchemaV1_7         postgres    false    297            �           2606    186981 6   material_lot_bridge material_lot_dimension_bridge_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY "starSchemaV1_7".material_lot_bridge
    ADD CONSTRAINT material_lot_dimension_bridge_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY "starSchemaV1_7".material_lot_bridge DROP CONSTRAINT material_lot_dimension_bridge_pkey;
       starSchemaV1_7         postgres    false    295            �           2606    186960 <   material_sublot_bridge material_sublot_dimension_bridge_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".material_sublot_bridge
    ADD CONSTRAINT material_sublot_dimension_bridge_pkey PRIMARY KEY (id);
 p   ALTER TABLE ONLY "starSchemaV1_7".material_sublot_bridge DROP CONSTRAINT material_sublot_dimension_bridge_pkey;
       starSchemaV1_7         postgres    false    293            �           2606    186939 d   operation_definition_type_classification_bridge operation_definition_type_classification_bridge_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".operation_definition_type_classification_bridge
    ADD CONSTRAINT operation_definition_type_classification_bridge_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY "starSchemaV1_7".operation_definition_type_classification_bridge DROP CONSTRAINT operation_definition_type_classification_bridge_pkey;
       starSchemaV1_7         postgres    false    291            �           2606    186918 X   operation_request_composition_bridge operation_request_composition_dimension_bridge_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".operation_request_composition_bridge
    ADD CONSTRAINT operation_request_composition_dimension_bridge_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY "starSchemaV1_7".operation_request_composition_bridge DROP CONSTRAINT operation_request_composition_dimension_bridge_pkey;
       starSchemaV1_7         postgres    false    289            �           2606    186876 Y   operation_segment_type_bridge operation_segment_type_classification_dimension_bridge_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".operation_segment_type_bridge
    ADD CONSTRAINT operation_segment_type_classification_dimension_bridge_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY "starSchemaV1_7".operation_segment_type_bridge DROP CONSTRAINT operation_segment_type_classification_dimension_bridge_pkey;
       starSchemaV1_7         postgres    false    285            �           2606    186897 ]   operation_segment_composition_bridge operation_segment_type_composition_dimension_bridge_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".operation_segment_composition_bridge
    ADD CONSTRAINT operation_segment_type_composition_dimension_bridge_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY "starSchemaV1_7".operation_segment_composition_bridge DROP CONSTRAINT operation_segment_type_composition_dimension_bridge_pkey;
       starSchemaV1_7         postgres    false    287            �           2606    187211 :   customer_type_bridge parent_customer_dimension_bridge_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".customer_type_bridge
    ADD CONSTRAINT parent_customer_dimension_bridge_pkey PRIMARY KEY (id);
 n   ALTER TABLE ONLY "starSchemaV1_7".customer_type_bridge DROP CONSTRAINT parent_customer_dimension_bridge_pkey;
       starSchemaV1_7         postgres    false    310            �           2606    186855 X   personnel_type_classification_bridge personnel_type_classification_dimension_bridge_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".personnel_type_classification_bridge
    ADD CONSTRAINT personnel_type_classification_dimension_bridge_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY "starSchemaV1_7".personnel_type_classification_bridge DROP CONSTRAINT personnel_type_classification_dimension_bridge_pkey;
       starSchemaV1_7         postgres    false    283            �           2606    186834 T   process_segment_composition_bridge process_segment_composition_dimension_bridge_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".process_segment_composition_bridge
    ADD CONSTRAINT process_segment_composition_dimension_bridge_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY "starSchemaV1_7".process_segment_composition_bridge DROP CONSTRAINT process_segment_composition_dimension_bridge_pkey;
       starSchemaV1_7         postgres    false    281            �           2606    186813 ^   process_segment_type_composition_bridge process_segment_type_composition_dimension_bridge_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".process_segment_type_composition_bridge
    ADD CONSTRAINT process_segment_type_composition_dimension_bridge_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY "starSchemaV1_7".process_segment_type_composition_bridge DROP CONSTRAINT process_segment_type_composition_dimension_bridge_pkey;
       starSchemaV1_7         postgres    false    279            �           2606    186792 \   segment_requirement_composition_bridge segment_requirement_composition_dimension_bridge_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".segment_requirement_composition_bridge
    ADD CONSTRAINT segment_requirement_composition_dimension_bridge_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY "starSchemaV1_7".segment_requirement_composition_bridge DROP CONSTRAINT segment_requirement_composition_dimension_bridge_pkey;
       starSchemaV1_7         postgres    false    277            �           2606    186771 V   segment_response_composition_bridge segment_response_composition_dimension_bridge_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".segment_response_composition_bridge
    ADD CONSTRAINT segment_response_composition_dimension_bridge_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY "starSchemaV1_7".segment_response_composition_bridge DROP CONSTRAINT segment_response_composition_dimension_bridge_pkey;
       starSchemaV1_7         postgres    false    275            �           2606    186729 N   team_type_classification_bridge team_type_classification_dimension_bridge_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".team_type_classification_bridge
    ADD CONSTRAINT team_type_classification_dimension_bridge_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY "starSchemaV1_7".team_type_classification_bridge DROP CONSTRAINT team_type_classification_dimension_bridge_pkey;
       starSchemaV1_7         postgres    false    271            X           1259    175761    dim_date_date_actual_idx    INDEX     ^   CREATE INDEX dim_date_date_actual_idx ON "starSchemaV1_5".dim_date USING btree (date_actual);
 6   DROP INDEX "starSchemaV1_5".dim_date_date_actual_idx;
       starSchemaV1_5         postgres    false    201            �           2606    175762 *   customer_dimensional_bridge child_customer    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".customer_dimensional_bridge
    ADD CONSTRAINT child_customer FOREIGN KEY (child_id) REFERENCES "starSchemaV1_5".dim_customer(id);
 ^   ALTER TABLE ONLY "starSchemaV1_5".customer_dimensional_bridge DROP CONSTRAINT child_customer;
       starSchemaV1_5       postgres    false    198    3159    199            �           2606    175767 8   equipment_composition_bridge child_equipment_composition    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".equipment_composition_bridge
    ADD CONSTRAINT child_equipment_composition FOREIGN KEY (child_id) REFERENCES "starSchemaV1_5".dim_equipment(id);
 l   ALTER TABLE ONLY "starSchemaV1_5".equipment_composition_bridge DROP CONSTRAINT child_equipment_composition;
       starSchemaV1_5       postgres    false    202    222    3164            �           2606    175772 H   equipment_type_classification_bridge child_equipment_type_classification    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".equipment_type_classification_bridge
    ADD CONSTRAINT child_equipment_type_classification FOREIGN KEY (child_id) REFERENCES "starSchemaV1_5".dim_equipment(id);
 |   ALTER TABLE ONLY "starSchemaV1_5".equipment_type_classification_bridge DROP CONSTRAINT child_equipment_type_classification;
       starSchemaV1_5       postgres    false    202    223    3164            �           2606    175777 %   location_entity_bridge child_location    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".location_entity_bridge
    ADD CONSTRAINT child_location FOREIGN KEY (child_id) REFERENCES "starSchemaV1_5".dim_location(id);
 Y   ALTER TABLE ONLY "starSchemaV1_5".location_entity_bridge DROP CONSTRAINT child_location;
       starSchemaV1_5       postgres    false    3166    204    225            �           2606    175782 7   location_type_classification_bridge child_location_type    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".location_type_classification_bridge
    ADD CONSTRAINT child_location_type FOREIGN KEY (child_id) REFERENCES "starSchemaV1_5".dim_location(id);
 k   ALTER TABLE ONLY "starSchemaV1_5".location_type_classification_bridge DROP CONSTRAINT child_location_type;
       starSchemaV1_5       postgres    false    204    3166    226            �           2606    175787 *   material_class_bridge child_material_class    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".material_class_bridge
    ADD CONSTRAINT child_material_class FOREIGN KEY (child_id) REFERENCES "starSchemaV1_5".dim_material(id);
 ^   ALTER TABLE ONLY "starSchemaV1_5".material_class_bridge DROP CONSTRAINT child_material_class;
       starSchemaV1_5       postgres    false    3168    206    227            �           2606    175792 4   material_definition_bridge child_material_definition    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".material_definition_bridge
    ADD CONSTRAINT child_material_definition FOREIGN KEY (child_id) REFERENCES "starSchemaV1_5".dim_material(id);
 h   ALTER TABLE ONLY "starSchemaV1_5".material_definition_bridge DROP CONSTRAINT child_material_definition;
       starSchemaV1_5       postgres    false    206    228    3168            �           2606    175797 &   material_lot_bridge child_material_lot    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".material_lot_bridge
    ADD CONSTRAINT child_material_lot FOREIGN KEY (child_id) REFERENCES "starSchemaV1_5".dim_material(id);
 Z   ALTER TABLE ONLY "starSchemaV1_5".material_lot_bridge DROP CONSTRAINT child_material_lot;
       starSchemaV1_5       postgres    false    206    229    3168            �           2606    175802 ,   material_sublot_bridge child_material_sublot    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".material_sublot_bridge
    ADD CONSTRAINT child_material_sublot FOREIGN KEY (child_id) REFERENCES "starSchemaV1_5".dim_material(id);
 `   ALTER TABLE ONLY "starSchemaV1_5".material_sublot_bridge DROP CONSTRAINT child_material_sublot;
       starSchemaV1_5       postgres    false    206    3168    230            �           2606    175807 Y   operation_definition_type_classification_bridge child_operation_definition_classificaiton    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".operation_definition_type_classification_bridge
    ADD CONSTRAINT child_operation_definition_classificaiton FOREIGN KEY (child_id) REFERENCES "starSchemaV1_5".dim_operation_definition(id);
 �   ALTER TABLE ONLY "starSchemaV1_5".operation_definition_type_classification_bridge DROP CONSTRAINT child_operation_definition_classificaiton;
       starSchemaV1_5       postgres    false    231    3170    208                        2606    175812 H   operation_request_composition_bridge child_operation_request_composition    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".operation_request_composition_bridge
    ADD CONSTRAINT child_operation_request_composition FOREIGN KEY (child_id) REFERENCES "starSchemaV1_5".dim_operation_request(id);
 |   ALTER TABLE ONLY "starSchemaV1_5".operation_request_composition_bridge DROP CONSTRAINT child_operation_request_composition;
       starSchemaV1_5       postgres    false    3172    232    209                       2606    175817 -   operation_segment_composition_bridge child_os    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".operation_segment_composition_bridge
    ADD CONSTRAINT child_os FOREIGN KEY (child_id) REFERENCES "starSchemaV1_5".dim_operation_definition(id);
 a   ALTER TABLE ONLY "starSchemaV1_5".operation_segment_composition_bridge DROP CONSTRAINT child_os;
       starSchemaV1_5       postgres    false    233    208    3170                       2606    175822 +   operation_segment_type_bridge child_os_type    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".operation_segment_type_bridge
    ADD CONSTRAINT child_os_type FOREIGN KEY (child_id) REFERENCES "starSchemaV1_5".dim_operation_definition(id);
 _   ALTER TABLE ONLY "starSchemaV1_5".operation_segment_type_bridge DROP CONSTRAINT child_os_type;
       starSchemaV1_5       postgres    false    208    3170    234                       2606    175827 H   personnel_type_classification_bridge child_personnel_type_classification    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".personnel_type_classification_bridge
    ADD CONSTRAINT child_personnel_type_classification FOREIGN KEY (child_id) REFERENCES "starSchemaV1_5".dim_personnel(id);
 |   ALTER TABLE ONLY "starSchemaV1_5".personnel_type_classification_bridge DROP CONSTRAINT child_personnel_type_classification;
       starSchemaV1_5       postgres    false    235    3176    213                       2606    175832 D   process_segment_composition_bridge child_process_segment_composition    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".process_segment_composition_bridge
    ADD CONSTRAINT child_process_segment_composition FOREIGN KEY (child_id) REFERENCES "starSchemaV1_5".dim_process_segment(id);
 x   ALTER TABLE ONLY "starSchemaV1_5".process_segment_composition_bridge DROP CONSTRAINT child_process_segment_composition;
       starSchemaV1_5       postgres    false    3178    215    236            
           2606    175837 N   process_segment_type_composition_bridge child_process_segment_type_composition    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".process_segment_type_composition_bridge
    ADD CONSTRAINT child_process_segment_type_composition FOREIGN KEY (child_id) REFERENCES "starSchemaV1_5".dim_process_segment(id);
 �   ALTER TABLE ONLY "starSchemaV1_5".process_segment_type_composition_bridge DROP CONSTRAINT child_process_segment_type_composition;
       starSchemaV1_5       postgres    false    215    3178    237                       2606    175842 L   segment_requirement_composition_bridge child_segment_requirement_composition    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".segment_requirement_composition_bridge
    ADD CONSTRAINT child_segment_requirement_composition FOREIGN KEY (child_id) REFERENCES "starSchemaV1_5".dim_operation_request(id);
 �   ALTER TABLE ONLY "starSchemaV1_5".segment_requirement_composition_bridge DROP CONSTRAINT child_segment_requirement_composition;
       starSchemaV1_5       postgres    false    209    3172    238                       2606    175847 F   segment_response_composition_bridge child_segment_response_composition    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".segment_response_composition_bridge
    ADD CONSTRAINT child_segment_response_composition FOREIGN KEY (child_id) REFERENCES "starSchemaV1_5".dim_operation_response(id);
 z   ALTER TABLE ONLY "starSchemaV1_5".segment_response_composition_bridge DROP CONSTRAINT child_segment_response_composition;
       starSchemaV1_5       postgres    false    211    239    3174                       2606    175852 B   sensor_type_classification_bridge child_sensor_type_classification    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".sensor_type_classification_bridge
    ADD CONSTRAINT child_sensor_type_classification FOREIGN KEY (child_id) REFERENCES "starSchemaV1_5".dim_sensor(id);
 v   ALTER TABLE ONLY "starSchemaV1_5".sensor_type_classification_bridge DROP CONSTRAINT child_sensor_type_classification;
       starSchemaV1_5       postgres    false    240    3182    219                       2606    175857 >   team_type_classification_bridge child_team_type_classification    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".team_type_classification_bridge
    ADD CONSTRAINT child_team_type_classification FOREIGN KEY (child_id) REFERENCES "starSchemaV1_5".dim_personnel(id);
 r   ALTER TABLE ONLY "starSchemaV1_5".team_type_classification_bridge DROP CONSTRAINT child_team_type_classification;
       starSchemaV1_5       postgres    false    241    3176    213            �           2606    175862 &   fact_table fact_table_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".fact_table
    ADD CONSTRAINT fact_table_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES "starSchemaV1_5".dim_customer(id);
 Z   ALTER TABLE ONLY "starSchemaV1_5".fact_table DROP CONSTRAINT fact_table_customer_id_fkey;
       starSchemaV1_5       postgres    false    224    199    3159            �           2606    175867 "   fact_table fact_table_date_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".fact_table
    ADD CONSTRAINT fact_table_date_id_fkey FOREIGN KEY (date_id) REFERENCES "starSchemaV1_5".dim_date(date_actual);
 V   ALTER TABLE ONLY "starSchemaV1_5".fact_table DROP CONSTRAINT fact_table_date_id_fkey;
       starSchemaV1_5       postgres    false    224    201    3162            �           2606    175872 '   fact_table fact_table_equipment_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".fact_table
    ADD CONSTRAINT fact_table_equipment_id_fkey FOREIGN KEY (equipment_id) REFERENCES "starSchemaV1_5".dim_equipment(id);
 [   ALTER TABLE ONLY "starSchemaV1_5".fact_table DROP CONSTRAINT fact_table_equipment_id_fkey;
       starSchemaV1_5       postgres    false    3164    202    224            �           2606    175877 &   fact_table fact_table_location_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".fact_table
    ADD CONSTRAINT fact_table_location_id_fkey FOREIGN KEY (location_id) REFERENCES "starSchemaV1_5".dim_location(id);
 Z   ALTER TABLE ONLY "starSchemaV1_5".fact_table DROP CONSTRAINT fact_table_location_id_fkey;
       starSchemaV1_5       postgres    false    224    204    3166            �           2606    175882 &   fact_table fact_table_material_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".fact_table
    ADD CONSTRAINT fact_table_material_id_fkey FOREIGN KEY (material_id) REFERENCES "starSchemaV1_5".dim_material(id);
 Z   ALTER TABLE ONLY "starSchemaV1_5".fact_table DROP CONSTRAINT fact_table_material_id_fkey;
       starSchemaV1_5       postgres    false    206    3168    224            �           2606    175887 2   fact_table fact_table_operation_definition_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".fact_table
    ADD CONSTRAINT fact_table_operation_definition_id_fkey FOREIGN KEY (operation_definition_id) REFERENCES "starSchemaV1_5".dim_operation_definition(id);
 f   ALTER TABLE ONLY "starSchemaV1_5".fact_table DROP CONSTRAINT fact_table_operation_definition_id_fkey;
       starSchemaV1_5       postgres    false    3170    224    208            �           2606    175892 /   fact_table fact_table_operation_request_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".fact_table
    ADD CONSTRAINT fact_table_operation_request_id_fkey FOREIGN KEY (operation_request_id) REFERENCES "starSchemaV1_5".dim_operation_request(id);
 c   ALTER TABLE ONLY "starSchemaV1_5".fact_table DROP CONSTRAINT fact_table_operation_request_id_fkey;
       starSchemaV1_5       postgres    false    209    224    3172            �           2606    175897 0   fact_table fact_table_operation_response_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".fact_table
    ADD CONSTRAINT fact_table_operation_response_id_fkey FOREIGN KEY (operation_response_id) REFERENCES "starSchemaV1_5".dim_operation_response(id);
 d   ALTER TABLE ONLY "starSchemaV1_5".fact_table DROP CONSTRAINT fact_table_operation_response_id_fkey;
       starSchemaV1_5       postgres    false    211    224    3174            �           2606    175902 '   fact_table fact_table_personnel_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".fact_table
    ADD CONSTRAINT fact_table_personnel_id_fkey FOREIGN KEY (personnel_id) REFERENCES "starSchemaV1_5".dim_personnel(id);
 [   ALTER TABLE ONLY "starSchemaV1_5".fact_table DROP CONSTRAINT fact_table_personnel_id_fkey;
       starSchemaV1_5       postgres    false    224    3176    213            �           2606    175907 -   fact_table fact_table_process_segment_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".fact_table
    ADD CONSTRAINT fact_table_process_segment_id_fkey FOREIGN KEY (process_segment_id) REFERENCES "starSchemaV1_5".dim_process_segment(id);
 a   ALTER TABLE ONLY "starSchemaV1_5".fact_table DROP CONSTRAINT fact_table_process_segment_id_fkey;
       starSchemaV1_5       postgres    false    3178    215    224            �           2606    175912 )   fact_table fact_table_record_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".fact_table
    ADD CONSTRAINT fact_table_record_type_id_fkey FOREIGN KEY (record_type_id) REFERENCES "starSchemaV1_5".dim_record_type(id);
 ]   ALTER TABLE ONLY "starSchemaV1_5".fact_table DROP CONSTRAINT fact_table_record_type_id_fkey;
       starSchemaV1_5       postgres    false    217    224    3180            �           2606    175917 $   fact_table fact_table_sensor_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".fact_table
    ADD CONSTRAINT fact_table_sensor_id_fkey FOREIGN KEY (sensor_id) REFERENCES "starSchemaV1_5".dim_sensor(id);
 X   ALTER TABLE ONLY "starSchemaV1_5".fact_table DROP CONSTRAINT fact_table_sensor_id_fkey;
       starSchemaV1_5       postgres    false    224    219    3182            �           2606    175922 "   fact_table fact_table_time_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".fact_table
    ADD CONSTRAINT fact_table_time_id_fkey FOREIGN KEY (time_id) REFERENCES "starSchemaV1_5".dim_time(time_id);
 V   ALTER TABLE ONLY "starSchemaV1_5".fact_table DROP CONSTRAINT fact_table_time_id_fkey;
       starSchemaV1_5       postgres    false    221    3184    224            �           2606    175927 P   operation_definition_type_classification_bridge operationDefintionClassification    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".operation_definition_type_classification_bridge
    ADD CONSTRAINT "operationDefintionClassification" FOREIGN KEY (parent_id) REFERENCES "starSchemaV1_5".dim_operation_definition(id);
 �   ALTER TABLE ONLY "starSchemaV1_5".operation_definition_type_classification_bridge DROP CONSTRAINT "operationDefintionClassification";
       starSchemaV1_5       postgres    false    231    208    3170            �           2606    175932 '   customer_dimensional_bridge parent_area    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".customer_dimensional_bridge
    ADD CONSTRAINT parent_area FOREIGN KEY (parent_id) REFERENCES "starSchemaV1_5".dim_customer(id);
 [   ALTER TABLE ONLY "starSchemaV1_5".customer_dimensional_bridge DROP CONSTRAINT parent_area;
       starSchemaV1_5       postgres    false    199    3159    198            �           2606    175937 9   equipment_composition_bridge parent_equipment_composition    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".equipment_composition_bridge
    ADD CONSTRAINT parent_equipment_composition FOREIGN KEY (parent_id) REFERENCES "starSchemaV1_5".dim_equipment(id);
 m   ALTER TABLE ONLY "starSchemaV1_5".equipment_composition_bridge DROP CONSTRAINT parent_equipment_composition;
       starSchemaV1_5       postgres    false    202    222    3164            �           2606    175942 I   equipment_type_classification_bridge parent_equipment_type_classification    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".equipment_type_classification_bridge
    ADD CONSTRAINT parent_equipment_type_classification FOREIGN KEY (parent_id) REFERENCES "starSchemaV1_5".dim_equipment(id);
 }   ALTER TABLE ONLY "starSchemaV1_5".equipment_type_classification_bridge DROP CONSTRAINT parent_equipment_type_classification;
       starSchemaV1_5       postgres    false    3164    202    223            �           2606    175947 &   location_entity_bridge parent_location    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".location_entity_bridge
    ADD CONSTRAINT parent_location FOREIGN KEY (parent_id) REFERENCES "starSchemaV1_5".dim_location(id);
 Z   ALTER TABLE ONLY "starSchemaV1_5".location_entity_bridge DROP CONSTRAINT parent_location;
       starSchemaV1_5       postgres    false    204    3166    225            �           2606    175952 8   location_type_classification_bridge parent_location_type    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".location_type_classification_bridge
    ADD CONSTRAINT parent_location_type FOREIGN KEY (parent_id) REFERENCES "starSchemaV1_5".dim_location(id);
 l   ALTER TABLE ONLY "starSchemaV1_5".location_type_classification_bridge DROP CONSTRAINT parent_location_type;
       starSchemaV1_5       postgres    false    204    226    3166            �           2606    175957 +   material_class_bridge parent_material_class    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".material_class_bridge
    ADD CONSTRAINT parent_material_class FOREIGN KEY (parent_id) REFERENCES "starSchemaV1_5".dim_material(id);
 _   ALTER TABLE ONLY "starSchemaV1_5".material_class_bridge DROP CONSTRAINT parent_material_class;
       starSchemaV1_5       postgres    false    3168    227    206            �           2606    175962 5   material_definition_bridge parent_material_definition    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".material_definition_bridge
    ADD CONSTRAINT parent_material_definition FOREIGN KEY (parent_id) REFERENCES "starSchemaV1_5".dim_material(id);
 i   ALTER TABLE ONLY "starSchemaV1_5".material_definition_bridge DROP CONSTRAINT parent_material_definition;
       starSchemaV1_5       postgres    false    3168    206    228            �           2606    175967 '   material_lot_bridge parent_material_lot    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".material_lot_bridge
    ADD CONSTRAINT parent_material_lot FOREIGN KEY (parent_id) REFERENCES "starSchemaV1_5".dim_material(id);
 [   ALTER TABLE ONLY "starSchemaV1_5".material_lot_bridge DROP CONSTRAINT parent_material_lot;
       starSchemaV1_5       postgres    false    3168    229    206            �           2606    175972 -   material_sublot_bridge parent_material_sublot    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".material_sublot_bridge
    ADD CONSTRAINT parent_material_sublot FOREIGN KEY (parent_id) REFERENCES "starSchemaV1_5".dim_material(id);
 a   ALTER TABLE ONLY "starSchemaV1_5".material_sublot_bridge DROP CONSTRAINT parent_material_sublot;
       starSchemaV1_5       postgres    false    206    230    3168                       2606    175977 I   operation_request_composition_bridge parent_operation_request_composition    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".operation_request_composition_bridge
    ADD CONSTRAINT parent_operation_request_composition FOREIGN KEY (parent_id) REFERENCES "starSchemaV1_5".dim_operation_request(id);
 }   ALTER TABLE ONLY "starSchemaV1_5".operation_request_composition_bridge DROP CONSTRAINT parent_operation_request_composition;
       starSchemaV1_5       postgres    false    3172    209    232                       2606    175982 =   operation_segment_composition_bridge parent_operation_segment    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".operation_segment_composition_bridge
    ADD CONSTRAINT parent_operation_segment FOREIGN KEY (parent_id) REFERENCES "starSchemaV1_5".dim_operation_definition(id);
 q   ALTER TABLE ONLY "starSchemaV1_5".operation_segment_composition_bridge DROP CONSTRAINT parent_operation_segment;
       starSchemaV1_5       postgres    false    208    233    3170                       2606    175987 ,   operation_segment_type_bridge parent_os_type    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".operation_segment_type_bridge
    ADD CONSTRAINT parent_os_type FOREIGN KEY (parent_id) REFERENCES "starSchemaV1_5".dim_operation_definition(id);
 `   ALTER TABLE ONLY "starSchemaV1_5".operation_segment_type_bridge DROP CONSTRAINT parent_os_type;
       starSchemaV1_5       postgres    false    208    234    3170                       2606    175992 I   personnel_type_classification_bridge parent_personnel_type_classification    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".personnel_type_classification_bridge
    ADD CONSTRAINT parent_personnel_type_classification FOREIGN KEY (parent_id) REFERENCES "starSchemaV1_5".dim_personnel(id);
 }   ALTER TABLE ONLY "starSchemaV1_5".personnel_type_classification_bridge DROP CONSTRAINT parent_personnel_type_classification;
       starSchemaV1_5       postgres    false    3176    213    235            	           2606    175997 E   process_segment_composition_bridge parent_process_segment_composition    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".process_segment_composition_bridge
    ADD CONSTRAINT parent_process_segment_composition FOREIGN KEY (parent_id) REFERENCES "starSchemaV1_5".dim_process_segment(id);
 y   ALTER TABLE ONLY "starSchemaV1_5".process_segment_composition_bridge DROP CONSTRAINT parent_process_segment_composition;
       starSchemaV1_5       postgres    false    3178    215    236                       2606    176002 O   process_segment_type_composition_bridge parent_process_segment_type_composition    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".process_segment_type_composition_bridge
    ADD CONSTRAINT parent_process_segment_type_composition FOREIGN KEY (parent_id) REFERENCES "starSchemaV1_5".dim_process_segment(id);
 �   ALTER TABLE ONLY "starSchemaV1_5".process_segment_type_composition_bridge DROP CONSTRAINT parent_process_segment_type_composition;
       starSchemaV1_5       postgres    false    237    3178    215                       2606    176007 M   segment_requirement_composition_bridge parent_segment_requirement_composition    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".segment_requirement_composition_bridge
    ADD CONSTRAINT parent_segment_requirement_composition FOREIGN KEY (parent_id) REFERENCES "starSchemaV1_5".dim_operation_request(id);
 �   ALTER TABLE ONLY "starSchemaV1_5".segment_requirement_composition_bridge DROP CONSTRAINT parent_segment_requirement_composition;
       starSchemaV1_5       postgres    false    238    209    3172                       2606    176012 G   segment_response_composition_bridge parent_segment_response_composition    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".segment_response_composition_bridge
    ADD CONSTRAINT parent_segment_response_composition FOREIGN KEY (parent_id) REFERENCES "starSchemaV1_5".dim_operation_response(id);
 {   ALTER TABLE ONLY "starSchemaV1_5".segment_response_composition_bridge DROP CONSTRAINT parent_segment_response_composition;
       starSchemaV1_5       postgres    false    239    3174    211                       2606    176017 C   sensor_type_classification_bridge parent_sensor_type_classification    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".sensor_type_classification_bridge
    ADD CONSTRAINT parent_sensor_type_classification FOREIGN KEY (parent_id) REFERENCES "starSchemaV1_5".dim_sensor(id);
 w   ALTER TABLE ONLY "starSchemaV1_5".sensor_type_classification_bridge DROP CONSTRAINT parent_sensor_type_classification;
       starSchemaV1_5       postgres    false    3182    240    219                       2606    176022 ?   team_type_classification_bridge parent_team_type_classification    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_5".team_type_classification_bridge
    ADD CONSTRAINT parent_team_type_classification FOREIGN KEY (parent_id) REFERENCES "starSchemaV1_5".dim_personnel(id);
 s   ALTER TABLE ONLY "starSchemaV1_5".team_type_classification_bridge DROP CONSTRAINT parent_team_type_classification;
       starSchemaV1_5       postgres    false    3176    241    213            I           2606    187212 (   customer_type_bridge child_customer_type    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".customer_type_bridge
    ADD CONSTRAINT child_customer_type FOREIGN KEY (child_id) REFERENCES "starSchemaV1_7".dim_customer(id);
 \   ALTER TABLE ONLY "starSchemaV1_7".customer_type_bridge DROP CONSTRAINT child_customer_type;
       starSchemaV1_7       postgres    false    310    3252    269            G           2606    187191 8   equipment_composition_bridge child_equipment_composition    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".equipment_composition_bridge
    ADD CONSTRAINT child_equipment_composition FOREIGN KEY (child_id) REFERENCES "starSchemaV1_7".dim_equipment(id);
 l   ALTER TABLE ONLY "starSchemaV1_7".equipment_composition_bridge DROP CONSTRAINT child_equipment_composition;
       starSchemaV1_7       postgres    false    3248    308    266            E           2606    187170 H   equipment_type_classification_bridge child_equipment_type_classification    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".equipment_type_classification_bridge
    ADD CONSTRAINT child_equipment_type_classification FOREIGN KEY (child_id) REFERENCES "starSchemaV1_7".dim_equipment(id);
 |   ALTER TABLE ONLY "starSchemaV1_7".equipment_type_classification_bridge DROP CONSTRAINT child_equipment_type_classification;
       starSchemaV1_7       postgres    false    306    266    3248            4           2606    187066 %   location_entity_bridge child_location    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".location_entity_bridge
    ADD CONSTRAINT child_location FOREIGN KEY (child_id) REFERENCES "starSchemaV1_7".dim_location(id);
 Y   ALTER TABLE ONLY "starSchemaV1_7".location_entity_bridge DROP CONSTRAINT child_location;
       starSchemaV1_7       postgres    false    260    3242    303            2           2606    187045 7   location_type_classification_bridge child_location_type    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".location_type_classification_bridge
    ADD CONSTRAINT child_location_type FOREIGN KEY (child_id) REFERENCES "starSchemaV1_7".dim_location(id);
 k   ALTER TABLE ONLY "starSchemaV1_7".location_type_classification_bridge DROP CONSTRAINT child_location_type;
       starSchemaV1_7       postgres    false    301    260    3242            0           2606    187024 *   material_class_bridge child_material_class    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".material_class_bridge
    ADD CONSTRAINT child_material_class FOREIGN KEY (child_id) REFERENCES "starSchemaV1_7".dim_material(id);
 ^   ALTER TABLE ONLY "starSchemaV1_7".material_class_bridge DROP CONSTRAINT child_material_class;
       starSchemaV1_7       postgres    false    3240    299    258            .           2606    187003 4   material_definition_bridge child_material_definition    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".material_definition_bridge
    ADD CONSTRAINT child_material_definition FOREIGN KEY (child_id) REFERENCES "starSchemaV1_7".dim_material(id);
 h   ALTER TABLE ONLY "starSchemaV1_7".material_definition_bridge DROP CONSTRAINT child_material_definition;
       starSchemaV1_7       postgres    false    297    258    3240            ,           2606    186982 &   material_lot_bridge child_material_lot    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".material_lot_bridge
    ADD CONSTRAINT child_material_lot FOREIGN KEY (child_id) REFERENCES "starSchemaV1_7".dim_material(id);
 Z   ALTER TABLE ONLY "starSchemaV1_7".material_lot_bridge DROP CONSTRAINT child_material_lot;
       starSchemaV1_7       postgres    false    295    258    3240            *           2606    186961 ,   material_sublot_bridge child_material_sublot    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".material_sublot_bridge
    ADD CONSTRAINT child_material_sublot FOREIGN KEY (child_id) REFERENCES "starSchemaV1_7".dim_material(id);
 `   ALTER TABLE ONLY "starSchemaV1_7".material_sublot_bridge DROP CONSTRAINT child_material_sublot;
       starSchemaV1_7       postgres    false    293    258    3240            (           2606    186940 ^   operation_definition_type_classification_bridge child_operation_definition_type_classificaiton    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".operation_definition_type_classification_bridge
    ADD CONSTRAINT child_operation_definition_type_classificaiton FOREIGN KEY (child_id) REFERENCES "starSchemaV1_7".dim_operation_definition(id);
 �   ALTER TABLE ONLY "starSchemaV1_7".operation_definition_type_classification_bridge DROP CONSTRAINT child_operation_definition_type_classificaiton;
       starSchemaV1_7       postgres    false    3238    291    256            &           2606    186919 H   operation_request_composition_bridge child_operation_request_composition    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".operation_request_composition_bridge
    ADD CONSTRAINT child_operation_request_composition FOREIGN KEY (child_id) REFERENCES "starSchemaV1_7".dim_operation_request(id);
 |   ALTER TABLE ONLY "starSchemaV1_7".operation_request_composition_bridge DROP CONSTRAINT child_operation_request_composition;
       starSchemaV1_7       postgres    false    254    3236    289            $           2606    186898 -   operation_segment_composition_bridge child_os    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".operation_segment_composition_bridge
    ADD CONSTRAINT child_os FOREIGN KEY (child_id) REFERENCES "starSchemaV1_7".dim_operation_definition(id);
 a   ALTER TABLE ONLY "starSchemaV1_7".operation_segment_composition_bridge DROP CONSTRAINT child_os;
       starSchemaV1_7       postgres    false    256    3238    287            "           2606    186877 +   operation_segment_type_bridge child_os_type    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".operation_segment_type_bridge
    ADD CONSTRAINT child_os_type FOREIGN KEY (child_id) REFERENCES "starSchemaV1_7".dim_operation_definition(id);
 _   ALTER TABLE ONLY "starSchemaV1_7".operation_segment_type_bridge DROP CONSTRAINT child_os_type;
       starSchemaV1_7       postgres    false    3238    285    256                        2606    186856 H   personnel_type_classification_bridge child_personnel_type_classification    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".personnel_type_classification_bridge
    ADD CONSTRAINT child_personnel_type_classification FOREIGN KEY (child_id) REFERENCES "starSchemaV1_7".dim_personnel(id);
 |   ALTER TABLE ONLY "starSchemaV1_7".personnel_type_classification_bridge DROP CONSTRAINT child_personnel_type_classification;
       starSchemaV1_7       postgres    false    3232    250    283                       2606    186835 D   process_segment_composition_bridge child_process_segment_composition    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".process_segment_composition_bridge
    ADD CONSTRAINT child_process_segment_composition FOREIGN KEY (child_id) REFERENCES "starSchemaV1_7".dim_process_segment(id);
 x   ALTER TABLE ONLY "starSchemaV1_7".process_segment_composition_bridge DROP CONSTRAINT child_process_segment_composition;
       starSchemaV1_7       postgres    false    3230    248    281                       2606    186814 N   process_segment_type_composition_bridge child_process_segment_type_composition    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".process_segment_type_composition_bridge
    ADD CONSTRAINT child_process_segment_type_composition FOREIGN KEY (child_id) REFERENCES "starSchemaV1_7".dim_process_segment(id);
 �   ALTER TABLE ONLY "starSchemaV1_7".process_segment_type_composition_bridge DROP CONSTRAINT child_process_segment_type_composition;
       starSchemaV1_7       postgres    false    248    3230    279                       2606    186793 L   segment_requirement_composition_bridge child_segment_requirement_composition    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".segment_requirement_composition_bridge
    ADD CONSTRAINT child_segment_requirement_composition FOREIGN KEY (child_id) REFERENCES "starSchemaV1_7".dim_operation_request(id);
 �   ALTER TABLE ONLY "starSchemaV1_7".segment_requirement_composition_bridge DROP CONSTRAINT child_segment_requirement_composition;
       starSchemaV1_7       postgres    false    277    254    3236                       2606    186772 F   segment_response_composition_bridge child_segment_response_composition    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".segment_response_composition_bridge
    ADD CONSTRAINT child_segment_response_composition FOREIGN KEY (child_id) REFERENCES "starSchemaV1_7".dim_operation_response(id);
 z   ALTER TABLE ONLY "starSchemaV1_7".segment_response_composition_bridge DROP CONSTRAINT child_segment_response_composition;
       starSchemaV1_7       postgres    false    252    3234    275                       2606    186751 B   sensor_type_classification_bridge child_sensor_type_classification    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".sensor_type_classification_bridge
    ADD CONSTRAINT child_sensor_type_classification FOREIGN KEY (child_id) REFERENCES "starSchemaV1_7".dim_sensor(id);
 v   ALTER TABLE ONLY "starSchemaV1_7".sensor_type_classification_bridge DROP CONSTRAINT child_sensor_type_classification;
       starSchemaV1_7       postgres    false    273    244    3226                       2606    186730 >   team_type_classification_bridge child_team_type_classification    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".team_type_classification_bridge
    ADD CONSTRAINT child_team_type_classification FOREIGN KEY (child_id) REFERENCES "starSchemaV1_7".dim_personnel(id);
 r   ALTER TABLE ONLY "starSchemaV1_7".team_type_classification_bridge DROP CONSTRAINT child_team_type_classification;
       starSchemaV1_7       postgres    false    250    3232    271            6           2606    187084 &   fact_table fact_table_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".fact_table
    ADD CONSTRAINT fact_table_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES "starSchemaV1_7".dim_customer(id);
 Z   ALTER TABLE ONLY "starSchemaV1_7".fact_table DROP CONSTRAINT fact_table_customer_id_fkey;
       starSchemaV1_7       postgres    false    269    3252    304            7           2606    187089 "   fact_table fact_table_date_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".fact_table
    ADD CONSTRAINT fact_table_date_id_fkey FOREIGN KEY (date_id) REFERENCES "starSchemaV1_7".dim_date(date_actual);
 V   ALTER TABLE ONLY "starSchemaV1_7".fact_table DROP CONSTRAINT fact_table_date_id_fkey;
       starSchemaV1_7       postgres    false    3250    304    267            8           2606    187094 '   fact_table fact_table_equipment_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".fact_table
    ADD CONSTRAINT fact_table_equipment_id_fkey FOREIGN KEY (equipment_id) REFERENCES "starSchemaV1_7".dim_equipment(id);
 [   ALTER TABLE ONLY "starSchemaV1_7".fact_table DROP CONSTRAINT fact_table_equipment_id_fkey;
       starSchemaV1_7       postgres    false    3248    266    304            9           2606    187099 #   fact_table fact_table_event_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".fact_table
    ADD CONSTRAINT fact_table_event_id_fkey FOREIGN KEY (event_id) REFERENCES "starSchemaV1_7".dim_event(id);
 W   ALTER TABLE ONLY "starSchemaV1_7".fact_table DROP CONSTRAINT fact_table_event_id_fkey;
       starSchemaV1_7       postgres    false    264    3246    304            :           2606    187104    fact_table fact_table_kpi_id    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".fact_table
    ADD CONSTRAINT fact_table_kpi_id FOREIGN KEY (kpi_id) REFERENCES "starSchemaV1_7".dim_kpi(id);
 P   ALTER TABLE ONLY "starSchemaV1_7".fact_table DROP CONSTRAINT fact_table_kpi_id;
       starSchemaV1_7       postgres    false    3244    304    262            ;           2606    187109 &   fact_table fact_table_location_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".fact_table
    ADD CONSTRAINT fact_table_location_id_fkey FOREIGN KEY (location_id) REFERENCES "starSchemaV1_7".dim_location(id);
 Z   ALTER TABLE ONLY "starSchemaV1_7".fact_table DROP CONSTRAINT fact_table_location_id_fkey;
       starSchemaV1_7       postgres    false    304    3242    260            <           2606    187114 &   fact_table fact_table_material_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".fact_table
    ADD CONSTRAINT fact_table_material_id_fkey FOREIGN KEY (material_id) REFERENCES "starSchemaV1_7".dim_material(id);
 Z   ALTER TABLE ONLY "starSchemaV1_7".fact_table DROP CONSTRAINT fact_table_material_id_fkey;
       starSchemaV1_7       postgres    false    304    3240    258            =           2606    187119 2   fact_table fact_table_operation_definition_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".fact_table
    ADD CONSTRAINT fact_table_operation_definition_id_fkey FOREIGN KEY (operation_definition_id) REFERENCES "starSchemaV1_7".dim_operation_definition(id);
 f   ALTER TABLE ONLY "starSchemaV1_7".fact_table DROP CONSTRAINT fact_table_operation_definition_id_fkey;
       starSchemaV1_7       postgres    false    256    304    3238            >           2606    187124 /   fact_table fact_table_operation_request_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".fact_table
    ADD CONSTRAINT fact_table_operation_request_id_fkey FOREIGN KEY (operation_request_id) REFERENCES "starSchemaV1_7".dim_operation_request(id);
 c   ALTER TABLE ONLY "starSchemaV1_7".fact_table DROP CONSTRAINT fact_table_operation_request_id_fkey;
       starSchemaV1_7       postgres    false    3236    254    304            ?           2606    187129 0   fact_table fact_table_operation_response_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".fact_table
    ADD CONSTRAINT fact_table_operation_response_id_fkey FOREIGN KEY (operation_response_id) REFERENCES "starSchemaV1_7".dim_operation_response(id);
 d   ALTER TABLE ONLY "starSchemaV1_7".fact_table DROP CONSTRAINT fact_table_operation_response_id_fkey;
       starSchemaV1_7       postgres    false    252    304    3234            @           2606    187134 '   fact_table fact_table_personnel_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".fact_table
    ADD CONSTRAINT fact_table_personnel_id_fkey FOREIGN KEY (personnel_id) REFERENCES "starSchemaV1_7".dim_personnel(id);
 [   ALTER TABLE ONLY "starSchemaV1_7".fact_table DROP CONSTRAINT fact_table_personnel_id_fkey;
       starSchemaV1_7       postgres    false    250    304    3232            A           2606    187139 -   fact_table fact_table_process_segment_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".fact_table
    ADD CONSTRAINT fact_table_process_segment_id_fkey FOREIGN KEY (process_segment_id) REFERENCES "starSchemaV1_7".dim_process_segment(id);
 a   ALTER TABLE ONLY "starSchemaV1_7".fact_table DROP CONSTRAINT fact_table_process_segment_id_fkey;
       starSchemaV1_7       postgres    false    3230    248    304            B           2606    187144 ,   fact_table fact_table_property_definition_id    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".fact_table
    ADD CONSTRAINT fact_table_property_definition_id FOREIGN KEY (property_definition_id) REFERENCES "starSchemaV1_7".dim_property_definition(id);
 `   ALTER TABLE ONLY "starSchemaV1_7".fact_table DROP CONSTRAINT fact_table_property_definition_id;
       starSchemaV1_7       postgres    false    246    3228    304            C           2606    187149 $   fact_table fact_table_sensor_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".fact_table
    ADD CONSTRAINT fact_table_sensor_id_fkey FOREIGN KEY (sensor_id) REFERENCES "starSchemaV1_7".dim_sensor(id);
 X   ALTER TABLE ONLY "starSchemaV1_7".fact_table DROP CONSTRAINT fact_table_sensor_id_fkey;
       starSchemaV1_7       postgres    false    304    3226    244            D           2606    187154 "   fact_table fact_table_time_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".fact_table
    ADD CONSTRAINT fact_table_time_id_fkey FOREIGN KEY (time_id) REFERENCES "starSchemaV1_7".dim_time(time_id);
 V   ALTER TABLE ONLY "starSchemaV1_7".fact_table DROP CONSTRAINT fact_table_time_id_fkey;
       starSchemaV1_7       postgres    false    3224    304    242            J           2606    187217 )   customer_type_bridge parent_customer_type    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".customer_type_bridge
    ADD CONSTRAINT parent_customer_type FOREIGN KEY (parent_id) REFERENCES "starSchemaV1_7".dim_customer(id);
 ]   ALTER TABLE ONLY "starSchemaV1_7".customer_type_bridge DROP CONSTRAINT parent_customer_type;
       starSchemaV1_7       postgres    false    3252    310    269            H           2606    187196 9   equipment_composition_bridge parent_equipment_composition    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".equipment_composition_bridge
    ADD CONSTRAINT parent_equipment_composition FOREIGN KEY (parent_id) REFERENCES "starSchemaV1_7".dim_equipment(id);
 m   ALTER TABLE ONLY "starSchemaV1_7".equipment_composition_bridge DROP CONSTRAINT parent_equipment_composition;
       starSchemaV1_7       postgres    false    3248    266    308            F           2606    187175 I   equipment_type_classification_bridge parent_equipment_type_classification    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".equipment_type_classification_bridge
    ADD CONSTRAINT parent_equipment_type_classification FOREIGN KEY (parent_id) REFERENCES "starSchemaV1_7".dim_equipment(id);
 }   ALTER TABLE ONLY "starSchemaV1_7".equipment_type_classification_bridge DROP CONSTRAINT parent_equipment_type_classification;
       starSchemaV1_7       postgres    false    306    266    3248            5           2606    187071 &   location_entity_bridge parent_location    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".location_entity_bridge
    ADD CONSTRAINT parent_location FOREIGN KEY (parent_id) REFERENCES "starSchemaV1_7".dim_location(id);
 Z   ALTER TABLE ONLY "starSchemaV1_7".location_entity_bridge DROP CONSTRAINT parent_location;
       starSchemaV1_7       postgres    false    3242    303    260            3           2606    187050 8   location_type_classification_bridge parent_location_type    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".location_type_classification_bridge
    ADD CONSTRAINT parent_location_type FOREIGN KEY (parent_id) REFERENCES "starSchemaV1_7".dim_location(id);
 l   ALTER TABLE ONLY "starSchemaV1_7".location_type_classification_bridge DROP CONSTRAINT parent_location_type;
       starSchemaV1_7       postgres    false    301    260    3242            1           2606    187029 +   material_class_bridge parent_material_class    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".material_class_bridge
    ADD CONSTRAINT parent_material_class FOREIGN KEY (parent_id) REFERENCES "starSchemaV1_7".dim_material(id);
 _   ALTER TABLE ONLY "starSchemaV1_7".material_class_bridge DROP CONSTRAINT parent_material_class;
       starSchemaV1_7       postgres    false    258    299    3240            /           2606    187008 5   material_definition_bridge parent_material_definition    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".material_definition_bridge
    ADD CONSTRAINT parent_material_definition FOREIGN KEY (parent_id) REFERENCES "starSchemaV1_7".dim_material(id);
 i   ALTER TABLE ONLY "starSchemaV1_7".material_definition_bridge DROP CONSTRAINT parent_material_definition;
       starSchemaV1_7       postgres    false    258    297    3240            -           2606    186987 '   material_lot_bridge parent_material_lot    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".material_lot_bridge
    ADD CONSTRAINT parent_material_lot FOREIGN KEY (parent_id) REFERENCES "starSchemaV1_7".dim_material(id);
 [   ALTER TABLE ONLY "starSchemaV1_7".material_lot_bridge DROP CONSTRAINT parent_material_lot;
       starSchemaV1_7       postgres    false    258    295    3240            +           2606    186966 -   material_sublot_bridge parent_material_sublot    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".material_sublot_bridge
    ADD CONSTRAINT parent_material_sublot FOREIGN KEY (parent_id) REFERENCES "starSchemaV1_7".dim_material(id);
 a   ALTER TABLE ONLY "starSchemaV1_7".material_sublot_bridge DROP CONSTRAINT parent_material_sublot;
       starSchemaV1_7       postgres    false    3240    293    258            )           2606    186945 _   operation_definition_type_classification_bridge parent_operation_definition_type_classification    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".operation_definition_type_classification_bridge
    ADD CONSTRAINT parent_operation_definition_type_classification FOREIGN KEY (parent_id) REFERENCES "starSchemaV1_7".dim_operation_definition(id);
 �   ALTER TABLE ONLY "starSchemaV1_7".operation_definition_type_classification_bridge DROP CONSTRAINT parent_operation_definition_type_classification;
       starSchemaV1_7       postgres    false    256    3238    291            '           2606    186924 I   operation_request_composition_bridge parent_operation_request_composition    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".operation_request_composition_bridge
    ADD CONSTRAINT parent_operation_request_composition FOREIGN KEY (parent_id) REFERENCES "starSchemaV1_7".dim_operation_request(id);
 }   ALTER TABLE ONLY "starSchemaV1_7".operation_request_composition_bridge DROP CONSTRAINT parent_operation_request_composition;
       starSchemaV1_7       postgres    false    3236    254    289            %           2606    186903 =   operation_segment_composition_bridge parent_operation_segment    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".operation_segment_composition_bridge
    ADD CONSTRAINT parent_operation_segment FOREIGN KEY (parent_id) REFERENCES "starSchemaV1_7".dim_operation_definition(id);
 q   ALTER TABLE ONLY "starSchemaV1_7".operation_segment_composition_bridge DROP CONSTRAINT parent_operation_segment;
       starSchemaV1_7       postgres    false    287    3238    256            #           2606    186882 ,   operation_segment_type_bridge parent_os_type    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".operation_segment_type_bridge
    ADD CONSTRAINT parent_os_type FOREIGN KEY (parent_id) REFERENCES "starSchemaV1_7".dim_operation_definition(id);
 `   ALTER TABLE ONLY "starSchemaV1_7".operation_segment_type_bridge DROP CONSTRAINT parent_os_type;
       starSchemaV1_7       postgres    false    285    3238    256            !           2606    186861 I   personnel_type_classification_bridge parent_personnel_type_classification    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".personnel_type_classification_bridge
    ADD CONSTRAINT parent_personnel_type_classification FOREIGN KEY (parent_id) REFERENCES "starSchemaV1_7".dim_personnel(id);
 }   ALTER TABLE ONLY "starSchemaV1_7".personnel_type_classification_bridge DROP CONSTRAINT parent_personnel_type_classification;
       starSchemaV1_7       postgres    false    250    3232    283                       2606    186840 E   process_segment_composition_bridge parent_process_segment_composition    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".process_segment_composition_bridge
    ADD CONSTRAINT parent_process_segment_composition FOREIGN KEY (parent_id) REFERENCES "starSchemaV1_7".dim_process_segment(id);
 y   ALTER TABLE ONLY "starSchemaV1_7".process_segment_composition_bridge DROP CONSTRAINT parent_process_segment_composition;
       starSchemaV1_7       postgres    false    281    3230    248                       2606    186819 O   process_segment_type_composition_bridge parent_process_segment_type_composition    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".process_segment_type_composition_bridge
    ADD CONSTRAINT parent_process_segment_type_composition FOREIGN KEY (parent_id) REFERENCES "starSchemaV1_7".dim_process_segment(id);
 �   ALTER TABLE ONLY "starSchemaV1_7".process_segment_type_composition_bridge DROP CONSTRAINT parent_process_segment_type_composition;
       starSchemaV1_7       postgres    false    248    3230    279                       2606    186798 M   segment_requirement_composition_bridge parent_segment_requirement_composition    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".segment_requirement_composition_bridge
    ADD CONSTRAINT parent_segment_requirement_composition FOREIGN KEY (parent_id) REFERENCES "starSchemaV1_7".dim_operation_request(id);
 �   ALTER TABLE ONLY "starSchemaV1_7".segment_requirement_composition_bridge DROP CONSTRAINT parent_segment_requirement_composition;
       starSchemaV1_7       postgres    false    3236    254    277                       2606    186777 G   segment_response_composition_bridge parent_segment_response_composition    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".segment_response_composition_bridge
    ADD CONSTRAINT parent_segment_response_composition FOREIGN KEY (parent_id) REFERENCES "starSchemaV1_7".dim_operation_response(id);
 {   ALTER TABLE ONLY "starSchemaV1_7".segment_response_composition_bridge DROP CONSTRAINT parent_segment_response_composition;
       starSchemaV1_7       postgres    false    3234    252    275                       2606    186756 C   sensor_type_classification_bridge parent_sensor_type_classification    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".sensor_type_classification_bridge
    ADD CONSTRAINT parent_sensor_type_classification FOREIGN KEY (parent_id) REFERENCES "starSchemaV1_7".dim_sensor(id);
 w   ALTER TABLE ONLY "starSchemaV1_7".sensor_type_classification_bridge DROP CONSTRAINT parent_sensor_type_classification;
       starSchemaV1_7       postgres    false    244    3226    273                       2606    186735 ?   team_type_classification_bridge parent_team_type_classification    FK CONSTRAINT     �   ALTER TABLE ONLY "starSchemaV1_7".team_type_classification_bridge
    ADD CONSTRAINT parent_team_type_classification FOREIGN KEY (parent_id) REFERENCES "starSchemaV1_7".dim_personnel(id);
 s   ALTER TABLE ONLY "starSchemaV1_7".team_type_classification_bridge DROP CONSTRAINT parent_team_type_classification;
       starSchemaV1_7       postgres    false    271    250    3232            �      x������ � �      �      x������ � �      �      x������ � �      �     x���݊�0��ۧ���o�R�������Pj�&�I
�o�M�cM��B	�d�w�$�[%gB�J�x���l�C8�wӌ6��]�(���)��b1��W:���v����,q�S�i(D���fW���:���2O�.�ǼEG��r?F�_��,��؎Q܎�z��Kɔ��O،4"����}5���3P����� �C��f�G|73����M2%&�z���)�{�Y�!f�B�d�dlMs�,�-f�w`�0���[�MY#�-��邓I���d��      �      x������ � �      �   �  x��WMo�0=;����.��1iS%�6�v{�dB� p�Ϳ_LÇ�x����{�xfx��y���51���_�����Q���0��G��1��r�!������ź��\lV7�H\l��t�%�0
qy�:
�?����.�'B7�^(֍��nW��m����'���qB��}�9�5�{6��s�l=)v��szl7���%���Xg>DC���>��k���8%����[6�1�wܶ�ħ���zX8V������O0��}lnC��"�5���L}�	=����*B��ԇ6�`O���� "��8L�AO$���'X��t�(;Ͱ�	:U%�j�(m"Mx��iG||�����w��܇�R��ߧ�.�IDG��=�aT���иY��f��yZ���a�,���-�������g�T���]�B�ly��HL�N�J⋞��/I�)\0.z���âe)�%2����
z~�*i��r��\2ٍ�Z����S�v6ߢO�䯖�V+3�P��j`��Y	�Tq���{���'n��hn��1���1;�c0�u�n����%�ĥ~�iS`����3g���lV�ێ�:��<0��v\�����"#p�90s�s�R/�މ� |M)���Yo������>{�n?��P\�O���Ȭ���+=��ꪬ8LS���e2M�]kj���n4�Vo�2�t�X"�:�Uew��U}וT�K����+�u�"CU��κTg2�bPpI$�:�YU����ՙ��\�v�LM�S����fu�T�R�c�������D�0+�ԙ�R%�Ӛ��M�|��&���U'տT��f*Ѧ{���2U� �St��n��d�^�)�oz��_�~*�      �   J  x�ŗ]o�0ǯ˧x.��q������!9�Y�0�c���oZFԋ���&���W���Z1z�����j.S�5��dZ���$�>����4[���#n���K?}F�u�<�Yq��Hk���x� �ٖeR��wI�V�*]0�n�zī���HW�(��/�6-�iF=�f0����#�����>؈q�=���BTix)��Ε��^��M�I�oB�or��k��?���ǧ	�ػ	����������F�ݢ,���߄�|O��j� �{�C[`!ڭRFK�n��Y�^�/J�q���9�")RΤ�Mb�4�)K)v�7��5 �QE�h�R�d2_S��J� ��s�����Q�n��kXe�Ӝ6�ՠ�i� �V�G�Z3Z�ھtQˁ@\kXZ��3��j�$@��m�WC��ڼZ�5�Om����&��̻B����9��9��j+ɲR�T{�d��כ���~�e44��z6S[�V�n�R��;���=l���j,spks`N�:�rS�+Ѕ�a�,{%L���=�!�U��ng��)�J���M�'m�^�vTaz!m��8��0��O      �   �   x�3��͏�K-.�I�740���W��@�?R�^R��s�J��KJ�2��㋋�9@
����k��ޒ�������Ԝ̲ԢJ��!`A� i����gDy���5G�Qpfx��pF�\� �U�m      �      x������ � �      �      x������ � �      �   �   x��Ͻ
�0��9y�<��6�vwqP
.���mR���m���b���~�8͓;[e��!�j��Fݴ�N����ϑ�qZK\�~}�3��{��rPۡY�]�0�&������Uf�Z���"����;P�N�!'�p� �9������.'AN��dA8)rR��PJ_*g�`      �      x������ � �      �      x������ � �      �      x������ � �      �   >   x�%���@�����j8S��/,"�C�q����by]%O�kȋ��&���ː���\�>��$      �   K   x�-ʹ�0Cњ&�d)�.�=���;���@��Z�Cn���n�)�zW/�~�l�����g�f���=HN��e      �      x������ � �      �      x������ � �      �      x������ � �      �   1   x�-ƹ  �x]�}�S��)6�K(I?U�_j�o�Β�Is	�      �     x�=һ�$1P��"�_.k_�?����i�A����/����?]<8�n^�Ok�ɻ&���]�%<y�fO�uX��w]�ēϹ��P_F�6�%%�A5�̺��T�5�&UP�jQ��T�2Ԧ:T�Fե&�*jA�RQ�ޏ��J�.�*�p�4�[�En�6m�U:t�V��n���V���ʢ�}8�n���U�L!��b��ʛ1�*&H�|���*�YH�R�FZ1iU�\����90[��Y����f��9�٪��#�'�s�      �      x������ � �      �      x������ � �      �      x�3�4�4�,�L�4����� �}      �      x�3�4�4�,�L�4�2�4����b���� B�X      �      x�3�4�4�,�L�4�2�4����b���� C�d      �      x�3�4�4�,�L�4�2����b���� B�X      �      x������ � �      �      x�3�4�4�,�L�4����� ��      �      x�3�4�4�,�L�4�2�4����b���� B�T      �   -   x�3�4�4�,�L�4�2�4����L9M�lc.3N3(ۄ+F��� ܻ      �      x������ � �      �      x������ � �      �      x������ � �      4      x������ � �            x������ � �      	      x������ � �           x���݊�0��ۧ���o�R�������Pj�&�I
�o�M�cM��B	�d�w�$�[%gB�J�x���l�C8�wӌ6��]�(���)��b1��W:���v����,q�S�i(D���fW���:���2O�.�ǼEG��r?F�_��,��؎Q܎�z��Kɔ��O،4"����}5���3P����� �C��f�G|73����M2%&�z���)�{�Y�!f�B�d�dlMs�,�-f�w`�0���[�MY#�-��邓I���d��         a  x����n�@�5<�/`3@qפ.��%ѥ�!�TIp�06}�
���q���f���9�����{۔�u+��ب���-}��U��,�us���Uc�z{{���~8~9��S�M��H�P�B�h�}�j$�q�t~D5Mh�@3:C�s�����S�͈�RTƒ)LI�a�mI��INLqb�K8���8��{,mev����3Z����R�����`y�?���~��-� �R�_���w/��-u����zϦ&���pE�Z�?��3�>��s��#u-����
�k��@uh�jh�jh�jh��|��1"���p�Y����3�1�qF8&2��|���8#�g��S|w���N�ݽy���}��         �  x����n�0 ������KĻ-��lNݝ��Pg9�������Pi�M~��'�<�Y"A Ҩ%O3`b���&!E&y����C�`d"4��ª�1���C0��)�_�r�SF�E)�|g,��|W������k+������j�+��l'^uyLCZ-�(f����Q6�I�^@Q�<�"bQ� ��*i��|���㒫����лݗo�����ώd=����Ϣ=`��z��v;��~t�x��;,�Jf��*Q޶S�?��^o�a��Sܟ��Ԫ��.[��m��.�wԸ�Ƈj�S��q�Ʊ'j\muDmuDmuDmu�^ݟ_�O�aA���54�����akh8�����Zvjkة�a���0� �:yb            x������ � �          �  x��WMo�0=;����.��1iS%�6�v{�dB� p�Ϳ_LÇ�x����{�xfx��y���51���_�����Q���0��G��1��r�!������ź��\lV7�H\l��t�%�0
qy�:
�?����.�'B7�^(֍��nW��m����'���qB��}�9�5�{6��s�l=)v��szl7���%���Xg>DC���>��k���8%����[6�1�wܶ�ħ���zX8V������O0��}lnC��"�5���L}�	=����*B��ԇ6�`O���� "��8L�AO$���'X��t�(;Ͱ�	:U%�j�(m"Mx��iG||�����w��܇�R��ߧ�.�IDG��=�aT���иY��f��yZ���a�,���-�������g�T���]�B�ly��HL�N�J⋞��/I�)\0.z���âe)�%2����
z~�*i��r��\2ٍ�Z����S�v6ߢO�䯖�V+3�P��j`��Y	�Tq���{���'n��hn��1���1;�c0�u�n����%�ĥ~�iS`����3g���lV�ێ�:��<0��v\�����"#p�90s�s�R/�މ� |M)���Yo������>{�n?��P\�O���Ȭ���+=��ꪬ8LS���e2M�]kj���n4�Vo�2�t�X"�:�Uew��U}וT�K����+�u�"CU��κTg2�bPpI$�:�YU����ՙ��\�v�LM�S����fu�T�R�c�������D�0+�ԙ�R%�Ӛ��M�|��&���U'տT��f*Ѧ{���2U� �St��n��d�^�)�oz��_�~*�      �   J  x�ŗ]o�0ǯ˧x.��q������!9�Y�0�c���oZFԋ���&���W���Z1z�����j.S�5��dZ���$�>����4[���#n���K?}F�u�<�Yq��Hk���x� �ٖeR��wI�V�*]0�n�zī���HW�(��/�6-�iF=�f0����#�����>؈q�=���BTix)��Ε��^��M�I�oB�or��k��?���ǧ	�ػ	����������F�ݢ,���߄�|O��j� �{�C[`!ڭRFK�n��Y�^�/J�q���9�")RΤ�Mb�4�)K)v�7��5 �QE�h�R�d2_S��J� ��s�����Q�n��kXe�Ӝ6�ՠ�i� �V�G�Z3Z�ھtQˁ@\kXZ��3��j�$@��m�WC��ڼZ�5�Om����&��̻B����9��9��j+ɲR�T{�d��כ���~�e44��z6S[�V�n�R��;���=l���j,spks`N�:�rS�+Ѕ�a�,{%L���=�!�U��ng��)�J���M�'m�^�vTaz!m��8��0��O      �   �   x�3��͏�K-.�I�740���W��@�?R�^R��s�J��KJ�2��㋋�9@
����k��ޒ�������Ԝ̲ԢJ��!`A� i����gDy���5G�Qpfx��pF�\� �U�m      �      x������ � �      �      x������ � �      �   �   x��Ͻ
�0��9y�<��6�vwqP
.���mR���m���b���~�8͓;[e��!�j��Fݴ�N����ϑ�qZK\�~}�3��{��rPۡY�]�0�&������Uf�Z���"����;P�N�!'�p� �9������.'AN��dA8)rR��PJ_*g�`      �   �  x���ko�:�?'��?�6�K�u�U[mo���:R�nj-�,�����&)�0c&i%����el���$����W-WK�U�/m�A,W��������^u����t�<���^�B�ns���}��b�{Ƕ�/?O������~[W��:F�/^��<�����U�	�a9<�*�gTr9/��2Z��C&w��(�U0�B�:�Ө�\E)n�<�UH�
iV�&x�ьQ��&�q��K��!��T3��9c���?x�y��q�)ljl�$���(y�S獓2����\x��J-?j9����`D;0v��;�jfĮ�P��`���y�^O7Sf�@�<D"?���A�w�|ض�c�4�^+y!���:�*Y���v۝n+e��Fg��
���j�EQ���O&�3�z��.ڌ��mS!�k�\,�!�|iv�3�,3�����8��Z���*D�d���N{6��9�nhQV���k�R�_ۀ�S3�cF�v�k�Rcm�wE�Ա��}�d3�}��|�f5�	t��$���d����kw��b��H���3�~c�{s	�����A���`�%06�{�l.<Fi-��l��|�� �I�EEf�T�ȅD_�.�y�ޛ�5/	��l6.�W�i���q�y!D�����A�*�%�Y���lCv,�v�����:�@�{���rx�a�E^��Y��Fisf���v�F�TưC0�p_gn�\&)2 ߦ _!j��V}��������_�+���9k=>"���H���8:�z�#⺓q}j�#�U"��XXl|�ҍ��,?��o�~+d%��Q*�	��	�6M��^D!0��h����}��&�ɜqw�U
(h8R������r%��S3F��E�bR3:��r��
����֬0mh�ǼІf�N~�t�ǁ��h��El�-K��ҨX8
�
�ۍ@*����s�Dt`I���k �N�,�o��B^HDİ��`��^a�#���zWlЃE�\�V�����B.^01�UG|-Y/M0aL�5�& Ƭ�`����lC5������i���B��1B5��$c�J
ML�������e;-Iٌf����Ꞟ��P��r�p�'q�Lj�r�{�07�I�cN�Bo(l_�6_��}���~兿�1N(�״�@� .cc"p�4�������+Y7�      �      x������ � �      �      x������ � �      2   S   x��̱�0D�ڞ���\d&H�	��r�G���z:��d�����0����T�++͝���
FY��{��6NU��+      0   �   x����� ߦ�k �׀�.E���� �+k�1B�F�0��2��tS��0?T�:e#7�*�idP��N��u"uerZSӗ@L��i3A�i�s.y�D�{��j���>Q�y��q�W��B\{)��hf      .      x������ � �      -      x������ � �      +      x������ � �      )      x������ � �      '      x������ � �      %      x������ � �      #      x������ � �      !      x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �     