-- Table: dwh.kpi_definition

-- DROP TABLE dwh.kpi_definition;

CREATE TABLE dwh.kpi_definition
(
    id serial,
    code text COLLATE pg_catalog."default" NOT NULL,
    name text COLLATE pg_catalog."default",
    description text COLLATE pg_catalog."default",
    uom_category text COLLATE pg_catalog."default",
    trend text COLLATE pg_catalog."default",
    timing text COLLATE pg_catalog."default" NOT NULL,
    production_methodology text COLLATE pg_catalog."default",
    sort_order integer,
    is_deleted boolean NOT NULL,
    parent_id integer,
    resource_scope text COLLATE pg_catalog."default",
    value_type text COLLATE pg_catalog."default",
    CONSTRAINT "PK_kpi_definition" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE dwh.kpi_definition
    OWNER to postgres;

CREATE TABLE dwh.kpi_definition_parameters
(
    id serial,
    kpi_input jsonb NOT NULL,
    kpi_output jsonb NOT NULL,
    kpi_definition integer NOT NULL,
    CONSTRAINT "PK_kpi_input_def" PRIMARY KEY (id),
    CONSTRAINT kpi_input_def_relationship FOREIGN KEY (kpi_definition)
        REFERENCES dwh.kpi_definition (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE dwh.kpi_definition_parameters
    OWNER to postgres;
-- Index: kpi_definition_input_relationship

-- DROP INDEX dwh.kpi_definition_input_relationship;

CREATE INDEX kpi_definition_input_relationship
    ON dwh.kpi_definition_parameters USING btree
    (kpi_definition ASC NULLS LAST)
    TABLESPACE pg_default;
	
-- Table: dwh.kpi_definition_resource_type_reference

-- DROP TABLE dwh.kpi_definition_resource_type_reference;

CREATE TABLE dwh.kpi_definition_resource_type_reference
(
    id serial,
    dimension_table text COLLATE pg_catalog."default" NOT NULL,
    resource_context text COLLATE pg_catalog."default" NOT NULL,
    resource_type_code text COLLATE pg_catalog."default" NOT NULL,
    kpi_definition integer NOT NULL,
    CONSTRAINT "PK_resource_type_reference" PRIMARY KEY (id),
    CONSTRAINT "FK_resource_type_reference_kpi_definition" FOREIGN KEY (kpi_definition)
        REFERENCES dwh.kpi_definition (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE dwh.kpi_definition_resource_type_reference
    OWNER to postgres;
-- Index: FK_resource_type_reference_kpi_definition_idx

-- DROP INDEX dwh."FK_resource_type_reference_kpi_definition_idx";

CREATE INDEX "FK_resource_type_reference_kpi_definition_idx"
    ON dwh.kpi_definition_resource_type_reference USING btree
    (kpi_definition ASC NULLS LAST)
    TABLESPACE pg_default;
	
-- Table: dwh.kpi_definition_time_range

-- DROP TABLE dwh.kpi_definition_time_range;

CREATE TABLE dwh.kpi_definition_time_range
(
    id serial,
    start_time timestamp without time zone NOT NULL,
    end_time timestamp without time zone,
    recurrence interval NOT NULL,
    duration interval,
    kpi_definition integer NOT NULL,
    CONSTRAINT "PK_kpi_definition_time_range" PRIMARY KEY (id),
    CONSTRAINT "FK_kpi_definition_time_range" FOREIGN KEY (kpi_definition)
        REFERENCES dwh.kpi_definition (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE dwh.kpi_definition_time_range
    OWNER to postgres;
-- Index: fk_kpi_definition_time_range_idx

-- DROP INDEX dwh.fk_kpi_definition_time_range_idx;

CREATE INDEX fk_kpi_definition_time_range_idx
    ON dwh.kpi_definition_time_range USING btree
    (kpi_definition ASC NULLS LAST)
    TABLESPACE pg_default;
	
------------
-- Table: dwh.kpi_instance

-- DROP TABLE dwh.kpi_instance;

CREATE TABLE dwh.kpi_instance
(
    id serial,
    code text COLLATE pg_catalog."default" NOT NULL,
    name text COLLATE pg_catalog."default" NOT NULL,
    description text COLLATE pg_catalog."default",
    uom text COLLATE pg_catalog."default",
    trend text COLLATE pg_catalog."default",
    timing text COLLATE pg_catalog."default",
    production_methodology text COLLATE pg_catalog."default",
    min_value integer,
    max_value integer,
    target_value integer,
    kpi_definition_id integer NOT NULL,
    sort_order integer,
    is_deleted boolean NOT NULL,
    CONSTRAINT "PK_kpi_instance" PRIMARY KEY (id),
    CONSTRAINT kpi_definition_instance_relationship FOREIGN KEY (kpi_definition_id)
        REFERENCES dwh.kpi_definition (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE dwh.kpi_instance
    OWNER to postgres;
-- Index: fkIdx_32

-- DROP INDEX dwh."fkIdx_32";

CREATE INDEX "fkIdx_32"
    ON dwh.kpi_instance USING btree
    (kpi_definition_id ASC NULLS LAST)
    TABLESPACE pg_default;
	
	
	-- Table: dwh.kpi_instance_parameters

-- DROP TABLE dwh.kpi_instance_parameters;

CREATE TABLE dwh.kpi_instance_parameters
(
    id serial,
    kpi_input jsonb NOT NULL,
    kpi_output jsonb NOT NULL,
    kpi_instance integer NOT NULL,
    CONSTRAINT "PK_kpi_input_definition" PRIMARY KEY (id),
    CONSTRAINT kpi_instance_input_relationship FOREIGN KEY (kpi_instance)
        REFERENCES dwh.kpi_instance (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE dwh.kpi_instance_parameters
    OWNER to postgres;
-- Index: kpi_instance_input_relationship

-- DROP INDEX dwh.kpi_instance_input_relationship;

CREATE INDEX kpi_instance_input_relationship
    ON dwh.kpi_instance_parameters USING btree
    (kpi_instance ASC NULLS LAST)
    TABLESPACE pg_default;
	
	-- Table: dwh.kpi_instance_resource_reference

-- DROP TABLE dwh.kpi_instance_resource_reference;

CREATE TABLE dwh.kpi_instance_resource_reference
(
    id serial,
    dimension_table text COLLATE pg_catalog."default" NOT NULL,
    resource_context text COLLATE pg_catalog."default" NOT NULL,
    resource_code text COLLATE pg_catalog."default" NOT NULL,
    kpi_instance integer NOT NULL,
    CONSTRAINT "PK_kpi_instance_resource_reference" PRIMARY KEY (id),
    CONSTRAINT "FK_64" FOREIGN KEY (kpi_instance)
        REFERENCES dwh.kpi_instance (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE dwh.kpi_instance_resource_reference
    OWNER to postgres;
-- Index: fkIdx_64

-- DROP INDEX dwh."fkIdx_64";

CREATE INDEX "fkIdx_64"
    ON dwh.kpi_instance_resource_reference USING btree
    (kpi_instance ASC NULLS LAST)
    TABLESPACE pg_default;
	
	-- Table: dwh.kpi_instance_time_range

-- DROP TABLE dwh.kpi_instance_time_range;

CREATE TABLE dwh.kpi_instance_time_range
(
    id serial,
    start_time timestamp without time zone,
    end_time timestamp without time zone,
    last_execution_time timestamp without time zone,
    recurrence interval NOT NULL,
    duration interval,
    kpi_instance integer NOT NULL,
    CONSTRAINT "PK_kpi_instance_time_range" PRIMARY KEY (id),
    CONSTRAINT "FK_kpi_instance_time_range" FOREIGN KEY (kpi_instance)
        REFERENCES dwh.kpi_instance (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE dwh.kpi_instance_time_range
    OWNER to postgres;
-- Index: FK_kpi_instance_time_range_idx

-- DROP INDEX dwh."FK_kpi_instance_time_range_idx";

CREATE INDEX "FK_kpi_instance_time_range_idx"
    ON dwh.kpi_instance_time_range USING btree
    (kpi_instance ASC NULLS LAST)
    TABLESPACE pg_default;