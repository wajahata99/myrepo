--Equipment Model

CREATE TABLE dt."Equipment" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "madeFromId" text,
    "madeFromType" text,
    "recordType" character varying(25),
    parent character varying(25),
    "equipmentLevel" character varying(25)
);


ALTER TABLE dt."Equipment" OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 36416)
-- Name: EquipmentActual; Type: TABLE; Schema: dt; Owner: postgres
--

CREATE TABLE dt."EquipmentActual" (
    id character varying(25) NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "madeFromId" text,
    "madeFromType" text,
    "resourceUse" text,
    "selectToRun" boolean NOT NULL,
    "linkedGroup" text,
    quantity numeric(65,30),
    equipment character varying(25),
    "segmentResponse" character varying(25),
    "quantityUom" character varying(25),
    "jobResponse" character varying(25),
    "equipmentClass" character varying(25)
);


ALTER TABLE dt."EquipmentActual" OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 36422)
-- Name: EquipmentActualProperty; Type: TABLE; Schema: dt; Owner: postgres
--

CREATE TABLE dt."EquipmentActualProperty" (
    id character varying(25) NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    value numeric(65,30),
    "valueStr" text,
    "maxValue" text,
    "minValue" text,
    "defaultValue" text,
    "possibleValues" text,
    "isRequired" boolean NOT NULL,
    "isMutable" boolean NOT NULL,
    "scriptAssociation" text,
    quantity numeric(65,30),
    "madeFromId" text,
    "madeFromType" text,
    category character varying(25),
    "uomCategory" character varying(25),
    "sensorType" character varying(25),
    "quantityUom" character varying(25),
    "valueUom" character varying(25),
    sensor character varying(25),
    "equipmentActual" character varying(25),
    parent character varying(25),
    "propertyType" character varying(25)
);


ALTER TABLE dt."EquipmentActualProperty" OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 36428)
-- Name: EquipmentAssetMapping; Type: TABLE; Schema: dt; Owner: postgres
--

CREATE TABLE dt."EquipmentAssetMapping" (
    id character varying(25) NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "startTime" timestamp(3) without time zone NOT NULL,
    "endTime" timestamp(3) without time zone NOT NULL,
    "physicalAsset" character varying(25),
    equipment character varying(25)
);


ALTER TABLE dt."EquipmentAssetMapping" OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 36434)
-- Name: EquipmentCapability; Type: TABLE; Schema: dt; Owner: postgres
--

CREATE TABLE dt."EquipmentCapability" (
    id character varying(25) NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    reason text NOT NULL,
    "startTime" timestamp(3) without time zone NOT NULL,
    "endTime" timestamp(3) without time zone NOT NULL,
    "confidenceFactor" integer,
    quantity numeric(65,30),
    "workCapability" character varying(25),
    "capabilityType" character varying(25),
    "resourceUse" character varying(25),
    "processSegmentCapability" character varying(25),
    "hierarchyScope" character varying(25),
    equipment character varying(25),
    "operationsCapability" character varying(25),
    "equipmentClass" character varying(25),
    "quantityUom" character varying(25),
    "workMasterCapability" character varying(25)
);


ALTER TABLE dt."EquipmentCapability" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 36440)
-- Name: EquipmentCapabilityProperty; Type: TABLE; Schema: dt; Owner: postgres
--

CREATE TABLE dt."EquipmentCapabilityProperty" (
    id character varying(25) NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    value numeric(65,30),
    "valueStr" text,
    "maxValue" text,
    "minValue" text,
    "defaultValue" text,
    "possibleValues" text,
    "isRequired" boolean NOT NULL,
    "isMutable" boolean NOT NULL,
    "scriptAssociation" text,
    quantity numeric(65,30),
    category character varying(25),
    "uomCategory" character varying(25),
    sensor character varying(25),
    "equipmentCapability" character varying(25),
    "propertyType" character varying(25),
    "quantityUom" character varying(25),
    "sensorType" character varying(25),
    "valueUom" character varying(25),
    parent character varying(25)
);


