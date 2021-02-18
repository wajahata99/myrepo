CREATE SEQUENCE dwh.kpi_instance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

 


ALTER TABLE dwh.kpi_instance_id_seq OWNER TO postgres;

 

--
-- Name: kpi_instance_id_seq; Type: SEQUENCE OWNED BY; Schema: dwh; Owner: postgres
--

 

ALTER SEQUENCE dwh.kpi_instance_id_seq OWNED BY dwh.kpi_instance.id;
CREATE SEQUENCE dwh.kpi_instance_input_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

 


ALTER TABLE dwh.kpi_instance_input_id_seq OWNER TO postgres;

 

--
-- Name: kpi_instance_input_id_seq; Type: SEQUENCE OWNED BY; Schema: dwh; Owner: postgres
--

 

ALTER SEQUENCE dwh.kpi_instance_input_id_seq OWNED BY dwh.kpi_instance_parameters.id;
CREATE SEQUENCE dwh.kpi_instance_resource_reference_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

 


ALTER TABLE dwh.kpi_instance_resource_reference_id_seq OWNER TO postgres;

 

--
-- Name: kpi_instance_resource_reference_id_seq; Type: SEQUENCE OWNED BY; Schema: dwh; Owner: postgres
--

 

ALTER SEQUENCE dwh.kpi_instance_resource_reference_id_seq OWNED BY dwh.kpi_instance_resource_reference.id;
CREATE SEQUENCE dwh.kpi_instance_time_range_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

 


ALTER TABLE dwh.kpi_instance_time_range_id_seq OWNER TO postgres;

 

--
-- Name: kpi_instance_time_range_id_seq; Type: SEQUENCE OWNED BY; Schema: dwh; Owner: postgres
--

 

ALTER SEQUENCE dwh.kpi_instance_time_range_id_seq OWNED BY dwh.kpi_instance_time_range.id;

CREATE SEQUENCE dwh.kpi_definition_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

 


ALTER TABLE dwh.kpi_definition_id_seq OWNER TO postgres;

 

--
-- Name: kpi_definition_id_seq; Type: SEQUENCE OWNED BY; Schema: dwh; Owner: postgres
--

 

ALTER SEQUENCE dwh.kpi_definition_id_seq OWNED BY dwh.kpi_definition.id;

CREATE SEQUENCE dwh.kpi_definition_input_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

 


ALTER TABLE dwh.kpi_definition_input_id_seq OWNER TO postgres;

 

--
-- Name: kpi_definition_input_id_seq; Type: SEQUENCE OWNED BY; Schema: dwh; Owner: postgres
--

 

ALTER SEQUENCE dwh.kpi_definition_input_id_seq OWNED BY dwh.kpi_definition_parameters.id;