ALTER TABLE dt."EquipmentCapabilityProperty" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 36446)
-- Name: EquipmentClass; Type: TABLE; Schema: dt; Owner: postgres
--

CREATE TABLE dt."EquipmentClass" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "isInstantiable" boolean NOT NULL,
    parent character varying(25),
    "equipmentLevel" character varying(25)
);


ALTER TABLE dt."EquipmentClass" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 36452)
-- Name: EquipmentClassMapping; Type: TABLE; Schema: dt; Owner: postgres
--

CREATE TABLE dt."EquipmentClassMapping" (
    equipment character varying(25) NOT NULL,
    "equipmentClass" character varying(25) NOT NULL
);


ALTER TABLE dt."EquipmentClassMapping" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 36455)
-- Name: EquipmentClassProperty; Type: TABLE; Schema: dt; Owner: postgres
--

CREATE TABLE dt."EquipmentClassProperty" (
    id character varying(25) NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    value numeric(65,30),
    "valueStr" text,
    "maxValue" text,
    "minValue" text,
    "defaultValue" text,
    "possibleValues" text,
    "isRequired" boolean NOT NULL,
    "isMutable" boolean NOT NULL,
    "scriptAssociation" text,
    "madeFromId" text,
    "madeFromType" text,
    "propertyType" character varying(25),
    "uomCategory" character varying(25),
    "sensorType" character varying(25),
    category character varying(25),
    "equipmentClass" character varying(25),
    "valueUom" character varying(25),
    parent character varying(25),
    sensor character varying(25)
);


ALTER TABLE dt."EquipmentClassProperty" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 36461)
-- Name: EquipmentProperty; Type: TABLE; Schema: dt; Owner: postgres
--

CREATE TABLE dt."EquipmentProperty" (
    id character varying(25) NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    value numeric(65,30),
    "valueStr" text,
    "maxValue" text,
    "minValue" text,
    "defaultValue" text,
    "possibleValues" text,
    "isRequired" boolean NOT NULL,
    "isMutable" boolean NOT NULL,
    "scriptAssociation" text,
    "madeFromId" text,
    "madeFromType" text,
    category character varying(25),
    "valueUom" character varying(25),
    parent character varying(25),
    "sensorType" character varying(25),
    "uomCategory" character varying(25),
    "propertyType" character varying(25),
    equipment character varying(25),
    sensor character varying(25)
);


ALTER TABLE dt."EquipmentProperty" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 36467)
-- Name: EquipmentRequirement; Type: TABLE; Schema: dt; Owner: postgres
--

CREATE TABLE dt."EquipmentRequirement" (
    id character varying(25) NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "madeFromId" text,
    "madeFromType" text,
    quantity numeric(65,30),
    "selectToRun" boolean NOT NULL,
    "linkedGroup" text,
    "resourceUse" text,
    "alternateResourse" character varying(25),
    equipment character varying(25),
    "jobOrder" character varying(25),
    "segmentRequirement" character varying(25),
    "equipmentClass" character varying(25),
    "quantityUom" character varying(25)
);


ALTER TABLE dt."EquipmentRequirement" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 36473)
-- Name: EquipmentRequirementProperty; Type: TABLE; Schema: dt; Owner: postgres
--

CREATE TABLE dt."EquipmentRequirementProperty" (
    id character varying(25) NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    value numeric(65,30),
    "valueStr" text,
    "maxValue" text,
    "minValue" text,
    "defaultValue" text,
    "possibleValues" text,
    "isRequired" boolean NOT NULL,
    "isMutable" boolean NOT NULL,
    "scriptAssociation" text,
    quantity numeric(65,30),
    "logRate" numeric(65,30),
    "madeFromId" text,
    "madeFromType" text,
    "logRateUom" character varying(25),
    sensor character varying(25),
    parent character varying(25),
    category character varying(25),
    "uomCategory" character varying(25),
    "sensorType" character varying(25),
    "propertyType" character varying(25),
    "valueUom" character varying(25),
    "quantityUom" character varying(25),
    "equipmentRequirement" character varying(25)
);


ALTER TABLE dt."EquipmentRequirementProperty" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 36479)
-- Name: EquipmentSegmentSpecification; Type: TABLE; Schema: dt; Owner: postgres
--

CREATE TABLE dt."EquipmentSegmentSpecification" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "madeFromId" text,
    "madeFromType" text,
    quantity numeric(65,30),
    "resourceUse" text,
    "linkedGroup" text,
    "quantityUom" character varying(25),
    "processSegment" character varying(25),
    equipment character varying(25),
    "equipmentClass" character varying(25)
);


ALTER TABLE dt."EquipmentSegmentSpecification" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 36485)
-- Name: EquipmentSegmentSpecificationProperty; Type: TABLE; Schema: dt; Owner: postgres
--

CREATE TABLE dt."EquipmentSegmentSpecificationProperty" (
    id character varying(25) NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    value numeric(65,30),
    "valueStr" text,
    "maxValue" text,
    "minValue" text,
    "defaultValue" text,
    "possibleValues" text,
    "isRequired" boolean NOT NULL,
    "isMutable" boolean NOT NULL,
    "scriptAssociation" text,
    quantity numeric(65,30),
    "madeFromId" text,
    "madeFromType" text,
    "propertyType" character varying(25),
    "sensorType" character varying(25),
    "valueUom" character varying(25),
    "quantityUom" character varying(25),
    sensor character varying(25),
    "equipmentSegmentSpecification" character varying(25),
    category character varying(25),
    "uomCategory" character varying(25),
    parent character varying(25)
);


ALTER TABLE dt."EquipmentSegmentSpecificationProperty" OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 36491)
-- Name: EquipmentSegmentSpecificationStreamMapping; Type: TABLE; Schema: dt; Owner: postgres
--

CREATE TABLE dt."EquipmentSegmentSpecificationStreamMapping" (
    id character varying(25) NOT NULL,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "inStream" boolean NOT NULL,
    "equipmentSegmentSpecification" character varying(25),
    stream character varying(25)
);


ALTER TABLE dt."EquipmentSegmentSpecificationStreamMapping" OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 36494)
-- Name: EquipmentSpecification; Type: TABLE; Schema: dt; Owner: postgres
--

CREATE TABLE dt."EquipmentSpecification" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "madeFromId" text,
    "madeFromType" text,
    quantity numeric(65,30),
    "selectToRun" boolean NOT NULL,
    "linkedGroup" text,
    "resourceUse" text,
    "workMaster" character varying(25),
    equipment character varying(25),
    "quantityUom" character varying(25),
    "operationsSegment" character varying(25),
    "equipmentClass" character varying(25)
);


ALTER TABLE dt."EquipmentSpecification" OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 36500)
-- Name: EquipmentSpecificationProperty; Type: TABLE; Schema: dt; Owner: postgres
--

CREATE TABLE dt."EquipmentSpecificationProperty" (
    id character varying(25) NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    value numeric(65,30),
    "valueStr" text,
    "maxValue" text,
    "minValue" text,
    "defaultValue" text,
    "possibleValues" text,
    "isRequired" boolean NOT NULL,
    "isMutable" boolean NOT NULL,
    "scriptAssociation" text,
    "logRate" numeric(65,30),
    quantity numeric(65,30),
    "madeFromId" text,
    "madeFromType" text,
    parent character varying(25),
    "uomCategory" character varying(25),
    "propertyType" character varying(25),
    "valueUom" character varying(25),
    category character varying(25),
    "logRateUom" character varying(25),
    sensor character varying(25),
    "quantityUom" character varying(25),
    "sensorType" character varying(25),
    "equipmentSpecification" character varying(25)
);


ALTER TABLE dt."EquipmentSpecificationProperty" OWNER TO postgres;
