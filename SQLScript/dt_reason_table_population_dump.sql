PGDMP         )                y            DT_athena_db_dump    12.3    12.3    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    36368    DT_athena_db_dump    DATABASE     �   CREATE DATABASE "DT_athena_db_dump" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_Pakistan.1252' LC_CTYPE = 'English_Pakistan.1252';
 #   DROP DATABASE "DT_athena_db_dump";
                postgres    false                        2615    36369    dt    SCHEMA        CREATE SCHEMA dt;
    DROP SCHEMA dt;
                postgres    false            �            1259    36374    CalendarPattern    TABLE       CREATE TABLE dt."CalendarPattern" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "objectCategory" character varying(25)
);
 !   DROP TABLE dt."CalendarPattern";
       dt         heap    postgres    false    6            �            1259    36380    CalendarPatternEntry    TABLE       CREATE TABLE dt."CalendarPatternEntry" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "sequenceNumber" integer NOT NULL,
    "daysCount" integer NOT NULL,
    "startingTime" timestamp(3) without time zone NOT NULL,
    "endingTime" timestamp(3) without time zone NOT NULL,
    duration timestamp(3) without time zone,
    "entryType" character varying(25),
    "calendarPattern" character varying(25)
);
 &   DROP TABLE dt."CalendarPatternEntry";
       dt         heap    postgres    false    6            �            1259    36386    Customer    TABLE     >  CREATE TABLE dt."Customer" (
    id character varying(25) NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    description text,
    country text,
    city text,
    "sortOrder" integer NOT NULL,
    "isDeleted" boolean NOT NULL,
    parent character varying(25),
    "customerClass" character varying(25)
);
    DROP TABLE dt."Customer";
       dt         heap    postgres    false    6            �            1259    36392    CustomerClass    TABLE     �   CREATE TABLE dt."CustomerClass" (
    id character varying(25) NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL
);
    DROP TABLE dt."CustomerClass";
       dt         heap    postgres    false    6            �            1259    36398    CustomerClassProperty    TABLE       CREATE TABLE dt."CustomerClassProperty" (
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
    parent character varying(25),
    "customerClass" character varying(25),
    "propertyType" character varying(25),
    category character varying(25),
    sensor character varying(25),
    "valueUom" character varying(25),
    "uomCategory" character varying(25),
    "sensorType" character varying(25)
);
 '   DROP TABLE dt."CustomerClassProperty";
       dt         heap    postgres    false    6            �            1259    36404    CustomerProperty    TABLE     �  CREATE TABLE dt."CustomerProperty" (
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
    "propertyType" character varying(25),
    parent character varying(25),
    "valueUom" character varying(25),
    "uomCategory" character varying(25),
    category character varying(25),
    "sensorType" character varying(25),
    customer character varying(25),
    sensor character varying(25)
);
 "   DROP TABLE dt."CustomerProperty";
       dt         heap    postgres    false    6            �            1259    36410 	   Equipment    TABLE     w  CREATE TABLE dt."Equipment" (
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
    DROP TABLE dt."Equipment";
       dt         heap    postgres    false    6            �            1259    36416    EquipmentActual    TABLE     H  CREATE TABLE dt."EquipmentActual" (
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
 !   DROP TABLE dt."EquipmentActual";
       dt         heap    postgres    false    6            �            1259    36422    EquipmentActualProperty    TABLE     {  CREATE TABLE dt."EquipmentActualProperty" (
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
 )   DROP TABLE dt."EquipmentActualProperty";
       dt         heap    postgres    false    6            �            1259    36428    EquipmentAssetMapping    TABLE     m  CREATE TABLE dt."EquipmentAssetMapping" (
    id character varying(25) NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "startTime" timestamp(3) without time zone NOT NULL,
    "endTime" timestamp(3) without time zone NOT NULL,
    "physicalAsset" character varying(25),
    equipment character varying(25)
);
 '   DROP TABLE dt."EquipmentAssetMapping";
       dt         heap    postgres    false    6            �            1259    36434    EquipmentCapability    TABLE     c  CREATE TABLE dt."EquipmentCapability" (
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
 %   DROP TABLE dt."EquipmentCapability";
       dt         heap    postgres    false    6            �            1259    36440    EquipmentCapabilityProperty    TABLE     S  CREATE TABLE dt."EquipmentCapabilityProperty" (
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
 -   DROP TABLE dt."EquipmentCapabilityProperty";
       dt         heap    postgres    false    6            �            1259    36446    EquipmentClass    TABLE     K  CREATE TABLE dt."EquipmentClass" (
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
     DROP TABLE dt."EquipmentClass";
       dt         heap    postgres    false    6            �            1259    36452    EquipmentClassMapping    TABLE     �   CREATE TABLE dt."EquipmentClassMapping" (
    equipment character varying(25) NOT NULL,
    "equipmentClass" character varying(25) NOT NULL
);
 '   DROP TABLE dt."EquipmentClassMapping";
       dt         heap    postgres    false    6            �            1259    36455    EquipmentClassProperty    TABLE     3  CREATE TABLE dt."EquipmentClassProperty" (
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
 (   DROP TABLE dt."EquipmentClassProperty";
       dt         heap    postgres    false    6            �            1259    36461    EquipmentProperty    TABLE     '  CREATE TABLE dt."EquipmentProperty" (
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
 #   DROP TABLE dt."EquipmentProperty";
       dt         heap    postgres    false    6            �            1259    36467    EquipmentRequirement    TABLE     |  CREATE TABLE dt."EquipmentRequirement" (
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
 &   DROP TABLE dt."EquipmentRequirement";
       dt         heap    postgres    false    6            �            1259    36473    EquipmentRequirementProperty    TABLE     �  CREATE TABLE dt."EquipmentRequirementProperty" (
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
 .   DROP TABLE dt."EquipmentRequirementProperty";
       dt         heap    postgres    false    6            �            1259    36479    EquipmentSegmentSpecification    TABLE       CREATE TABLE dt."EquipmentSegmentSpecification" (
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
 /   DROP TABLE dt."EquipmentSegmentSpecification";
       dt         heap    postgres    false    6            �            1259    36485 %   EquipmentSegmentSpecificationProperty    TABLE     �  CREATE TABLE dt."EquipmentSegmentSpecificationProperty" (
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
 7   DROP TABLE dt."EquipmentSegmentSpecificationProperty";
       dt         heap    postgres    false    6            �            1259    36491 *   EquipmentSegmentSpecificationStreamMapping    TABLE     *  CREATE TABLE dt."EquipmentSegmentSpecificationStreamMapping" (
    id character varying(25) NOT NULL,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "inStream" boolean NOT NULL,
    "equipmentSegmentSpecification" character varying(25),
    stream character varying(25)
);
 <   DROP TABLE dt."EquipmentSegmentSpecificationStreamMapping";
       dt         heap    postgres    false    6            �            1259    36494    EquipmentSpecification    TABLE     P  CREATE TABLE dt."EquipmentSpecification" (
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
 (   DROP TABLE dt."EquipmentSpecification";
       dt         heap    postgres    false    6            �            1259    36500    EquipmentSpecificationProperty    TABLE     �  CREATE TABLE dt."EquipmentSpecificationProperty" (
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
 0   DROP TABLE dt."EquipmentSpecificationProperty";
       dt         heap    postgres    false    6            �            1259    36506    EventContext    TABLE       CREATE TABLE dt."EventContext" (
    id character varying(25) NOT NULL,
    "sourceId" text NOT NULL,
    eid text NOT NULL,
    flowname text NOT NULL,
    payload text NOT NULL,
    "timestamp" text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL
);
    DROP TABLE dt."EventContext";
       dt         heap    postgres    false    6            �            1259    36512 
   EventRoute    TABLE     �   CREATE TABLE dt."EventRoute" (
    id character varying(25) NOT NULL,
    "topicName" text NOT NULL,
    "tagValue" text NOT NULL,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "eventTypeInstance" character varying(25)
);
    DROP TABLE dt."EventRoute";
       dt         heap    postgres    false    6            �            1259    36518 	   EventType    TABLE     o  CREATE TABLE dt."EventType" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "associatedDTType" text,
    "gitUrl" text,
    "createdAt" timestamp(3) without time zone NOT NULL,
    "modifiedAt" timestamp(3) without time zone,
    "createdBy" text,
    "modifiedBy" text,
    parent character varying(25),
    "notificationType" character varying(25),
    "eventCategory" character varying(25),
    "recordType" character varying(25),
    "associatedDTObjectType" character varying(25)
);
    DROP TABLE dt."EventType";
       dt         heap    postgres    false    6            �            1259    36524    EventTypeInstance    TABLE     �  CREATE TABLE dt."EventTypeInstance" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "associatedDTEntity" text,
    status text,
    "createdAt" timestamp(3) without time zone NOT NULL,
    "modifiedAt" timestamp(3) without time zone,
    "createdBy" text,
    "modifiedBy" text,
    "eventType" character varying(25),
    "associatedDTObjectEntity" character varying(25)
);
 #   DROP TABLE dt."EventTypeInstance";
       dt         heap    postgres    false    6            �            1259    36530    EventTypeInstanceProperty    TABLE     	  CREATE TABLE dt."EventTypeInstanceProperty" (
    id character varying(25) NOT NULL,
    value text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "eventTypeProperty" character varying(25),
    "eventTypeInstance" character varying(25)
);
 +   DROP TABLE dt."EventTypeInstanceProperty";
       dt         heap    postgres    false    6            �            1259    36536    EventTypeProperty    TABLE     �  CREATE TABLE dt."EventTypeProperty" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isRequired" boolean NOT NULL,
    value text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "isMutable" boolean NOT NULL,
    category character varying(25),
    "flowMeta" character varying(25),
    "eventType" character varying(25),
    "propertyType" character varying(25)
);
 #   DROP TABLE dt."EventTypeProperty";
       dt         heap    postgres    false    6            �            1259    36542    FlowMeta    TABLE     w  CREATE TABLE dt."FlowMeta" (
    id character varying(25) NOT NULL,
    "topicName" text NOT NULL,
    "isInput" boolean NOT NULL,
    "isTag" boolean NOT NULL,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL,
    "modifiedAt" timestamp(3) without time zone,
    "flowType" character varying(25)
);
    DROP TABLE dt."FlowMeta";
       dt         heap    postgres    false    6            �            1259    36548    FlowType    TABLE     �  CREATE TABLE dt."FlowType" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    script text,
    "gitUrl" text,
    "createdAt" timestamp(3) without time zone NOT NULL,
    "modifiedAt" timestamp(3) without time zone,
    "createdBy" text,
    "modifiedBy" text,
    "deploymentStatus" text NOT NULL,
    "eventTypes" character varying(25)
);
    DROP TABLE dt."FlowType";
       dt         heap    postgres    false    6            �            1259    36554    FromResourceReference    TABLE     ^  CREATE TABLE dt."FromResourceReference" (
    id character varying(25) NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "resourceId" text NOT NULL,
    "resourceNetworkConnection" character varying(25),
    "resourceType" character varying(25)
);
 '   DROP TABLE dt."FromResourceReference";
       dt         heap    postgres    false    6            �            1259    36560    FromResourceReferenceProperty    TABLE       CREATE TABLE dt."FromResourceReferenceProperty" (
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
    "possibleValues" text,
    "isRequired" boolean NOT NULL,
    "isMutable" boolean NOT NULL,
    "scriptAssociation" text,
    "defaultValue" text,
    "valueUom" character varying(25),
    "uomCategory" character varying(25),
    "fromResourceReference" character varying(25),
    category character varying(25),
    parent character varying(25),
    sensor character varying(25),
    "propertyType" character varying(25),
    "sensorType" character varying(25)
);
 /   DROP TABLE dt."FromResourceReferenceProperty";
       dt         heap    postgres    false    6            �            1259    36566    JobList    TABLE     �  CREATE TABLE dt."JobList" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "startTime" timestamp(3) without time zone NOT NULL,
    "endTime" timestamp(3) without time zone NOT NULL,
    "publishedDate" timestamp(3) without time zone NOT NULL,
    "hierarchyScope" character varying(25),
    "workType" character varying(25)
);
    DROP TABLE dt."JobList";
       dt         heap    postgres    false    6            �            1259    36572    JobListProperty    TABLE     �  CREATE TABLE dt."JobListProperty" (
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
    category character varying(25),
    "uomCategory" character varying(25),
    parent character varying(25),
    "jobList" character varying(25),
    "sensorType" character varying(25),
    "propertyType" character varying(25),
    sensor character varying(25),
    "valueUom" character varying(25)
);
 !   DROP TABLE dt."JobListProperty";
       dt         heap    postgres    false    6            �            1259    36578    JobOrder    TABLE     �  CREATE TABLE dt."JobOrder" (
    id character varying(25) NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "workMasterVersion" text,
    "startTime" timestamp(3) without time zone NOT NULL,
    "endTime" timestamp(3) without time zone NOT NULL,
    "jobCommand" text,
    "jobCommandRule" text,
    priority character varying(25),
    "workType" character varying(25),
    "hierarchyScope" character varying(25),
    "dispatchStatus" character varying(25),
    "jobList" character varying(25),
    "workMaster" character varying(25),
    "workRequest" character varying(25)
);
    DROP TABLE dt."JobOrder";
       dt         heap    postgres    false    6            �            1259    36584    JobOrderParameter    TABLE     �  CREATE TABLE dt."JobOrderParameter" (
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
    "uomCategory" character varying(25),
    parent character varying(25),
    sensor character varying(25),
    "sensorType" character varying(25),
    "jobOrder" character varying(25),
    category character varying(25),
    "propertyType" character varying(25),
    "valueUom" character varying(25)
);
 #   DROP TABLE dt."JobOrderParameter";
       dt         heap    postgres    false    6            �            1259    36590    JobResponse    TABLE     y  CREATE TABLE dt."JobResponse" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "workMasterVersion" text,
    "startTime" timestamp(3) without time zone NOT NULL,
    "endTime" timestamp(3) without time zone NOT NULL,
    "responseStatus" character varying(25),
    "hierarchyScope" character varying(25),
    "jobOrder" character varying(25),
    "workResponse" character varying(25),
    "workMaster" character varying(25),
    "workType" character varying(25),
    parent character varying(25)
);
    DROP TABLE dt."JobResponse";
       dt         heap    postgres    false    6            �            1259    36596    JobResponseData    TABLE     �  CREATE TABLE dt."JobResponseData" (
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
    category character varying(25),
    parent character varying(25),
    sensor character varying(25),
    "sensorType" character varying(25),
    "jobResponse" character varying(25),
    "valueUom" character varying(25),
    "uomCategory" character varying(25),
    "propertyType" character varying(25)
);
 !   DROP TABLE dt."JobResponseData";
       dt         heap    postgres    false    6            �            1259    36602    Lookup    TABLE     n  CREATE TABLE dt."Lookup" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    value text,
    "isClientSpecific" boolean NOT NULL,
    "isHidden" boolean NOT NULL,
    category character varying(25),
    parent character varying(25)
);
    DROP TABLE dt."Lookup";
       dt         heap    postgres    false    6            �            1259    36608    LookupCategory    TABLE     �   CREATE TABLE dt."LookupCategory" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL
);
     DROP TABLE dt."LookupCategory";
       dt         heap    postgres    false    6            �            1259    36614    MaterialActual    TABLE     f  CREATE TABLE dt."MaterialActual" (
    id character varying(25) NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    quantity numeric(65,30),
    "sequenceNumber" integer,
    "madeFromId" text,
    "madeFromType" text,
    "materialClass" character varying(25),
    parent character varying(25),
    "assemblyRelationship" character varying(25),
    "materialLot" character varying(25),
    "assemblyType" character varying(25),
    "quantityUom" character varying(25),
    "storageLocation" character varying(25),
    "jobResponse" character varying(25),
    "resourceUse" character varying(25),
    stream character varying(25),
    "materialDefinition" character varying(25),
    "segmentResponse" character varying(25),
    "materialSubLot" character varying(25)
);
     DROP TABLE dt."MaterialActual";
       dt         heap    postgres    false    6            �            1259    36620    MaterialActualProperty    TABLE     y  CREATE TABLE dt."MaterialActualProperty" (
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
    "quantityUom" character varying(25),
    "sensorType" character varying(25),
    "valueUom" character varying(25),
    "uomCategory" character varying(25),
    category character varying(25),
    parent character varying(25),
    "materialActual" character varying(25),
    sensor character varying(25)
);
 (   DROP TABLE dt."MaterialActualProperty";
       dt         heap    postgres    false    6            �            1259    36626    MaterialAssemblyDefinition    TABLE     S  CREATE TABLE dt."MaterialAssemblyDefinition" (
    id character varying(25) NOT NULL,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "assembledFrom" character varying(25),
    "assemblyType" character varying(25),
    "materialDefinition" character varying(25),
    "assemblyRelationship" character varying(25)
);
 ,   DROP TABLE dt."MaterialAssemblyDefinition";
       dt         heap    postgres    false    6            �            1259    36629    MaterialCapability    TABLE     ?  CREATE TABLE dt."MaterialCapability" (
    id character varying(25) NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    reason text NOT NULL,
    "confidenceFactor" integer,
    "endTime" timestamp(3) without time zone NOT NULL,
    "startTime" timestamp(3) without time zone NOT NULL,
    quantity numeric(65,30),
    "resourceUse" character varying(25),
    "workCapability" character varying(25),
    "materialClass" character varying(25),
    "workMasterCapability" character varying(25),
    "processSegmentCapability" character varying(25),
    "operationsCapability" character varying(25),
    "materialLot" character varying(25),
    "quantityUom" character varying(25),
    "assemblyType" character varying(25),
    "hierarchyScope" character varying(25),
    "capabilityType" character varying(25),
    "materialDefinition" character varying(25),
    "materialSubLot" character varying(25),
    "assemblyRelationship" character varying(25),
    parent character varying(25)
);
 $   DROP TABLE dt."MaterialCapability";
       dt         heap    postgres    false    6            �            1259    36635    MaterialCapabilityProperty    TABLE     Q  CREATE TABLE dt."MaterialCapabilityProperty" (
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
    sensor character varying(25),
    "sensorType" character varying(25),
    "materialCapability" character varying(25),
    "propertyType" character varying(25),
    parent character varying(25),
    "uomCategory" character varying(25),
    "valueUom" character varying(25),
    "quantityUom" character varying(25)
);
 ,   DROP TABLE dt."MaterialCapabilityProperty";
       dt         heap    postgres    false    6            �            1259    36641    MaterialClass    TABLE     z  CREATE TABLE dt."MaterialClass" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "isInstantiable" boolean NOT NULL,
    "assemblyRelationship" character varying(25),
    parent character varying(25),
    "assemblyType" character varying(25)
);
    DROP TABLE dt."MaterialClass";
       dt         heap    postgres    false    6            �            1259    36647    MaterialClassMapping    TABLE     �   CREATE TABLE dt."MaterialClassMapping" (
    "materialClass" character varying(25) NOT NULL,
    "materialDefinition" character varying(25) NOT NULL
);
 &   DROP TABLE dt."MaterialClassMapping";
       dt         heap    postgres    false    6            �            1259    36650    MaterialClassProperty    TABLE     1  CREATE TABLE dt."MaterialClassProperty" (
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
    "valueUom" character varying(25),
    "uomCategory" character varying(25),
    "materialClass" character varying(25),
    category character varying(25),
    "propertyType" character varying(25),
    sensor character varying(25),
    parent character varying(25),
    "sensorType" character varying(25)
);
 '   DROP TABLE dt."MaterialClassProperty";
       dt         heap    postgres    false    6            �            1259    36656    MaterialDefinition    TABLE     �  CREATE TABLE dt."MaterialDefinition" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "sortOrder" integer NOT NULL,
    "isDeleted" boolean NOT NULL,
    "madeFromId" text,
    "madeFromType" text,
    parent character varying(25),
    "assemblyRelationship" character varying(25),
    "assemblyType" character varying(25)
);
 $   DROP TABLE dt."MaterialDefinition";
       dt         heap    postgres    false    6            �            1259    36662    MaterialDefinitionProperty    TABLE     ;  CREATE TABLE dt."MaterialDefinitionProperty" (
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
    "sensorType" character varying(25),
    "materialDefinition" character varying(25),
    "propertyType" character varying(25),
    sensor character varying(25),
    "uomCategory" character varying(25),
    "valueUom" character varying(25),
    parent character varying(25)
);
 ,   DROP TABLE dt."MaterialDefinitionProperty";
       dt         heap    postgres    false    6            �            1259    36668    MaterialLot    TABLE        CREATE TABLE dt."MaterialLot" (
    id character varying(25) NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    quantity numeric(65,30),
    "materialStatus" character varying(25),
    "quantityUom" character varying(25),
    "assemblyRelationship" character varying(25),
    "materialDefinition" character varying(25),
    "assemblyType" character varying(25),
    parent character varying(25),
    "storageLocation" character varying(25)
);
    DROP TABLE dt."MaterialLot";
       dt         heap    postgres    false    6                        1259    36674    MaterialLotProperty    TABLE     Y  CREATE TABLE dt."MaterialLotProperty" (
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
    "isRequired" boolean NOT NULL,
    "isMutable" boolean NOT NULL,
    "scriptAssociation" text,
    "defaultValue" text,
    "possibleValues" text,
    "madeFromId" text,
    "madeFromType" text,
    category character varying(25),
    "sensorType" character varying(25),
    "materialLot" character varying(25),
    "propertyType" character varying(25),
    "uomCategory" character varying(25),
    "valueUom" character varying(25),
    "materialSubLot" character varying(25),
    sensor character varying(25),
    parent character varying(25)
);
 %   DROP TABLE dt."MaterialLotProperty";
       dt         heap    postgres    false    6                       1259    36680    MaterialRequirement    TABLE     k  CREATE TABLE dt."MaterialRequirement" (
    id character varying(25) NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "madeFromId" text,
    "madeFromType" text,
    quantity numeric(65,30),
    "sequenceNumber" integer,
    "materialClass" character varying(25),
    "materialLot" character varying(25),
    "materialSubLot" character varying(25),
    "assemblyType" character varying(25),
    "materialDefinition" character varying(25),
    "segmentRequirement" character varying(25),
    "jobOrder" character varying(25),
    "assemblyRelationship" character varying(25),
    "resourceUse" character varying(25),
    "storageLocation" character varying(25),
    "quantityUom" character varying(25),
    parent character varying(25),
    stream character varying(25)
);
 %   DROP TABLE dt."MaterialRequirement";
       dt         heap    postgres    false    6                       1259    36686    MaterialRequirementBill    TABLE       CREATE TABLE dt."MaterialRequirementBill" (
    id character varying(25) NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "operationsRequest" character varying(25)
);
 )   DROP TABLE dt."MaterialRequirementBill";
       dt         heap    postgres    false    6                       1259    36692    MaterialRequirementBillItem    TABLE       CREATE TABLE dt."MaterialRequirementBillItem" (
    id character varying(25) NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    quantity numeric(65,30),
    "resourceUse" character varying(25),
    "materialRequirementBill" character varying(25),
    parent character varying(25),
    "materialDefinition" character varying(25),
    "materialClass" character varying(25),
    "quantityUom" character varying(25)
);
 -   DROP TABLE dt."MaterialRequirementBillItem";
       dt         heap    postgres    false    6                       1259    36698    MaterialRequirementProperty    TABLE     �  CREATE TABLE dt."MaterialRequirementProperty" (
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
    "uomCategory" character varying(25),
    parent character varying(25),
    "propertyType" character varying(25),
    "sensorType" character varying(25),
    sensor character varying(25),
    "materialRequirement" character varying(25),
    category character varying(25),
    "quantityUom" character varying(25),
    "logRateUom" character varying(25),
    "valueUom" character varying(25)
);
 -   DROP TABLE dt."MaterialRequirementProperty";
       dt         heap    postgres    false    6                       1259    36704    MaterialSegmentSpecification    TABLE     �  CREATE TABLE dt."MaterialSegmentSpecification" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "madeFromId" text,
    "madeFromType" text,
    quantity numeric(65,30),
    "processSegment" character varying(25),
    "assemblyType" character varying(25),
    "quantityUom" character varying(25),
    stream character varying(25),
    parent character varying(25),
    "resourceUse" character varying(25),
    "materialClass" character varying(25),
    "assemblyRelationship" character varying(25),
    "materialDefinition" character varying(25)
);
 .   DROP TABLE dt."MaterialSegmentSpecification";
       dt         heap    postgres    false    6                       1259    36710 $   MaterialSegmentSpecificationProperty    TABLE     �  CREATE TABLE dt."MaterialSegmentSpecificationProperty" (
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
    parent character varying(25),
    "uomCategory" character varying(25),
    category character varying(25),
    "quantityUom" character varying(25),
    sensor character varying(25),
    "valueUom" character varying(25),
    "propertyType" character varying(25),
    "sensorType" character varying(25),
    "materialSegmentSpecification" character varying(25)
);
 6   DROP TABLE dt."MaterialSegmentSpecificationProperty";
       dt         heap    postgres    false    6                       1259    36716    MaterialSpecification    TABLE       CREATE TABLE dt."MaterialSpecification" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "madeFromId" text,
    "madeFromType" text,
    quantity numeric(65,30),
    "operationsSegment" character varying(25),
    "assemblyType" character varying(25),
    "operationsMaterialBillItem" character varying(25),
    "quantityUom" character varying(25),
    "assemblyRelationship" character varying(25),
    stream character varying(25),
    "materialClass" character varying(25),
    "workMaster" character varying(25),
    "resourceUse" character varying(25),
    parent character varying(25),
    "materialDefinition" character varying(25)
);
 '   DROP TABLE dt."MaterialSpecification";
       dt         heap    postgres    false    6                       1259    36722    MaterialSpecificationProperty    TABLE     �  CREATE TABLE dt."MaterialSpecificationProperty" (
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
    "uomCategory" character varying(25),
    category character varying(25),
    "quantityUom" character varying(25),
    "propertyType" character varying(25),
    "materialSpecification" character varying(25),
    "logRateUom" character varying(25),
    "sensorType" character varying(25),
    "valueUom" character varying(25),
    sensor character varying(25),
    parent character varying(25)
);
 /   DROP TABLE dt."MaterialSpecificationProperty";
       dt         heap    postgres    false    6            	           1259    36728    MaterialSubLot    TABLE     �  CREATE TABLE dt."MaterialSubLot" (
    id character varying(25) NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    quantity numeric(65,30),
    "assemblyRelationship" character varying(25),
    "assemblyType" character varying(25),
    "materialLot" character varying(25),
    "quantityUom" character varying(25),
    "storageLocation" character varying(25),
    "materialStatus" character varying(25)
);
     DROP TABLE dt."MaterialSubLot";
       dt         heap    postgres    false    6            
           1259    36734    MigrationMeta    TABLE     c   CREATE TABLE dt."MigrationMeta" (
    id character varying(25) NOT NULL,
    data text NOT NULL
);
    DROP TABLE dt."MigrationMeta";
       dt         heap    postgres    false    6                       1259    36740    ObjectwisePatternConfiguration    TABLE     �  CREATE TABLE dt."ObjectwisePatternConfiguration" (
    id character varying(25) NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "appliedOnObject" text,
    "startRule" timestamp(3) without time zone NOT NULL,
    "endRule" timestamp(3) without time zone NOT NULL,
    "patternStartSequence" integer,
    "startingDayCount" integer,
    pattern character varying(25),
    "workCalendarDefinition" character varying(25)
);
 0   DROP TABLE dt."ObjectwisePatternConfiguration";
       dt         heap    postgres    false    6                       1259    36746    OperationsCapability    TABLE     =  CREATE TABLE dt."OperationsCapability" (
    id character varying(25) NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    reason text NOT NULL,
    "confidenceFactor" integer,
    "startTime" timestamp(3) without time zone NOT NULL,
    "endTime" timestamp(3) without time zone NOT NULL,
    "publishedDate" timestamp(3) without time zone NOT NULL,
    "capabilityType" character varying(25),
    parent character varying(25),
    "hierarchyScope" character varying(25)
);
 &   DROP TABLE dt."OperationsCapability";
       dt         heap    postgres    false    6                       1259    36752    OperationsCapabilityProperty    TABLE       CREATE TABLE dt."OperationsCapabilityProperty" (
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
    "isRequired" boolean NOT NULL,
    "isMutable" boolean NOT NULL,
    "scriptAssociation" text,
    "defaultValue" text,
    "possibleValues" text,
    "valueUom" character varying(25),
    "propertyType" character varying(25),
    sensor character varying(25),
    parent character varying(25),
    "operationsCapability" character varying(25),
    "uomCategory" character varying(25),
    category character varying(25),
    "sensorType" character varying(25)
);
 .   DROP TABLE dt."OperationsCapabilityProperty";
       dt         heap    postgres    false    6                       1259    36758    OperationsDefinition    TABLE     �  CREATE TABLE dt."OperationsDefinition" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "madeFromId" text,
    "madeFromType" text,
    "customerId" text,
    "customerName" text,
    version text NOT NULL,
    "billOfResourceId" text,
    "billOfMaterialId" text,
    "workMaster" text,
    "createdBy" text,
    "createdDate" timestamp(3) without time zone,
    "linkedGroup" text,
    "recordType" character varying(25),
    "operationsType" character varying(25),
    "hierarchyScope" character varying(25)
);
 &   DROP TABLE dt."OperationsDefinition";
       dt         heap    postgres    false    6                       1259    36764    OperationsDefinitionProperty    TABLE     �  CREATE TABLE dt."OperationsDefinitionProperty" (
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
    "madeFromId" text,
    "madeFromType" text,
    sensor character varying(25),
    "uomCategory" character varying(25),
    "valueUom" character varying(25),
    category character varying(25),
    "propertyType" character varying(25),
    "logRateUom" character varying(25),
    "operationsDefinition" character varying(25),
    parent character varying(25),
    "sensorType" character varying(25)
);
 .   DROP TABLE dt."OperationsDefinitionProperty";
       dt         heap    postgres    false    6                       1259    36770    OperationsMaterialBill    TABLE       CREATE TABLE dt."OperationsMaterialBill" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "operationsDefinition" character varying(25)
);
 (   DROP TABLE dt."OperationsMaterialBill";
       dt         heap    postgres    false    6                       1259    36776    OperationsMaterialBillItem    TABLE     ^  CREATE TABLE dt."OperationsMaterialBillItem" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    quantity numeric(65,30),
    "materialDefinition" character varying(25),
    "assemblyRelationship" character varying(25),
    "materialClass" character varying(25),
    "operationsMaterialBill" character varying(25),
    "quantityUom" character varying(25),
    "resourceUse" character varying(25),
    "assemblyType" character varying(25),
    parent character varying(25)
);
 ,   DROP TABLE dt."OperationsMaterialBillItem";
       dt         heap    postgres    false    6                       1259    36782    OperationsPerformance    TABLE     A  CREATE TABLE dt."OperationsPerformance" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "startTime" timestamp(3) without time zone NOT NULL,
    "endTime" timestamp(3) without time zone NOT NULL,
    "publishedDate" timestamp(3) without time zone NOT NULL,
    "hierarchyScope" character varying(25),
    "operationsType" character varying(25),
    "operationsSchedule" character varying(25),
    "performanceStatus" character varying(25)
);
 '   DROP TABLE dt."OperationsPerformance";
       dt         heap    postgres    false    6                       1259    36788    OperationsPerformanceProperty    TABLE       CREATE TABLE dt."OperationsPerformanceProperty" (
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
    "propertyType" character varying(25),
    "valueUom" character varying(25),
    category character varying(25),
    "operationsPerformance" character varying(25),
    sensor character varying(25),
    "uomCategory" character varying(25),
    "sensorType" character varying(25),
    parent character varying(25)
);
 /   DROP TABLE dt."OperationsPerformanceProperty";
       dt         heap    postgres    false    6                       1259    36794    OperationsRequest    TABLE     �  CREATE TABLE dt."OperationsRequest" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "startTime" timestamp(3) without time zone NOT NULL,
    "endTime" timestamp(3) without time zone NOT NULL,
    "createdBy" text,
    "createdDate" timestamp(3) without time zone,
    "operationsDefinition" character varying(25),
    "operationsType" character varying(25),
    "operationsSchedule" character varying(25),
    "hierarchyScope" character varying(25),
    priority character varying(25),
    "workMaster" character varying(25),
    "orderRequestStatus" character varying(25)
);
 #   DROP TABLE dt."OperationsRequest";
       dt         heap    postgres    false    6                       1259    36800    OperationsRequestProperty    TABLE     O  CREATE TABLE dt."OperationsRequestProperty" (
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
    category character varying(25),
    "logRateUom" character varying(25),
    "propertyType" character varying(25),
    sensor character varying(25),
    parent character varying(25),
    "uomCategory" character varying(25),
    "valueUom" character varying(25),
    "sensorType" character varying(25),
    "operationsRequest" character varying(25)
);
 +   DROP TABLE dt."OperationsRequestProperty";
       dt         heap    postgres    false    6                       1259    36806    OperationsResponse    TABLE     �  CREATE TABLE dt."OperationsResponse" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "createdBy" text,
    "createdDate" timestamp(3) without time zone,
    "startTime" timestamp(3) without time zone NOT NULL,
    "endTime" timestamp(3) without time zone NOT NULL,
    "operationsPerformance" character varying(25),
    "operationsRequest" character varying(25),
    "responseStatus" character varying(25),
    "hierarchyScope" character varying(25),
    "operationsDefinition" character varying(25),
    "operationsType" character varying(25)
);
 $   DROP TABLE dt."OperationsResponse";
       dt         heap    postgres    false    6                       1259    36812    OperationsResponseProperty    TABLE       CREATE TABLE dt."OperationsResponseProperty" (
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
    "valueUom" character varying(25),
    "uomCategory" character varying(25),
    parent character varying(25),
    "operationsResponse" character varying(25),
    "sensorType" character varying(25),
    "propertyType" character varying(25),
    category character varying(25),
    sensor character varying(25)
);
 ,   DROP TABLE dt."OperationsResponseProperty";
       dt         heap    postgres    false    6                       1259    36818    OperationsSchedule    TABLE       CREATE TABLE dt."OperationsSchedule" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "startTime" timestamp(3) without time zone NOT NULL,
    "endTime" timestamp(3) without time zone NOT NULL,
    "publishedDate" timestamp(3) without time zone NOT NULL,
    "operationsType" character varying(25),
    "hierarchyScope" character varying(25),
    "scheduledStatus" character varying(25)
);
 $   DROP TABLE dt."OperationsSchedule";
       dt         heap    postgres    false    6                       1259    36824    OperationsScheduleProperty    TABLE     Q  CREATE TABLE dt."OperationsScheduleProperty" (
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
    "operationsSchedule" character varying(25),
    "logRateUom" character varying(25),
    parent character varying(25),
    category character varying(25),
    "valueUom" character varying(25),
    "sensorType" character varying(25),
    sensor character varying(25),
    "uomCategory" character varying(25),
    "propertyType" character varying(25)
);
 ,   DROP TABLE dt."OperationsScheduleProperty";
       dt         heap    postgres    false    6                       1259    36830    OperationsSegment    TABLE     �  CREATE TABLE dt."OperationsSegment" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "madeFromId" text,
    "madeFromType" text,
    "isTemplate" boolean NOT NULL,
    "processFlowDiagram" text,
    "dependenciesFlowDiagram" text,
    "workMaster" text,
    duration numeric(65,30) NOT NULL,
    "operationsDefinition" character varying(25),
    "durationUom" character varying(25),
    "recordType" character varying(25),
    parent character varying(25),
    "processSegment" character varying(25),
    "operationsType" character varying(25),
    "hierarchyScope" character varying(25)
);
 #   DROP TABLE dt."OperationsSegment";
       dt         heap    postgres    false    6                       1259    36836    OperationsSegmentDependency    TABLE       CREATE TABLE dt."OperationsSegmentDependency" (
    id character varying(25) NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "madeFromId" text,
    "madeFromType" text,
    value text,
    "maxValue" text,
    "minValue" text,
    "dependencyFactor" character varying(25),
    segment character varying(25),
    "valueUom" character varying(25),
    "dependencyType" character varying(25),
    "dependentSegment" character varying(25)
);
 -   DROP TABLE dt."OperationsSegmentDependency";
       dt         heap    postgres    false    6                       1259    36842 '   OperationsSegmentParameterSpecification    TABLE     �  CREATE TABLE dt."OperationsSegmentParameterSpecification" (
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
    "isRequired" boolean NOT NULL,
    "isMutable" boolean NOT NULL,
    "scriptAssociation" text,
    "defaultValue" text,
    "possibleValues" text,
    "logRate" numeric(65,30),
    "madeFromId" text,
    "madeFromType" text,
    "propertyType" character varying(25),
    parent character varying(25),
    category character varying(25),
    sensor character varying(25),
    "sensorType" character varying(25),
    "uomCategory" character varying(25),
    "logRateUom" character varying(25),
    "valueUom" character varying(25),
    "operationsSegment" character varying(25)
);
 9   DROP TABLE dt."OperationsSegmentParameterSpecification";
       dt         heap    postgres    false    6                       1259    36848    Person    TABLE     �   CREATE TABLE dt."Person" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL
);
    DROP TABLE dt."Person";
       dt         heap    postgres    false    6                       1259    36854    PersonProperty    TABLE     !  CREATE TABLE dt."PersonProperty" (
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
    sensor character varying(25),
    "uomCategory" character varying(25),
    "sensorType" character varying(25),
    "valueUom" character varying(25),
    "propertyType" character varying(25),
    parent character varying(25),
    category character varying(25),
    person character varying(25)
);
     DROP TABLE dt."PersonProperty";
       dt         heap    postgres    false    6                       1259    36860    PersonnelActual    TABLE     	  CREATE TABLE dt."PersonnelActual" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "madeFromId" text,
    "madeFromType" text,
    "resourceUse" text,
    quantity numeric(65,30),
    "segmentResponse" character varying(25),
    "personnelClass" character varying(25),
    person character varying(25),
    "quantityUom" character varying(25),
    "jobResponse" character varying(25)
);
 !   DROP TABLE dt."PersonnelActual";
       dt         heap    postgres    false    6                        1259    36866    PersonnelActualProperty    TABLE     {  CREATE TABLE dt."PersonnelActualProperty" (
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
    "personnelActual" character varying(25),
    "propertyType" character varying(25),
    "quantityUom" character varying(25),
    category character varying(25),
    "uomCategory" character varying(25),
    parent character varying(25),
    "sensorType" character varying(25),
    sensor character varying(25),
    "valueUom" character varying(25)
);
 )   DROP TABLE dt."PersonnelActualProperty";
       dt         heap    postgres    false    6            !           1259    36872    PersonnelCapability    TABLE     `  CREATE TABLE dt."PersonnelCapability" (
    id character varying(25) NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "confidenceFactor" integer,
    reason text NOT NULL,
    "startTime" timestamp(3) without time zone NOT NULL,
    "endTime" timestamp(3) without time zone NOT NULL,
    quantity numeric(65,30),
    "workMasterCapability" character varying(25),
    "quantityUom" character varying(25),
    "workCapability" character varying(25),
    "processSegmentCapability" character varying(25),
    "capabilityType" character varying(25),
    "personnelClass" character varying(25),
    "hierarchyScope" character varying(25),
    "operationsCapability" character varying(25),
    "resourceUse" character varying(25),
    person character varying(25)
);
 %   DROP TABLE dt."PersonnelCapability";
       dt         heap    postgres    false    6            "           1259    36878    PersonnelCapabilityProperty    TABLE     S  CREATE TABLE dt."PersonnelCapabilityProperty" (
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
    "personnelCapability" character varying(25),
    "valueUom" character varying(25),
    "quantityUom" character varying(25),
    "uomCategory" character varying(25),
    "sensorType" character varying(25),
    "propertyType" character varying(25),
    category character varying(25),
    sensor character varying(25),
    parent character varying(25)
);
 -   DROP TABLE dt."PersonnelCapabilityProperty";
       dt         heap    postgres    false    6            #           1259    36884    PersonnelClass    TABLE       CREATE TABLE dt."PersonnelClass" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "isInstantiable" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    parent character varying(25)
);
     DROP TABLE dt."PersonnelClass";
       dt         heap    postgres    false    6            $           1259    36890    PersonnelClassMapping    TABLE     �   CREATE TABLE dt."PersonnelClassMapping" (
    person character varying(25) NOT NULL,
    "personnelClass" character varying(25) NOT NULL
);
 '   DROP TABLE dt."PersonnelClassMapping";
       dt         heap    postgres    false    6            %           1259    36893    PersonnelClassProperty    TABLE     3  CREATE TABLE dt."PersonnelClassProperty" (
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
    "valueUom" character varying(25),
    "sensorType" character varying(25),
    "uomCategory" character varying(25),
    category character varying(25),
    "propertyType" character varying(25),
    sensor character varying(25),
    "personnelClass" character varying(25),
    parent character varying(25)
);
 (   DROP TABLE dt."PersonnelClassProperty";
       dt         heap    postgres    false    6            &           1259    36899    PersonnelRequirement    TABLE       CREATE TABLE dt."PersonnelRequirement" (
    id character varying(25) NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "madeFromId" text,
    "madeFromType" text,
    quantity numeric(65,30),
    "resourceUse" text,
    person character varying(25),
    "quantityUom" character varying(25),
    "jobOrder" character varying(25),
    "segmentRequirement" character varying(25),
    "personnelClass" character varying(25)
);
 &   DROP TABLE dt."PersonnelRequirement";
       dt         heap    postgres    false    6            '           1259    36905    PersonnelRequirementProperty    TABLE     �  CREATE TABLE dt."PersonnelRequirementProperty" (
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
    "sensorType" character varying(25),
    "quantityUom" character varying(25),
    "propertyType" character varying(25),
    category character varying(25),
    "valueUom" character varying(25),
    "personnelRequirement" character varying(25),
    "logRateUom" character varying(25),
    parent character varying(25),
    "uomCategory" character varying(25),
    sensor character varying(25)
);
 .   DROP TABLE dt."PersonnelRequirementProperty";
       dt         heap    postgres    false    6            (           1259    36911    PersonnelSegmentSpecification    TABLE     �  CREATE TABLE dt."PersonnelSegmentSpecification" (
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
    "processSegment" character varying(25),
    "personnelClass" character varying(25),
    person character varying(25),
    "quantityUom" character varying(25)
);
 /   DROP TABLE dt."PersonnelSegmentSpecification";
       dt         heap    postgres    false    6            )           1259    36917 %   PersonnelSegmentSpecificationProperty    TABLE     �  CREATE TABLE dt."PersonnelSegmentSpecificationProperty" (
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
    "personnelSegmentSpecification" character varying(25),
    "sensorType" character varying(25),
    "propertyType" character varying(25),
    sensor character varying(25),
    "valueUom" character varying(25),
    category character varying(25),
    parent character varying(25),
    "quantityUom" character varying(25),
    "uomCategory" character varying(25)
);
 7   DROP TABLE dt."PersonnelSegmentSpecificationProperty";
       dt         heap    postgres    false    6            *           1259    36923    PersonnelSpecification    TABLE       CREATE TABLE dt."PersonnelSpecification" (
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
    "quantityUom" character varying(25),
    "personnelClass" character varying(25),
    person character varying(25),
    "workMaster" character varying(25),
    "operationsSegment" character varying(25)
);
 (   DROP TABLE dt."PersonnelSpecification";
       dt         heap    postgres    false    6            +           1259    36929    PersonnelSpecificationProperty    TABLE     �  CREATE TABLE dt."PersonnelSpecificationProperty" (
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
    "propertyType" character varying(25),
    "sensorType" character varying(25),
    "quantityUom" character varying(25),
    "logRateUom" character varying(25),
    parent character varying(25),
    "valueUom" character varying(25),
    "uomCategory" character varying(25),
    category character varying(25),
    "personnelSpecification" character varying(25),
    sensor character varying(25)
);
 0   DROP TABLE dt."PersonnelSpecificationProperty";
       dt         heap    postgres    false    6            ,           1259    36935    PhysicalAsset    TABLE     �  CREATE TABLE dt."PhysicalAsset" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "madeFromId" text,
    "madeFromType" text,
    "vendorName" text,
    "fixedAssetName" text,
    parent character varying(25),
    "physicalLocation" character varying(25)
);
    DROP TABLE dt."PhysicalAsset";
       dt         heap    postgres    false    6            -           1259    36941    PhysicalAssetActual    TABLE     +  CREATE TABLE dt."PhysicalAssetActual" (
    id character varying(25) NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "madeFromId" text,
    "madeFromType" text,
    quantity numeric(65,30),
    "resourceUse" character varying(25),
    "segmentResponse" character varying(25),
    "jobResponse" character varying(25),
    "physicalAsset" character varying(25),
    "physicalAssetClass" character varying(25),
    "quantityUom" character varying(25)
);
 %   DROP TABLE dt."PhysicalAssetActual";
       dt         heap    postgres    false    6            .           1259    36947    PhysicalAssetActualProperty    TABLE     �  CREATE TABLE dt."PhysicalAssetActualProperty" (
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
    sensor character varying(25),
    "valueUom" character varying(25),
    parent character varying(25),
    "uomCategory" character varying(25),
    "quantityUom" character varying(25),
    "propertyType" character varying(25),
    "physicalAssetActual" character varying(25),
    "sensorType" character varying(25)
);
 -   DROP TABLE dt."PhysicalAssetActualProperty";
       dt         heap    postgres    false    6            /           1259    36953    PhysicalAssetCapability    TABLE     q  CREATE TABLE dt."PhysicalAssetCapability" (
    id character varying(25) NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    reason text NOT NULL,
    "confidenceFactor" integer,
    quantity numeric(65,30),
    "startTime" timestamp(3) without time zone NOT NULL,
    "endTime" timestamp(3) without time zone NOT NULL,
    "physicalAssetClass" character varying(25),
    "workMasterCapability" character varying(25),
    "workCapability" character varying(25),
    "quantityUom" character varying(25),
    "capabilityType" character varying(25),
    "processSegmentCapability" character varying(25),
    "operationsCapability" character varying(25),
    "physicalAsset" character varying(25),
    "resourceUse" character varying(25),
    "hierarchyScope" character varying(25)
);
 )   DROP TABLE dt."PhysicalAssetCapability";
       dt         heap    postgres    false    6            0           1259    36959    PhysicalAssetCapabilityProperty    TABLE     [  CREATE TABLE dt."PhysicalAssetCapabilityProperty" (
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
    sensor character varying(25),
    parent character varying(25),
    "propertyType" character varying(25),
    "valueUom" character varying(25),
    "uomCategory" character varying(25),
    "physicalAssetCapability" character varying(25),
    "sensorType" character varying(25),
    category character varying(25),
    "quantityUom" character varying(25)
);
 1   DROP TABLE dt."PhysicalAssetCapabilityProperty";
       dt         heap    postgres    false    6            1           1259    36965    PhysicalAssetClass    TABLE     :  CREATE TABLE dt."PhysicalAssetClass" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "isInstantiable" boolean NOT NULL,
    manufacturer text,
    parent character varying(25)
);
 $   DROP TABLE dt."PhysicalAssetClass";
       dt         heap    postgres    false    6            2           1259    36971    PhysicalAssetClassMapping    TABLE     �   CREATE TABLE dt."PhysicalAssetClassMapping" (
    "physicalAsset" character varying(25) NOT NULL,
    "physicalAssetClass" character varying(25) NOT NULL
);
 +   DROP TABLE dt."PhysicalAssetClassMapping";
       dt         heap    postgres    false    6            3           1259    36974    PhysicalAssetClassProperty    TABLE     ;  CREATE TABLE dt."PhysicalAssetClassProperty" (
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
    "physicalAssetClass" character varying(25),
    category character varying(25),
    sensor character varying(25),
    "sensorType" character varying(25),
    "valueUom" character varying(25),
    parent character varying(25),
    "uomCategory" character varying(25),
    "propertyType" character varying(25)
);
 ,   DROP TABLE dt."PhysicalAssetClassProperty";
       dt         heap    postgres    false    6            4           1259    36980    PhysicalAssetProperty    TABLE     1  CREATE TABLE dt."PhysicalAssetProperty" (
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
    sensor character varying(25),
    "uomCategory" character varying(25),
    "sensorType" character varying(25),
    "valueUom" character varying(25),
    "propertyType" character varying(25),
    "physicalAsset" character varying(25),
    parent character varying(25),
    category character varying(25)
);
 '   DROP TABLE dt."PhysicalAssetProperty";
       dt         heap    postgres    false    6            5           1259    36986    PhysicalAssetRequirement    TABLE     \  CREATE TABLE dt."PhysicalAssetRequirement" (
    id character varying(25) NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "madeFromId" text,
    "madeFromType" text,
    quantity numeric(65,30),
    "segmentRequirement" character varying(25),
    "physicalAsset" character varying(25),
    "quantityUom" character varying(25),
    "physicalAssetClass" character varying(25),
    "equipmentLevel" character varying(25),
    "jobOrder" character varying(25),
    "resourceUse" character varying(25)
);
 *   DROP TABLE dt."PhysicalAssetRequirement";
       dt         heap    postgres    false    6            6           1259    36992     PhysicalAssetRequirementProperty    TABLE     �  CREATE TABLE dt."PhysicalAssetRequirementProperty" (
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
    "valueUom" character varying(25),
    "uomCategory" character varying(25),
    "sensorType" character varying(25),
    "propertyType" character varying(25),
    category character varying(25),
    "physicalAssetRequirement" character varying(25),
    parent character varying(25),
    sensor character varying(25),
    "quantityUom" character varying(25),
    "logRateUom" character varying(25)
);
 2   DROP TABLE dt."PhysicalAssetRequirementProperty";
       dt         heap    postgres    false    6            7           1259    36998 !   PhysicalAssetSegmentSpecification    TABLE       CREATE TABLE dt."PhysicalAssetSegmentSpecification" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "madeFromId" text,
    "madeFromType" text,
    quantity numeric(65,30),
    "processSegment" character varying(25),
    "physicalAssetClass" character varying(25),
    "physicalAsset" character varying(25),
    "resourceUse" character varying(25),
    "quantityUom" character varying(25)
);
 3   DROP TABLE dt."PhysicalAssetSegmentSpecification";
       dt         heap    postgres    false    6            8           1259    37004 )   PhysicalAssetSegmentSpecificationProperty    TABLE     �  CREATE TABLE dt."PhysicalAssetSegmentSpecificationProperty" (
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
    "uomCategory" character varying(25),
    "quantityUom" character varying(25),
    sensor character varying(25),
    category character varying(25),
    "sensorType" character varying(25),
    "valueUom" character varying(25),
    parent character varying(25),
    "propertyType" character varying(25),
    "physicalAssetSegmentSpecification" character varying(25)
);
 ;   DROP TABLE dt."PhysicalAssetSegmentSpecificationProperty";
       dt         heap    postgres    false    6            9           1259    37010    PhysicalAssetSpecification    TABLE     3  CREATE TABLE dt."PhysicalAssetSpecification" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "madeFromId" text,
    "madeFromType" text,
    quantity numeric(65,30),
    "quantityUom" character varying(25),
    "resourceUse" character varying(25),
    "physicalAsset" character varying(25),
    "operationsSegment" character varying(25),
    "physicalAssetClass" character varying(25),
    "workMaster" character varying(25)
);
 ,   DROP TABLE dt."PhysicalAssetSpecification";
       dt         heap    postgres    false    6            :           1259    37016 "   PhysicalAssetSpecificationProperty    TABLE     �  CREATE TABLE dt."PhysicalAssetSpecificationProperty" (
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
    "valueUom" character varying(25),
    parent character varying(25),
    "physicalAssetSpecification" character varying(25),
    sensor character varying(25),
    "sensorType" character varying(25),
    category character varying(25),
    "logRateUom" character varying(25),
    "uomCategory" character varying(25),
    "quantityUom" character varying(25),
    "propertyType" character varying(25)
);
 4   DROP TABLE dt."PhysicalAssetSpecificationProperty";
       dt         heap    postgres    false    6            ;           1259    37022    ProcessSegment    TABLE     T  CREATE TABLE dt."ProcessSegment" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "madeFromId" text,
    "madeFromType" text,
    "isTemplate" boolean NOT NULL,
    "processFlowDiagram" text,
    "dependenciesFlowDiagram" text,
    duration numeric(65,30),
    "hierarchyScope" character varying(25),
    "operationsType" character varying(25),
    parent character varying(25),
    "durationUom" character varying(25),
    "recordType" character varying(25)
);
     DROP TABLE dt."ProcessSegment";
       dt         heap    postgres    false    6            <           1259    37028    ProcessSegmentCapability    TABLE     B  CREATE TABLE dt."ProcessSegmentCapability" (
    id character varying(25) NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    reason text NOT NULL,
    "startTime" timestamp(3) without time zone NOT NULL,
    "endTime" timestamp(3) without time zone NOT NULL,
    "capabilityType" character varying(25),
    "processSegment" character varying(25),
    "hierarchyScope" character varying(25),
    "operationsCapability" character varying(25),
    parent character varying(25)
);
 *   DROP TABLE dt."ProcessSegmentCapability";
       dt         heap    postgres    false    6            =           1259    37034    ProcessSegmentDependency    TABLE       CREATE TABLE dt."ProcessSegmentDependency" (
    id character varying(25) NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "madeFromId" text,
    "madeFromType" text,
    value text,
    "maxValue" text,
    "minValue" text,
    "dependencyType" character varying(25),
    segment character varying(25),
    "valueUom" character varying(25),
    "dependentSegment" character varying(25),
    "dependencyFactor" character varying(25)
);
 *   DROP TABLE dt."ProcessSegmentDependency";
       dt         heap    postgres    false    6            >           1259    37040    ProcessSegmentParameter    TABLE     4  CREATE TABLE dt."ProcessSegmentParameter" (
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
    sensor character varying(25),
    "propertyType" character varying(25),
    "valueUom" character varying(25),
    category character varying(25),
    "sensorType" character varying(25),
    "uomCategory" character varying(25),
    "processSegment" character varying(25),
    parent character varying(25)
);
 )   DROP TABLE dt."ProcessSegmentParameter";
       dt         heap    postgres    false    6            ?           1259    37046    ProductionPlan    TABLE     �  CREATE TABLE dt."ProductionPlan" (
    id character varying(25) NOT NULL,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    day timestamp(3) without time zone NOT NULL,
    "requiredQuantity" numeric(65,30) NOT NULL,
    "segmentRequirement" character varying(25),
    "operationsRequest" character varying(25),
    shift character varying(25),
    "quantityUom" character varying(25)
);
     DROP TABLE dt."ProductionPlan";
       dt         heap    postgres    false    6            @           1259    37049    PropertyType    TABLE     U  CREATE TABLE dt."PropertyType" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "valueType" text,
    value boolean NOT NULL,
    "minValue" boolean NOT NULL,
    "maxValue" boolean NOT NULL,
    "hasUomCategory" boolean NOT NULL,
    "hasSensorType" boolean NOT NULL,
    "defaultValues" boolean NOT NULL,
    "possibleValues" boolean NOT NULL,
    "sensorType" character varying(25),
    parent character varying(25),
    "uomCategory" character varying(25)
);
    DROP TABLE dt."PropertyType";
       dt         heap    postgres    false    6            A           1259    37055    Reason    TABLE       CREATE TABLE dt."Reason" (
    id character varying(25) NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    "hasEquipment" boolean NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "subCategory" character varying(25)
);
    DROP TABLE dt."Reason";
       dt         heap    postgres    false    6            B           1259    37061    ReasonCategory    TABLE     �   CREATE TABLE dt."ReasonCategory" (
    id character varying(25) NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL
);
     DROP TABLE dt."ReasonCategory";
       dt         heap    postgres    false    6            C           1259    37067    ReasonEquipmentTypeMapping    TABLE     �   CREATE TABLE dt."ReasonEquipmentTypeMapping" (
    "equipmentType" character varying(25) NOT NULL,
    reason character varying(25) NOT NULL
);
 ,   DROP TABLE dt."ReasonEquipmentTypeMapping";
       dt         heap    postgres    false    6            D           1259    37070    ReasonSubCategory    TABLE     �   CREATE TABLE dt."ReasonSubCategory" (
    id character varying(25) NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    category character varying(25)
);
 #   DROP TABLE dt."ReasonSubCategory";
       dt         heap    postgres    false    6            E           1259    37076 
   ReasonTree    TABLE     (  CREATE TABLE dt."ReasonTree" (
    id character varying(25) NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "stateMachine" character varying(25),
    "processSegment" character varying(25)
);
    DROP TABLE dt."ReasonTree";
       dt         heap    postgres    false    6            F           1259    37082    ReasonTreeConfig    TABLE     �  CREATE TABLE dt."ReasonTreeConfig" (
    id character varying(25) NOT NULL,
    "groupNumber" text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    reason character varying(25),
    equipment character varying(25),
    "stateDefinition" character varying(25),
    "subCategory" character varying(25),
    category character varying(25),
    "reasonTree" character varying(25)
);
 "   DROP TABLE dt."ReasonTreeConfig";
       dt         heap    postgres    false    6            G           1259    37088    ResourceNetworkConnection    TABLE     U  CREATE TABLE dt."ResourceNetworkConnection" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "resourceNetworkConnectionType" character varying(25),
    "resourceRelationshipNetwork" character varying(25)
);
 +   DROP TABLE dt."ResourceNetworkConnection";
       dt         heap    postgres    false    6            H           1259    37094 !   ResourceNetworkConnectionProperty    TABLE       CREATE TABLE dt."ResourceNetworkConnectionProperty" (
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
    "valueUom" character varying(25),
    "propertyType" character varying(25),
    parent character varying(25),
    sensor character varying(25),
    "sensorType" character varying(25),
    category character varying(25),
    "resourceNetworkConnection" character varying(25),
    "uomCategory" character varying(25)
);
 3   DROP TABLE dt."ResourceNetworkConnectionProperty";
       dt         heap    postgres    false    6            I           1259    37100    ResourceNetworkConnectionType    TABLE     �   CREATE TABLE dt."ResourceNetworkConnectionType" (
    id character varying(25) NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    type text
);
 /   DROP TABLE dt."ResourceNetworkConnectionType";
       dt         heap    postgres    false    6            J           1259    37106 %   ResourceNetworkConnectionTypeProperty    TABLE     !  CREATE TABLE dt."ResourceNetworkConnectionTypeProperty" (
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
    parent character varying(25),
    category character varying(25),
    "valueUom" character varying(25),
    "uomCategory" character varying(25),
    "resourceNetworkConnectionType" character varying(25),
    "propertyType" character varying(25),
    sensor character varying(25),
    "sensorType" character varying(25)
);
 7   DROP TABLE dt."ResourceNetworkConnectionTypeProperty";
       dt         heap    postgres    false    6            K           1259    37112    ResourceRelationshipNetwork    TABLE     ?  CREATE TABLE dt."ResourceRelationshipNetwork" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "relationshipForm" character varying(25),
    "relationshipType" character varying(25)
);
 -   DROP TABLE dt."ResourceRelationshipNetwork";
       dt         heap    postgres    false    6            L           1259    37118    SegmentData    TABLE     )  CREATE TABLE dt."SegmentData" (
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
    "valueUom" character varying(25),
    parent character varying(25),
    "sensorType" character varying(25),
    "segmentResponse" character varying(25),
    sensor character varying(25),
    "uomCategory" character varying(25),
    category character varying(25)
);
    DROP TABLE dt."SegmentData";
       dt         heap    postgres    false    6            M           1259    37124    SegmentParameter    TABLE     w  CREATE TABLE dt."SegmentParameter" (
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
    "madeFromId" text,
    "madeFromType" text,
    "propertyType" character varying(25),
    parent character varying(25),
    category character varying(25),
    "segmentRequirement" character varying(25),
    "logRateUom" character varying(25),
    "uomCategory" character varying(25),
    "sensorType" character varying(25),
    "valueUom" character varying(25),
    sensor character varying(25)
);
 "   DROP TABLE dt."SegmentParameter";
       dt         heap    postgres    false    6            N           1259    37130    SegmentRequirement    TABLE     ,  CREATE TABLE dt."SegmentRequirement" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "earliestStartTime" timestamp(3) without time zone NOT NULL,
    "latestEndTime" timestamp(3) without time zone NOT NULL,
    "processFlowDiagram" text,
    duration numeric(65,30) NOT NULL,
    "operationsRequest" character varying(25),
    "durationUom" character varying(25),
    "hierarchyScope" character varying(25),
    parent character varying(25),
    "operationsType" character varying(25),
    "operationsSegment" character varying(25),
    "orderRequestStatus" character varying(25),
    "operationsDefinition" character varying(25),
    "processSegment" character varying(25)
);
 $   DROP TABLE dt."SegmentRequirement";
       dt         heap    postgres    false    6            O           1259    37136    SegmentResponse    TABLE       CREATE TABLE dt."SegmentResponse" (
    id character varying(25) NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "actualStartTime" timestamp(3) without time zone NOT NULL,
    "actualEndTime" timestamp(3) without time zone NOT NULL,
    "processFlowDiagram" text,
    "operationsType" character varying(25),
    "segmentRequirement" character varying(25),
    "operationsSegment" character varying(25),
    parent character varying(25),
    "processSegment" character varying(25),
    "hierarchyScope" character varying(25),
    "operationsDefinition" character varying(25),
    "operationsResponse" character varying(25),
    "responseStatus" character varying(25)
);
 !   DROP TABLE dt."SegmentResponse";
       dt         heap    postgres    false    6            P           1259    37142    Shift    TABLE     =  CREATE TABLE dt."Shift" (
    id character varying(25) NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "startTime" timestamp(3) without time zone NOT NULL,
    "endTime" timestamp(3) without time zone NOT NULL
);
    DROP TABLE dt."Shift";
       dt         heap    postgres    false    6            Q           1259    37148    StateDefinition    TABLE     �  CREATE TABLE dt."StateDefinition" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDefault" boolean NOT NULL,
    icon text,
    color text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    parent character varying(25),
    criticality character varying(25),
    "stateMachineDefinition" character varying(25),
    "stateLibrary" character varying(25)
);
 !   DROP TABLE dt."StateDefinition";
       dt         heap    postgres    false    6            R           1259    37154    StateDefinitionTransition    TABLE        CREATE TABLE dt."StateDefinitionTransition" (
    id character varying(25) NOT NULL,
    verb text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "stateMachineDefinition" character varying(25),
    "from" character varying(25),
    "to" character varying(25)
);
 +   DROP TABLE dt."StateDefinitionTransition";
       dt         heap    postgres    false    6            S           1259    37160    StateLibrary    TABLE       CREATE TABLE dt."StateLibrary" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    icon text NOT NULL,
    color text NOT NULL,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL
);
    DROP TABLE dt."StateLibrary";
       dt         heap    postgres    false    6            T           1259    37166 !   StateLibraryReasonCategoryMapping    TABLE     �   CREATE TABLE dt."StateLibraryReasonCategoryMapping" (
    category character varying(25) NOT NULL,
    "stateLibrary" character varying(25) NOT NULL
);
 3   DROP TABLE dt."StateLibraryReasonCategoryMapping";
       dt         heap    postgres    false    6            U           1259    37169    StateMachineDefinition    TABLE     ,  CREATE TABLE dt."StateMachineDefinition" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    category character varying(25),
    "isSystemGenerated" boolean NOT NULL
);
 (   DROP TABLE dt."StateMachineDefinition";
       dt         heap    postgres    false    6            V           1259    37175    StateObjectMapping    TABLE       CREATE TABLE dt."StateObjectMapping" (
    id character varying(25) NOT NULL,
    "objectId" text NOT NULL,
    "objectType" text NOT NULL,
    actor text,
    "timeStamp" timestamp(3) without time zone,
    "isOwner" boolean NOT NULL,
    "isDefault" boolean,
    "isInstanceState" boolean,
    "isMutable" boolean NOT NULL,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "stateMachineDefinition" character varying(25),
    "prevStateDefinition" character varying(25),
    "stateDefinition" character varying(25)
);
 $   DROP TABLE dt."StateObjectMapping";
       dt         heap    postgres    false    6            W           1259    37181    Stream    TABLE     	  CREATE TABLE dt."Stream" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "streamType" character varying(25),
    "lotHandling" character varying(25)
);
    DROP TABLE dt."Stream";
       dt         heap    postgres    false    6            X           1259    37187    StreamProperty    TABLE     !  CREATE TABLE dt."StreamProperty" (
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
    stream character varying(25),
    "propertyType" character varying(25),
    sensor character varying(25),
    "sensorType" character varying(25),
    category character varying(25),
    "valueUom" character varying(25),
    parent character varying(25),
    "uomCategory" character varying(25)
);
     DROP TABLE dt."StreamProperty";
       dt         heap    postgres    false    6            Y           1259    37193    ToResourceReference    TABLE     \  CREATE TABLE dt."ToResourceReference" (
    id character varying(25) NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "resourceId" text NOT NULL,
    "resourceType" character varying(25),
    "resourceNetworkConnection" character varying(25)
);
 %   DROP TABLE dt."ToResourceReference";
       dt         heap    postgres    false    6            Z           1259    37199    ToResourceReferenceProperty    TABLE       CREATE TABLE dt."ToResourceReferenceProperty" (
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
    "sensorType" character varying(25),
    "valueUom" character varying(25),
    "toResourceReference" character varying(25),
    category character varying(25),
    sensor character varying(25),
    parent character varying(25),
    "uomCategory" character varying(25),
    "propertyType" character varying(25)
);
 -   DROP TABLE dt."ToResourceReferenceProperty";
       dt         heap    postgres    false    6            [           1259    37205    Uom    TABLE        CREATE TABLE dt."Uom" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    symbol text,
    category character varying(25)
);
    DROP TABLE dt."Uom";
       dt         heap    postgres    false    6            \           1259    37211    UomCategory    TABLE     �   CREATE TABLE dt."UomCategory" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL
);
    DROP TABLE dt."UomCategory";
       dt         heap    postgres    false    6            ]           1259    37217    WorkCalendar    TABLE     �   CREATE TABLE dt."WorkCalendar" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL
);
    DROP TABLE dt."WorkCalendar";
       dt         heap    postgres    false    6            ^           1259    37223    WorkCalendarDefinition    TABLE       CREATE TABLE dt."WorkCalendarDefinition" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "planThrough" character varying(25)
);
 (   DROP TABLE dt."WorkCalendarDefinition";
       dt         heap    postgres    false    6            _           1259    37229    WorkCalendarDefinitionEntry    TABLE     �  CREATE TABLE dt."WorkCalendarDefinitionEntry" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "startRule" timestamp(3) without time zone NOT NULL,
    "recurrenceTimeIntervalRule" text NOT NULL,
    "durationRule" text NOT NULL,
    "startTime" timestamp(3) without time zone NOT NULL,
    "endTime" timestamp(3) without time zone NOT NULL,
    "appliedOnObject" text,
    parent character varying(25),
    "patternEntry" character varying(25),
    pattern character varying(25),
    "workCalendarDefinition" character varying(25),
    "entryType" character varying(25),
    day character varying(25)
);
 -   DROP TABLE dt."WorkCalendarDefinitionEntry";
       dt         heap    postgres    false    6            `           1259    37235 #   WorkCalendarDefinitionEntryProperty    TABLE       CREATE TABLE dt."WorkCalendarDefinitionEntryProperty" (
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
    "propertyType" character varying(25),
    parent character varying(25),
    "sensorType" character varying(25),
    "uomCategory" character varying(25),
    category character varying(25),
    sensor character varying(25),
    "workCalendarDefinitionEntry" character varying(25),
    "valueUom" character varying(25)
);
 5   DROP TABLE dt."WorkCalendarDefinitionEntryProperty";
       dt         heap    postgres    false    6            a           1259    37241    WorkCalendarDefinitionGroup    TABLE     �   CREATE TABLE dt."WorkCalendarDefinitionGroup" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL
);
 -   DROP TABLE dt."WorkCalendarDefinitionGroup";
       dt         heap    postgres    false    6            b           1259    37247 "   WorkCalendarDefinitionGroupMapping    TABLE       CREATE TABLE dt."WorkCalendarDefinitionGroupMapping" (
    id character varying(25) NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "workCalendarDefinition" character varying(25),
    "workCalendarGroup" character varying(25)
);
 4   DROP TABLE dt."WorkCalendarDefinitionGroupMapping";
       dt         heap    postgres    false    6            c           1259    37253 #   WorkCalendarDefinitionObjectMapping    TABLE       CREATE TABLE dt."WorkCalendarDefinitionObjectMapping" (
    id character varying(25) NOT NULL,
    "appliedOnObject" text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "workCalendarDefinition" character varying(25)
);
 5   DROP TABLE dt."WorkCalendarDefinitionObjectMapping";
       dt         heap    postgres    false    6            d           1259    37259     WorkCalendarDefinitionOverruling    TABLE     Q  CREATE TABLE dt."WorkCalendarDefinitionOverruling" (
    id character varying(25) NOT NULL,
    "sequenceNumber" integer NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "overrulingWorkCalendardefinition" character varying(25),
    "workCalendarDefinition" character varying(25)
);
 2   DROP TABLE dt."WorkCalendarDefinitionOverruling";
       dt         heap    postgres    false    6            e           1259    37265    WorkCalendarDefinitionProperty    TABLE       CREATE TABLE dt."WorkCalendarDefinitionProperty" (
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
    "sensorType" character varying(25),
    "valueUom" character varying(25),
    sensor character varying(25),
    "propertyType" character varying(25),
    category character varying(25),
    "uomCategory" character varying(25),
    parent character varying(25),
    "workCalendarDefinition" character varying(25)
);
 0   DROP TABLE dt."WorkCalendarDefinitionProperty";
       dt         heap    postgres    false    6            f           1259    37271    WorkCalendarEntry    TABLE     �  CREATE TABLE dt."WorkCalendarEntry" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "startTime" timestamp(3) without time zone NOT NULL,
    "endTime" timestamp(3) without time zone NOT NULL,
    "entryType" character varying(25),
    "workCalendar" character varying(25),
    "workCalendarDefinitionEntry" character varying(25)
);
 #   DROP TABLE dt."WorkCalendarEntry";
       dt         heap    postgres    false    6            g           1259    37277    WorkCalendarEntryProperty    TABLE     J  CREATE TABLE dt."WorkCalendarEntryProperty" (
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
    sensor character varying(25),
    "valueUom" character varying(25),
    "sensorType" character varying(25),
    "workCalendarEntry" character varying(25),
    "propertyType" character varying(25),
    category character varying(25),
    "uomCategory" character varying(25),
    parent character varying(25),
    "workCalendarDefinitionEntryProperty" character varying(25)
);
 +   DROP TABLE dt."WorkCalendarEntryProperty";
       dt         heap    postgres    false    6            h           1259    37283    WorkCalendarProperty    TABLE     �  CREATE TABLE dt."WorkCalendarProperty" (
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
    "sensorType" character varying(25),
    sensor character varying(25),
    "valueUom" character varying(25),
    category character varying(25),
    "workCalendar" character varying(25),
    "uomCategory" character varying(25),
    "propertyType" character varying(25),
    parent character varying(25)
);
 &   DROP TABLE dt."WorkCalendarProperty";
       dt         heap    postgres    false    6            i           1259    37289    WorkCapability    TABLE       CREATE TABLE dt."WorkCapability" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    reason text NOT NULL,
    "confidenceFactor" integer,
    "startTime" timestamp(3) without time zone NOT NULL,
    "endTime" timestamp(3) without time zone NOT NULL,
    "publishedDate" timestamp(3) without time zone NOT NULL,
    "capacityType" character varying(25),
    "hierarchyScope" character varying(25)
);
     DROP TABLE dt."WorkCapability";
       dt         heap    postgres    false    6            j           1259    37295    WorkCapabilityProperty    TABLE       CREATE TABLE dt."WorkCapabilityProperty" (
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
    "sensorType" character varying(25),
    "uomCategory" character varying(25),
    sensor character varying(25),
    parent character varying(25),
    "propertyType" character varying(25),
    "workCapability" character varying(25),
    category character varying(25),
    "valueUom" character varying(25)
);
 (   DROP TABLE dt."WorkCapabilityProperty";
       dt         heap    postgres    false    6            k           1259    37301 
   WorkMaster    TABLE     �  CREATE TABLE dt."WorkMaster" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    version text NOT NULL,
    duration numeric(65,30),
    "operationsSegment" character varying(25),
    "durationUom" character varying(25),
    "workType" character varying(25),
    "workMasterType" character varying(25),
    "operationsDefinition" character varying(25)
);
    DROP TABLE dt."WorkMaster";
       dt         heap    postgres    false    6            l           1259    37307    WorkMasterCapability    TABLE     m  CREATE TABLE dt."WorkMasterCapability" (
    id character varying(25) NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    reason text NOT NULL,
    "confidenceFactor" integer,
    "startTime" timestamp(3) without time zone NOT NULL,
    "endTime" timestamp(3) without time zone NOT NULL,
    "publishedDate" timestamp(3) without time zone NOT NULL,
    "workMaster" character varying(25),
    "hierarchyScope" character varying(25),
    "workCapability" character varying(25),
    "capacityType" character varying(25)
);
 &   DROP TABLE dt."WorkMasterCapability";
       dt         heap    postgres    false    6            m           1259    37313    WorkMasterCapabilityProperty    TABLE       CREATE TABLE dt."WorkMasterCapabilityProperty" (
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
    "propertyType" character varying(25),
    "valueUom" character varying(25),
    category character varying(25),
    "workMasterCapability" character varying(25),
    parent character varying(25),
    sensor character varying(25),
    "uomCategory" character varying(25),
    "sensorType" character varying(25)
);
 .   DROP TABLE dt."WorkMasterCapabilityProperty";
       dt         heap    postgres    false    6            n           1259    37319    WorkPerformance    TABLE     "  CREATE TABLE dt."WorkPerformance" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "startTime" timestamp(3) without time zone NOT NULL,
    "endTime" timestamp(3) without time zone NOT NULL,
    "publishedDate" timestamp(3) without time zone NOT NULL,
    "workType" character varying(25),
    "workSchedule" character varying(25),
    "hierarchyScope" character varying(25),
    parent character varying(25)
);
 !   DROP TABLE dt."WorkPerformance";
       dt         heap    postgres    false    6            o           1259    37325    WorkPerformanceProperty    TABLE       CREATE TABLE dt."WorkPerformanceProperty" (
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
    sensor character varying(25),
    "valueUom" character varying(25),
    "sensorType" character varying(25),
    "propertyType" character varying(25),
    category character varying(25),
    "uomCategory" character varying(25),
    "workPerformance" character varying(25),
    parent character varying(25)
);
 )   DROP TABLE dt."WorkPerformanceProperty";
       dt         heap    postgres    false    6            p           1259    37331    WorkRequest    TABLE       CREATE TABLE dt."WorkRequest" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "startTime" timestamp(3) without time zone NOT NULL,
    "endTime" timestamp(3) without time zone NOT NULL,
    parent character varying(25),
    "workSchedule" character varying(25),
    "hierarchyScope" character varying(25),
    "workType" character varying(25),
    priority character varying(25)
);
    DROP TABLE dt."WorkRequest";
       dt         heap    postgres    false    6            q           1259    37337    WorkRequestProperty    TABLE     �  CREATE TABLE dt."WorkRequestProperty" (
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
    parent character varying(25),
    "uomCategory" character varying(25),
    sensor character varying(25),
    "sensorType" character varying(25),
    "valueUom" character varying(25),
    "workRequest" character varying(25),
    category character varying(25),
    "propertyType" character varying(25)
);
 %   DROP TABLE dt."WorkRequestProperty";
       dt         heap    postgres    false    6            r           1259    37343    WorkResponse    TABLE     :  CREATE TABLE dt."WorkResponse" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "startTime" timestamp(3) without time zone NOT NULL,
    "endTime" timestamp(3) without time zone NOT NULL,
    "workPerformance" character varying(25),
    "workType" character varying(25),
    "hierarchyScope" character varying(25),
    "responseStatus" character varying(25),
    "workRequest" character varying(25),
    parent character varying(25)
);
    DROP TABLE dt."WorkResponse";
       dt         heap    postgres    false    6            s           1259    37349    WorkResponseProperty    TABLE     �  CREATE TABLE dt."WorkResponseProperty" (
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
    "propertyType" character varying(25),
    parent character varying(25),
    "valueUom" character varying(25),
    sensor character varying(25),
    "workResponse" character varying(25),
    category character varying(25),
    "uomCategory" character varying(25),
    "sensorType" character varying(25)
);
 &   DROP TABLE dt."WorkResponseProperty";
       dt         heap    postgres    false    6            t           1259    37355    WorkSchedule    TABLE     �  CREATE TABLE dt."WorkSchedule" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "startTime" timestamp(3) without time zone NOT NULL,
    "endTime" timestamp(3) without time zone NOT NULL,
    "publishedDate" timestamp(3) without time zone NOT NULL,
    "workType" character varying(25),
    parent character varying(25),
    "hierarchyScope" character varying(25)
);
    DROP TABLE dt."WorkSchedule";
       dt         heap    postgres    false    6            u           1259    37361    WorkScheduleProperty    TABLE     �  CREATE TABLE dt."WorkScheduleProperty" (
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
    "workSchedule" character varying(25),
    "uomCategory" character varying(25),
    "propertyType" character varying(25),
    category character varying(25),
    "valueUom" character varying(25),
    "sensorType" character varying(25),
    sensor character varying(25),
    parent character varying(25)
);
 &   DROP TABLE dt."WorkScheduleProperty";
       dt         heap    postgres    false    6            v           1259    37367    WorkflowSpecification    TABLE       CREATE TABLE dt."WorkflowSpecification" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "workMaster" character varying(25)
);
 '   DROP TABLE dt."WorkflowSpecification";
       dt         heap    postgres    false    6            w           1259    37373    WorkflowSpecificationCxn    TABLE     �  CREATE TABLE dt."WorkflowSpecificationCxn" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "workflowSpecificationCxnType" character varying(25),
    "fromWorkflowSpecificationNode" character varying(25),
    "toWorkflowSpecificationNode" character varying(25),
    "workflowSpecification" character varying(25)
);
 *   DROP TABLE dt."WorkflowSpecificationCxn";
       dt         heap    postgres    false    6            x           1259    37379     WorkflowSpecificationCxnProperty    TABLE       CREATE TABLE dt."WorkflowSpecificationCxnProperty" (
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
    parent character varying(25),
    category character varying(25),
    sensor character varying(25),
    "uomCategory" character varying(25),
    "propertyType" character varying(25),
    "sensorType" character varying(25),
    "valueUom" character varying(25),
    "workflowSpecificationCxn" character varying(25)
);
 2   DROP TABLE dt."WorkflowSpecificationCxnProperty";
       dt         heap    postgres    false    6            y           1259    37385    WorkflowSpecificationCxnType    TABLE       CREATE TABLE dt."WorkflowSpecificationCxnType" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "fromMultiplicity" text,
    "toMultiplicity" text
);
 .   DROP TABLE dt."WorkflowSpecificationCxnType";
       dt         heap    postgres    false    6            z           1259    37391 $   WorkflowSpecificationCxnTypeProperty    TABLE       CREATE TABLE dt."WorkflowSpecificationCxnTypeProperty" (
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
    "valueUom" character varying(25),
    sensor character varying(25),
    "workflowSpecificationCxnType" character varying(25),
    "uomCategory" character varying(25),
    parent character varying(25),
    "propertyType" character varying(25),
    "sensorType" character varying(25),
    category character varying(25)
);
 6   DROP TABLE dt."WorkflowSpecificationCxnTypeProperty";
       dt         heap    postgres    false    6            {           1259    37397    WorkflowSpecificationNode    TABLE     �  CREATE TABLE dt."WorkflowSpecificationNode" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL,
    "childWorkflowSpecification" character varying(25),
    "workflowSpecificationNodeType" character varying(25),
    "workMaster" character varying(25),
    "workflowSpecification" character varying(25)
);
 +   DROP TABLE dt."WorkflowSpecificationNode";
       dt         heap    postgres    false    6            |           1259    37403 !   WorkflowSpecificationNodeProperty    TABLE       CREATE TABLE dt."WorkflowSpecificationNodeProperty" (
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
    "workflowSpecificationNode" character varying(25),
    "uomCategory" character varying(25),
    "propertyType" character varying(25),
    "sensorType" character varying(25),
    "valueUom" character varying(25),
    sensor character varying(25),
    parent character varying(25),
    category character varying(25)
);
 3   DROP TABLE dt."WorkflowSpecificationNodeProperty";
       dt         heap    postgres    false    6            }           1259    37409    WorkflowSpecificationNodeType    TABLE     �   CREATE TABLE dt."WorkflowSpecificationNodeType" (
    id character varying(25) NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    "isDeleted" boolean NOT NULL,
    "sortOrder" integer NOT NULL
);
 /   DROP TABLE dt."WorkflowSpecificationNodeType";
       dt         heap    postgres    false    6            ~           1259    37415 %   WorkflowSpecificationNodeTypeProperty    TABLE     !  CREATE TABLE dt."WorkflowSpecificationNodeTypeProperty" (
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
    "uomCategory" character varying(25),
    "sensorType" character varying(25),
    "valueUom" character varying(25),
    "propertyType" character varying(25),
    "workflowSpecificationNodeType" character varying(25),
    sensor character varying(25),
    category character varying(25),
    parent character varying(25)
);
 7   DROP TABLE dt."WorkflowSpecificationNodeTypeProperty";
       dt         heap    postgres    false    6                       1259    37421    WorkflowSpecificationProperty    TABLE       CREATE TABLE dt."WorkflowSpecificationProperty" (
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
    category character varying(25),
    "workflowSpecification" character varying(25),
    "uomCategory" character varying(25),
    parent character varying(25),
    "propertyType" character varying(25),
    "sensorType" character varying(25),
    "valueUom" character varying(25),
    sensor character varying(25)
);
 /   DROP TABLE dt."WorkflowSpecificationProperty";
       dt         heap    postgres    false    6            �           1259    37427    _EventTypeInstanceEventRoute    TABLE     �   CREATE TABLE dt."_EventTypeInstanceEventRoute" (
    "A" character varying(25) NOT NULL,
    "B" character varying(25) NOT NULL
);
 .   DROP TABLE dt."_EventTypeInstanceEventRoute";
       dt         heap    postgres    false    6            �           1259    37430 +   _EventTypePropertyEventTypeInstanceProperty    TABLE     �   CREATE TABLE dt."_EventTypePropertyEventTypeInstanceProperty" (
    "A" character varying(25) NOT NULL,
    "B" character varying(25) NOT NULL
);
 =   DROP TABLE dt."_EventTypePropertyEventTypeInstanceProperty";
       dt         heap    postgres    false    6            �           1259    37433    _OperationsDefinitionCustomer    TABLE     �   CREATE TABLE dt."_OperationsDefinitionCustomer" (
    "A" character varying(25) NOT NULL,
    "B" character varying(25) NOT NULL
);
 /   DROP TABLE dt."_OperationsDefinitionCustomer";
       dt         heap    postgres    false    6            �           1259    37436 "   _OperationsDefinitionCustomerTypes    TABLE     �   CREATE TABLE dt."_OperationsDefinitionCustomerTypes" (
    "A" character varying(25) NOT NULL,
    "B" character varying(25) NOT NULL
);
 4   DROP TABLE dt."_OperationsDefinitionCustomerTypes";
       dt         heap    postgres    false    6            �           1259    37439    _OperationsRequestCustomer    TABLE     �   CREATE TABLE dt."_OperationsRequestCustomer" (
    "A" character varying(25) NOT NULL,
    "B" character varying(25) NOT NULL
);
 ,   DROP TABLE dt."_OperationsRequestCustomer";
       dt         heap    postgres    false    6            �           1259    37442    _OperationsRequestCustomerTypes    TABLE     �   CREATE TABLE dt."_OperationsRequestCustomerTypes" (
    "A" character varying(25) NOT NULL,
    "B" character varying(25) NOT NULL
);
 1   DROP TABLE dt."_OperationsRequestCustomerTypes";
       dt         heap    postgres    false    6            �          0    36374    CalendarPattern 
   TABLE DATA           p   COPY dt."CalendarPattern" (id, code, name, description, "isDeleted", "sortOrder", "objectCategory") FROM stdin;
    dt          postgres    false    204         �          0    36380    CalendarPatternEntry 
   TABLE DATA           �   COPY dt."CalendarPatternEntry" (id, code, name, description, "isDeleted", "sortOrder", "sequenceNumber", "daysCount", "startingTime", "endingTime", duration, "entryType", "calendarPattern") FROM stdin;
    dt          postgres    false    205   -      �          0    36386    Customer 
   TABLE DATA              COPY dt."Customer" (id, name, code, description, country, city, "sortOrder", "isDeleted", parent, "customerClass") FROM stdin;
    dt          postgres    false    206   J      �          0    36392    CustomerClass 
   TABLE DATA           \   COPY dt."CustomerClass" (id, name, code, description, "isDeleted", "sortOrder") FROM stdin;
    dt          postgres    false    207   g      �          0    36398    CustomerClassProperty 
   TABLE DATA           E  COPY dt."CustomerClassProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", parent, "customerClass", "propertyType", category, sensor, "valueUom", "uomCategory", "sensorType") FROM stdin;
    dt          postgres    false    208   �      �          0    36404    CustomerProperty 
   TABLE DATA           9  COPY dt."CustomerProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", "propertyType", parent, "valueUom", "uomCategory", category, "sensorType", customer, sensor) FROM stdin;
    dt          postgres    false    209   �      �          0    36410 	   Equipment 
   TABLE DATA           �   COPY dt."Equipment" (id, code, name, description, "isDeleted", "sortOrder", "madeFromId", "madeFromType", "recordType", parent, "equipmentLevel") FROM stdin;
    dt          postgres    false    210   �      �          0    36416    EquipmentActual 
   TABLE DATA             COPY dt."EquipmentActual" (id, name, code, description, "isDeleted", "sortOrder", "madeFromId", "madeFromType", "resourceUse", "selectToRun", "linkedGroup", quantity, equipment, "segmentResponse", "quantityUom", "jobResponse", "equipmentClass") FROM stdin;
    dt          postgres    false    211   �,      �          0    36422    EquipmentActualProperty 
   TABLE DATA           �  COPY dt."EquipmentActualProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", quantity, "madeFromId", "madeFromType", category, "uomCategory", "sensorType", "quantityUom", "valueUom", sensor, "equipmentActual", parent, "propertyType") FROM stdin;
    dt          postgres    false    212   �,      �          0    36428    EquipmentAssetMapping 
   TABLE DATA           �   COPY dt."EquipmentAssetMapping" (id, description, "isDeleted", "sortOrder", "startTime", "endTime", "physicalAsset", equipment) FROM stdin;
    dt          postgres    false    213   �,      �          0    36434    EquipmentCapability 
   TABLE DATA           ]  COPY dt."EquipmentCapability" (id, name, code, description, "isDeleted", "sortOrder", reason, "startTime", "endTime", "confidenceFactor", quantity, "workCapability", "capabilityType", "resourceUse", "processSegmentCapability", "hierarchyScope", equipment, "operationsCapability", "equipmentClass", "quantityUom", "workMasterCapability") FROM stdin;
    dt          postgres    false    214   �,      �          0    36440    EquipmentCapabilityProperty 
   TABLE DATA           j  COPY dt."EquipmentCapabilityProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", quantity, category, "uomCategory", sensor, "equipmentCapability", "propertyType", "quantityUom", "sensorType", "valueUom", parent) FROM stdin;
    dt          postgres    false    215   �,      �          0    36446    EquipmentClass 
   TABLE DATA           �   COPY dt."EquipmentClass" (id, code, name, description, "isDeleted", "sortOrder", "isInstantiable", parent, "equipmentLevel") FROM stdin;
    dt          postgres    false    216   -      �          0    36452    EquipmentClassMapping 
   TABLE DATA           J   COPY dt."EquipmentClassMapping" (equipment, "equipmentClass") FROM stdin;
    dt          postgres    false    217   N1      �          0    36455    EquipmentClassProperty 
   TABLE DATA           e  COPY dt."EquipmentClassProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", "madeFromId", "madeFromType", "propertyType", "uomCategory", "sensorType", category, "equipmentClass", "valueUom", parent, sensor) FROM stdin;
    dt          postgres    false    218   =      �          0    36461    EquipmentProperty 
   TABLE DATA           Y  COPY dt."EquipmentProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", "madeFromId", "madeFromType", category, "valueUom", parent, "sensorType", "uomCategory", "propertyType", equipment, sensor) FROM stdin;
    dt          postgres    false    219   �J      �          0    36467    EquipmentRequirement 
   TABLE DATA             COPY dt."EquipmentRequirement" (id, name, code, description, "isDeleted", "sortOrder", "madeFromId", "madeFromType", quantity, "selectToRun", "linkedGroup", "resourceUse", "alternateResourse", equipment, "jobOrder", "segmentRequirement", "equipmentClass", "quantityUom") FROM stdin;
    dt          postgres    false    220   �u      �          0    36473    EquipmentRequirementProperty 
   TABLE DATA           �  COPY dt."EquipmentRequirementProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", quantity, "logRate", "madeFromId", "madeFromType", "logRateUom", sensor, parent, category, "uomCategory", "sensorType", "propertyType", "valueUom", "quantityUom", "equipmentRequirement") FROM stdin;
    dt          postgres    false    221    v      �          0    36479    EquipmentSegmentSpecification 
   TABLE DATA           �   COPY dt."EquipmentSegmentSpecification" (id, code, name, description, "isDeleted", "sortOrder", "madeFromId", "madeFromType", quantity, "resourceUse", "linkedGroup", "quantityUom", "processSegment", equipment, "equipmentClass") FROM stdin;
    dt          postgres    false    222   v      �          0    36485 %   EquipmentSegmentSpecificationProperty 
   TABLE DATA           �  COPY dt."EquipmentSegmentSpecificationProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", quantity, "madeFromId", "madeFromType", "propertyType", "sensorType", "valueUom", "quantityUom", sensor, "equipmentSegmentSpecification", category, "uomCategory", parent) FROM stdin;
    dt          postgres    false    223   z                 0    36491 *   EquipmentSegmentSpecificationStreamMapping 
   TABLE DATA           �   COPY dt."EquipmentSegmentSpecificationStreamMapping" (id, "isDeleted", "sortOrder", "inStream", "equipmentSegmentSpecification", stream) FROM stdin;
    dt          postgres    false    224   .�                0    36494    EquipmentSpecification 
   TABLE DATA           	  COPY dt."EquipmentSpecification" (id, code, name, description, "isDeleted", "sortOrder", "madeFromId", "madeFromType", quantity, "selectToRun", "linkedGroup", "resourceUse", "workMaster", equipment, "quantityUom", "operationsSegment", "equipmentClass") FROM stdin;
    dt          postgres    false    225   ��                0    36500    EquipmentSpecificationProperty 
   TABLE DATA           �  COPY dt."EquipmentSpecificationProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", "logRate", quantity, "madeFromId", "madeFromType", parent, "uomCategory", "propertyType", "valueUom", category, "logRateUom", sensor, "quantityUom", "sensorType", "equipmentSpecification") FROM stdin;
    dt          postgres    false    226   y�                0    36506    EventContext 
   TABLE DATA           s   COPY dt."EventContext" (id, "sourceId", eid, flowname, payload, "timestamp", "isDeleted", "sortOrder") FROM stdin;
    dt          postgres    false    227   ��                0    36512 
   EventRoute 
   TABLE DATA           n   COPY dt."EventRoute" (id, "topicName", "tagValue", "isDeleted", "sortOrder", "eventTypeInstance") FROM stdin;
    dt          postgres    false    228   
�                0    36518 	   EventType 
   TABLE DATA             COPY dt."EventType" (id, code, name, description, "isDeleted", "sortOrder", "associatedDTType", "gitUrl", "createdAt", "modifiedAt", "createdBy", "modifiedBy", parent, "notificationType", "eventCategory", "recordType", "associatedDTObjectType") FROM stdin;
    dt          postgres    false    229   �                 0    36524    EventTypeInstance 
   TABLE DATA           �   COPY dt."EventTypeInstance" (id, code, name, description, "isDeleted", "sortOrder", "associatedDTEntity", status, "createdAt", "modifiedAt", "createdBy", "modifiedBy", "eventType", "associatedDTObjectEntity") FROM stdin;
    dt          postgres    false    230   �                0    36530    EventTypeInstanceProperty 
   TABLE DATA           �   COPY dt."EventTypeInstanceProperty" (id, value, "isDeleted", "sortOrder", "eventTypeProperty", "eventTypeInstance") FROM stdin;
    dt          postgres    false    231   �                0    36536    EventTypeProperty 
   TABLE DATA           �   COPY dt."EventTypeProperty" (id, code, name, description, "isRequired", value, "isDeleted", "sortOrder", "isMutable", category, "flowMeta", "eventType", "propertyType") FROM stdin;
    dt          postgres    false    232         	          0    36542    FlowMeta 
   TABLE DATA           �   COPY dt."FlowMeta" (id, "topicName", "isInput", "isTag", "isDeleted", "sortOrder", "createdAt", "modifiedAt", "flowType") FROM stdin;
    dt          postgres    false    233   "      
          0    36548    FlowType 
   TABLE DATA           �   COPY dt."FlowType" (id, code, name, description, "isDeleted", "sortOrder", script, "gitUrl", "createdAt", "modifiedAt", "createdBy", "modifiedBy", "deploymentStatus", "eventTypes") FROM stdin;
    dt          postgres    false    234   %                0    36554    FromResourceReference 
   TABLE DATA           �   COPY dt."FromResourceReference" (id, name, code, description, "isDeleted", "sortOrder", "resourceId", "resourceNetworkConnection", "resourceType") FROM stdin;
    dt          postgres    false    235   �M                0    36560    FromResourceReferenceProperty 
   TABLE DATA           U  COPY dt."FromResourceReferenceProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", "defaultValue", "valueUom", "uomCategory", "fromResourceReference", category, parent, sensor, "propertyType", "sensorType") FROM stdin;
    dt          postgres    false    236   �M                0    36566    JobList 
   TABLE DATA           �   COPY dt."JobList" (id, code, name, description, "isDeleted", "sortOrder", "startTime", "endTime", "publishedDate", "hierarchyScope", "workType") FROM stdin;
    dt          postgres    false    237   �M                0    36572    JobListProperty 
   TABLE DATA           9  COPY dt."JobListProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", category, "uomCategory", parent, "jobList", "sensorType", "propertyType", sensor, "valueUom") FROM stdin;
    dt          postgres    false    238   N                0    36578    JobOrder 
   TABLE DATA             COPY dt."JobOrder" (id, name, code, description, "isDeleted", "sortOrder", "workMasterVersion", "startTime", "endTime", "jobCommand", "jobCommandRule", priority, "workType", "hierarchyScope", "dispatchStatus", "jobList", "workMaster", "workRequest") FROM stdin;
    dt          postgres    false    239   7N                0    36584    JobOrderParameter 
   TABLE DATA           <  COPY dt."JobOrderParameter" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", "uomCategory", parent, sensor, "sensorType", "jobOrder", category, "propertyType", "valueUom") FROM stdin;
    dt          postgres    false    240   TN                0    36590    JobResponse 
   TABLE DATA           �   COPY dt."JobResponse" (id, code, name, description, "isDeleted", "sortOrder", "workMasterVersion", "startTime", "endTime", "responseStatus", "hierarchyScope", "jobOrder", "workResponse", "workMaster", "workType", parent) FROM stdin;
    dt          postgres    false    241   qN                0    36596    JobResponseData 
   TABLE DATA           =  COPY dt."JobResponseData" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", category, parent, sensor, "sensorType", "jobResponse", "valueUom", "uomCategory", "propertyType") FROM stdin;
    dt          postgres    false    242   �N                0    36602    Lookup 
   TABLE DATA           �   COPY dt."Lookup" (id, code, name, description, "isDeleted", "sortOrder", value, "isClientSpecific", "isHidden", category, parent) FROM stdin;
    dt          postgres    false    243   �N                0    36608    LookupCategory 
   TABLE DATA           ]   COPY dt."LookupCategory" (id, code, name, description, "isDeleted", "sortOrder") FROM stdin;
    dt          postgres    false    244   �_                0    36614    MaterialActual 
   TABLE DATA           j  COPY dt."MaterialActual" (id, name, code, description, "isDeleted", "sortOrder", quantity, "sequenceNumber", "madeFromId", "madeFromType", "materialClass", parent, "assemblyRelationship", "materialLot", "assemblyType", "quantityUom", "storageLocation", "jobResponse", "resourceUse", stream, "materialDefinition", "segmentResponse", "materialSubLot") FROM stdin;
    dt          postgres    false    245   �b                0    36620    MaterialActualProperty 
   TABLE DATA           ~  COPY dt."MaterialActualProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", quantity, "madeFromId", "madeFromType", "propertyType", "quantityUom", "sensorType", "valueUom", "uomCategory", category, parent, "materialActual", sensor) FROM stdin;
    dt          postgres    false    246   �b                0    36626    MaterialAssemblyDefinition 
   TABLE DATA           �   COPY dt."MaterialAssemblyDefinition" (id, "isDeleted", "sortOrder", "assembledFrom", "assemblyType", "materialDefinition", "assemblyRelationship") FROM stdin;
    dt          postgres    false    247   �b                0    36629    MaterialCapability 
   TABLE DATA           �  COPY dt."MaterialCapability" (id, name, code, description, "isDeleted", "sortOrder", reason, "confidenceFactor", "endTime", "startTime", quantity, "resourceUse", "workCapability", "materialClass", "workMasterCapability", "processSegmentCapability", "operationsCapability", "materialLot", "quantityUom", "assemblyType", "hierarchyScope", "capabilityType", "materialDefinition", "materialSubLot", "assemblyRelationship", parent) FROM stdin;
    dt          postgres    false    248   c                0    36635    MaterialCapabilityProperty 
   TABLE DATA           h  COPY dt."MaterialCapabilityProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", quantity, category, sensor, "sensorType", "materialCapability", "propertyType", parent, "uomCategory", "valueUom", "quantityUom") FROM stdin;
    dt          postgres    false    249   8c                0    36641    MaterialClass 
   TABLE DATA           �   COPY dt."MaterialClass" (id, code, name, description, "isDeleted", "sortOrder", "isInstantiable", "assemblyRelationship", parent, "assemblyType") FROM stdin;
    dt          postgres    false    250   Uc                0    36647    MaterialClassMapping 
   TABLE DATA           S   COPY dt."MaterialClassMapping" ("materialClass", "materialDefinition") FROM stdin;
    dt          postgres    false    251   �e                0    36650    MaterialClassProperty 
   TABLE DATA           c  COPY dt."MaterialClassProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", "madeFromId", "madeFromType", "valueUom", "uomCategory", "materialClass", category, "propertyType", sensor, parent, "sensorType") FROM stdin;
    dt          postgres    false    252   Lm                0    36656    MaterialDefinition 
   TABLE DATA           �   COPY dt."MaterialDefinition" (id, code, name, description, "sortOrder", "isDeleted", "madeFromId", "madeFromType", parent, "assemblyRelationship", "assemblyType") FROM stdin;
    dt          postgres    false    253   �v                0    36662    MaterialDefinitionProperty 
   TABLE DATA           m  COPY dt."MaterialDefinitionProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", "madeFromId", "madeFromType", category, "sensorType", "materialDefinition", "propertyType", sensor, "uomCategory", "valueUom", parent) FROM stdin;
    dt          postgres    false    254   ݃                0    36668    MaterialLot 
   TABLE DATA           �   COPY dt."MaterialLot" (id, name, code, description, "isDeleted", "sortOrder", quantity, "materialStatus", "quantityUom", "assemblyRelationship", "materialDefinition", "assemblyType", parent, "storageLocation") FROM stdin;
    dt          postgres    false    255   �                 0    36674    MaterialLotProperty 
   TABLE DATA           q  COPY dt."MaterialLotProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "isRequired", "isMutable", "scriptAssociation", "defaultValue", "possibleValues", "madeFromId", "madeFromType", category, "sensorType", "materialLot", "propertyType", "uomCategory", "valueUom", "materialSubLot", sensor, parent) FROM stdin;
    dt          postgres    false    256   �      !          0    36680    MaterialRequirement 
   TABLE DATA           o  COPY dt."MaterialRequirement" (id, name, code, description, "isDeleted", "sortOrder", "madeFromId", "madeFromType", quantity, "sequenceNumber", "materialClass", "materialLot", "materialSubLot", "assemblyType", "materialDefinition", "segmentRequirement", "jobOrder", "assemblyRelationship", "resourceUse", "storageLocation", "quantityUom", parent, stream) FROM stdin;
    dt          postgres    false    257   #�      "          0    36686    MaterialRequirementBill 
   TABLE DATA           {   COPY dt."MaterialRequirementBill" (id, name, code, description, "isDeleted", "sortOrder", "operationsRequest") FROM stdin;
    dt          postgres    false    258   @�      #          0    36692    MaterialRequirementBillItem 
   TABLE DATA           �   COPY dt."MaterialRequirementBillItem" (id, name, code, description, "isDeleted", "sortOrder", quantity, "resourceUse", "materialRequirementBill", parent, "materialDefinition", "materialClass", "quantityUom") FROM stdin;
    dt          postgres    false    259   ]�      $          0    36698    MaterialRequirementProperty 
   TABLE DATA           �  COPY dt."MaterialRequirementProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", quantity, "logRate", "madeFromId", "madeFromType", "uomCategory", parent, "propertyType", "sensorType", sensor, "materialRequirement", category, "quantityUom", "logRateUom", "valueUom") FROM stdin;
    dt          postgres    false    260   z�      %          0    36704    MaterialSegmentSpecification 
   TABLE DATA           "  COPY dt."MaterialSegmentSpecification" (id, code, name, description, "isDeleted", "sortOrder", "madeFromId", "madeFromType", quantity, "processSegment", "assemblyType", "quantityUom", stream, parent, "resourceUse", "materialClass", "assemblyRelationship", "materialDefinition") FROM stdin;
    dt          postgres    false    261   ��      &          0    36710 $   MaterialSegmentSpecificationProperty 
   TABLE DATA           �  COPY dt."MaterialSegmentSpecificationProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", quantity, "madeFromId", "madeFromType", parent, "uomCategory", category, "quantityUom", sensor, "valueUom", "propertyType", "sensorType", "materialSegmentSpecification") FROM stdin;
    dt          postgres    false    262   (�      '          0    36716    MaterialSpecification 
   TABLE DATA           J  COPY dt."MaterialSpecification" (id, code, name, description, "isDeleted", "sortOrder", "madeFromId", "madeFromType", quantity, "operationsSegment", "assemblyType", "operationsMaterialBillItem", "quantityUom", "assemblyRelationship", stream, "materialClass", "workMaster", "resourceUse", parent, "materialDefinition") FROM stdin;
    dt          postgres    false    263   ��      (          0    36722    MaterialSpecificationProperty 
   TABLE DATA           �  COPY dt."MaterialSpecificationProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", "logRate", quantity, "madeFromId", "madeFromType", "uomCategory", category, "quantityUom", "propertyType", "materialSpecification", "logRateUom", "sensorType", "valueUom", sensor, parent) FROM stdin;
    dt          postgres    false    264   j�      )          0    36728    MaterialSubLot 
   TABLE DATA           �   COPY dt."MaterialSubLot" (id, name, code, description, "isDeleted", "sortOrder", quantity, "assemblyRelationship", "assemblyType", "materialLot", "quantityUom", "storageLocation", "materialStatus") FROM stdin;
    dt          postgres    false    265   [a      *          0    36734    MigrationMeta 
   TABLE DATA           /   COPY dt."MigrationMeta" (id, data) FROM stdin;
    dt          postgres    false    266   xa      +          0    36740    ObjectwisePatternConfiguration 
   TABLE DATA           �   COPY dt."ObjectwisePatternConfiguration" (id, description, "isDeleted", "sortOrder", "appliedOnObject", "startRule", "endRule", "patternStartSequence", "startingDayCount", pattern, "workCalendarDefinition") FROM stdin;
    dt          postgres    false    267   Xc      ,          0    36746    OperationsCapability 
   TABLE DATA           �   COPY dt."OperationsCapability" (id, name, code, description, "isDeleted", "sortOrder", reason, "confidenceFactor", "startTime", "endTime", "publishedDate", "capabilityType", parent, "hierarchyScope") FROM stdin;
    dt          postgres    false    268   uc      -          0    36752    OperationsCapabilityProperty 
   TABLE DATA           S  COPY dt."OperationsCapabilityProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "isRequired", "isMutable", "scriptAssociation", "defaultValue", "possibleValues", "valueUom", "propertyType", sensor, parent, "operationsCapability", "uomCategory", category, "sensorType") FROM stdin;
    dt          postgres    false    269   �c      .          0    36758    OperationsDefinition 
   TABLE DATA           ;  COPY dt."OperationsDefinition" (id, code, name, description, "isDeleted", "sortOrder", "madeFromId", "madeFromType", "customerId", "customerName", version, "billOfResourceId", "billOfMaterialId", "workMaster", "createdBy", "createdDate", "linkedGroup", "recordType", "operationsType", "hierarchyScope") FROM stdin;
    dt          postgres    false    270   �c      /          0    36764    OperationsDefinitionProperty 
   TABLE DATA           �  COPY dt."OperationsDefinitionProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", "logRate", "madeFromId", "madeFromType", sensor, "uomCategory", "valueUom", category, "propertyType", "logRateUom", "operationsDefinition", parent, "sensorType") FROM stdin;
    dt          postgres    false    271   �e      0          0    36770    OperationsMaterialBill 
   TABLE DATA           }   COPY dt."OperationsMaterialBill" (id, code, name, description, "isDeleted", "sortOrder", "operationsDefinition") FROM stdin;
    dt          postgres    false    272   �e      1          0    36776    OperationsMaterialBillItem 
   TABLE DATA             COPY dt."OperationsMaterialBillItem" (id, code, name, description, "isDeleted", "sortOrder", quantity, "materialDefinition", "assemblyRelationship", "materialClass", "operationsMaterialBill", "quantityUom", "resourceUse", "assemblyType", parent) FROM stdin;
    dt          postgres    false    273   �f      2          0    36782    OperationsPerformance 
   TABLE DATA           �   COPY dt."OperationsPerformance" (id, code, name, description, "isDeleted", "sortOrder", "startTime", "endTime", "publishedDate", "hierarchyScope", "operationsType", "operationsSchedule", "performanceStatus") FROM stdin;
    dt          postgres    false    274   �f      3          0    36788    OperationsPerformanceProperty 
   TABLE DATA           U  COPY dt."OperationsPerformanceProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", "propertyType", "valueUom", category, "operationsPerformance", sensor, "uomCategory", "sensorType", parent) FROM stdin;
    dt          postgres    false    275   �f      4          0    36794    OperationsRequest 
   TABLE DATA             COPY dt."OperationsRequest" (id, code, name, description, "isDeleted", "sortOrder", "startTime", "endTime", "createdBy", "createdDate", "operationsDefinition", "operationsType", "operationsSchedule", "hierarchyScope", priority, "workMaster", "orderRequestStatus") FROM stdin;
    dt          postgres    false    276   �f      5          0    36800    OperationsRequestProperty 
   TABLE DATA           f  COPY dt."OperationsRequestProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", "logRate", category, "logRateUom", "propertyType", sensor, parent, "uomCategory", "valueUom", "sensorType", "operationsRequest") FROM stdin;
    dt          postgres    false    277   g      6          0    36806    OperationsResponse 
   TABLE DATA             COPY dt."OperationsResponse" (id, code, name, description, "isDeleted", "sortOrder", "createdBy", "createdDate", "startTime", "endTime", "operationsPerformance", "operationsRequest", "responseStatus", "hierarchyScope", "operationsDefinition", "operationsType") FROM stdin;
    dt          postgres    false    278   +g      7          0    36812    OperationsResponseProperty 
   TABLE DATA           O  COPY dt."OperationsResponseProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", "valueUom", "uomCategory", parent, "operationsResponse", "sensorType", "propertyType", category, sensor) FROM stdin;
    dt          postgres    false    279   Hg      8          0    36818    OperationsSchedule 
   TABLE DATA           �   COPY dt."OperationsSchedule" (id, code, name, description, "isDeleted", "sortOrder", "startTime", "endTime", "publishedDate", "operationsType", "hierarchyScope", "scheduledStatus") FROM stdin;
    dt          postgres    false    280   eg      9          0    36824    OperationsScheduleProperty 
   TABLE DATA           h  COPY dt."OperationsScheduleProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", "logRate", "operationsSchedule", "logRateUom", parent, category, "valueUom", "sensorType", sensor, "uomCategory", "propertyType") FROM stdin;
    dt          postgres    false    281   �g      :          0    36830    OperationsSegment 
   TABLE DATA           H  COPY dt."OperationsSegment" (id, code, name, description, "isDeleted", "sortOrder", "madeFromId", "madeFromType", "isTemplate", "processFlowDiagram", "dependenciesFlowDiagram", "workMaster", duration, "operationsDefinition", "durationUom", "recordType", parent, "processSegment", "operationsType", "hierarchyScope") FROM stdin;
    dt          postgres    false    282   �g      ;          0    36836    OperationsSegmentDependency 
   TABLE DATA           �   COPY dt."OperationsSegmentDependency" (id, name, code, description, "isDeleted", "sortOrder", "madeFromId", "madeFromType", value, "maxValue", "minValue", "dependencyFactor", segment, "valueUom", "dependencyType", "dependentSegment") FROM stdin;
    dt          postgres    false    283   �w      <          0    36842 '   OperationsSegmentParameterSpecification 
   TABLE DATA           �  COPY dt."OperationsSegmentParameterSpecification" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "isRequired", "isMutable", "scriptAssociation", "defaultValue", "possibleValues", "logRate", "madeFromId", "madeFromType", "propertyType", parent, category, sensor, "sensorType", "uomCategory", "logRateUom", "valueUom", "operationsSegment") FROM stdin;
    dt          postgres    false    284   �w      =          0    36848    Person 
   TABLE DATA           U   COPY dt."Person" (id, code, name, description, "isDeleted", "sortOrder") FROM stdin;
    dt          postgres    false    285   {      >          0    36854    PersonProperty 
   TABLE DATA           S  COPY dt."PersonProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", "madeFromId", "madeFromType", sensor, "uomCategory", "sensorType", "valueUom", "propertyType", parent, category, person) FROM stdin;
    dt          postgres    false    286   �|      ?          0    36860    PersonnelActual 
   TABLE DATA           �   COPY dt."PersonnelActual" (id, code, name, description, "isDeleted", "sortOrder", "madeFromId", "madeFromType", "resourceUse", quantity, "segmentResponse", "personnelClass", person, "quantityUom", "jobResponse") FROM stdin;
    dt          postgres    false    287   z�      @          0    36866    PersonnelActualProperty 
   TABLE DATA           �  COPY dt."PersonnelActualProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", quantity, "madeFromId", "madeFromType", "personnelActual", "propertyType", "quantityUom", category, "uomCategory", parent, "sensorType", sensor, "valueUom") FROM stdin;
    dt          postgres    false    288   ��      A          0    36872    PersonnelCapability 
   TABLE DATA           Z  COPY dt."PersonnelCapability" (id, name, code, description, "isDeleted", "sortOrder", "confidenceFactor", reason, "startTime", "endTime", quantity, "workMasterCapability", "quantityUom", "workCapability", "processSegmentCapability", "capabilityType", "personnelClass", "hierarchyScope", "operationsCapability", "resourceUse", person) FROM stdin;
    dt          postgres    false    289   ��      B          0    36878    PersonnelCapabilityProperty 
   TABLE DATA           j  COPY dt."PersonnelCapabilityProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", quantity, "personnelCapability", "valueUom", "quantityUom", "uomCategory", "sensorType", "propertyType", category, sensor, parent) FROM stdin;
    dt          postgres    false    290   ф      C          0    36884    PersonnelClass 
   TABLE DATA           w   COPY dt."PersonnelClass" (id, code, name, description, "isDeleted", "isInstantiable", "sortOrder", parent) FROM stdin;
    dt          postgres    false    291   �      D          0    36890    PersonnelClassMapping 
   TABLE DATA           G   COPY dt."PersonnelClassMapping" (person, "personnelClass") FROM stdin;
    dt          postgres    false    292   ��      E          0    36893    PersonnelClassProperty 
   TABLE DATA           e  COPY dt."PersonnelClassProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", "madeFromId", "madeFromType", "valueUom", "sensorType", "uomCategory", category, "propertyType", sensor, "personnelClass", parent) FROM stdin;
    dt          postgres    false    293   ��      F          0    36899    PersonnelRequirement 
   TABLE DATA           �   COPY dt."PersonnelRequirement" (id, name, code, description, "isDeleted", "sortOrder", "madeFromId", "madeFromType", quantity, "resourceUse", person, "quantityUom", "jobOrder", "segmentRequirement", "personnelClass") FROM stdin;
    dt          postgres    false    294   �      G          0    36905    PersonnelRequirementProperty 
   TABLE DATA           �  COPY dt."PersonnelRequirementProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", quantity, "logRate", "madeFromId", "madeFromType", "sensorType", "quantityUom", "propertyType", category, "valueUom", "personnelRequirement", "logRateUom", parent, "uomCategory", sensor) FROM stdin;
    dt          postgres    false    295    �      H          0    36911    PersonnelSegmentSpecification 
   TABLE DATA           �   COPY dt."PersonnelSegmentSpecification" (id, code, name, description, "isDeleted", "sortOrder", "madeFromId", "madeFromType", quantity, "resourceUse", "processSegment", "personnelClass", person, "quantityUom") FROM stdin;
    dt          postgres    false    296   �      I          0    36917 %   PersonnelSegmentSpecificationProperty 
   TABLE DATA           �  COPY dt."PersonnelSegmentSpecificationProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", quantity, "madeFromId", "madeFromType", "personnelSegmentSpecification", "sensorType", "propertyType", sensor, "valueUom", category, parent, "quantityUom", "uomCategory") FROM stdin;
    dt          postgres    false    297   V�      J          0    36923    PersonnelSpecification 
   TABLE DATA           �   COPY dt."PersonnelSpecification" (id, code, name, description, "isDeleted", "sortOrder", "madeFromId", "madeFromType", quantity, "resourceUse", "quantityUom", "personnelClass", person, "workMaster", "operationsSegment") FROM stdin;
    dt          postgres    false    298   Ȍ      K          0    36929    PersonnelSpecificationProperty 
   TABLE DATA           �  COPY dt."PersonnelSpecificationProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", "logRate", quantity, "madeFromId", "madeFromType", "propertyType", "sensorType", "quantityUom", "logRateUom", parent, "valueUom", "uomCategory", category, "personnelSpecification", sensor) FROM stdin;
    dt          postgres    false    299   ��      L          0    36935    PhysicalAsset 
   TABLE DATA           �   COPY dt."PhysicalAsset" (id, code, name, description, "isDeleted", "sortOrder", "madeFromId", "madeFromType", "vendorName", "fixedAssetName", parent, "physicalLocation") FROM stdin;
    dt          postgres    false    300   �      M          0    36941    PhysicalAssetActual 
   TABLE DATA           �   COPY dt."PhysicalAssetActual" (id, name, code, description, "isDeleted", "sortOrder", "madeFromId", "madeFromType", quantity, "resourceUse", "segmentResponse", "jobResponse", "physicalAsset", "physicalAssetClass", "quantityUom") FROM stdin;
    dt          postgres    false    301   (�      N          0    36947    PhysicalAssetActualProperty 
   TABLE DATA           �  COPY dt."PhysicalAssetActualProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", quantity, "madeFromId", "madeFromType", category, sensor, "valueUom", parent, "uomCategory", "quantityUom", "propertyType", "physicalAssetActual", "sensorType") FROM stdin;
    dt          postgres    false    302   E�      O          0    36953    PhysicalAssetCapability 
   TABLE DATA           k  COPY dt."PhysicalAssetCapability" (id, name, code, description, "isDeleted", "sortOrder", reason, "confidenceFactor", quantity, "startTime", "endTime", "physicalAssetClass", "workMasterCapability", "workCapability", "quantityUom", "capabilityType", "processSegmentCapability", "operationsCapability", "physicalAsset", "resourceUse", "hierarchyScope") FROM stdin;
    dt          postgres    false    303   b�      P          0    36959    PhysicalAssetCapabilityProperty 
   TABLE DATA           r  COPY dt."PhysicalAssetCapabilityProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", quantity, sensor, parent, "propertyType", "valueUom", "uomCategory", "physicalAssetCapability", "sensorType", category, "quantityUom") FROM stdin;
    dt          postgres    false    304   �      Q          0    36965    PhysicalAssetClass 
   TABLE DATA           �   COPY dt."PhysicalAssetClass" (id, code, name, description, "isDeleted", "sortOrder", "isInstantiable", manufacturer, parent) FROM stdin;
    dt          postgres    false    305   ��      R          0    36971    PhysicalAssetClassMapping 
   TABLE DATA           X   COPY dt."PhysicalAssetClassMapping" ("physicalAsset", "physicalAssetClass") FROM stdin;
    dt          postgres    false    306   ��      S          0    36974    PhysicalAssetClassProperty 
   TABLE DATA           m  COPY dt."PhysicalAssetClassProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", "madeFromId", "madeFromType", "physicalAssetClass", category, sensor, "sensorType", "valueUom", parent, "uomCategory", "propertyType") FROM stdin;
    dt          postgres    false    307   ֕      T          0    36980    PhysicalAssetProperty 
   TABLE DATA           c  COPY dt."PhysicalAssetProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", "madeFromId", "madeFromType", sensor, "uomCategory", "sensorType", "valueUom", "propertyType", "physicalAsset", parent, category) FROM stdin;
    dt          postgres    false    308   �      U          0    36986    PhysicalAssetRequirement 
   TABLE DATA             COPY dt."PhysicalAssetRequirement" (id, name, code, description, "isDeleted", "sortOrder", "madeFromId", "madeFromType", quantity, "segmentRequirement", "physicalAsset", "quantityUom", "physicalAssetClass", "equipmentLevel", "jobOrder", "resourceUse") FROM stdin;
    dt          postgres    false    309   �      V          0    36992     PhysicalAssetRequirementProperty 
   TABLE DATA           �  COPY dt."PhysicalAssetRequirementProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", quantity, "logRate", "madeFromId", "madeFromType", "valueUom", "uomCategory", "sensorType", "propertyType", category, "physicalAssetRequirement", parent, sensor, "quantityUom", "logRateUom") FROM stdin;
    dt          postgres    false    310   -�      W          0    36998 !   PhysicalAssetSegmentSpecification 
   TABLE DATA           �   COPY dt."PhysicalAssetSegmentSpecification" (id, code, name, description, "isDeleted", "sortOrder", "madeFromId", "madeFromType", quantity, "processSegment", "physicalAssetClass", "physicalAsset", "resourceUse", "quantityUom") FROM stdin;
    dt          postgres    false    311   J�      X          0    37004 )   PhysicalAssetSegmentSpecificationProperty 
   TABLE DATA           �  COPY dt."PhysicalAssetSegmentSpecificationProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", quantity, "madeFromId", "madeFromType", "uomCategory", "quantityUom", sensor, category, "sensorType", "valueUom", parent, "propertyType", "physicalAssetSegmentSpecification") FROM stdin;
    dt          postgres    false    312   g�      Y          0    37010    PhysicalAssetSpecification 
   TABLE DATA           �   COPY dt."PhysicalAssetSpecification" (id, code, name, description, "isDeleted", "sortOrder", "madeFromId", "madeFromType", quantity, "quantityUom", "resourceUse", "physicalAsset", "operationsSegment", "physicalAssetClass", "workMaster") FROM stdin;
    dt          postgres    false    313   ��      Z          0    37016 "   PhysicalAssetSpecificationProperty 
   TABLE DATA           �  COPY dt."PhysicalAssetSpecificationProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", "logRate", quantity, "madeFromId", "madeFromType", "valueUom", parent, "physicalAssetSpecification", sensor, "sensorType", category, "logRateUom", "uomCategory", "quantityUom", "propertyType") FROM stdin;
    dt          postgres    false    314   ��      [          0    37022    ProcessSegment 
   TABLE DATA             COPY dt."ProcessSegment" (id, code, name, description, "isDeleted", "sortOrder", "madeFromId", "madeFromType", "isTemplate", "processFlowDiagram", "dependenciesFlowDiagram", duration, "hierarchyScope", "operationsType", parent, "durationUom", "recordType") FROM stdin;
    dt          postgres    false    315   ��      \          0    37028    ProcessSegmentCapability 
   TABLE DATA           �   COPY dt."ProcessSegmentCapability" (id, name, code, description, "isDeleted", "sortOrder", reason, "startTime", "endTime", "capabilityType", "processSegment", "hierarchyScope", "operationsCapability", parent) FROM stdin;
    dt          postgres    false    316   ��      ]          0    37034    ProcessSegmentDependency 
   TABLE DATA           �   COPY dt."ProcessSegmentDependency" (id, name, code, description, "isDeleted", "sortOrder", "madeFromId", "madeFromType", value, "maxValue", "minValue", "dependencyType", segment, "valueUom", "dependentSegment", "dependencyFactor") FROM stdin;
    dt          postgres    false    317   ʠ      ^          0    37040    ProcessSegmentParameter 
   TABLE DATA           f  COPY dt."ProcessSegmentParameter" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", "madeFromId", "madeFromType", sensor, "propertyType", "valueUom", category, "sensorType", "uomCategory", "processSegment", parent) FROM stdin;
    dt          postgres    false    318   �      _          0    37046    ProductionPlan 
   TABLE DATA           �   COPY dt."ProductionPlan" (id, "isDeleted", "sortOrder", day, "requiredQuantity", "segmentRequirement", "operationsRequest", shift, "quantityUom") FROM stdin;
    dt          postgres    false    319   (�      `          0    37049    PropertyType 
   TABLE DATA           �   COPY dt."PropertyType" (id, code, name, description, "isDeleted", "sortOrder", "valueType", value, "minValue", "maxValue", "hasUomCategory", "hasSensorType", "defaultValues", "possibleValues", "sensorType", parent, "uomCategory") FROM stdin;
    dt          postgres    false    320   E�      a          0    37055    Reason 
   TABLE DATA           t   COPY dt."Reason" (id, name, code, "hasEquipment", description, "isDeleted", "sortOrder", "subCategory") FROM stdin;
    dt          postgres    false    321   `�      b          0    37061    ReasonCategory 
   TABLE DATA           ]   COPY dt."ReasonCategory" (id, name, code, description, "isDeleted", "sortOrder") FROM stdin;
    dt          postgres    false    322   ��      c          0    37067    ReasonEquipmentTypeMapping 
   TABLE DATA           K   COPY dt."ReasonEquipmentTypeMapping" ("equipmentType", reason) FROM stdin;
    dt          postgres    false    323   ޫ      d          0    37070    ReasonSubCategory 
   TABLE DATA           j   COPY dt."ReasonSubCategory" (id, name, code, description, "isDeleted", "sortOrder", category) FROM stdin;
    dt          postgres    false    324   E�      e          0    37076 
   ReasonTree 
   TABLE DATA           {   COPY dt."ReasonTree" (id, name, code, description, "isDeleted", "sortOrder", "stateMachine", "processSegment") FROM stdin;
    dt          postgres    false    325   %�      f          0    37082    ReasonTreeConfig 
   TABLE DATA           �   COPY dt."ReasonTreeConfig" (id, "groupNumber", "isDeleted", "sortOrder", reason, equipment, "stateDefinition", "subCategory", category, "reasonTree") FROM stdin;
    dt          postgres    false    326   �      g          0    37088    ResourceNetworkConnection 
   TABLE DATA           �   COPY dt."ResourceNetworkConnection" (id, code, name, description, "isDeleted", "sortOrder", "resourceNetworkConnectionType", "resourceRelationshipNetwork") FROM stdin;
    dt          postgres    false    327   ��      h          0    37094 !   ResourceNetworkConnectionProperty 
   TABLE DATA           ]  COPY dt."ResourceNetworkConnectionProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", "valueUom", "propertyType", parent, sensor, "sensorType", category, "resourceNetworkConnection", "uomCategory") FROM stdin;
    dt          postgres    false    328   հ      i          0    37100    ResourceNetworkConnectionType 
   TABLE DATA           r   COPY dt."ResourceNetworkConnectionType" (id, name, code, description, "isDeleted", "sortOrder", type) FROM stdin;
    dt          postgres    false    329   �      j          0    37106 %   ResourceNetworkConnectionTypeProperty 
   TABLE DATA           e  COPY dt."ResourceNetworkConnectionTypeProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", parent, category, "valueUom", "uomCategory", "resourceNetworkConnectionType", "propertyType", sensor, "sensorType") FROM stdin;
    dt          postgres    false    330   �      k          0    37112    ResourceRelationshipNetwork 
   TABLE DATA           �   COPY dt."ResourceRelationshipNetwork" (id, code, name, description, "isDeleted", "sortOrder", "relationshipForm", "relationshipType") FROM stdin;
    dt          postgres    false    331   ,�      l          0    37118    SegmentData 
   TABLE DATA           [  COPY dt."SegmentData" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", "madeFromId", "madeFromType", "propertyType", "valueUom", parent, "sensorType", "segmentResponse", sensor, "uomCategory", category) FROM stdin;
    dt          postgres    false    332   I�      m          0    37124    SegmentParameter 
   TABLE DATA           |  COPY dt."SegmentParameter" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", "logRate", "madeFromId", "madeFromType", "propertyType", parent, category, "segmentRequirement", "logRateUom", "uomCategory", "sensorType", "valueUom", sensor) FROM stdin;
    dt          postgres    false    333   f�      n          0    37130    SegmentRequirement 
   TABLE DATA           L  COPY dt."SegmentRequirement" (id, code, name, description, "isDeleted", "sortOrder", "earliestStartTime", "latestEndTime", "processFlowDiagram", duration, "operationsRequest", "durationUom", "hierarchyScope", parent, "operationsType", "operationsSegment", "orderRequestStatus", "operationsDefinition", "processSegment") FROM stdin;
    dt          postgres    false    334   ��      o          0    37136    SegmentResponse 
   TABLE DATA           A  COPY dt."SegmentResponse" (id, name, code, description, "isDeleted", "sortOrder", "actualStartTime", "actualEndTime", "processFlowDiagram", "operationsType", "segmentRequirement", "operationsSegment", parent, "processSegment", "hierarchyScope", "operationsDefinition", "operationsResponse", "responseStatus") FROM stdin;
    dt          postgres    false    335   ��      p          0    37142    Shift 
   TABLE DATA           l   COPY dt."Shift" (id, name, code, description, "isDeleted", "sortOrder", "startTime", "endTime") FROM stdin;
    dt          postgres    false    336   ��      q          0    37148    StateDefinition 
   TABLE DATA           �   COPY dt."StateDefinition" (id, code, name, description, "isDefault", icon, color, "isDeleted", "sortOrder", parent, criticality, "stateMachineDefinition", "stateLibrary") FROM stdin;
    dt          postgres    false    337   K�      r          0    37154    StateDefinitionTransition 
   TABLE DATA           }   COPY dt."StateDefinitionTransition" (id, verb, "isDeleted", "sortOrder", "stateMachineDefinition", "from", "to") FROM stdin;
    dt          postgres    false    338   ��      s          0    37160    StateLibrary 
   TABLE DATA           h   COPY dt."StateLibrary" (id, code, name, description, icon, color, "isDeleted", "sortOrder") FROM stdin;
    dt          postgres    false    339   ��      t          0    37166 !   StateLibraryReasonCategoryMapping 
   TABLE DATA           S   COPY dt."StateLibraryReasonCategoryMapping" (category, "stateLibrary") FROM stdin;
    dt          postgres    false    340   �      u          0    37169    StateMachineDefinition 
   TABLE DATA           �   COPY dt."StateMachineDefinition" (id, code, name, description, "isDeleted", "sortOrder", category, "isSystemGenerated") FROM stdin;
    dt          postgres    false    341   ɺ      v          0    37175    StateObjectMapping 
   TABLE DATA           �   COPY dt."StateObjectMapping" (id, "objectId", "objectType", actor, "timeStamp", "isOwner", "isDefault", "isInstanceState", "isMutable", "isDeleted", "sortOrder", "stateMachineDefinition", "prevStateDefinition", "stateDefinition") FROM stdin;
    dt          postgres    false    342   �      w          0    37181    Stream 
   TABLE DATA           e   COPY dt."Stream" (id, code, name, "isDeleted", "sortOrder", "streamType", "lotHandling") FROM stdin;
    dt          postgres    false    343   <�      x          0    37187    StreamProperty 
   TABLE DATA           S  COPY dt."StreamProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", "madeFromId", "madeFromType", stream, "propertyType", sensor, "sensorType", category, "valueUom", parent, "uomCategory") FROM stdin;
    dt          postgres    false    344   <�      y          0    37193    ToResourceReference 
   TABLE DATA           �   COPY dt."ToResourceReference" (id, name, code, description, "isDeleted", "sortOrder", "resourceId", "resourceType", "resourceNetworkConnection") FROM stdin;
    dt          postgres    false    345   �      z          0    37199    ToResourceReferenceProperty 
   TABLE DATA           Q  COPY dt."ToResourceReferenceProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", "sensorType", "valueUom", "toResourceReference", category, sensor, parent, "uomCategory", "propertyType") FROM stdin;
    dt          postgres    false    346   /�      {          0    37205    Uom 
   TABLE DATA           d   COPY dt."Uom" (id, code, name, description, "isDeleted", "sortOrder", symbol, category) FROM stdin;
    dt          postgres    false    347   L�      |          0    37211    UomCategory 
   TABLE DATA           Z   COPY dt."UomCategory" (id, code, name, description, "isDeleted", "sortOrder") FROM stdin;
    dt          postgres    false    348   ��      }          0    37217    WorkCalendar 
   TABLE DATA           [   COPY dt."WorkCalendar" (id, code, name, description, "isDeleted", "sortOrder") FROM stdin;
    dt          postgres    false    349   ��      ~          0    37223    WorkCalendarDefinition 
   TABLE DATA           t   COPY dt."WorkCalendarDefinition" (id, code, name, description, "isDeleted", "sortOrder", "planThrough") FROM stdin;
    dt          postgres    false    350   ��                0    37229    WorkCalendarDefinitionEntry 
   TABLE DATA             COPY dt."WorkCalendarDefinitionEntry" (id, code, name, description, "isDeleted", "sortOrder", "startRule", "recurrenceTimeIntervalRule", "durationRule", "startTime", "endTime", "appliedOnObject", parent, "patternEntry", pattern, "workCalendarDefinition", "entryType", day) FROM stdin;
    dt          postgres    false    351   ��      �          0    37235 #   WorkCalendarDefinitionEntryProperty 
   TABLE DATA           a  COPY dt."WorkCalendarDefinitionEntryProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", "propertyType", parent, "sensorType", "uomCategory", category, sensor, "workCalendarDefinitionEntry", "valueUom") FROM stdin;
    dt          postgres    false    352   ��      �          0    37241    WorkCalendarDefinitionGroup 
   TABLE DATA           j   COPY dt."WorkCalendarDefinitionGroup" (id, code, name, description, "isDeleted", "sortOrder") FROM stdin;
    dt          postgres    false    353   ��      �          0    37247 "   WorkCalendarDefinitionGroupMapping 
   TABLE DATA           �   COPY dt."WorkCalendarDefinitionGroupMapping" (id, description, "isDeleted", "sortOrder", "workCalendarDefinition", "workCalendarGroup") FROM stdin;
    dt          postgres    false    354   �      �          0    37253 #   WorkCalendarDefinitionObjectMapping 
   TABLE DATA           �   COPY dt."WorkCalendarDefinitionObjectMapping" (id, "appliedOnObject", description, "isDeleted", "sortOrder", "workCalendarDefinition") FROM stdin;
    dt          postgres    false    355   8�      �          0    37259     WorkCalendarDefinitionOverruling 
   TABLE DATA           �   COPY dt."WorkCalendarDefinitionOverruling" (id, "sequenceNumber", description, "isDeleted", "sortOrder", "overrulingWorkCalendardefinition", "workCalendarDefinition") FROM stdin;
    dt          postgres    false    356   U�      �          0    37265    WorkCalendarDefinitionProperty 
   TABLE DATA           W  COPY dt."WorkCalendarDefinitionProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", "sensorType", "valueUom", sensor, "propertyType", category, "uomCategory", parent, "workCalendarDefinition") FROM stdin;
    dt          postgres    false    357   r�      �          0    37271    WorkCalendarEntry 
   TABLE DATA           �   COPY dt."WorkCalendarEntry" (id, code, name, description, "isDeleted", "sortOrder", "startTime", "endTime", "entryType", "workCalendar", "workCalendarDefinitionEntry") FROM stdin;
    dt          postgres    false    358   ��      �          0    37277    WorkCalendarEntryProperty 
   TABLE DATA           t  COPY dt."WorkCalendarEntryProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", sensor, "valueUom", "sensorType", "workCalendarEntry", "propertyType", category, "uomCategory", parent, "workCalendarDefinitionEntryProperty") FROM stdin;
    dt          postgres    false    359   ��      �          0    37283    WorkCalendarProperty 
   TABLE DATA           C  COPY dt."WorkCalendarProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", "sensorType", sensor, "valueUom", category, "workCalendar", "uomCategory", "propertyType", parent) FROM stdin;
    dt          postgres    false    360   ��      �          0    37289    WorkCapability 
   TABLE DATA           �   COPY dt."WorkCapability" (id, code, name, description, "isDeleted", "sortOrder", reason, "confidenceFactor", "startTime", "endTime", "publishedDate", "capacityType", "hierarchyScope") FROM stdin;
    dt          postgres    false    361   ��      �          0    37295    WorkCapabilityProperty 
   TABLE DATA           G  COPY dt."WorkCapabilityProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", "sensorType", "uomCategory", sensor, parent, "propertyType", "workCapability", category, "valueUom") FROM stdin;
    dt          postgres    false    362   �      �          0    37301 
   WorkMaster 
   TABLE DATA           �   COPY dt."WorkMaster" (id, code, name, description, "isDeleted", "sortOrder", version, duration, "operationsSegment", "durationUom", "workType", "workMasterType", "operationsDefinition") FROM stdin;
    dt          postgres    false    363    �      �          0    37307    WorkMasterCapability 
   TABLE DATA           �   COPY dt."WorkMasterCapability" (id, name, code, description, "isDeleted", "sortOrder", reason, "confidenceFactor", "startTime", "endTime", "publishedDate", "workMaster", "hierarchyScope", "workCapability", "capacityType") FROM stdin;
    dt          postgres    false    364   =�      �          0    37313    WorkMasterCapabilityProperty 
   TABLE DATA           S  COPY dt."WorkMasterCapabilityProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", "propertyType", "valueUom", category, "workMasterCapability", parent, sensor, "uomCategory", "sensorType") FROM stdin;
    dt          postgres    false    365   Z�      �          0    37319    WorkPerformance 
   TABLE DATA           �   COPY dt."WorkPerformance" (id, code, name, description, "isDeleted", "sortOrder", "startTime", "endTime", "publishedDate", "workType", "workSchedule", "hierarchyScope", parent) FROM stdin;
    dt          postgres    false    366   w�      �          0    37325    WorkPerformanceProperty 
   TABLE DATA           I  COPY dt."WorkPerformanceProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", sensor, "valueUom", "sensorType", "propertyType", category, "uomCategory", "workPerformance", parent) FROM stdin;
    dt          postgres    false    367   ��      �          0    37331    WorkRequest 
   TABLE DATA           �   COPY dt."WorkRequest" (id, code, name, description, "isDeleted", "sortOrder", "startTime", "endTime", parent, "workSchedule", "hierarchyScope", "workType", priority) FROM stdin;
    dt          postgres    false    368   ��      �          0    37337    WorkRequestProperty 
   TABLE DATA           A  COPY dt."WorkRequestProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", parent, "uomCategory", sensor, "sensorType", "valueUom", "workRequest", category, "propertyType") FROM stdin;
    dt          postgres    false    369   ��      �          0    37343    WorkResponse 
   TABLE DATA           �   COPY dt."WorkResponse" (id, code, name, description, "isDeleted", "sortOrder", "startTime", "endTime", "workPerformance", "workType", "hierarchyScope", "responseStatus", "workRequest", parent) FROM stdin;
    dt          postgres    false    370   ��      �          0    37349    WorkResponseProperty 
   TABLE DATA           C  COPY dt."WorkResponseProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", "propertyType", parent, "valueUom", sensor, "workResponse", category, "uomCategory", "sensorType") FROM stdin;
    dt          postgres    false    371   �      �          0    37355    WorkSchedule 
   TABLE DATA           �   COPY dt."WorkSchedule" (id, code, name, description, "isDeleted", "sortOrder", "startTime", "endTime", "publishedDate", "workType", parent, "hierarchyScope") FROM stdin;
    dt          postgres    false    372   %�      �          0    37361    WorkScheduleProperty 
   TABLE DATA           C  COPY dt."WorkScheduleProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", "workSchedule", "uomCategory", "propertyType", category, "valueUom", "sensorType", sensor, parent) FROM stdin;
    dt          postgres    false    373   B�      �          0    37367    WorkflowSpecification 
   TABLE DATA           r   COPY dt."WorkflowSpecification" (id, code, name, description, "isDeleted", "sortOrder", "workMaster") FROM stdin;
    dt          postgres    false    374   _�      �          0    37373    WorkflowSpecificationCxn 
   TABLE DATA           �   COPY dt."WorkflowSpecificationCxn" (id, code, name, description, "isDeleted", "sortOrder", "workflowSpecificationCxnType", "fromWorkflowSpecificationNode", "toWorkflowSpecificationNode", "workflowSpecification") FROM stdin;
    dt          postgres    false    375   |�      �          0    37379     WorkflowSpecificationCxnProperty 
   TABLE DATA           [  COPY dt."WorkflowSpecificationCxnProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", parent, category, sensor, "uomCategory", "propertyType", "sensorType", "valueUom", "workflowSpecificationCxn") FROM stdin;
    dt          postgres    false    376   ��      �          0    37385    WorkflowSpecificationCxnType 
   TABLE DATA           �   COPY dt."WorkflowSpecificationCxnType" (id, code, name, description, "isDeleted", "sortOrder", "fromMultiplicity", "toMultiplicity") FROM stdin;
    dt          postgres    false    377   ��      �          0    37391 $   WorkflowSpecificationCxnTypeProperty 
   TABLE DATA           c  COPY dt."WorkflowSpecificationCxnTypeProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", "valueUom", sensor, "workflowSpecificationCxnType", "uomCategory", parent, "propertyType", "sensorType", category) FROM stdin;
    dt          postgres    false    378   ��      �          0    37397    WorkflowSpecificationNode 
   TABLE DATA           �   COPY dt."WorkflowSpecificationNode" (id, code, name, description, "isDeleted", "sortOrder", "childWorkflowSpecification", "workflowSpecificationNodeType", "workMaster", "workflowSpecification") FROM stdin;
    dt          postgres    false    379   ��      �          0    37403 !   WorkflowSpecificationNodeProperty 
   TABLE DATA           ]  COPY dt."WorkflowSpecificationNodeProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", "workflowSpecificationNode", "uomCategory", "propertyType", "sensorType", "valueUom", sensor, parent, category) FROM stdin;
    dt          postgres    false    380   �      �          0    37409    WorkflowSpecificationNodeType 
   TABLE DATA           l   COPY dt."WorkflowSpecificationNodeType" (id, code, name, description, "isDeleted", "sortOrder") FROM stdin;
    dt          postgres    false    381   *�      �          0    37415 %   WorkflowSpecificationNodeTypeProperty 
   TABLE DATA           e  COPY dt."WorkflowSpecificationNodeTypeProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", "uomCategory", "sensorType", "valueUom", "propertyType", "workflowSpecificationNodeType", sensor, category, parent) FROM stdin;
    dt          postgres    false    382   G�      �          0    37421    WorkflowSpecificationProperty 
   TABLE DATA           U  COPY dt."WorkflowSpecificationProperty" (id, name, code, description, "isDeleted", "sortOrder", value, "valueStr", "maxValue", "minValue", "defaultValue", "possibleValues", "isRequired", "isMutable", "scriptAssociation", category, "workflowSpecification", "uomCategory", parent, "propertyType", "sensorType", "valueUom", sensor) FROM stdin;
    dt          postgres    false    383   d�      �          0    37427    _EventTypeInstanceEventRoute 
   TABLE DATA           >   COPY dt."_EventTypeInstanceEventRoute" ("A", "B") FROM stdin;
    dt          postgres    false    384   ��      �          0    37430 +   _EventTypePropertyEventTypeInstanceProperty 
   TABLE DATA           M   COPY dt."_EventTypePropertyEventTypeInstanceProperty" ("A", "B") FROM stdin;
    dt          postgres    false    385   ��      �          0    37433    _OperationsDefinitionCustomer 
   TABLE DATA           ?   COPY dt."_OperationsDefinitionCustomer" ("A", "B") FROM stdin;
    dt          postgres    false    386   ��      �          0    37436 "   _OperationsDefinitionCustomerTypes 
   TABLE DATA           D   COPY dt."_OperationsDefinitionCustomerTypes" ("A", "B") FROM stdin;
    dt          postgres    false    387   ��      �          0    37439    _OperationsRequestCustomer 
   TABLE DATA           <   COPY dt."_OperationsRequestCustomer" ("A", "B") FROM stdin;
    dt          postgres    false    388   ��      �          0    37442    _OperationsRequestCustomerTypes 
   TABLE DATA           A   COPY dt."_OperationsRequestCustomerTypes" ("A", "B") FROM stdin;
    dt          postgres    false    389   �      %           2606    37502 .   CalendarPatternEntry CalendarPatternEntry_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY dt."CalendarPatternEntry"
    ADD CONSTRAINT "CalendarPatternEntry_pkey" PRIMARY KEY (id);
 X   ALTER TABLE ONLY dt."CalendarPatternEntry" DROP CONSTRAINT "CalendarPatternEntry_pkey";
       dt            postgres    false    205            #           2606    37504 $   CalendarPattern CalendarPattern_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY dt."CalendarPattern"
    ADD CONSTRAINT "CalendarPattern_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY dt."CalendarPattern" DROP CONSTRAINT "CalendarPattern_pkey";
       dt            postgres    false    204            +           2606    37506 0   CustomerClassProperty CustomerClassProperty_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY dt."CustomerClassProperty"
    ADD CONSTRAINT "CustomerClassProperty_pkey" PRIMARY KEY (id);
 Z   ALTER TABLE ONLY dt."CustomerClassProperty" DROP CONSTRAINT "CustomerClassProperty_pkey";
       dt            postgres    false    208            )           2606    37508     CustomerClass CustomerClass_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY dt."CustomerClass"
    ADD CONSTRAINT "CustomerClass_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY dt."CustomerClass" DROP CONSTRAINT "CustomerClass_pkey";
       dt            postgres    false    207            -           2606    37510 &   CustomerProperty CustomerProperty_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY dt."CustomerProperty"
    ADD CONSTRAINT "CustomerProperty_pkey" PRIMARY KEY (id);
 P   ALTER TABLE ONLY dt."CustomerProperty" DROP CONSTRAINT "CustomerProperty_pkey";
       dt            postgres    false    209            '           2606    37512    Customer Customer_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY dt."Customer"
    ADD CONSTRAINT "Customer_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY dt."Customer" DROP CONSTRAINT "Customer_pkey";
       dt            postgres    false    206            3           2606    37514 4   EquipmentActualProperty EquipmentActualProperty_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY dt."EquipmentActualProperty"
    ADD CONSTRAINT "EquipmentActualProperty_pkey" PRIMARY KEY (id);
 ^   ALTER TABLE ONLY dt."EquipmentActualProperty" DROP CONSTRAINT "EquipmentActualProperty_pkey";
       dt            postgres    false    212            1           2606    37516 $   EquipmentActual EquipmentActual_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY dt."EquipmentActual"
    ADD CONSTRAINT "EquipmentActual_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY dt."EquipmentActual" DROP CONSTRAINT "EquipmentActual_pkey";
       dt            postgres    false    211            5           2606    37518 0   EquipmentAssetMapping EquipmentAssetMapping_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY dt."EquipmentAssetMapping"
    ADD CONSTRAINT "EquipmentAssetMapping_pkey" PRIMARY KEY (id);
 Z   ALTER TABLE ONLY dt."EquipmentAssetMapping" DROP CONSTRAINT "EquipmentAssetMapping_pkey";
       dt            postgres    false    213            9           2606    37520 <   EquipmentCapabilityProperty EquipmentCapabilityProperty_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY dt."EquipmentCapabilityProperty"
    ADD CONSTRAINT "EquipmentCapabilityProperty_pkey" PRIMARY KEY (id);
 f   ALTER TABLE ONLY dt."EquipmentCapabilityProperty" DROP CONSTRAINT "EquipmentCapabilityProperty_pkey";
       dt            postgres    false    215            7           2606    37522 ,   EquipmentCapability EquipmentCapability_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY dt."EquipmentCapability"
    ADD CONSTRAINT "EquipmentCapability_pkey" PRIMARY KEY (id);
 V   ALTER TABLE ONLY dt."EquipmentCapability" DROP CONSTRAINT "EquipmentCapability_pkey";
       dt            postgres    false    214            ?           2606    37524 2   EquipmentClassProperty EquipmentClassProperty_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY dt."EquipmentClassProperty"
    ADD CONSTRAINT "EquipmentClassProperty_pkey" PRIMARY KEY (id);
 \   ALTER TABLE ONLY dt."EquipmentClassProperty" DROP CONSTRAINT "EquipmentClassProperty_pkey";
       dt            postgres    false    218            ;           2606    37526 "   EquipmentClass EquipmentClass_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY dt."EquipmentClass"
    ADD CONSTRAINT "EquipmentClass_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY dt."EquipmentClass" DROP CONSTRAINT "EquipmentClass_pkey";
       dt            postgres    false    216            A           2606    37528 (   EquipmentProperty EquipmentProperty_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY dt."EquipmentProperty"
    ADD CONSTRAINT "EquipmentProperty_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY dt."EquipmentProperty" DROP CONSTRAINT "EquipmentProperty_pkey";
       dt            postgres    false    219            E           2606    37530 >   EquipmentRequirementProperty EquipmentRequirementProperty_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY dt."EquipmentRequirementProperty"
    ADD CONSTRAINT "EquipmentRequirementProperty_pkey" PRIMARY KEY (id);
 h   ALTER TABLE ONLY dt."EquipmentRequirementProperty" DROP CONSTRAINT "EquipmentRequirementProperty_pkey";
       dt            postgres    false    221            C           2606    37532 .   EquipmentRequirement EquipmentRequirement_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY dt."EquipmentRequirement"
    ADD CONSTRAINT "EquipmentRequirement_pkey" PRIMARY KEY (id);
 X   ALTER TABLE ONLY dt."EquipmentRequirement" DROP CONSTRAINT "EquipmentRequirement_pkey";
       dt            postgres    false    220            I           2606    37534 P   EquipmentSegmentSpecificationProperty EquipmentSegmentSpecificationProperty_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentSegmentSpecificationProperty"
    ADD CONSTRAINT "EquipmentSegmentSpecificationProperty_pkey" PRIMARY KEY (id);
 z   ALTER TABLE ONLY dt."EquipmentSegmentSpecificationProperty" DROP CONSTRAINT "EquipmentSegmentSpecificationProperty_pkey";
       dt            postgres    false    223            K           2606    37536 Z   EquipmentSegmentSpecificationStreamMapping EquipmentSegmentSpecificationStreamMapping_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentSegmentSpecificationStreamMapping"
    ADD CONSTRAINT "EquipmentSegmentSpecificationStreamMapping_pkey" PRIMARY KEY (id);
 �   ALTER TABLE ONLY dt."EquipmentSegmentSpecificationStreamMapping" DROP CONSTRAINT "EquipmentSegmentSpecificationStreamMapping_pkey";
       dt            postgres    false    224            G           2606    37538 @   EquipmentSegmentSpecification EquipmentSegmentSpecification_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY dt."EquipmentSegmentSpecification"
    ADD CONSTRAINT "EquipmentSegmentSpecification_pkey" PRIMARY KEY (id);
 j   ALTER TABLE ONLY dt."EquipmentSegmentSpecification" DROP CONSTRAINT "EquipmentSegmentSpecification_pkey";
       dt            postgres    false    222            O           2606    37540 B   EquipmentSpecificationProperty EquipmentSpecificationProperty_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentSpecificationProperty"
    ADD CONSTRAINT "EquipmentSpecificationProperty_pkey" PRIMARY KEY (id);
 l   ALTER TABLE ONLY dt."EquipmentSpecificationProperty" DROP CONSTRAINT "EquipmentSpecificationProperty_pkey";
       dt            postgres    false    226            M           2606    37542 2   EquipmentSpecification EquipmentSpecification_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY dt."EquipmentSpecification"
    ADD CONSTRAINT "EquipmentSpecification_pkey" PRIMARY KEY (id);
 \   ALTER TABLE ONLY dt."EquipmentSpecification" DROP CONSTRAINT "EquipmentSpecification_pkey";
       dt            postgres    false    225            /           2606    37544    Equipment Equipment_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY dt."Equipment"
    ADD CONSTRAINT "Equipment_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY dt."Equipment" DROP CONSTRAINT "Equipment_pkey";
       dt            postgres    false    210            Q           2606    37546    EventContext EventContext_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY dt."EventContext"
    ADD CONSTRAINT "EventContext_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY dt."EventContext" DROP CONSTRAINT "EventContext_pkey";
       dt            postgres    false    227            S           2606    37548    EventRoute EventRoute_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY dt."EventRoute"
    ADD CONSTRAINT "EventRoute_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY dt."EventRoute" DROP CONSTRAINT "EventRoute_pkey";
       dt            postgres    false    228            [           2606    37550 8   EventTypeInstanceProperty EventTypeInstanceProperty_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY dt."EventTypeInstanceProperty"
    ADD CONSTRAINT "EventTypeInstanceProperty_pkey" PRIMARY KEY (id);
 b   ALTER TABLE ONLY dt."EventTypeInstanceProperty" DROP CONSTRAINT "EventTypeInstanceProperty_pkey";
       dt            postgres    false    231            X           2606    37552 (   EventTypeInstance EventTypeInstance_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY dt."EventTypeInstance"
    ADD CONSTRAINT "EventTypeInstance_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY dt."EventTypeInstance" DROP CONSTRAINT "EventTypeInstance_pkey";
       dt            postgres    false    230            ]           2606    37554 (   EventTypeProperty EventTypeProperty_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY dt."EventTypeProperty"
    ADD CONSTRAINT "EventTypeProperty_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY dt."EventTypeProperty" DROP CONSTRAINT "EventTypeProperty_pkey";
       dt            postgres    false    232            U           2606    37556    EventType EventType_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY dt."EventType"
    ADD CONSTRAINT "EventType_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY dt."EventType" DROP CONSTRAINT "EventType_pkey";
       dt            postgres    false    229            _           2606    37558    FlowMeta FlowMeta_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY dt."FlowMeta"
    ADD CONSTRAINT "FlowMeta_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY dt."FlowMeta" DROP CONSTRAINT "FlowMeta_pkey";
       dt            postgres    false    233            a           2606    37560    FlowType FlowType_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY dt."FlowType"
    ADD CONSTRAINT "FlowType_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY dt."FlowType" DROP CONSTRAINT "FlowType_pkey";
       dt            postgres    false    234            f           2606    37562 @   FromResourceReferenceProperty FromResourceReferenceProperty_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY dt."FromResourceReferenceProperty"
    ADD CONSTRAINT "FromResourceReferenceProperty_pkey" PRIMARY KEY (id);
 j   ALTER TABLE ONLY dt."FromResourceReferenceProperty" DROP CONSTRAINT "FromResourceReferenceProperty_pkey";
       dt            postgres    false    236            d           2606    37564 0   FromResourceReference FromResourceReference_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY dt."FromResourceReference"
    ADD CONSTRAINT "FromResourceReference_pkey" PRIMARY KEY (id);
 Z   ALTER TABLE ONLY dt."FromResourceReference" DROP CONSTRAINT "FromResourceReference_pkey";
       dt            postgres    false    235            j           2606    37566 $   JobListProperty JobListProperty_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY dt."JobListProperty"
    ADD CONSTRAINT "JobListProperty_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY dt."JobListProperty" DROP CONSTRAINT "JobListProperty_pkey";
       dt            postgres    false    238            h           2606    37568    JobList JobList_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY dt."JobList"
    ADD CONSTRAINT "JobList_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY dt."JobList" DROP CONSTRAINT "JobList_pkey";
       dt            postgres    false    237            n           2606    37570 (   JobOrderParameter JobOrderParameter_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY dt."JobOrderParameter"
    ADD CONSTRAINT "JobOrderParameter_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY dt."JobOrderParameter" DROP CONSTRAINT "JobOrderParameter_pkey";
       dt            postgres    false    240            l           2606    37572    JobOrder JobOrder_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY dt."JobOrder"
    ADD CONSTRAINT "JobOrder_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY dt."JobOrder" DROP CONSTRAINT "JobOrder_pkey";
       dt            postgres    false    239            r           2606    37574 $   JobResponseData JobResponseData_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY dt."JobResponseData"
    ADD CONSTRAINT "JobResponseData_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY dt."JobResponseData" DROP CONSTRAINT "JobResponseData_pkey";
       dt            postgres    false    242            p           2606    37576    JobResponse JobResponse_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY dt."JobResponse"
    ADD CONSTRAINT "JobResponse_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY dt."JobResponse" DROP CONSTRAINT "JobResponse_pkey";
       dt            postgres    false    241            v           2606    37578 "   LookupCategory LookupCategory_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY dt."LookupCategory"
    ADD CONSTRAINT "LookupCategory_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY dt."LookupCategory" DROP CONSTRAINT "LookupCategory_pkey";
       dt            postgres    false    244            t           2606    37580    Lookup Lookup_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY dt."Lookup"
    ADD CONSTRAINT "Lookup_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY dt."Lookup" DROP CONSTRAINT "Lookup_pkey";
       dt            postgres    false    243            z           2606    37582 2   MaterialActualProperty MaterialActualProperty_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY dt."MaterialActualProperty"
    ADD CONSTRAINT "MaterialActualProperty_pkey" PRIMARY KEY (id);
 \   ALTER TABLE ONLY dt."MaterialActualProperty" DROP CONSTRAINT "MaterialActualProperty_pkey";
       dt            postgres    false    246            x           2606    37584 "   MaterialActual MaterialActual_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY dt."MaterialActual"
    ADD CONSTRAINT "MaterialActual_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY dt."MaterialActual" DROP CONSTRAINT "MaterialActual_pkey";
       dt            postgres    false    245            |           2606    37586 :   MaterialAssemblyDefinition MaterialAssemblyDefinition_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY dt."MaterialAssemblyDefinition"
    ADD CONSTRAINT "MaterialAssemblyDefinition_pkey" PRIMARY KEY (id);
 d   ALTER TABLE ONLY dt."MaterialAssemblyDefinition" DROP CONSTRAINT "MaterialAssemblyDefinition_pkey";
       dt            postgres    false    247            �           2606    37588 :   MaterialCapabilityProperty MaterialCapabilityProperty_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY dt."MaterialCapabilityProperty"
    ADD CONSTRAINT "MaterialCapabilityProperty_pkey" PRIMARY KEY (id);
 d   ALTER TABLE ONLY dt."MaterialCapabilityProperty" DROP CONSTRAINT "MaterialCapabilityProperty_pkey";
       dt            postgres    false    249            ~           2606    37590 *   MaterialCapability MaterialCapability_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY dt."MaterialCapability"
    ADD CONSTRAINT "MaterialCapability_pkey" PRIMARY KEY (id);
 T   ALTER TABLE ONLY dt."MaterialCapability" DROP CONSTRAINT "MaterialCapability_pkey";
       dt            postgres    false    248            �           2606    37592 0   MaterialClassProperty MaterialClassProperty_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY dt."MaterialClassProperty"
    ADD CONSTRAINT "MaterialClassProperty_pkey" PRIMARY KEY (id);
 Z   ALTER TABLE ONLY dt."MaterialClassProperty" DROP CONSTRAINT "MaterialClassProperty_pkey";
       dt            postgres    false    252            �           2606    37594     MaterialClass MaterialClass_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY dt."MaterialClass"
    ADD CONSTRAINT "MaterialClass_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY dt."MaterialClass" DROP CONSTRAINT "MaterialClass_pkey";
       dt            postgres    false    250            �           2606    37596 :   MaterialDefinitionProperty MaterialDefinitionProperty_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY dt."MaterialDefinitionProperty"
    ADD CONSTRAINT "MaterialDefinitionProperty_pkey" PRIMARY KEY (id);
 d   ALTER TABLE ONLY dt."MaterialDefinitionProperty" DROP CONSTRAINT "MaterialDefinitionProperty_pkey";
       dt            postgres    false    254            �           2606    37598 *   MaterialDefinition MaterialDefinition_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY dt."MaterialDefinition"
    ADD CONSTRAINT "MaterialDefinition_pkey" PRIMARY KEY (id);
 T   ALTER TABLE ONLY dt."MaterialDefinition" DROP CONSTRAINT "MaterialDefinition_pkey";
       dt            postgres    false    253            �           2606    37600 ,   MaterialLotProperty MaterialLotProperty_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY dt."MaterialLotProperty"
    ADD CONSTRAINT "MaterialLotProperty_pkey" PRIMARY KEY (id);
 V   ALTER TABLE ONLY dt."MaterialLotProperty" DROP CONSTRAINT "MaterialLotProperty_pkey";
       dt            postgres    false    256            �           2606    37602    MaterialLot MaterialLot_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY dt."MaterialLot"
    ADD CONSTRAINT "MaterialLot_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY dt."MaterialLot" DROP CONSTRAINT "MaterialLot_pkey";
       dt            postgres    false    255            �           2606    37604 <   MaterialRequirementBillItem MaterialRequirementBillItem_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY dt."MaterialRequirementBillItem"
    ADD CONSTRAINT "MaterialRequirementBillItem_pkey" PRIMARY KEY (id);
 f   ALTER TABLE ONLY dt."MaterialRequirementBillItem" DROP CONSTRAINT "MaterialRequirementBillItem_pkey";
       dt            postgres    false    259            �           2606    37606 4   MaterialRequirementBill MaterialRequirementBill_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY dt."MaterialRequirementBill"
    ADD CONSTRAINT "MaterialRequirementBill_pkey" PRIMARY KEY (id);
 ^   ALTER TABLE ONLY dt."MaterialRequirementBill" DROP CONSTRAINT "MaterialRequirementBill_pkey";
       dt            postgres    false    258            �           2606    37608 <   MaterialRequirementProperty MaterialRequirementProperty_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY dt."MaterialRequirementProperty"
    ADD CONSTRAINT "MaterialRequirementProperty_pkey" PRIMARY KEY (id);
 f   ALTER TABLE ONLY dt."MaterialRequirementProperty" DROP CONSTRAINT "MaterialRequirementProperty_pkey";
       dt            postgres    false    260            �           2606    37610 ,   MaterialRequirement MaterialRequirement_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY dt."MaterialRequirement"
    ADD CONSTRAINT "MaterialRequirement_pkey" PRIMARY KEY (id);
 V   ALTER TABLE ONLY dt."MaterialRequirement" DROP CONSTRAINT "MaterialRequirement_pkey";
       dt            postgres    false    257            �           2606    37612 N   MaterialSegmentSpecificationProperty MaterialSegmentSpecificationProperty_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSegmentSpecificationProperty"
    ADD CONSTRAINT "MaterialSegmentSpecificationProperty_pkey" PRIMARY KEY (id);
 x   ALTER TABLE ONLY dt."MaterialSegmentSpecificationProperty" DROP CONSTRAINT "MaterialSegmentSpecificationProperty_pkey";
       dt            postgres    false    262            �           2606    37614 >   MaterialSegmentSpecification MaterialSegmentSpecification_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY dt."MaterialSegmentSpecification"
    ADD CONSTRAINT "MaterialSegmentSpecification_pkey" PRIMARY KEY (id);
 h   ALTER TABLE ONLY dt."MaterialSegmentSpecification" DROP CONSTRAINT "MaterialSegmentSpecification_pkey";
       dt            postgres    false    261            �           2606    37616 @   MaterialSpecificationProperty MaterialSpecificationProperty_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY dt."MaterialSpecificationProperty"
    ADD CONSTRAINT "MaterialSpecificationProperty_pkey" PRIMARY KEY (id);
 j   ALTER TABLE ONLY dt."MaterialSpecificationProperty" DROP CONSTRAINT "MaterialSpecificationProperty_pkey";
       dt            postgres    false    264            �           2606    37618 0   MaterialSpecification MaterialSpecification_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY dt."MaterialSpecification"
    ADD CONSTRAINT "MaterialSpecification_pkey" PRIMARY KEY (id);
 Z   ALTER TABLE ONLY dt."MaterialSpecification" DROP CONSTRAINT "MaterialSpecification_pkey";
       dt            postgres    false    263            �           2606    37620 "   MaterialSubLot MaterialSubLot_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY dt."MaterialSubLot"
    ADD CONSTRAINT "MaterialSubLot_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY dt."MaterialSubLot" DROP CONSTRAINT "MaterialSubLot_pkey";
       dt            postgres    false    265            �           2606    37622     MigrationMeta MigrationMeta_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY dt."MigrationMeta"
    ADD CONSTRAINT "MigrationMeta_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY dt."MigrationMeta" DROP CONSTRAINT "MigrationMeta_pkey";
       dt            postgres    false    266            �           2606    37624 B   ObjectwisePatternConfiguration ObjectwisePatternConfiguration_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY dt."ObjectwisePatternConfiguration"
    ADD CONSTRAINT "ObjectwisePatternConfiguration_pkey" PRIMARY KEY (id);
 l   ALTER TABLE ONLY dt."ObjectwisePatternConfiguration" DROP CONSTRAINT "ObjectwisePatternConfiguration_pkey";
       dt            postgres    false    267            �           2606    37626 >   OperationsCapabilityProperty OperationsCapabilityProperty_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY dt."OperationsCapabilityProperty"
    ADD CONSTRAINT "OperationsCapabilityProperty_pkey" PRIMARY KEY (id);
 h   ALTER TABLE ONLY dt."OperationsCapabilityProperty" DROP CONSTRAINT "OperationsCapabilityProperty_pkey";
       dt            postgres    false    269            �           2606    37628 .   OperationsCapability OperationsCapability_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY dt."OperationsCapability"
    ADD CONSTRAINT "OperationsCapability_pkey" PRIMARY KEY (id);
 X   ALTER TABLE ONLY dt."OperationsCapability" DROP CONSTRAINT "OperationsCapability_pkey";
       dt            postgres    false    268            �           2606    37630 >   OperationsDefinitionProperty OperationsDefinitionProperty_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY dt."OperationsDefinitionProperty"
    ADD CONSTRAINT "OperationsDefinitionProperty_pkey" PRIMARY KEY (id);
 h   ALTER TABLE ONLY dt."OperationsDefinitionProperty" DROP CONSTRAINT "OperationsDefinitionProperty_pkey";
       dt            postgres    false    271            �           2606    37632 .   OperationsDefinition OperationsDefinition_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY dt."OperationsDefinition"
    ADD CONSTRAINT "OperationsDefinition_pkey" PRIMARY KEY (id);
 X   ALTER TABLE ONLY dt."OperationsDefinition" DROP CONSTRAINT "OperationsDefinition_pkey";
       dt            postgres    false    270            �           2606    37634 :   OperationsMaterialBillItem OperationsMaterialBillItem_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY dt."OperationsMaterialBillItem"
    ADD CONSTRAINT "OperationsMaterialBillItem_pkey" PRIMARY KEY (id);
 d   ALTER TABLE ONLY dt."OperationsMaterialBillItem" DROP CONSTRAINT "OperationsMaterialBillItem_pkey";
       dt            postgres    false    273            �           2606    37636 2   OperationsMaterialBill OperationsMaterialBill_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY dt."OperationsMaterialBill"
    ADD CONSTRAINT "OperationsMaterialBill_pkey" PRIMARY KEY (id);
 \   ALTER TABLE ONLY dt."OperationsMaterialBill" DROP CONSTRAINT "OperationsMaterialBill_pkey";
       dt            postgres    false    272            �           2606    37638 @   OperationsPerformanceProperty OperationsPerformanceProperty_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY dt."OperationsPerformanceProperty"
    ADD CONSTRAINT "OperationsPerformanceProperty_pkey" PRIMARY KEY (id);
 j   ALTER TABLE ONLY dt."OperationsPerformanceProperty" DROP CONSTRAINT "OperationsPerformanceProperty_pkey";
       dt            postgres    false    275            �           2606    37640 0   OperationsPerformance OperationsPerformance_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY dt."OperationsPerformance"
    ADD CONSTRAINT "OperationsPerformance_pkey" PRIMARY KEY (id);
 Z   ALTER TABLE ONLY dt."OperationsPerformance" DROP CONSTRAINT "OperationsPerformance_pkey";
       dt            postgres    false    274            �           2606    37642 8   OperationsRequestProperty OperationsRequestProperty_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY dt."OperationsRequestProperty"
    ADD CONSTRAINT "OperationsRequestProperty_pkey" PRIMARY KEY (id);
 b   ALTER TABLE ONLY dt."OperationsRequestProperty" DROP CONSTRAINT "OperationsRequestProperty_pkey";
       dt            postgres    false    277            �           2606    37644 (   OperationsRequest OperationsRequest_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY dt."OperationsRequest"
    ADD CONSTRAINT "OperationsRequest_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY dt."OperationsRequest" DROP CONSTRAINT "OperationsRequest_pkey";
       dt            postgres    false    276            �           2606    37646 :   OperationsResponseProperty OperationsResponseProperty_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY dt."OperationsResponseProperty"
    ADD CONSTRAINT "OperationsResponseProperty_pkey" PRIMARY KEY (id);
 d   ALTER TABLE ONLY dt."OperationsResponseProperty" DROP CONSTRAINT "OperationsResponseProperty_pkey";
       dt            postgres    false    279            �           2606    37648 *   OperationsResponse OperationsResponse_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY dt."OperationsResponse"
    ADD CONSTRAINT "OperationsResponse_pkey" PRIMARY KEY (id);
 T   ALTER TABLE ONLY dt."OperationsResponse" DROP CONSTRAINT "OperationsResponse_pkey";
       dt            postgres    false    278            �           2606    37650 :   OperationsScheduleProperty OperationsScheduleProperty_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY dt."OperationsScheduleProperty"
    ADD CONSTRAINT "OperationsScheduleProperty_pkey" PRIMARY KEY (id);
 d   ALTER TABLE ONLY dt."OperationsScheduleProperty" DROP CONSTRAINT "OperationsScheduleProperty_pkey";
       dt            postgres    false    281            �           2606    37652 *   OperationsSchedule OperationsSchedule_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY dt."OperationsSchedule"
    ADD CONSTRAINT "OperationsSchedule_pkey" PRIMARY KEY (id);
 T   ALTER TABLE ONLY dt."OperationsSchedule" DROP CONSTRAINT "OperationsSchedule_pkey";
       dt            postgres    false    280            �           2606    37654 <   OperationsSegmentDependency OperationsSegmentDependency_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY dt."OperationsSegmentDependency"
    ADD CONSTRAINT "OperationsSegmentDependency_pkey" PRIMARY KEY (id);
 f   ALTER TABLE ONLY dt."OperationsSegmentDependency" DROP CONSTRAINT "OperationsSegmentDependency_pkey";
       dt            postgres    false    283            �           2606    37656 T   OperationsSegmentParameterSpecification OperationsSegmentParameterSpecification_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsSegmentParameterSpecification"
    ADD CONSTRAINT "OperationsSegmentParameterSpecification_pkey" PRIMARY KEY (id);
 ~   ALTER TABLE ONLY dt."OperationsSegmentParameterSpecification" DROP CONSTRAINT "OperationsSegmentParameterSpecification_pkey";
       dt            postgres    false    284            �           2606    37658 (   OperationsSegment OperationsSegment_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY dt."OperationsSegment"
    ADD CONSTRAINT "OperationsSegment_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY dt."OperationsSegment" DROP CONSTRAINT "OperationsSegment_pkey";
       dt            postgres    false    282            �           2606    37660 "   PersonProperty PersonProperty_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY dt."PersonProperty"
    ADD CONSTRAINT "PersonProperty_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY dt."PersonProperty" DROP CONSTRAINT "PersonProperty_pkey";
       dt            postgres    false    286            �           2606    37662    Person Person_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY dt."Person"
    ADD CONSTRAINT "Person_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY dt."Person" DROP CONSTRAINT "Person_pkey";
       dt            postgres    false    285            �           2606    37664 4   PersonnelActualProperty PersonnelActualProperty_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY dt."PersonnelActualProperty"
    ADD CONSTRAINT "PersonnelActualProperty_pkey" PRIMARY KEY (id);
 ^   ALTER TABLE ONLY dt."PersonnelActualProperty" DROP CONSTRAINT "PersonnelActualProperty_pkey";
       dt            postgres    false    288            �           2606    37666 $   PersonnelActual PersonnelActual_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY dt."PersonnelActual"
    ADD CONSTRAINT "PersonnelActual_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY dt."PersonnelActual" DROP CONSTRAINT "PersonnelActual_pkey";
       dt            postgres    false    287            �           2606    37668 <   PersonnelCapabilityProperty PersonnelCapabilityProperty_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY dt."PersonnelCapabilityProperty"
    ADD CONSTRAINT "PersonnelCapabilityProperty_pkey" PRIMARY KEY (id);
 f   ALTER TABLE ONLY dt."PersonnelCapabilityProperty" DROP CONSTRAINT "PersonnelCapabilityProperty_pkey";
       dt            postgres    false    290            �           2606    37670 ,   PersonnelCapability PersonnelCapability_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY dt."PersonnelCapability"
    ADD CONSTRAINT "PersonnelCapability_pkey" PRIMARY KEY (id);
 V   ALTER TABLE ONLY dt."PersonnelCapability" DROP CONSTRAINT "PersonnelCapability_pkey";
       dt            postgres    false    289            �           2606    37672 2   PersonnelClassProperty PersonnelClassProperty_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY dt."PersonnelClassProperty"
    ADD CONSTRAINT "PersonnelClassProperty_pkey" PRIMARY KEY (id);
 \   ALTER TABLE ONLY dt."PersonnelClassProperty" DROP CONSTRAINT "PersonnelClassProperty_pkey";
       dt            postgres    false    293            �           2606    37674 "   PersonnelClass PersonnelClass_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY dt."PersonnelClass"
    ADD CONSTRAINT "PersonnelClass_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY dt."PersonnelClass" DROP CONSTRAINT "PersonnelClass_pkey";
       dt            postgres    false    291            �           2606    37676 >   PersonnelRequirementProperty PersonnelRequirementProperty_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY dt."PersonnelRequirementProperty"
    ADD CONSTRAINT "PersonnelRequirementProperty_pkey" PRIMARY KEY (id);
 h   ALTER TABLE ONLY dt."PersonnelRequirementProperty" DROP CONSTRAINT "PersonnelRequirementProperty_pkey";
       dt            postgres    false    295            �           2606    37678 .   PersonnelRequirement PersonnelRequirement_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY dt."PersonnelRequirement"
    ADD CONSTRAINT "PersonnelRequirement_pkey" PRIMARY KEY (id);
 X   ALTER TABLE ONLY dt."PersonnelRequirement" DROP CONSTRAINT "PersonnelRequirement_pkey";
       dt            postgres    false    294            �           2606    37680 P   PersonnelSegmentSpecificationProperty PersonnelSegmentSpecificationProperty_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelSegmentSpecificationProperty"
    ADD CONSTRAINT "PersonnelSegmentSpecificationProperty_pkey" PRIMARY KEY (id);
 z   ALTER TABLE ONLY dt."PersonnelSegmentSpecificationProperty" DROP CONSTRAINT "PersonnelSegmentSpecificationProperty_pkey";
       dt            postgres    false    297            �           2606    37682 @   PersonnelSegmentSpecification PersonnelSegmentSpecification_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY dt."PersonnelSegmentSpecification"
    ADD CONSTRAINT "PersonnelSegmentSpecification_pkey" PRIMARY KEY (id);
 j   ALTER TABLE ONLY dt."PersonnelSegmentSpecification" DROP CONSTRAINT "PersonnelSegmentSpecification_pkey";
       dt            postgres    false    296            �           2606    37684 B   PersonnelSpecificationProperty PersonnelSpecificationProperty_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelSpecificationProperty"
    ADD CONSTRAINT "PersonnelSpecificationProperty_pkey" PRIMARY KEY (id);
 l   ALTER TABLE ONLY dt."PersonnelSpecificationProperty" DROP CONSTRAINT "PersonnelSpecificationProperty_pkey";
       dt            postgres    false    299            �           2606    37686 2   PersonnelSpecification PersonnelSpecification_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY dt."PersonnelSpecification"
    ADD CONSTRAINT "PersonnelSpecification_pkey" PRIMARY KEY (id);
 \   ALTER TABLE ONLY dt."PersonnelSpecification" DROP CONSTRAINT "PersonnelSpecification_pkey";
       dt            postgres    false    298            �           2606    37688 <   PhysicalAssetActualProperty PhysicalAssetActualProperty_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY dt."PhysicalAssetActualProperty"
    ADD CONSTRAINT "PhysicalAssetActualProperty_pkey" PRIMARY KEY (id);
 f   ALTER TABLE ONLY dt."PhysicalAssetActualProperty" DROP CONSTRAINT "PhysicalAssetActualProperty_pkey";
       dt            postgres    false    302            �           2606    37690 ,   PhysicalAssetActual PhysicalAssetActual_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY dt."PhysicalAssetActual"
    ADD CONSTRAINT "PhysicalAssetActual_pkey" PRIMARY KEY (id);
 V   ALTER TABLE ONLY dt."PhysicalAssetActual" DROP CONSTRAINT "PhysicalAssetActual_pkey";
       dt            postgres    false    301            �           2606    37692 D   PhysicalAssetCapabilityProperty PhysicalAssetCapabilityProperty_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetCapabilityProperty"
    ADD CONSTRAINT "PhysicalAssetCapabilityProperty_pkey" PRIMARY KEY (id);
 n   ALTER TABLE ONLY dt."PhysicalAssetCapabilityProperty" DROP CONSTRAINT "PhysicalAssetCapabilityProperty_pkey";
       dt            postgres    false    304            �           2606    37694 4   PhysicalAssetCapability PhysicalAssetCapability_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY dt."PhysicalAssetCapability"
    ADD CONSTRAINT "PhysicalAssetCapability_pkey" PRIMARY KEY (id);
 ^   ALTER TABLE ONLY dt."PhysicalAssetCapability" DROP CONSTRAINT "PhysicalAssetCapability_pkey";
       dt            postgres    false    303            �           2606    37696 :   PhysicalAssetClassProperty PhysicalAssetClassProperty_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY dt."PhysicalAssetClassProperty"
    ADD CONSTRAINT "PhysicalAssetClassProperty_pkey" PRIMARY KEY (id);
 d   ALTER TABLE ONLY dt."PhysicalAssetClassProperty" DROP CONSTRAINT "PhysicalAssetClassProperty_pkey";
       dt            postgres    false    307            �           2606    37698 *   PhysicalAssetClass PhysicalAssetClass_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY dt."PhysicalAssetClass"
    ADD CONSTRAINT "PhysicalAssetClass_pkey" PRIMARY KEY (id);
 T   ALTER TABLE ONLY dt."PhysicalAssetClass" DROP CONSTRAINT "PhysicalAssetClass_pkey";
       dt            postgres    false    305            �           2606    37700 0   PhysicalAssetProperty PhysicalAssetProperty_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY dt."PhysicalAssetProperty"
    ADD CONSTRAINT "PhysicalAssetProperty_pkey" PRIMARY KEY (id);
 Z   ALTER TABLE ONLY dt."PhysicalAssetProperty" DROP CONSTRAINT "PhysicalAssetProperty_pkey";
       dt            postgres    false    308            �           2606    37702 F   PhysicalAssetRequirementProperty PhysicalAssetRequirementProperty_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetRequirementProperty"
    ADD CONSTRAINT "PhysicalAssetRequirementProperty_pkey" PRIMARY KEY (id);
 p   ALTER TABLE ONLY dt."PhysicalAssetRequirementProperty" DROP CONSTRAINT "PhysicalAssetRequirementProperty_pkey";
       dt            postgres    false    310            �           2606    37704 6   PhysicalAssetRequirement PhysicalAssetRequirement_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY dt."PhysicalAssetRequirement"
    ADD CONSTRAINT "PhysicalAssetRequirement_pkey" PRIMARY KEY (id);
 `   ALTER TABLE ONLY dt."PhysicalAssetRequirement" DROP CONSTRAINT "PhysicalAssetRequirement_pkey";
       dt            postgres    false    309            �           2606    37706 X   PhysicalAssetSegmentSpecificationProperty PhysicalAssetSegmentSpecificationProperty_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetSegmentSpecificationProperty"
    ADD CONSTRAINT "PhysicalAssetSegmentSpecificationProperty_pkey" PRIMARY KEY (id);
 �   ALTER TABLE ONLY dt."PhysicalAssetSegmentSpecificationProperty" DROP CONSTRAINT "PhysicalAssetSegmentSpecificationProperty_pkey";
       dt            postgres    false    312            �           2606    37708 H   PhysicalAssetSegmentSpecification PhysicalAssetSegmentSpecification_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetSegmentSpecification"
    ADD CONSTRAINT "PhysicalAssetSegmentSpecification_pkey" PRIMARY KEY (id);
 r   ALTER TABLE ONLY dt."PhysicalAssetSegmentSpecification" DROP CONSTRAINT "PhysicalAssetSegmentSpecification_pkey";
       dt            postgres    false    311                       2606    37710 J   PhysicalAssetSpecificationProperty PhysicalAssetSpecificationProperty_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetSpecificationProperty"
    ADD CONSTRAINT "PhysicalAssetSpecificationProperty_pkey" PRIMARY KEY (id);
 t   ALTER TABLE ONLY dt."PhysicalAssetSpecificationProperty" DROP CONSTRAINT "PhysicalAssetSpecificationProperty_pkey";
       dt            postgres    false    314                        2606    37712 :   PhysicalAssetSpecification PhysicalAssetSpecification_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY dt."PhysicalAssetSpecification"
    ADD CONSTRAINT "PhysicalAssetSpecification_pkey" PRIMARY KEY (id);
 d   ALTER TABLE ONLY dt."PhysicalAssetSpecification" DROP CONSTRAINT "PhysicalAssetSpecification_pkey";
       dt            postgres    false    313            �           2606    37714     PhysicalAsset PhysicalAsset_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY dt."PhysicalAsset"
    ADD CONSTRAINT "PhysicalAsset_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY dt."PhysicalAsset" DROP CONSTRAINT "PhysicalAsset_pkey";
       dt            postgres    false    300                       2606    37716 6   ProcessSegmentCapability ProcessSegmentCapability_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY dt."ProcessSegmentCapability"
    ADD CONSTRAINT "ProcessSegmentCapability_pkey" PRIMARY KEY (id);
 `   ALTER TABLE ONLY dt."ProcessSegmentCapability" DROP CONSTRAINT "ProcessSegmentCapability_pkey";
       dt            postgres    false    316                       2606    37718 6   ProcessSegmentDependency ProcessSegmentDependency_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY dt."ProcessSegmentDependency"
    ADD CONSTRAINT "ProcessSegmentDependency_pkey" PRIMARY KEY (id);
 `   ALTER TABLE ONLY dt."ProcessSegmentDependency" DROP CONSTRAINT "ProcessSegmentDependency_pkey";
       dt            postgres    false    317            
           2606    37720 4   ProcessSegmentParameter ProcessSegmentParameter_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY dt."ProcessSegmentParameter"
    ADD CONSTRAINT "ProcessSegmentParameter_pkey" PRIMARY KEY (id);
 ^   ALTER TABLE ONLY dt."ProcessSegmentParameter" DROP CONSTRAINT "ProcessSegmentParameter_pkey";
       dt            postgres    false    318                       2606    37722 "   ProcessSegment ProcessSegment_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY dt."ProcessSegment"
    ADD CONSTRAINT "ProcessSegment_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY dt."ProcessSegment" DROP CONSTRAINT "ProcessSegment_pkey";
       dt            postgres    false    315                       2606    37724 "   ProductionPlan ProductionPlan_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY dt."ProductionPlan"
    ADD CONSTRAINT "ProductionPlan_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY dt."ProductionPlan" DROP CONSTRAINT "ProductionPlan_pkey";
       dt            postgres    false    319                       2606    37726    PropertyType PropertyType_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY dt."PropertyType"
    ADD CONSTRAINT "PropertyType_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY dt."PropertyType" DROP CONSTRAINT "PropertyType_pkey";
       dt            postgres    false    320                       2606    37728 "   ReasonCategory ReasonCategory_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY dt."ReasonCategory"
    ADD CONSTRAINT "ReasonCategory_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY dt."ReasonCategory" DROP CONSTRAINT "ReasonCategory_pkey";
       dt            postgres    false    322                       2606    37730 (   ReasonSubCategory ReasonSubCategory_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY dt."ReasonSubCategory"
    ADD CONSTRAINT "ReasonSubCategory_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY dt."ReasonSubCategory" DROP CONSTRAINT "ReasonSubCategory_pkey";
       dt            postgres    false    324                       2606    37732 &   ReasonTreeConfig ReasonTreeConfig_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY dt."ReasonTreeConfig"
    ADD CONSTRAINT "ReasonTreeConfig_pkey" PRIMARY KEY (id);
 P   ALTER TABLE ONLY dt."ReasonTreeConfig" DROP CONSTRAINT "ReasonTreeConfig_pkey";
       dt            postgres    false    326                       2606    37734    ReasonTree ReasonTree_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY dt."ReasonTree"
    ADD CONSTRAINT "ReasonTree_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY dt."ReasonTree" DROP CONSTRAINT "ReasonTree_pkey";
       dt            postgres    false    325                       2606    37736    Reason Reason_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY dt."Reason"
    ADD CONSTRAINT "Reason_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY dt."Reason" DROP CONSTRAINT "Reason_pkey";
       dt            postgres    false    321                       2606    37738 H   ResourceNetworkConnectionProperty ResourceNetworkConnectionProperty_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY dt."ResourceNetworkConnectionProperty"
    ADD CONSTRAINT "ResourceNetworkConnectionProperty_pkey" PRIMARY KEY (id);
 r   ALTER TABLE ONLY dt."ResourceNetworkConnectionProperty" DROP CONSTRAINT "ResourceNetworkConnectionProperty_pkey";
       dt            postgres    false    328            "           2606    37740 P   ResourceNetworkConnectionTypeProperty ResourceNetworkConnectionTypeProperty_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY dt."ResourceNetworkConnectionTypeProperty"
    ADD CONSTRAINT "ResourceNetworkConnectionTypeProperty_pkey" PRIMARY KEY (id);
 z   ALTER TABLE ONLY dt."ResourceNetworkConnectionTypeProperty" DROP CONSTRAINT "ResourceNetworkConnectionTypeProperty_pkey";
       dt            postgres    false    330                        2606    37742 @   ResourceNetworkConnectionType ResourceNetworkConnectionType_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY dt."ResourceNetworkConnectionType"
    ADD CONSTRAINT "ResourceNetworkConnectionType_pkey" PRIMARY KEY (id);
 j   ALTER TABLE ONLY dt."ResourceNetworkConnectionType" DROP CONSTRAINT "ResourceNetworkConnectionType_pkey";
       dt            postgres    false    329                       2606    37744 8   ResourceNetworkConnection ResourceNetworkConnection_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY dt."ResourceNetworkConnection"
    ADD CONSTRAINT "ResourceNetworkConnection_pkey" PRIMARY KEY (id);
 b   ALTER TABLE ONLY dt."ResourceNetworkConnection" DROP CONSTRAINT "ResourceNetworkConnection_pkey";
       dt            postgres    false    327            $           2606    37746 <   ResourceRelationshipNetwork ResourceRelationshipNetwork_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY dt."ResourceRelationshipNetwork"
    ADD CONSTRAINT "ResourceRelationshipNetwork_pkey" PRIMARY KEY (id);
 f   ALTER TABLE ONLY dt."ResourceRelationshipNetwork" DROP CONSTRAINT "ResourceRelationshipNetwork_pkey";
       dt            postgres    false    331            &           2606    37748    SegmentData SegmentData_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY dt."SegmentData"
    ADD CONSTRAINT "SegmentData_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY dt."SegmentData" DROP CONSTRAINT "SegmentData_pkey";
       dt            postgres    false    332            (           2606    37750 &   SegmentParameter SegmentParameter_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY dt."SegmentParameter"
    ADD CONSTRAINT "SegmentParameter_pkey" PRIMARY KEY (id);
 P   ALTER TABLE ONLY dt."SegmentParameter" DROP CONSTRAINT "SegmentParameter_pkey";
       dt            postgres    false    333            *           2606    37752 *   SegmentRequirement SegmentRequirement_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY dt."SegmentRequirement"
    ADD CONSTRAINT "SegmentRequirement_pkey" PRIMARY KEY (id);
 T   ALTER TABLE ONLY dt."SegmentRequirement" DROP CONSTRAINT "SegmentRequirement_pkey";
       dt            postgres    false    334            ,           2606    37754 $   SegmentResponse SegmentResponse_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY dt."SegmentResponse"
    ADD CONSTRAINT "SegmentResponse_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY dt."SegmentResponse" DROP CONSTRAINT "SegmentResponse_pkey";
       dt            postgres    false    335            .           2606    37756    Shift Shift_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY dt."Shift"
    ADD CONSTRAINT "Shift_pkey" PRIMARY KEY (id);
 :   ALTER TABLE ONLY dt."Shift" DROP CONSTRAINT "Shift_pkey";
       dt            postgres    false    336            2           2606    37758 8   StateDefinitionTransition StateDefinitionTransition_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY dt."StateDefinitionTransition"
    ADD CONSTRAINT "StateDefinitionTransition_pkey" PRIMARY KEY (id);
 b   ALTER TABLE ONLY dt."StateDefinitionTransition" DROP CONSTRAINT "StateDefinitionTransition_pkey";
       dt            postgres    false    338            0           2606    37760 $   StateDefinition StateDefinition_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY dt."StateDefinition"
    ADD CONSTRAINT "StateDefinition_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY dt."StateDefinition" DROP CONSTRAINT "StateDefinition_pkey";
       dt            postgres    false    337            4           2606    37762    StateLibrary StateLibrary_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY dt."StateLibrary"
    ADD CONSTRAINT "StateLibrary_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY dt."StateLibrary" DROP CONSTRAINT "StateLibrary_pkey";
       dt            postgres    false    339            8           2606    37764 2   StateMachineDefinition StateMachineDefinition_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY dt."StateMachineDefinition"
    ADD CONSTRAINT "StateMachineDefinition_pkey" PRIMARY KEY (id);
 \   ALTER TABLE ONLY dt."StateMachineDefinition" DROP CONSTRAINT "StateMachineDefinition_pkey";
       dt            postgres    false    341            :           2606    37766 *   StateObjectMapping StateObjectMapping_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY dt."StateObjectMapping"
    ADD CONSTRAINT "StateObjectMapping_pkey" PRIMARY KEY (id);
 T   ALTER TABLE ONLY dt."StateObjectMapping" DROP CONSTRAINT "StateObjectMapping_pkey";
       dt            postgres    false    342            >           2606    37768 "   StreamProperty StreamProperty_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY dt."StreamProperty"
    ADD CONSTRAINT "StreamProperty_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY dt."StreamProperty" DROP CONSTRAINT "StreamProperty_pkey";
       dt            postgres    false    344            <           2606    37770    Stream Stream_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY dt."Stream"
    ADD CONSTRAINT "Stream_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY dt."Stream" DROP CONSTRAINT "Stream_pkey";
       dt            postgres    false    343            B           2606    37772 <   ToResourceReferenceProperty ToResourceReferenceProperty_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY dt."ToResourceReferenceProperty"
    ADD CONSTRAINT "ToResourceReferenceProperty_pkey" PRIMARY KEY (id);
 f   ALTER TABLE ONLY dt."ToResourceReferenceProperty" DROP CONSTRAINT "ToResourceReferenceProperty_pkey";
       dt            postgres    false    346            @           2606    37774 ,   ToResourceReference ToResourceReference_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY dt."ToResourceReference"
    ADD CONSTRAINT "ToResourceReference_pkey" PRIMARY KEY (id);
 V   ALTER TABLE ONLY dt."ToResourceReference" DROP CONSTRAINT "ToResourceReference_pkey";
       dt            postgres    false    345            F           2606    37776    UomCategory UomCategory_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY dt."UomCategory"
    ADD CONSTRAINT "UomCategory_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY dt."UomCategory" DROP CONSTRAINT "UomCategory_pkey";
       dt            postgres    false    348            D           2606    37778    Uom Uom_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY dt."Uom"
    ADD CONSTRAINT "Uom_pkey" PRIMARY KEY (id);
 6   ALTER TABLE ONLY dt."Uom" DROP CONSTRAINT "Uom_pkey";
       dt            postgres    false    347            N           2606    37780 L   WorkCalendarDefinitionEntryProperty WorkCalendarDefinitionEntryProperty_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarDefinitionEntryProperty"
    ADD CONSTRAINT "WorkCalendarDefinitionEntryProperty_pkey" PRIMARY KEY (id);
 v   ALTER TABLE ONLY dt."WorkCalendarDefinitionEntryProperty" DROP CONSTRAINT "WorkCalendarDefinitionEntryProperty_pkey";
       dt            postgres    false    352            L           2606    37782 <   WorkCalendarDefinitionEntry WorkCalendarDefinitionEntry_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY dt."WorkCalendarDefinitionEntry"
    ADD CONSTRAINT "WorkCalendarDefinitionEntry_pkey" PRIMARY KEY (id);
 f   ALTER TABLE ONLY dt."WorkCalendarDefinitionEntry" DROP CONSTRAINT "WorkCalendarDefinitionEntry_pkey";
       dt            postgres    false    351            R           2606    37784 J   WorkCalendarDefinitionGroupMapping WorkCalendarDefinitionGroupMapping_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarDefinitionGroupMapping"
    ADD CONSTRAINT "WorkCalendarDefinitionGroupMapping_pkey" PRIMARY KEY (id);
 t   ALTER TABLE ONLY dt."WorkCalendarDefinitionGroupMapping" DROP CONSTRAINT "WorkCalendarDefinitionGroupMapping_pkey";
       dt            postgres    false    354            P           2606    37786 <   WorkCalendarDefinitionGroup WorkCalendarDefinitionGroup_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY dt."WorkCalendarDefinitionGroup"
    ADD CONSTRAINT "WorkCalendarDefinitionGroup_pkey" PRIMARY KEY (id);
 f   ALTER TABLE ONLY dt."WorkCalendarDefinitionGroup" DROP CONSTRAINT "WorkCalendarDefinitionGroup_pkey";
       dt            postgres    false    353            T           2606    37788 L   WorkCalendarDefinitionObjectMapping WorkCalendarDefinitionObjectMapping_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarDefinitionObjectMapping"
    ADD CONSTRAINT "WorkCalendarDefinitionObjectMapping_pkey" PRIMARY KEY (id);
 v   ALTER TABLE ONLY dt."WorkCalendarDefinitionObjectMapping" DROP CONSTRAINT "WorkCalendarDefinitionObjectMapping_pkey";
       dt            postgres    false    355            V           2606    37790 F   WorkCalendarDefinitionOverruling WorkCalendarDefinitionOverruling_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarDefinitionOverruling"
    ADD CONSTRAINT "WorkCalendarDefinitionOverruling_pkey" PRIMARY KEY (id);
 p   ALTER TABLE ONLY dt."WorkCalendarDefinitionOverruling" DROP CONSTRAINT "WorkCalendarDefinitionOverruling_pkey";
       dt            postgres    false    356            X           2606    37792 B   WorkCalendarDefinitionProperty WorkCalendarDefinitionProperty_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarDefinitionProperty"
    ADD CONSTRAINT "WorkCalendarDefinitionProperty_pkey" PRIMARY KEY (id);
 l   ALTER TABLE ONLY dt."WorkCalendarDefinitionProperty" DROP CONSTRAINT "WorkCalendarDefinitionProperty_pkey";
       dt            postgres    false    357            J           2606    37794 2   WorkCalendarDefinition WorkCalendarDefinition_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY dt."WorkCalendarDefinition"
    ADD CONSTRAINT "WorkCalendarDefinition_pkey" PRIMARY KEY (id);
 \   ALTER TABLE ONLY dt."WorkCalendarDefinition" DROP CONSTRAINT "WorkCalendarDefinition_pkey";
       dt            postgres    false    350            \           2606    37796 8   WorkCalendarEntryProperty WorkCalendarEntryProperty_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY dt."WorkCalendarEntryProperty"
    ADD CONSTRAINT "WorkCalendarEntryProperty_pkey" PRIMARY KEY (id);
 b   ALTER TABLE ONLY dt."WorkCalendarEntryProperty" DROP CONSTRAINT "WorkCalendarEntryProperty_pkey";
       dt            postgres    false    359            Z           2606    37798 (   WorkCalendarEntry WorkCalendarEntry_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY dt."WorkCalendarEntry"
    ADD CONSTRAINT "WorkCalendarEntry_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY dt."WorkCalendarEntry" DROP CONSTRAINT "WorkCalendarEntry_pkey";
       dt            postgres    false    358            ^           2606    37800 .   WorkCalendarProperty WorkCalendarProperty_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY dt."WorkCalendarProperty"
    ADD CONSTRAINT "WorkCalendarProperty_pkey" PRIMARY KEY (id);
 X   ALTER TABLE ONLY dt."WorkCalendarProperty" DROP CONSTRAINT "WorkCalendarProperty_pkey";
       dt            postgres    false    360            H           2606    37802    WorkCalendar WorkCalendar_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY dt."WorkCalendar"
    ADD CONSTRAINT "WorkCalendar_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY dt."WorkCalendar" DROP CONSTRAINT "WorkCalendar_pkey";
       dt            postgres    false    349            b           2606    37804 2   WorkCapabilityProperty WorkCapabilityProperty_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY dt."WorkCapabilityProperty"
    ADD CONSTRAINT "WorkCapabilityProperty_pkey" PRIMARY KEY (id);
 \   ALTER TABLE ONLY dt."WorkCapabilityProperty" DROP CONSTRAINT "WorkCapabilityProperty_pkey";
       dt            postgres    false    362            `           2606    37806 "   WorkCapability WorkCapability_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY dt."WorkCapability"
    ADD CONSTRAINT "WorkCapability_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY dt."WorkCapability" DROP CONSTRAINT "WorkCapability_pkey";
       dt            postgres    false    361            h           2606    37808 >   WorkMasterCapabilityProperty WorkMasterCapabilityProperty_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY dt."WorkMasterCapabilityProperty"
    ADD CONSTRAINT "WorkMasterCapabilityProperty_pkey" PRIMARY KEY (id);
 h   ALTER TABLE ONLY dt."WorkMasterCapabilityProperty" DROP CONSTRAINT "WorkMasterCapabilityProperty_pkey";
       dt            postgres    false    365            f           2606    37810 .   WorkMasterCapability WorkMasterCapability_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY dt."WorkMasterCapability"
    ADD CONSTRAINT "WorkMasterCapability_pkey" PRIMARY KEY (id);
 X   ALTER TABLE ONLY dt."WorkMasterCapability" DROP CONSTRAINT "WorkMasterCapability_pkey";
       dt            postgres    false    364            d           2606    37812    WorkMaster WorkMaster_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY dt."WorkMaster"
    ADD CONSTRAINT "WorkMaster_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY dt."WorkMaster" DROP CONSTRAINT "WorkMaster_pkey";
       dt            postgres    false    363            l           2606    37814 4   WorkPerformanceProperty WorkPerformanceProperty_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY dt."WorkPerformanceProperty"
    ADD CONSTRAINT "WorkPerformanceProperty_pkey" PRIMARY KEY (id);
 ^   ALTER TABLE ONLY dt."WorkPerformanceProperty" DROP CONSTRAINT "WorkPerformanceProperty_pkey";
       dt            postgres    false    367            j           2606    37816 $   WorkPerformance WorkPerformance_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY dt."WorkPerformance"
    ADD CONSTRAINT "WorkPerformance_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY dt."WorkPerformance" DROP CONSTRAINT "WorkPerformance_pkey";
       dt            postgres    false    366            p           2606    37818 ,   WorkRequestProperty WorkRequestProperty_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY dt."WorkRequestProperty"
    ADD CONSTRAINT "WorkRequestProperty_pkey" PRIMARY KEY (id);
 V   ALTER TABLE ONLY dt."WorkRequestProperty" DROP CONSTRAINT "WorkRequestProperty_pkey";
       dt            postgres    false    369            n           2606    37820    WorkRequest WorkRequest_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY dt."WorkRequest"
    ADD CONSTRAINT "WorkRequest_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY dt."WorkRequest" DROP CONSTRAINT "WorkRequest_pkey";
       dt            postgres    false    368            t           2606    37822 .   WorkResponseProperty WorkResponseProperty_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY dt."WorkResponseProperty"
    ADD CONSTRAINT "WorkResponseProperty_pkey" PRIMARY KEY (id);
 X   ALTER TABLE ONLY dt."WorkResponseProperty" DROP CONSTRAINT "WorkResponseProperty_pkey";
       dt            postgres    false    371            r           2606    37824    WorkResponse WorkResponse_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY dt."WorkResponse"
    ADD CONSTRAINT "WorkResponse_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY dt."WorkResponse" DROP CONSTRAINT "WorkResponse_pkey";
       dt            postgres    false    370            x           2606    37826 .   WorkScheduleProperty WorkScheduleProperty_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY dt."WorkScheduleProperty"
    ADD CONSTRAINT "WorkScheduleProperty_pkey" PRIMARY KEY (id);
 X   ALTER TABLE ONLY dt."WorkScheduleProperty" DROP CONSTRAINT "WorkScheduleProperty_pkey";
       dt            postgres    false    373            v           2606    37828    WorkSchedule WorkSchedule_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY dt."WorkSchedule"
    ADD CONSTRAINT "WorkSchedule_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY dt."WorkSchedule" DROP CONSTRAINT "WorkSchedule_pkey";
       dt            postgres    false    372            ~           2606    37830 F   WorkflowSpecificationCxnProperty WorkflowSpecificationCxnProperty_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationCxnProperty"
    ADD CONSTRAINT "WorkflowSpecificationCxnProperty_pkey" PRIMARY KEY (id);
 p   ALTER TABLE ONLY dt."WorkflowSpecificationCxnProperty" DROP CONSTRAINT "WorkflowSpecificationCxnProperty_pkey";
       dt            postgres    false    376            �           2606    37832 N   WorkflowSpecificationCxnTypeProperty WorkflowSpecificationCxnTypeProperty_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationCxnTypeProperty"
    ADD CONSTRAINT "WorkflowSpecificationCxnTypeProperty_pkey" PRIMARY KEY (id);
 x   ALTER TABLE ONLY dt."WorkflowSpecificationCxnTypeProperty" DROP CONSTRAINT "WorkflowSpecificationCxnTypeProperty_pkey";
       dt            postgres    false    378            �           2606    37834 >   WorkflowSpecificationCxnType WorkflowSpecificationCxnType_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY dt."WorkflowSpecificationCxnType"
    ADD CONSTRAINT "WorkflowSpecificationCxnType_pkey" PRIMARY KEY (id);
 h   ALTER TABLE ONLY dt."WorkflowSpecificationCxnType" DROP CONSTRAINT "WorkflowSpecificationCxnType_pkey";
       dt            postgres    false    377            |           2606    37836 6   WorkflowSpecificationCxn WorkflowSpecificationCxn_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY dt."WorkflowSpecificationCxn"
    ADD CONSTRAINT "WorkflowSpecificationCxn_pkey" PRIMARY KEY (id);
 `   ALTER TABLE ONLY dt."WorkflowSpecificationCxn" DROP CONSTRAINT "WorkflowSpecificationCxn_pkey";
       dt            postgres    false    375            �           2606    37838 H   WorkflowSpecificationNodeProperty WorkflowSpecificationNodeProperty_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationNodeProperty"
    ADD CONSTRAINT "WorkflowSpecificationNodeProperty_pkey" PRIMARY KEY (id);
 r   ALTER TABLE ONLY dt."WorkflowSpecificationNodeProperty" DROP CONSTRAINT "WorkflowSpecificationNodeProperty_pkey";
       dt            postgres    false    380            �           2606    37840 P   WorkflowSpecificationNodeTypeProperty WorkflowSpecificationNodeTypeProperty_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationNodeTypeProperty"
    ADD CONSTRAINT "WorkflowSpecificationNodeTypeProperty_pkey" PRIMARY KEY (id);
 z   ALTER TABLE ONLY dt."WorkflowSpecificationNodeTypeProperty" DROP CONSTRAINT "WorkflowSpecificationNodeTypeProperty_pkey";
       dt            postgres    false    382            �           2606    37842 @   WorkflowSpecificationNodeType WorkflowSpecificationNodeType_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY dt."WorkflowSpecificationNodeType"
    ADD CONSTRAINT "WorkflowSpecificationNodeType_pkey" PRIMARY KEY (id);
 j   ALTER TABLE ONLY dt."WorkflowSpecificationNodeType" DROP CONSTRAINT "WorkflowSpecificationNodeType_pkey";
       dt            postgres    false    381            �           2606    37844 8   WorkflowSpecificationNode WorkflowSpecificationNode_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY dt."WorkflowSpecificationNode"
    ADD CONSTRAINT "WorkflowSpecificationNode_pkey" PRIMARY KEY (id);
 b   ALTER TABLE ONLY dt."WorkflowSpecificationNode" DROP CONSTRAINT "WorkflowSpecificationNode_pkey";
       dt            postgres    false    379            �           2606    37846 @   WorkflowSpecificationProperty WorkflowSpecificationProperty_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY dt."WorkflowSpecificationProperty"
    ADD CONSTRAINT "WorkflowSpecificationProperty_pkey" PRIMARY KEY (id);
 j   ALTER TABLE ONLY dt."WorkflowSpecificationProperty" DROP CONSTRAINT "WorkflowSpecificationProperty_pkey";
       dt            postgres    false    383            z           2606    37848 0   WorkflowSpecification WorkflowSpecification_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY dt."WorkflowSpecification"
    ADD CONSTRAINT "WorkflowSpecification_pkey" PRIMARY KEY (id);
 Z   ALTER TABLE ONLY dt."WorkflowSpecification" DROP CONSTRAINT "WorkflowSpecification_pkey";
       dt            postgres    false    374            <           1259    37859    EquipmentClassMapping_AB_unique    INDEX        CREATE UNIQUE INDEX "EquipmentClassMapping_AB_unique" ON dt."EquipmentClassMapping" USING btree (equipment, "equipmentClass");
 1   DROP INDEX dt."EquipmentClassMapping_AB_unique";
       dt            postgres    false    217    217            =           1259    37860    EquipmentClassMapping_B    INDEX     e   CREATE INDEX "EquipmentClassMapping_B" ON dt."EquipmentClassMapping" USING btree ("equipmentClass");
 )   DROP INDEX dt."EquipmentClassMapping_B";
       dt            postgres    false    217            �           1259    37861    MaterialClassMapping_AB_unique    INDEX     �   CREATE UNIQUE INDEX "MaterialClassMapping_AB_unique" ON dt."MaterialClassMapping" USING btree ("materialClass", "materialDefinition");
 0   DROP INDEX dt."MaterialClassMapping_AB_unique";
       dt            postgres    false    251    251            �           1259    37862    MaterialClassMapping_B    INDEX     g   CREATE INDEX "MaterialClassMapping_B" ON dt."MaterialClassMapping" USING btree ("materialDefinition");
 (   DROP INDEX dt."MaterialClassMapping_B";
       dt            postgres    false    251            �           1259    37863    PersonnelClassMapping_AB_unique    INDEX     |   CREATE UNIQUE INDEX "PersonnelClassMapping_AB_unique" ON dt."PersonnelClassMapping" USING btree (person, "personnelClass");
 1   DROP INDEX dt."PersonnelClassMapping_AB_unique";
       dt            postgres    false    292    292            �           1259    37864    PersonnelClassMapping_B    INDEX     e   CREATE INDEX "PersonnelClassMapping_B" ON dt."PersonnelClassMapping" USING btree ("personnelClass");
 )   DROP INDEX dt."PersonnelClassMapping_B";
       dt            postgres    false    292            �           1259    37865 #   PhysicalAssetClassMapping_AB_unique    INDEX     �   CREATE UNIQUE INDEX "PhysicalAssetClassMapping_AB_unique" ON dt."PhysicalAssetClassMapping" USING btree ("physicalAsset", "physicalAssetClass");
 5   DROP INDEX dt."PhysicalAssetClassMapping_AB_unique";
       dt            postgres    false    306    306            �           1259    37866    PhysicalAssetClassMapping_B    INDEX     q   CREATE INDEX "PhysicalAssetClassMapping_B" ON dt."PhysicalAssetClassMapping" USING btree ("physicalAssetClass");
 -   DROP INDEX dt."PhysicalAssetClassMapping_B";
       dt            postgres    false    306                       1259    37867 $   ReasonEquipmentTypeMapping_AB_unique    INDEX     �   CREATE UNIQUE INDEX "ReasonEquipmentTypeMapping_AB_unique" ON dt."ReasonEquipmentTypeMapping" USING btree ("equipmentType", reason);
 6   DROP INDEX dt."ReasonEquipmentTypeMapping_AB_unique";
       dt            postgres    false    323    323                       1259    37868    ReasonEquipmentTypeMapping_B    INDEX     e   CREATE INDEX "ReasonEquipmentTypeMapping_B" ON dt."ReasonEquipmentTypeMapping" USING btree (reason);
 .   DROP INDEX dt."ReasonEquipmentTypeMapping_B";
       dt            postgres    false    323            5           1259    37869 +   StateLibraryReasonCategoryMapping_AB_unique    INDEX     �   CREATE UNIQUE INDEX "StateLibraryReasonCategoryMapping_AB_unique" ON dt."StateLibraryReasonCategoryMapping" USING btree (category, "stateLibrary");
 =   DROP INDEX dt."StateLibraryReasonCategoryMapping_AB_unique";
       dt            postgres    false    340    340            6           1259    37870 #   StateLibraryReasonCategoryMapping_B    INDEX     {   CREATE INDEX "StateLibraryReasonCategoryMapping_B" ON dt."StateLibraryReasonCategoryMapping" USING btree ("stateLibrary");
 5   DROP INDEX dt."StateLibraryReasonCategoryMapping_B";
       dt            postgres    false    340            �           1259    37871 &   _EventTypeInstanceEventRoute_AB_unique    INDEX     z   CREATE UNIQUE INDEX "_EventTypeInstanceEventRoute_AB_unique" ON dt."_EventTypeInstanceEventRoute" USING btree ("A", "B");
 8   DROP INDEX dt."_EventTypeInstanceEventRoute_AB_unique";
       dt            postgres    false    384    384            �           1259    37872    _EventTypeInstanceEventRoute_B    INDEX     f   CREATE INDEX "_EventTypeInstanceEventRoute_B" ON dt."_EventTypeInstanceEventRoute" USING btree ("B");
 0   DROP INDEX dt."_EventTypeInstanceEventRoute_B";
       dt            postgres    false    384            �           1259    37873 5   _EventTypePropertyEventTypeInstanceProperty_AB_unique    INDEX     �   CREATE UNIQUE INDEX "_EventTypePropertyEventTypeInstanceProperty_AB_unique" ON dt."_EventTypePropertyEventTypeInstanceProperty" USING btree ("A", "B");
 G   DROP INDEX dt."_EventTypePropertyEventTypeInstanceProperty_AB_unique";
       dt            postgres    false    385    385            �           1259    37874 -   _EventTypePropertyEventTypeInstanceProperty_B    INDEX     �   CREATE INDEX "_EventTypePropertyEventTypeInstanceProperty_B" ON dt."_EventTypePropertyEventTypeInstanceProperty" USING btree ("B");
 ?   DROP INDEX dt."_EventTypePropertyEventTypeInstanceProperty_B";
       dt            postgres    false    385            �           1259    37875 ,   _OperationsDefinitionCustomerTypes_AB_unique    INDEX     �   CREATE UNIQUE INDEX "_OperationsDefinitionCustomerTypes_AB_unique" ON dt."_OperationsDefinitionCustomerTypes" USING btree ("A", "B");
 >   DROP INDEX dt."_OperationsDefinitionCustomerTypes_AB_unique";
       dt            postgres    false    387    387            �           1259    37876 $   _OperationsDefinitionCustomerTypes_B    INDEX     r   CREATE INDEX "_OperationsDefinitionCustomerTypes_B" ON dt."_OperationsDefinitionCustomerTypes" USING btree ("B");
 6   DROP INDEX dt."_OperationsDefinitionCustomerTypes_B";
       dt            postgres    false    387            �           1259    37877 '   _OperationsDefinitionCustomer_AB_unique    INDEX     |   CREATE UNIQUE INDEX "_OperationsDefinitionCustomer_AB_unique" ON dt."_OperationsDefinitionCustomer" USING btree ("A", "B");
 9   DROP INDEX dt."_OperationsDefinitionCustomer_AB_unique";
       dt            postgres    false    386    386            �           1259    37878    _OperationsDefinitionCustomer_B    INDEX     h   CREATE INDEX "_OperationsDefinitionCustomer_B" ON dt."_OperationsDefinitionCustomer" USING btree ("B");
 1   DROP INDEX dt."_OperationsDefinitionCustomer_B";
       dt            postgres    false    386            �           1259    37879 )   _OperationsRequestCustomerTypes_AB_unique    INDEX     �   CREATE UNIQUE INDEX "_OperationsRequestCustomerTypes_AB_unique" ON dt."_OperationsRequestCustomerTypes" USING btree ("A", "B");
 ;   DROP INDEX dt."_OperationsRequestCustomerTypes_AB_unique";
       dt            postgres    false    389    389            �           1259    37880 !   _OperationsRequestCustomerTypes_B    INDEX     l   CREATE INDEX "_OperationsRequestCustomerTypes_B" ON dt."_OperationsRequestCustomerTypes" USING btree ("B");
 3   DROP INDEX dt."_OperationsRequestCustomerTypes_B";
       dt            postgres    false    389            �           1259    37881 $   _OperationsRequestCustomer_AB_unique    INDEX     v   CREATE UNIQUE INDEX "_OperationsRequestCustomer_AB_unique" ON dt."_OperationsRequestCustomer" USING btree ("A", "B");
 6   DROP INDEX dt."_OperationsRequestCustomer_AB_unique";
       dt            postgres    false    388    388            �           1259    37882    _OperationsRequestCustomer_B    INDEX     b   CREATE INDEX "_OperationsRequestCustomer_B" ON dt."_OperationsRequestCustomer" USING btree ("B");
 .   DROP INDEX dt."_OperationsRequestCustomer_B";
       dt            postgres    false    388            V           1259    37883 "   apps_schema.EventType.code._UNIQUE    INDEX     _   CREATE UNIQUE INDEX "apps_schema.EventType.code._UNIQUE" ON dt."EventType" USING btree (code);
 4   DROP INDEX dt."apps_schema.EventType.code._UNIQUE";
       dt            postgres    false    229            Y           1259    37884 *   apps_schema.EventTypeInstance.code._UNIQUE    INDEX     o   CREATE UNIQUE INDEX "apps_schema.EventTypeInstance.code._UNIQUE" ON dt."EventTypeInstance" USING btree (code);
 <   DROP INDEX dt."apps_schema.EventTypeInstance.code._UNIQUE";
       dt            postgres    false    230            b           1259    37885 !   apps_schema.FlowType.code._UNIQUE    INDEX     ]   CREATE UNIQUE INDEX "apps_schema.FlowType.code._UNIQUE" ON dt."FlowType" USING btree (code);
 3   DROP INDEX dt."apps_schema.FlowType.code._UNIQUE";
       dt            postgres    false    234            �           2606    37886 >   CalendarPatternEntry CalendarPatternEntry_calendarPattern_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."CalendarPatternEntry"
    ADD CONSTRAINT "CalendarPatternEntry_calendarPattern_fkey" FOREIGN KEY ("calendarPattern") REFERENCES dt."CalendarPattern"(id) ON DELETE SET NULL;
 h   ALTER TABLE ONLY dt."CalendarPatternEntry" DROP CONSTRAINT "CalendarPatternEntry_calendarPattern_fkey";
       dt          postgres    false    205    3619    204            �           2606    37891 8   CalendarPatternEntry CalendarPatternEntry_entryType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."CalendarPatternEntry"
    ADD CONSTRAINT "CalendarPatternEntry_entryType_fkey" FOREIGN KEY ("entryType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 b   ALTER TABLE ONLY dt."CalendarPatternEntry" DROP CONSTRAINT "CalendarPatternEntry_entryType_fkey";
       dt          postgres    false    205    243    3700            �           2606    37896 3   CalendarPattern CalendarPattern_objectCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."CalendarPattern"
    ADD CONSTRAINT "CalendarPattern_objectCategory_fkey" FOREIGN KEY ("objectCategory") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 ]   ALTER TABLE ONLY dt."CalendarPattern" DROP CONSTRAINT "CalendarPattern_objectCategory_fkey";
       dt          postgres    false    3700    243    204            �           2606    37901 9   CustomerClassProperty CustomerClassProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."CustomerClassProperty"
    ADD CONSTRAINT "CustomerClassProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY dt."CustomerClassProperty" DROP CONSTRAINT "CustomerClassProperty_category_fkey";
       dt          postgres    false    208    243    3700            �           2606    37906 >   CustomerClassProperty CustomerClassProperty_customerClass_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."CustomerClassProperty"
    ADD CONSTRAINT "CustomerClassProperty_customerClass_fkey" FOREIGN KEY ("customerClass") REFERENCES dt."CustomerClass"(id) ON DELETE SET NULL;
 h   ALTER TABLE ONLY dt."CustomerClassProperty" DROP CONSTRAINT "CustomerClassProperty_customerClass_fkey";
       dt          postgres    false    208    207    3625            �           2606    37911 7   CustomerClassProperty CustomerClassProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."CustomerClassProperty"
    ADD CONSTRAINT "CustomerClassProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."CustomerClassProperty"(id) ON DELETE SET NULL;
 a   ALTER TABLE ONLY dt."CustomerClassProperty" DROP CONSTRAINT "CustomerClassProperty_parent_fkey";
       dt          postgres    false    208    208    3627            �           2606    37916 =   CustomerClassProperty CustomerClassProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."CustomerClassProperty"
    ADD CONSTRAINT "CustomerClassProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 g   ALTER TABLE ONLY dt."CustomerClassProperty" DROP CONSTRAINT "CustomerClassProperty_propertyType_fkey";
       dt          postgres    false    208    320    3854            �           2606    37921 ;   CustomerClassProperty CustomerClassProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."CustomerClassProperty"
    ADD CONSTRAINT "CustomerClassProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."CustomerClassProperty" DROP CONSTRAINT "CustomerClassProperty_sensorType_fkey";
       dt          postgres    false    208    216    3643            �           2606    37926 7   CustomerClassProperty CustomerClassProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."CustomerClassProperty"
    ADD CONSTRAINT "CustomerClassProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 a   ALTER TABLE ONLY dt."CustomerClassProperty" DROP CONSTRAINT "CustomerClassProperty_sensor_fkey";
       dt          postgres    false    208    210    3631            �           2606    37931 <   CustomerClassProperty CustomerClassProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."CustomerClassProperty"
    ADD CONSTRAINT "CustomerClassProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 f   ALTER TABLE ONLY dt."CustomerClassProperty" DROP CONSTRAINT "CustomerClassProperty_uomCategory_fkey";
       dt          postgres    false    208    348    3910            �           2606    37936 9   CustomerClassProperty CustomerClassProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."CustomerClassProperty"
    ADD CONSTRAINT "CustomerClassProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY dt."CustomerClassProperty" DROP CONSTRAINT "CustomerClassProperty_valueUom_fkey";
       dt          postgres    false    208    347    3908            �           2606    37941 /   CustomerProperty CustomerProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."CustomerProperty"
    ADD CONSTRAINT "CustomerProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 Y   ALTER TABLE ONLY dt."CustomerProperty" DROP CONSTRAINT "CustomerProperty_category_fkey";
       dt          postgres    false    209    243    3700            �           2606    37946 /   CustomerProperty CustomerProperty_customer_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."CustomerProperty"
    ADD CONSTRAINT "CustomerProperty_customer_fkey" FOREIGN KEY (customer) REFERENCES dt."Customer"(id) ON DELETE SET NULL;
 Y   ALTER TABLE ONLY dt."CustomerProperty" DROP CONSTRAINT "CustomerProperty_customer_fkey";
       dt          postgres    false    209    206    3623            �           2606    37951 -   CustomerProperty CustomerProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."CustomerProperty"
    ADD CONSTRAINT "CustomerProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."CustomerProperty"(id) ON DELETE SET NULL;
 W   ALTER TABLE ONLY dt."CustomerProperty" DROP CONSTRAINT "CustomerProperty_parent_fkey";
       dt          postgres    false    209    209    3629            �           2606    37956 3   CustomerProperty CustomerProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."CustomerProperty"
    ADD CONSTRAINT "CustomerProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 ]   ALTER TABLE ONLY dt."CustomerProperty" DROP CONSTRAINT "CustomerProperty_propertyType_fkey";
       dt          postgres    false    209    320    3854            �           2606    37961 1   CustomerProperty CustomerProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."CustomerProperty"
    ADD CONSTRAINT "CustomerProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 [   ALTER TABLE ONLY dt."CustomerProperty" DROP CONSTRAINT "CustomerProperty_sensorType_fkey";
       dt          postgres    false    209    216    3643            �           2606    37966 -   CustomerProperty CustomerProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."CustomerProperty"
    ADD CONSTRAINT "CustomerProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 W   ALTER TABLE ONLY dt."CustomerProperty" DROP CONSTRAINT "CustomerProperty_sensor_fkey";
       dt          postgres    false    209    210    3631            �           2606    37971 2   CustomerProperty CustomerProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."CustomerProperty"
    ADD CONSTRAINT "CustomerProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 \   ALTER TABLE ONLY dt."CustomerProperty" DROP CONSTRAINT "CustomerProperty_uomCategory_fkey";
       dt          postgres    false    209    348    3910            �           2606    37976 /   CustomerProperty CustomerProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."CustomerProperty"
    ADD CONSTRAINT "CustomerProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 Y   ALTER TABLE ONLY dt."CustomerProperty" DROP CONSTRAINT "CustomerProperty_valueUom_fkey";
       dt          postgres    false    209    347    3908            �           2606    37981 $   Customer Customer_customerClass_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."Customer"
    ADD CONSTRAINT "Customer_customerClass_fkey" FOREIGN KEY ("customerClass") REFERENCES dt."CustomerClass"(id) ON DELETE SET NULL;
 N   ALTER TABLE ONLY dt."Customer" DROP CONSTRAINT "Customer_customerClass_fkey";
       dt          postgres    false    3625    207    206            �           2606    37986    Customer Customer_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."Customer"
    ADD CONSTRAINT "Customer_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."Customer"(id) ON DELETE SET NULL;
 G   ALTER TABLE ONLY dt."Customer" DROP CONSTRAINT "Customer_parent_fkey";
       dt          postgres    false    206    206    3623            �           2606    37991 =   EquipmentActualProperty EquipmentActualProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentActualProperty"
    ADD CONSTRAINT "EquipmentActualProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 g   ALTER TABLE ONLY dt."EquipmentActualProperty" DROP CONSTRAINT "EquipmentActualProperty_category_fkey";
       dt          postgres    false    243    3700    212            �           2606    37996 D   EquipmentActualProperty EquipmentActualProperty_equipmentActual_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentActualProperty"
    ADD CONSTRAINT "EquipmentActualProperty_equipmentActual_fkey" FOREIGN KEY ("equipmentActual") REFERENCES dt."EquipmentActual"(id) ON DELETE SET NULL;
 n   ALTER TABLE ONLY dt."EquipmentActualProperty" DROP CONSTRAINT "EquipmentActualProperty_equipmentActual_fkey";
       dt          postgres    false    3633    212    211            �           2606    38001 ;   EquipmentActualProperty EquipmentActualProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentActualProperty"
    ADD CONSTRAINT "EquipmentActualProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."EquipmentActualProperty"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."EquipmentActualProperty" DROP CONSTRAINT "EquipmentActualProperty_parent_fkey";
       dt          postgres    false    212    3635    212            �           2606    38006 A   EquipmentActualProperty EquipmentActualProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentActualProperty"
    ADD CONSTRAINT "EquipmentActualProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 k   ALTER TABLE ONLY dt."EquipmentActualProperty" DROP CONSTRAINT "EquipmentActualProperty_propertyType_fkey";
       dt          postgres    false    212    3854    320            �           2606    38011 @   EquipmentActualProperty EquipmentActualProperty_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentActualProperty"
    ADD CONSTRAINT "EquipmentActualProperty_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 j   ALTER TABLE ONLY dt."EquipmentActualProperty" DROP CONSTRAINT "EquipmentActualProperty_quantityUom_fkey";
       dt          postgres    false    3908    212    347            �           2606    38016 ?   EquipmentActualProperty EquipmentActualProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentActualProperty"
    ADD CONSTRAINT "EquipmentActualProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 i   ALTER TABLE ONLY dt."EquipmentActualProperty" DROP CONSTRAINT "EquipmentActualProperty_sensorType_fkey";
       dt          postgres    false    3643    216    212            �           2606    38021 ;   EquipmentActualProperty EquipmentActualProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentActualProperty"
    ADD CONSTRAINT "EquipmentActualProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."EquipmentActualProperty" DROP CONSTRAINT "EquipmentActualProperty_sensor_fkey";
       dt          postgres    false    3631    210    212            �           2606    38026 @   EquipmentActualProperty EquipmentActualProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentActualProperty"
    ADD CONSTRAINT "EquipmentActualProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 j   ALTER TABLE ONLY dt."EquipmentActualProperty" DROP CONSTRAINT "EquipmentActualProperty_uomCategory_fkey";
       dt          postgres    false    348    3910    212            �           2606    38031 =   EquipmentActualProperty EquipmentActualProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentActualProperty"
    ADD CONSTRAINT "EquipmentActualProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 g   ALTER TABLE ONLY dt."EquipmentActualProperty" DROP CONSTRAINT "EquipmentActualProperty_valueUom_fkey";
       dt          postgres    false    3908    212    347            �           2606    38036 3   EquipmentActual EquipmentActual_equipmentClass_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentActual"
    ADD CONSTRAINT "EquipmentActual_equipmentClass_fkey" FOREIGN KEY ("equipmentClass") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 ]   ALTER TABLE ONLY dt."EquipmentActual" DROP CONSTRAINT "EquipmentActual_equipmentClass_fkey";
       dt          postgres    false    3643    211    216            �           2606    38041 .   EquipmentActual EquipmentActual_equipment_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentActual"
    ADD CONSTRAINT "EquipmentActual_equipment_fkey" FOREIGN KEY (equipment) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY dt."EquipmentActual" DROP CONSTRAINT "EquipmentActual_equipment_fkey";
       dt          postgres    false    3631    210    211            �           2606    38046 0   EquipmentActual EquipmentActual_jobResponse_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentActual"
    ADD CONSTRAINT "EquipmentActual_jobResponse_fkey" FOREIGN KEY ("jobResponse") REFERENCES dt."JobResponse"(id) ON DELETE SET NULL;
 Z   ALTER TABLE ONLY dt."EquipmentActual" DROP CONSTRAINT "EquipmentActual_jobResponse_fkey";
       dt          postgres    false    211    241    3696            �           2606    38051 0   EquipmentActual EquipmentActual_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentActual"
    ADD CONSTRAINT "EquipmentActual_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 Z   ALTER TABLE ONLY dt."EquipmentActual" DROP CONSTRAINT "EquipmentActual_quantityUom_fkey";
       dt          postgres    false    347    211    3908            �           2606    38056 4   EquipmentActual EquipmentActual_segmentResponse_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentActual"
    ADD CONSTRAINT "EquipmentActual_segmentResponse_fkey" FOREIGN KEY ("segmentResponse") REFERENCES dt."SegmentResponse"(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY dt."EquipmentActual" DROP CONSTRAINT "EquipmentActual_segmentResponse_fkey";
       dt          postgres    false    3884    335    211            �           2606    38061 :   EquipmentAssetMapping EquipmentAssetMapping_equipment_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentAssetMapping"
    ADD CONSTRAINT "EquipmentAssetMapping_equipment_fkey" FOREIGN KEY (equipment) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 d   ALTER TABLE ONLY dt."EquipmentAssetMapping" DROP CONSTRAINT "EquipmentAssetMapping_equipment_fkey";
       dt          postgres    false    210    213    3631            �           2606    38066 >   EquipmentAssetMapping EquipmentAssetMapping_physicalAsset_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentAssetMapping"
    ADD CONSTRAINT "EquipmentAssetMapping_physicalAsset_fkey" FOREIGN KEY ("physicalAsset") REFERENCES dt."PhysicalAsset"(id) ON DELETE SET NULL;
 h   ALTER TABLE ONLY dt."EquipmentAssetMapping" DROP CONSTRAINT "EquipmentAssetMapping_physicalAsset_fkey";
       dt          postgres    false    213    300    3814            �           2606    38071 E   EquipmentCapabilityProperty EquipmentCapabilityProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentCapabilityProperty"
    ADD CONSTRAINT "EquipmentCapabilityProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY dt."EquipmentCapabilityProperty" DROP CONSTRAINT "EquipmentCapabilityProperty_category_fkey";
       dt          postgres    false    3700    243    215            �           2606    38076 P   EquipmentCapabilityProperty EquipmentCapabilityProperty_equipmentCapability_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentCapabilityProperty"
    ADD CONSTRAINT "EquipmentCapabilityProperty_equipmentCapability_fkey" FOREIGN KEY ("equipmentCapability") REFERENCES dt."EquipmentCapability"(id) ON DELETE SET NULL;
 z   ALTER TABLE ONLY dt."EquipmentCapabilityProperty" DROP CONSTRAINT "EquipmentCapabilityProperty_equipmentCapability_fkey";
       dt          postgres    false    3639    215    214            �           2606    38081 C   EquipmentCapabilityProperty EquipmentCapabilityProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentCapabilityProperty"
    ADD CONSTRAINT "EquipmentCapabilityProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."EquipmentCapabilityProperty"(id) ON DELETE SET NULL;
 m   ALTER TABLE ONLY dt."EquipmentCapabilityProperty" DROP CONSTRAINT "EquipmentCapabilityProperty_parent_fkey";
       dt          postgres    false    3641    215    215            �           2606    38086 I   EquipmentCapabilityProperty EquipmentCapabilityProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentCapabilityProperty"
    ADD CONSTRAINT "EquipmentCapabilityProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 s   ALTER TABLE ONLY dt."EquipmentCapabilityProperty" DROP CONSTRAINT "EquipmentCapabilityProperty_propertyType_fkey";
       dt          postgres    false    320    215    3854            �           2606    38091 H   EquipmentCapabilityProperty EquipmentCapabilityProperty_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentCapabilityProperty"
    ADD CONSTRAINT "EquipmentCapabilityProperty_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 r   ALTER TABLE ONLY dt."EquipmentCapabilityProperty" DROP CONSTRAINT "EquipmentCapabilityProperty_quantityUom_fkey";
       dt          postgres    false    347    215    3908            �           2606    38096 G   EquipmentCapabilityProperty EquipmentCapabilityProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentCapabilityProperty"
    ADD CONSTRAINT "EquipmentCapabilityProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 q   ALTER TABLE ONLY dt."EquipmentCapabilityProperty" DROP CONSTRAINT "EquipmentCapabilityProperty_sensorType_fkey";
       dt          postgres    false    216    215    3643            �           2606    38101 C   EquipmentCapabilityProperty EquipmentCapabilityProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentCapabilityProperty"
    ADD CONSTRAINT "EquipmentCapabilityProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 m   ALTER TABLE ONLY dt."EquipmentCapabilityProperty" DROP CONSTRAINT "EquipmentCapabilityProperty_sensor_fkey";
       dt          postgres    false    215    210    3631            �           2606    38106 H   EquipmentCapabilityProperty EquipmentCapabilityProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentCapabilityProperty"
    ADD CONSTRAINT "EquipmentCapabilityProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 r   ALTER TABLE ONLY dt."EquipmentCapabilityProperty" DROP CONSTRAINT "EquipmentCapabilityProperty_uomCategory_fkey";
       dt          postgres    false    348    3910    215            �           2606    38111 E   EquipmentCapabilityProperty EquipmentCapabilityProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentCapabilityProperty"
    ADD CONSTRAINT "EquipmentCapabilityProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY dt."EquipmentCapabilityProperty" DROP CONSTRAINT "EquipmentCapabilityProperty_valueUom_fkey";
       dt          postgres    false    347    3908    215            �           2606    38116 ;   EquipmentCapability EquipmentCapability_capabilityType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentCapability"
    ADD CONSTRAINT "EquipmentCapability_capabilityType_fkey" FOREIGN KEY ("capabilityType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."EquipmentCapability" DROP CONSTRAINT "EquipmentCapability_capabilityType_fkey";
       dt          postgres    false    3700    214    243            �           2606    38121 ;   EquipmentCapability EquipmentCapability_equipmentClass_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentCapability"
    ADD CONSTRAINT "EquipmentCapability_equipmentClass_fkey" FOREIGN KEY ("equipmentClass") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."EquipmentCapability" DROP CONSTRAINT "EquipmentCapability_equipmentClass_fkey";
       dt          postgres    false    214    216    3643            �           2606    38126 6   EquipmentCapability EquipmentCapability_equipment_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentCapability"
    ADD CONSTRAINT "EquipmentCapability_equipment_fkey" FOREIGN KEY (equipment) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 `   ALTER TABLE ONLY dt."EquipmentCapability" DROP CONSTRAINT "EquipmentCapability_equipment_fkey";
       dt          postgres    false    3631    214    210            �           2606    38131 ;   EquipmentCapability EquipmentCapability_hierarchyScope_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentCapability"
    ADD CONSTRAINT "EquipmentCapability_hierarchyScope_fkey" FOREIGN KEY ("hierarchyScope") REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."EquipmentCapability" DROP CONSTRAINT "EquipmentCapability_hierarchyScope_fkey";
       dt          postgres    false    210    3631    214            �           2606    38136 A   EquipmentCapability EquipmentCapability_operationsCapability_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentCapability"
    ADD CONSTRAINT "EquipmentCapability_operationsCapability_fkey" FOREIGN KEY ("operationsCapability") REFERENCES dt."OperationsCapability"(id) ON DELETE SET NULL;
 k   ALTER TABLE ONLY dt."EquipmentCapability" DROP CONSTRAINT "EquipmentCapability_operationsCapability_fkey";
       dt          postgres    false    268    3750    214            �           2606    38141 E   EquipmentCapability EquipmentCapability_processSegmentCapability_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentCapability"
    ADD CONSTRAINT "EquipmentCapability_processSegmentCapability_fkey" FOREIGN KEY ("processSegmentCapability") REFERENCES dt."ProcessSegmentCapability"(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY dt."EquipmentCapability" DROP CONSTRAINT "EquipmentCapability_processSegmentCapability_fkey";
       dt          postgres    false    316    214    3846            �           2606    38146 8   EquipmentCapability EquipmentCapability_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentCapability"
    ADD CONSTRAINT "EquipmentCapability_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 b   ALTER TABLE ONLY dt."EquipmentCapability" DROP CONSTRAINT "EquipmentCapability_quantityUom_fkey";
       dt          postgres    false    214    347    3908            �           2606    38151 8   EquipmentCapability EquipmentCapability_resourceUse_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentCapability"
    ADD CONSTRAINT "EquipmentCapability_resourceUse_fkey" FOREIGN KEY ("resourceUse") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 b   ALTER TABLE ONLY dt."EquipmentCapability" DROP CONSTRAINT "EquipmentCapability_resourceUse_fkey";
       dt          postgres    false    3700    214    243            �           2606    38156 ;   EquipmentCapability EquipmentCapability_workCapability_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentCapability"
    ADD CONSTRAINT "EquipmentCapability_workCapability_fkey" FOREIGN KEY ("workCapability") REFERENCES dt."WorkCapability"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."EquipmentCapability" DROP CONSTRAINT "EquipmentCapability_workCapability_fkey";
       dt          postgres    false    361    214    3936            �           2606    38161 A   EquipmentCapability EquipmentCapability_workMasterCapability_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentCapability"
    ADD CONSTRAINT "EquipmentCapability_workMasterCapability_fkey" FOREIGN KEY ("workMasterCapability") REFERENCES dt."WorkMasterCapability"(id) ON DELETE SET NULL;
 k   ALTER TABLE ONLY dt."EquipmentCapability" DROP CONSTRAINT "EquipmentCapability_workMasterCapability_fkey";
       dt          postgres    false    214    364    3942            �           2606    38166 ?   EquipmentClassMapping EquipmentClassMapping_equipmentClass_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentClassMapping"
    ADD CONSTRAINT "EquipmentClassMapping_equipmentClass_fkey" FOREIGN KEY ("equipmentClass") REFERENCES dt."EquipmentClass"(id) ON DELETE CASCADE;
 i   ALTER TABLE ONLY dt."EquipmentClassMapping" DROP CONSTRAINT "EquipmentClassMapping_equipmentClass_fkey";
       dt          postgres    false    217    216    3643            �           2606    38171 :   EquipmentClassMapping EquipmentClassMapping_equipment_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentClassMapping"
    ADD CONSTRAINT "EquipmentClassMapping_equipment_fkey" FOREIGN KEY (equipment) REFERENCES dt."Equipment"(id) ON DELETE CASCADE;
 d   ALTER TABLE ONLY dt."EquipmentClassMapping" DROP CONSTRAINT "EquipmentClassMapping_equipment_fkey";
       dt          postgres    false    3631    217    210            �           2606    38176 ;   EquipmentClassProperty EquipmentClassProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentClassProperty"
    ADD CONSTRAINT "EquipmentClassProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."EquipmentClassProperty" DROP CONSTRAINT "EquipmentClassProperty_category_fkey";
       dt          postgres    false    218    243    3700            �           2606    38181 A   EquipmentClassProperty EquipmentClassProperty_equipmentClass_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentClassProperty"
    ADD CONSTRAINT "EquipmentClassProperty_equipmentClass_fkey" FOREIGN KEY ("equipmentClass") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 k   ALTER TABLE ONLY dt."EquipmentClassProperty" DROP CONSTRAINT "EquipmentClassProperty_equipmentClass_fkey";
       dt          postgres    false    218    3643    216            �           2606    38186 9   EquipmentClassProperty EquipmentClassProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentClassProperty"
    ADD CONSTRAINT "EquipmentClassProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."EquipmentClassProperty"(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY dt."EquipmentClassProperty" DROP CONSTRAINT "EquipmentClassProperty_parent_fkey";
       dt          postgres    false    218    218    3647            �           2606    38191 ?   EquipmentClassProperty EquipmentClassProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentClassProperty"
    ADD CONSTRAINT "EquipmentClassProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 i   ALTER TABLE ONLY dt."EquipmentClassProperty" DROP CONSTRAINT "EquipmentClassProperty_propertyType_fkey";
       dt          postgres    false    3854    320    218            �           2606    38196 =   EquipmentClassProperty EquipmentClassProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentClassProperty"
    ADD CONSTRAINT "EquipmentClassProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 g   ALTER TABLE ONLY dt."EquipmentClassProperty" DROP CONSTRAINT "EquipmentClassProperty_sensorType_fkey";
       dt          postgres    false    218    3643    216            �           2606    38201 9   EquipmentClassProperty EquipmentClassProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentClassProperty"
    ADD CONSTRAINT "EquipmentClassProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY dt."EquipmentClassProperty" DROP CONSTRAINT "EquipmentClassProperty_sensor_fkey";
       dt          postgres    false    218    210    3631            �           2606    38206 >   EquipmentClassProperty EquipmentClassProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentClassProperty"
    ADD CONSTRAINT "EquipmentClassProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 h   ALTER TABLE ONLY dt."EquipmentClassProperty" DROP CONSTRAINT "EquipmentClassProperty_uomCategory_fkey";
       dt          postgres    false    3910    348    218            �           2606    38211 ;   EquipmentClassProperty EquipmentClassProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentClassProperty"
    ADD CONSTRAINT "EquipmentClassProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."EquipmentClassProperty" DROP CONSTRAINT "EquipmentClassProperty_valueUom_fkey";
       dt          postgres    false    218    347    3908            �           2606    38216 1   EquipmentClass EquipmentClass_equipmentLevel_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentClass"
    ADD CONSTRAINT "EquipmentClass_equipmentLevel_fkey" FOREIGN KEY ("equipmentLevel") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 [   ALTER TABLE ONLY dt."EquipmentClass" DROP CONSTRAINT "EquipmentClass_equipmentLevel_fkey";
       dt          postgres    false    3700    243    216            �           2606    38221 )   EquipmentClass EquipmentClass_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentClass"
    ADD CONSTRAINT "EquipmentClass_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 S   ALTER TABLE ONLY dt."EquipmentClass" DROP CONSTRAINT "EquipmentClass_parent_fkey";
       dt          postgres    false    3643    216    216            �           2606    38226 1   EquipmentProperty EquipmentProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentProperty"
    ADD CONSTRAINT "EquipmentProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 [   ALTER TABLE ONLY dt."EquipmentProperty" DROP CONSTRAINT "EquipmentProperty_category_fkey";
       dt          postgres    false    219    3700    243            �           2606    38231 2   EquipmentProperty EquipmentProperty_equipment_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentProperty"
    ADD CONSTRAINT "EquipmentProperty_equipment_fkey" FOREIGN KEY (equipment) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 \   ALTER TABLE ONLY dt."EquipmentProperty" DROP CONSTRAINT "EquipmentProperty_equipment_fkey";
       dt          postgres    false    3631    210    219            �           2606    38236 /   EquipmentProperty EquipmentProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentProperty"
    ADD CONSTRAINT "EquipmentProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."EquipmentProperty"(id) ON DELETE SET NULL;
 Y   ALTER TABLE ONLY dt."EquipmentProperty" DROP CONSTRAINT "EquipmentProperty_parent_fkey";
       dt          postgres    false    219    219    3649            �           2606    38241 5   EquipmentProperty EquipmentProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentProperty"
    ADD CONSTRAINT "EquipmentProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 _   ALTER TABLE ONLY dt."EquipmentProperty" DROP CONSTRAINT "EquipmentProperty_propertyType_fkey";
       dt          postgres    false    320    3854    219            �           2606    38246 3   EquipmentProperty EquipmentProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentProperty"
    ADD CONSTRAINT "EquipmentProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 ]   ALTER TABLE ONLY dt."EquipmentProperty" DROP CONSTRAINT "EquipmentProperty_sensorType_fkey";
       dt          postgres    false    219    216    3643            �           2606    38251 /   EquipmentProperty EquipmentProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentProperty"
    ADD CONSTRAINT "EquipmentProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 Y   ALTER TABLE ONLY dt."EquipmentProperty" DROP CONSTRAINT "EquipmentProperty_sensor_fkey";
       dt          postgres    false    3631    210    219            �           2606    38256 4   EquipmentProperty EquipmentProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentProperty"
    ADD CONSTRAINT "EquipmentProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY dt."EquipmentProperty" DROP CONSTRAINT "EquipmentProperty_uomCategory_fkey";
       dt          postgres    false    3910    348    219            �           2606    38261 1   EquipmentProperty EquipmentProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentProperty"
    ADD CONSTRAINT "EquipmentProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 [   ALTER TABLE ONLY dt."EquipmentProperty" DROP CONSTRAINT "EquipmentProperty_valueUom_fkey";
       dt          postgres    false    347    219    3908            �           2606    38266 G   EquipmentRequirementProperty EquipmentRequirementProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentRequirementProperty"
    ADD CONSTRAINT "EquipmentRequirementProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 q   ALTER TABLE ONLY dt."EquipmentRequirementProperty" DROP CONSTRAINT "EquipmentRequirementProperty_category_fkey";
       dt          postgres    false    243    221    3700            �           2606    38271 S   EquipmentRequirementProperty EquipmentRequirementProperty_equipmentRequirement_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentRequirementProperty"
    ADD CONSTRAINT "EquipmentRequirementProperty_equipmentRequirement_fkey" FOREIGN KEY ("equipmentRequirement") REFERENCES dt."EquipmentRequirement"(id) ON DELETE SET NULL;
 }   ALTER TABLE ONLY dt."EquipmentRequirementProperty" DROP CONSTRAINT "EquipmentRequirementProperty_equipmentRequirement_fkey";
       dt          postgres    false    3651    221    220            �           2606    38276 I   EquipmentRequirementProperty EquipmentRequirementProperty_logRateUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentRequirementProperty"
    ADD CONSTRAINT "EquipmentRequirementProperty_logRateUom_fkey" FOREIGN KEY ("logRateUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 s   ALTER TABLE ONLY dt."EquipmentRequirementProperty" DROP CONSTRAINT "EquipmentRequirementProperty_logRateUom_fkey";
       dt          postgres    false    221    3908    347            �           2606    38281 E   EquipmentRequirementProperty EquipmentRequirementProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentRequirementProperty"
    ADD CONSTRAINT "EquipmentRequirementProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."EquipmentRequirementProperty"(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY dt."EquipmentRequirementProperty" DROP CONSTRAINT "EquipmentRequirementProperty_parent_fkey";
       dt          postgres    false    221    221    3653            �           2606    38286 K   EquipmentRequirementProperty EquipmentRequirementProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentRequirementProperty"
    ADD CONSTRAINT "EquipmentRequirementProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 u   ALTER TABLE ONLY dt."EquipmentRequirementProperty" DROP CONSTRAINT "EquipmentRequirementProperty_propertyType_fkey";
       dt          postgres    false    320    221    3854            �           2606    38291 J   EquipmentRequirementProperty EquipmentRequirementProperty_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentRequirementProperty"
    ADD CONSTRAINT "EquipmentRequirementProperty_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 t   ALTER TABLE ONLY dt."EquipmentRequirementProperty" DROP CONSTRAINT "EquipmentRequirementProperty_quantityUom_fkey";
       dt          postgres    false    221    3908    347            �           2606    38296 I   EquipmentRequirementProperty EquipmentRequirementProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentRequirementProperty"
    ADD CONSTRAINT "EquipmentRequirementProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 s   ALTER TABLE ONLY dt."EquipmentRequirementProperty" DROP CONSTRAINT "EquipmentRequirementProperty_sensorType_fkey";
       dt          postgres    false    216    221    3643            �           2606    38301 E   EquipmentRequirementProperty EquipmentRequirementProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentRequirementProperty"
    ADD CONSTRAINT "EquipmentRequirementProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY dt."EquipmentRequirementProperty" DROP CONSTRAINT "EquipmentRequirementProperty_sensor_fkey";
       dt          postgres    false    221    210    3631            �           2606    38306 J   EquipmentRequirementProperty EquipmentRequirementProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentRequirementProperty"
    ADD CONSTRAINT "EquipmentRequirementProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 t   ALTER TABLE ONLY dt."EquipmentRequirementProperty" DROP CONSTRAINT "EquipmentRequirementProperty_uomCategory_fkey";
       dt          postgres    false    221    348    3910            �           2606    38311 G   EquipmentRequirementProperty EquipmentRequirementProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentRequirementProperty"
    ADD CONSTRAINT "EquipmentRequirementProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 q   ALTER TABLE ONLY dt."EquipmentRequirementProperty" DROP CONSTRAINT "EquipmentRequirementProperty_valueUom_fkey";
       dt          postgres    false    347    221    3908            �           2606    38316 @   EquipmentRequirement EquipmentRequirement_alternateResourse_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentRequirement"
    ADD CONSTRAINT "EquipmentRequirement_alternateResourse_fkey" FOREIGN KEY ("alternateResourse") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 j   ALTER TABLE ONLY dt."EquipmentRequirement" DROP CONSTRAINT "EquipmentRequirement_alternateResourse_fkey";
       dt          postgres    false    220    3700    243            �           2606    38321 =   EquipmentRequirement EquipmentRequirement_equipmentClass_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentRequirement"
    ADD CONSTRAINT "EquipmentRequirement_equipmentClass_fkey" FOREIGN KEY ("equipmentClass") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 g   ALTER TABLE ONLY dt."EquipmentRequirement" DROP CONSTRAINT "EquipmentRequirement_equipmentClass_fkey";
       dt          postgres    false    3643    216    220            �           2606    38326 8   EquipmentRequirement EquipmentRequirement_equipment_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentRequirement"
    ADD CONSTRAINT "EquipmentRequirement_equipment_fkey" FOREIGN KEY (equipment) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 b   ALTER TABLE ONLY dt."EquipmentRequirement" DROP CONSTRAINT "EquipmentRequirement_equipment_fkey";
       dt          postgres    false    3631    220    210            �           2606    38331 7   EquipmentRequirement EquipmentRequirement_jobOrder_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentRequirement"
    ADD CONSTRAINT "EquipmentRequirement_jobOrder_fkey" FOREIGN KEY ("jobOrder") REFERENCES dt."JobOrder"(id) ON DELETE SET NULL;
 a   ALTER TABLE ONLY dt."EquipmentRequirement" DROP CONSTRAINT "EquipmentRequirement_jobOrder_fkey";
       dt          postgres    false    239    220    3692            �           2606    38336 :   EquipmentRequirement EquipmentRequirement_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentRequirement"
    ADD CONSTRAINT "EquipmentRequirement_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 d   ALTER TABLE ONLY dt."EquipmentRequirement" DROP CONSTRAINT "EquipmentRequirement_quantityUom_fkey";
       dt          postgres    false    347    3908    220            �           2606    38341 A   EquipmentRequirement EquipmentRequirement_segmentRequirement_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentRequirement"
    ADD CONSTRAINT "EquipmentRequirement_segmentRequirement_fkey" FOREIGN KEY ("segmentRequirement") REFERENCES dt."SegmentRequirement"(id) ON DELETE SET NULL;
 k   ALTER TABLE ONLY dt."EquipmentRequirement" DROP CONSTRAINT "EquipmentRequirement_segmentRequirement_fkey";
       dt          postgres    false    334    220    3882                       2606    38346 j   EquipmentSegmentSpecificationStreamMapping EquipmentSegmentSpecificatio_equipmentSegmentSpecificatio_fkey1    FK CONSTRAINT     
  ALTER TABLE ONLY dt."EquipmentSegmentSpecificationStreamMapping"
    ADD CONSTRAINT "EquipmentSegmentSpecificatio_equipmentSegmentSpecificatio_fkey1" FOREIGN KEY ("equipmentSegmentSpecification") REFERENCES dt."EquipmentSegmentSpecification"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."EquipmentSegmentSpecificationStreamMapping" DROP CONSTRAINT "EquipmentSegmentSpecificatio_equipmentSegmentSpecificatio_fkey1";
       dt          postgres    false    222    224    3655            �           2606    38351 Y   EquipmentSegmentSpecificationProperty EquipmentSegmentSpecificationProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentSegmentSpecificationProperty"
    ADD CONSTRAINT "EquipmentSegmentSpecificationProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."EquipmentSegmentSpecificationProperty" DROP CONSTRAINT "EquipmentSegmentSpecificationProperty_category_fkey";
       dt          postgres    false    3700    223    243            �           2606    38356 W   EquipmentSegmentSpecificationProperty EquipmentSegmentSpecificationProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentSegmentSpecificationProperty"
    ADD CONSTRAINT "EquipmentSegmentSpecificationProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."EquipmentSegmentSpecificationProperty"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."EquipmentSegmentSpecificationProperty" DROP CONSTRAINT "EquipmentSegmentSpecificationProperty_parent_fkey";
       dt          postgres    false    3657    223    223            �           2606    38361 ]   EquipmentSegmentSpecificationProperty EquipmentSegmentSpecificationProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentSegmentSpecificationProperty"
    ADD CONSTRAINT "EquipmentSegmentSpecificationProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."EquipmentSegmentSpecificationProperty" DROP CONSTRAINT "EquipmentSegmentSpecificationProperty_propertyType_fkey";
       dt          postgres    false    223    320    3854            �           2606    38366 \   EquipmentSegmentSpecificationProperty EquipmentSegmentSpecificationProperty_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentSegmentSpecificationProperty"
    ADD CONSTRAINT "EquipmentSegmentSpecificationProperty_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."EquipmentSegmentSpecificationProperty" DROP CONSTRAINT "EquipmentSegmentSpecificationProperty_quantityUom_fkey";
       dt          postgres    false    223    347    3908                        2606    38371 [   EquipmentSegmentSpecificationProperty EquipmentSegmentSpecificationProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentSegmentSpecificationProperty"
    ADD CONSTRAINT "EquipmentSegmentSpecificationProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."EquipmentSegmentSpecificationProperty" DROP CONSTRAINT "EquipmentSegmentSpecificationProperty_sensorType_fkey";
       dt          postgres    false    216    223    3643                       2606    38376 W   EquipmentSegmentSpecificationProperty EquipmentSegmentSpecificationProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentSegmentSpecificationProperty"
    ADD CONSTRAINT "EquipmentSegmentSpecificationProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."EquipmentSegmentSpecificationProperty" DROP CONSTRAINT "EquipmentSegmentSpecificationProperty_sensor_fkey";
       dt          postgres    false    223    210    3631                       2606    38381 \   EquipmentSegmentSpecificationProperty EquipmentSegmentSpecificationProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentSegmentSpecificationProperty"
    ADD CONSTRAINT "EquipmentSegmentSpecificationProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."EquipmentSegmentSpecificationProperty" DROP CONSTRAINT "EquipmentSegmentSpecificationProperty_uomCategory_fkey";
       dt          postgres    false    3910    348    223                       2606    38386 Y   EquipmentSegmentSpecificationProperty EquipmentSegmentSpecificationProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentSegmentSpecificationProperty"
    ADD CONSTRAINT "EquipmentSegmentSpecificationProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."EquipmentSegmentSpecificationProperty" DROP CONSTRAINT "EquipmentSegmentSpecificationProperty_valueUom_fkey";
       dt          postgres    false    223    347    3908                       2606    38391 a   EquipmentSegmentSpecificationStreamMapping EquipmentSegmentSpecificationStreamMapping_stream_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentSegmentSpecificationStreamMapping"
    ADD CONSTRAINT "EquipmentSegmentSpecificationStreamMapping_stream_fkey" FOREIGN KEY (stream) REFERENCES dt."Stream"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."EquipmentSegmentSpecificationStreamMapping" DROP CONSTRAINT "EquipmentSegmentSpecificationStreamMapping_stream_fkey";
       dt          postgres    false    224    343    3900            �           2606    38396 O   EquipmentSegmentSpecification EquipmentSegmentSpecification_equipmentClass_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentSegmentSpecification"
    ADD CONSTRAINT "EquipmentSegmentSpecification_equipmentClass_fkey" FOREIGN KEY ("equipmentClass") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 y   ALTER TABLE ONLY dt."EquipmentSegmentSpecification" DROP CONSTRAINT "EquipmentSegmentSpecification_equipmentClass_fkey";
       dt          postgres    false    222    216    3643                       2606    38401 e   EquipmentSegmentSpecificationProperty EquipmentSegmentSpecification_equipmentSegmentSpecificatio_fkey    FK CONSTRAINT       ALTER TABLE ONLY dt."EquipmentSegmentSpecificationProperty"
    ADD CONSTRAINT "EquipmentSegmentSpecification_equipmentSegmentSpecificatio_fkey" FOREIGN KEY ("equipmentSegmentSpecification") REFERENCES dt."EquipmentSegmentSpecification"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."EquipmentSegmentSpecificationProperty" DROP CONSTRAINT "EquipmentSegmentSpecification_equipmentSegmentSpecificatio_fkey";
       dt          postgres    false    223    222    3655            �           2606    38406 J   EquipmentSegmentSpecification EquipmentSegmentSpecification_equipment_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentSegmentSpecification"
    ADD CONSTRAINT "EquipmentSegmentSpecification_equipment_fkey" FOREIGN KEY (equipment) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 t   ALTER TABLE ONLY dt."EquipmentSegmentSpecification" DROP CONSTRAINT "EquipmentSegmentSpecification_equipment_fkey";
       dt          postgres    false    222    210    3631            �           2606    38411 O   EquipmentSegmentSpecification EquipmentSegmentSpecification_processSegment_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentSegmentSpecification"
    ADD CONSTRAINT "EquipmentSegmentSpecification_processSegment_fkey" FOREIGN KEY ("processSegment") REFERENCES dt."ProcessSegment"(id) ON DELETE SET NULL;
 y   ALTER TABLE ONLY dt."EquipmentSegmentSpecification" DROP CONSTRAINT "EquipmentSegmentSpecification_processSegment_fkey";
       dt          postgres    false    222    315    3844            �           2606    38416 L   EquipmentSegmentSpecification EquipmentSegmentSpecification_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentSegmentSpecification"
    ADD CONSTRAINT "EquipmentSegmentSpecification_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 v   ALTER TABLE ONLY dt."EquipmentSegmentSpecification" DROP CONSTRAINT "EquipmentSegmentSpecification_quantityUom_fkey";
       dt          postgres    false    222    347    3908                       2606    38421 K   EquipmentSpecificationProperty EquipmentSpecificationProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentSpecificationProperty"
    ADD CONSTRAINT "EquipmentSpecificationProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 u   ALTER TABLE ONLY dt."EquipmentSpecificationProperty" DROP CONSTRAINT "EquipmentSpecificationProperty_category_fkey";
       dt          postgres    false    226    243    3700                       2606    38426 Y   EquipmentSpecificationProperty EquipmentSpecificationProperty_equipmentSpecification_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentSpecificationProperty"
    ADD CONSTRAINT "EquipmentSpecificationProperty_equipmentSpecification_fkey" FOREIGN KEY ("equipmentSpecification") REFERENCES dt."EquipmentSpecification"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."EquipmentSpecificationProperty" DROP CONSTRAINT "EquipmentSpecificationProperty_equipmentSpecification_fkey";
       dt          postgres    false    225    3661    226                       2606    38431 M   EquipmentSpecificationProperty EquipmentSpecificationProperty_logRateUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentSpecificationProperty"
    ADD CONSTRAINT "EquipmentSpecificationProperty_logRateUom_fkey" FOREIGN KEY ("logRateUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 w   ALTER TABLE ONLY dt."EquipmentSpecificationProperty" DROP CONSTRAINT "EquipmentSpecificationProperty_logRateUom_fkey";
       dt          postgres    false    347    226    3908                       2606    38436 I   EquipmentSpecificationProperty EquipmentSpecificationProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentSpecificationProperty"
    ADD CONSTRAINT "EquipmentSpecificationProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."EquipmentSpecificationProperty"(id) ON DELETE SET NULL;
 s   ALTER TABLE ONLY dt."EquipmentSpecificationProperty" DROP CONSTRAINT "EquipmentSpecificationProperty_parent_fkey";
       dt          postgres    false    226    3663    226                       2606    38441 O   EquipmentSpecificationProperty EquipmentSpecificationProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentSpecificationProperty"
    ADD CONSTRAINT "EquipmentSpecificationProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 y   ALTER TABLE ONLY dt."EquipmentSpecificationProperty" DROP CONSTRAINT "EquipmentSpecificationProperty_propertyType_fkey";
       dt          postgres    false    3854    320    226                       2606    38446 N   EquipmentSpecificationProperty EquipmentSpecificationProperty_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentSpecificationProperty"
    ADD CONSTRAINT "EquipmentSpecificationProperty_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 x   ALTER TABLE ONLY dt."EquipmentSpecificationProperty" DROP CONSTRAINT "EquipmentSpecificationProperty_quantityUom_fkey";
       dt          postgres    false    226    3908    347                       2606    38451 M   EquipmentSpecificationProperty EquipmentSpecificationProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentSpecificationProperty"
    ADD CONSTRAINT "EquipmentSpecificationProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 w   ALTER TABLE ONLY dt."EquipmentSpecificationProperty" DROP CONSTRAINT "EquipmentSpecificationProperty_sensorType_fkey";
       dt          postgres    false    216    226    3643                       2606    38456 I   EquipmentSpecificationProperty EquipmentSpecificationProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentSpecificationProperty"
    ADD CONSTRAINT "EquipmentSpecificationProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 s   ALTER TABLE ONLY dt."EquipmentSpecificationProperty" DROP CONSTRAINT "EquipmentSpecificationProperty_sensor_fkey";
       dt          postgres    false    226    210    3631                       2606    38461 N   EquipmentSpecificationProperty EquipmentSpecificationProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentSpecificationProperty"
    ADD CONSTRAINT "EquipmentSpecificationProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 x   ALTER TABLE ONLY dt."EquipmentSpecificationProperty" DROP CONSTRAINT "EquipmentSpecificationProperty_uomCategory_fkey";
       dt          postgres    false    3910    226    348                       2606    38466 K   EquipmentSpecificationProperty EquipmentSpecificationProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentSpecificationProperty"
    ADD CONSTRAINT "EquipmentSpecificationProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 u   ALTER TABLE ONLY dt."EquipmentSpecificationProperty" DROP CONSTRAINT "EquipmentSpecificationProperty_valueUom_fkey";
       dt          postgres    false    226    3908    347                       2606    38471 A   EquipmentSpecification EquipmentSpecification_equipmentClass_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentSpecification"
    ADD CONSTRAINT "EquipmentSpecification_equipmentClass_fkey" FOREIGN KEY ("equipmentClass") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 k   ALTER TABLE ONLY dt."EquipmentSpecification" DROP CONSTRAINT "EquipmentSpecification_equipmentClass_fkey";
       dt          postgres    false    216    3643    225                       2606    38476 <   EquipmentSpecification EquipmentSpecification_equipment_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentSpecification"
    ADD CONSTRAINT "EquipmentSpecification_equipment_fkey" FOREIGN KEY (equipment) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 f   ALTER TABLE ONLY dt."EquipmentSpecification" DROP CONSTRAINT "EquipmentSpecification_equipment_fkey";
       dt          postgres    false    210    225    3631            	           2606    38481 D   EquipmentSpecification EquipmentSpecification_operationsSegment_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentSpecification"
    ADD CONSTRAINT "EquipmentSpecification_operationsSegment_fkey" FOREIGN KEY ("operationsSegment") REFERENCES dt."OperationsSegment"(id) ON DELETE SET NULL;
 n   ALTER TABLE ONLY dt."EquipmentSpecification" DROP CONSTRAINT "EquipmentSpecification_operationsSegment_fkey";
       dt          postgres    false    3778    282    225            
           2606    38486 >   EquipmentSpecification EquipmentSpecification_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentSpecification"
    ADD CONSTRAINT "EquipmentSpecification_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 h   ALTER TABLE ONLY dt."EquipmentSpecification" DROP CONSTRAINT "EquipmentSpecification_quantityUom_fkey";
       dt          postgres    false    3908    225    347                       2606    38491 =   EquipmentSpecification EquipmentSpecification_workMaster_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EquipmentSpecification"
    ADD CONSTRAINT "EquipmentSpecification_workMaster_fkey" FOREIGN KEY ("workMaster") REFERENCES dt."WorkMaster"(id) ON DELETE SET NULL;
 g   ALTER TABLE ONLY dt."EquipmentSpecification" DROP CONSTRAINT "EquipmentSpecification_workMaster_fkey";
       dt          postgres    false    3940    225    363            �           2606    38496 '   Equipment Equipment_equipmentLevel_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."Equipment"
    ADD CONSTRAINT "Equipment_equipmentLevel_fkey" FOREIGN KEY ("equipmentLevel") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 Q   ALTER TABLE ONLY dt."Equipment" DROP CONSTRAINT "Equipment_equipmentLevel_fkey";
       dt          postgres    false    243    3700    210            �           2606    38501    Equipment Equipment_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."Equipment"
    ADD CONSTRAINT "Equipment_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 I   ALTER TABLE ONLY dt."Equipment" DROP CONSTRAINT "Equipment_parent_fkey";
       dt          postgres    false    210    3631    210            �           2606    38506 #   Equipment Equipment_recordType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."Equipment"
    ADD CONSTRAINT "Equipment_recordType_fkey" FOREIGN KEY ("recordType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 M   ALTER TABLE ONLY dt."Equipment" DROP CONSTRAINT "Equipment_recordType_fkey";
       dt          postgres    false    210    3700    243                       2606    38511 ,   EventRoute EventRoute_eventTypeInstance_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EventRoute"
    ADD CONSTRAINT "EventRoute_eventTypeInstance_fkey" FOREIGN KEY ("eventTypeInstance") REFERENCES dt."EventTypeInstance"(id) ON DELETE SET NULL;
 V   ALTER TABLE ONLY dt."EventRoute" DROP CONSTRAINT "EventRoute_eventTypeInstance_fkey";
       dt          postgres    false    230    228    3672                       2606    38516 J   EventTypeInstanceProperty EventTypeInstanceProperty_eventTypeInstance_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EventTypeInstanceProperty"
    ADD CONSTRAINT "EventTypeInstanceProperty_eventTypeInstance_fkey" FOREIGN KEY ("eventTypeInstance") REFERENCES dt."EventTypeInstance"(id) ON DELETE SET NULL;
 t   ALTER TABLE ONLY dt."EventTypeInstanceProperty" DROP CONSTRAINT "EventTypeInstanceProperty_eventTypeInstance_fkey";
       dt          postgres    false    3672    230    231                       2606    38521 J   EventTypeInstanceProperty EventTypeInstanceProperty_eventTypeProperty_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EventTypeInstanceProperty"
    ADD CONSTRAINT "EventTypeInstanceProperty_eventTypeProperty_fkey" FOREIGN KEY ("eventTypeProperty") REFERENCES dt."EventTypeProperty"(id) ON DELETE SET NULL;
 t   ALTER TABLE ONLY dt."EventTypeInstanceProperty" DROP CONSTRAINT "EventTypeInstanceProperty_eventTypeProperty_fkey";
       dt          postgres    false    231    3677    232                       2606    38526 A   EventTypeInstance EventTypeInstance_associatedDTObjectEntity_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EventTypeInstance"
    ADD CONSTRAINT "EventTypeInstance_associatedDTObjectEntity_fkey" FOREIGN KEY ("associatedDTObjectEntity") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 k   ALTER TABLE ONLY dt."EventTypeInstance" DROP CONSTRAINT "EventTypeInstance_associatedDTObjectEntity_fkey";
       dt          postgres    false    3700    230    243                       2606    38531 2   EventTypeInstance EventTypeInstance_eventType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EventTypeInstance"
    ADD CONSTRAINT "EventTypeInstance_eventType_fkey" FOREIGN KEY ("eventType") REFERENCES dt."EventType"(id) ON DELETE SET NULL;
 \   ALTER TABLE ONLY dt."EventTypeInstance" DROP CONSTRAINT "EventTypeInstance_eventType_fkey";
       dt          postgres    false    229    230    3669                        2606    38536 1   EventTypeProperty EventTypeProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EventTypeProperty"
    ADD CONSTRAINT "EventTypeProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 [   ALTER TABLE ONLY dt."EventTypeProperty" DROP CONSTRAINT "EventTypeProperty_category_fkey";
       dt          postgres    false    232    3700    243            !           2606    38541 2   EventTypeProperty EventTypeProperty_eventType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EventTypeProperty"
    ADD CONSTRAINT "EventTypeProperty_eventType_fkey" FOREIGN KEY ("eventType") REFERENCES dt."EventType"(id) ON DELETE SET NULL;
 \   ALTER TABLE ONLY dt."EventTypeProperty" DROP CONSTRAINT "EventTypeProperty_eventType_fkey";
       dt          postgres    false    229    3669    232            "           2606    38546 1   EventTypeProperty EventTypeProperty_flowMeta_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EventTypeProperty"
    ADD CONSTRAINT "EventTypeProperty_flowMeta_fkey" FOREIGN KEY ("flowMeta") REFERENCES dt."FlowMeta"(id) ON DELETE SET NULL;
 [   ALTER TABLE ONLY dt."EventTypeProperty" DROP CONSTRAINT "EventTypeProperty_flowMeta_fkey";
       dt          postgres    false    233    3679    232            #           2606    38551 5   EventTypeProperty EventTypeProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EventTypeProperty"
    ADD CONSTRAINT "EventTypeProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 _   ALTER TABLE ONLY dt."EventTypeProperty" DROP CONSTRAINT "EventTypeProperty_propertyType_fkey";
       dt          postgres    false    3700    243    232                       2606    38556 /   EventType EventType_associatedDTObjectType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EventType"
    ADD CONSTRAINT "EventType_associatedDTObjectType_fkey" FOREIGN KEY ("associatedDTObjectType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 Y   ALTER TABLE ONLY dt."EventType" DROP CONSTRAINT "EventType_associatedDTObjectType_fkey";
       dt          postgres    false    229    243    3700                       2606    38561 &   EventType EventType_eventCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EventType"
    ADD CONSTRAINT "EventType_eventCategory_fkey" FOREIGN KEY ("eventCategory") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 P   ALTER TABLE ONLY dt."EventType" DROP CONSTRAINT "EventType_eventCategory_fkey";
       dt          postgres    false    229    3700    243                       2606    38566 )   EventType EventType_notificationType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EventType"
    ADD CONSTRAINT "EventType_notificationType_fkey" FOREIGN KEY ("notificationType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 S   ALTER TABLE ONLY dt."EventType" DROP CONSTRAINT "EventType_notificationType_fkey";
       dt          postgres    false    229    3700    243                       2606    38571    EventType EventType_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EventType"
    ADD CONSTRAINT "EventType_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."EventType"(id) ON DELETE SET NULL;
 I   ALTER TABLE ONLY dt."EventType" DROP CONSTRAINT "EventType_parent_fkey";
       dt          postgres    false    229    3669    229                       2606    38576 #   EventType EventType_recordType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."EventType"
    ADD CONSTRAINT "EventType_recordType_fkey" FOREIGN KEY ("recordType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 M   ALTER TABLE ONLY dt."EventType" DROP CONSTRAINT "EventType_recordType_fkey";
       dt          postgres    false    229    243    3700            $           2606    38581    FlowMeta FlowMeta_flowType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."FlowMeta"
    ADD CONSTRAINT "FlowMeta_flowType_fkey" FOREIGN KEY ("flowType") REFERENCES dt."FlowType"(id) ON DELETE SET NULL;
 I   ALTER TABLE ONLY dt."FlowMeta" DROP CONSTRAINT "FlowMeta_flowType_fkey";
       dt          postgres    false    234    233    3681            %           2606    38586 !   FlowType FlowType_eventTypes_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."FlowType"
    ADD CONSTRAINT "FlowType_eventTypes_fkey" FOREIGN KEY ("eventTypes") REFERENCES dt."EventType"(id) ON DELETE SET NULL;
 K   ALTER TABLE ONLY dt."FlowType" DROP CONSTRAINT "FlowType_eventTypes_fkey";
       dt          postgres    false    3669    229    234            (           2606    38591 I   FromResourceReferenceProperty FromResourceReferenceProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."FromResourceReferenceProperty"
    ADD CONSTRAINT "FromResourceReferenceProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 s   ALTER TABLE ONLY dt."FromResourceReferenceProperty" DROP CONSTRAINT "FromResourceReferenceProperty_category_fkey";
       dt          postgres    false    243    3700    236            )           2606    38596 V   FromResourceReferenceProperty FromResourceReferenceProperty_fromResourceReference_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."FromResourceReferenceProperty"
    ADD CONSTRAINT "FromResourceReferenceProperty_fromResourceReference_fkey" FOREIGN KEY ("fromResourceReference") REFERENCES dt."FromResourceReference"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."FromResourceReferenceProperty" DROP CONSTRAINT "FromResourceReferenceProperty_fromResourceReference_fkey";
       dt          postgres    false    3684    235    236            *           2606    38601 G   FromResourceReferenceProperty FromResourceReferenceProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."FromResourceReferenceProperty"
    ADD CONSTRAINT "FromResourceReferenceProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."FromResourceReferenceProperty"(id) ON DELETE SET NULL;
 q   ALTER TABLE ONLY dt."FromResourceReferenceProperty" DROP CONSTRAINT "FromResourceReferenceProperty_parent_fkey";
       dt          postgres    false    236    236    3686            +           2606    38606 M   FromResourceReferenceProperty FromResourceReferenceProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."FromResourceReferenceProperty"
    ADD CONSTRAINT "FromResourceReferenceProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 w   ALTER TABLE ONLY dt."FromResourceReferenceProperty" DROP CONSTRAINT "FromResourceReferenceProperty_propertyType_fkey";
       dt          postgres    false    3854    236    320            ,           2606    38611 K   FromResourceReferenceProperty FromResourceReferenceProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."FromResourceReferenceProperty"
    ADD CONSTRAINT "FromResourceReferenceProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 u   ALTER TABLE ONLY dt."FromResourceReferenceProperty" DROP CONSTRAINT "FromResourceReferenceProperty_sensorType_fkey";
       dt          postgres    false    216    236    3643            -           2606    38616 G   FromResourceReferenceProperty FromResourceReferenceProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."FromResourceReferenceProperty"
    ADD CONSTRAINT "FromResourceReferenceProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 q   ALTER TABLE ONLY dt."FromResourceReferenceProperty" DROP CONSTRAINT "FromResourceReferenceProperty_sensor_fkey";
       dt          postgres    false    210    236    3631            .           2606    38621 L   FromResourceReferenceProperty FromResourceReferenceProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."FromResourceReferenceProperty"
    ADD CONSTRAINT "FromResourceReferenceProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 v   ALTER TABLE ONLY dt."FromResourceReferenceProperty" DROP CONSTRAINT "FromResourceReferenceProperty_uomCategory_fkey";
       dt          postgres    false    348    236    3910            /           2606    38626 I   FromResourceReferenceProperty FromResourceReferenceProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."FromResourceReferenceProperty"
    ADD CONSTRAINT "FromResourceReferenceProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 s   ALTER TABLE ONLY dt."FromResourceReferenceProperty" DROP CONSTRAINT "FromResourceReferenceProperty_valueUom_fkey";
       dt          postgres    false    347    236    3908            &           2606    38631 J   FromResourceReference FromResourceReference_resourceNetworkConnection_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."FromResourceReference"
    ADD CONSTRAINT "FromResourceReference_resourceNetworkConnection_fkey" FOREIGN KEY ("resourceNetworkConnection") REFERENCES dt."ResourceNetworkConnection"(id) ON DELETE SET NULL;
 t   ALTER TABLE ONLY dt."FromResourceReference" DROP CONSTRAINT "FromResourceReference_resourceNetworkConnection_fkey";
       dt          postgres    false    327    235    3868            '           2606    38636 =   FromResourceReference FromResourceReference_resourceType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."FromResourceReference"
    ADD CONSTRAINT "FromResourceReference_resourceType_fkey" FOREIGN KEY ("resourceType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 g   ALTER TABLE ONLY dt."FromResourceReference" DROP CONSTRAINT "FromResourceReference_resourceType_fkey";
       dt          postgres    false    3700    235    243            2           2606    38641 -   JobListProperty JobListProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."JobListProperty"
    ADD CONSTRAINT "JobListProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 W   ALTER TABLE ONLY dt."JobListProperty" DROP CONSTRAINT "JobListProperty_category_fkey";
       dt          postgres    false    238    243    3700            3           2606    38646 ,   JobListProperty JobListProperty_jobList_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."JobListProperty"
    ADD CONSTRAINT "JobListProperty_jobList_fkey" FOREIGN KEY ("jobList") REFERENCES dt."JobList"(id) ON DELETE SET NULL;
 V   ALTER TABLE ONLY dt."JobListProperty" DROP CONSTRAINT "JobListProperty_jobList_fkey";
       dt          postgres    false    3688    238    237            4           2606    38651 +   JobListProperty JobListProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."JobListProperty"
    ADD CONSTRAINT "JobListProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."JobListProperty"(id) ON DELETE SET NULL;
 U   ALTER TABLE ONLY dt."JobListProperty" DROP CONSTRAINT "JobListProperty_parent_fkey";
       dt          postgres    false    238    238    3690            5           2606    38656 1   JobListProperty JobListProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."JobListProperty"
    ADD CONSTRAINT "JobListProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 [   ALTER TABLE ONLY dt."JobListProperty" DROP CONSTRAINT "JobListProperty_propertyType_fkey";
       dt          postgres    false    320    238    3854            6           2606    38661 /   JobListProperty JobListProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."JobListProperty"
    ADD CONSTRAINT "JobListProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 Y   ALTER TABLE ONLY dt."JobListProperty" DROP CONSTRAINT "JobListProperty_sensorType_fkey";
       dt          postgres    false    216    238    3643            7           2606    38666 +   JobListProperty JobListProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."JobListProperty"
    ADD CONSTRAINT "JobListProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 U   ALTER TABLE ONLY dt."JobListProperty" DROP CONSTRAINT "JobListProperty_sensor_fkey";
       dt          postgres    false    210    238    3631            8           2606    38671 0   JobListProperty JobListProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."JobListProperty"
    ADD CONSTRAINT "JobListProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 Z   ALTER TABLE ONLY dt."JobListProperty" DROP CONSTRAINT "JobListProperty_uomCategory_fkey";
       dt          postgres    false    348    238    3910            9           2606    38676 -   JobListProperty JobListProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."JobListProperty"
    ADD CONSTRAINT "JobListProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 W   ALTER TABLE ONLY dt."JobListProperty" DROP CONSTRAINT "JobListProperty_valueUom_fkey";
       dt          postgres    false    347    238    3908            0           2606    38681 #   JobList JobList_hierarchyScope_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."JobList"
    ADD CONSTRAINT "JobList_hierarchyScope_fkey" FOREIGN KEY ("hierarchyScope") REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 M   ALTER TABLE ONLY dt."JobList" DROP CONSTRAINT "JobList_hierarchyScope_fkey";
       dt          postgres    false    3631    210    237            1           2606    38686    JobList JobList_workType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."JobList"
    ADD CONSTRAINT "JobList_workType_fkey" FOREIGN KEY ("workType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 G   ALTER TABLE ONLY dt."JobList" DROP CONSTRAINT "JobList_workType_fkey";
       dt          postgres    false    3700    237    243            A           2606    38691 1   JobOrderParameter JobOrderParameter_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."JobOrderParameter"
    ADD CONSTRAINT "JobOrderParameter_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 [   ALTER TABLE ONLY dt."JobOrderParameter" DROP CONSTRAINT "JobOrderParameter_category_fkey";
       dt          postgres    false    243    3700    240            B           2606    38696 1   JobOrderParameter JobOrderParameter_jobOrder_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."JobOrderParameter"
    ADD CONSTRAINT "JobOrderParameter_jobOrder_fkey" FOREIGN KEY ("jobOrder") REFERENCES dt."JobOrder"(id) ON DELETE SET NULL;
 [   ALTER TABLE ONLY dt."JobOrderParameter" DROP CONSTRAINT "JobOrderParameter_jobOrder_fkey";
       dt          postgres    false    240    239    3692            C           2606    38701 /   JobOrderParameter JobOrderParameter_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."JobOrderParameter"
    ADD CONSTRAINT "JobOrderParameter_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."JobOrderParameter"(id) ON DELETE SET NULL;
 Y   ALTER TABLE ONLY dt."JobOrderParameter" DROP CONSTRAINT "JobOrderParameter_parent_fkey";
       dt          postgres    false    3694    240    240            D           2606    38706 5   JobOrderParameter JobOrderParameter_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."JobOrderParameter"
    ADD CONSTRAINT "JobOrderParameter_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 _   ALTER TABLE ONLY dt."JobOrderParameter" DROP CONSTRAINT "JobOrderParameter_propertyType_fkey";
       dt          postgres    false    3854    240    320            E           2606    38711 3   JobOrderParameter JobOrderParameter_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."JobOrderParameter"
    ADD CONSTRAINT "JobOrderParameter_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 ]   ALTER TABLE ONLY dt."JobOrderParameter" DROP CONSTRAINT "JobOrderParameter_sensorType_fkey";
       dt          postgres    false    240    3643    216            F           2606    38716 /   JobOrderParameter JobOrderParameter_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."JobOrderParameter"
    ADD CONSTRAINT "JobOrderParameter_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 Y   ALTER TABLE ONLY dt."JobOrderParameter" DROP CONSTRAINT "JobOrderParameter_sensor_fkey";
       dt          postgres    false    240    3631    210            G           2606    38721 4   JobOrderParameter JobOrderParameter_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."JobOrderParameter"
    ADD CONSTRAINT "JobOrderParameter_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY dt."JobOrderParameter" DROP CONSTRAINT "JobOrderParameter_uomCategory_fkey";
       dt          postgres    false    240    3910    348            H           2606    38726 1   JobOrderParameter JobOrderParameter_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."JobOrderParameter"
    ADD CONSTRAINT "JobOrderParameter_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 [   ALTER TABLE ONLY dt."JobOrderParameter" DROP CONSTRAINT "JobOrderParameter_valueUom_fkey";
       dt          postgres    false    240    347    3908            :           2606    38731 %   JobOrder JobOrder_dispatchStatus_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."JobOrder"
    ADD CONSTRAINT "JobOrder_dispatchStatus_fkey" FOREIGN KEY ("dispatchStatus") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 O   ALTER TABLE ONLY dt."JobOrder" DROP CONSTRAINT "JobOrder_dispatchStatus_fkey";
       dt          postgres    false    239    3700    243            ;           2606    38736 %   JobOrder JobOrder_hierarchyScope_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."JobOrder"
    ADD CONSTRAINT "JobOrder_hierarchyScope_fkey" FOREIGN KEY ("hierarchyScope") REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 O   ALTER TABLE ONLY dt."JobOrder" DROP CONSTRAINT "JobOrder_hierarchyScope_fkey";
       dt          postgres    false    3631    239    210            <           2606    38741    JobOrder JobOrder_jobList_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."JobOrder"
    ADD CONSTRAINT "JobOrder_jobList_fkey" FOREIGN KEY ("jobList") REFERENCES dt."JobList"(id) ON DELETE SET NULL;
 H   ALTER TABLE ONLY dt."JobOrder" DROP CONSTRAINT "JobOrder_jobList_fkey";
       dt          postgres    false    239    3688    237            =           2606    38746    JobOrder JobOrder_priority_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."JobOrder"
    ADD CONSTRAINT "JobOrder_priority_fkey" FOREIGN KEY (priority) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 I   ALTER TABLE ONLY dt."JobOrder" DROP CONSTRAINT "JobOrder_priority_fkey";
       dt          postgres    false    3700    239    243            >           2606    38751 !   JobOrder JobOrder_workMaster_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."JobOrder"
    ADD CONSTRAINT "JobOrder_workMaster_fkey" FOREIGN KEY ("workMaster") REFERENCES dt."WorkMaster"(id) ON DELETE SET NULL;
 K   ALTER TABLE ONLY dt."JobOrder" DROP CONSTRAINT "JobOrder_workMaster_fkey";
       dt          postgres    false    3940    363    239            ?           2606    38756 "   JobOrder JobOrder_workRequest_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."JobOrder"
    ADD CONSTRAINT "JobOrder_workRequest_fkey" FOREIGN KEY ("workRequest") REFERENCES dt."WorkRequest"(id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY dt."JobOrder" DROP CONSTRAINT "JobOrder_workRequest_fkey";
       dt          postgres    false    239    3950    368            @           2606    38761    JobOrder JobOrder_workType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."JobOrder"
    ADD CONSTRAINT "JobOrder_workType_fkey" FOREIGN KEY ("workType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 I   ALTER TABLE ONLY dt."JobOrder" DROP CONSTRAINT "JobOrder_workType_fkey";
       dt          postgres    false    243    3700    239            P           2606    38766 -   JobResponseData JobResponseData_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."JobResponseData"
    ADD CONSTRAINT "JobResponseData_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 W   ALTER TABLE ONLY dt."JobResponseData" DROP CONSTRAINT "JobResponseData_category_fkey";
       dt          postgres    false    3700    243    242            Q           2606    38771 0   JobResponseData JobResponseData_jobResponse_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."JobResponseData"
    ADD CONSTRAINT "JobResponseData_jobResponse_fkey" FOREIGN KEY ("jobResponse") REFERENCES dt."JobResponse"(id) ON DELETE SET NULL;
 Z   ALTER TABLE ONLY dt."JobResponseData" DROP CONSTRAINT "JobResponseData_jobResponse_fkey";
       dt          postgres    false    241    242    3696            R           2606    38776 +   JobResponseData JobResponseData_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."JobResponseData"
    ADD CONSTRAINT "JobResponseData_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."JobResponseData"(id) ON DELETE SET NULL;
 U   ALTER TABLE ONLY dt."JobResponseData" DROP CONSTRAINT "JobResponseData_parent_fkey";
       dt          postgres    false    242    3698    242            S           2606    38781 1   JobResponseData JobResponseData_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."JobResponseData"
    ADD CONSTRAINT "JobResponseData_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 [   ALTER TABLE ONLY dt."JobResponseData" DROP CONSTRAINT "JobResponseData_propertyType_fkey";
       dt          postgres    false    320    242    3854            T           2606    38786 /   JobResponseData JobResponseData_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."JobResponseData"
    ADD CONSTRAINT "JobResponseData_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 Y   ALTER TABLE ONLY dt."JobResponseData" DROP CONSTRAINT "JobResponseData_sensorType_fkey";
       dt          postgres    false    242    216    3643            U           2606    38791 +   JobResponseData JobResponseData_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."JobResponseData"
    ADD CONSTRAINT "JobResponseData_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 U   ALTER TABLE ONLY dt."JobResponseData" DROP CONSTRAINT "JobResponseData_sensor_fkey";
       dt          postgres    false    242    3631    210            V           2606    38796 0   JobResponseData JobResponseData_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."JobResponseData"
    ADD CONSTRAINT "JobResponseData_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 Z   ALTER TABLE ONLY dt."JobResponseData" DROP CONSTRAINT "JobResponseData_uomCategory_fkey";
       dt          postgres    false    3910    242    348            W           2606    38801 -   JobResponseData JobResponseData_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."JobResponseData"
    ADD CONSTRAINT "JobResponseData_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 W   ALTER TABLE ONLY dt."JobResponseData" DROP CONSTRAINT "JobResponseData_valueUom_fkey";
       dt          postgres    false    3908    347    242            I           2606    38806 +   JobResponse JobResponse_hierarchyScope_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."JobResponse"
    ADD CONSTRAINT "JobResponse_hierarchyScope_fkey" FOREIGN KEY ("hierarchyScope") REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 U   ALTER TABLE ONLY dt."JobResponse" DROP CONSTRAINT "JobResponse_hierarchyScope_fkey";
       dt          postgres    false    3631    210    241            J           2606    38811 %   JobResponse JobResponse_jobOrder_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."JobResponse"
    ADD CONSTRAINT "JobResponse_jobOrder_fkey" FOREIGN KEY ("jobOrder") REFERENCES dt."JobOrder"(id) ON DELETE SET NULL;
 O   ALTER TABLE ONLY dt."JobResponse" DROP CONSTRAINT "JobResponse_jobOrder_fkey";
       dt          postgres    false    3692    241    239            K           2606    38816 #   JobResponse JobResponse_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."JobResponse"
    ADD CONSTRAINT "JobResponse_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."JobResponse"(id) ON DELETE SET NULL;
 M   ALTER TABLE ONLY dt."JobResponse" DROP CONSTRAINT "JobResponse_parent_fkey";
       dt          postgres    false    3696    241    241            L           2606    38821 +   JobResponse JobResponse_responseStatus_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."JobResponse"
    ADD CONSTRAINT "JobResponse_responseStatus_fkey" FOREIGN KEY ("responseStatus") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 U   ALTER TABLE ONLY dt."JobResponse" DROP CONSTRAINT "JobResponse_responseStatus_fkey";
       dt          postgres    false    241    3700    243            M           2606    38826 '   JobResponse JobResponse_workMaster_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."JobResponse"
    ADD CONSTRAINT "JobResponse_workMaster_fkey" FOREIGN KEY ("workMaster") REFERENCES dt."WorkMaster"(id) ON DELETE SET NULL;
 Q   ALTER TABLE ONLY dt."JobResponse" DROP CONSTRAINT "JobResponse_workMaster_fkey";
       dt          postgres    false    3940    241    363            N           2606    38831 )   JobResponse JobResponse_workResponse_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."JobResponse"
    ADD CONSTRAINT "JobResponse_workResponse_fkey" FOREIGN KEY ("workResponse") REFERENCES dt."WorkResponse"(id) ON DELETE SET NULL;
 S   ALTER TABLE ONLY dt."JobResponse" DROP CONSTRAINT "JobResponse_workResponse_fkey";
       dt          postgres    false    370    3954    241            O           2606    38836 %   JobResponse JobResponse_workType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."JobResponse"
    ADD CONSTRAINT "JobResponse_workType_fkey" FOREIGN KEY ("workType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 O   ALTER TABLE ONLY dt."JobResponse" DROP CONSTRAINT "JobResponse_workType_fkey";
       dt          postgres    false    243    241    3700            X           2606    38841    Lookup Lookup_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."Lookup"
    ADD CONSTRAINT "Lookup_category_fkey" FOREIGN KEY (category) REFERENCES dt."LookupCategory"(id) ON DELETE SET NULL;
 E   ALTER TABLE ONLY dt."Lookup" DROP CONSTRAINT "Lookup_category_fkey";
       dt          postgres    false    243    3702    244            Y           2606    38846    Lookup Lookup_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."Lookup"
    ADD CONSTRAINT "Lookup_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 C   ALTER TABLE ONLY dt."Lookup" DROP CONSTRAINT "Lookup_parent_fkey";
       dt          postgres    false    3700    243    243            g           2606    38851 ;   MaterialActualProperty MaterialActualProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialActualProperty"
    ADD CONSTRAINT "MaterialActualProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."MaterialActualProperty" DROP CONSTRAINT "MaterialActualProperty_category_fkey";
       dt          postgres    false    246    3700    243            h           2606    38856 A   MaterialActualProperty MaterialActualProperty_materialActual_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialActualProperty"
    ADD CONSTRAINT "MaterialActualProperty_materialActual_fkey" FOREIGN KEY ("materialActual") REFERENCES dt."MaterialActual"(id) ON DELETE SET NULL;
 k   ALTER TABLE ONLY dt."MaterialActualProperty" DROP CONSTRAINT "MaterialActualProperty_materialActual_fkey";
       dt          postgres    false    3704    246    245            i           2606    38861 9   MaterialActualProperty MaterialActualProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialActualProperty"
    ADD CONSTRAINT "MaterialActualProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."MaterialActualProperty"(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY dt."MaterialActualProperty" DROP CONSTRAINT "MaterialActualProperty_parent_fkey";
       dt          postgres    false    246    3706    246            j           2606    38866 ?   MaterialActualProperty MaterialActualProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialActualProperty"
    ADD CONSTRAINT "MaterialActualProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 i   ALTER TABLE ONLY dt."MaterialActualProperty" DROP CONSTRAINT "MaterialActualProperty_propertyType_fkey";
       dt          postgres    false    320    246    3854            k           2606    38871 >   MaterialActualProperty MaterialActualProperty_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialActualProperty"
    ADD CONSTRAINT "MaterialActualProperty_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 h   ALTER TABLE ONLY dt."MaterialActualProperty" DROP CONSTRAINT "MaterialActualProperty_quantityUom_fkey";
       dt          postgres    false    3908    246    347            l           2606    38876 =   MaterialActualProperty MaterialActualProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialActualProperty"
    ADD CONSTRAINT "MaterialActualProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 g   ALTER TABLE ONLY dt."MaterialActualProperty" DROP CONSTRAINT "MaterialActualProperty_sensorType_fkey";
       dt          postgres    false    3643    216    246            m           2606    38881 9   MaterialActualProperty MaterialActualProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialActualProperty"
    ADD CONSTRAINT "MaterialActualProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY dt."MaterialActualProperty" DROP CONSTRAINT "MaterialActualProperty_sensor_fkey";
       dt          postgres    false    3631    246    210            n           2606    38886 >   MaterialActualProperty MaterialActualProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialActualProperty"
    ADD CONSTRAINT "MaterialActualProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 h   ALTER TABLE ONLY dt."MaterialActualProperty" DROP CONSTRAINT "MaterialActualProperty_uomCategory_fkey";
       dt          postgres    false    3910    246    348            o           2606    38891 ;   MaterialActualProperty MaterialActualProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialActualProperty"
    ADD CONSTRAINT "MaterialActualProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."MaterialActualProperty" DROP CONSTRAINT "MaterialActualProperty_valueUom_fkey";
       dt          postgres    false    347    246    3908            Z           2606    38896 7   MaterialActual MaterialActual_assemblyRelationship_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialActual"
    ADD CONSTRAINT "MaterialActual_assemblyRelationship_fkey" FOREIGN KEY ("assemblyRelationship") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 a   ALTER TABLE ONLY dt."MaterialActual" DROP CONSTRAINT "MaterialActual_assemblyRelationship_fkey";
       dt          postgres    false    3700    243    245            [           2606    38901 /   MaterialActual MaterialActual_assemblyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialActual"
    ADD CONSTRAINT "MaterialActual_assemblyType_fkey" FOREIGN KEY ("assemblyType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 Y   ALTER TABLE ONLY dt."MaterialActual" DROP CONSTRAINT "MaterialActual_assemblyType_fkey";
       dt          postgres    false    245    243    3700            \           2606    38906 .   MaterialActual MaterialActual_jobResponse_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialActual"
    ADD CONSTRAINT "MaterialActual_jobResponse_fkey" FOREIGN KEY ("jobResponse") REFERENCES dt."JobResponse"(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY dt."MaterialActual" DROP CONSTRAINT "MaterialActual_jobResponse_fkey";
       dt          postgres    false    245    241    3696            ]           2606    38911 0   MaterialActual MaterialActual_materialClass_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialActual"
    ADD CONSTRAINT "MaterialActual_materialClass_fkey" FOREIGN KEY ("materialClass") REFERENCES dt."MaterialClass"(id) ON DELETE SET NULL;
 Z   ALTER TABLE ONLY dt."MaterialActual" DROP CONSTRAINT "MaterialActual_materialClass_fkey";
       dt          postgres    false    245    3714    250            ^           2606    38916 5   MaterialActual MaterialActual_materialDefinition_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialActual"
    ADD CONSTRAINT "MaterialActual_materialDefinition_fkey" FOREIGN KEY ("materialDefinition") REFERENCES dt."MaterialDefinition"(id) ON DELETE SET NULL;
 _   ALTER TABLE ONLY dt."MaterialActual" DROP CONSTRAINT "MaterialActual_materialDefinition_fkey";
       dt          postgres    false    245    3720    253            _           2606    38921 .   MaterialActual MaterialActual_materialLot_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialActual"
    ADD CONSTRAINT "MaterialActual_materialLot_fkey" FOREIGN KEY ("materialLot") REFERENCES dt."MaterialLot"(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY dt."MaterialActual" DROP CONSTRAINT "MaterialActual_materialLot_fkey";
       dt          postgres    false    245    3724    255            `           2606    38926 1   MaterialActual MaterialActual_materialSubLot_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialActual"
    ADD CONSTRAINT "MaterialActual_materialSubLot_fkey" FOREIGN KEY ("materialSubLot") REFERENCES dt."MaterialSubLot"(id) ON DELETE SET NULL;
 [   ALTER TABLE ONLY dt."MaterialActual" DROP CONSTRAINT "MaterialActual_materialSubLot_fkey";
       dt          postgres    false    265    3744    245            a           2606    38931 )   MaterialActual MaterialActual_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialActual"
    ADD CONSTRAINT "MaterialActual_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."MaterialActual"(id) ON DELETE SET NULL;
 S   ALTER TABLE ONLY dt."MaterialActual" DROP CONSTRAINT "MaterialActual_parent_fkey";
       dt          postgres    false    245    3704    245            b           2606    38936 .   MaterialActual MaterialActual_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialActual"
    ADD CONSTRAINT "MaterialActual_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY dt."MaterialActual" DROP CONSTRAINT "MaterialActual_quantityUom_fkey";
       dt          postgres    false    3908    245    347            c           2606    38941 .   MaterialActual MaterialActual_resourceUse_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialActual"
    ADD CONSTRAINT "MaterialActual_resourceUse_fkey" FOREIGN KEY ("resourceUse") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY dt."MaterialActual" DROP CONSTRAINT "MaterialActual_resourceUse_fkey";
       dt          postgres    false    245    243    3700            d           2606    38946 2   MaterialActual MaterialActual_segmentResponse_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialActual"
    ADD CONSTRAINT "MaterialActual_segmentResponse_fkey" FOREIGN KEY ("segmentResponse") REFERENCES dt."SegmentResponse"(id) ON DELETE SET NULL;
 \   ALTER TABLE ONLY dt."MaterialActual" DROP CONSTRAINT "MaterialActual_segmentResponse_fkey";
       dt          postgres    false    3884    245    335            e           2606    38951 2   MaterialActual MaterialActual_storageLocation_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialActual"
    ADD CONSTRAINT "MaterialActual_storageLocation_fkey" FOREIGN KEY ("storageLocation") REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 \   ALTER TABLE ONLY dt."MaterialActual" DROP CONSTRAINT "MaterialActual_storageLocation_fkey";
       dt          postgres    false    3631    245    210            f           2606    38956 )   MaterialActual MaterialActual_stream_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialActual"
    ADD CONSTRAINT "MaterialActual_stream_fkey" FOREIGN KEY (stream) REFERENCES dt."Stream"(id) ON DELETE SET NULL;
 S   ALTER TABLE ONLY dt."MaterialActual" DROP CONSTRAINT "MaterialActual_stream_fkey";
       dt          postgres    false    3900    245    343            p           2606    38961 H   MaterialAssemblyDefinition MaterialAssemblyDefinition_assembledFrom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialAssemblyDefinition"
    ADD CONSTRAINT "MaterialAssemblyDefinition_assembledFrom_fkey" FOREIGN KEY ("assembledFrom") REFERENCES dt."MaterialDefinition"(id) ON DELETE SET NULL;
 r   ALTER TABLE ONLY dt."MaterialAssemblyDefinition" DROP CONSTRAINT "MaterialAssemblyDefinition_assembledFrom_fkey";
       dt          postgres    false    247    253    3720            q           2606    38966 O   MaterialAssemblyDefinition MaterialAssemblyDefinition_assemblyRelationship_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialAssemblyDefinition"
    ADD CONSTRAINT "MaterialAssemblyDefinition_assemblyRelationship_fkey" FOREIGN KEY ("assemblyRelationship") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 y   ALTER TABLE ONLY dt."MaterialAssemblyDefinition" DROP CONSTRAINT "MaterialAssemblyDefinition_assemblyRelationship_fkey";
       dt          postgres    false    3700    243    247            r           2606    38971 G   MaterialAssemblyDefinition MaterialAssemblyDefinition_assemblyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialAssemblyDefinition"
    ADD CONSTRAINT "MaterialAssemblyDefinition_assemblyType_fkey" FOREIGN KEY ("assemblyType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 q   ALTER TABLE ONLY dt."MaterialAssemblyDefinition" DROP CONSTRAINT "MaterialAssemblyDefinition_assemblyType_fkey";
       dt          postgres    false    247    243    3700            s           2606    38976 M   MaterialAssemblyDefinition MaterialAssemblyDefinition_materialDefinition_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialAssemblyDefinition"
    ADD CONSTRAINT "MaterialAssemblyDefinition_materialDefinition_fkey" FOREIGN KEY ("materialDefinition") REFERENCES dt."MaterialDefinition"(id) ON DELETE SET NULL;
 w   ALTER TABLE ONLY dt."MaterialAssemblyDefinition" DROP CONSTRAINT "MaterialAssemblyDefinition_materialDefinition_fkey";
       dt          postgres    false    3720    253    247            �           2606    38981 C   MaterialCapabilityProperty MaterialCapabilityProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialCapabilityProperty"
    ADD CONSTRAINT "MaterialCapabilityProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 m   ALTER TABLE ONLY dt."MaterialCapabilityProperty" DROP CONSTRAINT "MaterialCapabilityProperty_category_fkey";
       dt          postgres    false    3700    249    243            �           2606    38986 M   MaterialCapabilityProperty MaterialCapabilityProperty_materialCapability_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialCapabilityProperty"
    ADD CONSTRAINT "MaterialCapabilityProperty_materialCapability_fkey" FOREIGN KEY ("materialCapability") REFERENCES dt."MaterialCapability"(id) ON DELETE SET NULL;
 w   ALTER TABLE ONLY dt."MaterialCapabilityProperty" DROP CONSTRAINT "MaterialCapabilityProperty_materialCapability_fkey";
       dt          postgres    false    249    248    3710            �           2606    38991 A   MaterialCapabilityProperty MaterialCapabilityProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialCapabilityProperty"
    ADD CONSTRAINT "MaterialCapabilityProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."MaterialCapabilityProperty"(id) ON DELETE SET NULL;
 k   ALTER TABLE ONLY dt."MaterialCapabilityProperty" DROP CONSTRAINT "MaterialCapabilityProperty_parent_fkey";
       dt          postgres    false    249    3712    249            �           2606    38996 G   MaterialCapabilityProperty MaterialCapabilityProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialCapabilityProperty"
    ADD CONSTRAINT "MaterialCapabilityProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 q   ALTER TABLE ONLY dt."MaterialCapabilityProperty" DROP CONSTRAINT "MaterialCapabilityProperty_propertyType_fkey";
       dt          postgres    false    249    320    3854            �           2606    39001 F   MaterialCapabilityProperty MaterialCapabilityProperty_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialCapabilityProperty"
    ADD CONSTRAINT "MaterialCapabilityProperty_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 p   ALTER TABLE ONLY dt."MaterialCapabilityProperty" DROP CONSTRAINT "MaterialCapabilityProperty_quantityUom_fkey";
       dt          postgres    false    249    3908    347            �           2606    39006 E   MaterialCapabilityProperty MaterialCapabilityProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialCapabilityProperty"
    ADD CONSTRAINT "MaterialCapabilityProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY dt."MaterialCapabilityProperty" DROP CONSTRAINT "MaterialCapabilityProperty_sensorType_fkey";
       dt          postgres    false    3643    216    249            �           2606    39011 A   MaterialCapabilityProperty MaterialCapabilityProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialCapabilityProperty"
    ADD CONSTRAINT "MaterialCapabilityProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 k   ALTER TABLE ONLY dt."MaterialCapabilityProperty" DROP CONSTRAINT "MaterialCapabilityProperty_sensor_fkey";
       dt          postgres    false    210    3631    249            �           2606    39016 F   MaterialCapabilityProperty MaterialCapabilityProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialCapabilityProperty"
    ADD CONSTRAINT "MaterialCapabilityProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 p   ALTER TABLE ONLY dt."MaterialCapabilityProperty" DROP CONSTRAINT "MaterialCapabilityProperty_uomCategory_fkey";
       dt          postgres    false    249    3910    348            �           2606    39021 C   MaterialCapabilityProperty MaterialCapabilityProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialCapabilityProperty"
    ADD CONSTRAINT "MaterialCapabilityProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 m   ALTER TABLE ONLY dt."MaterialCapabilityProperty" DROP CONSTRAINT "MaterialCapabilityProperty_valueUom_fkey";
       dt          postgres    false    347    249    3908            t           2606    39026 ?   MaterialCapability MaterialCapability_assemblyRelationship_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialCapability"
    ADD CONSTRAINT "MaterialCapability_assemblyRelationship_fkey" FOREIGN KEY ("assemblyRelationship") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 i   ALTER TABLE ONLY dt."MaterialCapability" DROP CONSTRAINT "MaterialCapability_assemblyRelationship_fkey";
       dt          postgres    false    248    3700    243            u           2606    39031 7   MaterialCapability MaterialCapability_assemblyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialCapability"
    ADD CONSTRAINT "MaterialCapability_assemblyType_fkey" FOREIGN KEY ("assemblyType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 a   ALTER TABLE ONLY dt."MaterialCapability" DROP CONSTRAINT "MaterialCapability_assemblyType_fkey";
       dt          postgres    false    243    248    3700            v           2606    39036 9   MaterialCapability MaterialCapability_capabilityType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialCapability"
    ADD CONSTRAINT "MaterialCapability_capabilityType_fkey" FOREIGN KEY ("capabilityType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY dt."MaterialCapability" DROP CONSTRAINT "MaterialCapability_capabilityType_fkey";
       dt          postgres    false    243    3700    248            w           2606    39041 9   MaterialCapability MaterialCapability_hierarchyScope_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialCapability"
    ADD CONSTRAINT "MaterialCapability_hierarchyScope_fkey" FOREIGN KEY ("hierarchyScope") REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY dt."MaterialCapability" DROP CONSTRAINT "MaterialCapability_hierarchyScope_fkey";
       dt          postgres    false    248    3631    210            x           2606    39046 8   MaterialCapability MaterialCapability_materialClass_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialCapability"
    ADD CONSTRAINT "MaterialCapability_materialClass_fkey" FOREIGN KEY ("materialClass") REFERENCES dt."MaterialClass"(id) ON DELETE SET NULL;
 b   ALTER TABLE ONLY dt."MaterialCapability" DROP CONSTRAINT "MaterialCapability_materialClass_fkey";
       dt          postgres    false    250    248    3714            y           2606    39051 =   MaterialCapability MaterialCapability_materialDefinition_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialCapability"
    ADD CONSTRAINT "MaterialCapability_materialDefinition_fkey" FOREIGN KEY ("materialDefinition") REFERENCES dt."MaterialDefinition"(id) ON DELETE SET NULL;
 g   ALTER TABLE ONLY dt."MaterialCapability" DROP CONSTRAINT "MaterialCapability_materialDefinition_fkey";
       dt          postgres    false    253    3720    248            z           2606    39056 6   MaterialCapability MaterialCapability_materialLot_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialCapability"
    ADD CONSTRAINT "MaterialCapability_materialLot_fkey" FOREIGN KEY ("materialLot") REFERENCES dt."MaterialLot"(id) ON DELETE SET NULL;
 `   ALTER TABLE ONLY dt."MaterialCapability" DROP CONSTRAINT "MaterialCapability_materialLot_fkey";
       dt          postgres    false    3724    248    255            {           2606    39061 9   MaterialCapability MaterialCapability_materialSubLot_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialCapability"
    ADD CONSTRAINT "MaterialCapability_materialSubLot_fkey" FOREIGN KEY ("materialSubLot") REFERENCES dt."MaterialSubLot"(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY dt."MaterialCapability" DROP CONSTRAINT "MaterialCapability_materialSubLot_fkey";
       dt          postgres    false    265    248    3744            |           2606    39066 ?   MaterialCapability MaterialCapability_operationsCapability_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialCapability"
    ADD CONSTRAINT "MaterialCapability_operationsCapability_fkey" FOREIGN KEY ("operationsCapability") REFERENCES dt."OperationsCapability"(id) ON DELETE SET NULL;
 i   ALTER TABLE ONLY dt."MaterialCapability" DROP CONSTRAINT "MaterialCapability_operationsCapability_fkey";
       dt          postgres    false    268    3750    248            }           2606    39071 1   MaterialCapability MaterialCapability_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialCapability"
    ADD CONSTRAINT "MaterialCapability_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."MaterialCapability"(id) ON DELETE SET NULL;
 [   ALTER TABLE ONLY dt."MaterialCapability" DROP CONSTRAINT "MaterialCapability_parent_fkey";
       dt          postgres    false    248    3710    248            ~           2606    39076 C   MaterialCapability MaterialCapability_processSegmentCapability_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialCapability"
    ADD CONSTRAINT "MaterialCapability_processSegmentCapability_fkey" FOREIGN KEY ("processSegmentCapability") REFERENCES dt."ProcessSegmentCapability"(id) ON DELETE SET NULL;
 m   ALTER TABLE ONLY dt."MaterialCapability" DROP CONSTRAINT "MaterialCapability_processSegmentCapability_fkey";
       dt          postgres    false    248    316    3846                       2606    39081 6   MaterialCapability MaterialCapability_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialCapability"
    ADD CONSTRAINT "MaterialCapability_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 `   ALTER TABLE ONLY dt."MaterialCapability" DROP CONSTRAINT "MaterialCapability_quantityUom_fkey";
       dt          postgres    false    3908    347    248            �           2606    39086 6   MaterialCapability MaterialCapability_resourceUse_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialCapability"
    ADD CONSTRAINT "MaterialCapability_resourceUse_fkey" FOREIGN KEY ("resourceUse") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 `   ALTER TABLE ONLY dt."MaterialCapability" DROP CONSTRAINT "MaterialCapability_resourceUse_fkey";
       dt          postgres    false    243    248    3700            �           2606    39091 9   MaterialCapability MaterialCapability_workCapability_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialCapability"
    ADD CONSTRAINT "MaterialCapability_workCapability_fkey" FOREIGN KEY ("workCapability") REFERENCES dt."WorkCapability"(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY dt."MaterialCapability" DROP CONSTRAINT "MaterialCapability_workCapability_fkey";
       dt          postgres    false    248    361    3936            �           2606    39096 ?   MaterialCapability MaterialCapability_workMasterCapability_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialCapability"
    ADD CONSTRAINT "MaterialCapability_workMasterCapability_fkey" FOREIGN KEY ("workMasterCapability") REFERENCES dt."WorkMasterCapability"(id) ON DELETE SET NULL;
 i   ALTER TABLE ONLY dt."MaterialCapability" DROP CONSTRAINT "MaterialCapability_workMasterCapability_fkey";
       dt          postgres    false    248    364    3942            �           2606    39101 <   MaterialClassMapping MaterialClassMapping_materialClass_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialClassMapping"
    ADD CONSTRAINT "MaterialClassMapping_materialClass_fkey" FOREIGN KEY ("materialClass") REFERENCES dt."MaterialClass"(id) ON DELETE CASCADE;
 f   ALTER TABLE ONLY dt."MaterialClassMapping" DROP CONSTRAINT "MaterialClassMapping_materialClass_fkey";
       dt          postgres    false    251    3714    250            �           2606    39106 A   MaterialClassMapping MaterialClassMapping_materialDefinition_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialClassMapping"
    ADD CONSTRAINT "MaterialClassMapping_materialDefinition_fkey" FOREIGN KEY ("materialDefinition") REFERENCES dt."MaterialDefinition"(id) ON DELETE CASCADE;
 k   ALTER TABLE ONLY dt."MaterialClassMapping" DROP CONSTRAINT "MaterialClassMapping_materialDefinition_fkey";
       dt          postgres    false    3720    251    253            �           2606    39111 9   MaterialClassProperty MaterialClassProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialClassProperty"
    ADD CONSTRAINT "MaterialClassProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY dt."MaterialClassProperty" DROP CONSTRAINT "MaterialClassProperty_category_fkey";
       dt          postgres    false    252    243    3700            �           2606    39116 >   MaterialClassProperty MaterialClassProperty_materialClass_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialClassProperty"
    ADD CONSTRAINT "MaterialClassProperty_materialClass_fkey" FOREIGN KEY ("materialClass") REFERENCES dt."MaterialClass"(id) ON DELETE SET NULL;
 h   ALTER TABLE ONLY dt."MaterialClassProperty" DROP CONSTRAINT "MaterialClassProperty_materialClass_fkey";
       dt          postgres    false    252    250    3714            �           2606    39121 7   MaterialClassProperty MaterialClassProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialClassProperty"
    ADD CONSTRAINT "MaterialClassProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."MaterialClassProperty"(id) ON DELETE SET NULL;
 a   ALTER TABLE ONLY dt."MaterialClassProperty" DROP CONSTRAINT "MaterialClassProperty_parent_fkey";
       dt          postgres    false    252    3718    252            �           2606    39126 =   MaterialClassProperty MaterialClassProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialClassProperty"
    ADD CONSTRAINT "MaterialClassProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 g   ALTER TABLE ONLY dt."MaterialClassProperty" DROP CONSTRAINT "MaterialClassProperty_propertyType_fkey";
       dt          postgres    false    320    3854    252            �           2606    39131 ;   MaterialClassProperty MaterialClassProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialClassProperty"
    ADD CONSTRAINT "MaterialClassProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."MaterialClassProperty" DROP CONSTRAINT "MaterialClassProperty_sensorType_fkey";
       dt          postgres    false    252    216    3643            �           2606    39136 7   MaterialClassProperty MaterialClassProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialClassProperty"
    ADD CONSTRAINT "MaterialClassProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 a   ALTER TABLE ONLY dt."MaterialClassProperty" DROP CONSTRAINT "MaterialClassProperty_sensor_fkey";
       dt          postgres    false    210    252    3631            �           2606    39141 <   MaterialClassProperty MaterialClassProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialClassProperty"
    ADD CONSTRAINT "MaterialClassProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 f   ALTER TABLE ONLY dt."MaterialClassProperty" DROP CONSTRAINT "MaterialClassProperty_uomCategory_fkey";
       dt          postgres    false    3910    252    348            �           2606    39146 9   MaterialClassProperty MaterialClassProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialClassProperty"
    ADD CONSTRAINT "MaterialClassProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY dt."MaterialClassProperty" DROP CONSTRAINT "MaterialClassProperty_valueUom_fkey";
       dt          postgres    false    252    347    3908            �           2606    39151 5   MaterialClass MaterialClass_assemblyRelationship_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialClass"
    ADD CONSTRAINT "MaterialClass_assemblyRelationship_fkey" FOREIGN KEY ("assemblyRelationship") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 _   ALTER TABLE ONLY dt."MaterialClass" DROP CONSTRAINT "MaterialClass_assemblyRelationship_fkey";
       dt          postgres    false    243    250    3700            �           2606    39156 -   MaterialClass MaterialClass_assemblyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialClass"
    ADD CONSTRAINT "MaterialClass_assemblyType_fkey" FOREIGN KEY ("assemblyType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 W   ALTER TABLE ONLY dt."MaterialClass" DROP CONSTRAINT "MaterialClass_assemblyType_fkey";
       dt          postgres    false    250    243    3700            �           2606    39161 '   MaterialClass MaterialClass_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialClass"
    ADD CONSTRAINT "MaterialClass_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."MaterialClass"(id) ON DELETE SET NULL;
 Q   ALTER TABLE ONLY dt."MaterialClass" DROP CONSTRAINT "MaterialClass_parent_fkey";
       dt          postgres    false    250    3714    250            �           2606    39166 C   MaterialDefinitionProperty MaterialDefinitionProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialDefinitionProperty"
    ADD CONSTRAINT "MaterialDefinitionProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 m   ALTER TABLE ONLY dt."MaterialDefinitionProperty" DROP CONSTRAINT "MaterialDefinitionProperty_category_fkey";
       dt          postgres    false    243    3700    254            �           2606    39171 M   MaterialDefinitionProperty MaterialDefinitionProperty_materialDefinition_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialDefinitionProperty"
    ADD CONSTRAINT "MaterialDefinitionProperty_materialDefinition_fkey" FOREIGN KEY ("materialDefinition") REFERENCES dt."MaterialDefinition"(id) ON DELETE SET NULL;
 w   ALTER TABLE ONLY dt."MaterialDefinitionProperty" DROP CONSTRAINT "MaterialDefinitionProperty_materialDefinition_fkey";
       dt          postgres    false    3720    254    253            �           2606    39176 A   MaterialDefinitionProperty MaterialDefinitionProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialDefinitionProperty"
    ADD CONSTRAINT "MaterialDefinitionProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."MaterialDefinitionProperty"(id) ON DELETE SET NULL;
 k   ALTER TABLE ONLY dt."MaterialDefinitionProperty" DROP CONSTRAINT "MaterialDefinitionProperty_parent_fkey";
       dt          postgres    false    254    254    3722            �           2606    39181 G   MaterialDefinitionProperty MaterialDefinitionProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialDefinitionProperty"
    ADD CONSTRAINT "MaterialDefinitionProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 q   ALTER TABLE ONLY dt."MaterialDefinitionProperty" DROP CONSTRAINT "MaterialDefinitionProperty_propertyType_fkey";
       dt          postgres    false    254    3854    320            �           2606    39186 E   MaterialDefinitionProperty MaterialDefinitionProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialDefinitionProperty"
    ADD CONSTRAINT "MaterialDefinitionProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY dt."MaterialDefinitionProperty" DROP CONSTRAINT "MaterialDefinitionProperty_sensorType_fkey";
       dt          postgres    false    254    3643    216            �           2606    39191 A   MaterialDefinitionProperty MaterialDefinitionProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialDefinitionProperty"
    ADD CONSTRAINT "MaterialDefinitionProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 k   ALTER TABLE ONLY dt."MaterialDefinitionProperty" DROP CONSTRAINT "MaterialDefinitionProperty_sensor_fkey";
       dt          postgres    false    3631    254    210            �           2606    39196 F   MaterialDefinitionProperty MaterialDefinitionProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialDefinitionProperty"
    ADD CONSTRAINT "MaterialDefinitionProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 p   ALTER TABLE ONLY dt."MaterialDefinitionProperty" DROP CONSTRAINT "MaterialDefinitionProperty_uomCategory_fkey";
       dt          postgres    false    348    254    3910            �           2606    39201 C   MaterialDefinitionProperty MaterialDefinitionProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialDefinitionProperty"
    ADD CONSTRAINT "MaterialDefinitionProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 m   ALTER TABLE ONLY dt."MaterialDefinitionProperty" DROP CONSTRAINT "MaterialDefinitionProperty_valueUom_fkey";
       dt          postgres    false    3908    347    254            �           2606    39206 ?   MaterialDefinition MaterialDefinition_assemblyRelationship_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialDefinition"
    ADD CONSTRAINT "MaterialDefinition_assemblyRelationship_fkey" FOREIGN KEY ("assemblyRelationship") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 i   ALTER TABLE ONLY dt."MaterialDefinition" DROP CONSTRAINT "MaterialDefinition_assemblyRelationship_fkey";
       dt          postgres    false    253    243    3700            �           2606    39211 7   MaterialDefinition MaterialDefinition_assemblyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialDefinition"
    ADD CONSTRAINT "MaterialDefinition_assemblyType_fkey" FOREIGN KEY ("assemblyType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 a   ALTER TABLE ONLY dt."MaterialDefinition" DROP CONSTRAINT "MaterialDefinition_assemblyType_fkey";
       dt          postgres    false    253    3700    243            �           2606    39216 1   MaterialDefinition MaterialDefinition_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialDefinition"
    ADD CONSTRAINT "MaterialDefinition_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."MaterialDefinition"(id) ON DELETE SET NULL;
 [   ALTER TABLE ONLY dt."MaterialDefinition" DROP CONSTRAINT "MaterialDefinition_parent_fkey";
       dt          postgres    false    253    3720    253            �           2606    39221 5   MaterialLotProperty MaterialLotProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialLotProperty"
    ADD CONSTRAINT "MaterialLotProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 _   ALTER TABLE ONLY dt."MaterialLotProperty" DROP CONSTRAINT "MaterialLotProperty_category_fkey";
       dt          postgres    false    256    243    3700            �           2606    39226 8   MaterialLotProperty MaterialLotProperty_materialLot_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialLotProperty"
    ADD CONSTRAINT "MaterialLotProperty_materialLot_fkey" FOREIGN KEY ("materialLot") REFERENCES dt."MaterialLot"(id) ON DELETE SET NULL;
 b   ALTER TABLE ONLY dt."MaterialLotProperty" DROP CONSTRAINT "MaterialLotProperty_materialLot_fkey";
       dt          postgres    false    3724    255    256            �           2606    39231 ;   MaterialLotProperty MaterialLotProperty_materialSubLot_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialLotProperty"
    ADD CONSTRAINT "MaterialLotProperty_materialSubLot_fkey" FOREIGN KEY ("materialSubLot") REFERENCES dt."MaterialSubLot"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."MaterialLotProperty" DROP CONSTRAINT "MaterialLotProperty_materialSubLot_fkey";
       dt          postgres    false    3744    265    256            �           2606    39236 3   MaterialLotProperty MaterialLotProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialLotProperty"
    ADD CONSTRAINT "MaterialLotProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."MaterialLotProperty"(id) ON DELETE SET NULL;
 ]   ALTER TABLE ONLY dt."MaterialLotProperty" DROP CONSTRAINT "MaterialLotProperty_parent_fkey";
       dt          postgres    false    256    256    3726            �           2606    39241 9   MaterialLotProperty MaterialLotProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialLotProperty"
    ADD CONSTRAINT "MaterialLotProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY dt."MaterialLotProperty" DROP CONSTRAINT "MaterialLotProperty_propertyType_fkey";
       dt          postgres    false    3854    256    320            �           2606    39246 7   MaterialLotProperty MaterialLotProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialLotProperty"
    ADD CONSTRAINT "MaterialLotProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 a   ALTER TABLE ONLY dt."MaterialLotProperty" DROP CONSTRAINT "MaterialLotProperty_sensorType_fkey";
       dt          postgres    false    3643    256    216            �           2606    39251 3   MaterialLotProperty MaterialLotProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialLotProperty"
    ADD CONSTRAINT "MaterialLotProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 ]   ALTER TABLE ONLY dt."MaterialLotProperty" DROP CONSTRAINT "MaterialLotProperty_sensor_fkey";
       dt          postgres    false    256    3631    210            �           2606    39256 8   MaterialLotProperty MaterialLotProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialLotProperty"
    ADD CONSTRAINT "MaterialLotProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 b   ALTER TABLE ONLY dt."MaterialLotProperty" DROP CONSTRAINT "MaterialLotProperty_uomCategory_fkey";
       dt          postgres    false    348    256    3910            �           2606    39261 5   MaterialLotProperty MaterialLotProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialLotProperty"
    ADD CONSTRAINT "MaterialLotProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 _   ALTER TABLE ONLY dt."MaterialLotProperty" DROP CONSTRAINT "MaterialLotProperty_valueUom_fkey";
       dt          postgres    false    347    3908    256            �           2606    39266 1   MaterialLot MaterialLot_assemblyRelationship_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialLot"
    ADD CONSTRAINT "MaterialLot_assemblyRelationship_fkey" FOREIGN KEY ("assemblyRelationship") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 [   ALTER TABLE ONLY dt."MaterialLot" DROP CONSTRAINT "MaterialLot_assemblyRelationship_fkey";
       dt          postgres    false    243    255    3700            �           2606    39271 )   MaterialLot MaterialLot_assemblyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialLot"
    ADD CONSTRAINT "MaterialLot_assemblyType_fkey" FOREIGN KEY ("assemblyType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 S   ALTER TABLE ONLY dt."MaterialLot" DROP CONSTRAINT "MaterialLot_assemblyType_fkey";
       dt          postgres    false    255    3700    243            �           2606    39276 /   MaterialLot MaterialLot_materialDefinition_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialLot"
    ADD CONSTRAINT "MaterialLot_materialDefinition_fkey" FOREIGN KEY ("materialDefinition") REFERENCES dt."MaterialDefinition"(id) ON DELETE SET NULL;
 Y   ALTER TABLE ONLY dt."MaterialLot" DROP CONSTRAINT "MaterialLot_materialDefinition_fkey";
       dt          postgres    false    3720    255    253            �           2606    39281 +   MaterialLot MaterialLot_materialStatus_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialLot"
    ADD CONSTRAINT "MaterialLot_materialStatus_fkey" FOREIGN KEY ("materialStatus") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 U   ALTER TABLE ONLY dt."MaterialLot" DROP CONSTRAINT "MaterialLot_materialStatus_fkey";
       dt          postgres    false    3700    243    255            �           2606    39286 #   MaterialLot MaterialLot_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialLot"
    ADD CONSTRAINT "MaterialLot_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."MaterialLot"(id) ON DELETE SET NULL;
 M   ALTER TABLE ONLY dt."MaterialLot" DROP CONSTRAINT "MaterialLot_parent_fkey";
       dt          postgres    false    3724    255    255            �           2606    39291 (   MaterialLot MaterialLot_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialLot"
    ADD CONSTRAINT "MaterialLot_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY dt."MaterialLot" DROP CONSTRAINT "MaterialLot_quantityUom_fkey";
       dt          postgres    false    3908    255    347            �           2606    39296 ,   MaterialLot MaterialLot_storageLocation_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialLot"
    ADD CONSTRAINT "MaterialLot_storageLocation_fkey" FOREIGN KEY ("storageLocation") REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 V   ALTER TABLE ONLY dt."MaterialLot" DROP CONSTRAINT "MaterialLot_storageLocation_fkey";
       dt          postgres    false    3631    210    255            �           2606    39301 J   MaterialRequirementBillItem MaterialRequirementBillItem_materialClass_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialRequirementBillItem"
    ADD CONSTRAINT "MaterialRequirementBillItem_materialClass_fkey" FOREIGN KEY ("materialClass") REFERENCES dt."MaterialClass"(id) ON DELETE SET NULL;
 t   ALTER TABLE ONLY dt."MaterialRequirementBillItem" DROP CONSTRAINT "MaterialRequirementBillItem_materialClass_fkey";
       dt          postgres    false    3714    250    259            �           2606    39306 O   MaterialRequirementBillItem MaterialRequirementBillItem_materialDefinition_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialRequirementBillItem"
    ADD CONSTRAINT "MaterialRequirementBillItem_materialDefinition_fkey" FOREIGN KEY ("materialDefinition") REFERENCES dt."MaterialDefinition"(id) ON DELETE SET NULL;
 y   ALTER TABLE ONLY dt."MaterialRequirementBillItem" DROP CONSTRAINT "MaterialRequirementBillItem_materialDefinition_fkey";
       dt          postgres    false    3720    253    259            �           2606    39311 T   MaterialRequirementBillItem MaterialRequirementBillItem_materialRequirementBill_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialRequirementBillItem"
    ADD CONSTRAINT "MaterialRequirementBillItem_materialRequirementBill_fkey" FOREIGN KEY ("materialRequirementBill") REFERENCES dt."MaterialRequirementBill"(id) ON DELETE SET NULL;
 ~   ALTER TABLE ONLY dt."MaterialRequirementBillItem" DROP CONSTRAINT "MaterialRequirementBillItem_materialRequirementBill_fkey";
       dt          postgres    false    259    258    3730            �           2606    39316 C   MaterialRequirementBillItem MaterialRequirementBillItem_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialRequirementBillItem"
    ADD CONSTRAINT "MaterialRequirementBillItem_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."MaterialRequirementBillItem"(id) ON DELETE SET NULL;
 m   ALTER TABLE ONLY dt."MaterialRequirementBillItem" DROP CONSTRAINT "MaterialRequirementBillItem_parent_fkey";
       dt          postgres    false    3732    259    259            �           2606    39321 H   MaterialRequirementBillItem MaterialRequirementBillItem_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialRequirementBillItem"
    ADD CONSTRAINT "MaterialRequirementBillItem_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 r   ALTER TABLE ONLY dt."MaterialRequirementBillItem" DROP CONSTRAINT "MaterialRequirementBillItem_quantityUom_fkey";
       dt          postgres    false    347    259    3908            �           2606    39326 H   MaterialRequirementBillItem MaterialRequirementBillItem_resourceUse_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialRequirementBillItem"
    ADD CONSTRAINT "MaterialRequirementBillItem_resourceUse_fkey" FOREIGN KEY ("resourceUse") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 r   ALTER TABLE ONLY dt."MaterialRequirementBillItem" DROP CONSTRAINT "MaterialRequirementBillItem_resourceUse_fkey";
       dt          postgres    false    243    259    3700            �           2606    39331 F   MaterialRequirementBill MaterialRequirementBill_operationsRequest_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialRequirementBill"
    ADD CONSTRAINT "MaterialRequirementBill_operationsRequest_fkey" FOREIGN KEY ("operationsRequest") REFERENCES dt."OperationsRequest"(id) ON DELETE SET NULL;
 p   ALTER TABLE ONLY dt."MaterialRequirementBill" DROP CONSTRAINT "MaterialRequirementBill_operationsRequest_fkey";
       dt          postgres    false    276    258    3766            �           2606    39336 E   MaterialRequirementProperty MaterialRequirementProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialRequirementProperty"
    ADD CONSTRAINT "MaterialRequirementProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY dt."MaterialRequirementProperty" DROP CONSTRAINT "MaterialRequirementProperty_category_fkey";
       dt          postgres    false    243    260    3700            �           2606    39341 G   MaterialRequirementProperty MaterialRequirementProperty_logRateUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialRequirementProperty"
    ADD CONSTRAINT "MaterialRequirementProperty_logRateUom_fkey" FOREIGN KEY ("logRateUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 q   ALTER TABLE ONLY dt."MaterialRequirementProperty" DROP CONSTRAINT "MaterialRequirementProperty_logRateUom_fkey";
       dt          postgres    false    3908    260    347            �           2606    39346 P   MaterialRequirementProperty MaterialRequirementProperty_materialRequirement_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialRequirementProperty"
    ADD CONSTRAINT "MaterialRequirementProperty_materialRequirement_fkey" FOREIGN KEY ("materialRequirement") REFERENCES dt."MaterialRequirement"(id) ON DELETE SET NULL;
 z   ALTER TABLE ONLY dt."MaterialRequirementProperty" DROP CONSTRAINT "MaterialRequirementProperty_materialRequirement_fkey";
       dt          postgres    false    260    257    3728            �           2606    39351 C   MaterialRequirementProperty MaterialRequirementProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialRequirementProperty"
    ADD CONSTRAINT "MaterialRequirementProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."MaterialRequirementProperty"(id) ON DELETE SET NULL;
 m   ALTER TABLE ONLY dt."MaterialRequirementProperty" DROP CONSTRAINT "MaterialRequirementProperty_parent_fkey";
       dt          postgres    false    3734    260    260            �           2606    39356 I   MaterialRequirementProperty MaterialRequirementProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialRequirementProperty"
    ADD CONSTRAINT "MaterialRequirementProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 s   ALTER TABLE ONLY dt."MaterialRequirementProperty" DROP CONSTRAINT "MaterialRequirementProperty_propertyType_fkey";
       dt          postgres    false    320    260    3854            �           2606    39361 H   MaterialRequirementProperty MaterialRequirementProperty_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialRequirementProperty"
    ADD CONSTRAINT "MaterialRequirementProperty_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 r   ALTER TABLE ONLY dt."MaterialRequirementProperty" DROP CONSTRAINT "MaterialRequirementProperty_quantityUom_fkey";
       dt          postgres    false    347    260    3908            �           2606    39366 G   MaterialRequirementProperty MaterialRequirementProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialRequirementProperty"
    ADD CONSTRAINT "MaterialRequirementProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 q   ALTER TABLE ONLY dt."MaterialRequirementProperty" DROP CONSTRAINT "MaterialRequirementProperty_sensorType_fkey";
       dt          postgres    false    260    3643    216            �           2606    39371 C   MaterialRequirementProperty MaterialRequirementProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialRequirementProperty"
    ADD CONSTRAINT "MaterialRequirementProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 m   ALTER TABLE ONLY dt."MaterialRequirementProperty" DROP CONSTRAINT "MaterialRequirementProperty_sensor_fkey";
       dt          postgres    false    3631    260    210            �           2606    39376 H   MaterialRequirementProperty MaterialRequirementProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialRequirementProperty"
    ADD CONSTRAINT "MaterialRequirementProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 r   ALTER TABLE ONLY dt."MaterialRequirementProperty" DROP CONSTRAINT "MaterialRequirementProperty_uomCategory_fkey";
       dt          postgres    false    260    3910    348            �           2606    39381 E   MaterialRequirementProperty MaterialRequirementProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialRequirementProperty"
    ADD CONSTRAINT "MaterialRequirementProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY dt."MaterialRequirementProperty" DROP CONSTRAINT "MaterialRequirementProperty_valueUom_fkey";
       dt          postgres    false    347    260    3908            �           2606    39386 A   MaterialRequirement MaterialRequirement_assemblyRelationship_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialRequirement"
    ADD CONSTRAINT "MaterialRequirement_assemblyRelationship_fkey" FOREIGN KEY ("assemblyRelationship") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 k   ALTER TABLE ONLY dt."MaterialRequirement" DROP CONSTRAINT "MaterialRequirement_assemblyRelationship_fkey";
       dt          postgres    false    257    3700    243            �           2606    39391 9   MaterialRequirement MaterialRequirement_assemblyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialRequirement"
    ADD CONSTRAINT "MaterialRequirement_assemblyType_fkey" FOREIGN KEY ("assemblyType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY dt."MaterialRequirement" DROP CONSTRAINT "MaterialRequirement_assemblyType_fkey";
       dt          postgres    false    243    3700    257            �           2606    39396 5   MaterialRequirement MaterialRequirement_jobOrder_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialRequirement"
    ADD CONSTRAINT "MaterialRequirement_jobOrder_fkey" FOREIGN KEY ("jobOrder") REFERENCES dt."JobOrder"(id) ON DELETE SET NULL;
 _   ALTER TABLE ONLY dt."MaterialRequirement" DROP CONSTRAINT "MaterialRequirement_jobOrder_fkey";
       dt          postgres    false    239    257    3692            �           2606    39401 :   MaterialRequirement MaterialRequirement_materialClass_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialRequirement"
    ADD CONSTRAINT "MaterialRequirement_materialClass_fkey" FOREIGN KEY ("materialClass") REFERENCES dt."MaterialClass"(id) ON DELETE SET NULL;
 d   ALTER TABLE ONLY dt."MaterialRequirement" DROP CONSTRAINT "MaterialRequirement_materialClass_fkey";
       dt          postgres    false    257    250    3714            �           2606    39406 ?   MaterialRequirement MaterialRequirement_materialDefinition_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialRequirement"
    ADD CONSTRAINT "MaterialRequirement_materialDefinition_fkey" FOREIGN KEY ("materialDefinition") REFERENCES dt."MaterialDefinition"(id) ON DELETE SET NULL;
 i   ALTER TABLE ONLY dt."MaterialRequirement" DROP CONSTRAINT "MaterialRequirement_materialDefinition_fkey";
       dt          postgres    false    253    3720    257            �           2606    39411 8   MaterialRequirement MaterialRequirement_materialLot_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialRequirement"
    ADD CONSTRAINT "MaterialRequirement_materialLot_fkey" FOREIGN KEY ("materialLot") REFERENCES dt."MaterialLot"(id) ON DELETE SET NULL;
 b   ALTER TABLE ONLY dt."MaterialRequirement" DROP CONSTRAINT "MaterialRequirement_materialLot_fkey";
       dt          postgres    false    255    257    3724            �           2606    39416 ;   MaterialRequirement MaterialRequirement_materialSubLot_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialRequirement"
    ADD CONSTRAINT "MaterialRequirement_materialSubLot_fkey" FOREIGN KEY ("materialSubLot") REFERENCES dt."MaterialSubLot"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."MaterialRequirement" DROP CONSTRAINT "MaterialRequirement_materialSubLot_fkey";
       dt          postgres    false    3744    265    257            �           2606    39421 3   MaterialRequirement MaterialRequirement_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialRequirement"
    ADD CONSTRAINT "MaterialRequirement_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."MaterialRequirement"(id) ON DELETE SET NULL;
 ]   ALTER TABLE ONLY dt."MaterialRequirement" DROP CONSTRAINT "MaterialRequirement_parent_fkey";
       dt          postgres    false    3728    257    257            �           2606    39426 8   MaterialRequirement MaterialRequirement_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialRequirement"
    ADD CONSTRAINT "MaterialRequirement_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 b   ALTER TABLE ONLY dt."MaterialRequirement" DROP CONSTRAINT "MaterialRequirement_quantityUom_fkey";
       dt          postgres    false    257    347    3908            �           2606    39431 8   MaterialRequirement MaterialRequirement_resourceUse_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialRequirement"
    ADD CONSTRAINT "MaterialRequirement_resourceUse_fkey" FOREIGN KEY ("resourceUse") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 b   ALTER TABLE ONLY dt."MaterialRequirement" DROP CONSTRAINT "MaterialRequirement_resourceUse_fkey";
       dt          postgres    false    257    3700    243            �           2606    39436 ?   MaterialRequirement MaterialRequirement_segmentRequirement_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialRequirement"
    ADD CONSTRAINT "MaterialRequirement_segmentRequirement_fkey" FOREIGN KEY ("segmentRequirement") REFERENCES dt."SegmentRequirement"(id) ON DELETE SET NULL;
 i   ALTER TABLE ONLY dt."MaterialRequirement" DROP CONSTRAINT "MaterialRequirement_segmentRequirement_fkey";
       dt          postgres    false    334    257    3882            �           2606    39441 <   MaterialRequirement MaterialRequirement_storageLocation_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialRequirement"
    ADD CONSTRAINT "MaterialRequirement_storageLocation_fkey" FOREIGN KEY ("storageLocation") REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 f   ALTER TABLE ONLY dt."MaterialRequirement" DROP CONSTRAINT "MaterialRequirement_storageLocation_fkey";
       dt          postgres    false    3631    257    210            �           2606    39446 3   MaterialRequirement MaterialRequirement_stream_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialRequirement"
    ADD CONSTRAINT "MaterialRequirement_stream_fkey" FOREIGN KEY (stream) REFERENCES dt."Stream"(id) ON DELETE SET NULL;
 ]   ALTER TABLE ONLY dt."MaterialRequirement" DROP CONSTRAINT "MaterialRequirement_stream_fkey";
       dt          postgres    false    343    257    3900            �           2606    39451 d   MaterialSegmentSpecificationProperty MaterialSegmentSpecificationP_materialSegmentSpecification_fkey    FK CONSTRAINT       ALTER TABLE ONLY dt."MaterialSegmentSpecificationProperty"
    ADD CONSTRAINT "MaterialSegmentSpecificationP_materialSegmentSpecification_fkey" FOREIGN KEY ("materialSegmentSpecification") REFERENCES dt."MaterialSegmentSpecification"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."MaterialSegmentSpecificationProperty" DROP CONSTRAINT "MaterialSegmentSpecificationP_materialSegmentSpecification_fkey";
       dt          postgres    false    261    262    3736            �           2606    39456 W   MaterialSegmentSpecificationProperty MaterialSegmentSpecificationProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSegmentSpecificationProperty"
    ADD CONSTRAINT "MaterialSegmentSpecificationProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."MaterialSegmentSpecificationProperty" DROP CONSTRAINT "MaterialSegmentSpecificationProperty_category_fkey";
       dt          postgres    false    262    3700    243            �           2606    39461 U   MaterialSegmentSpecificationProperty MaterialSegmentSpecificationProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSegmentSpecificationProperty"
    ADD CONSTRAINT "MaterialSegmentSpecificationProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."MaterialSegmentSpecificationProperty"(id) ON DELETE SET NULL;
    ALTER TABLE ONLY dt."MaterialSegmentSpecificationProperty" DROP CONSTRAINT "MaterialSegmentSpecificationProperty_parent_fkey";
       dt          postgres    false    3738    262    262            �           2606    39466 [   MaterialSegmentSpecificationProperty MaterialSegmentSpecificationProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSegmentSpecificationProperty"
    ADD CONSTRAINT "MaterialSegmentSpecificationProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."MaterialSegmentSpecificationProperty" DROP CONSTRAINT "MaterialSegmentSpecificationProperty_propertyType_fkey";
       dt          postgres    false    3854    320    262            �           2606    39471 Z   MaterialSegmentSpecificationProperty MaterialSegmentSpecificationProperty_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSegmentSpecificationProperty"
    ADD CONSTRAINT "MaterialSegmentSpecificationProperty_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."MaterialSegmentSpecificationProperty" DROP CONSTRAINT "MaterialSegmentSpecificationProperty_quantityUom_fkey";
       dt          postgres    false    347    262    3908            �           2606    39476 Y   MaterialSegmentSpecificationProperty MaterialSegmentSpecificationProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSegmentSpecificationProperty"
    ADD CONSTRAINT "MaterialSegmentSpecificationProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."MaterialSegmentSpecificationProperty" DROP CONSTRAINT "MaterialSegmentSpecificationProperty_sensorType_fkey";
       dt          postgres    false    262    3643    216            �           2606    39481 U   MaterialSegmentSpecificationProperty MaterialSegmentSpecificationProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSegmentSpecificationProperty"
    ADD CONSTRAINT "MaterialSegmentSpecificationProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
    ALTER TABLE ONLY dt."MaterialSegmentSpecificationProperty" DROP CONSTRAINT "MaterialSegmentSpecificationProperty_sensor_fkey";
       dt          postgres    false    262    3631    210            �           2606    39486 Z   MaterialSegmentSpecificationProperty MaterialSegmentSpecificationProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSegmentSpecificationProperty"
    ADD CONSTRAINT "MaterialSegmentSpecificationProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."MaterialSegmentSpecificationProperty" DROP CONSTRAINT "MaterialSegmentSpecificationProperty_uomCategory_fkey";
       dt          postgres    false    348    262    3910            �           2606    39491 W   MaterialSegmentSpecificationProperty MaterialSegmentSpecificationProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSegmentSpecificationProperty"
    ADD CONSTRAINT "MaterialSegmentSpecificationProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."MaterialSegmentSpecificationProperty" DROP CONSTRAINT "MaterialSegmentSpecificationProperty_valueUom_fkey";
       dt          postgres    false    347    262    3908            �           2606    39496 S   MaterialSegmentSpecification MaterialSegmentSpecification_assemblyRelationship_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSegmentSpecification"
    ADD CONSTRAINT "MaterialSegmentSpecification_assemblyRelationship_fkey" FOREIGN KEY ("assemblyRelationship") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 }   ALTER TABLE ONLY dt."MaterialSegmentSpecification" DROP CONSTRAINT "MaterialSegmentSpecification_assemblyRelationship_fkey";
       dt          postgres    false    261    243    3700            �           2606    39501 K   MaterialSegmentSpecification MaterialSegmentSpecification_assemblyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSegmentSpecification"
    ADD CONSTRAINT "MaterialSegmentSpecification_assemblyType_fkey" FOREIGN KEY ("assemblyType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 u   ALTER TABLE ONLY dt."MaterialSegmentSpecification" DROP CONSTRAINT "MaterialSegmentSpecification_assemblyType_fkey";
       dt          postgres    false    3700    261    243            �           2606    39506 L   MaterialSegmentSpecification MaterialSegmentSpecification_materialClass_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSegmentSpecification"
    ADD CONSTRAINT "MaterialSegmentSpecification_materialClass_fkey" FOREIGN KEY ("materialClass") REFERENCES dt."MaterialClass"(id) ON DELETE SET NULL;
 v   ALTER TABLE ONLY dt."MaterialSegmentSpecification" DROP CONSTRAINT "MaterialSegmentSpecification_materialClass_fkey";
       dt          postgres    false    250    261    3714            �           2606    39511 Q   MaterialSegmentSpecification MaterialSegmentSpecification_materialDefinition_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSegmentSpecification"
    ADD CONSTRAINT "MaterialSegmentSpecification_materialDefinition_fkey" FOREIGN KEY ("materialDefinition") REFERENCES dt."MaterialDefinition"(id) ON DELETE SET NULL;
 {   ALTER TABLE ONLY dt."MaterialSegmentSpecification" DROP CONSTRAINT "MaterialSegmentSpecification_materialDefinition_fkey";
       dt          postgres    false    3720    253    261            �           2606    39516 E   MaterialSegmentSpecification MaterialSegmentSpecification_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSegmentSpecification"
    ADD CONSTRAINT "MaterialSegmentSpecification_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."MaterialSegmentSpecification"(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY dt."MaterialSegmentSpecification" DROP CONSTRAINT "MaterialSegmentSpecification_parent_fkey";
       dt          postgres    false    261    261    3736            �           2606    39521 M   MaterialSegmentSpecification MaterialSegmentSpecification_processSegment_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSegmentSpecification"
    ADD CONSTRAINT "MaterialSegmentSpecification_processSegment_fkey" FOREIGN KEY ("processSegment") REFERENCES dt."ProcessSegment"(id) ON DELETE SET NULL;
 w   ALTER TABLE ONLY dt."MaterialSegmentSpecification" DROP CONSTRAINT "MaterialSegmentSpecification_processSegment_fkey";
       dt          postgres    false    261    3844    315            �           2606    39526 J   MaterialSegmentSpecification MaterialSegmentSpecification_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSegmentSpecification"
    ADD CONSTRAINT "MaterialSegmentSpecification_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 t   ALTER TABLE ONLY dt."MaterialSegmentSpecification" DROP CONSTRAINT "MaterialSegmentSpecification_quantityUom_fkey";
       dt          postgres    false    347    261    3908            �           2606    39531 J   MaterialSegmentSpecification MaterialSegmentSpecification_resourceUse_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSegmentSpecification"
    ADD CONSTRAINT "MaterialSegmentSpecification_resourceUse_fkey" FOREIGN KEY ("resourceUse") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 t   ALTER TABLE ONLY dt."MaterialSegmentSpecification" DROP CONSTRAINT "MaterialSegmentSpecification_resourceUse_fkey";
       dt          postgres    false    261    3700    243            �           2606    39536 E   MaterialSegmentSpecification MaterialSegmentSpecification_stream_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSegmentSpecification"
    ADD CONSTRAINT "MaterialSegmentSpecification_stream_fkey" FOREIGN KEY (stream) REFERENCES dt."Stream"(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY dt."MaterialSegmentSpecification" DROP CONSTRAINT "MaterialSegmentSpecification_stream_fkey";
       dt          postgres    false    261    343    3900            �           2606    39541 I   MaterialSpecificationProperty MaterialSpecificationProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSpecificationProperty"
    ADD CONSTRAINT "MaterialSpecificationProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 s   ALTER TABLE ONLY dt."MaterialSpecificationProperty" DROP CONSTRAINT "MaterialSpecificationProperty_category_fkey";
       dt          postgres    false    264    3700    243            �           2606    39546 K   MaterialSpecificationProperty MaterialSpecificationProperty_logRateUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSpecificationProperty"
    ADD CONSTRAINT "MaterialSpecificationProperty_logRateUom_fkey" FOREIGN KEY ("logRateUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 u   ALTER TABLE ONLY dt."MaterialSpecificationProperty" DROP CONSTRAINT "MaterialSpecificationProperty_logRateUom_fkey";
       dt          postgres    false    347    264    3908            �           2606    39551 V   MaterialSpecificationProperty MaterialSpecificationProperty_materialSpecification_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSpecificationProperty"
    ADD CONSTRAINT "MaterialSpecificationProperty_materialSpecification_fkey" FOREIGN KEY ("materialSpecification") REFERENCES dt."MaterialSpecification"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."MaterialSpecificationProperty" DROP CONSTRAINT "MaterialSpecificationProperty_materialSpecification_fkey";
       dt          postgres    false    263    264    3740            �           2606    39556 G   MaterialSpecificationProperty MaterialSpecificationProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSpecificationProperty"
    ADD CONSTRAINT "MaterialSpecificationProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."MaterialSpecificationProperty"(id) ON DELETE SET NULL;
 q   ALTER TABLE ONLY dt."MaterialSpecificationProperty" DROP CONSTRAINT "MaterialSpecificationProperty_parent_fkey";
       dt          postgres    false    264    264    3742            �           2606    39561 M   MaterialSpecificationProperty MaterialSpecificationProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSpecificationProperty"
    ADD CONSTRAINT "MaterialSpecificationProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 w   ALTER TABLE ONLY dt."MaterialSpecificationProperty" DROP CONSTRAINT "MaterialSpecificationProperty_propertyType_fkey";
       dt          postgres    false    3854    264    320            �           2606    39566 L   MaterialSpecificationProperty MaterialSpecificationProperty_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSpecificationProperty"
    ADD CONSTRAINT "MaterialSpecificationProperty_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 v   ALTER TABLE ONLY dt."MaterialSpecificationProperty" DROP CONSTRAINT "MaterialSpecificationProperty_quantityUom_fkey";
       dt          postgres    false    264    3908    347            �           2606    39571 K   MaterialSpecificationProperty MaterialSpecificationProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSpecificationProperty"
    ADD CONSTRAINT "MaterialSpecificationProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 u   ALTER TABLE ONLY dt."MaterialSpecificationProperty" DROP CONSTRAINT "MaterialSpecificationProperty_sensorType_fkey";
       dt          postgres    false    216    264    3643            �           2606    39576 G   MaterialSpecificationProperty MaterialSpecificationProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSpecificationProperty"
    ADD CONSTRAINT "MaterialSpecificationProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 q   ALTER TABLE ONLY dt."MaterialSpecificationProperty" DROP CONSTRAINT "MaterialSpecificationProperty_sensor_fkey";
       dt          postgres    false    210    3631    264            �           2606    39581 L   MaterialSpecificationProperty MaterialSpecificationProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSpecificationProperty"
    ADD CONSTRAINT "MaterialSpecificationProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 v   ALTER TABLE ONLY dt."MaterialSpecificationProperty" DROP CONSTRAINT "MaterialSpecificationProperty_uomCategory_fkey";
       dt          postgres    false    348    3910    264            �           2606    39586 I   MaterialSpecificationProperty MaterialSpecificationProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSpecificationProperty"
    ADD CONSTRAINT "MaterialSpecificationProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 s   ALTER TABLE ONLY dt."MaterialSpecificationProperty" DROP CONSTRAINT "MaterialSpecificationProperty_valueUom_fkey";
       dt          postgres    false    3908    347    264            �           2606    39591 E   MaterialSpecification MaterialSpecification_assemblyRelationship_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSpecification"
    ADD CONSTRAINT "MaterialSpecification_assemblyRelationship_fkey" FOREIGN KEY ("assemblyRelationship") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY dt."MaterialSpecification" DROP CONSTRAINT "MaterialSpecification_assemblyRelationship_fkey";
       dt          postgres    false    3700    263    243            �           2606    39596 =   MaterialSpecification MaterialSpecification_assemblyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSpecification"
    ADD CONSTRAINT "MaterialSpecification_assemblyType_fkey" FOREIGN KEY ("assemblyType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 g   ALTER TABLE ONLY dt."MaterialSpecification" DROP CONSTRAINT "MaterialSpecification_assemblyType_fkey";
       dt          postgres    false    263    243    3700            �           2606    39601 >   MaterialSpecification MaterialSpecification_materialClass_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSpecification"
    ADD CONSTRAINT "MaterialSpecification_materialClass_fkey" FOREIGN KEY ("materialClass") REFERENCES dt."MaterialClass"(id) ON DELETE SET NULL;
 h   ALTER TABLE ONLY dt."MaterialSpecification" DROP CONSTRAINT "MaterialSpecification_materialClass_fkey";
       dt          postgres    false    250    3714    263            �           2606    39606 C   MaterialSpecification MaterialSpecification_materialDefinition_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSpecification"
    ADD CONSTRAINT "MaterialSpecification_materialDefinition_fkey" FOREIGN KEY ("materialDefinition") REFERENCES dt."MaterialDefinition"(id) ON DELETE SET NULL;
 m   ALTER TABLE ONLY dt."MaterialSpecification" DROP CONSTRAINT "MaterialSpecification_materialDefinition_fkey";
       dt          postgres    false    263    3720    253            �           2606    39611 K   MaterialSpecification MaterialSpecification_operationsMaterialBillItem_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSpecification"
    ADD CONSTRAINT "MaterialSpecification_operationsMaterialBillItem_fkey" FOREIGN KEY ("operationsMaterialBillItem") REFERENCES dt."OperationsMaterialBillItem"(id) ON DELETE SET NULL;
 u   ALTER TABLE ONLY dt."MaterialSpecification" DROP CONSTRAINT "MaterialSpecification_operationsMaterialBillItem_fkey";
       dt          postgres    false    263    273    3760            �           2606    39616 B   MaterialSpecification MaterialSpecification_operationsSegment_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSpecification"
    ADD CONSTRAINT "MaterialSpecification_operationsSegment_fkey" FOREIGN KEY ("operationsSegment") REFERENCES dt."OperationsSegment"(id) ON DELETE SET NULL;
 l   ALTER TABLE ONLY dt."MaterialSpecification" DROP CONSTRAINT "MaterialSpecification_operationsSegment_fkey";
       dt          postgres    false    263    3778    282            �           2606    39621 7   MaterialSpecification MaterialSpecification_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSpecification"
    ADD CONSTRAINT "MaterialSpecification_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."MaterialSpecification"(id) ON DELETE SET NULL;
 a   ALTER TABLE ONLY dt."MaterialSpecification" DROP CONSTRAINT "MaterialSpecification_parent_fkey";
       dt          postgres    false    3740    263    263            �           2606    39626 <   MaterialSpecification MaterialSpecification_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSpecification"
    ADD CONSTRAINT "MaterialSpecification_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 f   ALTER TABLE ONLY dt."MaterialSpecification" DROP CONSTRAINT "MaterialSpecification_quantityUom_fkey";
       dt          postgres    false    3908    347    263            �           2606    39631 <   MaterialSpecification MaterialSpecification_resourceUse_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSpecification"
    ADD CONSTRAINT "MaterialSpecification_resourceUse_fkey" FOREIGN KEY ("resourceUse") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 f   ALTER TABLE ONLY dt."MaterialSpecification" DROP CONSTRAINT "MaterialSpecification_resourceUse_fkey";
       dt          postgres    false    243    3700    263            �           2606    39636 7   MaterialSpecification MaterialSpecification_stream_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSpecification"
    ADD CONSTRAINT "MaterialSpecification_stream_fkey" FOREIGN KEY (stream) REFERENCES dt."Stream"(id) ON DELETE SET NULL;
 a   ALTER TABLE ONLY dt."MaterialSpecification" DROP CONSTRAINT "MaterialSpecification_stream_fkey";
       dt          postgres    false    3900    343    263            �           2606    39641 ;   MaterialSpecification MaterialSpecification_workMaster_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSpecification"
    ADD CONSTRAINT "MaterialSpecification_workMaster_fkey" FOREIGN KEY ("workMaster") REFERENCES dt."WorkMaster"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."MaterialSpecification" DROP CONSTRAINT "MaterialSpecification_workMaster_fkey";
       dt          postgres    false    3940    263    363            �           2606    39646 7   MaterialSubLot MaterialSubLot_assemblyRelationship_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSubLot"
    ADD CONSTRAINT "MaterialSubLot_assemblyRelationship_fkey" FOREIGN KEY ("assemblyRelationship") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 a   ALTER TABLE ONLY dt."MaterialSubLot" DROP CONSTRAINT "MaterialSubLot_assemblyRelationship_fkey";
       dt          postgres    false    3700    243    265            �           2606    39651 /   MaterialSubLot MaterialSubLot_assemblyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSubLot"
    ADD CONSTRAINT "MaterialSubLot_assemblyType_fkey" FOREIGN KEY ("assemblyType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 Y   ALTER TABLE ONLY dt."MaterialSubLot" DROP CONSTRAINT "MaterialSubLot_assemblyType_fkey";
       dt          postgres    false    265    243    3700            �           2606    39656 .   MaterialSubLot MaterialSubLot_materialLot_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSubLot"
    ADD CONSTRAINT "MaterialSubLot_materialLot_fkey" FOREIGN KEY ("materialLot") REFERENCES dt."MaterialLot"(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY dt."MaterialSubLot" DROP CONSTRAINT "MaterialSubLot_materialLot_fkey";
       dt          postgres    false    255    3724    265            �           2606    39661 1   MaterialSubLot MaterialSubLot_materialStatus_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSubLot"
    ADD CONSTRAINT "MaterialSubLot_materialStatus_fkey" FOREIGN KEY ("materialStatus") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 [   ALTER TABLE ONLY dt."MaterialSubLot" DROP CONSTRAINT "MaterialSubLot_materialStatus_fkey";
       dt          postgres    false    243    265    3700            �           2606    39666 .   MaterialSubLot MaterialSubLot_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSubLot"
    ADD CONSTRAINT "MaterialSubLot_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY dt."MaterialSubLot" DROP CONSTRAINT "MaterialSubLot_quantityUom_fkey";
       dt          postgres    false    3908    265    347            �           2606    39671 2   MaterialSubLot MaterialSubLot_storageLocation_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."MaterialSubLot"
    ADD CONSTRAINT "MaterialSubLot_storageLocation_fkey" FOREIGN KEY ("storageLocation") REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 \   ALTER TABLE ONLY dt."MaterialSubLot" DROP CONSTRAINT "MaterialSubLot_storageLocation_fkey";
       dt          postgres    false    3631    210    265            �           2606    39676 J   ObjectwisePatternConfiguration ObjectwisePatternConfiguration_pattern_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ObjectwisePatternConfiguration"
    ADD CONSTRAINT "ObjectwisePatternConfiguration_pattern_fkey" FOREIGN KEY (pattern) REFERENCES dt."CalendarPattern"(id) ON DELETE SET NULL;
 t   ALTER TABLE ONLY dt."ObjectwisePatternConfiguration" DROP CONSTRAINT "ObjectwisePatternConfiguration_pattern_fkey";
       dt          postgres    false    267    3619    204                        2606    39681 Y   ObjectwisePatternConfiguration ObjectwisePatternConfiguration_workCalendarDefinition_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ObjectwisePatternConfiguration"
    ADD CONSTRAINT "ObjectwisePatternConfiguration_workCalendarDefinition_fkey" FOREIGN KEY ("workCalendarDefinition") REFERENCES dt."WorkCalendarDefinition"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."ObjectwisePatternConfiguration" DROP CONSTRAINT "ObjectwisePatternConfiguration_workCalendarDefinition_fkey";
       dt          postgres    false    3914    267    350                       2606    39686 G   OperationsCapabilityProperty OperationsCapabilityProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsCapabilityProperty"
    ADD CONSTRAINT "OperationsCapabilityProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 q   ALTER TABLE ONLY dt."OperationsCapabilityProperty" DROP CONSTRAINT "OperationsCapabilityProperty_category_fkey";
       dt          postgres    false    3700    243    269                       2606    39691 S   OperationsCapabilityProperty OperationsCapabilityProperty_operationsCapability_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsCapabilityProperty"
    ADD CONSTRAINT "OperationsCapabilityProperty_operationsCapability_fkey" FOREIGN KEY ("operationsCapability") REFERENCES dt."OperationsCapability"(id) ON DELETE SET NULL;
 }   ALTER TABLE ONLY dt."OperationsCapabilityProperty" DROP CONSTRAINT "OperationsCapabilityProperty_operationsCapability_fkey";
       dt          postgres    false    268    269    3750                       2606    39696 E   OperationsCapabilityProperty OperationsCapabilityProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsCapabilityProperty"
    ADD CONSTRAINT "OperationsCapabilityProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."OperationsCapabilityProperty"(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY dt."OperationsCapabilityProperty" DROP CONSTRAINT "OperationsCapabilityProperty_parent_fkey";
       dt          postgres    false    3752    269    269                       2606    39701 K   OperationsCapabilityProperty OperationsCapabilityProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsCapabilityProperty"
    ADD CONSTRAINT "OperationsCapabilityProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 u   ALTER TABLE ONLY dt."OperationsCapabilityProperty" DROP CONSTRAINT "OperationsCapabilityProperty_propertyType_fkey";
       dt          postgres    false    269    320    3854                       2606    39706 I   OperationsCapabilityProperty OperationsCapabilityProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsCapabilityProperty"
    ADD CONSTRAINT "OperationsCapabilityProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 s   ALTER TABLE ONLY dt."OperationsCapabilityProperty" DROP CONSTRAINT "OperationsCapabilityProperty_sensorType_fkey";
       dt          postgres    false    269    3643    216            	           2606    39711 E   OperationsCapabilityProperty OperationsCapabilityProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsCapabilityProperty"
    ADD CONSTRAINT "OperationsCapabilityProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY dt."OperationsCapabilityProperty" DROP CONSTRAINT "OperationsCapabilityProperty_sensor_fkey";
       dt          postgres    false    269    210    3631            
           2606    39716 J   OperationsCapabilityProperty OperationsCapabilityProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsCapabilityProperty"
    ADD CONSTRAINT "OperationsCapabilityProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 t   ALTER TABLE ONLY dt."OperationsCapabilityProperty" DROP CONSTRAINT "OperationsCapabilityProperty_uomCategory_fkey";
       dt          postgres    false    348    3910    269                       2606    39721 G   OperationsCapabilityProperty OperationsCapabilityProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsCapabilityProperty"
    ADD CONSTRAINT "OperationsCapabilityProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 q   ALTER TABLE ONLY dt."OperationsCapabilityProperty" DROP CONSTRAINT "OperationsCapabilityProperty_valueUom_fkey";
       dt          postgres    false    347    269    3908                       2606    39726 =   OperationsCapability OperationsCapability_capabilityType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsCapability"
    ADD CONSTRAINT "OperationsCapability_capabilityType_fkey" FOREIGN KEY ("capabilityType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 g   ALTER TABLE ONLY dt."OperationsCapability" DROP CONSTRAINT "OperationsCapability_capabilityType_fkey";
       dt          postgres    false    243    268    3700                       2606    39731 =   OperationsCapability OperationsCapability_hierarchyScope_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsCapability"
    ADD CONSTRAINT "OperationsCapability_hierarchyScope_fkey" FOREIGN KEY ("hierarchyScope") REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 g   ALTER TABLE ONLY dt."OperationsCapability" DROP CONSTRAINT "OperationsCapability_hierarchyScope_fkey";
       dt          postgres    false    210    3631    268                       2606    39736 5   OperationsCapability OperationsCapability_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsCapability"
    ADD CONSTRAINT "OperationsCapability_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."OperationsCapability"(id) ON DELETE SET NULL;
 _   ALTER TABLE ONLY dt."OperationsCapability" DROP CONSTRAINT "OperationsCapability_parent_fkey";
       dt          postgres    false    268    3750    268                       2606    39741 G   OperationsDefinitionProperty OperationsDefinitionProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsDefinitionProperty"
    ADD CONSTRAINT "OperationsDefinitionProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 q   ALTER TABLE ONLY dt."OperationsDefinitionProperty" DROP CONSTRAINT "OperationsDefinitionProperty_category_fkey";
       dt          postgres    false    271    243    3700                       2606    39746 I   OperationsDefinitionProperty OperationsDefinitionProperty_logRateUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsDefinitionProperty"
    ADD CONSTRAINT "OperationsDefinitionProperty_logRateUom_fkey" FOREIGN KEY ("logRateUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 s   ALTER TABLE ONLY dt."OperationsDefinitionProperty" DROP CONSTRAINT "OperationsDefinitionProperty_logRateUom_fkey";
       dt          postgres    false    3908    347    271                       2606    39751 S   OperationsDefinitionProperty OperationsDefinitionProperty_operationsDefinition_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsDefinitionProperty"
    ADD CONSTRAINT "OperationsDefinitionProperty_operationsDefinition_fkey" FOREIGN KEY ("operationsDefinition") REFERENCES dt."OperationsDefinition"(id) ON DELETE SET NULL;
 }   ALTER TABLE ONLY dt."OperationsDefinitionProperty" DROP CONSTRAINT "OperationsDefinitionProperty_operationsDefinition_fkey";
       dt          postgres    false    3754    270    271                       2606    39756 E   OperationsDefinitionProperty OperationsDefinitionProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsDefinitionProperty"
    ADD CONSTRAINT "OperationsDefinitionProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."OperationsDefinitionProperty"(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY dt."OperationsDefinitionProperty" DROP CONSTRAINT "OperationsDefinitionProperty_parent_fkey";
       dt          postgres    false    3756    271    271                       2606    39761 K   OperationsDefinitionProperty OperationsDefinitionProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsDefinitionProperty"
    ADD CONSTRAINT "OperationsDefinitionProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 u   ALTER TABLE ONLY dt."OperationsDefinitionProperty" DROP CONSTRAINT "OperationsDefinitionProperty_propertyType_fkey";
       dt          postgres    false    271    320    3854                       2606    39766 I   OperationsDefinitionProperty OperationsDefinitionProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsDefinitionProperty"
    ADD CONSTRAINT "OperationsDefinitionProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 s   ALTER TABLE ONLY dt."OperationsDefinitionProperty" DROP CONSTRAINT "OperationsDefinitionProperty_sensorType_fkey";
       dt          postgres    false    271    216    3643                       2606    39771 E   OperationsDefinitionProperty OperationsDefinitionProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsDefinitionProperty"
    ADD CONSTRAINT "OperationsDefinitionProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY dt."OperationsDefinitionProperty" DROP CONSTRAINT "OperationsDefinitionProperty_sensor_fkey";
       dt          postgres    false    271    210    3631                       2606    39776 J   OperationsDefinitionProperty OperationsDefinitionProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsDefinitionProperty"
    ADD CONSTRAINT "OperationsDefinitionProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 t   ALTER TABLE ONLY dt."OperationsDefinitionProperty" DROP CONSTRAINT "OperationsDefinitionProperty_uomCategory_fkey";
       dt          postgres    false    271    348    3910                       2606    39781 G   OperationsDefinitionProperty OperationsDefinitionProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsDefinitionProperty"
    ADD CONSTRAINT "OperationsDefinitionProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 q   ALTER TABLE ONLY dt."OperationsDefinitionProperty" DROP CONSTRAINT "OperationsDefinitionProperty_valueUom_fkey";
       dt          postgres    false    271    347    3908                       2606    39786 =   OperationsDefinition OperationsDefinition_hierarchyScope_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsDefinition"
    ADD CONSTRAINT "OperationsDefinition_hierarchyScope_fkey" FOREIGN KEY ("hierarchyScope") REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 g   ALTER TABLE ONLY dt."OperationsDefinition" DROP CONSTRAINT "OperationsDefinition_hierarchyScope_fkey";
       dt          postgres    false    270    210    3631                       2606    39791 =   OperationsDefinition OperationsDefinition_operationsType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsDefinition"
    ADD CONSTRAINT "OperationsDefinition_operationsType_fkey" FOREIGN KEY ("operationsType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 g   ALTER TABLE ONLY dt."OperationsDefinition" DROP CONSTRAINT "OperationsDefinition_operationsType_fkey";
       dt          postgres    false    270    243    3700                       2606    39796 9   OperationsDefinition OperationsDefinition_recordType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsDefinition"
    ADD CONSTRAINT "OperationsDefinition_recordType_fkey" FOREIGN KEY ("recordType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY dt."OperationsDefinition" DROP CONSTRAINT "OperationsDefinition_recordType_fkey";
       dt          postgres    false    270    243    3700                       2606    39801 O   OperationsMaterialBillItem OperationsMaterialBillItem_assemblyRelationship_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsMaterialBillItem"
    ADD CONSTRAINT "OperationsMaterialBillItem_assemblyRelationship_fkey" FOREIGN KEY ("assemblyRelationship") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 y   ALTER TABLE ONLY dt."OperationsMaterialBillItem" DROP CONSTRAINT "OperationsMaterialBillItem_assemblyRelationship_fkey";
       dt          postgres    false    273    243    3700                       2606    39806 G   OperationsMaterialBillItem OperationsMaterialBillItem_assemblyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsMaterialBillItem"
    ADD CONSTRAINT "OperationsMaterialBillItem_assemblyType_fkey" FOREIGN KEY ("assemblyType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 q   ALTER TABLE ONLY dt."OperationsMaterialBillItem" DROP CONSTRAINT "OperationsMaterialBillItem_assemblyType_fkey";
       dt          postgres    false    273    243    3700                       2606    39811 H   OperationsMaterialBillItem OperationsMaterialBillItem_materialClass_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsMaterialBillItem"
    ADD CONSTRAINT "OperationsMaterialBillItem_materialClass_fkey" FOREIGN KEY ("materialClass") REFERENCES dt."MaterialClass"(id) ON DELETE SET NULL;
 r   ALTER TABLE ONLY dt."OperationsMaterialBillItem" DROP CONSTRAINT "OperationsMaterialBillItem_materialClass_fkey";
       dt          postgres    false    273    250    3714                       2606    39816 M   OperationsMaterialBillItem OperationsMaterialBillItem_materialDefinition_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsMaterialBillItem"
    ADD CONSTRAINT "OperationsMaterialBillItem_materialDefinition_fkey" FOREIGN KEY ("materialDefinition") REFERENCES dt."MaterialDefinition"(id) ON DELETE SET NULL;
 w   ALTER TABLE ONLY dt."OperationsMaterialBillItem" DROP CONSTRAINT "OperationsMaterialBillItem_materialDefinition_fkey";
       dt          postgres    false    273    253    3720                       2606    39821 Q   OperationsMaterialBillItem OperationsMaterialBillItem_operationsMaterialBill_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsMaterialBillItem"
    ADD CONSTRAINT "OperationsMaterialBillItem_operationsMaterialBill_fkey" FOREIGN KEY ("operationsMaterialBill") REFERENCES dt."OperationsMaterialBill"(id) ON DELETE SET NULL;
 {   ALTER TABLE ONLY dt."OperationsMaterialBillItem" DROP CONSTRAINT "OperationsMaterialBillItem_operationsMaterialBill_fkey";
       dt          postgres    false    273    272    3758                       2606    39826 A   OperationsMaterialBillItem OperationsMaterialBillItem_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsMaterialBillItem"
    ADD CONSTRAINT "OperationsMaterialBillItem_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."OperationsMaterialBillItem"(id) ON DELETE SET NULL;
 k   ALTER TABLE ONLY dt."OperationsMaterialBillItem" DROP CONSTRAINT "OperationsMaterialBillItem_parent_fkey";
       dt          postgres    false    273    273    3760                       2606    39831 F   OperationsMaterialBillItem OperationsMaterialBillItem_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsMaterialBillItem"
    ADD CONSTRAINT "OperationsMaterialBillItem_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 p   ALTER TABLE ONLY dt."OperationsMaterialBillItem" DROP CONSTRAINT "OperationsMaterialBillItem_quantityUom_fkey";
       dt          postgres    false    273    347    3908                        2606    39836 F   OperationsMaterialBillItem OperationsMaterialBillItem_resourceUse_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsMaterialBillItem"
    ADD CONSTRAINT "OperationsMaterialBillItem_resourceUse_fkey" FOREIGN KEY ("resourceUse") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 p   ALTER TABLE ONLY dt."OperationsMaterialBillItem" DROP CONSTRAINT "OperationsMaterialBillItem_resourceUse_fkey";
       dt          postgres    false    273    243    3700                       2606    39841 G   OperationsMaterialBill OperationsMaterialBill_operationsDefinition_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsMaterialBill"
    ADD CONSTRAINT "OperationsMaterialBill_operationsDefinition_fkey" FOREIGN KEY ("operationsDefinition") REFERENCES dt."OperationsDefinition"(id) ON DELETE SET NULL;
 q   ALTER TABLE ONLY dt."OperationsMaterialBill" DROP CONSTRAINT "OperationsMaterialBill_operationsDefinition_fkey";
       dt          postgres    false    272    270    3754            %           2606    39846 I   OperationsPerformanceProperty OperationsPerformanceProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsPerformanceProperty"
    ADD CONSTRAINT "OperationsPerformanceProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 s   ALTER TABLE ONLY dt."OperationsPerformanceProperty" DROP CONSTRAINT "OperationsPerformanceProperty_category_fkey";
       dt          postgres    false    275    243    3700            &           2606    39851 V   OperationsPerformanceProperty OperationsPerformanceProperty_operationsPerformance_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsPerformanceProperty"
    ADD CONSTRAINT "OperationsPerformanceProperty_operationsPerformance_fkey" FOREIGN KEY ("operationsPerformance") REFERENCES dt."OperationsPerformance"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."OperationsPerformanceProperty" DROP CONSTRAINT "OperationsPerformanceProperty_operationsPerformance_fkey";
       dt          postgres    false    275    274    3762            '           2606    39856 G   OperationsPerformanceProperty OperationsPerformanceProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsPerformanceProperty"
    ADD CONSTRAINT "OperationsPerformanceProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."OperationsPerformanceProperty"(id) ON DELETE SET NULL;
 q   ALTER TABLE ONLY dt."OperationsPerformanceProperty" DROP CONSTRAINT "OperationsPerformanceProperty_parent_fkey";
       dt          postgres    false    275    275    3764            (           2606    39861 M   OperationsPerformanceProperty OperationsPerformanceProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsPerformanceProperty"
    ADD CONSTRAINT "OperationsPerformanceProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 w   ALTER TABLE ONLY dt."OperationsPerformanceProperty" DROP CONSTRAINT "OperationsPerformanceProperty_propertyType_fkey";
       dt          postgres    false    275    320    3854            )           2606    39866 K   OperationsPerformanceProperty OperationsPerformanceProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsPerformanceProperty"
    ADD CONSTRAINT "OperationsPerformanceProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 u   ALTER TABLE ONLY dt."OperationsPerformanceProperty" DROP CONSTRAINT "OperationsPerformanceProperty_sensorType_fkey";
       dt          postgres    false    275    216    3643            *           2606    39871 G   OperationsPerformanceProperty OperationsPerformanceProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsPerformanceProperty"
    ADD CONSTRAINT "OperationsPerformanceProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 q   ALTER TABLE ONLY dt."OperationsPerformanceProperty" DROP CONSTRAINT "OperationsPerformanceProperty_sensor_fkey";
       dt          postgres    false    275    210    3631            +           2606    39876 L   OperationsPerformanceProperty OperationsPerformanceProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsPerformanceProperty"
    ADD CONSTRAINT "OperationsPerformanceProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 v   ALTER TABLE ONLY dt."OperationsPerformanceProperty" DROP CONSTRAINT "OperationsPerformanceProperty_uomCategory_fkey";
       dt          postgres    false    275    3910    348            ,           2606    39881 I   OperationsPerformanceProperty OperationsPerformanceProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsPerformanceProperty"
    ADD CONSTRAINT "OperationsPerformanceProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 s   ALTER TABLE ONLY dt."OperationsPerformanceProperty" DROP CONSTRAINT "OperationsPerformanceProperty_valueUom_fkey";
       dt          postgres    false    275    347    3908            !           2606    39886 ?   OperationsPerformance OperationsPerformance_hierarchyScope_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsPerformance"
    ADD CONSTRAINT "OperationsPerformance_hierarchyScope_fkey" FOREIGN KEY ("hierarchyScope") REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 i   ALTER TABLE ONLY dt."OperationsPerformance" DROP CONSTRAINT "OperationsPerformance_hierarchyScope_fkey";
       dt          postgres    false    3631    274    210            "           2606    39891 C   OperationsPerformance OperationsPerformance_operationsSchedule_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsPerformance"
    ADD CONSTRAINT "OperationsPerformance_operationsSchedule_fkey" FOREIGN KEY ("operationsSchedule") REFERENCES dt."OperationsSchedule"(id) ON DELETE SET NULL;
 m   ALTER TABLE ONLY dt."OperationsPerformance" DROP CONSTRAINT "OperationsPerformance_operationsSchedule_fkey";
       dt          postgres    false    280    274    3774            #           2606    39896 ?   OperationsPerformance OperationsPerformance_operationsType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsPerformance"
    ADD CONSTRAINT "OperationsPerformance_operationsType_fkey" FOREIGN KEY ("operationsType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 i   ALTER TABLE ONLY dt."OperationsPerformance" DROP CONSTRAINT "OperationsPerformance_operationsType_fkey";
       dt          postgres    false    274    243    3700            $           2606    39901 B   OperationsPerformance OperationsPerformance_performanceStatus_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsPerformance"
    ADD CONSTRAINT "OperationsPerformance_performanceStatus_fkey" FOREIGN KEY ("performanceStatus") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 l   ALTER TABLE ONLY dt."OperationsPerformance" DROP CONSTRAINT "OperationsPerformance_performanceStatus_fkey";
       dt          postgres    false    3700    274    243            4           2606    39906 A   OperationsRequestProperty OperationsRequestProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsRequestProperty"
    ADD CONSTRAINT "OperationsRequestProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 k   ALTER TABLE ONLY dt."OperationsRequestProperty" DROP CONSTRAINT "OperationsRequestProperty_category_fkey";
       dt          postgres    false    3700    277    243            5           2606    39911 C   OperationsRequestProperty OperationsRequestProperty_logRateUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsRequestProperty"
    ADD CONSTRAINT "OperationsRequestProperty_logRateUom_fkey" FOREIGN KEY ("logRateUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 m   ALTER TABLE ONLY dt."OperationsRequestProperty" DROP CONSTRAINT "OperationsRequestProperty_logRateUom_fkey";
       dt          postgres    false    3908    277    347            6           2606    39916 J   OperationsRequestProperty OperationsRequestProperty_operationsRequest_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsRequestProperty"
    ADD CONSTRAINT "OperationsRequestProperty_operationsRequest_fkey" FOREIGN KEY ("operationsRequest") REFERENCES dt."OperationsRequest"(id) ON DELETE SET NULL;
 t   ALTER TABLE ONLY dt."OperationsRequestProperty" DROP CONSTRAINT "OperationsRequestProperty_operationsRequest_fkey";
       dt          postgres    false    277    3766    276            7           2606    39921 ?   OperationsRequestProperty OperationsRequestProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsRequestProperty"
    ADD CONSTRAINT "OperationsRequestProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."OperationsRequestProperty"(id) ON DELETE SET NULL;
 i   ALTER TABLE ONLY dt."OperationsRequestProperty" DROP CONSTRAINT "OperationsRequestProperty_parent_fkey";
       dt          postgres    false    277    3768    277            8           2606    39926 E   OperationsRequestProperty OperationsRequestProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsRequestProperty"
    ADD CONSTRAINT "OperationsRequestProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY dt."OperationsRequestProperty" DROP CONSTRAINT "OperationsRequestProperty_propertyType_fkey";
       dt          postgres    false    277    320    3854            9           2606    39931 C   OperationsRequestProperty OperationsRequestProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsRequestProperty"
    ADD CONSTRAINT "OperationsRequestProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 m   ALTER TABLE ONLY dt."OperationsRequestProperty" DROP CONSTRAINT "OperationsRequestProperty_sensorType_fkey";
       dt          postgres    false    3643    216    277            :           2606    39936 ?   OperationsRequestProperty OperationsRequestProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsRequestProperty"
    ADD CONSTRAINT "OperationsRequestProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 i   ALTER TABLE ONLY dt."OperationsRequestProperty" DROP CONSTRAINT "OperationsRequestProperty_sensor_fkey";
       dt          postgres    false    277    3631    210            ;           2606    39941 D   OperationsRequestProperty OperationsRequestProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsRequestProperty"
    ADD CONSTRAINT "OperationsRequestProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 n   ALTER TABLE ONLY dt."OperationsRequestProperty" DROP CONSTRAINT "OperationsRequestProperty_uomCategory_fkey";
       dt          postgres    false    348    277    3910            <           2606    39946 A   OperationsRequestProperty OperationsRequestProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsRequestProperty"
    ADD CONSTRAINT "OperationsRequestProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 k   ALTER TABLE ONLY dt."OperationsRequestProperty" DROP CONSTRAINT "OperationsRequestProperty_valueUom_fkey";
       dt          postgres    false    277    3908    347            -           2606    39951 7   OperationsRequest OperationsRequest_hierarchyScope_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsRequest"
    ADD CONSTRAINT "OperationsRequest_hierarchyScope_fkey" FOREIGN KEY ("hierarchyScope") REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 a   ALTER TABLE ONLY dt."OperationsRequest" DROP CONSTRAINT "OperationsRequest_hierarchyScope_fkey";
       dt          postgres    false    3631    276    210            .           2606    39956 =   OperationsRequest OperationsRequest_operationsDefinition_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsRequest"
    ADD CONSTRAINT "OperationsRequest_operationsDefinition_fkey" FOREIGN KEY ("operationsDefinition") REFERENCES dt."OperationsDefinition"(id) ON DELETE SET NULL;
 g   ALTER TABLE ONLY dt."OperationsRequest" DROP CONSTRAINT "OperationsRequest_operationsDefinition_fkey";
       dt          postgres    false    276    3754    270            /           2606    39961 ;   OperationsRequest OperationsRequest_operationsSchedule_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsRequest"
    ADD CONSTRAINT "OperationsRequest_operationsSchedule_fkey" FOREIGN KEY ("operationsSchedule") REFERENCES dt."OperationsSchedule"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."OperationsRequest" DROP CONSTRAINT "OperationsRequest_operationsSchedule_fkey";
       dt          postgres    false    276    3774    280            0           2606    39966 7   OperationsRequest OperationsRequest_operationsType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsRequest"
    ADD CONSTRAINT "OperationsRequest_operationsType_fkey" FOREIGN KEY ("operationsType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 a   ALTER TABLE ONLY dt."OperationsRequest" DROP CONSTRAINT "OperationsRequest_operationsType_fkey";
       dt          postgres    false    3700    243    276            1           2606    39971 ;   OperationsRequest OperationsRequest_orderRequestStatus_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsRequest"
    ADD CONSTRAINT "OperationsRequest_orderRequestStatus_fkey" FOREIGN KEY ("orderRequestStatus") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."OperationsRequest" DROP CONSTRAINT "OperationsRequest_orderRequestStatus_fkey";
       dt          postgres    false    243    3700    276            2           2606    39976 1   OperationsRequest OperationsRequest_priority_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsRequest"
    ADD CONSTRAINT "OperationsRequest_priority_fkey" FOREIGN KEY (priority) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 [   ALTER TABLE ONLY dt."OperationsRequest" DROP CONSTRAINT "OperationsRequest_priority_fkey";
       dt          postgres    false    3700    276    243            3           2606    39981 3   OperationsRequest OperationsRequest_workMaster_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsRequest"
    ADD CONSTRAINT "OperationsRequest_workMaster_fkey" FOREIGN KEY ("workMaster") REFERENCES dt."WorkMaster"(id) ON DELETE SET NULL;
 ]   ALTER TABLE ONLY dt."OperationsRequest" DROP CONSTRAINT "OperationsRequest_workMaster_fkey";
       dt          postgres    false    363    3940    276            C           2606    39986 C   OperationsResponseProperty OperationsResponseProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsResponseProperty"
    ADD CONSTRAINT "OperationsResponseProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 m   ALTER TABLE ONLY dt."OperationsResponseProperty" DROP CONSTRAINT "OperationsResponseProperty_category_fkey";
       dt          postgres    false    279    243    3700            D           2606    39991 M   OperationsResponseProperty OperationsResponseProperty_operationsResponse_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsResponseProperty"
    ADD CONSTRAINT "OperationsResponseProperty_operationsResponse_fkey" FOREIGN KEY ("operationsResponse") REFERENCES dt."OperationsResponse"(id) ON DELETE SET NULL;
 w   ALTER TABLE ONLY dt."OperationsResponseProperty" DROP CONSTRAINT "OperationsResponseProperty_operationsResponse_fkey";
       dt          postgres    false    278    3770    279            E           2606    39996 A   OperationsResponseProperty OperationsResponseProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsResponseProperty"
    ADD CONSTRAINT "OperationsResponseProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."OperationsResponseProperty"(id) ON DELETE SET NULL;
 k   ALTER TABLE ONLY dt."OperationsResponseProperty" DROP CONSTRAINT "OperationsResponseProperty_parent_fkey";
       dt          postgres    false    279    3772    279            F           2606    40001 G   OperationsResponseProperty OperationsResponseProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsResponseProperty"
    ADD CONSTRAINT "OperationsResponseProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 q   ALTER TABLE ONLY dt."OperationsResponseProperty" DROP CONSTRAINT "OperationsResponseProperty_propertyType_fkey";
       dt          postgres    false    3854    279    320            G           2606    40006 E   OperationsResponseProperty OperationsResponseProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsResponseProperty"
    ADD CONSTRAINT "OperationsResponseProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY dt."OperationsResponseProperty" DROP CONSTRAINT "OperationsResponseProperty_sensorType_fkey";
       dt          postgres    false    216    279    3643            H           2606    40011 A   OperationsResponseProperty OperationsResponseProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsResponseProperty"
    ADD CONSTRAINT "OperationsResponseProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 k   ALTER TABLE ONLY dt."OperationsResponseProperty" DROP CONSTRAINT "OperationsResponseProperty_sensor_fkey";
       dt          postgres    false    3631    279    210            I           2606    40016 F   OperationsResponseProperty OperationsResponseProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsResponseProperty"
    ADD CONSTRAINT "OperationsResponseProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 p   ALTER TABLE ONLY dt."OperationsResponseProperty" DROP CONSTRAINT "OperationsResponseProperty_uomCategory_fkey";
       dt          postgres    false    3910    279    348            J           2606    40021 C   OperationsResponseProperty OperationsResponseProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsResponseProperty"
    ADD CONSTRAINT "OperationsResponseProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 m   ALTER TABLE ONLY dt."OperationsResponseProperty" DROP CONSTRAINT "OperationsResponseProperty_valueUom_fkey";
       dt          postgres    false    279    3908    347            =           2606    40026 9   OperationsResponse OperationsResponse_hierarchyScope_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsResponse"
    ADD CONSTRAINT "OperationsResponse_hierarchyScope_fkey" FOREIGN KEY ("hierarchyScope") REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY dt."OperationsResponse" DROP CONSTRAINT "OperationsResponse_hierarchyScope_fkey";
       dt          postgres    false    278    210    3631            >           2606    40031 ?   OperationsResponse OperationsResponse_operationsDefinition_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsResponse"
    ADD CONSTRAINT "OperationsResponse_operationsDefinition_fkey" FOREIGN KEY ("operationsDefinition") REFERENCES dt."OperationsDefinition"(id) ON DELETE SET NULL;
 i   ALTER TABLE ONLY dt."OperationsResponse" DROP CONSTRAINT "OperationsResponse_operationsDefinition_fkey";
       dt          postgres    false    270    278    3754            ?           2606    40036 @   OperationsResponse OperationsResponse_operationsPerformance_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsResponse"
    ADD CONSTRAINT "OperationsResponse_operationsPerformance_fkey" FOREIGN KEY ("operationsPerformance") REFERENCES dt."OperationsPerformance"(id) ON DELETE SET NULL;
 j   ALTER TABLE ONLY dt."OperationsResponse" DROP CONSTRAINT "OperationsResponse_operationsPerformance_fkey";
       dt          postgres    false    3762    278    274            @           2606    40041 <   OperationsResponse OperationsResponse_operationsRequest_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsResponse"
    ADD CONSTRAINT "OperationsResponse_operationsRequest_fkey" FOREIGN KEY ("operationsRequest") REFERENCES dt."OperationsRequest"(id) ON DELETE SET NULL;
 f   ALTER TABLE ONLY dt."OperationsResponse" DROP CONSTRAINT "OperationsResponse_operationsRequest_fkey";
       dt          postgres    false    3766    278    276            A           2606    40046 9   OperationsResponse OperationsResponse_operationsType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsResponse"
    ADD CONSTRAINT "OperationsResponse_operationsType_fkey" FOREIGN KEY ("operationsType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY dt."OperationsResponse" DROP CONSTRAINT "OperationsResponse_operationsType_fkey";
       dt          postgres    false    3700    278    243            B           2606    40051 9   OperationsResponse OperationsResponse_responseStatus_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsResponse"
    ADD CONSTRAINT "OperationsResponse_responseStatus_fkey" FOREIGN KEY ("responseStatus") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY dt."OperationsResponse" DROP CONSTRAINT "OperationsResponse_responseStatus_fkey";
       dt          postgres    false    243    3700    278            N           2606    40056 C   OperationsScheduleProperty OperationsScheduleProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsScheduleProperty"
    ADD CONSTRAINT "OperationsScheduleProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 m   ALTER TABLE ONLY dt."OperationsScheduleProperty" DROP CONSTRAINT "OperationsScheduleProperty_category_fkey";
       dt          postgres    false    3700    281    243            O           2606    40061 E   OperationsScheduleProperty OperationsScheduleProperty_logRateUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsScheduleProperty"
    ADD CONSTRAINT "OperationsScheduleProperty_logRateUom_fkey" FOREIGN KEY ("logRateUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY dt."OperationsScheduleProperty" DROP CONSTRAINT "OperationsScheduleProperty_logRateUom_fkey";
       dt          postgres    false    347    3908    281            P           2606    40066 M   OperationsScheduleProperty OperationsScheduleProperty_operationsSchedule_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsScheduleProperty"
    ADD CONSTRAINT "OperationsScheduleProperty_operationsSchedule_fkey" FOREIGN KEY ("operationsSchedule") REFERENCES dt."OperationsSchedule"(id) ON DELETE SET NULL;
 w   ALTER TABLE ONLY dt."OperationsScheduleProperty" DROP CONSTRAINT "OperationsScheduleProperty_operationsSchedule_fkey";
       dt          postgres    false    3774    280    281            Q           2606    40071 A   OperationsScheduleProperty OperationsScheduleProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsScheduleProperty"
    ADD CONSTRAINT "OperationsScheduleProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."OperationsScheduleProperty"(id) ON DELETE SET NULL;
 k   ALTER TABLE ONLY dt."OperationsScheduleProperty" DROP CONSTRAINT "OperationsScheduleProperty_parent_fkey";
       dt          postgres    false    3776    281    281            R           2606    40076 G   OperationsScheduleProperty OperationsScheduleProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsScheduleProperty"
    ADD CONSTRAINT "OperationsScheduleProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 q   ALTER TABLE ONLY dt."OperationsScheduleProperty" DROP CONSTRAINT "OperationsScheduleProperty_propertyType_fkey";
       dt          postgres    false    281    3854    320            S           2606    40081 E   OperationsScheduleProperty OperationsScheduleProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsScheduleProperty"
    ADD CONSTRAINT "OperationsScheduleProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY dt."OperationsScheduleProperty" DROP CONSTRAINT "OperationsScheduleProperty_sensorType_fkey";
       dt          postgres    false    3643    216    281            T           2606    40086 A   OperationsScheduleProperty OperationsScheduleProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsScheduleProperty"
    ADD CONSTRAINT "OperationsScheduleProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 k   ALTER TABLE ONLY dt."OperationsScheduleProperty" DROP CONSTRAINT "OperationsScheduleProperty_sensor_fkey";
       dt          postgres    false    3631    281    210            U           2606    40091 F   OperationsScheduleProperty OperationsScheduleProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsScheduleProperty"
    ADD CONSTRAINT "OperationsScheduleProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 p   ALTER TABLE ONLY dt."OperationsScheduleProperty" DROP CONSTRAINT "OperationsScheduleProperty_uomCategory_fkey";
       dt          postgres    false    3910    348    281            V           2606    40096 C   OperationsScheduleProperty OperationsScheduleProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsScheduleProperty"
    ADD CONSTRAINT "OperationsScheduleProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 m   ALTER TABLE ONLY dt."OperationsScheduleProperty" DROP CONSTRAINT "OperationsScheduleProperty_valueUom_fkey";
       dt          postgres    false    281    347    3908            K           2606    40101 9   OperationsSchedule OperationsSchedule_hierarchyScope_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsSchedule"
    ADD CONSTRAINT "OperationsSchedule_hierarchyScope_fkey" FOREIGN KEY ("hierarchyScope") REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY dt."OperationsSchedule" DROP CONSTRAINT "OperationsSchedule_hierarchyScope_fkey";
       dt          postgres    false    3631    280    210            L           2606    40106 9   OperationsSchedule OperationsSchedule_operationsType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsSchedule"
    ADD CONSTRAINT "OperationsSchedule_operationsType_fkey" FOREIGN KEY ("operationsType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY dt."OperationsSchedule" DROP CONSTRAINT "OperationsSchedule_operationsType_fkey";
       dt          postgres    false    3700    243    280            M           2606    40111 :   OperationsSchedule OperationsSchedule_scheduledStatus_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsSchedule"
    ADD CONSTRAINT "OperationsSchedule_scheduledStatus_fkey" FOREIGN KEY ("scheduledStatus") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 d   ALTER TABLE ONLY dt."OperationsSchedule" DROP CONSTRAINT "OperationsSchedule_scheduledStatus_fkey";
       dt          postgres    false    3700    243    280            ^           2606    40116 M   OperationsSegmentDependency OperationsSegmentDependency_dependencyFactor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsSegmentDependency"
    ADD CONSTRAINT "OperationsSegmentDependency_dependencyFactor_fkey" FOREIGN KEY ("dependencyFactor") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 w   ALTER TABLE ONLY dt."OperationsSegmentDependency" DROP CONSTRAINT "OperationsSegmentDependency_dependencyFactor_fkey";
       dt          postgres    false    243    3700    283            _           2606    40121 K   OperationsSegmentDependency OperationsSegmentDependency_dependencyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsSegmentDependency"
    ADD CONSTRAINT "OperationsSegmentDependency_dependencyType_fkey" FOREIGN KEY ("dependencyType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 u   ALTER TABLE ONLY dt."OperationsSegmentDependency" DROP CONSTRAINT "OperationsSegmentDependency_dependencyType_fkey";
       dt          postgres    false    3700    283    243            `           2606    40126 M   OperationsSegmentDependency OperationsSegmentDependency_dependentSegment_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsSegmentDependency"
    ADD CONSTRAINT "OperationsSegmentDependency_dependentSegment_fkey" FOREIGN KEY ("dependentSegment") REFERENCES dt."OperationsSegment"(id) ON DELETE SET NULL;
 w   ALTER TABLE ONLY dt."OperationsSegmentDependency" DROP CONSTRAINT "OperationsSegmentDependency_dependentSegment_fkey";
       dt          postgres    false    3778    282    283            a           2606    40131 D   OperationsSegmentDependency OperationsSegmentDependency_segment_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsSegmentDependency"
    ADD CONSTRAINT "OperationsSegmentDependency_segment_fkey" FOREIGN KEY (segment) REFERENCES dt."OperationsSegment"(id) ON DELETE SET NULL;
 n   ALTER TABLE ONLY dt."OperationsSegmentDependency" DROP CONSTRAINT "OperationsSegmentDependency_segment_fkey";
       dt          postgres    false    282    283    3778            b           2606    40136 E   OperationsSegmentDependency OperationsSegmentDependency_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsSegmentDependency"
    ADD CONSTRAINT "OperationsSegmentDependency_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY dt."OperationsSegmentDependency" DROP CONSTRAINT "OperationsSegmentDependency_valueUom_fkey";
       dt          postgres    false    347    283    3908            c           2606    40141 ]   OperationsSegmentParameterSpecification OperationsSegmentParameterSpecification_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsSegmentParameterSpecification"
    ADD CONSTRAINT "OperationsSegmentParameterSpecification_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."OperationsSegmentParameterSpecification" DROP CONSTRAINT "OperationsSegmentParameterSpecification_category_fkey";
       dt          postgres    false    3700    243    284            d           2606    40146 _   OperationsSegmentParameterSpecification OperationsSegmentParameterSpecification_logRateUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsSegmentParameterSpecification"
    ADD CONSTRAINT "OperationsSegmentParameterSpecification_logRateUom_fkey" FOREIGN KEY ("logRateUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."OperationsSegmentParameterSpecification" DROP CONSTRAINT "OperationsSegmentParameterSpecification_logRateUom_fkey";
       dt          postgres    false    347    284    3908            e           2606    40151 f   OperationsSegmentParameterSpecification OperationsSegmentParameterSpecification_operationsSegment_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsSegmentParameterSpecification"
    ADD CONSTRAINT "OperationsSegmentParameterSpecification_operationsSegment_fkey" FOREIGN KEY ("operationsSegment") REFERENCES dt."OperationsSegment"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."OperationsSegmentParameterSpecification" DROP CONSTRAINT "OperationsSegmentParameterSpecification_operationsSegment_fkey";
       dt          postgres    false    282    284    3778            f           2606    40156 [   OperationsSegmentParameterSpecification OperationsSegmentParameterSpecification_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsSegmentParameterSpecification"
    ADD CONSTRAINT "OperationsSegmentParameterSpecification_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."OperationsSegmentParameterSpecification"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."OperationsSegmentParameterSpecification" DROP CONSTRAINT "OperationsSegmentParameterSpecification_parent_fkey";
       dt          postgres    false    284    284    3782            g           2606    40161 a   OperationsSegmentParameterSpecification OperationsSegmentParameterSpecification_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsSegmentParameterSpecification"
    ADD CONSTRAINT "OperationsSegmentParameterSpecification_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."OperationsSegmentParameterSpecification" DROP CONSTRAINT "OperationsSegmentParameterSpecification_propertyType_fkey";
       dt          postgres    false    3854    284    320            h           2606    40166 _   OperationsSegmentParameterSpecification OperationsSegmentParameterSpecification_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsSegmentParameterSpecification"
    ADD CONSTRAINT "OperationsSegmentParameterSpecification_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."OperationsSegmentParameterSpecification" DROP CONSTRAINT "OperationsSegmentParameterSpecification_sensorType_fkey";
       dt          postgres    false    284    3643    216            i           2606    40171 [   OperationsSegmentParameterSpecification OperationsSegmentParameterSpecification_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsSegmentParameterSpecification"
    ADD CONSTRAINT "OperationsSegmentParameterSpecification_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."OperationsSegmentParameterSpecification" DROP CONSTRAINT "OperationsSegmentParameterSpecification_sensor_fkey";
       dt          postgres    false    284    3631    210            j           2606    40176 `   OperationsSegmentParameterSpecification OperationsSegmentParameterSpecification_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsSegmentParameterSpecification"
    ADD CONSTRAINT "OperationsSegmentParameterSpecification_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."OperationsSegmentParameterSpecification" DROP CONSTRAINT "OperationsSegmentParameterSpecification_uomCategory_fkey";
       dt          postgres    false    3910    348    284            k           2606    40181 ]   OperationsSegmentParameterSpecification OperationsSegmentParameterSpecification_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsSegmentParameterSpecification"
    ADD CONSTRAINT "OperationsSegmentParameterSpecification_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."OperationsSegmentParameterSpecification" DROP CONSTRAINT "OperationsSegmentParameterSpecification_valueUom_fkey";
       dt          postgres    false    284    3908    347            W           2606    40186 4   OperationsSegment OperationsSegment_durationUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsSegment"
    ADD CONSTRAINT "OperationsSegment_durationUom_fkey" FOREIGN KEY ("durationUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY dt."OperationsSegment" DROP CONSTRAINT "OperationsSegment_durationUom_fkey";
       dt          postgres    false    282    3908    347            X           2606    40191 7   OperationsSegment OperationsSegment_hierarchyScope_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsSegment"
    ADD CONSTRAINT "OperationsSegment_hierarchyScope_fkey" FOREIGN KEY ("hierarchyScope") REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 a   ALTER TABLE ONLY dt."OperationsSegment" DROP CONSTRAINT "OperationsSegment_hierarchyScope_fkey";
       dt          postgres    false    210    3631    282            Y           2606    40196 =   OperationsSegment OperationsSegment_operationsDefinition_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsSegment"
    ADD CONSTRAINT "OperationsSegment_operationsDefinition_fkey" FOREIGN KEY ("operationsDefinition") REFERENCES dt."OperationsDefinition"(id) ON DELETE SET NULL;
 g   ALTER TABLE ONLY dt."OperationsSegment" DROP CONSTRAINT "OperationsSegment_operationsDefinition_fkey";
       dt          postgres    false    3754    282    270            Z           2606    40201 7   OperationsSegment OperationsSegment_operationsType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsSegment"
    ADD CONSTRAINT "OperationsSegment_operationsType_fkey" FOREIGN KEY ("operationsType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 a   ALTER TABLE ONLY dt."OperationsSegment" DROP CONSTRAINT "OperationsSegment_operationsType_fkey";
       dt          postgres    false    3700    243    282            [           2606    40206 /   OperationsSegment OperationsSegment_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsSegment"
    ADD CONSTRAINT "OperationsSegment_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."OperationsSegment"(id) ON DELETE SET NULL;
 Y   ALTER TABLE ONLY dt."OperationsSegment" DROP CONSTRAINT "OperationsSegment_parent_fkey";
       dt          postgres    false    3778    282    282            \           2606    40211 7   OperationsSegment OperationsSegment_processSegment_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsSegment"
    ADD CONSTRAINT "OperationsSegment_processSegment_fkey" FOREIGN KEY ("processSegment") REFERENCES dt."ProcessSegment"(id) ON DELETE SET NULL;
 a   ALTER TABLE ONLY dt."OperationsSegment" DROP CONSTRAINT "OperationsSegment_processSegment_fkey";
       dt          postgres    false    282    315    3844            ]           2606    40216 3   OperationsSegment OperationsSegment_recordType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."OperationsSegment"
    ADD CONSTRAINT "OperationsSegment_recordType_fkey" FOREIGN KEY ("recordType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 ]   ALTER TABLE ONLY dt."OperationsSegment" DROP CONSTRAINT "OperationsSegment_recordType_fkey";
       dt          postgres    false    243    282    3700            l           2606    40221 +   PersonProperty PersonProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonProperty"
    ADD CONSTRAINT "PersonProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 U   ALTER TABLE ONLY dt."PersonProperty" DROP CONSTRAINT "PersonProperty_category_fkey";
       dt          postgres    false    286    3700    243            m           2606    40226 )   PersonProperty PersonProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonProperty"
    ADD CONSTRAINT "PersonProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."PersonProperty"(id) ON DELETE SET NULL;
 S   ALTER TABLE ONLY dt."PersonProperty" DROP CONSTRAINT "PersonProperty_parent_fkey";
       dt          postgres    false    3786    286    286            n           2606    40231 )   PersonProperty PersonProperty_person_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonProperty"
    ADD CONSTRAINT "PersonProperty_person_fkey" FOREIGN KEY (person) REFERENCES dt."Person"(id) ON DELETE SET NULL;
 S   ALTER TABLE ONLY dt."PersonProperty" DROP CONSTRAINT "PersonProperty_person_fkey";
       dt          postgres    false    3784    286    285            o           2606    40236 /   PersonProperty PersonProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonProperty"
    ADD CONSTRAINT "PersonProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 Y   ALTER TABLE ONLY dt."PersonProperty" DROP CONSTRAINT "PersonProperty_propertyType_fkey";
       dt          postgres    false    320    286    3854            p           2606    40241 -   PersonProperty PersonProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonProperty"
    ADD CONSTRAINT "PersonProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 W   ALTER TABLE ONLY dt."PersonProperty" DROP CONSTRAINT "PersonProperty_sensorType_fkey";
       dt          postgres    false    216    3643    286            q           2606    40246 )   PersonProperty PersonProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonProperty"
    ADD CONSTRAINT "PersonProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 S   ALTER TABLE ONLY dt."PersonProperty" DROP CONSTRAINT "PersonProperty_sensor_fkey";
       dt          postgres    false    3631    286    210            r           2606    40251 .   PersonProperty PersonProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonProperty"
    ADD CONSTRAINT "PersonProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY dt."PersonProperty" DROP CONSTRAINT "PersonProperty_uomCategory_fkey";
       dt          postgres    false    3910    286    348            s           2606    40256 +   PersonProperty PersonProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonProperty"
    ADD CONSTRAINT "PersonProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 U   ALTER TABLE ONLY dt."PersonProperty" DROP CONSTRAINT "PersonProperty_valueUom_fkey";
       dt          postgres    false    3908    347    286            y           2606    40261 =   PersonnelActualProperty PersonnelActualProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelActualProperty"
    ADD CONSTRAINT "PersonnelActualProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 g   ALTER TABLE ONLY dt."PersonnelActualProperty" DROP CONSTRAINT "PersonnelActualProperty_category_fkey";
       dt          postgres    false    3700    288    243            z           2606    40266 ;   PersonnelActualProperty PersonnelActualProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelActualProperty"
    ADD CONSTRAINT "PersonnelActualProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."PersonnelActualProperty"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."PersonnelActualProperty" DROP CONSTRAINT "PersonnelActualProperty_parent_fkey";
       dt          postgres    false    288    288    3790            {           2606    40271 D   PersonnelActualProperty PersonnelActualProperty_personnelActual_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelActualProperty"
    ADD CONSTRAINT "PersonnelActualProperty_personnelActual_fkey" FOREIGN KEY ("personnelActual") REFERENCES dt."PersonnelActual"(id) ON DELETE SET NULL;
 n   ALTER TABLE ONLY dt."PersonnelActualProperty" DROP CONSTRAINT "PersonnelActualProperty_personnelActual_fkey";
       dt          postgres    false    287    288    3788            |           2606    40276 A   PersonnelActualProperty PersonnelActualProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelActualProperty"
    ADD CONSTRAINT "PersonnelActualProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 k   ALTER TABLE ONLY dt."PersonnelActualProperty" DROP CONSTRAINT "PersonnelActualProperty_propertyType_fkey";
       dt          postgres    false    3854    320    288            }           2606    40281 @   PersonnelActualProperty PersonnelActualProperty_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelActualProperty"
    ADD CONSTRAINT "PersonnelActualProperty_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 j   ALTER TABLE ONLY dt."PersonnelActualProperty" DROP CONSTRAINT "PersonnelActualProperty_quantityUom_fkey";
       dt          postgres    false    3908    288    347            ~           2606    40286 ?   PersonnelActualProperty PersonnelActualProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelActualProperty"
    ADD CONSTRAINT "PersonnelActualProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 i   ALTER TABLE ONLY dt."PersonnelActualProperty" DROP CONSTRAINT "PersonnelActualProperty_sensorType_fkey";
       dt          postgres    false    3643    216    288                       2606    40291 ;   PersonnelActualProperty PersonnelActualProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelActualProperty"
    ADD CONSTRAINT "PersonnelActualProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."PersonnelActualProperty" DROP CONSTRAINT "PersonnelActualProperty_sensor_fkey";
       dt          postgres    false    288    210    3631            �           2606    40296 @   PersonnelActualProperty PersonnelActualProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelActualProperty"
    ADD CONSTRAINT "PersonnelActualProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 j   ALTER TABLE ONLY dt."PersonnelActualProperty" DROP CONSTRAINT "PersonnelActualProperty_uomCategory_fkey";
       dt          postgres    false    348    3910    288            �           2606    40301 =   PersonnelActualProperty PersonnelActualProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelActualProperty"
    ADD CONSTRAINT "PersonnelActualProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 g   ALTER TABLE ONLY dt."PersonnelActualProperty" DROP CONSTRAINT "PersonnelActualProperty_valueUom_fkey";
       dt          postgres    false    288    347    3908            t           2606    40306 0   PersonnelActual PersonnelActual_jobResponse_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelActual"
    ADD CONSTRAINT "PersonnelActual_jobResponse_fkey" FOREIGN KEY ("jobResponse") REFERENCES dt."JobResponse"(id) ON DELETE SET NULL;
 Z   ALTER TABLE ONLY dt."PersonnelActual" DROP CONSTRAINT "PersonnelActual_jobResponse_fkey";
       dt          postgres    false    241    287    3696            u           2606    40311 +   PersonnelActual PersonnelActual_person_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelActual"
    ADD CONSTRAINT "PersonnelActual_person_fkey" FOREIGN KEY (person) REFERENCES dt."Person"(id) ON DELETE SET NULL;
 U   ALTER TABLE ONLY dt."PersonnelActual" DROP CONSTRAINT "PersonnelActual_person_fkey";
       dt          postgres    false    3784    287    285            v           2606    40316 3   PersonnelActual PersonnelActual_personnelClass_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelActual"
    ADD CONSTRAINT "PersonnelActual_personnelClass_fkey" FOREIGN KEY ("personnelClass") REFERENCES dt."PersonnelClass"(id) ON DELETE SET NULL;
 ]   ALTER TABLE ONLY dt."PersonnelActual" DROP CONSTRAINT "PersonnelActual_personnelClass_fkey";
       dt          postgres    false    291    3796    287            w           2606    40321 0   PersonnelActual PersonnelActual_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelActual"
    ADD CONSTRAINT "PersonnelActual_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 Z   ALTER TABLE ONLY dt."PersonnelActual" DROP CONSTRAINT "PersonnelActual_quantityUom_fkey";
       dt          postgres    false    347    287    3908            x           2606    40326 4   PersonnelActual PersonnelActual_segmentResponse_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelActual"
    ADD CONSTRAINT "PersonnelActual_segmentResponse_fkey" FOREIGN KEY ("segmentResponse") REFERENCES dt."SegmentResponse"(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY dt."PersonnelActual" DROP CONSTRAINT "PersonnelActual_segmentResponse_fkey";
       dt          postgres    false    287    3884    335            �           2606    40331 E   PersonnelCapabilityProperty PersonnelCapabilityProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelCapabilityProperty"
    ADD CONSTRAINT "PersonnelCapabilityProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY dt."PersonnelCapabilityProperty" DROP CONSTRAINT "PersonnelCapabilityProperty_category_fkey";
       dt          postgres    false    3700    243    290            �           2606    40336 C   PersonnelCapabilityProperty PersonnelCapabilityProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelCapabilityProperty"
    ADD CONSTRAINT "PersonnelCapabilityProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."PersonnelCapabilityProperty"(id) ON DELETE SET NULL;
 m   ALTER TABLE ONLY dt."PersonnelCapabilityProperty" DROP CONSTRAINT "PersonnelCapabilityProperty_parent_fkey";
       dt          postgres    false    290    290    3794            �           2606    40341 P   PersonnelCapabilityProperty PersonnelCapabilityProperty_personnelCapability_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelCapabilityProperty"
    ADD CONSTRAINT "PersonnelCapabilityProperty_personnelCapability_fkey" FOREIGN KEY ("personnelCapability") REFERENCES dt."PersonnelCapability"(id) ON DELETE SET NULL;
 z   ALTER TABLE ONLY dt."PersonnelCapabilityProperty" DROP CONSTRAINT "PersonnelCapabilityProperty_personnelCapability_fkey";
       dt          postgres    false    289    290    3792            �           2606    40346 I   PersonnelCapabilityProperty PersonnelCapabilityProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelCapabilityProperty"
    ADD CONSTRAINT "PersonnelCapabilityProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 s   ALTER TABLE ONLY dt."PersonnelCapabilityProperty" DROP CONSTRAINT "PersonnelCapabilityProperty_propertyType_fkey";
       dt          postgres    false    290    320    3854            �           2606    40351 H   PersonnelCapabilityProperty PersonnelCapabilityProperty_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelCapabilityProperty"
    ADD CONSTRAINT "PersonnelCapabilityProperty_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 r   ALTER TABLE ONLY dt."PersonnelCapabilityProperty" DROP CONSTRAINT "PersonnelCapabilityProperty_quantityUom_fkey";
       dt          postgres    false    3908    290    347            �           2606    40356 G   PersonnelCapabilityProperty PersonnelCapabilityProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelCapabilityProperty"
    ADD CONSTRAINT "PersonnelCapabilityProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 q   ALTER TABLE ONLY dt."PersonnelCapabilityProperty" DROP CONSTRAINT "PersonnelCapabilityProperty_sensorType_fkey";
       dt          postgres    false    3643    290    216            �           2606    40361 C   PersonnelCapabilityProperty PersonnelCapabilityProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelCapabilityProperty"
    ADD CONSTRAINT "PersonnelCapabilityProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 m   ALTER TABLE ONLY dt."PersonnelCapabilityProperty" DROP CONSTRAINT "PersonnelCapabilityProperty_sensor_fkey";
       dt          postgres    false    3631    290    210            �           2606    40366 H   PersonnelCapabilityProperty PersonnelCapabilityProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelCapabilityProperty"
    ADD CONSTRAINT "PersonnelCapabilityProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 r   ALTER TABLE ONLY dt."PersonnelCapabilityProperty" DROP CONSTRAINT "PersonnelCapabilityProperty_uomCategory_fkey";
       dt          postgres    false    290    3910    348            �           2606    40371 E   PersonnelCapabilityProperty PersonnelCapabilityProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelCapabilityProperty"
    ADD CONSTRAINT "PersonnelCapabilityProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY dt."PersonnelCapabilityProperty" DROP CONSTRAINT "PersonnelCapabilityProperty_valueUom_fkey";
       dt          postgres    false    3908    347    290            �           2606    40376 ;   PersonnelCapability PersonnelCapability_capabilityType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelCapability"
    ADD CONSTRAINT "PersonnelCapability_capabilityType_fkey" FOREIGN KEY ("capabilityType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."PersonnelCapability" DROP CONSTRAINT "PersonnelCapability_capabilityType_fkey";
       dt          postgres    false    243    3700    289            �           2606    40381 ;   PersonnelCapability PersonnelCapability_hierarchyScope_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelCapability"
    ADD CONSTRAINT "PersonnelCapability_hierarchyScope_fkey" FOREIGN KEY ("hierarchyScope") REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."PersonnelCapability" DROP CONSTRAINT "PersonnelCapability_hierarchyScope_fkey";
       dt          postgres    false    289    210    3631            �           2606    40386 A   PersonnelCapability PersonnelCapability_operationsCapability_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelCapability"
    ADD CONSTRAINT "PersonnelCapability_operationsCapability_fkey" FOREIGN KEY ("operationsCapability") REFERENCES dt."OperationsCapability"(id) ON DELETE SET NULL;
 k   ALTER TABLE ONLY dt."PersonnelCapability" DROP CONSTRAINT "PersonnelCapability_operationsCapability_fkey";
       dt          postgres    false    3750    289    268            �           2606    40391 3   PersonnelCapability PersonnelCapability_person_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelCapability"
    ADD CONSTRAINT "PersonnelCapability_person_fkey" FOREIGN KEY (person) REFERENCES dt."Person"(id) ON DELETE SET NULL;
 ]   ALTER TABLE ONLY dt."PersonnelCapability" DROP CONSTRAINT "PersonnelCapability_person_fkey";
       dt          postgres    false    3784    289    285            �           2606    40396 ;   PersonnelCapability PersonnelCapability_personnelClass_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelCapability"
    ADD CONSTRAINT "PersonnelCapability_personnelClass_fkey" FOREIGN KEY ("personnelClass") REFERENCES dt."PersonnelClass"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."PersonnelCapability" DROP CONSTRAINT "PersonnelCapability_personnelClass_fkey";
       dt          postgres    false    289    3796    291            �           2606    40401 E   PersonnelCapability PersonnelCapability_processSegmentCapability_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelCapability"
    ADD CONSTRAINT "PersonnelCapability_processSegmentCapability_fkey" FOREIGN KEY ("processSegmentCapability") REFERENCES dt."ProcessSegmentCapability"(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY dt."PersonnelCapability" DROP CONSTRAINT "PersonnelCapability_processSegmentCapability_fkey";
       dt          postgres    false    3846    316    289            �           2606    40406 8   PersonnelCapability PersonnelCapability_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelCapability"
    ADD CONSTRAINT "PersonnelCapability_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 b   ALTER TABLE ONLY dt."PersonnelCapability" DROP CONSTRAINT "PersonnelCapability_quantityUom_fkey";
       dt          postgres    false    289    3908    347            �           2606    40411 8   PersonnelCapability PersonnelCapability_resourceUse_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelCapability"
    ADD CONSTRAINT "PersonnelCapability_resourceUse_fkey" FOREIGN KEY ("resourceUse") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 b   ALTER TABLE ONLY dt."PersonnelCapability" DROP CONSTRAINT "PersonnelCapability_resourceUse_fkey";
       dt          postgres    false    243    289    3700            �           2606    40416 ;   PersonnelCapability PersonnelCapability_workCapability_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelCapability"
    ADD CONSTRAINT "PersonnelCapability_workCapability_fkey" FOREIGN KEY ("workCapability") REFERENCES dt."WorkCapability"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."PersonnelCapability" DROP CONSTRAINT "PersonnelCapability_workCapability_fkey";
       dt          postgres    false    3936    361    289            �           2606    40421 A   PersonnelCapability PersonnelCapability_workMasterCapability_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelCapability"
    ADD CONSTRAINT "PersonnelCapability_workMasterCapability_fkey" FOREIGN KEY ("workMasterCapability") REFERENCES dt."WorkMasterCapability"(id) ON DELETE SET NULL;
 k   ALTER TABLE ONLY dt."PersonnelCapability" DROP CONSTRAINT "PersonnelCapability_workMasterCapability_fkey";
       dt          postgres    false    289    3942    364            �           2606    40426 7   PersonnelClassMapping PersonnelClassMapping_person_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelClassMapping"
    ADD CONSTRAINT "PersonnelClassMapping_person_fkey" FOREIGN KEY (person) REFERENCES dt."Person"(id) ON DELETE CASCADE;
 a   ALTER TABLE ONLY dt."PersonnelClassMapping" DROP CONSTRAINT "PersonnelClassMapping_person_fkey";
       dt          postgres    false    292    285    3784            �           2606    40431 ?   PersonnelClassMapping PersonnelClassMapping_personnelClass_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelClassMapping"
    ADD CONSTRAINT "PersonnelClassMapping_personnelClass_fkey" FOREIGN KEY ("personnelClass") REFERENCES dt."PersonnelClass"(id) ON DELETE CASCADE;
 i   ALTER TABLE ONLY dt."PersonnelClassMapping" DROP CONSTRAINT "PersonnelClassMapping_personnelClass_fkey";
       dt          postgres    false    3796    292    291            �           2606    40436 ;   PersonnelClassProperty PersonnelClassProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelClassProperty"
    ADD CONSTRAINT "PersonnelClassProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."PersonnelClassProperty" DROP CONSTRAINT "PersonnelClassProperty_category_fkey";
       dt          postgres    false    3700    243    293            �           2606    40441 9   PersonnelClassProperty PersonnelClassProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelClassProperty"
    ADD CONSTRAINT "PersonnelClassProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."PersonnelClassProperty"(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY dt."PersonnelClassProperty" DROP CONSTRAINT "PersonnelClassProperty_parent_fkey";
       dt          postgres    false    293    293    3800            �           2606    40446 A   PersonnelClassProperty PersonnelClassProperty_personnelClass_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelClassProperty"
    ADD CONSTRAINT "PersonnelClassProperty_personnelClass_fkey" FOREIGN KEY ("personnelClass") REFERENCES dt."PersonnelClass"(id) ON DELETE SET NULL;
 k   ALTER TABLE ONLY dt."PersonnelClassProperty" DROP CONSTRAINT "PersonnelClassProperty_personnelClass_fkey";
       dt          postgres    false    291    3796    293            �           2606    40451 ?   PersonnelClassProperty PersonnelClassProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelClassProperty"
    ADD CONSTRAINT "PersonnelClassProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 i   ALTER TABLE ONLY dt."PersonnelClassProperty" DROP CONSTRAINT "PersonnelClassProperty_propertyType_fkey";
       dt          postgres    false    293    3854    320            �           2606    40456 =   PersonnelClassProperty PersonnelClassProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelClassProperty"
    ADD CONSTRAINT "PersonnelClassProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 g   ALTER TABLE ONLY dt."PersonnelClassProperty" DROP CONSTRAINT "PersonnelClassProperty_sensorType_fkey";
       dt          postgres    false    3643    216    293            �           2606    40461 9   PersonnelClassProperty PersonnelClassProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelClassProperty"
    ADD CONSTRAINT "PersonnelClassProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY dt."PersonnelClassProperty" DROP CONSTRAINT "PersonnelClassProperty_sensor_fkey";
       dt          postgres    false    293    3631    210            �           2606    40466 >   PersonnelClassProperty PersonnelClassProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelClassProperty"
    ADD CONSTRAINT "PersonnelClassProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 h   ALTER TABLE ONLY dt."PersonnelClassProperty" DROP CONSTRAINT "PersonnelClassProperty_uomCategory_fkey";
       dt          postgres    false    293    348    3910            �           2606    40471 ;   PersonnelClassProperty PersonnelClassProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelClassProperty"
    ADD CONSTRAINT "PersonnelClassProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."PersonnelClassProperty" DROP CONSTRAINT "PersonnelClassProperty_valueUom_fkey";
       dt          postgres    false    3908    347    293            �           2606    40476 )   PersonnelClass PersonnelClass_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelClass"
    ADD CONSTRAINT "PersonnelClass_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."PersonnelClass"(id) ON DELETE SET NULL;
 S   ALTER TABLE ONLY dt."PersonnelClass" DROP CONSTRAINT "PersonnelClass_parent_fkey";
       dt          postgres    false    291    3796    291            �           2606    40481 G   PersonnelRequirementProperty PersonnelRequirementProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelRequirementProperty"
    ADD CONSTRAINT "PersonnelRequirementProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 q   ALTER TABLE ONLY dt."PersonnelRequirementProperty" DROP CONSTRAINT "PersonnelRequirementProperty_category_fkey";
       dt          postgres    false    243    3700    295            �           2606    40486 I   PersonnelRequirementProperty PersonnelRequirementProperty_logRateUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelRequirementProperty"
    ADD CONSTRAINT "PersonnelRequirementProperty_logRateUom_fkey" FOREIGN KEY ("logRateUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 s   ALTER TABLE ONLY dt."PersonnelRequirementProperty" DROP CONSTRAINT "PersonnelRequirementProperty_logRateUom_fkey";
       dt          postgres    false    295    347    3908            �           2606    40491 E   PersonnelRequirementProperty PersonnelRequirementProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelRequirementProperty"
    ADD CONSTRAINT "PersonnelRequirementProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."PersonnelRequirementProperty"(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY dt."PersonnelRequirementProperty" DROP CONSTRAINT "PersonnelRequirementProperty_parent_fkey";
       dt          postgres    false    3804    295    295            �           2606    40496 S   PersonnelRequirementProperty PersonnelRequirementProperty_personnelRequirement_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelRequirementProperty"
    ADD CONSTRAINT "PersonnelRequirementProperty_personnelRequirement_fkey" FOREIGN KEY ("personnelRequirement") REFERENCES dt."PersonnelRequirement"(id) ON DELETE SET NULL;
 }   ALTER TABLE ONLY dt."PersonnelRequirementProperty" DROP CONSTRAINT "PersonnelRequirementProperty_personnelRequirement_fkey";
       dt          postgres    false    3802    295    294            �           2606    40501 K   PersonnelRequirementProperty PersonnelRequirementProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelRequirementProperty"
    ADD CONSTRAINT "PersonnelRequirementProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 u   ALTER TABLE ONLY dt."PersonnelRequirementProperty" DROP CONSTRAINT "PersonnelRequirementProperty_propertyType_fkey";
       dt          postgres    false    320    3854    295            �           2606    40506 J   PersonnelRequirementProperty PersonnelRequirementProperty_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelRequirementProperty"
    ADD CONSTRAINT "PersonnelRequirementProperty_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 t   ALTER TABLE ONLY dt."PersonnelRequirementProperty" DROP CONSTRAINT "PersonnelRequirementProperty_quantityUom_fkey";
       dt          postgres    false    347    3908    295            �           2606    40511 I   PersonnelRequirementProperty PersonnelRequirementProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelRequirementProperty"
    ADD CONSTRAINT "PersonnelRequirementProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 s   ALTER TABLE ONLY dt."PersonnelRequirementProperty" DROP CONSTRAINT "PersonnelRequirementProperty_sensorType_fkey";
       dt          postgres    false    216    295    3643            �           2606    40516 E   PersonnelRequirementProperty PersonnelRequirementProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelRequirementProperty"
    ADD CONSTRAINT "PersonnelRequirementProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY dt."PersonnelRequirementProperty" DROP CONSTRAINT "PersonnelRequirementProperty_sensor_fkey";
       dt          postgres    false    295    210    3631            �           2606    40521 J   PersonnelRequirementProperty PersonnelRequirementProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelRequirementProperty"
    ADD CONSTRAINT "PersonnelRequirementProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 t   ALTER TABLE ONLY dt."PersonnelRequirementProperty" DROP CONSTRAINT "PersonnelRequirementProperty_uomCategory_fkey";
       dt          postgres    false    295    348    3910            �           2606    40526 G   PersonnelRequirementProperty PersonnelRequirementProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelRequirementProperty"
    ADD CONSTRAINT "PersonnelRequirementProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 q   ALTER TABLE ONLY dt."PersonnelRequirementProperty" DROP CONSTRAINT "PersonnelRequirementProperty_valueUom_fkey";
       dt          postgres    false    295    347    3908            �           2606    40531 7   PersonnelRequirement PersonnelRequirement_jobOrder_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelRequirement"
    ADD CONSTRAINT "PersonnelRequirement_jobOrder_fkey" FOREIGN KEY ("jobOrder") REFERENCES dt."JobOrder"(id) ON DELETE SET NULL;
 a   ALTER TABLE ONLY dt."PersonnelRequirement" DROP CONSTRAINT "PersonnelRequirement_jobOrder_fkey";
       dt          postgres    false    239    294    3692            �           2606    40536 5   PersonnelRequirement PersonnelRequirement_person_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelRequirement"
    ADD CONSTRAINT "PersonnelRequirement_person_fkey" FOREIGN KEY (person) REFERENCES dt."Person"(id) ON DELETE SET NULL;
 _   ALTER TABLE ONLY dt."PersonnelRequirement" DROP CONSTRAINT "PersonnelRequirement_person_fkey";
       dt          postgres    false    285    294    3784            �           2606    40541 =   PersonnelRequirement PersonnelRequirement_personnelClass_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelRequirement"
    ADD CONSTRAINT "PersonnelRequirement_personnelClass_fkey" FOREIGN KEY ("personnelClass") REFERENCES dt."PersonnelClass"(id) ON DELETE SET NULL;
 g   ALTER TABLE ONLY dt."PersonnelRequirement" DROP CONSTRAINT "PersonnelRequirement_personnelClass_fkey";
       dt          postgres    false    294    3796    291            �           2606    40546 :   PersonnelRequirement PersonnelRequirement_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelRequirement"
    ADD CONSTRAINT "PersonnelRequirement_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 d   ALTER TABLE ONLY dt."PersonnelRequirement" DROP CONSTRAINT "PersonnelRequirement_quantityUom_fkey";
       dt          postgres    false    347    294    3908            �           2606    40551 A   PersonnelRequirement PersonnelRequirement_segmentRequirement_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelRequirement"
    ADD CONSTRAINT "PersonnelRequirement_segmentRequirement_fkey" FOREIGN KEY ("segmentRequirement") REFERENCES dt."SegmentRequirement"(id) ON DELETE SET NULL;
 k   ALTER TABLE ONLY dt."PersonnelRequirement" DROP CONSTRAINT "PersonnelRequirement_segmentRequirement_fkey";
       dt          postgres    false    294    334    3882            �           2606    40556 Y   PersonnelSegmentSpecificationProperty PersonnelSegmentSpecificationProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelSegmentSpecificationProperty"
    ADD CONSTRAINT "PersonnelSegmentSpecificationProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."PersonnelSegmentSpecificationProperty" DROP CONSTRAINT "PersonnelSegmentSpecificationProperty_category_fkey";
       dt          postgres    false    243    297    3700            �           2606    40561 W   PersonnelSegmentSpecificationProperty PersonnelSegmentSpecificationProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelSegmentSpecificationProperty"
    ADD CONSTRAINT "PersonnelSegmentSpecificationProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."PersonnelSegmentSpecificationProperty"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."PersonnelSegmentSpecificationProperty" DROP CONSTRAINT "PersonnelSegmentSpecificationProperty_parent_fkey";
       dt          postgres    false    297    3808    297            �           2606    40566 ]   PersonnelSegmentSpecificationProperty PersonnelSegmentSpecificationProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelSegmentSpecificationProperty"
    ADD CONSTRAINT "PersonnelSegmentSpecificationProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."PersonnelSegmentSpecificationProperty" DROP CONSTRAINT "PersonnelSegmentSpecificationProperty_propertyType_fkey";
       dt          postgres    false    320    297    3854            �           2606    40571 \   PersonnelSegmentSpecificationProperty PersonnelSegmentSpecificationProperty_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelSegmentSpecificationProperty"
    ADD CONSTRAINT "PersonnelSegmentSpecificationProperty_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."PersonnelSegmentSpecificationProperty" DROP CONSTRAINT "PersonnelSegmentSpecificationProperty_quantityUom_fkey";
       dt          postgres    false    297    347    3908            �           2606    40576 [   PersonnelSegmentSpecificationProperty PersonnelSegmentSpecificationProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelSegmentSpecificationProperty"
    ADD CONSTRAINT "PersonnelSegmentSpecificationProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."PersonnelSegmentSpecificationProperty" DROP CONSTRAINT "PersonnelSegmentSpecificationProperty_sensorType_fkey";
       dt          postgres    false    3643    297    216            �           2606    40581 W   PersonnelSegmentSpecificationProperty PersonnelSegmentSpecificationProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelSegmentSpecificationProperty"
    ADD CONSTRAINT "PersonnelSegmentSpecificationProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."PersonnelSegmentSpecificationProperty" DROP CONSTRAINT "PersonnelSegmentSpecificationProperty_sensor_fkey";
       dt          postgres    false    3631    297    210            �           2606    40586 \   PersonnelSegmentSpecificationProperty PersonnelSegmentSpecificationProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelSegmentSpecificationProperty"
    ADD CONSTRAINT "PersonnelSegmentSpecificationProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."PersonnelSegmentSpecificationProperty" DROP CONSTRAINT "PersonnelSegmentSpecificationProperty_uomCategory_fkey";
       dt          postgres    false    297    348    3910            �           2606    40591 Y   PersonnelSegmentSpecificationProperty PersonnelSegmentSpecificationProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelSegmentSpecificationProperty"
    ADD CONSTRAINT "PersonnelSegmentSpecificationProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."PersonnelSegmentSpecificationProperty" DROP CONSTRAINT "PersonnelSegmentSpecificationProperty_valueUom_fkey";
       dt          postgres    false    3908    297    347            �           2606    40596 G   PersonnelSegmentSpecification PersonnelSegmentSpecification_person_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelSegmentSpecification"
    ADD CONSTRAINT "PersonnelSegmentSpecification_person_fkey" FOREIGN KEY (person) REFERENCES dt."Person"(id) ON DELETE SET NULL;
 q   ALTER TABLE ONLY dt."PersonnelSegmentSpecification" DROP CONSTRAINT "PersonnelSegmentSpecification_person_fkey";
       dt          postgres    false    285    3784    296            �           2606    40601 O   PersonnelSegmentSpecification PersonnelSegmentSpecification_personnelClass_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelSegmentSpecification"
    ADD CONSTRAINT "PersonnelSegmentSpecification_personnelClass_fkey" FOREIGN KEY ("personnelClass") REFERENCES dt."PersonnelClass"(id) ON DELETE SET NULL;
 y   ALTER TABLE ONLY dt."PersonnelSegmentSpecification" DROP CONSTRAINT "PersonnelSegmentSpecification_personnelClass_fkey";
       dt          postgres    false    296    291    3796            �           2606    40606 e   PersonnelSegmentSpecificationProperty PersonnelSegmentSpecification_personnelSegmentSpecificatio_fkey    FK CONSTRAINT       ALTER TABLE ONLY dt."PersonnelSegmentSpecificationProperty"
    ADD CONSTRAINT "PersonnelSegmentSpecification_personnelSegmentSpecificatio_fkey" FOREIGN KEY ("personnelSegmentSpecification") REFERENCES dt."PersonnelSegmentSpecification"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."PersonnelSegmentSpecificationProperty" DROP CONSTRAINT "PersonnelSegmentSpecification_personnelSegmentSpecificatio_fkey";
       dt          postgres    false    3806    297    296            �           2606    40611 O   PersonnelSegmentSpecification PersonnelSegmentSpecification_processSegment_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelSegmentSpecification"
    ADD CONSTRAINT "PersonnelSegmentSpecification_processSegment_fkey" FOREIGN KEY ("processSegment") REFERENCES dt."ProcessSegment"(id) ON DELETE SET NULL;
 y   ALTER TABLE ONLY dt."PersonnelSegmentSpecification" DROP CONSTRAINT "PersonnelSegmentSpecification_processSegment_fkey";
       dt          postgres    false    315    296    3844            �           2606    40616 L   PersonnelSegmentSpecification PersonnelSegmentSpecification_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelSegmentSpecification"
    ADD CONSTRAINT "PersonnelSegmentSpecification_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 v   ALTER TABLE ONLY dt."PersonnelSegmentSpecification" DROP CONSTRAINT "PersonnelSegmentSpecification_quantityUom_fkey";
       dt          postgres    false    347    296    3908            �           2606    40621 K   PersonnelSpecificationProperty PersonnelSpecificationProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelSpecificationProperty"
    ADD CONSTRAINT "PersonnelSpecificationProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 u   ALTER TABLE ONLY dt."PersonnelSpecificationProperty" DROP CONSTRAINT "PersonnelSpecificationProperty_category_fkey";
       dt          postgres    false    243    299    3700            �           2606    40626 M   PersonnelSpecificationProperty PersonnelSpecificationProperty_logRateUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelSpecificationProperty"
    ADD CONSTRAINT "PersonnelSpecificationProperty_logRateUom_fkey" FOREIGN KEY ("logRateUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 w   ALTER TABLE ONLY dt."PersonnelSpecificationProperty" DROP CONSTRAINT "PersonnelSpecificationProperty_logRateUom_fkey";
       dt          postgres    false    299    3908    347            �           2606    40631 I   PersonnelSpecificationProperty PersonnelSpecificationProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelSpecificationProperty"
    ADD CONSTRAINT "PersonnelSpecificationProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."PersonnelSpecificationProperty"(id) ON DELETE SET NULL;
 s   ALTER TABLE ONLY dt."PersonnelSpecificationProperty" DROP CONSTRAINT "PersonnelSpecificationProperty_parent_fkey";
       dt          postgres    false    299    3812    299            �           2606    40636 Y   PersonnelSpecificationProperty PersonnelSpecificationProperty_personnelSpecification_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelSpecificationProperty"
    ADD CONSTRAINT "PersonnelSpecificationProperty_personnelSpecification_fkey" FOREIGN KEY ("personnelSpecification") REFERENCES dt."PersonnelSpecification"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."PersonnelSpecificationProperty" DROP CONSTRAINT "PersonnelSpecificationProperty_personnelSpecification_fkey";
       dt          postgres    false    298    3810    299            �           2606    40641 O   PersonnelSpecificationProperty PersonnelSpecificationProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelSpecificationProperty"
    ADD CONSTRAINT "PersonnelSpecificationProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 y   ALTER TABLE ONLY dt."PersonnelSpecificationProperty" DROP CONSTRAINT "PersonnelSpecificationProperty_propertyType_fkey";
       dt          postgres    false    299    3854    320            �           2606    40646 N   PersonnelSpecificationProperty PersonnelSpecificationProperty_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelSpecificationProperty"
    ADD CONSTRAINT "PersonnelSpecificationProperty_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 x   ALTER TABLE ONLY dt."PersonnelSpecificationProperty" DROP CONSTRAINT "PersonnelSpecificationProperty_quantityUom_fkey";
       dt          postgres    false    299    3908    347            �           2606    40651 M   PersonnelSpecificationProperty PersonnelSpecificationProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelSpecificationProperty"
    ADD CONSTRAINT "PersonnelSpecificationProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 w   ALTER TABLE ONLY dt."PersonnelSpecificationProperty" DROP CONSTRAINT "PersonnelSpecificationProperty_sensorType_fkey";
       dt          postgres    false    216    3643    299            �           2606    40656 I   PersonnelSpecificationProperty PersonnelSpecificationProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelSpecificationProperty"
    ADD CONSTRAINT "PersonnelSpecificationProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 s   ALTER TABLE ONLY dt."PersonnelSpecificationProperty" DROP CONSTRAINT "PersonnelSpecificationProperty_sensor_fkey";
       dt          postgres    false    3631    299    210            �           2606    40661 N   PersonnelSpecificationProperty PersonnelSpecificationProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelSpecificationProperty"
    ADD CONSTRAINT "PersonnelSpecificationProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 x   ALTER TABLE ONLY dt."PersonnelSpecificationProperty" DROP CONSTRAINT "PersonnelSpecificationProperty_uomCategory_fkey";
       dt          postgres    false    3910    348    299            �           2606    40666 K   PersonnelSpecificationProperty PersonnelSpecificationProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelSpecificationProperty"
    ADD CONSTRAINT "PersonnelSpecificationProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 u   ALTER TABLE ONLY dt."PersonnelSpecificationProperty" DROP CONSTRAINT "PersonnelSpecificationProperty_valueUom_fkey";
       dt          postgres    false    3908    347    299            �           2606    40671 D   PersonnelSpecification PersonnelSpecification_operationsSegment_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelSpecification"
    ADD CONSTRAINT "PersonnelSpecification_operationsSegment_fkey" FOREIGN KEY ("operationsSegment") REFERENCES dt."OperationsSegment"(id) ON DELETE SET NULL;
 n   ALTER TABLE ONLY dt."PersonnelSpecification" DROP CONSTRAINT "PersonnelSpecification_operationsSegment_fkey";
       dt          postgres    false    3778    282    298            �           2606    40676 9   PersonnelSpecification PersonnelSpecification_person_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelSpecification"
    ADD CONSTRAINT "PersonnelSpecification_person_fkey" FOREIGN KEY (person) REFERENCES dt."Person"(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY dt."PersonnelSpecification" DROP CONSTRAINT "PersonnelSpecification_person_fkey";
       dt          postgres    false    298    285    3784            �           2606    40681 A   PersonnelSpecification PersonnelSpecification_personnelClass_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelSpecification"
    ADD CONSTRAINT "PersonnelSpecification_personnelClass_fkey" FOREIGN KEY ("personnelClass") REFERENCES dt."PersonnelClass"(id) ON DELETE SET NULL;
 k   ALTER TABLE ONLY dt."PersonnelSpecification" DROP CONSTRAINT "PersonnelSpecification_personnelClass_fkey";
       dt          postgres    false    3796    291    298            �           2606    40686 >   PersonnelSpecification PersonnelSpecification_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelSpecification"
    ADD CONSTRAINT "PersonnelSpecification_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 h   ALTER TABLE ONLY dt."PersonnelSpecification" DROP CONSTRAINT "PersonnelSpecification_quantityUom_fkey";
       dt          postgres    false    298    347    3908            �           2606    40691 =   PersonnelSpecification PersonnelSpecification_workMaster_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PersonnelSpecification"
    ADD CONSTRAINT "PersonnelSpecification_workMaster_fkey" FOREIGN KEY ("workMaster") REFERENCES dt."WorkMaster"(id) ON DELETE SET NULL;
 g   ALTER TABLE ONLY dt."PersonnelSpecification" DROP CONSTRAINT "PersonnelSpecification_workMaster_fkey";
       dt          postgres    false    3940    298    363            �           2606    40696 E   PhysicalAssetActualProperty PhysicalAssetActualProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetActualProperty"
    ADD CONSTRAINT "PhysicalAssetActualProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY dt."PhysicalAssetActualProperty" DROP CONSTRAINT "PhysicalAssetActualProperty_category_fkey";
       dt          postgres    false    302    243    3700            �           2606    40701 C   PhysicalAssetActualProperty PhysicalAssetActualProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetActualProperty"
    ADD CONSTRAINT "PhysicalAssetActualProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."PhysicalAssetActualProperty"(id) ON DELETE SET NULL;
 m   ALTER TABLE ONLY dt."PhysicalAssetActualProperty" DROP CONSTRAINT "PhysicalAssetActualProperty_parent_fkey";
       dt          postgres    false    302    302    3818            �           2606    40706 P   PhysicalAssetActualProperty PhysicalAssetActualProperty_physicalAssetActual_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetActualProperty"
    ADD CONSTRAINT "PhysicalAssetActualProperty_physicalAssetActual_fkey" FOREIGN KEY ("physicalAssetActual") REFERENCES dt."PhysicalAssetActual"(id) ON DELETE SET NULL;
 z   ALTER TABLE ONLY dt."PhysicalAssetActualProperty" DROP CONSTRAINT "PhysicalAssetActualProperty_physicalAssetActual_fkey";
       dt          postgres    false    302    301    3816            �           2606    40711 I   PhysicalAssetActualProperty PhysicalAssetActualProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetActualProperty"
    ADD CONSTRAINT "PhysicalAssetActualProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 s   ALTER TABLE ONLY dt."PhysicalAssetActualProperty" DROP CONSTRAINT "PhysicalAssetActualProperty_propertyType_fkey";
       dt          postgres    false    3854    302    320            �           2606    40716 H   PhysicalAssetActualProperty PhysicalAssetActualProperty_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetActualProperty"
    ADD CONSTRAINT "PhysicalAssetActualProperty_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 r   ALTER TABLE ONLY dt."PhysicalAssetActualProperty" DROP CONSTRAINT "PhysicalAssetActualProperty_quantityUom_fkey";
       dt          postgres    false    347    302    3908            �           2606    40721 G   PhysicalAssetActualProperty PhysicalAssetActualProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetActualProperty"
    ADD CONSTRAINT "PhysicalAssetActualProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 q   ALTER TABLE ONLY dt."PhysicalAssetActualProperty" DROP CONSTRAINT "PhysicalAssetActualProperty_sensorType_fkey";
       dt          postgres    false    216    302    3643            �           2606    40726 C   PhysicalAssetActualProperty PhysicalAssetActualProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetActualProperty"
    ADD CONSTRAINT "PhysicalAssetActualProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 m   ALTER TABLE ONLY dt."PhysicalAssetActualProperty" DROP CONSTRAINT "PhysicalAssetActualProperty_sensor_fkey";
       dt          postgres    false    210    302    3631            �           2606    40731 H   PhysicalAssetActualProperty PhysicalAssetActualProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetActualProperty"
    ADD CONSTRAINT "PhysicalAssetActualProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 r   ALTER TABLE ONLY dt."PhysicalAssetActualProperty" DROP CONSTRAINT "PhysicalAssetActualProperty_uomCategory_fkey";
       dt          postgres    false    348    302    3910            �           2606    40736 E   PhysicalAssetActualProperty PhysicalAssetActualProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetActualProperty"
    ADD CONSTRAINT "PhysicalAssetActualProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY dt."PhysicalAssetActualProperty" DROP CONSTRAINT "PhysicalAssetActualProperty_valueUom_fkey";
       dt          postgres    false    347    302    3908            �           2606    40741 8   PhysicalAssetActual PhysicalAssetActual_jobResponse_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetActual"
    ADD CONSTRAINT "PhysicalAssetActual_jobResponse_fkey" FOREIGN KEY ("jobResponse") REFERENCES dt."JobResponse"(id) ON DELETE SET NULL;
 b   ALTER TABLE ONLY dt."PhysicalAssetActual" DROP CONSTRAINT "PhysicalAssetActual_jobResponse_fkey";
       dt          postgres    false    241    301    3696            �           2606    40746 ?   PhysicalAssetActual PhysicalAssetActual_physicalAssetClass_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetActual"
    ADD CONSTRAINT "PhysicalAssetActual_physicalAssetClass_fkey" FOREIGN KEY ("physicalAssetClass") REFERENCES dt."PhysicalAssetClass"(id) ON DELETE SET NULL;
 i   ALTER TABLE ONLY dt."PhysicalAssetActual" DROP CONSTRAINT "PhysicalAssetActual_physicalAssetClass_fkey";
       dt          postgres    false    301    3824    305            �           2606    40751 :   PhysicalAssetActual PhysicalAssetActual_physicalAsset_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetActual"
    ADD CONSTRAINT "PhysicalAssetActual_physicalAsset_fkey" FOREIGN KEY ("physicalAsset") REFERENCES dt."PhysicalAsset"(id) ON DELETE SET NULL;
 d   ALTER TABLE ONLY dt."PhysicalAssetActual" DROP CONSTRAINT "PhysicalAssetActual_physicalAsset_fkey";
       dt          postgres    false    301    300    3814            �           2606    40756 8   PhysicalAssetActual PhysicalAssetActual_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetActual"
    ADD CONSTRAINT "PhysicalAssetActual_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 b   ALTER TABLE ONLY dt."PhysicalAssetActual" DROP CONSTRAINT "PhysicalAssetActual_quantityUom_fkey";
       dt          postgres    false    301    347    3908            �           2606    40761 8   PhysicalAssetActual PhysicalAssetActual_resourceUse_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetActual"
    ADD CONSTRAINT "PhysicalAssetActual_resourceUse_fkey" FOREIGN KEY ("resourceUse") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 b   ALTER TABLE ONLY dt."PhysicalAssetActual" DROP CONSTRAINT "PhysicalAssetActual_resourceUse_fkey";
       dt          postgres    false    3700    301    243            �           2606    40766 <   PhysicalAssetActual PhysicalAssetActual_segmentResponse_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetActual"
    ADD CONSTRAINT "PhysicalAssetActual_segmentResponse_fkey" FOREIGN KEY ("segmentResponse") REFERENCES dt."SegmentResponse"(id) ON DELETE SET NULL;
 f   ALTER TABLE ONLY dt."PhysicalAssetActual" DROP CONSTRAINT "PhysicalAssetActual_segmentResponse_fkey";
       dt          postgres    false    335    301    3884            �           2606    40771 M   PhysicalAssetCapabilityProperty PhysicalAssetCapabilityProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetCapabilityProperty"
    ADD CONSTRAINT "PhysicalAssetCapabilityProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 w   ALTER TABLE ONLY dt."PhysicalAssetCapabilityProperty" DROP CONSTRAINT "PhysicalAssetCapabilityProperty_category_fkey";
       dt          postgres    false    243    304    3700            �           2606    40776 K   PhysicalAssetCapabilityProperty PhysicalAssetCapabilityProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetCapabilityProperty"
    ADD CONSTRAINT "PhysicalAssetCapabilityProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."PhysicalAssetCapabilityProperty"(id) ON DELETE SET NULL;
 u   ALTER TABLE ONLY dt."PhysicalAssetCapabilityProperty" DROP CONSTRAINT "PhysicalAssetCapabilityProperty_parent_fkey";
       dt          postgres    false    304    304    3822            �           2606    40781 \   PhysicalAssetCapabilityProperty PhysicalAssetCapabilityProperty_physicalAssetCapability_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetCapabilityProperty"
    ADD CONSTRAINT "PhysicalAssetCapabilityProperty_physicalAssetCapability_fkey" FOREIGN KEY ("physicalAssetCapability") REFERENCES dt."PhysicalAssetCapability"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."PhysicalAssetCapabilityProperty" DROP CONSTRAINT "PhysicalAssetCapabilityProperty_physicalAssetCapability_fkey";
       dt          postgres    false    303    304    3820            �           2606    40786 Q   PhysicalAssetCapabilityProperty PhysicalAssetCapabilityProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetCapabilityProperty"
    ADD CONSTRAINT "PhysicalAssetCapabilityProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 {   ALTER TABLE ONLY dt."PhysicalAssetCapabilityProperty" DROP CONSTRAINT "PhysicalAssetCapabilityProperty_propertyType_fkey";
       dt          postgres    false    320    304    3854            �           2606    40791 P   PhysicalAssetCapabilityProperty PhysicalAssetCapabilityProperty_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetCapabilityProperty"
    ADD CONSTRAINT "PhysicalAssetCapabilityProperty_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 z   ALTER TABLE ONLY dt."PhysicalAssetCapabilityProperty" DROP CONSTRAINT "PhysicalAssetCapabilityProperty_quantityUom_fkey";
       dt          postgres    false    347    304    3908            �           2606    40796 O   PhysicalAssetCapabilityProperty PhysicalAssetCapabilityProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetCapabilityProperty"
    ADD CONSTRAINT "PhysicalAssetCapabilityProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 y   ALTER TABLE ONLY dt."PhysicalAssetCapabilityProperty" DROP CONSTRAINT "PhysicalAssetCapabilityProperty_sensorType_fkey";
       dt          postgres    false    216    304    3643            �           2606    40801 K   PhysicalAssetCapabilityProperty PhysicalAssetCapabilityProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetCapabilityProperty"
    ADD CONSTRAINT "PhysicalAssetCapabilityProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 u   ALTER TABLE ONLY dt."PhysicalAssetCapabilityProperty" DROP CONSTRAINT "PhysicalAssetCapabilityProperty_sensor_fkey";
       dt          postgres    false    3631    304    210            �           2606    40806 P   PhysicalAssetCapabilityProperty PhysicalAssetCapabilityProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetCapabilityProperty"
    ADD CONSTRAINT "PhysicalAssetCapabilityProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 z   ALTER TABLE ONLY dt."PhysicalAssetCapabilityProperty" DROP CONSTRAINT "PhysicalAssetCapabilityProperty_uomCategory_fkey";
       dt          postgres    false    304    348    3910            �           2606    40811 M   PhysicalAssetCapabilityProperty PhysicalAssetCapabilityProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetCapabilityProperty"
    ADD CONSTRAINT "PhysicalAssetCapabilityProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 w   ALTER TABLE ONLY dt."PhysicalAssetCapabilityProperty" DROP CONSTRAINT "PhysicalAssetCapabilityProperty_valueUom_fkey";
       dt          postgres    false    3908    304    347            �           2606    40816 C   PhysicalAssetCapability PhysicalAssetCapability_capabilityType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetCapability"
    ADD CONSTRAINT "PhysicalAssetCapability_capabilityType_fkey" FOREIGN KEY ("capabilityType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 m   ALTER TABLE ONLY dt."PhysicalAssetCapability" DROP CONSTRAINT "PhysicalAssetCapability_capabilityType_fkey";
       dt          postgres    false    243    303    3700            �           2606    40821 C   PhysicalAssetCapability PhysicalAssetCapability_hierarchyScope_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetCapability"
    ADD CONSTRAINT "PhysicalAssetCapability_hierarchyScope_fkey" FOREIGN KEY ("hierarchyScope") REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 m   ALTER TABLE ONLY dt."PhysicalAssetCapability" DROP CONSTRAINT "PhysicalAssetCapability_hierarchyScope_fkey";
       dt          postgres    false    210    303    3631            �           2606    40826 I   PhysicalAssetCapability PhysicalAssetCapability_operationsCapability_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetCapability"
    ADD CONSTRAINT "PhysicalAssetCapability_operationsCapability_fkey" FOREIGN KEY ("operationsCapability") REFERENCES dt."OperationsCapability"(id) ON DELETE SET NULL;
 s   ALTER TABLE ONLY dt."PhysicalAssetCapability" DROP CONSTRAINT "PhysicalAssetCapability_operationsCapability_fkey";
       dt          postgres    false    268    303    3750            �           2606    40831 G   PhysicalAssetCapability PhysicalAssetCapability_physicalAssetClass_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetCapability"
    ADD CONSTRAINT "PhysicalAssetCapability_physicalAssetClass_fkey" FOREIGN KEY ("physicalAssetClass") REFERENCES dt."PhysicalAssetClass"(id) ON DELETE SET NULL;
 q   ALTER TABLE ONLY dt."PhysicalAssetCapability" DROP CONSTRAINT "PhysicalAssetCapability_physicalAssetClass_fkey";
       dt          postgres    false    305    303    3824            �           2606    40836 B   PhysicalAssetCapability PhysicalAssetCapability_physicalAsset_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetCapability"
    ADD CONSTRAINT "PhysicalAssetCapability_physicalAsset_fkey" FOREIGN KEY ("physicalAsset") REFERENCES dt."PhysicalAsset"(id) ON DELETE SET NULL;
 l   ALTER TABLE ONLY dt."PhysicalAssetCapability" DROP CONSTRAINT "PhysicalAssetCapability_physicalAsset_fkey";
       dt          postgres    false    300    303    3814            �           2606    40841 M   PhysicalAssetCapability PhysicalAssetCapability_processSegmentCapability_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetCapability"
    ADD CONSTRAINT "PhysicalAssetCapability_processSegmentCapability_fkey" FOREIGN KEY ("processSegmentCapability") REFERENCES dt."ProcessSegmentCapability"(id) ON DELETE SET NULL;
 w   ALTER TABLE ONLY dt."PhysicalAssetCapability" DROP CONSTRAINT "PhysicalAssetCapability_processSegmentCapability_fkey";
       dt          postgres    false    316    303    3846            �           2606    40846 @   PhysicalAssetCapability PhysicalAssetCapability_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetCapability"
    ADD CONSTRAINT "PhysicalAssetCapability_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 j   ALTER TABLE ONLY dt."PhysicalAssetCapability" DROP CONSTRAINT "PhysicalAssetCapability_quantityUom_fkey";
       dt          postgres    false    347    303    3908            �           2606    40851 @   PhysicalAssetCapability PhysicalAssetCapability_resourceUse_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetCapability"
    ADD CONSTRAINT "PhysicalAssetCapability_resourceUse_fkey" FOREIGN KEY ("resourceUse") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 j   ALTER TABLE ONLY dt."PhysicalAssetCapability" DROP CONSTRAINT "PhysicalAssetCapability_resourceUse_fkey";
       dt          postgres    false    243    303    3700            �           2606    40856 C   PhysicalAssetCapability PhysicalAssetCapability_workCapability_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetCapability"
    ADD CONSTRAINT "PhysicalAssetCapability_workCapability_fkey" FOREIGN KEY ("workCapability") REFERENCES dt."WorkCapability"(id) ON DELETE SET NULL;
 m   ALTER TABLE ONLY dt."PhysicalAssetCapability" DROP CONSTRAINT "PhysicalAssetCapability_workCapability_fkey";
       dt          postgres    false    3936    303    361            �           2606    40861 I   PhysicalAssetCapability PhysicalAssetCapability_workMasterCapability_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetCapability"
    ADD CONSTRAINT "PhysicalAssetCapability_workMasterCapability_fkey" FOREIGN KEY ("workMasterCapability") REFERENCES dt."WorkMasterCapability"(id) ON DELETE SET NULL;
 s   ALTER TABLE ONLY dt."PhysicalAssetCapability" DROP CONSTRAINT "PhysicalAssetCapability_workMasterCapability_fkey";
       dt          postgres    false    303    364    3942            �           2606    40866 K   PhysicalAssetClassMapping PhysicalAssetClassMapping_physicalAssetClass_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetClassMapping"
    ADD CONSTRAINT "PhysicalAssetClassMapping_physicalAssetClass_fkey" FOREIGN KEY ("physicalAssetClass") REFERENCES dt."PhysicalAssetClass"(id) ON DELETE CASCADE;
 u   ALTER TABLE ONLY dt."PhysicalAssetClassMapping" DROP CONSTRAINT "PhysicalAssetClassMapping_physicalAssetClass_fkey";
       dt          postgres    false    3824    306    305            �           2606    40871 F   PhysicalAssetClassMapping PhysicalAssetClassMapping_physicalAsset_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetClassMapping"
    ADD CONSTRAINT "PhysicalAssetClassMapping_physicalAsset_fkey" FOREIGN KEY ("physicalAsset") REFERENCES dt."PhysicalAsset"(id) ON DELETE CASCADE;
 p   ALTER TABLE ONLY dt."PhysicalAssetClassMapping" DROP CONSTRAINT "PhysicalAssetClassMapping_physicalAsset_fkey";
       dt          postgres    false    300    3814    306            �           2606    40876 C   PhysicalAssetClassProperty PhysicalAssetClassProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetClassProperty"
    ADD CONSTRAINT "PhysicalAssetClassProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 m   ALTER TABLE ONLY dt."PhysicalAssetClassProperty" DROP CONSTRAINT "PhysicalAssetClassProperty_category_fkey";
       dt          postgres    false    307    3700    243            �           2606    40881 A   PhysicalAssetClassProperty PhysicalAssetClassProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetClassProperty"
    ADD CONSTRAINT "PhysicalAssetClassProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."PhysicalAssetClassProperty"(id) ON DELETE SET NULL;
 k   ALTER TABLE ONLY dt."PhysicalAssetClassProperty" DROP CONSTRAINT "PhysicalAssetClassProperty_parent_fkey";
       dt          postgres    false    3828    307    307            �           2606    40886 M   PhysicalAssetClassProperty PhysicalAssetClassProperty_physicalAssetClass_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetClassProperty"
    ADD CONSTRAINT "PhysicalAssetClassProperty_physicalAssetClass_fkey" FOREIGN KEY ("physicalAssetClass") REFERENCES dt."PhysicalAssetClass"(id) ON DELETE SET NULL;
 w   ALTER TABLE ONLY dt."PhysicalAssetClassProperty" DROP CONSTRAINT "PhysicalAssetClassProperty_physicalAssetClass_fkey";
       dt          postgres    false    3824    307    305            �           2606    40891 G   PhysicalAssetClassProperty PhysicalAssetClassProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetClassProperty"
    ADD CONSTRAINT "PhysicalAssetClassProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 q   ALTER TABLE ONLY dt."PhysicalAssetClassProperty" DROP CONSTRAINT "PhysicalAssetClassProperty_propertyType_fkey";
       dt          postgres    false    3854    307    320            �           2606    40896 E   PhysicalAssetClassProperty PhysicalAssetClassProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetClassProperty"
    ADD CONSTRAINT "PhysicalAssetClassProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY dt."PhysicalAssetClassProperty" DROP CONSTRAINT "PhysicalAssetClassProperty_sensorType_fkey";
       dt          postgres    false    216    307    3643            �           2606    40901 A   PhysicalAssetClassProperty PhysicalAssetClassProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetClassProperty"
    ADD CONSTRAINT "PhysicalAssetClassProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 k   ALTER TABLE ONLY dt."PhysicalAssetClassProperty" DROP CONSTRAINT "PhysicalAssetClassProperty_sensor_fkey";
       dt          postgres    false    3631    210    307            �           2606    40906 F   PhysicalAssetClassProperty PhysicalAssetClassProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetClassProperty"
    ADD CONSTRAINT "PhysicalAssetClassProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 p   ALTER TABLE ONLY dt."PhysicalAssetClassProperty" DROP CONSTRAINT "PhysicalAssetClassProperty_uomCategory_fkey";
       dt          postgres    false    3910    348    307            �           2606    40911 C   PhysicalAssetClassProperty PhysicalAssetClassProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetClassProperty"
    ADD CONSTRAINT "PhysicalAssetClassProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 m   ALTER TABLE ONLY dt."PhysicalAssetClassProperty" DROP CONSTRAINT "PhysicalAssetClassProperty_valueUom_fkey";
       dt          postgres    false    347    307    3908            �           2606    40916 1   PhysicalAssetClass PhysicalAssetClass_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetClass"
    ADD CONSTRAINT "PhysicalAssetClass_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."PhysicalAssetClass"(id) ON DELETE SET NULL;
 [   ALTER TABLE ONLY dt."PhysicalAssetClass" DROP CONSTRAINT "PhysicalAssetClass_parent_fkey";
       dt          postgres    false    3824    305    305            �           2606    40921 9   PhysicalAssetProperty PhysicalAssetProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetProperty"
    ADD CONSTRAINT "PhysicalAssetProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY dt."PhysicalAssetProperty" DROP CONSTRAINT "PhysicalAssetProperty_category_fkey";
       dt          postgres    false    243    3700    308            �           2606    40926 7   PhysicalAssetProperty PhysicalAssetProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetProperty"
    ADD CONSTRAINT "PhysicalAssetProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."PhysicalAssetProperty"(id) ON DELETE SET NULL;
 a   ALTER TABLE ONLY dt."PhysicalAssetProperty" DROP CONSTRAINT "PhysicalAssetProperty_parent_fkey";
       dt          postgres    false    3830    308    308            �           2606    40931 >   PhysicalAssetProperty PhysicalAssetProperty_physicalAsset_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetProperty"
    ADD CONSTRAINT "PhysicalAssetProperty_physicalAsset_fkey" FOREIGN KEY ("physicalAsset") REFERENCES dt."PhysicalAsset"(id) ON DELETE SET NULL;
 h   ALTER TABLE ONLY dt."PhysicalAssetProperty" DROP CONSTRAINT "PhysicalAssetProperty_physicalAsset_fkey";
       dt          postgres    false    308    3814    300            �           2606    40936 =   PhysicalAssetProperty PhysicalAssetProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetProperty"
    ADD CONSTRAINT "PhysicalAssetProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 g   ALTER TABLE ONLY dt."PhysicalAssetProperty" DROP CONSTRAINT "PhysicalAssetProperty_propertyType_fkey";
       dt          postgres    false    320    3854    308            �           2606    40941 ;   PhysicalAssetProperty PhysicalAssetProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetProperty"
    ADD CONSTRAINT "PhysicalAssetProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."PhysicalAssetProperty" DROP CONSTRAINT "PhysicalAssetProperty_sensorType_fkey";
       dt          postgres    false    308    3643    216            �           2606    40946 7   PhysicalAssetProperty PhysicalAssetProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetProperty"
    ADD CONSTRAINT "PhysicalAssetProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 a   ALTER TABLE ONLY dt."PhysicalAssetProperty" DROP CONSTRAINT "PhysicalAssetProperty_sensor_fkey";
       dt          postgres    false    308    210    3631                        2606    40951 <   PhysicalAssetProperty PhysicalAssetProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetProperty"
    ADD CONSTRAINT "PhysicalAssetProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 f   ALTER TABLE ONLY dt."PhysicalAssetProperty" DROP CONSTRAINT "PhysicalAssetProperty_uomCategory_fkey";
       dt          postgres    false    3910    348    308                       2606    40956 9   PhysicalAssetProperty PhysicalAssetProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetProperty"
    ADD CONSTRAINT "PhysicalAssetProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY dt."PhysicalAssetProperty" DROP CONSTRAINT "PhysicalAssetProperty_valueUom_fkey";
       dt          postgres    false    347    3908    308            	           2606    40961 O   PhysicalAssetRequirementProperty PhysicalAssetRequirementProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetRequirementProperty"
    ADD CONSTRAINT "PhysicalAssetRequirementProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 y   ALTER TABLE ONLY dt."PhysicalAssetRequirementProperty" DROP CONSTRAINT "PhysicalAssetRequirementProperty_category_fkey";
       dt          postgres    false    3700    310    243            
           2606    40966 Q   PhysicalAssetRequirementProperty PhysicalAssetRequirementProperty_logRateUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetRequirementProperty"
    ADD CONSTRAINT "PhysicalAssetRequirementProperty_logRateUom_fkey" FOREIGN KEY ("logRateUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 {   ALTER TABLE ONLY dt."PhysicalAssetRequirementProperty" DROP CONSTRAINT "PhysicalAssetRequirementProperty_logRateUom_fkey";
       dt          postgres    false    347    3908    310                       2606    40971 M   PhysicalAssetRequirementProperty PhysicalAssetRequirementProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetRequirementProperty"
    ADD CONSTRAINT "PhysicalAssetRequirementProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."PhysicalAssetRequirementProperty"(id) ON DELETE SET NULL;
 w   ALTER TABLE ONLY dt."PhysicalAssetRequirementProperty" DROP CONSTRAINT "PhysicalAssetRequirementProperty_parent_fkey";
       dt          postgres    false    310    310    3834                       2606    40976 _   PhysicalAssetRequirementProperty PhysicalAssetRequirementProperty_physicalAssetRequirement_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetRequirementProperty"
    ADD CONSTRAINT "PhysicalAssetRequirementProperty_physicalAssetRequirement_fkey" FOREIGN KEY ("physicalAssetRequirement") REFERENCES dt."PhysicalAssetRequirement"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."PhysicalAssetRequirementProperty" DROP CONSTRAINT "PhysicalAssetRequirementProperty_physicalAssetRequirement_fkey";
       dt          postgres    false    310    3832    309                       2606    40981 S   PhysicalAssetRequirementProperty PhysicalAssetRequirementProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetRequirementProperty"
    ADD CONSTRAINT "PhysicalAssetRequirementProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 }   ALTER TABLE ONLY dt."PhysicalAssetRequirementProperty" DROP CONSTRAINT "PhysicalAssetRequirementProperty_propertyType_fkey";
       dt          postgres    false    310    3854    320                       2606    40986 R   PhysicalAssetRequirementProperty PhysicalAssetRequirementProperty_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetRequirementProperty"
    ADD CONSTRAINT "PhysicalAssetRequirementProperty_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 |   ALTER TABLE ONLY dt."PhysicalAssetRequirementProperty" DROP CONSTRAINT "PhysicalAssetRequirementProperty_quantityUom_fkey";
       dt          postgres    false    3908    310    347                       2606    40991 Q   PhysicalAssetRequirementProperty PhysicalAssetRequirementProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetRequirementProperty"
    ADD CONSTRAINT "PhysicalAssetRequirementProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 {   ALTER TABLE ONLY dt."PhysicalAssetRequirementProperty" DROP CONSTRAINT "PhysicalAssetRequirementProperty_sensorType_fkey";
       dt          postgres    false    216    3643    310                       2606    40996 M   PhysicalAssetRequirementProperty PhysicalAssetRequirementProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetRequirementProperty"
    ADD CONSTRAINT "PhysicalAssetRequirementProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 w   ALTER TABLE ONLY dt."PhysicalAssetRequirementProperty" DROP CONSTRAINT "PhysicalAssetRequirementProperty_sensor_fkey";
       dt          postgres    false    3631    310    210                       2606    41001 R   PhysicalAssetRequirementProperty PhysicalAssetRequirementProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetRequirementProperty"
    ADD CONSTRAINT "PhysicalAssetRequirementProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 |   ALTER TABLE ONLY dt."PhysicalAssetRequirementProperty" DROP CONSTRAINT "PhysicalAssetRequirementProperty_uomCategory_fkey";
       dt          postgres    false    348    310    3910                       2606    41006 O   PhysicalAssetRequirementProperty PhysicalAssetRequirementProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetRequirementProperty"
    ADD CONSTRAINT "PhysicalAssetRequirementProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 y   ALTER TABLE ONLY dt."PhysicalAssetRequirementProperty" DROP CONSTRAINT "PhysicalAssetRequirementProperty_valueUom_fkey";
       dt          postgres    false    3908    347    310                       2606    41011 E   PhysicalAssetRequirement PhysicalAssetRequirement_equipmentLevel_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetRequirement"
    ADD CONSTRAINT "PhysicalAssetRequirement_equipmentLevel_fkey" FOREIGN KEY ("equipmentLevel") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY dt."PhysicalAssetRequirement" DROP CONSTRAINT "PhysicalAssetRequirement_equipmentLevel_fkey";
       dt          postgres    false    309    3700    243                       2606    41016 ?   PhysicalAssetRequirement PhysicalAssetRequirement_jobOrder_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetRequirement"
    ADD CONSTRAINT "PhysicalAssetRequirement_jobOrder_fkey" FOREIGN KEY ("jobOrder") REFERENCES dt."JobOrder"(id) ON DELETE SET NULL;
 i   ALTER TABLE ONLY dt."PhysicalAssetRequirement" DROP CONSTRAINT "PhysicalAssetRequirement_jobOrder_fkey";
       dt          postgres    false    309    239    3692                       2606    41021 I   PhysicalAssetRequirement PhysicalAssetRequirement_physicalAssetClass_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetRequirement"
    ADD CONSTRAINT "PhysicalAssetRequirement_physicalAssetClass_fkey" FOREIGN KEY ("physicalAssetClass") REFERENCES dt."PhysicalAssetClass"(id) ON DELETE SET NULL;
 s   ALTER TABLE ONLY dt."PhysicalAssetRequirement" DROP CONSTRAINT "PhysicalAssetRequirement_physicalAssetClass_fkey";
       dt          postgres    false    309    305    3824                       2606    41026 D   PhysicalAssetRequirement PhysicalAssetRequirement_physicalAsset_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetRequirement"
    ADD CONSTRAINT "PhysicalAssetRequirement_physicalAsset_fkey" FOREIGN KEY ("physicalAsset") REFERENCES dt."PhysicalAsset"(id) ON DELETE SET NULL;
 n   ALTER TABLE ONLY dt."PhysicalAssetRequirement" DROP CONSTRAINT "PhysicalAssetRequirement_physicalAsset_fkey";
       dt          postgres    false    309    3814    300                       2606    41031 B   PhysicalAssetRequirement PhysicalAssetRequirement_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetRequirement"
    ADD CONSTRAINT "PhysicalAssetRequirement_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 l   ALTER TABLE ONLY dt."PhysicalAssetRequirement" DROP CONSTRAINT "PhysicalAssetRequirement_quantityUom_fkey";
       dt          postgres    false    347    309    3908                       2606    41036 B   PhysicalAssetRequirement PhysicalAssetRequirement_resourceUse_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetRequirement"
    ADD CONSTRAINT "PhysicalAssetRequirement_resourceUse_fkey" FOREIGN KEY ("resourceUse") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 l   ALTER TABLE ONLY dt."PhysicalAssetRequirement" DROP CONSTRAINT "PhysicalAssetRequirement_resourceUse_fkey";
       dt          postgres    false    3700    243    309                       2606    41041 I   PhysicalAssetRequirement PhysicalAssetRequirement_segmentRequirement_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetRequirement"
    ADD CONSTRAINT "PhysicalAssetRequirement_segmentRequirement_fkey" FOREIGN KEY ("segmentRequirement") REFERENCES dt."SegmentRequirement"(id) ON DELETE SET NULL;
 s   ALTER TABLE ONLY dt."PhysicalAssetRequirement" DROP CONSTRAINT "PhysicalAssetRequirement_segmentRequirement_fkey";
       dt          postgres    false    309    3882    334                       2606    41046 i   PhysicalAssetSegmentSpecificationProperty PhysicalAssetSegmentSpecifica_physicalAssetSegmentSpecific_fkey    FK CONSTRAINT       ALTER TABLE ONLY dt."PhysicalAssetSegmentSpecificationProperty"
    ADD CONSTRAINT "PhysicalAssetSegmentSpecifica_physicalAssetSegmentSpecific_fkey" FOREIGN KEY ("physicalAssetSegmentSpecification") REFERENCES dt."PhysicalAssetSegmentSpecification"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."PhysicalAssetSegmentSpecificationProperty" DROP CONSTRAINT "PhysicalAssetSegmentSpecifica_physicalAssetSegmentSpecific_fkey";
       dt          postgres    false    312    3836    311                       2606    41051 a   PhysicalAssetSegmentSpecificationProperty PhysicalAssetSegmentSpecificationProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetSegmentSpecificationProperty"
    ADD CONSTRAINT "PhysicalAssetSegmentSpecificationProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."PhysicalAssetSegmentSpecificationProperty" DROP CONSTRAINT "PhysicalAssetSegmentSpecificationProperty_category_fkey";
       dt          postgres    false    3700    312    243                       2606    41056 _   PhysicalAssetSegmentSpecificationProperty PhysicalAssetSegmentSpecificationProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetSegmentSpecificationProperty"
    ADD CONSTRAINT "PhysicalAssetSegmentSpecificationProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."PhysicalAssetSegmentSpecificationProperty"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."PhysicalAssetSegmentSpecificationProperty" DROP CONSTRAINT "PhysicalAssetSegmentSpecificationProperty_parent_fkey";
       dt          postgres    false    3838    312    312                       2606    41061 e   PhysicalAssetSegmentSpecificationProperty PhysicalAssetSegmentSpecificationProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetSegmentSpecificationProperty"
    ADD CONSTRAINT "PhysicalAssetSegmentSpecificationProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."PhysicalAssetSegmentSpecificationProperty" DROP CONSTRAINT "PhysicalAssetSegmentSpecificationProperty_propertyType_fkey";
       dt          postgres    false    312    320    3854                       2606    41066 d   PhysicalAssetSegmentSpecificationProperty PhysicalAssetSegmentSpecificationProperty_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetSegmentSpecificationProperty"
    ADD CONSTRAINT "PhysicalAssetSegmentSpecificationProperty_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."PhysicalAssetSegmentSpecificationProperty" DROP CONSTRAINT "PhysicalAssetSegmentSpecificationProperty_quantityUom_fkey";
       dt          postgres    false    3908    312    347                       2606    41071 c   PhysicalAssetSegmentSpecificationProperty PhysicalAssetSegmentSpecificationProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetSegmentSpecificationProperty"
    ADD CONSTRAINT "PhysicalAssetSegmentSpecificationProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."PhysicalAssetSegmentSpecificationProperty" DROP CONSTRAINT "PhysicalAssetSegmentSpecificationProperty_sensorType_fkey";
       dt          postgres    false    3643    216    312                       2606    41076 _   PhysicalAssetSegmentSpecificationProperty PhysicalAssetSegmentSpecificationProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetSegmentSpecificationProperty"
    ADD CONSTRAINT "PhysicalAssetSegmentSpecificationProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."PhysicalAssetSegmentSpecificationProperty" DROP CONSTRAINT "PhysicalAssetSegmentSpecificationProperty_sensor_fkey";
       dt          postgres    false    312    3631    210                       2606    41081 d   PhysicalAssetSegmentSpecificationProperty PhysicalAssetSegmentSpecificationProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetSegmentSpecificationProperty"
    ADD CONSTRAINT "PhysicalAssetSegmentSpecificationProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."PhysicalAssetSegmentSpecificationProperty" DROP CONSTRAINT "PhysicalAssetSegmentSpecificationProperty_uomCategory_fkey";
       dt          postgres    false    348    312    3910                        2606    41086 a   PhysicalAssetSegmentSpecificationProperty PhysicalAssetSegmentSpecificationProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetSegmentSpecificationProperty"
    ADD CONSTRAINT "PhysicalAssetSegmentSpecificationProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."PhysicalAssetSegmentSpecificationProperty" DROP CONSTRAINT "PhysicalAssetSegmentSpecificationProperty_valueUom_fkey";
       dt          postgres    false    3908    312    347                       2606    41091 [   PhysicalAssetSegmentSpecification PhysicalAssetSegmentSpecification_physicalAssetClass_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetSegmentSpecification"
    ADD CONSTRAINT "PhysicalAssetSegmentSpecification_physicalAssetClass_fkey" FOREIGN KEY ("physicalAssetClass") REFERENCES dt."PhysicalAssetClass"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."PhysicalAssetSegmentSpecification" DROP CONSTRAINT "PhysicalAssetSegmentSpecification_physicalAssetClass_fkey";
       dt          postgres    false    3824    305    311                       2606    41096 V   PhysicalAssetSegmentSpecification PhysicalAssetSegmentSpecification_physicalAsset_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetSegmentSpecification"
    ADD CONSTRAINT "PhysicalAssetSegmentSpecification_physicalAsset_fkey" FOREIGN KEY ("physicalAsset") REFERENCES dt."PhysicalAsset"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."PhysicalAssetSegmentSpecification" DROP CONSTRAINT "PhysicalAssetSegmentSpecification_physicalAsset_fkey";
       dt          postgres    false    300    3814    311                       2606    41101 W   PhysicalAssetSegmentSpecification PhysicalAssetSegmentSpecification_processSegment_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetSegmentSpecification"
    ADD CONSTRAINT "PhysicalAssetSegmentSpecification_processSegment_fkey" FOREIGN KEY ("processSegment") REFERENCES dt."ProcessSegment"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."PhysicalAssetSegmentSpecification" DROP CONSTRAINT "PhysicalAssetSegmentSpecification_processSegment_fkey";
       dt          postgres    false    315    311    3844                       2606    41106 T   PhysicalAssetSegmentSpecification PhysicalAssetSegmentSpecification_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetSegmentSpecification"
    ADD CONSTRAINT "PhysicalAssetSegmentSpecification_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 ~   ALTER TABLE ONLY dt."PhysicalAssetSegmentSpecification" DROP CONSTRAINT "PhysicalAssetSegmentSpecification_quantityUom_fkey";
       dt          postgres    false    3908    311    347                       2606    41111 T   PhysicalAssetSegmentSpecification PhysicalAssetSegmentSpecification_resourceUse_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetSegmentSpecification"
    ADD CONSTRAINT "PhysicalAssetSegmentSpecification_resourceUse_fkey" FOREIGN KEY ("resourceUse") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 ~   ALTER TABLE ONLY dt."PhysicalAssetSegmentSpecification" DROP CONSTRAINT "PhysicalAssetSegmentSpecification_resourceUse_fkey";
       dt          postgres    false    243    311    3700            '           2606    41116 b   PhysicalAssetSpecificationProperty PhysicalAssetSpecificationPrope_physicalAssetSpecification_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetSpecificationProperty"
    ADD CONSTRAINT "PhysicalAssetSpecificationPrope_physicalAssetSpecification_fkey" FOREIGN KEY ("physicalAssetSpecification") REFERENCES dt."PhysicalAssetSpecification"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."PhysicalAssetSpecificationProperty" DROP CONSTRAINT "PhysicalAssetSpecificationPrope_physicalAssetSpecification_fkey";
       dt          postgres    false    313    314    3840            (           2606    41121 S   PhysicalAssetSpecificationProperty PhysicalAssetSpecificationProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetSpecificationProperty"
    ADD CONSTRAINT "PhysicalAssetSpecificationProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 }   ALTER TABLE ONLY dt."PhysicalAssetSpecificationProperty" DROP CONSTRAINT "PhysicalAssetSpecificationProperty_category_fkey";
       dt          postgres    false    243    314    3700            )           2606    41126 U   PhysicalAssetSpecificationProperty PhysicalAssetSpecificationProperty_logRateUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetSpecificationProperty"
    ADD CONSTRAINT "PhysicalAssetSpecificationProperty_logRateUom_fkey" FOREIGN KEY ("logRateUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
    ALTER TABLE ONLY dt."PhysicalAssetSpecificationProperty" DROP CONSTRAINT "PhysicalAssetSpecificationProperty_logRateUom_fkey";
       dt          postgres    false    347    314    3908            *           2606    41131 Q   PhysicalAssetSpecificationProperty PhysicalAssetSpecificationProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetSpecificationProperty"
    ADD CONSTRAINT "PhysicalAssetSpecificationProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."PhysicalAssetSpecificationProperty"(id) ON DELETE SET NULL;
 {   ALTER TABLE ONLY dt."PhysicalAssetSpecificationProperty" DROP CONSTRAINT "PhysicalAssetSpecificationProperty_parent_fkey";
       dt          postgres    false    314    314    3842            +           2606    41136 W   PhysicalAssetSpecificationProperty PhysicalAssetSpecificationProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetSpecificationProperty"
    ADD CONSTRAINT "PhysicalAssetSpecificationProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."PhysicalAssetSpecificationProperty" DROP CONSTRAINT "PhysicalAssetSpecificationProperty_propertyType_fkey";
       dt          postgres    false    3854    314    320            ,           2606    41141 V   PhysicalAssetSpecificationProperty PhysicalAssetSpecificationProperty_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetSpecificationProperty"
    ADD CONSTRAINT "PhysicalAssetSpecificationProperty_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."PhysicalAssetSpecificationProperty" DROP CONSTRAINT "PhysicalAssetSpecificationProperty_quantityUom_fkey";
       dt          postgres    false    314    347    3908            -           2606    41146 U   PhysicalAssetSpecificationProperty PhysicalAssetSpecificationProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetSpecificationProperty"
    ADD CONSTRAINT "PhysicalAssetSpecificationProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
    ALTER TABLE ONLY dt."PhysicalAssetSpecificationProperty" DROP CONSTRAINT "PhysicalAssetSpecificationProperty_sensorType_fkey";
       dt          postgres    false    3643    314    216            .           2606    41151 Q   PhysicalAssetSpecificationProperty PhysicalAssetSpecificationProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetSpecificationProperty"
    ADD CONSTRAINT "PhysicalAssetSpecificationProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 {   ALTER TABLE ONLY dt."PhysicalAssetSpecificationProperty" DROP CONSTRAINT "PhysicalAssetSpecificationProperty_sensor_fkey";
       dt          postgres    false    210    314    3631            /           2606    41156 V   PhysicalAssetSpecificationProperty PhysicalAssetSpecificationProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetSpecificationProperty"
    ADD CONSTRAINT "PhysicalAssetSpecificationProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."PhysicalAssetSpecificationProperty" DROP CONSTRAINT "PhysicalAssetSpecificationProperty_uomCategory_fkey";
       dt          postgres    false    348    314    3910            0           2606    41161 S   PhysicalAssetSpecificationProperty PhysicalAssetSpecificationProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetSpecificationProperty"
    ADD CONSTRAINT "PhysicalAssetSpecificationProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 }   ALTER TABLE ONLY dt."PhysicalAssetSpecificationProperty" DROP CONSTRAINT "PhysicalAssetSpecificationProperty_valueUom_fkey";
       dt          postgres    false    347    314    3908            !           2606    41166 L   PhysicalAssetSpecification PhysicalAssetSpecification_operationsSegment_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetSpecification"
    ADD CONSTRAINT "PhysicalAssetSpecification_operationsSegment_fkey" FOREIGN KEY ("operationsSegment") REFERENCES dt."OperationsSegment"(id) ON DELETE SET NULL;
 v   ALTER TABLE ONLY dt."PhysicalAssetSpecification" DROP CONSTRAINT "PhysicalAssetSpecification_operationsSegment_fkey";
       dt          postgres    false    282    313    3778            "           2606    41171 M   PhysicalAssetSpecification PhysicalAssetSpecification_physicalAssetClass_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetSpecification"
    ADD CONSTRAINT "PhysicalAssetSpecification_physicalAssetClass_fkey" FOREIGN KEY ("physicalAssetClass") REFERENCES dt."PhysicalAssetClass"(id) ON DELETE SET NULL;
 w   ALTER TABLE ONLY dt."PhysicalAssetSpecification" DROP CONSTRAINT "PhysicalAssetSpecification_physicalAssetClass_fkey";
       dt          postgres    false    305    313    3824            #           2606    41176 H   PhysicalAssetSpecification PhysicalAssetSpecification_physicalAsset_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetSpecification"
    ADD CONSTRAINT "PhysicalAssetSpecification_physicalAsset_fkey" FOREIGN KEY ("physicalAsset") REFERENCES dt."PhysicalAsset"(id) ON DELETE SET NULL;
 r   ALTER TABLE ONLY dt."PhysicalAssetSpecification" DROP CONSTRAINT "PhysicalAssetSpecification_physicalAsset_fkey";
       dt          postgres    false    300    313    3814            $           2606    41181 F   PhysicalAssetSpecification PhysicalAssetSpecification_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetSpecification"
    ADD CONSTRAINT "PhysicalAssetSpecification_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 p   ALTER TABLE ONLY dt."PhysicalAssetSpecification" DROP CONSTRAINT "PhysicalAssetSpecification_quantityUom_fkey";
       dt          postgres    false    3908    313    347            %           2606    41186 F   PhysicalAssetSpecification PhysicalAssetSpecification_resourceUse_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetSpecification"
    ADD CONSTRAINT "PhysicalAssetSpecification_resourceUse_fkey" FOREIGN KEY ("resourceUse") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 p   ALTER TABLE ONLY dt."PhysicalAssetSpecification" DROP CONSTRAINT "PhysicalAssetSpecification_resourceUse_fkey";
       dt          postgres    false    313    243    3700            &           2606    41191 E   PhysicalAssetSpecification PhysicalAssetSpecification_workMaster_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAssetSpecification"
    ADD CONSTRAINT "PhysicalAssetSpecification_workMaster_fkey" FOREIGN KEY ("workMaster") REFERENCES dt."WorkMaster"(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY dt."PhysicalAssetSpecification" DROP CONSTRAINT "PhysicalAssetSpecification_workMaster_fkey";
       dt          postgres    false    3940    313    363            �           2606    41196 '   PhysicalAsset PhysicalAsset_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAsset"
    ADD CONSTRAINT "PhysicalAsset_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."PhysicalAsset"(id) ON DELETE SET NULL;
 Q   ALTER TABLE ONLY dt."PhysicalAsset" DROP CONSTRAINT "PhysicalAsset_parent_fkey";
       dt          postgres    false    300    300    3814            �           2606    41201 1   PhysicalAsset PhysicalAsset_physicalLocation_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PhysicalAsset"
    ADD CONSTRAINT "PhysicalAsset_physicalLocation_fkey" FOREIGN KEY ("physicalLocation") REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 [   ALTER TABLE ONLY dt."PhysicalAsset" DROP CONSTRAINT "PhysicalAsset_physicalLocation_fkey";
       dt          postgres    false    210    300    3631            6           2606    41206 E   ProcessSegmentCapability ProcessSegmentCapability_capabilityType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ProcessSegmentCapability"
    ADD CONSTRAINT "ProcessSegmentCapability_capabilityType_fkey" FOREIGN KEY ("capabilityType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY dt."ProcessSegmentCapability" DROP CONSTRAINT "ProcessSegmentCapability_capabilityType_fkey";
       dt          postgres    false    243    316    3700            7           2606    41211 E   ProcessSegmentCapability ProcessSegmentCapability_hierarchyScope_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ProcessSegmentCapability"
    ADD CONSTRAINT "ProcessSegmentCapability_hierarchyScope_fkey" FOREIGN KEY ("hierarchyScope") REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY dt."ProcessSegmentCapability" DROP CONSTRAINT "ProcessSegmentCapability_hierarchyScope_fkey";
       dt          postgres    false    210    316    3631            8           2606    41216 K   ProcessSegmentCapability ProcessSegmentCapability_operationsCapability_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ProcessSegmentCapability"
    ADD CONSTRAINT "ProcessSegmentCapability_operationsCapability_fkey" FOREIGN KEY ("operationsCapability") REFERENCES dt."OperationsCapability"(id) ON DELETE SET NULL;
 u   ALTER TABLE ONLY dt."ProcessSegmentCapability" DROP CONSTRAINT "ProcessSegmentCapability_operationsCapability_fkey";
       dt          postgres    false    268    316    3750            9           2606    41221 =   ProcessSegmentCapability ProcessSegmentCapability_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ProcessSegmentCapability"
    ADD CONSTRAINT "ProcessSegmentCapability_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."ProcessSegmentCapability"(id) ON DELETE SET NULL;
 g   ALTER TABLE ONLY dt."ProcessSegmentCapability" DROP CONSTRAINT "ProcessSegmentCapability_parent_fkey";
       dt          postgres    false    316    316    3846            :           2606    41226 E   ProcessSegmentCapability ProcessSegmentCapability_processSegment_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ProcessSegmentCapability"
    ADD CONSTRAINT "ProcessSegmentCapability_processSegment_fkey" FOREIGN KEY ("processSegment") REFERENCES dt."ProcessSegment"(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY dt."ProcessSegmentCapability" DROP CONSTRAINT "ProcessSegmentCapability_processSegment_fkey";
       dt          postgres    false    316    315    3844            ;           2606    41231 G   ProcessSegmentDependency ProcessSegmentDependency_dependencyFactor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ProcessSegmentDependency"
    ADD CONSTRAINT "ProcessSegmentDependency_dependencyFactor_fkey" FOREIGN KEY ("dependencyFactor") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 q   ALTER TABLE ONLY dt."ProcessSegmentDependency" DROP CONSTRAINT "ProcessSegmentDependency_dependencyFactor_fkey";
       dt          postgres    false    317    243    3700            <           2606    41236 E   ProcessSegmentDependency ProcessSegmentDependency_dependencyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ProcessSegmentDependency"
    ADD CONSTRAINT "ProcessSegmentDependency_dependencyType_fkey" FOREIGN KEY ("dependencyType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY dt."ProcessSegmentDependency" DROP CONSTRAINT "ProcessSegmentDependency_dependencyType_fkey";
       dt          postgres    false    3700    317    243            =           2606    41241 G   ProcessSegmentDependency ProcessSegmentDependency_dependentSegment_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ProcessSegmentDependency"
    ADD CONSTRAINT "ProcessSegmentDependency_dependentSegment_fkey" FOREIGN KEY ("dependentSegment") REFERENCES dt."ProcessSegment"(id) ON DELETE SET NULL;
 q   ALTER TABLE ONLY dt."ProcessSegmentDependency" DROP CONSTRAINT "ProcessSegmentDependency_dependentSegment_fkey";
       dt          postgres    false    315    317    3844            >           2606    41246 >   ProcessSegmentDependency ProcessSegmentDependency_segment_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ProcessSegmentDependency"
    ADD CONSTRAINT "ProcessSegmentDependency_segment_fkey" FOREIGN KEY (segment) REFERENCES dt."ProcessSegment"(id) ON DELETE SET NULL;
 h   ALTER TABLE ONLY dt."ProcessSegmentDependency" DROP CONSTRAINT "ProcessSegmentDependency_segment_fkey";
       dt          postgres    false    315    317    3844            ?           2606    41251 ?   ProcessSegmentDependency ProcessSegmentDependency_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ProcessSegmentDependency"
    ADD CONSTRAINT "ProcessSegmentDependency_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 i   ALTER TABLE ONLY dt."ProcessSegmentDependency" DROP CONSTRAINT "ProcessSegmentDependency_valueUom_fkey";
       dt          postgres    false    347    317    3908            @           2606    41256 =   ProcessSegmentParameter ProcessSegmentParameter_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ProcessSegmentParameter"
    ADD CONSTRAINT "ProcessSegmentParameter_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 g   ALTER TABLE ONLY dt."ProcessSegmentParameter" DROP CONSTRAINT "ProcessSegmentParameter_category_fkey";
       dt          postgres    false    243    318    3700            A           2606    41261 ;   ProcessSegmentParameter ProcessSegmentParameter_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ProcessSegmentParameter"
    ADD CONSTRAINT "ProcessSegmentParameter_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."ProcessSegmentParameter"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."ProcessSegmentParameter" DROP CONSTRAINT "ProcessSegmentParameter_parent_fkey";
       dt          postgres    false    318    318    3850            B           2606    41266 C   ProcessSegmentParameter ProcessSegmentParameter_processSegment_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ProcessSegmentParameter"
    ADD CONSTRAINT "ProcessSegmentParameter_processSegment_fkey" FOREIGN KEY ("processSegment") REFERENCES dt."ProcessSegment"(id) ON DELETE SET NULL;
 m   ALTER TABLE ONLY dt."ProcessSegmentParameter" DROP CONSTRAINT "ProcessSegmentParameter_processSegment_fkey";
       dt          postgres    false    318    3844    315            C           2606    41271 A   ProcessSegmentParameter ProcessSegmentParameter_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ProcessSegmentParameter"
    ADD CONSTRAINT "ProcessSegmentParameter_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 k   ALTER TABLE ONLY dt."ProcessSegmentParameter" DROP CONSTRAINT "ProcessSegmentParameter_propertyType_fkey";
       dt          postgres    false    3854    318    320            D           2606    41276 ?   ProcessSegmentParameter ProcessSegmentParameter_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ProcessSegmentParameter"
    ADD CONSTRAINT "ProcessSegmentParameter_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 i   ALTER TABLE ONLY dt."ProcessSegmentParameter" DROP CONSTRAINT "ProcessSegmentParameter_sensorType_fkey";
       dt          postgres    false    318    216    3643            E           2606    41281 ;   ProcessSegmentParameter ProcessSegmentParameter_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ProcessSegmentParameter"
    ADD CONSTRAINT "ProcessSegmentParameter_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."ProcessSegmentParameter" DROP CONSTRAINT "ProcessSegmentParameter_sensor_fkey";
       dt          postgres    false    3631    318    210            F           2606    41286 @   ProcessSegmentParameter ProcessSegmentParameter_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ProcessSegmentParameter"
    ADD CONSTRAINT "ProcessSegmentParameter_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 j   ALTER TABLE ONLY dt."ProcessSegmentParameter" DROP CONSTRAINT "ProcessSegmentParameter_uomCategory_fkey";
       dt          postgres    false    348    318    3910            G           2606    41291 =   ProcessSegmentParameter ProcessSegmentParameter_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ProcessSegmentParameter"
    ADD CONSTRAINT "ProcessSegmentParameter_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 g   ALTER TABLE ONLY dt."ProcessSegmentParameter" DROP CONSTRAINT "ProcessSegmentParameter_valueUom_fkey";
       dt          postgres    false    347    318    3908            1           2606    41296 .   ProcessSegment ProcessSegment_durationUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ProcessSegment"
    ADD CONSTRAINT "ProcessSegment_durationUom_fkey" FOREIGN KEY ("durationUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY dt."ProcessSegment" DROP CONSTRAINT "ProcessSegment_durationUom_fkey";
       dt          postgres    false    347    315    3908            2           2606    41301 1   ProcessSegment ProcessSegment_hierarchyScope_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ProcessSegment"
    ADD CONSTRAINT "ProcessSegment_hierarchyScope_fkey" FOREIGN KEY ("hierarchyScope") REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 [   ALTER TABLE ONLY dt."ProcessSegment" DROP CONSTRAINT "ProcessSegment_hierarchyScope_fkey";
       dt          postgres    false    210    315    3631            3           2606    41306 1   ProcessSegment ProcessSegment_operationsType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ProcessSegment"
    ADD CONSTRAINT "ProcessSegment_operationsType_fkey" FOREIGN KEY ("operationsType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 [   ALTER TABLE ONLY dt."ProcessSegment" DROP CONSTRAINT "ProcessSegment_operationsType_fkey";
       dt          postgres    false    243    315    3700            4           2606    41311 )   ProcessSegment ProcessSegment_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ProcessSegment"
    ADD CONSTRAINT "ProcessSegment_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."ProcessSegment"(id) ON DELETE SET NULL;
 S   ALTER TABLE ONLY dt."ProcessSegment" DROP CONSTRAINT "ProcessSegment_parent_fkey";
       dt          postgres    false    315    315    3844            5           2606    41316 -   ProcessSegment ProcessSegment_recordType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ProcessSegment"
    ADD CONSTRAINT "ProcessSegment_recordType_fkey" FOREIGN KEY ("recordType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 W   ALTER TABLE ONLY dt."ProcessSegment" DROP CONSTRAINT "ProcessSegment_recordType_fkey";
       dt          postgres    false    315    243    3700            H           2606    41321 4   ProductionPlan ProductionPlan_operationsRequest_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ProductionPlan"
    ADD CONSTRAINT "ProductionPlan_operationsRequest_fkey" FOREIGN KEY ("operationsRequest") REFERENCES dt."OperationsRequest"(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY dt."ProductionPlan" DROP CONSTRAINT "ProductionPlan_operationsRequest_fkey";
       dt          postgres    false    319    276    3766            I           2606    41326 .   ProductionPlan ProductionPlan_quantityUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ProductionPlan"
    ADD CONSTRAINT "ProductionPlan_quantityUom_fkey" FOREIGN KEY ("quantityUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY dt."ProductionPlan" DROP CONSTRAINT "ProductionPlan_quantityUom_fkey";
       dt          postgres    false    3908    319    347            J           2606    41331 5   ProductionPlan ProductionPlan_segmentRequirement_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ProductionPlan"
    ADD CONSTRAINT "ProductionPlan_segmentRequirement_fkey" FOREIGN KEY ("segmentRequirement") REFERENCES dt."SegmentRequirement"(id) ON DELETE SET NULL;
 _   ALTER TABLE ONLY dt."ProductionPlan" DROP CONSTRAINT "ProductionPlan_segmentRequirement_fkey";
       dt          postgres    false    334    319    3882            K           2606    41336 (   ProductionPlan ProductionPlan_shift_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ProductionPlan"
    ADD CONSTRAINT "ProductionPlan_shift_fkey" FOREIGN KEY (shift) REFERENCES dt."Shift"(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY dt."ProductionPlan" DROP CONSTRAINT "ProductionPlan_shift_fkey";
       dt          postgres    false    336    319    3886            L           2606    41341 %   PropertyType PropertyType_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PropertyType"
    ADD CONSTRAINT "PropertyType_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 O   ALTER TABLE ONLY dt."PropertyType" DROP CONSTRAINT "PropertyType_parent_fkey";
       dt          postgres    false    320    320    3854            M           2606    41346 )   PropertyType PropertyType_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PropertyType"
    ADD CONSTRAINT "PropertyType_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 S   ALTER TABLE ONLY dt."PropertyType" DROP CONSTRAINT "PropertyType_sensorType_fkey";
       dt          postgres    false    216    320    3643            N           2606    41351 *   PropertyType PropertyType_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."PropertyType"
    ADD CONSTRAINT "PropertyType_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 T   ALTER TABLE ONLY dt."PropertyType" DROP CONSTRAINT "PropertyType_uomCategory_fkey";
       dt          postgres    false    348    320    3910            P           2606    41356 H   ReasonEquipmentTypeMapping ReasonEquipmentTypeMapping_equipmentType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ReasonEquipmentTypeMapping"
    ADD CONSTRAINT "ReasonEquipmentTypeMapping_equipmentType_fkey" FOREIGN KEY ("equipmentType") REFERENCES dt."EquipmentClass"(id) ON DELETE CASCADE;
 r   ALTER TABLE ONLY dt."ReasonEquipmentTypeMapping" DROP CONSTRAINT "ReasonEquipmentTypeMapping_equipmentType_fkey";
       dt          postgres    false    323    3643    216            Q           2606    41361 A   ReasonEquipmentTypeMapping ReasonEquipmentTypeMapping_reason_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ReasonEquipmentTypeMapping"
    ADD CONSTRAINT "ReasonEquipmentTypeMapping_reason_fkey" FOREIGN KEY (reason) REFERENCES dt."Reason"(id) ON DELETE CASCADE;
 k   ALTER TABLE ONLY dt."ReasonEquipmentTypeMapping" DROP CONSTRAINT "ReasonEquipmentTypeMapping_reason_fkey";
       dt          postgres    false    323    321    3856            R           2606    41366 1   ReasonSubCategory ReasonSubCategory_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ReasonSubCategory"
    ADD CONSTRAINT "ReasonSubCategory_category_fkey" FOREIGN KEY (category) REFERENCES dt."ReasonCategory"(id) ON DELETE SET NULL;
 [   ALTER TABLE ONLY dt."ReasonSubCategory" DROP CONSTRAINT "ReasonSubCategory_category_fkey";
       dt          postgres    false    324    322    3858            U           2606    41371 /   ReasonTreeConfig ReasonTreeConfig_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ReasonTreeConfig"
    ADD CONSTRAINT "ReasonTreeConfig_category_fkey" FOREIGN KEY (category) REFERENCES dt."ReasonCategory"(id) ON DELETE SET NULL;
 Y   ALTER TABLE ONLY dt."ReasonTreeConfig" DROP CONSTRAINT "ReasonTreeConfig_category_fkey";
       dt          postgres    false    3858    326    322            V           2606    41376 0   ReasonTreeConfig ReasonTreeConfig_equipment_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ReasonTreeConfig"
    ADD CONSTRAINT "ReasonTreeConfig_equipment_fkey" FOREIGN KEY (equipment) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 Z   ALTER TABLE ONLY dt."ReasonTreeConfig" DROP CONSTRAINT "ReasonTreeConfig_equipment_fkey";
       dt          postgres    false    210    326    3631            W           2606    41381 1   ReasonTreeConfig ReasonTreeConfig_reasonTree_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ReasonTreeConfig"
    ADD CONSTRAINT "ReasonTreeConfig_reasonTree_fkey" FOREIGN KEY ("reasonTree") REFERENCES dt."ReasonTree"(id) ON DELETE SET NULL;
 [   ALTER TABLE ONLY dt."ReasonTreeConfig" DROP CONSTRAINT "ReasonTreeConfig_reasonTree_fkey";
       dt          postgres    false    325    326    3864            X           2606    41386 -   ReasonTreeConfig ReasonTreeConfig_reason_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ReasonTreeConfig"
    ADD CONSTRAINT "ReasonTreeConfig_reason_fkey" FOREIGN KEY (reason) REFERENCES dt."Reason"(id) ON DELETE SET NULL;
 W   ALTER TABLE ONLY dt."ReasonTreeConfig" DROP CONSTRAINT "ReasonTreeConfig_reason_fkey";
       dt          postgres    false    321    326    3856            Y           2606    41391 6   ReasonTreeConfig ReasonTreeConfig_stateDefinition_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ReasonTreeConfig"
    ADD CONSTRAINT "ReasonTreeConfig_stateDefinition_fkey" FOREIGN KEY ("stateDefinition") REFERENCES dt."StateDefinition"(id) ON DELETE SET NULL;
 `   ALTER TABLE ONLY dt."ReasonTreeConfig" DROP CONSTRAINT "ReasonTreeConfig_stateDefinition_fkey";
       dt          postgres    false    337    326    3888            Z           2606    41396 2   ReasonTreeConfig ReasonTreeConfig_subCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ReasonTreeConfig"
    ADD CONSTRAINT "ReasonTreeConfig_subCategory_fkey" FOREIGN KEY ("subCategory") REFERENCES dt."ReasonSubCategory"(id) ON DELETE SET NULL;
 \   ALTER TABLE ONLY dt."ReasonTreeConfig" DROP CONSTRAINT "ReasonTreeConfig_subCategory_fkey";
       dt          postgres    false    324    326    3862            S           2606    41401 )   ReasonTree ReasonTree_processSegment_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ReasonTree"
    ADD CONSTRAINT "ReasonTree_processSegment_fkey" FOREIGN KEY ("processSegment") REFERENCES dt."ProcessSegment"(id) ON DELETE SET NULL;
 S   ALTER TABLE ONLY dt."ReasonTree" DROP CONSTRAINT "ReasonTree_processSegment_fkey";
       dt          postgres    false    315    325    3844            T           2606    41406 '   ReasonTree ReasonTree_stateMachine_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ReasonTree"
    ADD CONSTRAINT "ReasonTree_stateMachine_fkey" FOREIGN KEY ("stateMachine") REFERENCES dt."StateMachineDefinition"(id) ON DELETE SET NULL;
 Q   ALTER TABLE ONLY dt."ReasonTree" DROP CONSTRAINT "ReasonTree_stateMachine_fkey";
       dt          postgres    false    325    341    3896            O           2606    41411    Reason Reason_subCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."Reason"
    ADD CONSTRAINT "Reason_subCategory_fkey" FOREIGN KEY ("subCategory") REFERENCES dt."ReasonSubCategory"(id) ON DELETE SET NULL;
 H   ALTER TABLE ONLY dt."Reason" DROP CONSTRAINT "Reason_subCategory_fkey";
       dt          postgres    false    321    324    3862            ]           2606    41416 a   ResourceNetworkConnectionProperty ResourceNetworkConnectionPropert_resourceNetworkConnection_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ResourceNetworkConnectionProperty"
    ADD CONSTRAINT "ResourceNetworkConnectionPropert_resourceNetworkConnection_fkey" FOREIGN KEY ("resourceNetworkConnection") REFERENCES dt."ResourceNetworkConnection"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."ResourceNetworkConnectionProperty" DROP CONSTRAINT "ResourceNetworkConnectionPropert_resourceNetworkConnection_fkey";
       dt          postgres    false    3868    328    327            ^           2606    41421 Q   ResourceNetworkConnectionProperty ResourceNetworkConnectionProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ResourceNetworkConnectionProperty"
    ADD CONSTRAINT "ResourceNetworkConnectionProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 {   ALTER TABLE ONLY dt."ResourceNetworkConnectionProperty" DROP CONSTRAINT "ResourceNetworkConnectionProperty_category_fkey";
       dt          postgres    false    243    328    3700            _           2606    41426 O   ResourceNetworkConnectionProperty ResourceNetworkConnectionProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ResourceNetworkConnectionProperty"
    ADD CONSTRAINT "ResourceNetworkConnectionProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."ResourceNetworkConnectionProperty"(id) ON DELETE SET NULL;
 y   ALTER TABLE ONLY dt."ResourceNetworkConnectionProperty" DROP CONSTRAINT "ResourceNetworkConnectionProperty_parent_fkey";
       dt          postgres    false    328    328    3870            `           2606    41431 U   ResourceNetworkConnectionProperty ResourceNetworkConnectionProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ResourceNetworkConnectionProperty"
    ADD CONSTRAINT "ResourceNetworkConnectionProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
    ALTER TABLE ONLY dt."ResourceNetworkConnectionProperty" DROP CONSTRAINT "ResourceNetworkConnectionProperty_propertyType_fkey";
       dt          postgres    false    320    328    3854            a           2606    41436 S   ResourceNetworkConnectionProperty ResourceNetworkConnectionProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ResourceNetworkConnectionProperty"
    ADD CONSTRAINT "ResourceNetworkConnectionProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 }   ALTER TABLE ONLY dt."ResourceNetworkConnectionProperty" DROP CONSTRAINT "ResourceNetworkConnectionProperty_sensorType_fkey";
       dt          postgres    false    216    328    3643            b           2606    41441 O   ResourceNetworkConnectionProperty ResourceNetworkConnectionProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ResourceNetworkConnectionProperty"
    ADD CONSTRAINT "ResourceNetworkConnectionProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 y   ALTER TABLE ONLY dt."ResourceNetworkConnectionProperty" DROP CONSTRAINT "ResourceNetworkConnectionProperty_sensor_fkey";
       dt          postgres    false    210    328    3631            c           2606    41446 T   ResourceNetworkConnectionProperty ResourceNetworkConnectionProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ResourceNetworkConnectionProperty"
    ADD CONSTRAINT "ResourceNetworkConnectionProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 ~   ALTER TABLE ONLY dt."ResourceNetworkConnectionProperty" DROP CONSTRAINT "ResourceNetworkConnectionProperty_uomCategory_fkey";
       dt          postgres    false    3910    348    328            d           2606    41451 Q   ResourceNetworkConnectionProperty ResourceNetworkConnectionProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ResourceNetworkConnectionProperty"
    ADD CONSTRAINT "ResourceNetworkConnectionProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 {   ALTER TABLE ONLY dt."ResourceNetworkConnectionProperty" DROP CONSTRAINT "ResourceNetworkConnectionProperty_valueUom_fkey";
       dt          postgres    false    328    347    3908            e           2606    41456 Y   ResourceNetworkConnectionTypeProperty ResourceNetworkConnectionTypeProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ResourceNetworkConnectionTypeProperty"
    ADD CONSTRAINT "ResourceNetworkConnectionTypeProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."ResourceNetworkConnectionTypeProperty" DROP CONSTRAINT "ResourceNetworkConnectionTypeProperty_category_fkey";
       dt          postgres    false    330    243    3700            f           2606    41461 W   ResourceNetworkConnectionTypeProperty ResourceNetworkConnectionTypeProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ResourceNetworkConnectionTypeProperty"
    ADD CONSTRAINT "ResourceNetworkConnectionTypeProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."ResourceNetworkConnectionTypeProperty"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."ResourceNetworkConnectionTypeProperty" DROP CONSTRAINT "ResourceNetworkConnectionTypeProperty_parent_fkey";
       dt          postgres    false    3874    330    330            g           2606    41466 ]   ResourceNetworkConnectionTypeProperty ResourceNetworkConnectionTypeProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ResourceNetworkConnectionTypeProperty"
    ADD CONSTRAINT "ResourceNetworkConnectionTypeProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."ResourceNetworkConnectionTypeProperty" DROP CONSTRAINT "ResourceNetworkConnectionTypeProperty_propertyType_fkey";
       dt          postgres    false    320    330    3854            h           2606    41471 [   ResourceNetworkConnectionTypeProperty ResourceNetworkConnectionTypeProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ResourceNetworkConnectionTypeProperty"
    ADD CONSTRAINT "ResourceNetworkConnectionTypeProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."ResourceNetworkConnectionTypeProperty" DROP CONSTRAINT "ResourceNetworkConnectionTypeProperty_sensorType_fkey";
       dt          postgres    false    216    330    3643            i           2606    41476 W   ResourceNetworkConnectionTypeProperty ResourceNetworkConnectionTypeProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ResourceNetworkConnectionTypeProperty"
    ADD CONSTRAINT "ResourceNetworkConnectionTypeProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."ResourceNetworkConnectionTypeProperty" DROP CONSTRAINT "ResourceNetworkConnectionTypeProperty_sensor_fkey";
       dt          postgres    false    210    330    3631            j           2606    41481 \   ResourceNetworkConnectionTypeProperty ResourceNetworkConnectionTypeProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ResourceNetworkConnectionTypeProperty"
    ADD CONSTRAINT "ResourceNetworkConnectionTypeProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."ResourceNetworkConnectionTypeProperty" DROP CONSTRAINT "ResourceNetworkConnectionTypeProperty_uomCategory_fkey";
       dt          postgres    false    348    330    3910            k           2606    41486 Y   ResourceNetworkConnectionTypeProperty ResourceNetworkConnectionTypeProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ResourceNetworkConnectionTypeProperty"
    ADD CONSTRAINT "ResourceNetworkConnectionTypeProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."ResourceNetworkConnectionTypeProperty" DROP CONSTRAINT "ResourceNetworkConnectionTypeProperty_valueUom_fkey";
       dt          postgres    false    347    330    3908            l           2606    41491 e   ResourceNetworkConnectionTypeProperty ResourceNetworkConnectionType_resourceNetworkConnectionTyp_fkey    FK CONSTRAINT       ALTER TABLE ONLY dt."ResourceNetworkConnectionTypeProperty"
    ADD CONSTRAINT "ResourceNetworkConnectionType_resourceNetworkConnectionTyp_fkey" FOREIGN KEY ("resourceNetworkConnectionType") REFERENCES dt."ResourceNetworkConnectionType"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."ResourceNetworkConnectionTypeProperty" DROP CONSTRAINT "ResourceNetworkConnectionType_resourceNetworkConnectionTyp_fkey";
       dt          postgres    false    329    330    3872            [           2606    41496 V   ResourceNetworkConnection ResourceNetworkConnection_resourceNetworkConnectionType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ResourceNetworkConnection"
    ADD CONSTRAINT "ResourceNetworkConnection_resourceNetworkConnectionType_fkey" FOREIGN KEY ("resourceNetworkConnectionType") REFERENCES dt."ResourceNetworkConnectionType"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."ResourceNetworkConnection" DROP CONSTRAINT "ResourceNetworkConnection_resourceNetworkConnectionType_fkey";
       dt          postgres    false    329    327    3872            \           2606    41501 T   ResourceNetworkConnection ResourceNetworkConnection_resourceRelationshipNetwork_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ResourceNetworkConnection"
    ADD CONSTRAINT "ResourceNetworkConnection_resourceRelationshipNetwork_fkey" FOREIGN KEY ("resourceRelationshipNetwork") REFERENCES dt."ResourceRelationshipNetwork"(id) ON DELETE SET NULL;
 ~   ALTER TABLE ONLY dt."ResourceNetworkConnection" DROP CONSTRAINT "ResourceNetworkConnection_resourceRelationshipNetwork_fkey";
       dt          postgres    false    331    327    3876            m           2606    41506 M   ResourceRelationshipNetwork ResourceRelationshipNetwork_relationshipForm_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ResourceRelationshipNetwork"
    ADD CONSTRAINT "ResourceRelationshipNetwork_relationshipForm_fkey" FOREIGN KEY ("relationshipForm") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 w   ALTER TABLE ONLY dt."ResourceRelationshipNetwork" DROP CONSTRAINT "ResourceRelationshipNetwork_relationshipForm_fkey";
       dt          postgres    false    331    243    3700            n           2606    41511 M   ResourceRelationshipNetwork ResourceRelationshipNetwork_relationshipType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ResourceRelationshipNetwork"
    ADD CONSTRAINT "ResourceRelationshipNetwork_relationshipType_fkey" FOREIGN KEY ("relationshipType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 w   ALTER TABLE ONLY dt."ResourceRelationshipNetwork" DROP CONSTRAINT "ResourceRelationshipNetwork_relationshipType_fkey";
       dt          postgres    false    243    331    3700            o           2606    41516 %   SegmentData SegmentData_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."SegmentData"
    ADD CONSTRAINT "SegmentData_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 O   ALTER TABLE ONLY dt."SegmentData" DROP CONSTRAINT "SegmentData_category_fkey";
       dt          postgres    false    243    332    3700            p           2606    41521 #   SegmentData SegmentData_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."SegmentData"
    ADD CONSTRAINT "SegmentData_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."SegmentData"(id) ON DELETE SET NULL;
 M   ALTER TABLE ONLY dt."SegmentData" DROP CONSTRAINT "SegmentData_parent_fkey";
       dt          postgres    false    332    332    3878            q           2606    41526 )   SegmentData SegmentData_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."SegmentData"
    ADD CONSTRAINT "SegmentData_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 S   ALTER TABLE ONLY dt."SegmentData" DROP CONSTRAINT "SegmentData_propertyType_fkey";
       dt          postgres    false    332    320    3854            r           2606    41531 ,   SegmentData SegmentData_segmentResponse_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."SegmentData"
    ADD CONSTRAINT "SegmentData_segmentResponse_fkey" FOREIGN KEY ("segmentResponse") REFERENCES dt."SegmentResponse"(id) ON DELETE SET NULL;
 V   ALTER TABLE ONLY dt."SegmentData" DROP CONSTRAINT "SegmentData_segmentResponse_fkey";
       dt          postgres    false    335    3884    332            s           2606    41536 '   SegmentData SegmentData_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."SegmentData"
    ADD CONSTRAINT "SegmentData_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 Q   ALTER TABLE ONLY dt."SegmentData" DROP CONSTRAINT "SegmentData_sensorType_fkey";
       dt          postgres    false    3643    216    332            t           2606    41541 #   SegmentData SegmentData_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."SegmentData"
    ADD CONSTRAINT "SegmentData_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 M   ALTER TABLE ONLY dt."SegmentData" DROP CONSTRAINT "SegmentData_sensor_fkey";
       dt          postgres    false    210    3631    332            u           2606    41546 (   SegmentData SegmentData_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."SegmentData"
    ADD CONSTRAINT "SegmentData_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY dt."SegmentData" DROP CONSTRAINT "SegmentData_uomCategory_fkey";
       dt          postgres    false    3910    348    332            v           2606    41551 %   SegmentData SegmentData_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."SegmentData"
    ADD CONSTRAINT "SegmentData_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 O   ALTER TABLE ONLY dt."SegmentData" DROP CONSTRAINT "SegmentData_valueUom_fkey";
       dt          postgres    false    332    3908    347            w           2606    41556 /   SegmentParameter SegmentParameter_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."SegmentParameter"
    ADD CONSTRAINT "SegmentParameter_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 Y   ALTER TABLE ONLY dt."SegmentParameter" DROP CONSTRAINT "SegmentParameter_category_fkey";
       dt          postgres    false    3700    243    333            x           2606    41561 1   SegmentParameter SegmentParameter_logRateUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."SegmentParameter"
    ADD CONSTRAINT "SegmentParameter_logRateUom_fkey" FOREIGN KEY ("logRateUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 [   ALTER TABLE ONLY dt."SegmentParameter" DROP CONSTRAINT "SegmentParameter_logRateUom_fkey";
       dt          postgres    false    3908    347    333            y           2606    41566 -   SegmentParameter SegmentParameter_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."SegmentParameter"
    ADD CONSTRAINT "SegmentParameter_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."SegmentParameter"(id) ON DELETE SET NULL;
 W   ALTER TABLE ONLY dt."SegmentParameter" DROP CONSTRAINT "SegmentParameter_parent_fkey";
       dt          postgres    false    333    3880    333            z           2606    41571 3   SegmentParameter SegmentParameter_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."SegmentParameter"
    ADD CONSTRAINT "SegmentParameter_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 ]   ALTER TABLE ONLY dt."SegmentParameter" DROP CONSTRAINT "SegmentParameter_propertyType_fkey";
       dt          postgres    false    333    3854    320            {           2606    41576 9   SegmentParameter SegmentParameter_segmentRequirement_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."SegmentParameter"
    ADD CONSTRAINT "SegmentParameter_segmentRequirement_fkey" FOREIGN KEY ("segmentRequirement") REFERENCES dt."SegmentRequirement"(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY dt."SegmentParameter" DROP CONSTRAINT "SegmentParameter_segmentRequirement_fkey";
       dt          postgres    false    3882    334    333            |           2606    41581 1   SegmentParameter SegmentParameter_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."SegmentParameter"
    ADD CONSTRAINT "SegmentParameter_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 [   ALTER TABLE ONLY dt."SegmentParameter" DROP CONSTRAINT "SegmentParameter_sensorType_fkey";
       dt          postgres    false    216    3643    333            }           2606    41586 -   SegmentParameter SegmentParameter_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."SegmentParameter"
    ADD CONSTRAINT "SegmentParameter_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 W   ALTER TABLE ONLY dt."SegmentParameter" DROP CONSTRAINT "SegmentParameter_sensor_fkey";
       dt          postgres    false    3631    333    210            ~           2606    41591 2   SegmentParameter SegmentParameter_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."SegmentParameter"
    ADD CONSTRAINT "SegmentParameter_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 \   ALTER TABLE ONLY dt."SegmentParameter" DROP CONSTRAINT "SegmentParameter_uomCategory_fkey";
       dt          postgres    false    3910    333    348                       2606    41596 /   SegmentParameter SegmentParameter_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."SegmentParameter"
    ADD CONSTRAINT "SegmentParameter_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 Y   ALTER TABLE ONLY dt."SegmentParameter" DROP CONSTRAINT "SegmentParameter_valueUom_fkey";
       dt          postgres    false    333    347    3908            �           2606    41601 6   SegmentRequirement SegmentRequirement_durationUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."SegmentRequirement"
    ADD CONSTRAINT "SegmentRequirement_durationUom_fkey" FOREIGN KEY ("durationUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 `   ALTER TABLE ONLY dt."SegmentRequirement" DROP CONSTRAINT "SegmentRequirement_durationUom_fkey";
       dt          postgres    false    334    347    3908            �           2606    41606 9   SegmentRequirement SegmentRequirement_hierarchyScope_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."SegmentRequirement"
    ADD CONSTRAINT "SegmentRequirement_hierarchyScope_fkey" FOREIGN KEY ("hierarchyScope") REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY dt."SegmentRequirement" DROP CONSTRAINT "SegmentRequirement_hierarchyScope_fkey";
       dt          postgres    false    334    210    3631            �           2606    41611 ?   SegmentRequirement SegmentRequirement_operationsDefinition_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."SegmentRequirement"
    ADD CONSTRAINT "SegmentRequirement_operationsDefinition_fkey" FOREIGN KEY ("operationsDefinition") REFERENCES dt."OperationsDefinition"(id) ON DELETE SET NULL;
 i   ALTER TABLE ONLY dt."SegmentRequirement" DROP CONSTRAINT "SegmentRequirement_operationsDefinition_fkey";
       dt          postgres    false    3754    334    270            �           2606    41616 <   SegmentRequirement SegmentRequirement_operationsRequest_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."SegmentRequirement"
    ADD CONSTRAINT "SegmentRequirement_operationsRequest_fkey" FOREIGN KEY ("operationsRequest") REFERENCES dt."OperationsRequest"(id) ON DELETE SET NULL;
 f   ALTER TABLE ONLY dt."SegmentRequirement" DROP CONSTRAINT "SegmentRequirement_operationsRequest_fkey";
       dt          postgres    false    276    334    3766            �           2606    41621 <   SegmentRequirement SegmentRequirement_operationsSegment_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."SegmentRequirement"
    ADD CONSTRAINT "SegmentRequirement_operationsSegment_fkey" FOREIGN KEY ("operationsSegment") REFERENCES dt."OperationsSegment"(id) ON DELETE SET NULL;
 f   ALTER TABLE ONLY dt."SegmentRequirement" DROP CONSTRAINT "SegmentRequirement_operationsSegment_fkey";
       dt          postgres    false    3778    282    334            �           2606    41626 9   SegmentRequirement SegmentRequirement_operationsType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."SegmentRequirement"
    ADD CONSTRAINT "SegmentRequirement_operationsType_fkey" FOREIGN KEY ("operationsType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY dt."SegmentRequirement" DROP CONSTRAINT "SegmentRequirement_operationsType_fkey";
       dt          postgres    false    243    334    3700            �           2606    41631 =   SegmentRequirement SegmentRequirement_orderRequestStatus_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."SegmentRequirement"
    ADD CONSTRAINT "SegmentRequirement_orderRequestStatus_fkey" FOREIGN KEY ("orderRequestStatus") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 g   ALTER TABLE ONLY dt."SegmentRequirement" DROP CONSTRAINT "SegmentRequirement_orderRequestStatus_fkey";
       dt          postgres    false    334    3700    243            �           2606    41636 1   SegmentRequirement SegmentRequirement_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."SegmentRequirement"
    ADD CONSTRAINT "SegmentRequirement_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."SegmentRequirement"(id) ON DELETE SET NULL;
 [   ALTER TABLE ONLY dt."SegmentRequirement" DROP CONSTRAINT "SegmentRequirement_parent_fkey";
       dt          postgres    false    334    334    3882            �           2606    41641 9   SegmentRequirement SegmentRequirement_processSegment_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."SegmentRequirement"
    ADD CONSTRAINT "SegmentRequirement_processSegment_fkey" FOREIGN KEY ("processSegment") REFERENCES dt."ProcessSegment"(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY dt."SegmentRequirement" DROP CONSTRAINT "SegmentRequirement_processSegment_fkey";
       dt          postgres    false    315    334    3844            �           2606    41646 3   SegmentResponse SegmentResponse_hierarchyScope_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."SegmentResponse"
    ADD CONSTRAINT "SegmentResponse_hierarchyScope_fkey" FOREIGN KEY ("hierarchyScope") REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 ]   ALTER TABLE ONLY dt."SegmentResponse" DROP CONSTRAINT "SegmentResponse_hierarchyScope_fkey";
       dt          postgres    false    210    335    3631            �           2606    41651 9   SegmentResponse SegmentResponse_operationsDefinition_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."SegmentResponse"
    ADD CONSTRAINT "SegmentResponse_operationsDefinition_fkey" FOREIGN KEY ("operationsDefinition") REFERENCES dt."OperationsDefinition"(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY dt."SegmentResponse" DROP CONSTRAINT "SegmentResponse_operationsDefinition_fkey";
       dt          postgres    false    3754    270    335            �           2606    41656 7   SegmentResponse SegmentResponse_operationsResponse_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."SegmentResponse"
    ADD CONSTRAINT "SegmentResponse_operationsResponse_fkey" FOREIGN KEY ("operationsResponse") REFERENCES dt."OperationsResponse"(id) ON DELETE SET NULL;
 a   ALTER TABLE ONLY dt."SegmentResponse" DROP CONSTRAINT "SegmentResponse_operationsResponse_fkey";
       dt          postgres    false    3770    278    335            �           2606    41661 6   SegmentResponse SegmentResponse_operationsSegment_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."SegmentResponse"
    ADD CONSTRAINT "SegmentResponse_operationsSegment_fkey" FOREIGN KEY ("operationsSegment") REFERENCES dt."OperationsSegment"(id) ON DELETE SET NULL;
 `   ALTER TABLE ONLY dt."SegmentResponse" DROP CONSTRAINT "SegmentResponse_operationsSegment_fkey";
       dt          postgres    false    282    335    3778            �           2606    41666 3   SegmentResponse SegmentResponse_operationsType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."SegmentResponse"
    ADD CONSTRAINT "SegmentResponse_operationsType_fkey" FOREIGN KEY ("operationsType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 ]   ALTER TABLE ONLY dt."SegmentResponse" DROP CONSTRAINT "SegmentResponse_operationsType_fkey";
       dt          postgres    false    335    243    3700            �           2606    41671 +   SegmentResponse SegmentResponse_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."SegmentResponse"
    ADD CONSTRAINT "SegmentResponse_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."SegmentResponse"(id) ON DELETE SET NULL;
 U   ALTER TABLE ONLY dt."SegmentResponse" DROP CONSTRAINT "SegmentResponse_parent_fkey";
       dt          postgres    false    335    335    3884            �           2606    41676 3   SegmentResponse SegmentResponse_processSegment_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."SegmentResponse"
    ADD CONSTRAINT "SegmentResponse_processSegment_fkey" FOREIGN KEY ("processSegment") REFERENCES dt."ProcessSegment"(id) ON DELETE SET NULL;
 ]   ALTER TABLE ONLY dt."SegmentResponse" DROP CONSTRAINT "SegmentResponse_processSegment_fkey";
       dt          postgres    false    315    335    3844            �           2606    41681 3   SegmentResponse SegmentResponse_responseStatus_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."SegmentResponse"
    ADD CONSTRAINT "SegmentResponse_responseStatus_fkey" FOREIGN KEY ("responseStatus") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 ]   ALTER TABLE ONLY dt."SegmentResponse" DROP CONSTRAINT "SegmentResponse_responseStatus_fkey";
       dt          postgres    false    243    335    3700            �           2606    41686 7   SegmentResponse SegmentResponse_segmentRequirement_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."SegmentResponse"
    ADD CONSTRAINT "SegmentResponse_segmentRequirement_fkey" FOREIGN KEY ("segmentRequirement") REFERENCES dt."SegmentRequirement"(id) ON DELETE SET NULL;
 a   ALTER TABLE ONLY dt."SegmentResponse" DROP CONSTRAINT "SegmentResponse_segmentRequirement_fkey";
       dt          postgres    false    334    3882    335            �           2606    41691 =   StateDefinitionTransition StateDefinitionTransition_from_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."StateDefinitionTransition"
    ADD CONSTRAINT "StateDefinitionTransition_from_fkey" FOREIGN KEY ("from") REFERENCES dt."StateDefinition"(id) ON DELETE SET NULL;
 g   ALTER TABLE ONLY dt."StateDefinitionTransition" DROP CONSTRAINT "StateDefinitionTransition_from_fkey";
       dt          postgres    false    337    3888    338            �           2606    41696 O   StateDefinitionTransition StateDefinitionTransition_stateMachineDefinition_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."StateDefinitionTransition"
    ADD CONSTRAINT "StateDefinitionTransition_stateMachineDefinition_fkey" FOREIGN KEY ("stateMachineDefinition") REFERENCES dt."StateMachineDefinition"(id) ON DELETE SET NULL;
 y   ALTER TABLE ONLY dt."StateDefinitionTransition" DROP CONSTRAINT "StateDefinitionTransition_stateMachineDefinition_fkey";
       dt          postgres    false    341    3896    338            �           2606    41701 ;   StateDefinitionTransition StateDefinitionTransition_to_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."StateDefinitionTransition"
    ADD CONSTRAINT "StateDefinitionTransition_to_fkey" FOREIGN KEY ("to") REFERENCES dt."StateDefinition"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."StateDefinitionTransition" DROP CONSTRAINT "StateDefinitionTransition_to_fkey";
       dt          postgres    false    3888    338    337            �           2606    41706 0   StateDefinition StateDefinition_criticality_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."StateDefinition"
    ADD CONSTRAINT "StateDefinition_criticality_fkey" FOREIGN KEY (criticality) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 Z   ALTER TABLE ONLY dt."StateDefinition" DROP CONSTRAINT "StateDefinition_criticality_fkey";
       dt          postgres    false    243    3700    337            �           2606    41711 +   StateDefinition StateDefinition_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."StateDefinition"
    ADD CONSTRAINT "StateDefinition_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."StateDefinition"(id) ON DELETE SET NULL;
 U   ALTER TABLE ONLY dt."StateDefinition" DROP CONSTRAINT "StateDefinition_parent_fkey";
       dt          postgres    false    337    3888    337            �           2606    41716 1   StateDefinition StateDefinition_stateLibrary_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."StateDefinition"
    ADD CONSTRAINT "StateDefinition_stateLibrary_fkey" FOREIGN KEY ("stateLibrary") REFERENCES dt."StateLibrary"(id) ON DELETE SET NULL;
 [   ALTER TABLE ONLY dt."StateDefinition" DROP CONSTRAINT "StateDefinition_stateLibrary_fkey";
       dt          postgres    false    337    339    3892            �           2606    41721 ;   StateDefinition StateDefinition_stateMachineDefinition_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."StateDefinition"
    ADD CONSTRAINT "StateDefinition_stateMachineDefinition_fkey" FOREIGN KEY ("stateMachineDefinition") REFERENCES dt."StateMachineDefinition"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."StateDefinition" DROP CONSTRAINT "StateDefinition_stateMachineDefinition_fkey";
       dt          postgres    false    3896    341    337            �           2606    41726 Q   StateLibraryReasonCategoryMapping StateLibraryReasonCategoryMapping_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."StateLibraryReasonCategoryMapping"
    ADD CONSTRAINT "StateLibraryReasonCategoryMapping_category_fkey" FOREIGN KEY (category) REFERENCES dt."ReasonCategory"(id) ON DELETE CASCADE;
 {   ALTER TABLE ONLY dt."StateLibraryReasonCategoryMapping" DROP CONSTRAINT "StateLibraryReasonCategoryMapping_category_fkey";
       dt          postgres    false    3858    322    340            �           2606    41731 U   StateLibraryReasonCategoryMapping StateLibraryReasonCategoryMapping_stateLibrary_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."StateLibraryReasonCategoryMapping"
    ADD CONSTRAINT "StateLibraryReasonCategoryMapping_stateLibrary_fkey" FOREIGN KEY ("stateLibrary") REFERENCES dt."StateLibrary"(id) ON DELETE CASCADE;
    ALTER TABLE ONLY dt."StateLibraryReasonCategoryMapping" DROP CONSTRAINT "StateLibraryReasonCategoryMapping_stateLibrary_fkey";
       dt          postgres    false    3892    339    340            �           2606    41736 ;   StateMachineDefinition StateMachineDefinition_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."StateMachineDefinition"
    ADD CONSTRAINT "StateMachineDefinition_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."StateMachineDefinition" DROP CONSTRAINT "StateMachineDefinition_category_fkey";
       dt          postgres    false    3700    243    341            �           2606    41741 >   StateObjectMapping StateObjectMapping_prevStateDefinition_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."StateObjectMapping"
    ADD CONSTRAINT "StateObjectMapping_prevStateDefinition_fkey" FOREIGN KEY ("prevStateDefinition") REFERENCES dt."StateDefinition"(id) ON DELETE SET NULL;
 h   ALTER TABLE ONLY dt."StateObjectMapping" DROP CONSTRAINT "StateObjectMapping_prevStateDefinition_fkey";
       dt          postgres    false    342    337    3888            �           2606    41746 :   StateObjectMapping StateObjectMapping_stateDefinition_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."StateObjectMapping"
    ADD CONSTRAINT "StateObjectMapping_stateDefinition_fkey" FOREIGN KEY ("stateDefinition") REFERENCES dt."StateDefinition"(id) ON DELETE SET NULL;
 d   ALTER TABLE ONLY dt."StateObjectMapping" DROP CONSTRAINT "StateObjectMapping_stateDefinition_fkey";
       dt          postgres    false    342    337    3888            �           2606    41751 A   StateObjectMapping StateObjectMapping_stateMachineDefinition_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."StateObjectMapping"
    ADD CONSTRAINT "StateObjectMapping_stateMachineDefinition_fkey" FOREIGN KEY ("stateMachineDefinition") REFERENCES dt."StateMachineDefinition"(id) ON DELETE SET NULL;
 k   ALTER TABLE ONLY dt."StateObjectMapping" DROP CONSTRAINT "StateObjectMapping_stateMachineDefinition_fkey";
       dt          postgres    false    341    342    3896            �           2606    41756 +   StreamProperty StreamProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."StreamProperty"
    ADD CONSTRAINT "StreamProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 U   ALTER TABLE ONLY dt."StreamProperty" DROP CONSTRAINT "StreamProperty_category_fkey";
       dt          postgres    false    243    344    3700            �           2606    41761 )   StreamProperty StreamProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."StreamProperty"
    ADD CONSTRAINT "StreamProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."StreamProperty"(id) ON DELETE SET NULL;
 S   ALTER TABLE ONLY dt."StreamProperty" DROP CONSTRAINT "StreamProperty_parent_fkey";
       dt          postgres    false    344    3902    344            �           2606    41766 /   StreamProperty StreamProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."StreamProperty"
    ADD CONSTRAINT "StreamProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 Y   ALTER TABLE ONLY dt."StreamProperty" DROP CONSTRAINT "StreamProperty_propertyType_fkey";
       dt          postgres    false    3854    320    344            �           2606    41771 -   StreamProperty StreamProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."StreamProperty"
    ADD CONSTRAINT "StreamProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 W   ALTER TABLE ONLY dt."StreamProperty" DROP CONSTRAINT "StreamProperty_sensorType_fkey";
       dt          postgres    false    344    3643    216            �           2606    41776 )   StreamProperty StreamProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."StreamProperty"
    ADD CONSTRAINT "StreamProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 S   ALTER TABLE ONLY dt."StreamProperty" DROP CONSTRAINT "StreamProperty_sensor_fkey";
       dt          postgres    false    344    210    3631            �           2606    41781 )   StreamProperty StreamProperty_stream_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."StreamProperty"
    ADD CONSTRAINT "StreamProperty_stream_fkey" FOREIGN KEY (stream) REFERENCES dt."Stream"(id) ON DELETE SET NULL;
 S   ALTER TABLE ONLY dt."StreamProperty" DROP CONSTRAINT "StreamProperty_stream_fkey";
       dt          postgres    false    343    3900    344            �           2606    41786 .   StreamProperty StreamProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."StreamProperty"
    ADD CONSTRAINT "StreamProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY dt."StreamProperty" DROP CONSTRAINT "StreamProperty_uomCategory_fkey";
       dt          postgres    false    3910    344    348            �           2606    41791 +   StreamProperty StreamProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."StreamProperty"
    ADD CONSTRAINT "StreamProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 U   ALTER TABLE ONLY dt."StreamProperty" DROP CONSTRAINT "StreamProperty_valueUom_fkey";
       dt          postgres    false    347    3908    344            �           2606    41796    Stream Stream_lotHandling_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."Stream"
    ADD CONSTRAINT "Stream_lotHandling_fkey" FOREIGN KEY ("lotHandling") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 H   ALTER TABLE ONLY dt."Stream" DROP CONSTRAINT "Stream_lotHandling_fkey";
       dt          postgres    false    343    243    3700            �           2606    41801    Stream Stream_streamType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."Stream"
    ADD CONSTRAINT "Stream_streamType_fkey" FOREIGN KEY ("streamType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 G   ALTER TABLE ONLY dt."Stream" DROP CONSTRAINT "Stream_streamType_fkey";
       dt          postgres    false    343    3700    243            �           2606    41806 E   ToResourceReferenceProperty ToResourceReferenceProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ToResourceReferenceProperty"
    ADD CONSTRAINT "ToResourceReferenceProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY dt."ToResourceReferenceProperty" DROP CONSTRAINT "ToResourceReferenceProperty_category_fkey";
       dt          postgres    false    3700    243    346            �           2606    41811 C   ToResourceReferenceProperty ToResourceReferenceProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ToResourceReferenceProperty"
    ADD CONSTRAINT "ToResourceReferenceProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."ToResourceReferenceProperty"(id) ON DELETE SET NULL;
 m   ALTER TABLE ONLY dt."ToResourceReferenceProperty" DROP CONSTRAINT "ToResourceReferenceProperty_parent_fkey";
       dt          postgres    false    346    3906    346            �           2606    41816 I   ToResourceReferenceProperty ToResourceReferenceProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ToResourceReferenceProperty"
    ADD CONSTRAINT "ToResourceReferenceProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 s   ALTER TABLE ONLY dt."ToResourceReferenceProperty" DROP CONSTRAINT "ToResourceReferenceProperty_propertyType_fkey";
       dt          postgres    false    346    3854    320            �           2606    41821 G   ToResourceReferenceProperty ToResourceReferenceProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ToResourceReferenceProperty"
    ADD CONSTRAINT "ToResourceReferenceProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 q   ALTER TABLE ONLY dt."ToResourceReferenceProperty" DROP CONSTRAINT "ToResourceReferenceProperty_sensorType_fkey";
       dt          postgres    false    346    3643    216            �           2606    41826 C   ToResourceReferenceProperty ToResourceReferenceProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ToResourceReferenceProperty"
    ADD CONSTRAINT "ToResourceReferenceProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 m   ALTER TABLE ONLY dt."ToResourceReferenceProperty" DROP CONSTRAINT "ToResourceReferenceProperty_sensor_fkey";
       dt          postgres    false    210    3631    346            �           2606    41831 P   ToResourceReferenceProperty ToResourceReferenceProperty_toResourceReference_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ToResourceReferenceProperty"
    ADD CONSTRAINT "ToResourceReferenceProperty_toResourceReference_fkey" FOREIGN KEY ("toResourceReference") REFERENCES dt."ToResourceReference"(id) ON DELETE SET NULL;
 z   ALTER TABLE ONLY dt."ToResourceReferenceProperty" DROP CONSTRAINT "ToResourceReferenceProperty_toResourceReference_fkey";
       dt          postgres    false    3904    346    345            �           2606    41836 H   ToResourceReferenceProperty ToResourceReferenceProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ToResourceReferenceProperty"
    ADD CONSTRAINT "ToResourceReferenceProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 r   ALTER TABLE ONLY dt."ToResourceReferenceProperty" DROP CONSTRAINT "ToResourceReferenceProperty_uomCategory_fkey";
       dt          postgres    false    3910    348    346            �           2606    41841 E   ToResourceReferenceProperty ToResourceReferenceProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ToResourceReferenceProperty"
    ADD CONSTRAINT "ToResourceReferenceProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY dt."ToResourceReferenceProperty" DROP CONSTRAINT "ToResourceReferenceProperty_valueUom_fkey";
       dt          postgres    false    3908    346    347            �           2606    41846 F   ToResourceReference ToResourceReference_resourceNetworkConnection_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ToResourceReference"
    ADD CONSTRAINT "ToResourceReference_resourceNetworkConnection_fkey" FOREIGN KEY ("resourceNetworkConnection") REFERENCES dt."ResourceNetworkConnection"(id) ON DELETE SET NULL;
 p   ALTER TABLE ONLY dt."ToResourceReference" DROP CONSTRAINT "ToResourceReference_resourceNetworkConnection_fkey";
       dt          postgres    false    327    345    3868            �           2606    41851 9   ToResourceReference ToResourceReference_resourceType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."ToResourceReference"
    ADD CONSTRAINT "ToResourceReference_resourceType_fkey" FOREIGN KEY ("resourceType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY dt."ToResourceReference" DROP CONSTRAINT "ToResourceReference_resourceType_fkey";
       dt          postgres    false    3700    243    345            �           2606    41856    Uom Uom_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."Uom"
    ADD CONSTRAINT "Uom_category_fkey" FOREIGN KEY (category) REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 ?   ALTER TABLE ONLY dt."Uom" DROP CONSTRAINT "Uom_category_fkey";
       dt          postgres    false    347    348    3910            �           2606    41861 c   WorkCalendarDefinitionEntryProperty WorkCalendarDefinitionEntryPro_workCalendarDefinitionEntry_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarDefinitionEntryProperty"
    ADD CONSTRAINT "WorkCalendarDefinitionEntryPro_workCalendarDefinitionEntry_fkey" FOREIGN KEY ("workCalendarDefinitionEntry") REFERENCES dt."WorkCalendarDefinitionEntry"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."WorkCalendarDefinitionEntryProperty" DROP CONSTRAINT "WorkCalendarDefinitionEntryPro_workCalendarDefinitionEntry_fkey";
       dt          postgres    false    352    3916    351            �           2606    41866 U   WorkCalendarDefinitionEntryProperty WorkCalendarDefinitionEntryProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarDefinitionEntryProperty"
    ADD CONSTRAINT "WorkCalendarDefinitionEntryProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
    ALTER TABLE ONLY dt."WorkCalendarDefinitionEntryProperty" DROP CONSTRAINT "WorkCalendarDefinitionEntryProperty_category_fkey";
       dt          postgres    false    243    3700    352            �           2606    41871 S   WorkCalendarDefinitionEntryProperty WorkCalendarDefinitionEntryProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarDefinitionEntryProperty"
    ADD CONSTRAINT "WorkCalendarDefinitionEntryProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."WorkCalendarDefinitionEntryProperty"(id) ON DELETE SET NULL;
 }   ALTER TABLE ONLY dt."WorkCalendarDefinitionEntryProperty" DROP CONSTRAINT "WorkCalendarDefinitionEntryProperty_parent_fkey";
       dt          postgres    false    352    352    3918            �           2606    41876 Y   WorkCalendarDefinitionEntryProperty WorkCalendarDefinitionEntryProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarDefinitionEntryProperty"
    ADD CONSTRAINT "WorkCalendarDefinitionEntryProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."WorkCalendarDefinitionEntryProperty" DROP CONSTRAINT "WorkCalendarDefinitionEntryProperty_propertyType_fkey";
       dt          postgres    false    352    3854    320            �           2606    41881 W   WorkCalendarDefinitionEntryProperty WorkCalendarDefinitionEntryProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarDefinitionEntryProperty"
    ADD CONSTRAINT "WorkCalendarDefinitionEntryProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."WorkCalendarDefinitionEntryProperty" DROP CONSTRAINT "WorkCalendarDefinitionEntryProperty_sensorType_fkey";
       dt          postgres    false    352    216    3643            �           2606    41886 S   WorkCalendarDefinitionEntryProperty WorkCalendarDefinitionEntryProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarDefinitionEntryProperty"
    ADD CONSTRAINT "WorkCalendarDefinitionEntryProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 }   ALTER TABLE ONLY dt."WorkCalendarDefinitionEntryProperty" DROP CONSTRAINT "WorkCalendarDefinitionEntryProperty_sensor_fkey";
       dt          postgres    false    352    3631    210            �           2606    41891 X   WorkCalendarDefinitionEntryProperty WorkCalendarDefinitionEntryProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarDefinitionEntryProperty"
    ADD CONSTRAINT "WorkCalendarDefinitionEntryProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."WorkCalendarDefinitionEntryProperty" DROP CONSTRAINT "WorkCalendarDefinitionEntryProperty_uomCategory_fkey";
       dt          postgres    false    3910    348    352            �           2606    41896 U   WorkCalendarDefinitionEntryProperty WorkCalendarDefinitionEntryProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarDefinitionEntryProperty"
    ADD CONSTRAINT "WorkCalendarDefinitionEntryProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
    ALTER TABLE ONLY dt."WorkCalendarDefinitionEntryProperty" DROP CONSTRAINT "WorkCalendarDefinitionEntryProperty_valueUom_fkey";
       dt          postgres    false    352    3908    347            �           2606    41901 @   WorkCalendarDefinitionEntry WorkCalendarDefinitionEntry_day_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarDefinitionEntry"
    ADD CONSTRAINT "WorkCalendarDefinitionEntry_day_fkey" FOREIGN KEY (day) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 j   ALTER TABLE ONLY dt."WorkCalendarDefinitionEntry" DROP CONSTRAINT "WorkCalendarDefinitionEntry_day_fkey";
       dt          postgres    false    243    351    3700            �           2606    41906 F   WorkCalendarDefinitionEntry WorkCalendarDefinitionEntry_entryType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarDefinitionEntry"
    ADD CONSTRAINT "WorkCalendarDefinitionEntry_entryType_fkey" FOREIGN KEY ("entryType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 p   ALTER TABLE ONLY dt."WorkCalendarDefinitionEntry" DROP CONSTRAINT "WorkCalendarDefinitionEntry_entryType_fkey";
       dt          postgres    false    3700    351    243            �           2606    41911 C   WorkCalendarDefinitionEntry WorkCalendarDefinitionEntry_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarDefinitionEntry"
    ADD CONSTRAINT "WorkCalendarDefinitionEntry_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."WorkCalendarDefinitionEntry"(id) ON DELETE SET NULL;
 m   ALTER TABLE ONLY dt."WorkCalendarDefinitionEntry" DROP CONSTRAINT "WorkCalendarDefinitionEntry_parent_fkey";
       dt          postgres    false    351    3916    351            �           2606    41916 I   WorkCalendarDefinitionEntry WorkCalendarDefinitionEntry_patternEntry_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarDefinitionEntry"
    ADD CONSTRAINT "WorkCalendarDefinitionEntry_patternEntry_fkey" FOREIGN KEY ("patternEntry") REFERENCES dt."CalendarPatternEntry"(id) ON DELETE SET NULL;
 s   ALTER TABLE ONLY dt."WorkCalendarDefinitionEntry" DROP CONSTRAINT "WorkCalendarDefinitionEntry_patternEntry_fkey";
       dt          postgres    false    351    3621    205            �           2606    41921 D   WorkCalendarDefinitionEntry WorkCalendarDefinitionEntry_pattern_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarDefinitionEntry"
    ADD CONSTRAINT "WorkCalendarDefinitionEntry_pattern_fkey" FOREIGN KEY (pattern) REFERENCES dt."CalendarPattern"(id) ON DELETE SET NULL;
 n   ALTER TABLE ONLY dt."WorkCalendarDefinitionEntry" DROP CONSTRAINT "WorkCalendarDefinitionEntry_pattern_fkey";
       dt          postgres    false    204    3619    351            �           2606    41926 S   WorkCalendarDefinitionEntry WorkCalendarDefinitionEntry_workCalendarDefinition_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarDefinitionEntry"
    ADD CONSTRAINT "WorkCalendarDefinitionEntry_workCalendarDefinition_fkey" FOREIGN KEY ("workCalendarDefinition") REFERENCES dt."WorkCalendarDefinition"(id) ON DELETE SET NULL;
 }   ALTER TABLE ONLY dt."WorkCalendarDefinitionEntry" DROP CONSTRAINT "WorkCalendarDefinitionEntry_workCalendarDefinition_fkey";
       dt          postgres    false    351    3914    350            �           2606    41931 a   WorkCalendarDefinitionGroupMapping WorkCalendarDefinitionGroupMapping_workCalendarDefinition_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarDefinitionGroupMapping"
    ADD CONSTRAINT "WorkCalendarDefinitionGroupMapping_workCalendarDefinition_fkey" FOREIGN KEY ("workCalendarDefinition") REFERENCES dt."WorkCalendarDefinition"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."WorkCalendarDefinitionGroupMapping" DROP CONSTRAINT "WorkCalendarDefinitionGroupMapping_workCalendarDefinition_fkey";
       dt          postgres    false    354    350    3914            �           2606    41936 \   WorkCalendarDefinitionGroupMapping WorkCalendarDefinitionGroupMapping_workCalendarGroup_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarDefinitionGroupMapping"
    ADD CONSTRAINT "WorkCalendarDefinitionGroupMapping_workCalendarGroup_fkey" FOREIGN KEY ("workCalendarGroup") REFERENCES dt."WorkCalendarDefinitionGroup"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."WorkCalendarDefinitionGroupMapping" DROP CONSTRAINT "WorkCalendarDefinitionGroupMapping_workCalendarGroup_fkey";
       dt          postgres    false    354    3920    353            �           2606    41941 c   WorkCalendarDefinitionObjectMapping WorkCalendarDefinitionObjectMapping_workCalendarDefinition_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarDefinitionObjectMapping"
    ADD CONSTRAINT "WorkCalendarDefinitionObjectMapping_workCalendarDefinition_fkey" FOREIGN KEY ("workCalendarDefinition") REFERENCES dt."WorkCalendarDefinition"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."WorkCalendarDefinitionObjectMapping" DROP CONSTRAINT "WorkCalendarDefinitionObjectMapping_workCalendarDefinition_fkey";
       dt          postgres    false    355    350    3914            �           2606    41946 `   WorkCalendarDefinitionOverruling WorkCalendarDefinitionOverrul_overrulingWorkCalendardefini_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarDefinitionOverruling"
    ADD CONSTRAINT "WorkCalendarDefinitionOverrul_overrulingWorkCalendardefini_fkey" FOREIGN KEY ("overrulingWorkCalendardefinition") REFERENCES dt."WorkCalendarDefinition"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."WorkCalendarDefinitionOverruling" DROP CONSTRAINT "WorkCalendarDefinitionOverrul_overrulingWorkCalendardefini_fkey";
       dt          postgres    false    3914    356    350            �           2606    41951 ]   WorkCalendarDefinitionOverruling WorkCalendarDefinitionOverruling_workCalendarDefinition_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarDefinitionOverruling"
    ADD CONSTRAINT "WorkCalendarDefinitionOverruling_workCalendarDefinition_fkey" FOREIGN KEY ("workCalendarDefinition") REFERENCES dt."WorkCalendarDefinition"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."WorkCalendarDefinitionOverruling" DROP CONSTRAINT "WorkCalendarDefinitionOverruling_workCalendarDefinition_fkey";
       dt          postgres    false    3914    350    356            �           2606    41956 K   WorkCalendarDefinitionProperty WorkCalendarDefinitionProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarDefinitionProperty"
    ADD CONSTRAINT "WorkCalendarDefinitionProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 u   ALTER TABLE ONLY dt."WorkCalendarDefinitionProperty" DROP CONSTRAINT "WorkCalendarDefinitionProperty_category_fkey";
       dt          postgres    false    357    243    3700            �           2606    41961 I   WorkCalendarDefinitionProperty WorkCalendarDefinitionProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarDefinitionProperty"
    ADD CONSTRAINT "WorkCalendarDefinitionProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."WorkCalendarDefinitionProperty"(id) ON DELETE SET NULL;
 s   ALTER TABLE ONLY dt."WorkCalendarDefinitionProperty" DROP CONSTRAINT "WorkCalendarDefinitionProperty_parent_fkey";
       dt          postgres    false    357    3928    357            �           2606    41966 O   WorkCalendarDefinitionProperty WorkCalendarDefinitionProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarDefinitionProperty"
    ADD CONSTRAINT "WorkCalendarDefinitionProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 y   ALTER TABLE ONLY dt."WorkCalendarDefinitionProperty" DROP CONSTRAINT "WorkCalendarDefinitionProperty_propertyType_fkey";
       dt          postgres    false    3854    357    320            �           2606    41971 M   WorkCalendarDefinitionProperty WorkCalendarDefinitionProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarDefinitionProperty"
    ADD CONSTRAINT "WorkCalendarDefinitionProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 w   ALTER TABLE ONLY dt."WorkCalendarDefinitionProperty" DROP CONSTRAINT "WorkCalendarDefinitionProperty_sensorType_fkey";
       dt          postgres    false    216    3643    357            �           2606    41976 I   WorkCalendarDefinitionProperty WorkCalendarDefinitionProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarDefinitionProperty"
    ADD CONSTRAINT "WorkCalendarDefinitionProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 s   ALTER TABLE ONLY dt."WorkCalendarDefinitionProperty" DROP CONSTRAINT "WorkCalendarDefinitionProperty_sensor_fkey";
       dt          postgres    false    357    3631    210            �           2606    41981 N   WorkCalendarDefinitionProperty WorkCalendarDefinitionProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarDefinitionProperty"
    ADD CONSTRAINT "WorkCalendarDefinitionProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 x   ALTER TABLE ONLY dt."WorkCalendarDefinitionProperty" DROP CONSTRAINT "WorkCalendarDefinitionProperty_uomCategory_fkey";
       dt          postgres    false    348    3910    357            �           2606    41986 K   WorkCalendarDefinitionProperty WorkCalendarDefinitionProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarDefinitionProperty"
    ADD CONSTRAINT "WorkCalendarDefinitionProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 u   ALTER TABLE ONLY dt."WorkCalendarDefinitionProperty" DROP CONSTRAINT "WorkCalendarDefinitionProperty_valueUom_fkey";
       dt          postgres    false    347    3908    357            �           2606    41991 Y   WorkCalendarDefinitionProperty WorkCalendarDefinitionProperty_workCalendarDefinition_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarDefinitionProperty"
    ADD CONSTRAINT "WorkCalendarDefinitionProperty_workCalendarDefinition_fkey" FOREIGN KEY ("workCalendarDefinition") REFERENCES dt."WorkCalendarDefinition"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."WorkCalendarDefinitionProperty" DROP CONSTRAINT "WorkCalendarDefinitionProperty_workCalendarDefinition_fkey";
       dt          postgres    false    350    3914    357            �           2606    41996 >   WorkCalendarDefinition WorkCalendarDefinition_planThrough_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarDefinition"
    ADD CONSTRAINT "WorkCalendarDefinition_planThrough_fkey" FOREIGN KEY ("planThrough") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 h   ALTER TABLE ONLY dt."WorkCalendarDefinition" DROP CONSTRAINT "WorkCalendarDefinition_planThrough_fkey";
       dt          postgres    false    243    3700    350            �           2606    42001 A   WorkCalendarEntryProperty WorkCalendarEntryProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarEntryProperty"
    ADD CONSTRAINT "WorkCalendarEntryProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 k   ALTER TABLE ONLY dt."WorkCalendarEntryProperty" DROP CONSTRAINT "WorkCalendarEntryProperty_category_fkey";
       dt          postgres    false    243    3700    359            �           2606    42006 ?   WorkCalendarEntryProperty WorkCalendarEntryProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarEntryProperty"
    ADD CONSTRAINT "WorkCalendarEntryProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."WorkCalendarEntryProperty"(id) ON DELETE SET NULL;
 i   ALTER TABLE ONLY dt."WorkCalendarEntryProperty" DROP CONSTRAINT "WorkCalendarEntryProperty_parent_fkey";
       dt          postgres    false    3932    359    359            �           2606    42011 E   WorkCalendarEntryProperty WorkCalendarEntryProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarEntryProperty"
    ADD CONSTRAINT "WorkCalendarEntryProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY dt."WorkCalendarEntryProperty" DROP CONSTRAINT "WorkCalendarEntryProperty_propertyType_fkey";
       dt          postgres    false    359    320    3854            �           2606    42016 C   WorkCalendarEntryProperty WorkCalendarEntryProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarEntryProperty"
    ADD CONSTRAINT "WorkCalendarEntryProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 m   ALTER TABLE ONLY dt."WorkCalendarEntryProperty" DROP CONSTRAINT "WorkCalendarEntryProperty_sensorType_fkey";
       dt          postgres    false    216    3643    359            �           2606    42021 ?   WorkCalendarEntryProperty WorkCalendarEntryProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarEntryProperty"
    ADD CONSTRAINT "WorkCalendarEntryProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 i   ALTER TABLE ONLY dt."WorkCalendarEntryProperty" DROP CONSTRAINT "WorkCalendarEntryProperty_sensor_fkey";
       dt          postgres    false    359    3631    210            �           2606    42026 D   WorkCalendarEntryProperty WorkCalendarEntryProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarEntryProperty"
    ADD CONSTRAINT "WorkCalendarEntryProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 n   ALTER TABLE ONLY dt."WorkCalendarEntryProperty" DROP CONSTRAINT "WorkCalendarEntryProperty_uomCategory_fkey";
       dt          postgres    false    3910    359    348            �           2606    42031 A   WorkCalendarEntryProperty WorkCalendarEntryProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarEntryProperty"
    ADD CONSTRAINT "WorkCalendarEntryProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 k   ALTER TABLE ONLY dt."WorkCalendarEntryProperty" DROP CONSTRAINT "WorkCalendarEntryProperty_valueUom_fkey";
       dt          postgres    false    359    3908    347            �           2606    42036 Y   WorkCalendarEntryProperty WorkCalendarEntryProperty_workCalendarDefinitionEntryPrope_fkey    FK CONSTRAINT       ALTER TABLE ONLY dt."WorkCalendarEntryProperty"
    ADD CONSTRAINT "WorkCalendarEntryProperty_workCalendarDefinitionEntryPrope_fkey" FOREIGN KEY ("workCalendarDefinitionEntryProperty") REFERENCES dt."WorkCalendarDefinitionEntryProperty"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."WorkCalendarEntryProperty" DROP CONSTRAINT "WorkCalendarEntryProperty_workCalendarDefinitionEntryPrope_fkey";
       dt          postgres    false    352    359    3918            �           2606    42041 J   WorkCalendarEntryProperty WorkCalendarEntryProperty_workCalendarEntry_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarEntryProperty"
    ADD CONSTRAINT "WorkCalendarEntryProperty_workCalendarEntry_fkey" FOREIGN KEY ("workCalendarEntry") REFERENCES dt."WorkCalendarEntry"(id) ON DELETE SET NULL;
 t   ALTER TABLE ONLY dt."WorkCalendarEntryProperty" DROP CONSTRAINT "WorkCalendarEntryProperty_workCalendarEntry_fkey";
       dt          postgres    false    359    3930    358            �           2606    42046 2   WorkCalendarEntry WorkCalendarEntry_entryType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarEntry"
    ADD CONSTRAINT "WorkCalendarEntry_entryType_fkey" FOREIGN KEY ("entryType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 \   ALTER TABLE ONLY dt."WorkCalendarEntry" DROP CONSTRAINT "WorkCalendarEntry_entryType_fkey";
       dt          postgres    false    358    243    3700            �           2606    42051 D   WorkCalendarEntry WorkCalendarEntry_workCalendarDefinitionEntry_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarEntry"
    ADD CONSTRAINT "WorkCalendarEntry_workCalendarDefinitionEntry_fkey" FOREIGN KEY ("workCalendarDefinitionEntry") REFERENCES dt."WorkCalendarDefinitionEntry"(id) ON DELETE SET NULL;
 n   ALTER TABLE ONLY dt."WorkCalendarEntry" DROP CONSTRAINT "WorkCalendarEntry_workCalendarDefinitionEntry_fkey";
       dt          postgres    false    351    3916    358            �           2606    42056 5   WorkCalendarEntry WorkCalendarEntry_workCalendar_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarEntry"
    ADD CONSTRAINT "WorkCalendarEntry_workCalendar_fkey" FOREIGN KEY ("workCalendar") REFERENCES dt."WorkCalendar"(id) ON DELETE SET NULL;
 _   ALTER TABLE ONLY dt."WorkCalendarEntry" DROP CONSTRAINT "WorkCalendarEntry_workCalendar_fkey";
       dt          postgres    false    3912    358    349            �           2606    42061 7   WorkCalendarProperty WorkCalendarProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarProperty"
    ADD CONSTRAINT "WorkCalendarProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 a   ALTER TABLE ONLY dt."WorkCalendarProperty" DROP CONSTRAINT "WorkCalendarProperty_category_fkey";
       dt          postgres    false    243    360    3700            �           2606    42066 5   WorkCalendarProperty WorkCalendarProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarProperty"
    ADD CONSTRAINT "WorkCalendarProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."WorkCalendarProperty"(id) ON DELETE SET NULL;
 _   ALTER TABLE ONLY dt."WorkCalendarProperty" DROP CONSTRAINT "WorkCalendarProperty_parent_fkey";
       dt          postgres    false    360    360    3934            �           2606    42071 ;   WorkCalendarProperty WorkCalendarProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarProperty"
    ADD CONSTRAINT "WorkCalendarProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."WorkCalendarProperty" DROP CONSTRAINT "WorkCalendarProperty_propertyType_fkey";
       dt          postgres    false    360    3854    320            �           2606    42076 9   WorkCalendarProperty WorkCalendarProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarProperty"
    ADD CONSTRAINT "WorkCalendarProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY dt."WorkCalendarProperty" DROP CONSTRAINT "WorkCalendarProperty_sensorType_fkey";
       dt          postgres    false    360    216    3643            �           2606    42081 5   WorkCalendarProperty WorkCalendarProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarProperty"
    ADD CONSTRAINT "WorkCalendarProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 _   ALTER TABLE ONLY dt."WorkCalendarProperty" DROP CONSTRAINT "WorkCalendarProperty_sensor_fkey";
       dt          postgres    false    3631    360    210            �           2606    42086 :   WorkCalendarProperty WorkCalendarProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarProperty"
    ADD CONSTRAINT "WorkCalendarProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 d   ALTER TABLE ONLY dt."WorkCalendarProperty" DROP CONSTRAINT "WorkCalendarProperty_uomCategory_fkey";
       dt          postgres    false    360    3910    348            �           2606    42091 7   WorkCalendarProperty WorkCalendarProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarProperty"
    ADD CONSTRAINT "WorkCalendarProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 a   ALTER TABLE ONLY dt."WorkCalendarProperty" DROP CONSTRAINT "WorkCalendarProperty_valueUom_fkey";
       dt          postgres    false    360    3908    347            �           2606    42096 ;   WorkCalendarProperty WorkCalendarProperty_workCalendar_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCalendarProperty"
    ADD CONSTRAINT "WorkCalendarProperty_workCalendar_fkey" FOREIGN KEY ("workCalendar") REFERENCES dt."WorkCalendar"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."WorkCalendarProperty" DROP CONSTRAINT "WorkCalendarProperty_workCalendar_fkey";
       dt          postgres    false    3912    349    360            �           2606    42101 ;   WorkCapabilityProperty WorkCapabilityProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCapabilityProperty"
    ADD CONSTRAINT "WorkCapabilityProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."WorkCapabilityProperty" DROP CONSTRAINT "WorkCapabilityProperty_category_fkey";
       dt          postgres    false    3700    362    243            �           2606    42106 9   WorkCapabilityProperty WorkCapabilityProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCapabilityProperty"
    ADD CONSTRAINT "WorkCapabilityProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."WorkCapabilityProperty"(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY dt."WorkCapabilityProperty" DROP CONSTRAINT "WorkCapabilityProperty_parent_fkey";
       dt          postgres    false    3938    362    362            �           2606    42111 ?   WorkCapabilityProperty WorkCapabilityProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCapabilityProperty"
    ADD CONSTRAINT "WorkCapabilityProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 i   ALTER TABLE ONLY dt."WorkCapabilityProperty" DROP CONSTRAINT "WorkCapabilityProperty_propertyType_fkey";
       dt          postgres    false    3854    362    320            �           2606    42116 =   WorkCapabilityProperty WorkCapabilityProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCapabilityProperty"
    ADD CONSTRAINT "WorkCapabilityProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 g   ALTER TABLE ONLY dt."WorkCapabilityProperty" DROP CONSTRAINT "WorkCapabilityProperty_sensorType_fkey";
       dt          postgres    false    216    362    3643            �           2606    42121 9   WorkCapabilityProperty WorkCapabilityProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCapabilityProperty"
    ADD CONSTRAINT "WorkCapabilityProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY dt."WorkCapabilityProperty" DROP CONSTRAINT "WorkCapabilityProperty_sensor_fkey";
       dt          postgres    false    362    210    3631            �           2606    42126 >   WorkCapabilityProperty WorkCapabilityProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCapabilityProperty"
    ADD CONSTRAINT "WorkCapabilityProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 h   ALTER TABLE ONLY dt."WorkCapabilityProperty" DROP CONSTRAINT "WorkCapabilityProperty_uomCategory_fkey";
       dt          postgres    false    362    3910    348            �           2606    42131 ;   WorkCapabilityProperty WorkCapabilityProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCapabilityProperty"
    ADD CONSTRAINT "WorkCapabilityProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."WorkCapabilityProperty" DROP CONSTRAINT "WorkCapabilityProperty_valueUom_fkey";
       dt          postgres    false    362    3908    347            �           2606    42136 A   WorkCapabilityProperty WorkCapabilityProperty_workCapability_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCapabilityProperty"
    ADD CONSTRAINT "WorkCapabilityProperty_workCapability_fkey" FOREIGN KEY ("workCapability") REFERENCES dt."WorkCapability"(id) ON DELETE SET NULL;
 k   ALTER TABLE ONLY dt."WorkCapabilityProperty" DROP CONSTRAINT "WorkCapabilityProperty_workCapability_fkey";
       dt          postgres    false    3936    361    362            �           2606    42141 /   WorkCapability WorkCapability_capacityType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCapability"
    ADD CONSTRAINT "WorkCapability_capacityType_fkey" FOREIGN KEY ("capacityType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 Y   ALTER TABLE ONLY dt."WorkCapability" DROP CONSTRAINT "WorkCapability_capacityType_fkey";
       dt          postgres    false    361    243    3700            �           2606    42146 1   WorkCapability WorkCapability_hierarchyScope_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkCapability"
    ADD CONSTRAINT "WorkCapability_hierarchyScope_fkey" FOREIGN KEY ("hierarchyScope") REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 [   ALTER TABLE ONLY dt."WorkCapability" DROP CONSTRAINT "WorkCapability_hierarchyScope_fkey";
       dt          postgres    false    210    361    3631            �           2606    42151 G   WorkMasterCapabilityProperty WorkMasterCapabilityProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkMasterCapabilityProperty"
    ADD CONSTRAINT "WorkMasterCapabilityProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 q   ALTER TABLE ONLY dt."WorkMasterCapabilityProperty" DROP CONSTRAINT "WorkMasterCapabilityProperty_category_fkey";
       dt          postgres    false    243    3700    365            �           2606    42156 E   WorkMasterCapabilityProperty WorkMasterCapabilityProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkMasterCapabilityProperty"
    ADD CONSTRAINT "WorkMasterCapabilityProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."WorkMasterCapabilityProperty"(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY dt."WorkMasterCapabilityProperty" DROP CONSTRAINT "WorkMasterCapabilityProperty_parent_fkey";
       dt          postgres    false    365    365    3944            �           2606    42161 K   WorkMasterCapabilityProperty WorkMasterCapabilityProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkMasterCapabilityProperty"
    ADD CONSTRAINT "WorkMasterCapabilityProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 u   ALTER TABLE ONLY dt."WorkMasterCapabilityProperty" DROP CONSTRAINT "WorkMasterCapabilityProperty_propertyType_fkey";
       dt          postgres    false    3854    320    365            �           2606    42166 I   WorkMasterCapabilityProperty WorkMasterCapabilityProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkMasterCapabilityProperty"
    ADD CONSTRAINT "WorkMasterCapabilityProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 s   ALTER TABLE ONLY dt."WorkMasterCapabilityProperty" DROP CONSTRAINT "WorkMasterCapabilityProperty_sensorType_fkey";
       dt          postgres    false    3643    365    216            �           2606    42171 E   WorkMasterCapabilityProperty WorkMasterCapabilityProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkMasterCapabilityProperty"
    ADD CONSTRAINT "WorkMasterCapabilityProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY dt."WorkMasterCapabilityProperty" DROP CONSTRAINT "WorkMasterCapabilityProperty_sensor_fkey";
       dt          postgres    false    365    3631    210            �           2606    42176 J   WorkMasterCapabilityProperty WorkMasterCapabilityProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkMasterCapabilityProperty"
    ADD CONSTRAINT "WorkMasterCapabilityProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 t   ALTER TABLE ONLY dt."WorkMasterCapabilityProperty" DROP CONSTRAINT "WorkMasterCapabilityProperty_uomCategory_fkey";
       dt          postgres    false    365    348    3910            �           2606    42181 G   WorkMasterCapabilityProperty WorkMasterCapabilityProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkMasterCapabilityProperty"
    ADD CONSTRAINT "WorkMasterCapabilityProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 q   ALTER TABLE ONLY dt."WorkMasterCapabilityProperty" DROP CONSTRAINT "WorkMasterCapabilityProperty_valueUom_fkey";
       dt          postgres    false    365    3908    347            �           2606    42186 S   WorkMasterCapabilityProperty WorkMasterCapabilityProperty_workMasterCapability_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkMasterCapabilityProperty"
    ADD CONSTRAINT "WorkMasterCapabilityProperty_workMasterCapability_fkey" FOREIGN KEY ("workMasterCapability") REFERENCES dt."WorkMasterCapability"(id) ON DELETE SET NULL;
 }   ALTER TABLE ONLY dt."WorkMasterCapabilityProperty" DROP CONSTRAINT "WorkMasterCapabilityProperty_workMasterCapability_fkey";
       dt          postgres    false    365    3942    364            �           2606    42191 ;   WorkMasterCapability WorkMasterCapability_capacityType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkMasterCapability"
    ADD CONSTRAINT "WorkMasterCapability_capacityType_fkey" FOREIGN KEY ("capacityType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."WorkMasterCapability" DROP CONSTRAINT "WorkMasterCapability_capacityType_fkey";
       dt          postgres    false    243    3700    364            �           2606    42196 =   WorkMasterCapability WorkMasterCapability_hierarchyScope_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkMasterCapability"
    ADD CONSTRAINT "WorkMasterCapability_hierarchyScope_fkey" FOREIGN KEY ("hierarchyScope") REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 g   ALTER TABLE ONLY dt."WorkMasterCapability" DROP CONSTRAINT "WorkMasterCapability_hierarchyScope_fkey";
       dt          postgres    false    3631    210    364            �           2606    42201 =   WorkMasterCapability WorkMasterCapability_workCapability_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkMasterCapability"
    ADD CONSTRAINT "WorkMasterCapability_workCapability_fkey" FOREIGN KEY ("workCapability") REFERENCES dt."WorkCapability"(id) ON DELETE SET NULL;
 g   ALTER TABLE ONLY dt."WorkMasterCapability" DROP CONSTRAINT "WorkMasterCapability_workCapability_fkey";
       dt          postgres    false    361    3936    364            �           2606    42206 9   WorkMasterCapability WorkMasterCapability_workMaster_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkMasterCapability"
    ADD CONSTRAINT "WorkMasterCapability_workMaster_fkey" FOREIGN KEY ("workMaster") REFERENCES dt."WorkMaster"(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY dt."WorkMasterCapability" DROP CONSTRAINT "WorkMasterCapability_workMaster_fkey";
       dt          postgres    false    363    3940    364            �           2606    42211 &   WorkMaster WorkMaster_durationUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkMaster"
    ADD CONSTRAINT "WorkMaster_durationUom_fkey" FOREIGN KEY ("durationUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 P   ALTER TABLE ONLY dt."WorkMaster" DROP CONSTRAINT "WorkMaster_durationUom_fkey";
       dt          postgres    false    363    3908    347            �           2606    42216 /   WorkMaster WorkMaster_operationsDefinition_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkMaster"
    ADD CONSTRAINT "WorkMaster_operationsDefinition_fkey" FOREIGN KEY ("operationsDefinition") REFERENCES dt."OperationsDefinition"(id) ON DELETE SET NULL;
 Y   ALTER TABLE ONLY dt."WorkMaster" DROP CONSTRAINT "WorkMaster_operationsDefinition_fkey";
       dt          postgres    false    3754    270    363            �           2606    42221 ,   WorkMaster WorkMaster_operationsSegment_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkMaster"
    ADD CONSTRAINT "WorkMaster_operationsSegment_fkey" FOREIGN KEY ("operationsSegment") REFERENCES dt."OperationsSegment"(id) ON DELETE SET NULL;
 V   ALTER TABLE ONLY dt."WorkMaster" DROP CONSTRAINT "WorkMaster_operationsSegment_fkey";
       dt          postgres    false    3778    282    363            �           2606    42226 )   WorkMaster WorkMaster_workMasterType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkMaster"
    ADD CONSTRAINT "WorkMaster_workMasterType_fkey" FOREIGN KEY ("workMasterType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 S   ALTER TABLE ONLY dt."WorkMaster" DROP CONSTRAINT "WorkMaster_workMasterType_fkey";
       dt          postgres    false    243    363    3700            �           2606    42231 #   WorkMaster WorkMaster_workType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkMaster"
    ADD CONSTRAINT "WorkMaster_workType_fkey" FOREIGN KEY ("workType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 M   ALTER TABLE ONLY dt."WorkMaster" DROP CONSTRAINT "WorkMaster_workType_fkey";
       dt          postgres    false    363    3700    243                       2606    42236 =   WorkPerformanceProperty WorkPerformanceProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkPerformanceProperty"
    ADD CONSTRAINT "WorkPerformanceProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 g   ALTER TABLE ONLY dt."WorkPerformanceProperty" DROP CONSTRAINT "WorkPerformanceProperty_category_fkey";
       dt          postgres    false    3700    243    367                       2606    42241 ;   WorkPerformanceProperty WorkPerformanceProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkPerformanceProperty"
    ADD CONSTRAINT "WorkPerformanceProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."WorkPerformanceProperty"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."WorkPerformanceProperty" DROP CONSTRAINT "WorkPerformanceProperty_parent_fkey";
       dt          postgres    false    367    367    3948                       2606    42246 A   WorkPerformanceProperty WorkPerformanceProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkPerformanceProperty"
    ADD CONSTRAINT "WorkPerformanceProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 k   ALTER TABLE ONLY dt."WorkPerformanceProperty" DROP CONSTRAINT "WorkPerformanceProperty_propertyType_fkey";
       dt          postgres    false    367    320    3854                       2606    42251 ?   WorkPerformanceProperty WorkPerformanceProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkPerformanceProperty"
    ADD CONSTRAINT "WorkPerformanceProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 i   ALTER TABLE ONLY dt."WorkPerformanceProperty" DROP CONSTRAINT "WorkPerformanceProperty_sensorType_fkey";
       dt          postgres    false    367    216    3643                       2606    42256 ;   WorkPerformanceProperty WorkPerformanceProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkPerformanceProperty"
    ADD CONSTRAINT "WorkPerformanceProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."WorkPerformanceProperty" DROP CONSTRAINT "WorkPerformanceProperty_sensor_fkey";
       dt          postgres    false    367    210    3631                       2606    42261 @   WorkPerformanceProperty WorkPerformanceProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkPerformanceProperty"
    ADD CONSTRAINT "WorkPerformanceProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 j   ALTER TABLE ONLY dt."WorkPerformanceProperty" DROP CONSTRAINT "WorkPerformanceProperty_uomCategory_fkey";
       dt          postgres    false    367    348    3910            	           2606    42266 =   WorkPerformanceProperty WorkPerformanceProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkPerformanceProperty"
    ADD CONSTRAINT "WorkPerformanceProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 g   ALTER TABLE ONLY dt."WorkPerformanceProperty" DROP CONSTRAINT "WorkPerformanceProperty_valueUom_fkey";
       dt          postgres    false    367    347    3908            
           2606    42271 D   WorkPerformanceProperty WorkPerformanceProperty_workPerformance_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkPerformanceProperty"
    ADD CONSTRAINT "WorkPerformanceProperty_workPerformance_fkey" FOREIGN KEY ("workPerformance") REFERENCES dt."WorkPerformance"(id) ON DELETE SET NULL;
 n   ALTER TABLE ONLY dt."WorkPerformanceProperty" DROP CONSTRAINT "WorkPerformanceProperty_workPerformance_fkey";
       dt          postgres    false    367    366    3946            �           2606    42276 3   WorkPerformance WorkPerformance_hierarchyScope_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkPerformance"
    ADD CONSTRAINT "WorkPerformance_hierarchyScope_fkey" FOREIGN KEY ("hierarchyScope") REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 ]   ALTER TABLE ONLY dt."WorkPerformance" DROP CONSTRAINT "WorkPerformance_hierarchyScope_fkey";
       dt          postgres    false    3631    366    210                        2606    42281 +   WorkPerformance WorkPerformance_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkPerformance"
    ADD CONSTRAINT "WorkPerformance_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."WorkPerformance"(id) ON DELETE SET NULL;
 U   ALTER TABLE ONLY dt."WorkPerformance" DROP CONSTRAINT "WorkPerformance_parent_fkey";
       dt          postgres    false    366    366    3946                       2606    42286 1   WorkPerformance WorkPerformance_workSchedule_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkPerformance"
    ADD CONSTRAINT "WorkPerformance_workSchedule_fkey" FOREIGN KEY ("workSchedule") REFERENCES dt."WorkSchedule"(id) ON DELETE SET NULL;
 [   ALTER TABLE ONLY dt."WorkPerformance" DROP CONSTRAINT "WorkPerformance_workSchedule_fkey";
       dt          postgres    false    3958    366    372                       2606    42291 -   WorkPerformance WorkPerformance_workType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkPerformance"
    ADD CONSTRAINT "WorkPerformance_workType_fkey" FOREIGN KEY ("workType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 W   ALTER TABLE ONLY dt."WorkPerformance" DROP CONSTRAINT "WorkPerformance_workType_fkey";
       dt          postgres    false    366    3700    243                       2606    42296 5   WorkRequestProperty WorkRequestProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkRequestProperty"
    ADD CONSTRAINT "WorkRequestProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 _   ALTER TABLE ONLY dt."WorkRequestProperty" DROP CONSTRAINT "WorkRequestProperty_category_fkey";
       dt          postgres    false    243    369    3700                       2606    42301 3   WorkRequestProperty WorkRequestProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkRequestProperty"
    ADD CONSTRAINT "WorkRequestProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."WorkRequestProperty"(id) ON DELETE SET NULL;
 ]   ALTER TABLE ONLY dt."WorkRequestProperty" DROP CONSTRAINT "WorkRequestProperty_parent_fkey";
       dt          postgres    false    369    369    3952                       2606    42306 9   WorkRequestProperty WorkRequestProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkRequestProperty"
    ADD CONSTRAINT "WorkRequestProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY dt."WorkRequestProperty" DROP CONSTRAINT "WorkRequestProperty_propertyType_fkey";
       dt          postgres    false    320    3854    369                       2606    42311 7   WorkRequestProperty WorkRequestProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkRequestProperty"
    ADD CONSTRAINT "WorkRequestProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 a   ALTER TABLE ONLY dt."WorkRequestProperty" DROP CONSTRAINT "WorkRequestProperty_sensorType_fkey";
       dt          postgres    false    3643    216    369                       2606    42316 3   WorkRequestProperty WorkRequestProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkRequestProperty"
    ADD CONSTRAINT "WorkRequestProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 ]   ALTER TABLE ONLY dt."WorkRequestProperty" DROP CONSTRAINT "WorkRequestProperty_sensor_fkey";
       dt          postgres    false    3631    369    210                       2606    42321 8   WorkRequestProperty WorkRequestProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkRequestProperty"
    ADD CONSTRAINT "WorkRequestProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 b   ALTER TABLE ONLY dt."WorkRequestProperty" DROP CONSTRAINT "WorkRequestProperty_uomCategory_fkey";
       dt          postgres    false    3910    348    369                       2606    42326 5   WorkRequestProperty WorkRequestProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkRequestProperty"
    ADD CONSTRAINT "WorkRequestProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 _   ALTER TABLE ONLY dt."WorkRequestProperty" DROP CONSTRAINT "WorkRequestProperty_valueUom_fkey";
       dt          postgres    false    3908    347    369                       2606    42331 8   WorkRequestProperty WorkRequestProperty_workRequest_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkRequestProperty"
    ADD CONSTRAINT "WorkRequestProperty_workRequest_fkey" FOREIGN KEY ("workRequest") REFERENCES dt."WorkRequest"(id) ON DELETE SET NULL;
 b   ALTER TABLE ONLY dt."WorkRequestProperty" DROP CONSTRAINT "WorkRequestProperty_workRequest_fkey";
       dt          postgres    false    369    368    3950                       2606    42336 +   WorkRequest WorkRequest_hierarchyScope_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkRequest"
    ADD CONSTRAINT "WorkRequest_hierarchyScope_fkey" FOREIGN KEY ("hierarchyScope") REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 U   ALTER TABLE ONLY dt."WorkRequest" DROP CONSTRAINT "WorkRequest_hierarchyScope_fkey";
       dt          postgres    false    3631    368    210                       2606    42341 #   WorkRequest WorkRequest_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkRequest"
    ADD CONSTRAINT "WorkRequest_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."WorkRequest"(id) ON DELETE SET NULL;
 M   ALTER TABLE ONLY dt."WorkRequest" DROP CONSTRAINT "WorkRequest_parent_fkey";
       dt          postgres    false    368    368    3950                       2606    42346 %   WorkRequest WorkRequest_priority_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkRequest"
    ADD CONSTRAINT "WorkRequest_priority_fkey" FOREIGN KEY (priority) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 O   ALTER TABLE ONLY dt."WorkRequest" DROP CONSTRAINT "WorkRequest_priority_fkey";
       dt          postgres    false    3700    368    243                       2606    42351 )   WorkRequest WorkRequest_workSchedule_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkRequest"
    ADD CONSTRAINT "WorkRequest_workSchedule_fkey" FOREIGN KEY ("workSchedule") REFERENCES dt."WorkSchedule"(id) ON DELETE SET NULL;
 S   ALTER TABLE ONLY dt."WorkRequest" DROP CONSTRAINT "WorkRequest_workSchedule_fkey";
       dt          postgres    false    372    368    3958                       2606    42356 %   WorkRequest WorkRequest_workType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkRequest"
    ADD CONSTRAINT "WorkRequest_workType_fkey" FOREIGN KEY ("workType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 O   ALTER TABLE ONLY dt."WorkRequest" DROP CONSTRAINT "WorkRequest_workType_fkey";
       dt          postgres    false    368    3700    243                       2606    42361 7   WorkResponseProperty WorkResponseProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkResponseProperty"
    ADD CONSTRAINT "WorkResponseProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 a   ALTER TABLE ONLY dt."WorkResponseProperty" DROP CONSTRAINT "WorkResponseProperty_category_fkey";
       dt          postgres    false    371    3700    243                       2606    42366 5   WorkResponseProperty WorkResponseProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkResponseProperty"
    ADD CONSTRAINT "WorkResponseProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."WorkResponseProperty"(id) ON DELETE SET NULL;
 _   ALTER TABLE ONLY dt."WorkResponseProperty" DROP CONSTRAINT "WorkResponseProperty_parent_fkey";
       dt          postgres    false    371    3956    371                        2606    42371 ;   WorkResponseProperty WorkResponseProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkResponseProperty"
    ADD CONSTRAINT "WorkResponseProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."WorkResponseProperty" DROP CONSTRAINT "WorkResponseProperty_propertyType_fkey";
       dt          postgres    false    371    3854    320            !           2606    42376 9   WorkResponseProperty WorkResponseProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkResponseProperty"
    ADD CONSTRAINT "WorkResponseProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY dt."WorkResponseProperty" DROP CONSTRAINT "WorkResponseProperty_sensorType_fkey";
       dt          postgres    false    371    3643    216            "           2606    42381 5   WorkResponseProperty WorkResponseProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkResponseProperty"
    ADD CONSTRAINT "WorkResponseProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 _   ALTER TABLE ONLY dt."WorkResponseProperty" DROP CONSTRAINT "WorkResponseProperty_sensor_fkey";
       dt          postgres    false    371    3631    210            #           2606    42386 :   WorkResponseProperty WorkResponseProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkResponseProperty"
    ADD CONSTRAINT "WorkResponseProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 d   ALTER TABLE ONLY dt."WorkResponseProperty" DROP CONSTRAINT "WorkResponseProperty_uomCategory_fkey";
       dt          postgres    false    348    371    3910            $           2606    42391 7   WorkResponseProperty WorkResponseProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkResponseProperty"
    ADD CONSTRAINT "WorkResponseProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 a   ALTER TABLE ONLY dt."WorkResponseProperty" DROP CONSTRAINT "WorkResponseProperty_valueUom_fkey";
       dt          postgres    false    347    371    3908            %           2606    42396 ;   WorkResponseProperty WorkResponseProperty_workResponse_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkResponseProperty"
    ADD CONSTRAINT "WorkResponseProperty_workResponse_fkey" FOREIGN KEY ("workResponse") REFERENCES dt."WorkResponse"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."WorkResponseProperty" DROP CONSTRAINT "WorkResponseProperty_workResponse_fkey";
       dt          postgres    false    3954    371    370                       2606    42401 -   WorkResponse WorkResponse_hierarchyScope_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkResponse"
    ADD CONSTRAINT "WorkResponse_hierarchyScope_fkey" FOREIGN KEY ("hierarchyScope") REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 W   ALTER TABLE ONLY dt."WorkResponse" DROP CONSTRAINT "WorkResponse_hierarchyScope_fkey";
       dt          postgres    false    370    210    3631                       2606    42406 %   WorkResponse WorkResponse_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkResponse"
    ADD CONSTRAINT "WorkResponse_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."WorkResponse"(id) ON DELETE SET NULL;
 O   ALTER TABLE ONLY dt."WorkResponse" DROP CONSTRAINT "WorkResponse_parent_fkey";
       dt          postgres    false    370    370    3954                       2606    42411 -   WorkResponse WorkResponse_responseStatus_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkResponse"
    ADD CONSTRAINT "WorkResponse_responseStatus_fkey" FOREIGN KEY ("responseStatus") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 W   ALTER TABLE ONLY dt."WorkResponse" DROP CONSTRAINT "WorkResponse_responseStatus_fkey";
       dt          postgres    false    370    3700    243                       2606    42416 .   WorkResponse WorkResponse_workPerformance_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkResponse"
    ADD CONSTRAINT "WorkResponse_workPerformance_fkey" FOREIGN KEY ("workPerformance") REFERENCES dt."WorkPerformance"(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY dt."WorkResponse" DROP CONSTRAINT "WorkResponse_workPerformance_fkey";
       dt          postgres    false    3946    366    370                       2606    42421 *   WorkResponse WorkResponse_workRequest_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkResponse"
    ADD CONSTRAINT "WorkResponse_workRequest_fkey" FOREIGN KEY ("workRequest") REFERENCES dt."WorkRequest"(id) ON DELETE SET NULL;
 T   ALTER TABLE ONLY dt."WorkResponse" DROP CONSTRAINT "WorkResponse_workRequest_fkey";
       dt          postgres    false    368    3950    370                       2606    42426 '   WorkResponse WorkResponse_workType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkResponse"
    ADD CONSTRAINT "WorkResponse_workType_fkey" FOREIGN KEY ("workType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 Q   ALTER TABLE ONLY dt."WorkResponse" DROP CONSTRAINT "WorkResponse_workType_fkey";
       dt          postgres    false    370    3700    243            )           2606    42431 7   WorkScheduleProperty WorkScheduleProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkScheduleProperty"
    ADD CONSTRAINT "WorkScheduleProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 a   ALTER TABLE ONLY dt."WorkScheduleProperty" DROP CONSTRAINT "WorkScheduleProperty_category_fkey";
       dt          postgres    false    3700    373    243            *           2606    42436 5   WorkScheduleProperty WorkScheduleProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkScheduleProperty"
    ADD CONSTRAINT "WorkScheduleProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."WorkScheduleProperty"(id) ON DELETE SET NULL;
 _   ALTER TABLE ONLY dt."WorkScheduleProperty" DROP CONSTRAINT "WorkScheduleProperty_parent_fkey";
       dt          postgres    false    373    3960    373            +           2606    42441 ;   WorkScheduleProperty WorkScheduleProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkScheduleProperty"
    ADD CONSTRAINT "WorkScheduleProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."WorkScheduleProperty" DROP CONSTRAINT "WorkScheduleProperty_propertyType_fkey";
       dt          postgres    false    320    373    3854            ,           2606    42446 9   WorkScheduleProperty WorkScheduleProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkScheduleProperty"
    ADD CONSTRAINT "WorkScheduleProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 c   ALTER TABLE ONLY dt."WorkScheduleProperty" DROP CONSTRAINT "WorkScheduleProperty_sensorType_fkey";
       dt          postgres    false    3643    216    373            -           2606    42451 5   WorkScheduleProperty WorkScheduleProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkScheduleProperty"
    ADD CONSTRAINT "WorkScheduleProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 _   ALTER TABLE ONLY dt."WorkScheduleProperty" DROP CONSTRAINT "WorkScheduleProperty_sensor_fkey";
       dt          postgres    false    210    373    3631            .           2606    42456 :   WorkScheduleProperty WorkScheduleProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkScheduleProperty"
    ADD CONSTRAINT "WorkScheduleProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 d   ALTER TABLE ONLY dt."WorkScheduleProperty" DROP CONSTRAINT "WorkScheduleProperty_uomCategory_fkey";
       dt          postgres    false    373    348    3910            /           2606    42461 7   WorkScheduleProperty WorkScheduleProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkScheduleProperty"
    ADD CONSTRAINT "WorkScheduleProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 a   ALTER TABLE ONLY dt."WorkScheduleProperty" DROP CONSTRAINT "WorkScheduleProperty_valueUom_fkey";
       dt          postgres    false    347    3908    373            0           2606    42466 ;   WorkScheduleProperty WorkScheduleProperty_workSchedule_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkScheduleProperty"
    ADD CONSTRAINT "WorkScheduleProperty_workSchedule_fkey" FOREIGN KEY ("workSchedule") REFERENCES dt."WorkSchedule"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."WorkScheduleProperty" DROP CONSTRAINT "WorkScheduleProperty_workSchedule_fkey";
       dt          postgres    false    372    373    3958            &           2606    42471 -   WorkSchedule WorkSchedule_hierarchyScope_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkSchedule"
    ADD CONSTRAINT "WorkSchedule_hierarchyScope_fkey" FOREIGN KEY ("hierarchyScope") REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 W   ALTER TABLE ONLY dt."WorkSchedule" DROP CONSTRAINT "WorkSchedule_hierarchyScope_fkey";
       dt          postgres    false    210    3631    372            '           2606    42476 %   WorkSchedule WorkSchedule_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkSchedule"
    ADD CONSTRAINT "WorkSchedule_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."WorkSchedule"(id) ON DELETE SET NULL;
 O   ALTER TABLE ONLY dt."WorkSchedule" DROP CONSTRAINT "WorkSchedule_parent_fkey";
       dt          postgres    false    372    372    3958            (           2606    42481 '   WorkSchedule WorkSchedule_workType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkSchedule"
    ADD CONSTRAINT "WorkSchedule_workType_fkey" FOREIGN KEY ("workType") REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 Q   ALTER TABLE ONLY dt."WorkSchedule" DROP CONSTRAINT "WorkSchedule_workType_fkey";
       dt          postgres    false    243    3700    372            6           2606    42486 O   WorkflowSpecificationCxnProperty WorkflowSpecificationCxnProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationCxnProperty"
    ADD CONSTRAINT "WorkflowSpecificationCxnProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 y   ALTER TABLE ONLY dt."WorkflowSpecificationCxnProperty" DROP CONSTRAINT "WorkflowSpecificationCxnProperty_category_fkey";
       dt          postgres    false    243    3700    376            7           2606    42491 M   WorkflowSpecificationCxnProperty WorkflowSpecificationCxnProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationCxnProperty"
    ADD CONSTRAINT "WorkflowSpecificationCxnProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."WorkflowSpecificationCxnProperty"(id) ON DELETE SET NULL;
 w   ALTER TABLE ONLY dt."WorkflowSpecificationCxnProperty" DROP CONSTRAINT "WorkflowSpecificationCxnProperty_parent_fkey";
       dt          postgres    false    376    3966    376            8           2606    42496 S   WorkflowSpecificationCxnProperty WorkflowSpecificationCxnProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationCxnProperty"
    ADD CONSTRAINT "WorkflowSpecificationCxnProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 }   ALTER TABLE ONLY dt."WorkflowSpecificationCxnProperty" DROP CONSTRAINT "WorkflowSpecificationCxnProperty_propertyType_fkey";
       dt          postgres    false    320    3854    376            9           2606    42501 Q   WorkflowSpecificationCxnProperty WorkflowSpecificationCxnProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationCxnProperty"
    ADD CONSTRAINT "WorkflowSpecificationCxnProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 {   ALTER TABLE ONLY dt."WorkflowSpecificationCxnProperty" DROP CONSTRAINT "WorkflowSpecificationCxnProperty_sensorType_fkey";
       dt          postgres    false    376    3643    216            :           2606    42506 M   WorkflowSpecificationCxnProperty WorkflowSpecificationCxnProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationCxnProperty"
    ADD CONSTRAINT "WorkflowSpecificationCxnProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 w   ALTER TABLE ONLY dt."WorkflowSpecificationCxnProperty" DROP CONSTRAINT "WorkflowSpecificationCxnProperty_sensor_fkey";
       dt          postgres    false    3631    210    376            ;           2606    42511 R   WorkflowSpecificationCxnProperty WorkflowSpecificationCxnProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationCxnProperty"
    ADD CONSTRAINT "WorkflowSpecificationCxnProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 |   ALTER TABLE ONLY dt."WorkflowSpecificationCxnProperty" DROP CONSTRAINT "WorkflowSpecificationCxnProperty_uomCategory_fkey";
       dt          postgres    false    376    3910    348            <           2606    42516 O   WorkflowSpecificationCxnProperty WorkflowSpecificationCxnProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationCxnProperty"
    ADD CONSTRAINT "WorkflowSpecificationCxnProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 y   ALTER TABLE ONLY dt."WorkflowSpecificationCxnProperty" DROP CONSTRAINT "WorkflowSpecificationCxnProperty_valueUom_fkey";
       dt          postgres    false    376    3908    347            =           2606    42521 _   WorkflowSpecificationCxnProperty WorkflowSpecificationCxnProperty_workflowSpecificationCxn_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationCxnProperty"
    ADD CONSTRAINT "WorkflowSpecificationCxnProperty_workflowSpecificationCxn_fkey" FOREIGN KEY ("workflowSpecificationCxn") REFERENCES dt."WorkflowSpecificationCxn"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."WorkflowSpecificationCxnProperty" DROP CONSTRAINT "WorkflowSpecificationCxnProperty_workflowSpecificationCxn_fkey";
       dt          postgres    false    375    376    3964            >           2606    42526 d   WorkflowSpecificationCxnTypeProperty WorkflowSpecificationCxnTypeP_workflowSpecificationCxnType_fkey    FK CONSTRAINT       ALTER TABLE ONLY dt."WorkflowSpecificationCxnTypeProperty"
    ADD CONSTRAINT "WorkflowSpecificationCxnTypeP_workflowSpecificationCxnType_fkey" FOREIGN KEY ("workflowSpecificationCxnType") REFERENCES dt."WorkflowSpecificationCxnType"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."WorkflowSpecificationCxnTypeProperty" DROP CONSTRAINT "WorkflowSpecificationCxnTypeP_workflowSpecificationCxnType_fkey";
       dt          postgres    false    3968    377    378            ?           2606    42531 W   WorkflowSpecificationCxnTypeProperty WorkflowSpecificationCxnTypeProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationCxnTypeProperty"
    ADD CONSTRAINT "WorkflowSpecificationCxnTypeProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."WorkflowSpecificationCxnTypeProperty" DROP CONSTRAINT "WorkflowSpecificationCxnTypeProperty_category_fkey";
       dt          postgres    false    378    243    3700            @           2606    42536 U   WorkflowSpecificationCxnTypeProperty WorkflowSpecificationCxnTypeProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationCxnTypeProperty"
    ADD CONSTRAINT "WorkflowSpecificationCxnTypeProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."WorkflowSpecificationCxnTypeProperty"(id) ON DELETE SET NULL;
    ALTER TABLE ONLY dt."WorkflowSpecificationCxnTypeProperty" DROP CONSTRAINT "WorkflowSpecificationCxnTypeProperty_parent_fkey";
       dt          postgres    false    378    3970    378            A           2606    42541 [   WorkflowSpecificationCxnTypeProperty WorkflowSpecificationCxnTypeProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationCxnTypeProperty"
    ADD CONSTRAINT "WorkflowSpecificationCxnTypeProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."WorkflowSpecificationCxnTypeProperty" DROP CONSTRAINT "WorkflowSpecificationCxnTypeProperty_propertyType_fkey";
       dt          postgres    false    378    3854    320            B           2606    42546 Y   WorkflowSpecificationCxnTypeProperty WorkflowSpecificationCxnTypeProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationCxnTypeProperty"
    ADD CONSTRAINT "WorkflowSpecificationCxnTypeProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."WorkflowSpecificationCxnTypeProperty" DROP CONSTRAINT "WorkflowSpecificationCxnTypeProperty_sensorType_fkey";
       dt          postgres    false    378    216    3643            C           2606    42551 U   WorkflowSpecificationCxnTypeProperty WorkflowSpecificationCxnTypeProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationCxnTypeProperty"
    ADD CONSTRAINT "WorkflowSpecificationCxnTypeProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
    ALTER TABLE ONLY dt."WorkflowSpecificationCxnTypeProperty" DROP CONSTRAINT "WorkflowSpecificationCxnTypeProperty_sensor_fkey";
       dt          postgres    false    378    3631    210            D           2606    42556 Z   WorkflowSpecificationCxnTypeProperty WorkflowSpecificationCxnTypeProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationCxnTypeProperty"
    ADD CONSTRAINT "WorkflowSpecificationCxnTypeProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."WorkflowSpecificationCxnTypeProperty" DROP CONSTRAINT "WorkflowSpecificationCxnTypeProperty_uomCategory_fkey";
       dt          postgres    false    3910    348    378            E           2606    42561 W   WorkflowSpecificationCxnTypeProperty WorkflowSpecificationCxnTypeProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationCxnTypeProperty"
    ADD CONSTRAINT "WorkflowSpecificationCxnTypeProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."WorkflowSpecificationCxnTypeProperty" DROP CONSTRAINT "WorkflowSpecificationCxnTypeProperty_valueUom_fkey";
       dt          postgres    false    3908    347    378            2           2606    42566 T   WorkflowSpecificationCxn WorkflowSpecificationCxn_fromWorkflowSpecificationNode_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationCxn"
    ADD CONSTRAINT "WorkflowSpecificationCxn_fromWorkflowSpecificationNode_fkey" FOREIGN KEY ("fromWorkflowSpecificationNode") REFERENCES dt."WorkflowSpecificationNode"(id) ON DELETE SET NULL;
 ~   ALTER TABLE ONLY dt."WorkflowSpecificationCxn" DROP CONSTRAINT "WorkflowSpecificationCxn_fromWorkflowSpecificationNode_fkey";
       dt          postgres    false    375    3972    379            3           2606    42571 R   WorkflowSpecificationCxn WorkflowSpecificationCxn_toWorkflowSpecificationNode_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationCxn"
    ADD CONSTRAINT "WorkflowSpecificationCxn_toWorkflowSpecificationNode_fkey" FOREIGN KEY ("toWorkflowSpecificationNode") REFERENCES dt."WorkflowSpecificationNode"(id) ON DELETE SET NULL;
 |   ALTER TABLE ONLY dt."WorkflowSpecificationCxn" DROP CONSTRAINT "WorkflowSpecificationCxn_toWorkflowSpecificationNode_fkey";
       dt          postgres    false    3972    375    379            4           2606    42576 S   WorkflowSpecificationCxn WorkflowSpecificationCxn_workflowSpecificationCxnType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationCxn"
    ADD CONSTRAINT "WorkflowSpecificationCxn_workflowSpecificationCxnType_fkey" FOREIGN KEY ("workflowSpecificationCxnType") REFERENCES dt."WorkflowSpecificationCxnType"(id) ON DELETE SET NULL;
 }   ALTER TABLE ONLY dt."WorkflowSpecificationCxn" DROP CONSTRAINT "WorkflowSpecificationCxn_workflowSpecificationCxnType_fkey";
       dt          postgres    false    375    3968    377            5           2606    42581 L   WorkflowSpecificationCxn WorkflowSpecificationCxn_workflowSpecification_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationCxn"
    ADD CONSTRAINT "WorkflowSpecificationCxn_workflowSpecification_fkey" FOREIGN KEY ("workflowSpecification") REFERENCES dt."WorkflowSpecification"(id) ON DELETE SET NULL;
 v   ALTER TABLE ONLY dt."WorkflowSpecificationCxn" DROP CONSTRAINT "WorkflowSpecificationCxn_workflowSpecification_fkey";
       dt          postgres    false    3962    374    375            J           2606    42586 a   WorkflowSpecificationNodeProperty WorkflowSpecificationNodePropert_workflowSpecificationNode_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationNodeProperty"
    ADD CONSTRAINT "WorkflowSpecificationNodePropert_workflowSpecificationNode_fkey" FOREIGN KEY ("workflowSpecificationNode") REFERENCES dt."WorkflowSpecificationNode"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."WorkflowSpecificationNodeProperty" DROP CONSTRAINT "WorkflowSpecificationNodePropert_workflowSpecificationNode_fkey";
       dt          postgres    false    379    3972    380            K           2606    42591 Q   WorkflowSpecificationNodeProperty WorkflowSpecificationNodeProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationNodeProperty"
    ADD CONSTRAINT "WorkflowSpecificationNodeProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 {   ALTER TABLE ONLY dt."WorkflowSpecificationNodeProperty" DROP CONSTRAINT "WorkflowSpecificationNodeProperty_category_fkey";
       dt          postgres    false    380    3700    243            L           2606    42596 O   WorkflowSpecificationNodeProperty WorkflowSpecificationNodeProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationNodeProperty"
    ADD CONSTRAINT "WorkflowSpecificationNodeProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."WorkflowSpecificationNodeProperty"(id) ON DELETE SET NULL;
 y   ALTER TABLE ONLY dt."WorkflowSpecificationNodeProperty" DROP CONSTRAINT "WorkflowSpecificationNodeProperty_parent_fkey";
       dt          postgres    false    380    3974    380            M           2606    42601 U   WorkflowSpecificationNodeProperty WorkflowSpecificationNodeProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationNodeProperty"
    ADD CONSTRAINT "WorkflowSpecificationNodeProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
    ALTER TABLE ONLY dt."WorkflowSpecificationNodeProperty" DROP CONSTRAINT "WorkflowSpecificationNodeProperty_propertyType_fkey";
       dt          postgres    false    3854    320    380            N           2606    42606 S   WorkflowSpecificationNodeProperty WorkflowSpecificationNodeProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationNodeProperty"
    ADD CONSTRAINT "WorkflowSpecificationNodeProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 }   ALTER TABLE ONLY dt."WorkflowSpecificationNodeProperty" DROP CONSTRAINT "WorkflowSpecificationNodeProperty_sensorType_fkey";
       dt          postgres    false    216    3643    380            O           2606    42611 O   WorkflowSpecificationNodeProperty WorkflowSpecificationNodeProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationNodeProperty"
    ADD CONSTRAINT "WorkflowSpecificationNodeProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 y   ALTER TABLE ONLY dt."WorkflowSpecificationNodeProperty" DROP CONSTRAINT "WorkflowSpecificationNodeProperty_sensor_fkey";
       dt          postgres    false    3631    210    380            P           2606    42616 T   WorkflowSpecificationNodeProperty WorkflowSpecificationNodeProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationNodeProperty"
    ADD CONSTRAINT "WorkflowSpecificationNodeProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 ~   ALTER TABLE ONLY dt."WorkflowSpecificationNodeProperty" DROP CONSTRAINT "WorkflowSpecificationNodeProperty_uomCategory_fkey";
       dt          postgres    false    3910    348    380            Q           2606    42621 Q   WorkflowSpecificationNodeProperty WorkflowSpecificationNodeProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationNodeProperty"
    ADD CONSTRAINT "WorkflowSpecificationNodeProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 {   ALTER TABLE ONLY dt."WorkflowSpecificationNodeProperty" DROP CONSTRAINT "WorkflowSpecificationNodeProperty_valueUom_fkey";
       dt          postgres    false    380    3908    347            R           2606    42626 Y   WorkflowSpecificationNodeTypeProperty WorkflowSpecificationNodeTypeProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationNodeTypeProperty"
    ADD CONSTRAINT "WorkflowSpecificationNodeTypeProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."WorkflowSpecificationNodeTypeProperty" DROP CONSTRAINT "WorkflowSpecificationNodeTypeProperty_category_fkey";
       dt          postgres    false    3700    382    243            S           2606    42631 W   WorkflowSpecificationNodeTypeProperty WorkflowSpecificationNodeTypeProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationNodeTypeProperty"
    ADD CONSTRAINT "WorkflowSpecificationNodeTypeProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."WorkflowSpecificationNodeTypeProperty"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."WorkflowSpecificationNodeTypeProperty" DROP CONSTRAINT "WorkflowSpecificationNodeTypeProperty_parent_fkey";
       dt          postgres    false    382    382    3978            T           2606    42636 ]   WorkflowSpecificationNodeTypeProperty WorkflowSpecificationNodeTypeProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationNodeTypeProperty"
    ADD CONSTRAINT "WorkflowSpecificationNodeTypeProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."WorkflowSpecificationNodeTypeProperty" DROP CONSTRAINT "WorkflowSpecificationNodeTypeProperty_propertyType_fkey";
       dt          postgres    false    382    320    3854            U           2606    42641 [   WorkflowSpecificationNodeTypeProperty WorkflowSpecificationNodeTypeProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationNodeTypeProperty"
    ADD CONSTRAINT "WorkflowSpecificationNodeTypeProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."WorkflowSpecificationNodeTypeProperty" DROP CONSTRAINT "WorkflowSpecificationNodeTypeProperty_sensorType_fkey";
       dt          postgres    false    382    216    3643            V           2606    42646 W   WorkflowSpecificationNodeTypeProperty WorkflowSpecificationNodeTypeProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationNodeTypeProperty"
    ADD CONSTRAINT "WorkflowSpecificationNodeTypeProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."WorkflowSpecificationNodeTypeProperty" DROP CONSTRAINT "WorkflowSpecificationNodeTypeProperty_sensor_fkey";
       dt          postgres    false    382    210    3631            W           2606    42651 \   WorkflowSpecificationNodeTypeProperty WorkflowSpecificationNodeTypeProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationNodeTypeProperty"
    ADD CONSTRAINT "WorkflowSpecificationNodeTypeProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."WorkflowSpecificationNodeTypeProperty" DROP CONSTRAINT "WorkflowSpecificationNodeTypeProperty_uomCategory_fkey";
       dt          postgres    false    3910    382    348            X           2606    42656 Y   WorkflowSpecificationNodeTypeProperty WorkflowSpecificationNodeTypeProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationNodeTypeProperty"
    ADD CONSTRAINT "WorkflowSpecificationNodeTypeProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."WorkflowSpecificationNodeTypeProperty" DROP CONSTRAINT "WorkflowSpecificationNodeTypeProperty_valueUom_fkey";
       dt          postgres    false    3908    382    347            Y           2606    42661 e   WorkflowSpecificationNodeTypeProperty WorkflowSpecificationNodeType_workflowSpecificationNodeTyp_fkey    FK CONSTRAINT       ALTER TABLE ONLY dt."WorkflowSpecificationNodeTypeProperty"
    ADD CONSTRAINT "WorkflowSpecificationNodeType_workflowSpecificationNodeTyp_fkey" FOREIGN KEY ("workflowSpecificationNodeType") REFERENCES dt."WorkflowSpecificationNodeType"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."WorkflowSpecificationNodeTypeProperty" DROP CONSTRAINT "WorkflowSpecificationNodeType_workflowSpecificationNodeTyp_fkey";
       dt          postgres    false    382    3976    381            F           2606    42666 S   WorkflowSpecificationNode WorkflowSpecificationNode_childWorkflowSpecification_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationNode"
    ADD CONSTRAINT "WorkflowSpecificationNode_childWorkflowSpecification_fkey" FOREIGN KEY ("childWorkflowSpecification") REFERENCES dt."WorkflowSpecification"(id) ON DELETE SET NULL;
 }   ALTER TABLE ONLY dt."WorkflowSpecificationNode" DROP CONSTRAINT "WorkflowSpecificationNode_childWorkflowSpecification_fkey";
       dt          postgres    false    3962    374    379            G           2606    42671 C   WorkflowSpecificationNode WorkflowSpecificationNode_workMaster_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationNode"
    ADD CONSTRAINT "WorkflowSpecificationNode_workMaster_fkey" FOREIGN KEY ("workMaster") REFERENCES dt."WorkMaster"(id) ON DELETE SET NULL;
 m   ALTER TABLE ONLY dt."WorkflowSpecificationNode" DROP CONSTRAINT "WorkflowSpecificationNode_workMaster_fkey";
       dt          postgres    false    3940    379    363            H           2606    42676 V   WorkflowSpecificationNode WorkflowSpecificationNode_workflowSpecificationNodeType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationNode"
    ADD CONSTRAINT "WorkflowSpecificationNode_workflowSpecificationNodeType_fkey" FOREIGN KEY ("workflowSpecificationNodeType") REFERENCES dt."WorkflowSpecificationNodeType"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."WorkflowSpecificationNode" DROP CONSTRAINT "WorkflowSpecificationNode_workflowSpecificationNodeType_fkey";
       dt          postgres    false    379    381    3976            I           2606    42681 N   WorkflowSpecificationNode WorkflowSpecificationNode_workflowSpecification_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationNode"
    ADD CONSTRAINT "WorkflowSpecificationNode_workflowSpecification_fkey" FOREIGN KEY ("workflowSpecification") REFERENCES dt."WorkflowSpecification"(id) ON DELETE SET NULL;
 x   ALTER TABLE ONLY dt."WorkflowSpecificationNode" DROP CONSTRAINT "WorkflowSpecificationNode_workflowSpecification_fkey";
       dt          postgres    false    3962    379    374            Z           2606    42686 I   WorkflowSpecificationProperty WorkflowSpecificationProperty_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationProperty"
    ADD CONSTRAINT "WorkflowSpecificationProperty_category_fkey" FOREIGN KEY (category) REFERENCES dt."Lookup"(id) ON DELETE SET NULL;
 s   ALTER TABLE ONLY dt."WorkflowSpecificationProperty" DROP CONSTRAINT "WorkflowSpecificationProperty_category_fkey";
       dt          postgres    false    243    383    3700            [           2606    42691 G   WorkflowSpecificationProperty WorkflowSpecificationProperty_parent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationProperty"
    ADD CONSTRAINT "WorkflowSpecificationProperty_parent_fkey" FOREIGN KEY (parent) REFERENCES dt."WorkflowSpecificationProperty"(id) ON DELETE SET NULL;
 q   ALTER TABLE ONLY dt."WorkflowSpecificationProperty" DROP CONSTRAINT "WorkflowSpecificationProperty_parent_fkey";
       dt          postgres    false    383    383    3980            \           2606    42696 M   WorkflowSpecificationProperty WorkflowSpecificationProperty_propertyType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationProperty"
    ADD CONSTRAINT "WorkflowSpecificationProperty_propertyType_fkey" FOREIGN KEY ("propertyType") REFERENCES dt."PropertyType"(id) ON DELETE SET NULL;
 w   ALTER TABLE ONLY dt."WorkflowSpecificationProperty" DROP CONSTRAINT "WorkflowSpecificationProperty_propertyType_fkey";
       dt          postgres    false    3854    320    383            ]           2606    42701 K   WorkflowSpecificationProperty WorkflowSpecificationProperty_sensorType_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationProperty"
    ADD CONSTRAINT "WorkflowSpecificationProperty_sensorType_fkey" FOREIGN KEY ("sensorType") REFERENCES dt."EquipmentClass"(id) ON DELETE SET NULL;
 u   ALTER TABLE ONLY dt."WorkflowSpecificationProperty" DROP CONSTRAINT "WorkflowSpecificationProperty_sensorType_fkey";
       dt          postgres    false    3643    383    216            ^           2606    42706 G   WorkflowSpecificationProperty WorkflowSpecificationProperty_sensor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationProperty"
    ADD CONSTRAINT "WorkflowSpecificationProperty_sensor_fkey" FOREIGN KEY (sensor) REFERENCES dt."Equipment"(id) ON DELETE SET NULL;
 q   ALTER TABLE ONLY dt."WorkflowSpecificationProperty" DROP CONSTRAINT "WorkflowSpecificationProperty_sensor_fkey";
       dt          postgres    false    3631    383    210            _           2606    42711 L   WorkflowSpecificationProperty WorkflowSpecificationProperty_uomCategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationProperty"
    ADD CONSTRAINT "WorkflowSpecificationProperty_uomCategory_fkey" FOREIGN KEY ("uomCategory") REFERENCES dt."UomCategory"(id) ON DELETE SET NULL;
 v   ALTER TABLE ONLY dt."WorkflowSpecificationProperty" DROP CONSTRAINT "WorkflowSpecificationProperty_uomCategory_fkey";
       dt          postgres    false    3910    348    383            `           2606    42716 I   WorkflowSpecificationProperty WorkflowSpecificationProperty_valueUom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationProperty"
    ADD CONSTRAINT "WorkflowSpecificationProperty_valueUom_fkey" FOREIGN KEY ("valueUom") REFERENCES dt."Uom"(id) ON DELETE SET NULL;
 s   ALTER TABLE ONLY dt."WorkflowSpecificationProperty" DROP CONSTRAINT "WorkflowSpecificationProperty_valueUom_fkey";
       dt          postgres    false    383    3908    347            a           2606    42721 V   WorkflowSpecificationProperty WorkflowSpecificationProperty_workflowSpecification_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecificationProperty"
    ADD CONSTRAINT "WorkflowSpecificationProperty_workflowSpecification_fkey" FOREIGN KEY ("workflowSpecification") REFERENCES dt."WorkflowSpecification"(id) ON DELETE SET NULL;
 �   ALTER TABLE ONLY dt."WorkflowSpecificationProperty" DROP CONSTRAINT "WorkflowSpecificationProperty_workflowSpecification_fkey";
       dt          postgres    false    374    3962    383            1           2606    42726 ;   WorkflowSpecification WorkflowSpecification_workMaster_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."WorkflowSpecification"
    ADD CONSTRAINT "WorkflowSpecification_workMaster_fkey" FOREIGN KEY ("workMaster") REFERENCES dt."WorkMaster"(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY dt."WorkflowSpecification" DROP CONSTRAINT "WorkflowSpecification_workMaster_fkey";
       dt          postgres    false    363    3940    374            b           2606    42731 @   _EventTypeInstanceEventRoute _EventTypeInstanceEventRoute_A_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."_EventTypeInstanceEventRoute"
    ADD CONSTRAINT "_EventTypeInstanceEventRoute_A_fkey" FOREIGN KEY ("A") REFERENCES dt."EventRoute"(id) ON DELETE CASCADE;
 j   ALTER TABLE ONLY dt."_EventTypeInstanceEventRoute" DROP CONSTRAINT "_EventTypeInstanceEventRoute_A_fkey";
       dt          postgres    false    228    384    3667            c           2606    42736 @   _EventTypeInstanceEventRoute _EventTypeInstanceEventRoute_B_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."_EventTypeInstanceEventRoute"
    ADD CONSTRAINT "_EventTypeInstanceEventRoute_B_fkey" FOREIGN KEY ("B") REFERENCES dt."EventTypeInstance"(id) ON DELETE CASCADE;
 j   ALTER TABLE ONLY dt."_EventTypeInstanceEventRoute" DROP CONSTRAINT "_EventTypeInstanceEventRoute_B_fkey";
       dt          postgres    false    3672    230    384            d           2606    42741 ^   _EventTypePropertyEventTypeInstanceProperty _EventTypePropertyEventTypeInstanceProperty_A_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."_EventTypePropertyEventTypeInstanceProperty"
    ADD CONSTRAINT "_EventTypePropertyEventTypeInstanceProperty_A_fkey" FOREIGN KEY ("A") REFERENCES dt."EventTypeInstanceProperty"(id) ON DELETE CASCADE;
 �   ALTER TABLE ONLY dt."_EventTypePropertyEventTypeInstanceProperty" DROP CONSTRAINT "_EventTypePropertyEventTypeInstanceProperty_A_fkey";
       dt          postgres    false    385    3675    231            e           2606    42746 ^   _EventTypePropertyEventTypeInstanceProperty _EventTypePropertyEventTypeInstanceProperty_B_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."_EventTypePropertyEventTypeInstanceProperty"
    ADD CONSTRAINT "_EventTypePropertyEventTypeInstanceProperty_B_fkey" FOREIGN KEY ("B") REFERENCES dt."EventTypeProperty"(id) ON DELETE CASCADE;
 �   ALTER TABLE ONLY dt."_EventTypePropertyEventTypeInstanceProperty" DROP CONSTRAINT "_EventTypePropertyEventTypeInstanceProperty_B_fkey";
       dt          postgres    false    232    385    3677            h           2606    42751 L   _OperationsDefinitionCustomerTypes _OperationsDefinitionCustomerTypes_A_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."_OperationsDefinitionCustomerTypes"
    ADD CONSTRAINT "_OperationsDefinitionCustomerTypes_A_fkey" FOREIGN KEY ("A") REFERENCES dt."CustomerClass"(id) ON DELETE CASCADE;
 v   ALTER TABLE ONLY dt."_OperationsDefinitionCustomerTypes" DROP CONSTRAINT "_OperationsDefinitionCustomerTypes_A_fkey";
       dt          postgres    false    207    3625    387            i           2606    42756 L   _OperationsDefinitionCustomerTypes _OperationsDefinitionCustomerTypes_B_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."_OperationsDefinitionCustomerTypes"
    ADD CONSTRAINT "_OperationsDefinitionCustomerTypes_B_fkey" FOREIGN KEY ("B") REFERENCES dt."OperationsDefinition"(id) ON DELETE CASCADE;
 v   ALTER TABLE ONLY dt."_OperationsDefinitionCustomerTypes" DROP CONSTRAINT "_OperationsDefinitionCustomerTypes_B_fkey";
       dt          postgres    false    3754    387    270            f           2606    42761 B   _OperationsDefinitionCustomer _OperationsDefinitionCustomer_A_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."_OperationsDefinitionCustomer"
    ADD CONSTRAINT "_OperationsDefinitionCustomer_A_fkey" FOREIGN KEY ("A") REFERENCES dt."Customer"(id) ON DELETE CASCADE;
 l   ALTER TABLE ONLY dt."_OperationsDefinitionCustomer" DROP CONSTRAINT "_OperationsDefinitionCustomer_A_fkey";
       dt          postgres    false    386    3623    206            g           2606    42766 B   _OperationsDefinitionCustomer _OperationsDefinitionCustomer_B_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."_OperationsDefinitionCustomer"
    ADD CONSTRAINT "_OperationsDefinitionCustomer_B_fkey" FOREIGN KEY ("B") REFERENCES dt."OperationsDefinition"(id) ON DELETE CASCADE;
 l   ALTER TABLE ONLY dt."_OperationsDefinitionCustomer" DROP CONSTRAINT "_OperationsDefinitionCustomer_B_fkey";
       dt          postgres    false    270    3754    386            l           2606    42771 F   _OperationsRequestCustomerTypes _OperationsRequestCustomerTypes_A_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."_OperationsRequestCustomerTypes"
    ADD CONSTRAINT "_OperationsRequestCustomerTypes_A_fkey" FOREIGN KEY ("A") REFERENCES dt."CustomerClass"(id) ON DELETE CASCADE;
 p   ALTER TABLE ONLY dt."_OperationsRequestCustomerTypes" DROP CONSTRAINT "_OperationsRequestCustomerTypes_A_fkey";
       dt          postgres    false    389    207    3625            m           2606    42776 F   _OperationsRequestCustomerTypes _OperationsRequestCustomerTypes_B_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."_OperationsRequestCustomerTypes"
    ADD CONSTRAINT "_OperationsRequestCustomerTypes_B_fkey" FOREIGN KEY ("B") REFERENCES dt."OperationsRequest"(id) ON DELETE CASCADE;
 p   ALTER TABLE ONLY dt."_OperationsRequestCustomerTypes" DROP CONSTRAINT "_OperationsRequestCustomerTypes_B_fkey";
       dt          postgres    false    389    276    3766            j           2606    42781 <   _OperationsRequestCustomer _OperationsRequestCustomer_A_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."_OperationsRequestCustomer"
    ADD CONSTRAINT "_OperationsRequestCustomer_A_fkey" FOREIGN KEY ("A") REFERENCES dt."Customer"(id) ON DELETE CASCADE;
 f   ALTER TABLE ONLY dt."_OperationsRequestCustomer" DROP CONSTRAINT "_OperationsRequestCustomer_A_fkey";
       dt          postgres    false    388    3623    206            k           2606    42786 <   _OperationsRequestCustomer _OperationsRequestCustomer_B_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dt."_OperationsRequestCustomer"
    ADD CONSTRAINT "_OperationsRequestCustomer_B_fkey" FOREIGN KEY ("B") REFERENCES dt."OperationsRequest"(id) ON DELETE CASCADE;
 f   ALTER TABLE ONLY dt."_OperationsRequestCustomer" DROP CONSTRAINT "_OperationsRequestCustomer_B_fkey";
       dt          postgres    false    276    388    3766            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x��]��8��]�~�R��3Y�nc{g��{�� ��H�%���K�%'�);�-+@.Ub1�t��9�R��#]	�b�x���eT��KX�][�}ɺ׺�m�^>���:|������^������_�W�QHld �-�E�8IH�I���@�+�\��֚bs\�X@;ɕ.�$��_Ċ��3� �V��K:/WQ��������h5��R��ܲ����I��@�07���v�^��/��/������X��H#Wj�L�EH0ᴡ��D��͑��J1�Խ�2�^Y΅����B3���_��ՇMI3Җ'�� 8ȕ�tG�����Bg��h�0����rڪ�XΗ�|�9�	 �>+L�mv�r:�z &R��>��X����"?~����U��O~>��Î�-����f��`�4��q�d���̝d#��J��-��%�|!�ל%�{M�(*�*=�U-~�K��K��C���4y-�X
,Jiԓ"}i���[��^�����WF�G m�j$��r��Cj�~8�/ �Wr%����s��\c~�W����t��#�0MQK��01�Qz��!��3��3��',��� �+#�A�����ڈ��>���/���?ni�#1@���*�� �WB�=�x�_���x�����+ׁ��Ê^0w�;�Q(1�b�`O�F�:�}��.�!�#0LW�$M�X�r��V�C>���mc�k�xT�4Y]�Aq-O��6ĹO������g��Ѧ]���~[�	S��'��E.�ǅ~������ɌS0O%���Y��{_v�<*yծ>�I^;|U�v�o9�lbJ��,�����������n[f��d���[��u&�f�k���%a.�2@�"�	��B$��s�����
3��n����=Y�״Ӌ Tq!�N��+;��K��<2��@)4+�"LQ]�|�!xLj��x��Ó�ɊB�q'N�-YU��KUG�߱2y�u$b�w�e�?���W��������	��=yc:����܊��ns�`��R8[��7x�J�H��oF�;e� ~U���ọ�4��|��c����\]:��xi˝�/h:S�K̮����o9���`ݩ���J��#	���-��e���ų l9��ʈ���>�U���m^*\QQ��*Q�ib-�q�*ԋX��cOlLW�����7�K��V�2v
~"�$C)~�M���9�N��_����l&"{r�5� �򫵸�L_���(��*�X$X�)����N�[Pݸ!���ט�k��������-��E ��t��׬<'|U��}���՞�P�d�!�����3Q$C����f��ѹMo~�	M�1H}��6�rD@e�~!�gsm*}�{i=�û_z�؊�P�ҾU��<r,B�0��S�y=����H���VNE=��.�P��,eԿFR���\�S����tg�fZ�N�����{�9z����6������G�e���`�QM_UV��#!]�B�)�@��bj�1�o,�f����#=RBR�aB����M<m����rqz�3����Q�G�cЄ�c�ùۧ�I��<�i�K�RY�s���~�zp��+����,2�r��B�6�'�������v4x��_���_7�>�l�I�9��Gr4��J�bVXsn�M���ǌ[�b�gU#`(Gp{b�ؽ�_����~U?�n�}�Ee^��@�͔_�y3�]H����%.!����Lf�ɝ����k<6��ο����- ����@�L'_mt��w�G�dv*@�J|�4��F�C��F�㱰���?�iU 6
U��S��4_���$n;��Fv�ih6��L�,K�-(�u���#K�=�R���H�$5VAb��v��f��A�>�-e@��\�s�b�u�[�F�?�l��[��*���	q��d��t5��kRB�L����F���\;�6��Xt�0J7��j�MA�fY�R��07�>n��]�����ie�Ʃg�p>����^�f0����g�c�I R��"|��F�������$�	Bܫ����@3�N�a�ɴ]lrc��8k�y��9$���U�/´0�&�����t2��z��e�`�:�gi�����˖=V�c\5����jN0��Ά%�8W���(/Y�q�n�r�u� \r�]��ec~���<��8��p��=���ߚ�m�o��v�~��7��O�}3J "\�AU�dfO6���zl}<$R:M�` ����fm�;�E��c�/����ǲXs8�����*�˒V�G`�DY��U�]Aֵf�T�㙈���`4 ?.��c{>A��!I����D9̎�1��jע��rCm7U��e��,�#���
��,�/�>P���J�p��Y����jČ7D��5�_ h E�U4��X�Wu������ޟ5}�ȭһ2����Վ�5�4v�g[��j��{#�B��[E�.��J�L-�@Å�$族tl��Nv]B?�&�?8��{-m�"T{�Kc�~VAK�M0����f�nu����	��ņ���$�Ji#�U$�|���&N���KF�J���{k�Gͱ�kb��%�ɲQ$�X�l��t�K��4���N�R{�`,��3�Ԛ��q�g����F]R�J�L(��!�y���^����ۼ<6�5�f�^P�y�G�8-�ڱ����O���Q<Ͳ��i��0 }d���{>�J߻AL��@�
�I��6��<T�]���>������r�*--�+6;�x���|S�M�NTr2�*2�;Ճ��y��k�ry�k��=��S��r@c�H�� ʆ{��k��_n�"��jU��^�y_���-�G��O�p2���y0�`��<CzEc>���.+�N�1
۬,k�;��6��P&�U>R��%���[8{��_�=~���$���U�H�5�����M]��L���C�:�؀c���,�:��i?�ښۀ�yJܢd�5��T{���<b$�E��_5N���^���w�p��1O��Hȹ���`�(����ߊ�=�C`�k�Yܛ���1�φ�{ ��Y}���?DHn�T���b��w�YW����Ҩ��])����!�Of�䞴\��ڍ��a]U�|����<v����M'/����cWcs�ܨ5�Ϫ�= [���F��d^�OE�o��3 { �;b�(���it���(����=�z.���Tp��ѥ(��4ju��8�t�_�Pxfuџ�M��:���F"n�`�`ѱK����Z�Ha�f	B�%؄��m�Sp�5z���Y{�w	�G{א��'�{&�!���87&�:�7�I��=�8��!u݀�����Kn�W'{�Ao4�I��1�ΜhJ,0J$A�K$,%�o���o��l���zC�0#J�v�/��g��1�ދc<�,�&<"������UWи�
~��`w}3<gG�S6Y���a��n\ga�aX�{�+��� ��m�i�/��K����#�z��h�͂`��O#E�s�IT�O�6z{��o�=^�&�X�'�ʌ%���%����*#������0���[A��$&�pV̢:t�Z�FRuT>�����뭻��G&e�
*��|�!q�r}"��a��ƱN�����<��'f�#Q�b%�	zV��
�
�ྟ��%~.��x�{����#~���}�'���Jki��J�8MP����mM���ǚ�i��Z����K�B��[H~���覰N �P~w��#�}O�eSD�o�rF�y���;��TWD7��!˗dc�j��FY+�7�qN&���Z��`rewq�8%v�ի�Fn�������-U0�����&�c��t"��9�>Wћ��=8��w���_�3�ɔ{��ʦoQeS~;�sz����5'���>%�1�[��˽\J}���=s�tV8Yg)D�v�DR;6�P�"3u&B���m��šI�� p��%��,q�U��?Cۦ?2��*��T�)�iU�����q�|�pãX���Vu �����#��aj=������Gr��dw���� �  vK��5��5�0�	��������1C�l�'��MuI	5ݪ�(�DZ1I-�X���|b��KCXw"���U���vf	1Wߣ\��V��@(V���	r�f���F�;����P�r�0��[���lf��{b;�0������xø8��n�p�~Al���O�&j"��ӓ�}p�tR#���.����.��+���r.E\A��h`^L'��GE^����l湓[�ܯ�bjO���ĭ�Rt����bۆ`�*&�����
]�z_�&�@Uրlccc�{{`.X�*���`�RM+�������&q���wd�@�4N�D�X}�x���t���Фc��`�]�h�1]U���j��������iT?-")5�����fه;�s%J3k"J��Ù�U�Z1�c���y�|7����ϫ������~���ޖ��:v
u7��H2�8n���:%���ٛ��������i���9أ`�ݱe�E�oqx�9�$�ڲ�ϫ�����i�r���ۇd��
���9��t�/��{�N����G�>�B�Z��rw2=���ƪ�(�5K�^
Oá���~���Tx���J��`q�:u魚�����f4��5�&/�[���t��������T5�B��2����7wB7���RFEa3�M���:��Q��y�=��T��6E�33�T��]����L:d��>��9�C���Nlʦb��^�;�*����$�A�,nN��vi�K񚏃[�[(�n4����	n����UΨ>��BK/!}Q̯�����_~����o�w��J�1#"��Q�5��n�OQ#����_�wY����"Y�م~��\b[�;����\o�q��ynV�?S�-
p}�;��)+k���m���G'U���d8v��t^�ݼ����8��x%��?���/�E�Ա      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   -  x��V�r�8}V��/���1��lm�f+�dv^��B\���_�� v\C�o^lu�9G�}�1-2�b�I��;?jF1��F0);�Bɸ�x\l�y�� �2:�x=��7(��̆a�n�|f"i���E	P�fu���t�8jb"��v� @��a��79���{j"4*�~��@E���B�{$z�^��:O�{=Wf"b�G4M
�u�U�g�����)͗���$ �3�N3�ܓ/�33=\�%ñ7�d�Ɇ�� Zw���/��+l��IB����FiD.�����jT{J��M���&�t2pє �+�����H���L�1v�T��ķQ��F���XC�=���m�2-�3$n"<	�(w{0Ԣ��|�g瞽[A�����ͼ����*���nd"A{hK�j@<qR�4����}��������F���ȎLE��D�h���L�*���������E}�OG�ڝ���B]���y�z&�J3	�-��ճ��ie�@��_TՒ��udk'�k���	���*,ͥ.}圈�5�[t���sg�Ϯ#�A�}�EtL� 5�Iʐ��*Q�J���s��|ί�����	D�]�C��#102u�r*p?�7c�߿�>��;��
��OuT�I^�Z�O��|��gt�
bl��Qו��H�1�]7���)<��!�u� �~7�Gk:�����X���A�'�H�G	�v�Bx��J�,�D��!��Lw���k��8����E~�5q��.�q��9����?�{�.�s��-�$ݡR�T�Qz�t\RA�h����z:y�Kd��Ԯc� �l�ե+DQA<���l{@�H=�L�e`*�l�>���Hc�clg��q'�Ι�-sR��>O�x?�7���x`�-�+r��?n�Ժ2/���,�z�EQ�#tUyW5�����B����"�:����͉v5�N��uQF��\T��y_\�ʼ��5u,�/�Z_�U9{~�BO�&�[>≲y//K��嵕��q.��}	���w���PuY��-�b�ϣ�~�[[ԍ���[��RO�:�������㷛���	M`      �   �  x���۲�*l���&%0`�]rc�m>�y�z*��d�������/�n��a{��ʺ�����N� Hw �.Z�f�������j@��b*��1c���^��?�ht�H�L������b�ļs!�z��� �k���SM�/f�����m�폹S�[���jw�7#\th�hy�*�͑a���A�hiٮ�?�֪p>Z��q��Yg�L�]���P���<�Q�uƍ?=�Lp��-��SW-�a�= !i�v�nrm�ǔO�@(��皕R=�1��7�FGm[kɦ���f��ZL���I>8����,�9%=�������?�R�m���:N�S�c��hy�u���1�� [��䇶���:RMȹ��Q=��a(gST���f"2䤻��,Z��u����۽�w� 3�r�雑��0
tHq��������;�h������L�#j�j��L��I�״�QI H���?�i�1�A�;��<����^I @)�oJ��c�i�`U����۫^j�(��<��_y����Tߏ�?f/ܛMz�*q�y8r{;|�B1��@'���1�z(��k�9TL��y���P�)v.���Vm�N�B���v04v�*���'@����%̼|��b�M'}+v(6{�9f�V%̵Ĭgg�yh���4q��l+?~3-&�qhI>�+�$�o_����e,Z��.E��9���:uR>����~�O�{j|R؊��t����F�1.���_=����`�	�`�)F�Aj�gr������Σ�>d�B����8S�u�6�d�s>8�����\���ʌ�z[��Ũ��ps�Y���$��!Z$8��g�1�=7 :�5}i�p9�-�w�x�ĝ9&�R�Su^Ǧ�����A�Sm,I8W3��c�'g�^���2��ַ��F�=)F�{�T���rc�J]�Q��5��1�^&�E�0�V�?o���-S��P�t4�c�j�6���s�7��-��<]@Ff����k/��kɆy�D��Kh�k�Rs�Zlٞ�̗�m3�D�uZѲՑ����{�ٚ�v��WJ��w�(u,�My��1=�x��;O�
F�]bD9�����ꆷ\��i��\���6s���EF5�zH��A�Ǎ Y����N���R�������cR�`2��/^V�#2ˋ��w�z��h?�;��n��˝g��9"�tz���6G�EFFL�d�?��>��E�-2�ۍJ�������h8#��m�R�gra��{��%�+=�e�]��`
��ӑ�x`Dܙ�EΟ��x'atsa	)��g!�sL+�
Řbt�Ɠ?���@���n�Cd$��������"$=x��l��Lhs����O�W+�L��s~&RHuv�)�L��E7�p���(��ef&�g�3`����G�w�d�M?ω�[A��K�[���gMe�%@'"C�)8v���;��#2Ǣe����3l:G�sd:>�>9�<)2��p�w������T`r_*2�n
�yE��FQ3�Ĵa'C�g�9e�cX�д7�a���i�1$�̗z2:j�yQ�eGd�I���;�l+{R-AF�����䘻��$6��,��2��<h���8�a��>WO-�6dO~s��k{d�7e�\�@�6���Qٹ+�7�0����mh�f�׹u*�Ȱ�����k�)�4�A��%_k��~U"��e�5КG�:�����.�슇ڦ�,��H�{d�<�"h�9Y/P�m�c�u@�=�U�4�!���,9���F�������$z��4�?Yw�`o��"�Fd�x,l�r9��ðfQ;��k�s+�	�Z�Ƽg��;>�0ST]�kW��3���CXOS.P������������t��4q{F���pa��~�X5��<`�e0O����~,�o�>��������|�̬�J��ػ�32���Ț̬���83�L:\R�o溶������TC����ބ�22�]�`'��S\�nʝ�#�g��|m��y?�>:zv�\F_��vc��>��mش���4U�#u�<��1|������~�}����fzQ����-��П~C���Fl��?�����{<2O�bO1���KvԪ��2a���#�0�b^?�G%VP��X���*J��>���k72�i���Gr�l����K��:q�ŧ�"C��ř�Ef�d{�{rkn�D���Z�o�E�<K���34e����AF�����y�p���~#Ff�5��Ef|{�s��7dVg$�.��R� 7�f`��z:%�N��m��y�>E��9��}����Dd�����WdPt�:2����z{��aF�~��^d$�3��~&�t�9r�j��-�72�����cf?u��U�k�W�w&��Z
����;(g�|�w�����B�'�!b����3�c�0�ؖ��d8�������~�s�z�߽22�.`<�)YR	�f�f�����-2[�<� ��ט�L%�S���c���ޖ�U;�^�%6�k�5�alOqݯd�J�9F��v-)v���#,_���XH���\՚��L���Hz}Z�;�}����ͳ�Rn��u��}��#�테J�{WJ,��s���I��pv~v��9�yE�/&2�cˊ��L|K9'��a�i������%l���4�w���J�b��5��s�
8�'M�LSY�f���9@��o�h�a�߸�)i�A��W:�q���2��N��֌�����z���S����1���OZUZ���K��~�}�đt��.��|��"���2��kX���axk� ��,ٱ��1T6+�E��&���=�"�:ԩ�LyZ]����}�Se��`�J\��2q06�.���֟�xH�~F�%2&io��d���ة��rN5K��ks�m���L��u�s=�|0�u
R����~�y#�r�=퍻}*F���FZ��&�Aו��W�c�.�aj�����s{��j�jJ�3UݵᴚcpN
P���;�f�_=���?����Ӑ��      �   ~  x��]ێ�}�~A@�(�11��@�v^X�B�Iݨ�קT3�xw8�rs�����F����CR�Def�Y�.�n��n�PK��y�1CDr�X���x��OO�����_�$�w�I��g� �����ɸ����)%�O����`��A�f������_>�;hb�#VB�bk��9~����C�}��O�e�$��s�|��?ﺋI�yL�<x�C��mw�(0V��Ո���ͷ;N[��q��"�� �b�XmL�)�?w��>aHYz��7n�M�]�q]Z��<�p��T���3!���������E7���vg�yf�u����4�[�q&i(!��j�����k�X�$��>�x��&�	:���5��1 "��`$���x\�'�n�v2�uqw��=�v��S�R�y�O�������|J��?W��%!d]��-cK��/�s]��$�Ǝ�Le�}b���+"c�/��bC!mb�7�1�����g�4��[)�\�j��V7�Kp�E����Լƪ�`�e�sH����2�Z�߯o���}��/6�'d�K[��,Ln��o`���9M�513��^����b�ҝ�Z�;zy݄&������ڽ�6~���@��>�㭉�z��y��}-$��DR?E������&�0�b ��vm+�7�c6�倈~��'�;r��]��K�o�A͗��6�� fDK+f�D��C�`/]ȫa-�^M#-������&�2�(��/,~�;��_@`y�WA0�<%������"ߋJ���D�kޅ�\{F�S1��ę��y�9��]���*sv!'��QTf��v�޷�!4��	VV�0��w
^����=�5�e8d^��*�9/(���D�B�~�{\���p6ԉB�%������/h��>��x]�x���FФ�&YD
�3Lv��B�0�u"<�j���.N�&�C��f�`��'�=���b�5G���j�������_�D��h�D
d��2���3��!&�dښ�]4���B��T�XR��5�$*k�Z9�8?�B��}�P�9�ynq����}���nA
;`3��P���y�������4rp-c7�#��_G�@�M2�+1N!v�^����5�h�9����	J�9'�`������F	#2���<�P���=�>~��X��F�Q�4�a ����K*yL�:���82z9�H��RPq�CYaG�t�p�k��)�:���a��
�Xr�飦���[�|�%%���T�1Bc�}�i�Gɾ%�_je���<��(��<�Q�q��*�� ���5��;BgB�뭉�������T,s^PB}/�� bܼ���L���f����F��y�c�F�"�� ^��ɽ�#�r�:��L�=�T�3��C�K��q�ҥ=k��	*���/+	�I�gc4d��lKw��bJ�
)n�սY�՘xVb*3�6~Z���;eY�!�)�d�Kћ�R��}��%
�x/^��]}�h�G���"�bF4��SJF~(w���&���Y��!z��$�#PÎ�$�	힇�BD�PH.���_唬�b7y!�{����X�)w��0k\p�H,2���y_9����0����C�S�V��8�����i�K耣!�&af5�℟�^>�B	 %�܉A!���5EDV�u�>4y
�ԫS(T��cyaG�$��ID�`7-w��zP	�}�Ј r�Z��ɰ,�;--(��p6a8D�.���0��qtO=R+��!��w,�Y�mM�#L�	�G5���A+����BL�<�Mq;'(�����.N���CL}#s�%e~r���b	x3q��_-ɽv��	�fC��M)��N�0H�����_k���aBN�����LG}�����Î��&.`�M���)��X�G�� ��[0��B�����C�U�l�V���|��3�_*���H���K ٗ�i���s���Z��*��Ia�lA4ؼ
��zi\<fԄܐ��"0M3�# �y�ip�i=�ۥ4������g�޹nn9B�q�HI���(8�������IM�T����A�*���|p\}Ȍ)t�x|w�x��n~o����s�c�Ё�A ҥ�NS�O�aUUO/HZ��%东G�(�l߲�ܸB�X|(B.�ĺ:
%�;�oU�6���o~����8�h�A�-X�1n�[�c�N���.͏�&@a ���Q�u����F����h4?nƑ�v�����`k������%�$��$\1��e�^�i����?x�D�g�	���F��yK�泅�(a1�Z17��1;�����Z �����d��)��JL:P��&�K�.̵���KL:�y3���wܴ�Y|����NbkŇ��0�V���:�������,�LK�ɢ�NR��ԃ%��E�җfy�I�։�P���䮯=IQ��!���C��܀%z�UE˫���bRR�c��B��S1KB-t%�1��GLJ�;D�i@i1 I������KLJ���i�ƉP�$u۶�O��n>�	�+X�T�m�&�}����B���4A�Q|`*�,UN|VŤ��K�#�x�TQ{^Ťq�����x`&\���GW[1���ĤqД1
��0�ѲNz�I1�(��t)K��	��%J��iƹ�&MŤ��#T��
�D�J�M��j+&�}�4�L�b��dZ�>utӁ���Ӯ`)���7IV�l>-1]��b��,��h{�����NL:P�%���j!+;/1�/�M��+a�Nǃ�N�n?Oi���4���mb9�T�R�.d) K\����I+�O�hA)K|��a,n+C�5��N��` 	�����!'b�*&%���n?�� z(�H�%�QLJ
|(1]��eb˅�])=�p�Ls�IIuG�8(m�Q??�:m�Y�.1)��c�) !T\�tXqR���I��1	��:<~��2_��>kLPL��t����Ϝx��ݬ�+wXŤ��K|r�/�h�y���ϊ)�ܐԞ�bR��!���c�`	CҀ��y����Xb���+�Ԉ�Б<[��M:�5&%���t��B�P15���źĤ$����0@k-�b��;�b�8v��Kr��e���L���.e�21������,��7O��t�4�Tn��˶����S��*&�@�L�AkK/��t���AL7`�,��I������ަ��Ӆ,]!�A�`���[<�r�L���Tw��Ӏ� j�D?����k?Ǥ$���&ou{B��W���<�����y ���_�1t��́3����CA	M���j{1$?��{��Q��Pԥ����/�ݗ������Iז���Q�c'=x&X�n)��;w�κ�s)KWv�W���?��M���I7}��\�j1�h���>�����+�}��p�]�����_������      �      x��}Ys츱��+���$H��vx�8�KG���D�Ipp_�$�*�:m�Α�Z:Gw;$��/�#��ğ[;!�Hkb�vl�U]�S�������)z"���[�<�槟�ן���?����N�?�����?�^P���j�P������/_YBbN9'���_S�jzS��>��S2!�������D��������J��.Q����Ův`�(�bUOi�y����s(~EH�Ƅ ���z�,�'|�_	H.M��,Ջm�RS���}�������]�����2z���_���?/{ ����R��l�{�7��w���ֽ��Puɽ���)����[�\����0�?"�.��"��+�T�K��D��I�b�s����v�U�.D;f��.��v���Y��|��V^���wA��X�X�E��/�9%k		|L���~�������	�����/�����m���) ����@ �1~Ŷ]#�P@�8��,D�^Ha<��QL|�6
�/�`O�D_��S.�{���x��6��U�e	(#�ҦC2�^p�_!�_�[��&{�C��{M�܄�l;P5���P����2v� ���(	�~,��ί��d��R��(f����ס�mD�]���t=A�th��J�RФN���N4bxB���kizZ�	%��g���X�g.J�X�:1�k��@*s[�*��{Z!� ���ސ�/V��	v�9��:��VF�,�5at��Ӊ��we�k���/\M��L1�P��4��ܢ������ϿTa(����?��q�q�V�|_�U��Rr܇Z����bq�2�Ϊ��s-�u;��6�H�Lw&��]$����w�_�v��������	�`Ev�4�|�\6��~M���]u���ҿI���=��׃�m	A��d��
��:_�ێ4m3ң5����u��f�,e2|�8��9��e�fZF�. '�@�b��E���?�B*/�=��Z�zn�$8� �I�تu���8��Gj-��k	�!�'��4�F:XB��ŭ礲n���t�e5G}��'B�B�Q�V�	��[�~y��p���	E6����	���!6`���z�R�՜�2(����C�
X�P6���B��B|J�̨F�|Վ���]�ÏM�T2;C�����{�T�*>�m�ڲ��C��"R�Մ��Yhfj�O�7��Z�ڜ-</S��[#�������j|�M_��i�_,��e��a�Q>V���u��������ɱ�ҚX#
_PsX���rLc�'mn�V�\%g����T�5O�ЏnP�rlu��@,Ҕ6�e@H����[�����ژ�������񵀯��|ч�gx'�.�!CHH�.1̎ݔ�\��޷xD����TQ�31F"| Bh"��3�M?��w	�&��h�13�����E	w���e��i!%�\x�))�%I@��L� Ӹ����	�R(��BcqXU��<�+��Pj���ܲ`ii�Չ��L<F�#D�5C���	�&�	�;;�� S�ny�&�+�<DY��[A�����<z� %D<�(C��j�FB�Őr�E/f@��mo�����!PV�r�(%i:)�S+�Z��>*T���	�]�}����{�p@jR����<:������1C��msU��� S �]M��Ҳ�m+�i�`�`z�������T�ߘ�]4����j_Y�$�tW����B�&$IL��r�R6�9c�c'ma�e���z�� �	���N��<�)P�Hс��x#Ϲ����/�f��o��O�j~�M֛���`�f8%�!ûC��9��=���K�Ӣ��\�r��W�ʦ!���a;���V~gAȅ��TX�Tk��`��<;�����E*!)�	���,��J�n>���"t<��m5uZg�h�&�"<M��V�-+*0uƅ9m�'�9�[J� ���W%�.
3[5��5��Sg�.c6����of�nx�$��=y􇜄i|`E�A�kB�l���6�G�m�F���VM9}��R��g���Z�}���߿�gL0�=���wH���vJ�!Q�Z�K=�X�/4�H�*��"��x��kk�΢`�;��ln! �^_s�ځE���t�ⷨ9Z!���Ԡ�Zi%�B�7\�����姇��5VX]�u�����T��Į�1��D���^�z&�A_�9�C����A̚b�#�TY�[l��xa��ܗ0-�)�ۄ�H�b��O���\lR�0�xP���<B_�9�]��X���CDwS8�֚s輻��Xu��כ�	�5�{�� +���LM>��������
0盘�6�rs��х�Z�SnܶQ�ٲ��MJh�:�44.����>)��CI��bA!��
��p�s"C�)�1�7Cc���?
��4n�QP£�����힕�ƛ�"l=�#����/V�\�����X�s3�m��MH� !�,�s���.4���-��)�R���^�{��J�=G�,�2?̆�^��Хԋ��uaY�M���1�G A��E���fS'��<���L�Q�.���f��D2�����d-��A_�P�VhY�t�9�'~E�<�1�^
����T^��sez�P
@�����l�oTT~��2-A2���o�z�$��x��=����a
�.FW8�pO��)ɀT���_#!�W�yX�#0h��6g̐���aKT������?c��:��nw*����w��-�"���}��zխ��Т%��T}K�#/=lh1h�6̕�6RZ"A&{$Ez]����H�{���6���<�.�:	�ӗRd��ê�Qt��x���+A��i�V�؅����8�����ƉrZ�X��k�.�蕘XqGX����0" +g�Xzer}7_⽞���F�� 	 �b>/�B�_�j5]Ѕ�=dngrn���E��tl�19�;��9O>�T�����Tݧ�lOpᯥY��Kxկ<��|�ʊb)�5�ѳ��?JY���C�B�՘��ǜH���_�pw8lO����?���]4�'֢��XMG
��	�w�)v��A4:��ķ���y-� R��{�9r +��M�Jo[#a5vɌyܥF,�n���Z�"<ר���������^�@p	�[MY�[jקf?<�l Úi��-l��e�}���cDCc����릗�J��0��>[D�V$�Kb�u" &��
V�����+7�pDV���&i|O}��d$""0D��7�U��h.�쫈��R��'(s��/Ak���l�!7Aٕ��]Ih��p1�����$@�"0^��J���=��^��mFQ�I��	��J���ڬf���A��쁗[Q����(Tj���Ah����8����h�eH"J�x,)���D�>�	cxaN����w�t���a��۶i�Y�⏭�aU֦AQ%���6��F_�Yf�F��<�����t�'������A�E�mj\<�$��.϶���7Ga_Q��U�K���8N&#,F�c�Hu�9��b�
N��e��po��sĽK��Y�=@���9{��˼��.�����1|I�%�M���m�ݳ?e����Y�X��}?������Z��<�o��-�v��6U�	+Z<�L�S(o��/*nn�t1*��|��Ł�����4��oG����S�j�)�(,D�q�K��(w�5u��0�Ϧ6m�c. b���L�N�$`i?ݘ��B����I�t�H����3�B~���</�����7r�j|��*��H�[s�J&au� ��.�JU�ײ	|a���۬��7�ߡ/<=PS���c�Dv�k˲`�r0A3����
۽����eك�q�����S��)�G�0H��[(_ ���t~�}���?�cCL�2���=օ牰���&����6��h�����Y��E(�[�S���M��*��O�G�<��'���<7ڧt\����f��ܕ��o-���/����`��/xg��j�,���ĖF�eQo��{n�bPK��� �K������lU`���I��E>W�nv4�-�    �I�g�S�u&��h�/ĝ��+3[8
�V}�Dx���`�Bѽ���TRx�A���%-�n�M��*潏'%�xϢ]j"y�U�3��h�O�ϖ�a"OgJ��l	��4�߻ ��Xs��kw�"�1�m6���@�?q��o5:���g&�'*#WpY�צ8��
���f� �,p�#�H��"\z4����Mq�	����Z�5e���	hw�o�/|X�5|��bm�[�R����<��g�ه�_q�;$�O�|�Z쥱�8ƶ�bf)1ltT��h%��[���{c_��U��z9�,FÝ��B�ʭ�M-��I��t`�1�}dW�� �������6��A*������I�����x������_��ן��,
�r��0��:����%���u�w&��q��暐�ô�P4U�	��Ë��R����e�T֬�0��nH�#v��~	�%F�v��h~�_��a��ru���yt�歧�
"3@��jig.
�9���D�j��1��`�?U��`�w��9u0*	|�*�pwJ��=�;���9`\M�_�.S��L@ ���Q���sJ�����u�����(X�4�F�v�_ڱ�9k�C�k���7+��P��맍g��,3a;zMѤ��n��vQ�;��r�HG(E��Q1���o�n�	b.�3I�dQ ��ݞ
�����{y)�f����BH���d�g*�Cg3�S,�oE�6��ޖ���H�O2���S��ȕ�W�����o���{���ܤ��;N�.&����2�ZX�N&�}���{��'K'2s(%��j;�ʚ_��y��I�(	���xgӥ��)\��-�	��9��O��:�8���h@��
��C#�H��v#Î�fʛ�O�ҫ�ܛ@���%�e���f�Fʢ|I�Z�$U_�Ӯ~�8E�޴ \XQ=@r����ت�*}j����{}���w�-��������Ζ�C����	}��@���w�y���ۦ	����;�fE)x��h@�T��1A��/gh����x�bU�4H�t<���ή�H��H#��sr�U
�~YS�)p���a:�=X��ށD�6q���Ⱦ`�kOn!��!���n4΢�-��On�6��5�)a�<2��ue-xםh!'iP*�W�h���;
��"��ܻ&���L%����~�V��7�`� ��^l#�-l�	�6C<RԽw��)�'�^�XN���� �j�n3��	���ڑ���?�����˨����F\� ���K"Gȃ�r�㍍��w����8��H��H�
��[���^��s���Tлb&����_Zo���S� 8�I]=�R�y�:}��9`�3:�\G��ǋ��6�5�A�`8�M�\}O���Z��foZ9�pb;����jŝ�:AK�R�����tqnjc|̵�#-�c�S�J�0������A�wN5P���ʳ�6M�%�_��C��,e[��o��߁��?�y����6���������Ё8���#S6;9{E[�G��Q�);�&����XC����Qõʉ0�=��r�������b�sqO�%�uN/L�9��Y�|�9<����:3�%�J5��=��G8�� �`,;�l���2#�`�����ːf�T��o�F��%aJ	'r\�����۽�?�, &�C^��4o4������f&���r����]�0��;`��j�bf����t��Z=C<�!F�>�K>��S���N;��<&l}g���h��^�r陗{o1�� 
`6�Y�e��q�{1�뛶�K#kt>Lȯ8�ͭH~�5C�&�w��E�����å�r��?�>�Q��PL�V���Ĥ�ӉĻ�z!�:�K0��>�C��Y�'�qw<�@�m3�m���42�U��+�@�
)�sgv��N?�Đ3Q���(�4��*?_��Q�d����J#�Ā���y!�4(?�_� ?���ZL����w���b�6 �c0W�ǻ��<���=y��A,26X�WF�~���\Y����߅5�����m�ҡ�/>�F ����kU�KkYN����w�̄S����N>��dGVv��M�&`*��F=����d�7X��63���`�����F>�����W����Y�ʡ�m����5�; F�,P�Yf��c���As����:4Q��b{�D����z�(�R}�{��Q��a<�Ŧ���i��:�9��U��]O�l8��7���(��%/���룚�
�q�����ķ�E���N0LV���)_��.s����U����s�3M������}��!:���kU��n����"�$���Jh�YW��i���,�w}� h�(�5��:�uɺ��$�ڝ�Xo����3=�)�J�F���,��9!1J!���kutv��c0c�xp2��1-s�6��c�\3��2�ý;��?�,��;"L��X���(0	?�F @�1�MӎI������s�2��KbXY��"v���}����р� ��F�KCʹ��/ˬ܀h���Gy����[���E�.ġ��[�Sm�y'L�b�b>w�H��KE�'F�����/��z�.�v����Q�~�Q�����;�a<�%�Ɲ6�i�u�]��<�X6�+�M^|��T�ؼ֣���4�Fd>���������W�m�)�גS�/0�'�'��1XFǳ%����;m[<��7��1�{wn�s���u]T���^�";�!�z��O)Y���>R��0�nչ����Oj��r���"8���2(��#�4��;sR�UU��v�=:�����G��c�z���.��Rl�֐�glp;R�i��&�?^,[�M�6��Jkb��Z�#���ݷ�?�1�A5?��4+�fB���ļ:�d�̤FJ2����gJ�C{���/�4��+��?T�QC�L�b��~�t-Y݁�O0Z�x�fu�7�W�����0�X[D��2�*"!fу^e%�Չ0�17$]>s��] | E�?�V�l�Δq�@�p����b���W[*c����-w���A�C�Zx�bPD�bFa�Ğ��iw��f�<F��Lƹ����֑��(39�Aa�n	��TZ�c�M��7�p������[	:�ym�ym_�pi8%�����
��3��H����W���1�|��n��m��`�p�v��X��Op}ħˎ���YO|� ���J����3>vsh�b�z�: I~Ȋz��3��u�az S�-��(7&5��]B�L/R���b���W��`Z 3�0G�m�i>M��lQՒ��8u�4�7��;5ƪ���Ȼh�M�8��|��EO��QT{մ7����sA�7b	����P�U8����b8����@�3~P�����AH�����%��%-NA[f�S�C��G�v�����6����,�hF�1zKJ��m��$�C:���{igxm�y�w��J{��C��dq"�`'HDD�ը�V�0�o�䇫�fu&��=͑��·��\��f2]X��b�&�g���#������X/��\7�>�ݥ�\�(,&:ٙ2D1}�֗�LJ���
�)XĎG�l�uiC��k���/�W߾��g8Gl��s� N-t��VY%G�\����QQ0�\ T�A9fxeZ�{}�M��8TVbW����"�TĚ��/KK��D��ԋc�P�T���5ҧ����(�UY�˧�v�'|��"�^�l��uj�PQ��.�U��@�pk��+<~Ne��^��yK�^��@�4��ʉ6~�>$d�_���E=A��鮓^��N����^	e���66�xfÊ�;�T������%�BWQY���*�����'�ʬ��~b�ѳ)��m��?�b��e���b:���Mշֱ��'����-I�\Ug��:��a_�)�O��s$2I�-1��_D�Ԟ��D��:z�S��Eֽ�~��@����>-37��#r��~�J�WC�8�R�S�*vb�?�g8�*��G��y겕��C�x��V��i�Y���K>)UM(G9��[Bz��R!>:�1c��b�䃶�He�
��   u��^O>R��JjF��@�Q�6��IGL�p��HV�Y���z���^�acؐԍ%c�ǯ�^�^� *ӑ(�t���$Y�Eǩ!4�QN�^LUc�dE��]SYe�� ָ�++�d�Z�{�B�ƕ&�������D;Xl�%�>�a�A�m��N������1{#��S��#�t��``�C�K9m"V$n��d
����{7+�+MrY-�����R�'_S��,��q��t�h2�{]��XTg{<���W�KO�4,B�Zt�V���l�,��	��(���/�����n���f��:a(��a�<�נ��+�>�����+�P�����D�i��jw"��� �_Xt�YF��7}gF��a�����^=�U�\B|L/�j6�t���{����O���&��`3giL;oMO��)aW�%ʤ��ܼl�ˉ�e0I��4&Z�P���d���06�a0��b�/��dr�/�~k�\
pMD���$[�R$��	�3L�P�J��^@���0,�jG�-�Lֆ��d@X��ʮD�^��W�~��.p��r�)�O�c�1:BAW-�9�}����uO	���&c6̠�(�j���4�to����\�x���0��&X��ԋ{he��w�8$\����-`��}=�A뼶�Ri^K�FW��MoX���,��{�㞄�`h%J���o����,������VG>մ�C�ڋu7��0����	��]/Y�`�MM�Yf�1u�G�z'�4W���NZ�`���D|��QJ��7-�]��xM��ps�|�~_��ΫYYĤhX<���ғb�j|PK�e�b�ҭ��|�r �.�F9�A�ڄ�Խw�s�ɉo�%1���&���	!C>��)R�Ma/�s�kX\��1�9#��~��*�Ȳ�얘.��� Y=d?�~i��K�M0Mn̷\"��#���[?7���Y��xM��P}Uuˆs�-b�d�T���|�.�w� |�������޷�|�.�L��?�f�q�����K�����yG�b���P���K5ӷ�������b���g�a�^��䗚��=����Ky>L��n��%��1�QS-����0��	�r[�7�<ܪS�u'H~�veT�p���a~4}��0X���|���۰��٪�i���H-b~�!Ch�@h�:��l�$��!�9;�������ɨ0�<&�.s�A�sDr�S�ΐ���rӅ�ST�����׸��%�ⶴ�e,�tS�X%V�+3Ӛ/�/�>4�b�mbA���@���`-�'��L�9� ϴ�T�A棘�9�~�����t 	�����5,����Q�ݲ�D�3HB���5a,���$s� �ΐ�5[�5-]�W��{tc�K�#�n��إ*}	�A���.�A�
��e`�eMTE���) ��1<~���O}j�a&�ț:b9(���Em?�����@�mw;���Q�3�����д�K�� `�}�&����YԾl�W;6Eh0��Q��#��� ��ϙc��p��Un�	�����$x9��t����Kk�d)���L`k�Y��,�&M�L�(ֻSʤ��@���Q�]�#x�
�x�.��ݒ&S�b��?*V=����Q�	j�R4h�{� lV�g�\�y!='M���T�^E,�HڶMdd�HB��@ߚ@d��Z�;'��E4	��&�$/�hτ��i�!dm�0q�j�=�ӥB�bыCë���[��`���Q�@~@;�n��f�$�c1l��XE?T$��K��nm5��J�s�3X��A+i�p]���Cv���Z�1Ƕ0H�H��B�����z��s�XĪa'�y�������;��oQ9���&g��n�^�6�,�Bx���f�GM������w��Rō{>|f��$J�6�.mC�Y��~U������]��8��h��J��h���������5
�A�8K����o��As@���Y�k[�@�|�9�G㻬U�{��tEs/����CÍC��H=�>�n�=� H��9�`/B�%É��_�փ�NB��o��c�X�,�|��b��s�e��Y� 0�&�|�qZW,g��>���'�rrg���L�ߕx�&sC��K�h�$��ך�P�^q`v8�q�+�1dr�ؕr7�㐀vX�3���e�ٱ�� �^M� �s��%���2>�K'� Y>膒�E����3�����w!�W�A\x�s���]ܹ�s(�9�t`��5I7������� C[<���d�2֚�^M�u R�
���ޣ�/�0U�	7��1O��A�f(`��k�ً{8P��]\=���X`k8ѷ� �׆�Ҕ���qx�}o��=�Z���H���Җ�R���ꦻ��7��Ka�P*!zO�?�W�\�o�u���Ή�_��^X����s�rꕂ�/u8�lȨZ~3�@��b��,�r7���h%Br�k�NH��{��ʐ�\U�A�}�$O�6���|_P���41�yk���	�aZ�&�U�%I�Ƈ����'�zh^EH�V��S�Skx�W�*%���k"G�{�~���񁻭��:����I^ީ����l�2 V�I���u��%�����:�����n�����N;�$���i?�QW����	��X��.��^�|�|��p��M�mv�	�����,����^c�������#yX��u"�,�Ex�N=KU'�M������{kPԆzL�@?��xf�r����0@� 
C����c_^Ihh`�C���<D�=n���a��\^�������:���      �      x������ � �      �      x������ � �      �   �  x�ŗM��6��̯��[Ve��H�"%�hg�\Vj6��������d3���d��-�*���o��0)8��X�bE��I|<�OUK�i�&6�6k��46Ȼ=�������� &�<Y�uS��z�ާ����՟w;��&Y�S�s���2)��4@c֚�SS�{w�óu%��-������z
" :�1k3Fk.�.��@d`=9��"�v�' Q�l3�K�4�7�թ������,�O�r�f�/�=^��l�p@h�1�:��`�W�ɉ���]��%�l2	�����FǑ�d�<#�ѩ8)ʤ���Ͽ��46������d\!�B��n���z��
�����\�z�T|�^3 xv��/~�.@�s�U�TE�):i���T��Rv&����-��in<ҩ׷�"tU2;�%Q5�=�]o��$RRyA=tQ�7�3�zܝ<>ly>v�Փ�b�9���lA�&��Mb�mOȻ;��_�D�x��uG"�hU8B�k�0� 1J�
$٬K�~h�ei��؃R�����l|/����}#��X���H���0���
��k4��-�������z��:z$M!�\,�s�M�<3�?Ό��%e?d	`�zI�q,C���#�n������9�/́�e�O`ٲh[0&ۗ�ak!j��LR�C��>��|c�u�#� ٳ'D*R-_��@4	�|q��mb�Q�|�K3��'�^��Lpi��$n��Wg�V>n)���$L��c1 oj�I-O��B71+�61�=/�
��i���z0]��&�A�)u�S�/xz@)���\)i���3_l/���G��7ם����U�{����Ft�ǤSWۉݍpt��"��jN����9{9�	��(nϯa�в�@Y6s��%�z�6��F��$��l��X>�o]���D2�3$gƯvG�3T�6[�״�³�a���Z�r蔲7����\g���܁�}u���ӻ���?>|      �      x��]ۮ�8�}���-_���h4�4��ꞗ�Z*q1`.�f�_?��svU�ꐙ@�֔J������a2.�2Tq���cns�+~�%�c�f�e�Q���?���~���c�����������̓��dEX�?�8��u\?��U[Km��7���j�.�U9��!^���o�& �;�v��ַW�#od��ߏ��!���N�����|�Ņ�4�ya��e׌c��Ͽ5��C����S�b|{�=���}�Ֆ�f�^��֛�&��}�>�8>O/^ҭ���eU5������|���
?�z�����e�tQG��Ix�������-��l���2�4��Б��:�M�ef���1DR����h8��o<�V�����F9LMV9��x 9Ԟ��|��	!2�1�n���q�Lj�I�0/h���M�tX���V��C�>�2�oHQ�����c�ʝ����
�9A܌���� [��[���6����h�?�CF���`��e�Ⱥ�����'f0S�A�H���M��P�vɲ�xfa1DX��a�0�}fw�y̐�qxc�a[�KI�;ot��"����;jc�Pw�:�^�G�f/�i�Ƭ4��P��#�/c��?�����Q����$i?��/���Wҥ��S��1Ϙ���K���!c,��.�ea��G��"5��.u	tA���z��������ٷ k��}��K���L=!ܱ�g�\O˾~6��o�@�*�7Y'�HF�'Z��odQ�����O��
�\Q���j�}���{Ʃy
+QL�y �ߍ9m��j}�\�a ak��uig�_t<����6���!�=2J�iv�pY�4��4���ոq\�[{Y��t�?~�� �s|�|��Lr,�Z�VM�_ӡ�˽������_:�A���kG1'����C����s���o�G6�B�����~��+��}M��\Ln��i4��^EƏ���ߤwf����q�B��H��m�7*���C���Y2�r���[�e���Yf-C�#�W2�u�A�f-X� ������T�(� 
��W׆E0�{�<6��x>�3�i@�=Rz�9���F�������#�}�E�O�P!��[,|��"�?BƏ�����ﶮ�u�Bx��sg�:�w�2S�,ymd�v�ΩJ���=�$*�D��d�xS��e���Դ3���j�i%��4�P& n�x���O� ��r�:�-%�E(��%�#�S2�ǔ�yR�a�&Y�r��S^Rp3�6O�q��m�1���u����O>E�;��۽�P��	ZF}���� �>�HZ�ƚ�jk�O���iiP#���}2�	�h�l#�hq@_�\g�Ẽd�!Lv���e3���J��
J�[��۫�.��s��8��'�Cg�f�yPW<_*E0p�����5��7��2y�}���r��b���r-�L��S�+�%��H�⽆}V���;��][$R>|�߅g�3��7I����%ӎ�u�R����p2����O�Z��� H� ��'|�����h�N|B��p�[�9��W�ߠ ��R����ty\��9ĩM7�����n�YgE(�1p*���;��W��*4 �3���_��R�"���n�N�m
3ڀ��z?}��*�v�՘��r�V��J$��"���&4asV�ZǪ$L�^M<���*xi7�R`ieO>���*����z���W�ӪX�8��AP���2I�Z����3k��z;`ux����J�y���C8��a�)!ŧ%���G���X.%����P��$��\c�2���ȷXĘ�!qB�Wf����uo���r��3�A���M�r�3����lm`1 ��gi2%k���j�IV�1G��LeS� �ϯM�"������4��&q(�|J>�U�$�I�[:\�乘�[��4ߖ�q�S%�nr�!�Stl�R��\��Xmb�
��A:��w^I�V=%�EϦ����]�@v;&08U��uǚV�W����7�s.
��D�����*		[�g��S��ky1BK�[3=�E�����8����e�`�S��D��#{}"�c��Od�k�էS��!ܳ:�l�i�g#\�Y��"�=9m�t��3��K�������F�/xH���/��/d{�{C\���O.��J�;�,J!��m��\t)N{�/�ˌ���M�IBl��hlo�*�:�_��v�#S,����-i@�B0�����o�𒅴�E���*��*LRS����l-�m�'$�F����%D يem��ӗ��*�K��44k~�B�]J�Ľ�Y��������4�kwI����WsQ�*�w�� ��[{�2���G��#ppE��������\q��E`�V8�s�5O$H u�菮�;v��e�?��-���,؜�R?��]	 �����sO%��J#� �[uBf�Y�6T�n ]�G��ɣ�M�K�B�#�#�܊�l�@��@�tD�0${�ꌧ�êc3_�[�>�$�j����X:�=��kZ��镬$�'��K�!<
K%Ss�0�Y�x@���]W*�.�!�Ci[�pF�Zg�H7���vW� k�l#��%%i.0�O�	��B���x�ƤX���xD�Nn�)��6&���[cR�Ø��%m�5HZ�B)�n�X�?*�d4 ���f�m3��6,��'%6��D���>�;�͡I����XC�~���T�]��	��e��z۫/U�q3CX�'oAe'��>�ɑȽ�6]��~!d���r
�H��F7
$���]�$a��)�uD�&YF�2�d�4�m	ݥ�cjlJ1��j�A�q[��E����yi��$�s�Y�
�*<ej �l���FW�>a����h\D�F8�����Hs�"�}+�v�c�$;S���!�M�%�6��|[����0�����p;'Sܞ��`Vt��6�f�#xge��ڴoܿ9�>�p�Tbd�ӟ���6&�`��3Ƌ
��q�=�	�,��1ҙ�t��+6]�(�����BR�.��A:�b��%�ݦ� �=������x@�ȁ���5G���i��9sl�f ?1Oy��Rw���i��9�41�j���;5�P�tqn�7JF�<�]V��i�O;��.��s��C&Y5ƺ��4�MJ.�D;������<��KRmzg}�l�sr�%��DQ_���u���(���&c�i_Q3���[{{P{����NB�8�ȷ������ȕ�kd��ZX�� zoP�b�^מ���4����.�z^O- �|`�g��
��{���ؗZ`�]6H�"�^��
xwkRL�)����<�ktŪō�I�Wln9<����4�����xڮ 8*���g��y(\���}�U�\_���&^�p�M�}T�!�/P,�2��.���Yt f�.Ţ�z�gU�\�uֱ�W�r�BZe�#[C	��:�\ �la�Q�F�����-U�;��-a=:⨶���u���$0��z�㢎�N�,�s5Ǯ�0�����S������䗅@@�jJ^�Z����-�{�<�yTn���y#�R�b_؈[��~*����7� q�CX�z��9O�8��ƫ�al�q�2�u�X��W��re�Ō�MZ�5>��$.��f�d�K�ϻ�ӷ�$p$n��aK��Q� �f^�%����17v�9�zXh.�k�'!k/��]SR�gJ�ܺ�*��;Z?�TcƑa���R:�^�A<P�[��6ݒD^�$��޲��$L`�F�::�ݷy]�/d!Y�&�z�U�l������S��qci$:W.Z]P��|`?���v�����}!��O��خ!�^��IO���r�T���N;LuY�* -��ԙ�P{�,O[FϾ�nWu�,�qkC�,y��_f�!{+`/֪CS�zT������k�2���*cM&|%g�#���݊뗅3x��m�x��-����Y~I��#~Q�Z�Q�L����Lǧ=�Q<�ڳ�d�%�[^S�YP���6�{��@�K� �g'|{E�m�6&é��� 8��֐G�����:�j=n+L��D�   m�}����ڇp�ٷW��i�u�~�R��)�+
�T�f��`������/w����ɪ��v�T!�_f��lyK������e�7t�ƱI75��_{��2��ޯ<�}?����l�/�I��٣S��a� �8\ ��B��<uZ}�㑌~Hx��;X�� {K߿h�+w�׶�{���9��g,\$X�o0���^����B��`E�ɕė�mk"5��` �\ ��@�I%���� |�:b��>�nU����\�Sɗ�_!-{-���uP��\��d����*!>gm�͜Ug^�u�� .��;VS��>`�ݎ�pdg�4Q���`�`��P� iQ�Î�[�g,����v����7�~��k,�,@�*��������>��R��u��0ڳ��P�*/D�)��6 Թ����!8m��pj����|���K��̟��j�LÁp�!�^I�|�y�%4��e��*����P����T���!uP����ۀ0A���:�/�����U\�,�lsb��R��庫%ᅏ@���u$\���K�ht╊\Ĩ
{�:$�GO���a�ZO�ט�R�ޒ$/nc ��N��/n^�U[7����w`Wd�������Av��l�֙�X���D ��D+!��`�bS���cr�zګa��̓�ۿ#�6�[��GV�
���@b�ųgQ45�н�W�sLnm�L����P����-��X0���()���˭�Ɯ�!�;)���-{����V��w��z��.�[��8���ā���[�"�A\ۗ��X���d~
��D��g��)x��_'� �P�{$͝5�[�<%�����z�UT�&���8��Ͷra����H�.�P�a�����گ*K�בp�F;�����)��e \l��
�8ݛ�87�q�r��C���u��N�����bs��] � �
�C�fKei2��J�Wȭ�q�K�Ԉ�	{�5��,����u��������=T��3Z�j��ɬ�m�p�(SʹJʼ�!�Ń���wP�j3�Qs�1���������(q��gc�F%��}�7X ���*".5g��-q�Ֆ;��x!ZCm��ɯ��zZm��D�U,U��=>7���`�ԙ��|}wPmU,���OދL�j�O������Nj����s�ejˢ���$��<���;j�P���藨Z{�T�����8V
pL�./�ƙ��5ף����Rth���V�#!H~�R�wrG׀�	�e�� ܌�?����ۀ��|$������:�`��(So�d�Ϋ-� �{�����U�'P��c��UyワT��;�itG�@a���r����-�`J~R��U[�ijR��$-�&o�,
���<2�����=��cp��-� 3���	֌_��,����J���ʮ�9�_�Rr"8��^�PED�y�E�lI};�J|�Z����N���5�i����m��ڰ��r�i��j8�^���R4R���͋�����@�L��=��j)�P��-x�4�r�Ӫ��N�-��8pe5vg=��M�G@¾Kq\Ǭ	�b����]��No��%�)N���8��k�-�k(���(��=.���lk���w�ش�0O��j����y������ں'۬Y�r���&t��_�,��a�N��{��ט��L�W�+�zu���Ⱦ����3�~��ї.#
peF�\mԃr�5Rk��RDbz[��m��F_��� F�Ӯ��ટ��,�v�����5a� Z�h�m@wu[ZU�ˈ�S8a��4v��g��R+q�YL̞����|�I$e��`KdM����eD@]�[<�޽�/������ G�F-�Χ�-�$B����n�t� 	��V���,��K1y�e$d�CW��l��ٜZF�z N�}/�p��/c;KÕ����1ޅ���I��#����i�_���M _����[��*�.���駟��-�          �  x���˖�,�ǝ��"��?ᢨ�/��H��Ɋ}2��[���
])��	�$�@�V�z_��?�h:�A�`�xh���i$r�+�Onx�Zc��'���6�������WSS@(q�/ż�ʠ��I� ��@��vv��<���@������i�4��Q��A��$�R�2����&s����g��l\F�C�բM4�v`�z���l�>����mg���k_�f��,�����ڃO�}FM��·{��g	�Q�[���S5px�HrX�6�fFo|�:c �Qs��k�d��DȬ�Te����}�,�T�/u��}��$6@T�������+_��Y��������� 4�����v��������9>��6���μ�W���H=@֐����6�3Y�"���8�V
����9x�y yE(���n^�����RW6��|"H}>c?�f�u�>����d��ݞ>�>Y�g[%sy���� $�\7p+��{���?�1n��Ѝ�Y;��>���ƊN���~^�����g�J.W̧�{��O�8Ǯ��4��,��qJ�Y۩7����1�Z3������J�����)x��QaZiP)c���Ut�wb+P��θ�?�oM�5�8�bh���Ϲ��	G����:�������3�i'[��M?��>s��_M�܉�!p�;DbfZ��x��2I�:
hGI��7Dqc�R�%��||�c� c>�v~ ��O�3�,�����ˑ8r��ϫ�45�q
����⹟�����qOL��V�q������[���t�mSU�����X{ޙ��K毾~�yÆ���>������uj�L��|^��"�:uJHG(�j%����S���\���U�jL��'S���6������=�o�({�n�ߝ��f�j���@`�e(�I���j� 
�!�p5�_|� �Y�l�����qҿ:�;��Uc�x��}b* �Ǘ'�-� ����dm���dݰ�j�N�{�}&�ߎ.1	f�>_;��*g�B�O	��Y;}���Ӻ��P�3�ӧUv�Xm�����^��;v���k�Ҽ����!_;�d��b\^|�̋)��ʖ�q~�}�)�=�8k/F_���̹X��#����k�@$��4����5����~ �c�*7e�<�s��%���=�Z�����fH����'����"���a�����v��@@�E         p
  x��[ˎܸ]���V�epII���	 	���А���zQ����d�gz�%6ЩMkl��­�=uι�x]�4l'
��O�d?8�w��T���$���Q7��46���v���߮_�|����sQNW��yn���Kv����W�_ɩ�(�ow�/��o�,�6��/in��S^f%��Rt�X�������g9�`���]Ř��+���8�0��?��f���U��l3@C�+S��{���L�^���7�~�U���jG�$T�i �O����*�HǬ�.��ax(�i��P��P��8��J��!�\ǐ�����(:^�OY�<����r����>�՗05@��|��0h܇�t�k q7�!�N��"�X��]��`	�1��%I�� �_E�G&��3�8`=d}O@������F:-"4<I&�8 �ġ/��'vxL��Z���\s9�7�,,L`d���%��\��ŧa	&�E�{ݡ��O��1�νGv6:��Q_�h�=5F}����t����]�� ����UY�v����6�m��@�~�E}ǀI�cT�Wv�+(�a�r�ԯ���$z�є>������x�+^�~6׎a���uՏ����p%�$�XX�������S�R�<�RעTG�{+�	^5�c�w�h�o㊕���v�"��� ډboS����Ntd�X�d)!Lc�s��a
�˔���un�t�1*��{0,I�%2�t�N�H��͒.��0��}���Yٙ��P@��t�t.�h�2Ed~5������Ss���m�=�����7W
���C�r^Ud,�/���T�c�٭�(�kV���&��* �~�.�R{�ģY�<��x%)xQx�.Ǥ�`��ǭI�{�����������#�0��#�W���:F�K԰jq�G���J�!�~Q�n�ʷ��g��D^�s�Tg���<���ے4v��4"�MO6�%2�51"��L��e�p!��6!�#��b�Ap��ļTc�#��V.���iU�����N�.�qOlnD(��t)|(��g'��Ol<a>��p�Y�&)?UGk��aG���+�����T�<8�HhqK�/��b�bT�:|-!zOB�r�	���2ފ]���\��bǒ\k���o��T��ʡ�����lRc�k�e��S�-��eN�cl�bb��=�������lm��(9���c�h�}�iq"۴�sd�1BN�j;Wݲ�ư�!�Ƌj��{�i&&Sl�A�j���ˉ��YNY �-��F�0~Jj9Fl8Q'l[O�q��� LjC;o��D�r=e���B����c��Y����k��E��L�Ƽ1~ڡ��QZcwd&(*T��Ƒl��͑�ɬ�Z����V�jm�tTεPc�B�uL�;�w����C��Bl��a�L��8O�c�$=-�KŲ>Q����[@�L��pfJۼ���=����Ĳ �֝��U*����cڏ����a�A��s{Ɓ�Mq��c���G� GO33�M�v^q�����mS���c
K`z��8_��x��1!ؠ,�d���\9�9�Sm0UӁ��sr��o����A�NKؙ��&�6�zd&�6�d���b�H�r�
d����!�qt>M�o�����36v[�u���y���=�xh�Y�U(��M]��vHtz����ػK��eoW�4Df��}�T�����p�Y2�]�nL #ޞ���w�����AXLc���H�_�\�T2����˶��S�7�|����b(+Xn�$�T:';���r�	 ���	�*���\�X,�Ɩ����{)�Z�;�N��q��Ӳ[:�m����:(6_9삑]$2ly�`9:m���EH��$�`;���5m
����$���c;R� 0>�U+K�3=�pܳX�|@=`��(�By����Ɠcg[9!O�u�N/�����=,�0�ʖ (���$ڗ'�s��-��+y5y��,�������22.���\���w}	@��EǾ��oU=X,U�5P��R�HR��N0�#�m��3��@,g����C���W^t�A^�ч�Q��Wv�m���L�;��¶��z���?���u��sؔ�Ƨ�q�Ao��NC�HJ'.겘Oڬa��e8�.#�@P�fm�� c�W���,��?Q�v�!c�ejDH�zrgL�T�-2�aA�ls=�@�rb�Y`ZxbY`
at��u��1mO�G9��/q�SF���m�~��s�ko�Fh��:���t�>ռs̕CW�@V�#��P��s���¯�B��s0f�=���Cq�n�ɁA�.�s��e?���s��25�W����Kjg��-��@6KB��<��F+ǔ��8t��9L"f��R�)q���JZEfb<̅�&F�����yWSw�@�Hc!�W����럮?b��������~�g1:��4>{��>����s��>3�,:��bI~��̿��kdvD6R/�R��f��s�>��3$1Q�&�kH(�6U�~Hl�aH��UM�	a �oF�;����QC�5LN�끰X�0�:�ߏ�� pCA"
�?���D���_^6.�0��I�A3�a���cJ~��n�~��b�SQn�Bx]noa�x�ma~��ӧO�3H�8            x�����:�&�{�S�dٖퟃ��� siԜ?А,�~��O(zg��=�G�wFd���Q��je����H�i�+/o-���;�nè�e�������j��������Z�q�;�_����˟�4
��p
bD���˾���O��U������R~�>���צ�T���2#��A�CzN3��,=��!c���>,�魂��O��yO
�4��H_�fb�O�r dp}b�6ܩ����~�{�A�)���U(90n���(��vf��o(��'ឃ� �0��b-���;�"����������	�>N�|8%�(���o-��/9���Nn"(��_���I�zE�*BT�������%�,�$�f�2C��!!��'*I�v��w��&��>is������W�$LgI�o�C�j�8�_D�ZBf�ÚEB���7!� D����P���=>���'qgѬ��?�G����n���ߋְ�"����'�e��3���ZN���3e_,|���W�Q�~bD {_�8yϩQ6�N��>��Ѱ�ٹ�`^n�d̘>��&*K��s������5��4�H�w��)��$�&+X��ҧ}}�4�Z�J�4ԧx������`�
بL�U���Gw���J}8Ъg��o���͢��Y�Q�[��i�L�'|b���[��jIWV���(M�����X�>�2U�L�L�����7qO�s��yB����X��]��g�D�WG�WW~��L[p2�5�f�K�v�i�1{y��
�4�����q��/eѩ����Z�������s"#��BM�#c"�_T k^[��XX�n;R���� ���N���юl�Z,����\!BtLn�ԙ�W���7�P3�d�.}��ބ@ASr��V�ן�
�����m�*���a�����o���bM]3�CbE�]��2X�yU��*���A@�c�������i�(!Za��i���
tg�<}�9����ս$�m�E"�LÀ���r/�+�E��}����:q�ʍ;����pO���9�o�Y`*]<��0tr��������~�����	1�l�������B`��
Q�mBÆ��S�?m`��C��&�Ύ�+�e��TI(��J[@ɫ�q�Q�e@@�9��,�$E�X�}����~r�2}��oǚjx�>Bk:�}��E�K>��}}��'�Ի\���o���� >�	����M�۵{��A�U�e��V��x< �$���I8��?%�i� �P�r�o���[Sg48#_�YpU�-���Z��O�"Z��eZ�����"Y�I2}8R*�v�n�֝T��3h1Z�d���]�0hǜ#F��q���;��bm�ĚT�]�EE��vY�&@L�j�OʑWt
���Y�Sn���H�lPz,v���}�v01W����±��ˇ�a��V� r@�р�m�һ,�}�a3�ҞN(�	o+/N��3E�Z��N����c��2�������{U���a���M����q�%e��rZ������ڝ��#�"�	��� ��0��[IHY���:����pҵ5�ɓ^u��������xD��%F���N=��k���g~H1�e�R��u�N��e��Twc����P��%"�!�F�e��Y~��.<D��U�X�;uOb�\�G��9�4��ȋ�"1��Ic(F�����%4"���"�ߋ}~�����C3۹���b�w��i;f{B����MG��w����������h`�]��Z\�c��˚��,��~���%n��]F񪂕I��#�5%��Y�%f(v/a?�`O��!�f��Ϯ�!�{h1Y�X���ҙ��4s�F�/l����}���߄(qϘ�����,�J��S�c_+P�e;Ѥ�MV�Yk8uuS�;A��1 JD5��y����Xĸ��G��@��̫����jWA�<ڮ�cg��& 0���L��b��߇T��n�[ʋ�+��{�mȪu��cʃeeNL7��9\��k"2gU�KfXo>��'0��-�mFg9ǵȎ�*r�O�2z��9���F;�P�E���>d��rw<6�$�!����p3"Wy����S �iȲ���6�������O�kZV�}Y�]���!H7���F��n[������,�N�W��C@3�� ����H��?�e��2Kc�+��%n��Ĩ��b�!�������p§�u�b�=�)m����&J���l�D���0'�yGKճ��.�^��"�4��:�Ѿ4�P�N�1�,aai<�Y�D}���k��}/��u�O�{u�E���?	�`oyz��w�ޛ
��?f�/*v�:�b��>[��:fD��ݷ���ʹ˹�܀4K#F��DTԲ?I���r�өx���@�$��o.��d.��b��z��L�&��I�����������J���{c�PM�bNvZg�Y/��(P�ejf�(��Ԭo'e�1O��L�hZ���.����w։N9�=��k�o�H;G�8qJ�Ե��'���ft��33��2��%e�VM�&��UK��4�|Ī�,ZB�u��]�������|�n��2l\�����J�N��%�#m\�L^Z�qx��pB�e�)��\<����rR)�	��(�n2��;�	���Y�Jy� #z�1���MP�-�b�e��fB��(a���Q�U�׍w�j �NP%|!��|��d'�v�?��C&���EI���D�]4/g0�.��O_Q��A��2igW���>��\�97��X��*�w�8��-��^�aѵA쀳�ag#��kV���	�����ś�i��J�ޗ��q�`ak�+͎�tN��C2b{f��<!�l^��P��q+�BY$�"�*c1?H�d�L��Σ>�u_���|M�o�����ȿ$�͋8< ҝQA��r%0���U/�7�C'%���3)�S��|��i��ȁI�4�j���B2�G�up3�S�ف�#�뼵��f�9Q5L�e"���	\/~�i�9�\��;B�F�*��#H�w75V1� D���v���$o��&8Y�g;ʵ�3��}J�>���Z�>%`u/��X�b(��xt[��cuz~f�b6�q���W��״��m��2���� 9�%Q4��e3xW��h�v�>�I�>Vn�Cg_%���p�x�VL��Ƙ�\��z� ��я�%�IJ^؍�1��r��)HX�ž��;�9�0�p|�%K��T�s��c[e٪���$�v�g�e�l�fR�+��j��pwj���6uϘ�����Q|�w�5�!fP�� 4�4��VeE��� �n�k��ު8/���:{�H��U�S6X�ۍ^U�G&�l�#���-���9Y�`"F�F�M�^����j�?I�SBG��Ĭ�(�OR6������p<���>��&\s]����5������4��yrro�oX��k�?h�Tr$�=���� ڮ(G�����Ȑ��ä�ho�H��/^T=��Ju���wD0��rW��#�zW���Q�4m����H�]��d���U��PQ�����N˫x���F�Xv->Yr���$:l2�a<)�e�`��������L6s��^�סЂ&"&Zf�tt�_R���M��tB1I~>�|��.�!n)�c�[[������TBk��q�S	K���}�V=�J(;�3�$�B�0�*�O.�2��,��A/[�
�Z���˭^�ny�ͣ_vA"2.���K �H��O�$�.���S�6ѻ�_��q��Ƚܩ�p��I�a����}��=���9�i��a[�^���ofao�ܖނ�2}���l�N�����������m$�3]X�Hc��ܺc��_��q�sar�#�C]+.��d�Y�{f���t5!�������2�0Ob]H�}�d?� Jo�o�g�9����@�		<��\�Ʋ���{��-��-?��Y�?eܽ�5X�Ċ��Þ�e݆����� �` ���AO?��E!;FSg.j��g��I��;q@A��(��q�� ���m���N�N�⦞����u���    8�#��_�Y�����]h9��dQBCG�$(����n�s��<H��9 �:�4K|s�.��a;՞^s�>yT���(�o3t�)��#�:�o�5l�6
���ee�]rG��#�?l�I�-r�VGy���Ԓ7��{���S���9|a#帯ײ-M��ʚwl����J�ݕ��VP�~��;1��v��ʏ@E���2��/���6���T�4rW�������\!�$E�P�}��P�S�QO$��C��}�ōt\I�u��э��J�ߗD�eTY:����*�%<Ӌ�w���cZz��"`O��T���(+����?��>���etl���!����`�.�#�1���*o�.�h�df�rB�]�u��(���ŝWl�0m�؃ς۴�0I~@�*rU�\t�]��\#�:�m��
-R\�Km/����.x5TR�imϵO��� ���S�L���c�]t���:8�(Q`\��C���ݡr��
~}�	�&bϩ���Ǹ��-`6m|fnx��c��%�X�Zi�mZ��]�(kƊP:�Cb�U9���F�5(�8��t��(�M���6�ywS�N~����ﱍ�&��=I���S��ɐ�O:��8�*4e��6��<G�<�����!�UɅql0�b��+��m0���,z�U�*l�<L�N��T�;MSO�M��#	������j9-�#����3rf��)��ͼ�Eh�yr�Bv�zyxO��2P�S����3�0@9�w��cك�/J�QJ�f������ӭ�A3�姌�Ƅ�F���\3���%{���d����� #B��"�/:�~rz��j@��V?�� �0�Wr���[��lFG!��@v���R��E�a����l�軿wL�.�		׽@J�Qzǆ�}��xM��
L�^�α��̟��)#�I�ة/N�v��v�']�֓q��7��Q���DsIN�׭�w}�xB�d���bĻ K@@��<Wv`��.+A��v�Y�Ms2O�H�@ݑ���&��K��m�3B0c�[wj�����S�6���zW;�f5�|������얕�/r��]מƺtayMȱ����Y��i��F�l��(�����D��D�s��n��/��}���#�����`,13����"�l/r��8|�e��1��lz�l���цx�zT&an6�,��Ĉ��gscd�u��b�% f��iG6q-�ܴ��9u' k��ô�=c��'['���К"a�����A��Nn�&�@��Fc��6��^�f��e�1��>9Ӵ�h��߆�P\������E�5�&����\�w��EC�nƾR^u�Tl|w�e�3�7ǰx�X�'�h��+��v���C�qw2#ApxU\qڏ�"-��.��q;�,���՜�~ �v/E�ڠ���[u�76'h�)��_z�����W�7�F��L�Npk�����V/Q���b����~��x����"�XUm��xQ?��w���b�ׇ�Y��_t�;���)��3��ġy�|3&��cw�(o�v���Y�k��N�XVbTWU�B���	�tᖗ7,?�I�<I|�qJ}9�錏<�m�'�C�#��-[���i�md��;�̚�w0��{��� ���3r�����VD�u��G<Y������gG�N�
P�$ � o1�>�r5F�3. c`�}�-�i5����ދ�F�������8���<$pDf���]7M b�
0>� u�؟������M���MHB�p�L�ȣ�q�Hkx(�J@kDR�� �sў����I�z]�yX���H�}~up��X�$\>~���&�k� ���"�w͚@4ȗ���L�2{�Nd��o�d�R�B�#������|�F`m���^V��B}Q�9����p_H6��e�{��t�u"���w\�V���Z)�Z9���Jo��\�ʴo8�ߝ�눕ܹҲ.��3p�)�{��(F�р�.f�h�E��u����!�f�+��1�F7��M������%���2VV%��T0�~�R8�%_s��v$����RhG��!�˿�m�<�G�mB6S�q��2����M��U�m�G��ܤ��z��Z��Җ��k��~	J�v�"�d��B�זi�WG�ю�M_����<�/7���*eq298�D�϶A|X��rC	sxg8�&x�b�Yg���Ϝ`�U�6т޵�B�)�	����DqM�|S�G�TiG6�Fu�.;P��vU�Q0������/�keP�� 4ȴXǶUY�7ź[u��4��\ܴ-����K�i9)�Ո�A@��~˔�:��%"QGS�����Z�ݴ��ń_J���4������e`�`,5��)%s�lP����s3`�g	Fx�a��Q���x/���u�B��������ia�0�{`���2z�T^3_��m���v���g���ɮF�c����9�X��m�����O��֞0����5ͮۜ6�n���i�?K�p��3?�20��kV�Qn�W����������}��_T�"�ϲ���r"�I��ܞ�;�����K��z]]��z�-����[�+vV�s,/�o2F[iN-�d�_��,�G�O���An�>�>�3s�m���c�v�����+�֯c9��[��-ē�*�`�r���_��s�{b�J{p<9�c�`�<��f�F[�._y� 1���HD6]��@�T�r
da%��)4��0|�HA�d���4��(�%�zyS�{�g�$��������Gl�v��g�|J��t6�<��"n%n��cbI���mS/���j@�ma����[�k�����t�>���4����Э���V�i��ߩwx;W�vE�u�S8yS\��r_
��=�'v��o�����5`�� ���C���y_~y� �1^��in���x_*�$�i�N��˹��)K�ySx�X#rX6��P�i��a������y��p��&><nh|p�V��O�u��5\k�u`5qK�7�2&�\����9J���\��p�__�ʻ��ӫ�)0�&Q�?�ʻ�DW<�+��̤��	vA�$����N�b�������k6��flu�r�PSg�e��u]�;p�f͜,���[N%��Y��b��0��s`q�<� ���՚֐��pR�0���X�8+��e�m��s��n.Sc��m(��u��$�
���Q{*+�����ל�����Vk0�ĺJ�;E6���k�+vgop�`���edu�8��Oj"�`�������MFlTf-��l��-G��f��
���ܥ/G�� ��������n��/�f. ����I&-�^�:�ձ��^�G�ԍ�v{�V��F���FЩG�۲�f^���&����m�������P��П�:����~] ���#ܛ�/�Y\��W�������� ͧ`"��~�����g?�>�����
�k��e̯�,UQ?�9
[cu�mn��r�5�k�NLh_S����98��Z�D��7�'��u���[#�(�6�gw�E��&�ӆ�b�����ˢ���<"�m�L���w����l�M���鈏u}�D��&{�y#}������拮�����8�(]^�`���^U��wĒ�����a���|
tҁ-@k���{f�uĊ�ٵ]֎�}��d3(�4���*kqH=����1ԿϚᬜ�ʘ����ʽ��ne`?_H�D���mϧ�*NX��#�v��@�z<���iHh^�Z�k��=����d�����ߐ3�V�5���WM��b��ڬ�v��*���ُ��k�� 6¹f���5n�ั��$`�1�7)3�k`�CS�6�����JۼfE���8ң�Hw�`p'�HޡO��9�?b�ʾ�uX�+����'�!����K9i�u�XUA᝱��wj�R�,�t#��g�cK�鹞9(�c$��4	5���@����9{�a��U���	Z��h�<�SM�'h���(���vg;"@��Ȁ]r�4#Ƈ�6��AE;qx�	�0^�%���ֻ�6Ak/    �l`Y�����:�=s��wμ����)���k�i8	��?-=hF�H� K4J�QE�S~�&
,�,����,Y��g�i�"*��T���]}�ydp���UY��s��F�T###;��L��u�NN��Bh�\�&3Kx�ճ�Q�����ݶ������.3�<k�2z~9����i�����"]��
MX�	ν>���|���Ud�UW�6��C���n������#�#���r��!O�#�@46�i9�p�ag���v��Ŧ X㦲����gV��(s ǡ� �J�X��j|jHv��#�W��˧&����"�n�>����C�̦F�s�a�ǆy����4jmn�����o��-s.�,�A�]���Ʒ�A��E�[�)�蛵���#�Xg w��O1��J��]���>#B.�?7�o���}~��N.6w��c��.Y��t�|��h�Y�D`"��qʠ��v�md�mA� ˥}S
w�+Wx���{�	ZJN�r�����L��<B}O��/Ν�j$C�O��u�sc�����Yp�g����ۮ�~�UW�w_���| 
�V*�?4}K�����a�7�+�u��2�����L�yda=a�s�QoC�_=
4}L��tgT��(+!4p���߁�?��·@S�Ikj1����XwFf@pM�h������X�ېrw
��V�\3��g/�z6��+����^0x мfa"D������6��JG')0�ѡ*��$���n��
D����Nvl��8�;�m�v]=X`$.�y�������� ��M�q��J#�^xM7�������ӉN,�CLT�$R���S#^�չS���ܭyQ��Q�:c2���5����ν(�f7"l�z%i�wOE�,Ip��,y~��_In�h��fL�y�V?�Ɋ���������;�[A�7s	�f��f�³�����@v��Na7���O,+��v:���d�׏Pn��D��$�����5x�#�`��!4�L2���|T�n4�F`�=fV�x��U3�hˊ0B�eå9�,�G�*�@�Ac��)��SSR ���E��U�W+��V�ݸ�/���8���	ܒ�P&�	�Z��� c�=���Ҹ�&{��3�$�6����>e�Z��*����d2�ו�n�S�_ܘ�h�`�v�F���N#x~��4�\��S>�����"(/MFf�2�v>��1�o�����+Ĝ����4�;r��;�7�i�2r�7��*�7�_��1�?-�ɬi��&�**d�U9�Rֹ��N=��KH�����,m��z�Lܞ�/`�6uSC�A���W��9U�dȈ�J�z�aNB��� �F��z��2� �hȲ"�((�න��v�38w�bW���� ��m�)e��(�V�QVY�ѓ���T���]i�R<P���%�;��Dc��b{d$����xlF�.yX�cla���B�w�/��d�-\�H` ����xY*9���(p������NE��a9ZOI�{�vf2�M�ݫu����L`J2M�'��1�#��?�Ti1��5{��Yc�\�'�e��n[Y����Ɂ�'^�«�X�nˏг2��M�D����QpA���5�p+/x���	�x���C�K2N���Ɵ1�r9x5�QZ�OSSd���3X7�-X��B�I��p
��g�i�M;�Ǝ%Ɣ�'�*�5�7j�ŗ���\l��n�/;xu/�*bpaj��J7�O⒅��Ѩ�},q��6U�����F�C4�ܿ����u�q�л�
��j�� h�ᗣ׬!�dI��,}�q�J�9j&UF���O1mB��4���"݉[���:���Xd#�������pM� �H���Au�$����TX�ET��*����+}L`�%9�F���}�nAck�c��|YC'U
��ҾC��D|�:��;4� P"�
�G���<2+�����ꌏ�<pռ�vl����4O?yM�O�[4CM����e�8�5v����=0��7�E!�Z�T��i�������S�l����=�N�qs�C�]�����7���Z�	��ɤ_�rlv���� Q��H�u��k�e��W�T�Ip˶ny�7���'�����d7�j�+R�Z?N��k*�}SA�AG�����;7��M��n�{pY�.�7���3��׶������NhV�)�7�3P!����XT@���B�e�	��
FXE�7���go-���	ޝ�B�z�zD�l�m����L�ُ��V�����Z�w�Ye��su�s�`�ױ���]���氚0��[�E�wn�)>_	��w�%F�M��x�+�m����nc°նI-~xm}� ΋tξ]�s��vx�W=:^u�%>�,��P�V2\�U�������P4�T:�x��7`��1�/[U�c�|�&� �-C��5�)²O�g�%���}1�vc��Oc
_�5u����M��霐����������7ډ�b��_+:Qs'�������5�-ڮ��Cފ,j��3�U���vS"�N�`.��<q�>�����mZVm2Pm��[R�qt����M@$�C� "�8�Ծ��P�܄)��/[<��9%To�å&1+o0��X�Wk�[���qM5<8�p/�U��:qyN�tl���ݿ�4�|](0�ܸA����-�ۤ#X'���S�1#=ED���\U��?�V:�m,���Q�,�� �'Ɵ�؄�;}%���{�3�A؈���R���Y�^�7 ꐹne���O�':�iͰ-'��w��A4ș�ٔ��^���T(ջ�Vh4���5S�V�r[��Cn�Kb��?��H�x�
��.k ��L����:%���3�Bj��\���4m�s�d�s?��gy��klۭ����'Ԗ�[�f<��R�k���㎝y�ASڀ����X�[����ڀ��ć��,��F�o��P`�:��V����ƈ|���٥!�uNM$M��5�qX���Д�C�&���T���L�܀P@(4�`p&������o�&�]�Z��P�u���2�W�7Ń^0�I4W�ȸ����$��v�	�Z]p��i���蚥
-�lb�>^_�j�����ݿ`mv?��)��b�g��ч�I�~@B|�M���0Vx����%U����QaۀIۄ
t�ST� �۫F{�F�kJ��]}M��٦�+�cܵX�	C���n�����vc�2���u�fL�5H�� �����q�M��dd��꠹)ҽh��1��bo��l����v$V�L�zEN��"4O��)df]�d�͓ٴ�������f���߮����]�40��lQ�F�0|���L�u(%8ԩ�j������f���#��"Z�a�-Y���:�;�<�UG����<;��^S0�f#3��|�������%8d�#M=�ԫ�+�g�O
D�����]`�
b����\�y�1J࿖m���q�,���5�))�u��g�.�5%μ��#��C���h~�����^��}G�|]s�.O¥���j��#=h�uo�Nr��x�Ij-�@�P����I%>�l�';rm�1c/uة���I%{/S�֮���\����[��߿t<��˱�A�(
���q�,�]C$`��Koʫ)?e�؏��ڱ� ���������)��*x�*�i��m��y�Ss����l8��+'p��}Y�;�mpvQQ����(k��~�{U#��f9�^��g�"Wcϣ���v�1����}����BL1Vì�SO����p?6���@�5ϥ��J��^�I
'���볘E3�P@���,���v����ahu�"Q�S����5� ���l���(V�7�^h��7�/�l42i��y�L����{	�����"������uu2�G����A��bw9�%�+5N�59\Y!9wj9wÛN5)��^y|��z��U�q=un�l*��g+Q4M�Z9}}|���+�c/�E�շ{�xM��XW��F�=u��p�T�������\�U{o7����8Ob-�/v Fû    �w�+��BD�B{p<9��}D.��e_L�\��j<�vR����o�ss��e�6��K
�1t��|J�z�9��B��\��:
ԭ(2D�m��"NoC�MG�M�Ѥ5�(��9Bu����w���DO[׺�Ψ���(Q�%��o����ҠU?���~��}K�����J��k�̫��h��]�@�Wĕ5��+v�j6��	%a�KZ�ƃpM- L��i޸�����^�A�ýߛ%��>Z���>R��#�dyF͙7WĽ/�M}�p<D�	���{9��XfkL��`�4v�EZ�l�;�E�:���e?������Ωof?֒����a�Ԛ���IxEڛO[�<�xc�����3O(���H{;���{EFs�^�ϼ�	�q�9��[��SsV�O�<��_��O�Ҽ(�����9Z���l�$os���p�?��R�L.���)�c(�y�[_s�k�\@bh�7��q0��B�l(����w�Hg��X�ST�-��8�#�V�a�Z6�/�hs� 00�
�˺�o3�����S��ɐ���!c���P��R�x%�Ã^*�v^5��u~EڏJ��e49 ��`���fCޟ�8�-�Sc͉��.�^����*����u(H)(��=tNg��A�;f?9M���^�ߣ̖�K���5l�h����M����%�`�����9��ef��ؖ��$ث�#�"�]�^^��e�+��S��$�I�S���'��� �;f-��KH�~�oü�`W�0K9'䷋���j��O�	�l���*���Y��[�Q�9�F������yt���`�p�U�F��"��Զ~u�����x��Z㊿���}cX&�����76�Տꎠ�8�*�#c�;WM�}�Ĭ�ڑM\�%onv/�݃}!@����`p��i�X�a���*�@��I4Ĩ��E,Q蔂˭^�ny�,��j�ޮ�A��#	��<ɉ��� ��I}�~����ۆk:Nꑐch%3R��|��/��	�{��K���l�C�c,���m?�Ϧ���͈\c�e~5|�ia;�	,�L0�F0��]��C��O~'�ௌ�!����/����f =�NO�,S^���:r)�
�ò!���mu�Q��-���+��F���rҒx
!R��io��j�?Ԙ�߉[�4� �4�T�OJ�}���^�$�%�!�R�Rb����=.���rZ��,�A�]�BP�g��,�'lr>���I�==�N�Je��q��Z�B ��©�~M�P����W`GW<�MuZϭU=�~�u;�l,�ѵ�e��uV*KU%���U�X�;uO*U5��un'S��>����A��1�r���|+���7�I7ߦn������0�@L�z}����g���)d�2NjX�sq�Û^8@��~M#<��	�º��Pm����b�"6Pb.�`5���X�u�]�;�4�0#�����,�������ԫ�}�3|����	�J�_�c�,����cxj]q��T
׽��޵^w�w�:��D��J��P�Ye!� �EFJ^Ӳb�˖�|xq
z���L���X�����[���a93Vy���3s��R�K�LÜ����'�-6$&y�DpdX���ԪuO�FҡF�B����U�VFq��Ҋ��l��o���e��Ɠ8c;�4} ��5�r�өx��Y�@mL�6,��d.��b��az:����3f�k���]���K�����>�cq��1�H��Q5���`	'�C���W��};V^3�kb΁wK^N�{��Ӽ�`��&/y��0f*1��	F�ѽl��޴	ah�i.M�7u�c֌�����I4d���>fZ��5���K�Z�r�����$�jf��̖@�,A5��GVT�_:����N╕e$J�Y�%Ϙ�gМ��������?ͮ�5[�&VV�H����o�p��hzG%T�c�_i/%^Ӏk"�������M�	a�o,�p�O��
�ҭ�f�$L5xBV���Uh-�7E<.s�ڬ��Z�F�Ek�ެ�O��iK��6k}њˍ�탦b2�I��j<7��/����3(���~�G҂�ؽx�{�#(��3��(��{��ۦ�h�_���1��M-a]Ԯ�Ԯ��i��L��M�$��Kp�9�d��6���D�����1<G��5W� a���`��kb�.c�xl����\��n��V.4����}g��;=9/;�n�����ʱ]�D6~'�г�0g��v˂^u���t�xg�A�x�׳�pNf>��Q`[��0%�8Y+;I�SBAF�p�I���K�nXYm1��U���^�.�1��ɓ�܍���)q�����Ǿ!�L��r-�WJ4�;a,?@�"Z�˴���*?j	�,�$HY)E;�zn�n+�-j�T=�~w���C���UOLbG���2RϞ�󤅗��F�S*�)%����y�Ye�b����L����K���g~���9��^�J^��8%+�ηA@�Ƭ��u���+�P#�%ܱ^c�������;G�HB@���" ��!�����ǘ;�ԐG�=Q���Ӿ�g�m(@Jk�I1�~�?��zB��6�Y�=�L��.�:7鋭[+��y����Ę���M�3��QO��C�E�X��\��5Wx��Q�8�]���x�ٸ�Hn�;(-�f���O��������/�˘�:[���v�2_R��������^H(����e��+�tWV	��S���s��2�:��e�*���p�i�{=!���
�˖E�D�MVǔ��p��Mow���6O�P`�YF�|���x3��l�.���`��$���~v�>�^{rd5�@�O��oF�q���~�Ȭ=a�[�� +�O�2zYT� ��h2!g:8<[�m���86��s��qZ.L��(9����Һ�	���2A[��{D�V�+�'*��pO���f��s�aP3,a:���1V�0��{m
����v1ʚ�"����XqU�"���ր��Pa�P�z������M��"��QO�If�DL��	9�*�����xQ<@}{�T掯)�d"H��q��C�>�Rh��:��$]�k-��� �.H?�>�g��ȳv�d5^\�=��2c 3l@���n�F�+�Ef���f*�8ֲ����5u��X�ɚ���P��$����I?�l!%�#{��>���;�{��qS+>t�@M~/b0�ч;bxk��7T2��|����빁G���"���|�H�P�@�Pʍ��ŉ<~�\��W�.W��	���m����u���m��b�D<f2\
�����BL"���ũӺN�7Ȯ4|TV �]>5٘d7�u��l����u�S薘�ЉF�B��VӋ��h�f ��nU6�l���mXtc�_]�� ��[#��L�����-���'B@�"�К"a�_`��Z��}}(rٞ���#�?C^@�1��6��uN]'U)0J̌���e˻>)F,ji�?�3<�j��Z��<>��
��峣��Gm�G
V��#�̦�lp�*��h�g�^������M�48�N&Q'�_�?PZ��C�k�<�m}��#v���9�$!�Z��|'�)gW�����}�e�������?y�:�`�L�ԗs�F��3?�����g���6yjO�|��NxO�.$6E���;wpl��`��׎�X�b��T�}��I6r��NY׾�[���T{��a��F�~(��`����Z�=��쩐fI���>��.�����v~Rt�/mp�G�SJ�Wk��{޶����Ѡ2+��X��B�I��9������֋V�ڸ�ď`�T���?`��;�����b�=/�Z?vh�ؾq�'8&A��ys̝�w���h����뻯mŅ=������qsbS>P��w�eG+ɠnEAh�!�m[�qz[q���� aN2w(��
>h�������AFͳ��[���������� <�q�E��9|�wp������I�F�cR�su�6?.A�Z.���=^H�"f��#�;L'�`:��qI�O�<i�>PP�'N4 D	  f�%���+"�(宥�8��:�x'/�ַ���tᚨBʳ�>��wZ@���I�kQgM�ƨ�CT�lFc��i�w��' }���������]�aǨ���D���[&ѐ(e�]r���'&�6�I�p�cBI�t}o��~V���^���*� �R<QA[�X�������薿(�v�g���6�1b�n��+�s#���g���<^7�3�d���0���:Ń��,�P5������	�,V�p�P/��L?���vL�~��f�Gn��@��So��T�=���Y�դw�Io�"�; �c�\��q"��)~DW�H�	@������)���"���ny��xO�^����%�'�g}�D����BV�Tf2��������xɏE�o��.��0�����s�lIS?�mm���@��y5�jD��JK8M��s]
�9x�mWص�F�&yYW}8�*´�}��p�y�JP�3�gnA��3qw�m��@��N	|��*r}��R�R�7�y�YɮY��f��kjG~[����<�vh��b��z*�M�����Q�4���JE$��?~�ܱ}ej�0��΋��r�55�>	Z����耳H��͏�w��,�,��r�}j�*�x���Z[N�{�Y��Ԝ�f��p*�����	g	`�fה�����²�w���}�tJ��t�>��Q �Z˧Q���{����4k8	�	� �yZ��
T�i���nf>����)�*���kR;ms3��_��o�[r��$�g�e�,|���n�`�U7��^�<�gK8�sl�	���͵��;�I�O�̒I�����"�'���օ̸��	�܀g8I�I�U�����UP�$<_�vj�M_$kō�:W�L\�������;��`��B�l��>�|;p[����U��UyR��L�(6�Y��i尖�9ـX�3ɛ�-��p��æU���쌂](Vi���Lv����m�|K����t#��12�&�U��;�bl�j���	+���g��	�~y�  \��'Ye�p�O���G�h��l���{y2�-i�pR�`���	V��*O�H9c��_ >6�o�'ڲ)�LiQ�C�qG��~�O�n����g��%ş��0U/iٴ`�KFl�ւ��V�z��w
�7�dJ'7����q)�����21���,��㎄��$���|<y�
����q���zaի�ť�<�����&��X�>��^�R����q��g�Z��xk�����ՔX���2�H���"�����r��,8>�j@]�b׏4�|ܑ�V�Q��*Y{'qw�[�^(Ŏ7�R>!��^�ï��rP��~�d ��F���!�hz7]��ݖ��)1�8�ʠ����@��Ҝ�dF�8/�3==������XO&�#z�[Z��ڰU�d��K>��q���U��I�%�K��dr��r_7��Q�+☝l�B���ޥ}��)X��||8a*�`���ǖ��}`:=}1��4�g��m	[ aC���[�I��[a�B��q��C�?Iq�A�_cu��]��T�[	�����b���.{�4�0zl�C
ycEV��W��"��'��Q�D-��n�tn�P�41u�{<���$���t���i�P���E��� A[�6c��'u��RXZ� ���Q�_���5-}�1i��� ��J�OT��m]���{l�����*#�v����'��i��ZN��)�E�8� ��vjysh�ͳ����Ԥ�#�D����]|s��-9��.>KΫ|��Y�р�.p�c骸r^���d.i@�Ij�Ze���_��]��#�N<}�Q�����A��� ��,�����<=�H8�����lWoy]�c��t]ĵ�u�:	
����e�7'��-�&G�X+8ʍ����1��*R�}�J�p �wɫ����$v�� �5f.��Q��p�c�ȭ����,���fa48���4��w$8��J|}���1����*B�=�c��)D��;��б�;bᾒ�]��~�N��X�>�K�>:� L�V*�._:nKb��G��ۖI}2t��`��7�����4gCǰ����+*MB��򗿹7��̐�zlRg6��=:��0uk�ved��&��ǘP���k�)�w��>t��N<������7�'�>0\��� �tܖ�N<"�䕪�98	:. (���Ss0�n�Q���ϐ��)��+�d=6�K��l>�	"�\.ea������)8����"-�LFz:n�ԅd=:���ygAG�`1�;7�����A��[���?�����C,�            x��[��H���˿"���H�D�!L�5S� ʳ�؈
! ��ĩ&���)q���f���^���)����|x2�kd��N�����r>�����(�xs/y|���}�{��V�?��Ǉ�U�Ѿ{n�>�t����r�L��i���=Ϣ�㎟���3q��9�A�y	������4��^�^z��?/Kǥ^��������脗.�YأW��s/�(ƥ�ҫ���,.N:�i�Gi��(�u,�DC�	�4u�����C�)
kN��c��~'K�������A�1'�)���N�$���.�rt�@t���Z9�v �vlt�]?]?6z��v z���F9�q �qlt��<�<6�U�n�E����k���m?5����k<c�`2a�3��Ōn�H�&�����q��3g�� �C���2Y���y^�^�e��$v��2��fA]��N���,�2g�lE��,��jDyi��ի�f�^�	]��+���]ݧ�b���.5�ύ�[��O�]v��&�����
C�`񀅱�����^�S�w��ߌn�^�S�Z��Sv5�^�S����?X�"z%O)���y�xD��O���L�����)����_;*��ǯd+e?]���_����V�uZ���8�ý�!�p��ĭ�z��tj�~<���un�kR��=4w2���	��짰���<ܳ�W1ܱ��F�S�]7)m�yOFe#'�'����;��w+ �N�������#L}�כL�X���1p�yG|���z��0H�8I�'	E��d�p'��2�o�}(��JrS�����?X��ۭN��b_ͧ�;�P6��
���NM�e�05�`YHG�qE%٨��N����Ty�J�Q�s����C�E��av���mC�O�q�Qb���rl�督�i>yj��l쭮�M��O��~������<Q�<y�(]��g蝈EP	�ժc��xM�^����l�+�2��ĺ��L<���2���Z��O�L�|��n]�����	��L\���[�2h8Nc�ԙȚ�:�d2v%��ِ���O�4N/.�S�ʖ����=6%f��*�P-e;���{pq�o���=�m��D�,#Vr����>�[�N�=>�=����ܠT��}��S�Ey/.cV�j~3�m�K��`�a�9b��Dc&�'����Rf��}+pL�Q+�C���OtC�;�u�l�7�C-O4�(޴��&}Mb�P��~�(Z��ws/�@��h��s�u��ǽ4Kfy�K@g�e3�2��M�{*��,E%�h�M&�6u"iD��m?����Z� R��_�A��g��0���ZE��q�Shy@*���(�ճ�E��,;u'�Mh��O����fA�uǾ�h�bp��ܬ��IR[����.]�0NVbd�2��(·KY��7�������VS�9��v"�[�� ��G6���%��J���H&QO����'ȃ�z�Խ��A�/DpG�Y�R5���@�`�bodD�g-���ґ�\PmuK���:�.��Nl��s%��{��� � "Q�$D��3=������-��7��e�/1q{/�����//�h��+9�J�Y��S��G�:1=��b�U|F��(�P�qń��{�sf�n>��Ͳ,��]�M�m&ǭI�RG�=��I"9e�L��r^�:�o��[���վkܲ�/���C��N_'�cH��{�r�<S�WH�R���,v��ҡ�G� Ҭ������� ���N�e.��_�$���Vd٦�C�b~�G��<���+�@�,"&{�r�h~�켭��&G�9��N_�#v��,������D�ٍiؿ׌��z�G&g�1H�p3-g7;��8ЉV��ע����^Ьr����p0��Ƅ����K�ߡ�:y(eao�D\v��A�Z��(u�������=�Bv;���]��)�v�r����b~�_7��C������o�1n&IL�0Ѻ��<@�K㣧�u��á�:EpS|_y׳��1��h�Y��W��7��֦N*o�g�$Jgۛ�QCycN���������IRx4B�'�D�ryt�j�?�Ə���d+���l���t�̐�?/N��z4Ѣ$P�����A�d+0�����|�n�I�W�nw�7��:r�'�0�dYk%�Ռ�u��ʮ��ܼ6��SBP����?���H+���Sb�����.�{��
p[$ЅH��W�ﮫ���.������(���=�+��?�qL¦���� ��e�u򖉠(V�$�+q�WA�f���]�Z��\!Bv�]7�a�AS�\y{��`���R�+�y��M~ډR��Q!�]�H׭����þ�+|��?\�J*�����Vbu��������2YL�3B�;|Yĉ�)"��&N�N鞈Ā��1yoH%N���I0��:ǡ�n/�x6�w�`���Ң{�F���/��G�i0����i2�9EVAWv]�n�u.عGec�����/i(� ��
�K��cWy�ʏ��7�RI��2������ [#�����ǖ��̥v;���E��s�g����=1V�V���(��A��6�D���v�y�n>�6d��_��������B�-�m��߉+��V�.���J�]֏_���!����KNp������ߚ���2:�mF7J{aM�]��6[���伦(�ƕ-�pɹ6[�eM[�@c���	4&hLИ�1Ac���	4&hLИ�1���$��R���d�¹�������5uBhLИ�1Ac���	ӛ�1Ac���	4&hLИ2hLИ�1�R��4&UUT^�2�qO}��0E�z�ֳ&/0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0�?��醥���V~��T�sQ��_7�U����������������������������������������$F�k\�8��l�?�}�^�E�^����#l���D�v`��ہ�J�ہa;����ہ����`;0l������3�`;���L�,���1}��1�֫(�b����H�H�H�H�H�H�H�H�H�H�H�H�H�H�H�H������v7��l��9�ɂ|m<�>Vza�Vza�Vza�Vz�+���+���+���+���K��J/���J�_�ѝ�J/�MC׍�����e�O��D��yG/�!4&hLИ�1Ac���	4&hLИ�1Ac���	�ykLt�����p�ʸ���`�0����������������������*�n(|�H4G�<�E,_gi� � � � � � � � � � � � � � � ��7"�q��Lk�HW��1磙(X-�_�e�""""""""""""""""9kDR��U�"��;�9�����[:n���""""""""""���6@$@$@$@$@$@$UDb��Os�H��*�s'�`�l�W� ��������������������5U���v����\h������^��i<uO��S������{Ձ�N��x�4�:�yx��ۅ�S���iO�ބ�S�Oe���N/<�:}��t�:��u�2����z�0�<Y����l>GuhLИ�1Ac���	4&hLИ�1Ac���	4�3ט��}��@$sQ0w�X=�]Bc���	4&hLИ��	4&hLИ�1Ac�ƔAc����bt'�1	F�[F�J@ո��k2�И�1Ac���	4&hLИ�1Ac���	4&hLg�1i\�87�-"If�1W�X�E˩?[@c���	4&hLИ��	4&hLИ�1Ac�ƔAc����bt'�1i�4TK�>Tn5v���EM��8����S�4���Cc���	4&hLИ�1���4&hLИ�1Ac��TE$�����������H�������S+��1Ac���	4&hLИ�1Ac���	4&hL�1�������IiL�ij�S�$/�/Q0%�-��И�1Ac���	4&hLИ�1Ac���	4&hLg�1�ꦪ�hL��s�OD�Ԛf��!   															ə#�O���̳��-�E��P�#���J/���J/���J/��z3<Vza�Vza�Vza�Vza����^X酕^��;��^u��k���\��nL��2���	4&hLИ�1Ac���	4&hLИ�1Ac��t��@$�-"y��Ð+�Bl��j�b�S+��1Ac���	4&hLИ�1Ac���	4&hL�1�������)iL��XWw�I����`/Fl��� 4&hLИ�1Ac���	4&hLИ�1Ac����5&�V�L��F$CΗn����y�I															ə#���."�\q<Q0/���a���+���+���+������X酕^X酕^X酕^X酕^"4Vza�Vz�:��Vz	F�hkF�k�k_�J_������-��Ac���VthLИ�1Ac���	4���?���	4&hLИʈ�^W�4�-"Y�Fȕa]l��\�L�H�H�H�H�H�H�H�H�H�H�H�H�H�H�H�H��X�Ʒ���f�ԉ��D��e}�Y&															�#��5��i���H&����/{n��8��6��f8�������U6��f8���`3l���p��[�c3���a3l�s��d6Ñ�N7�5s��g��T�z�(Xo��ӱ�	4&hLИ�1Ac���	4&hLИ�1Ac��t�U��떡_.����z������s�         �  x�ŗK��&�׷�KZ����:�$�4QZ=�.�`��7~`��$�mzqE6�����s���uJ�c[F@�d���b�����a�T���c��:��>�������������^���+��x�����׷��_~���_>�����:U��_R�;�݊��Tb�]P�:Ѫ���w���D�e�K�)���Q�/ ����mp��>�le5 �>��Z2��!�����4d8�fQ�� Aq�YOw��T���p}g��2u=�Iz�&(�,�ܑ9�Ş����R�`W�T{P�RѾt��C�^���f�:�:����&W?%���N �"�U�C�ij�����;k�ݬ趤͢F]� ��@|��4�2�{ߞ[υT���g�ݟ�Ɏ��BP������ ,�3g�x.֝b��&5�`��C��r��Ȧ�>�ӺL���e�!���� *w s�B�|�6��0�1
�nb��@O�PfP_���.uh_�.�Ɋ��1}��''��8�3ΫS�L<O
g�;ȠB<�9��aWұ&���B��Y��k��,�q�KS��}��&��f]s5ЭN��}��0�!�����YH$�_��8G�����!2@��Y�i�z��,>�C���|���:�W�#�x�1�fF�q׫�]�0?�?��bh3��>�%�m���&��ח���P.�<         �  x�͓]k�0���_�?s��)_m�v1����]�H�˟�e5u��M�H��
B��=B��#՘����F��!eq5Z�/���V��%�O��W�!�~1`�F���r�~1���G�m%��oR���'���!PC�z�SM�[	�3�<�����)a���,I4è�k<߉��$b*S���J5&3Bf%ݣ�:�8q�N��8v^�zk�G��H��?��:B
i�I�A��U��tT�r��[��b v�.�\H-����V�%?Lofzs����/+�ԏ�<J��w�'$�<�����()�&�b��Jv��>�uV��_�4�L'`���nQ������ɋ��dD[�3�N�S��&�������S��\C�,5U��4�C��<H�k�������� �^T��KP	)�U���v�P:5??�u������SL��c��%�(����<d~���?y�Q��oE���K�Tn�������o�N           x���Y��H �gͯ�Q՗��MBr1�ݧ��ѲZ�%�,˿~���0�#k0~�w}���Ry���2�p�)�t�2��0ܶ��#��6Jʰ'��'�v�����㋕Y`%e.�"
 �������M�ݗw����E��-�[�6���:�Ea#��� �G��|ű��P��I>MN���'�e(Ş��o�P�!�k��搰�� yo�%�hY�����;ㄚ��jb���E|�/C\d ~@�#�#�%����!r)�b�#��Ӳ�V��m�\���*هQ��`,��5a��&�w�Ĺ�� v�ǒ��pח����HJ���'�Wi��X�cљ��~�T�/��$��T��N�Lqy�e-����ŝ8X����f8�y���������e4�p������)�"0�H�0��XFIۄ����(r{2�n�����~-�?�~��h�d�K���UF���SX�fލB�M��Qַz�kӳ-E�y�9�3�=\�W��� E���>s�R��������=L��BG�(��*�ݨ��ltX��\��.��ݱ���_��ٔ����6�����������F��{2~�O����� �c�}@I~����6>o�v�d�)�֚D����ޕ�7=ܲ�M�D�ek�QoG&� O�딵��Y�Ú��7�a@���{�S����:L\�(���Y�3!�B"�W�yQ
Hf���$/�a���gTȫTJWa��U�3i�:q�r�����C�mU~8777���Q            x��[[s�6�~v~�e�T%S�I��&k�ol�%ɓ3'g���M$A��(*��} %K�litv��}�@����g��N��pS�U���V���뜤9ew�����"�7K�O�`�94�\�YTx�?����%�ǘ%/��a^���d4a���7�	�7��д݇4�z��O�{��Wޕr�`!��K�R.�F��b��b��������^V�w�V_!f�PM��tm�(��h�7,�:Ŭ�� ���Wbu�p�	��?�~�U���z&$ϱϕ���'k2��F��ݗ��������8����q�pD�|�:5���(�+�RZ d����z©�zƥ��3�������zb�]��?��]MQA�K�S�+\��HL������W��a�>َ��mi}��Ǐ�ZWq�@��gk�0�G�_������N[��%��%��!���+PL��9���Ý�P�#�9���c�쉟sɁ��B�����hF.B���BB�PC9�e�H��2.����<�Ɵ�&֫F(�N�QP!��<�� �+h]��Q�7���_F�,4��9t�-�w;��T@6�M�iQ�����F��E�XQ��=�-$vp5��&��4%1rH�#�Y����fk�0R�B�^W�ށ�ȡ��%X��w�O0�̃�ϓ��y3�O�!4'�w	\�5�IFkl%|iO�&Z�w��d������ߊk� �B�]���$z|��Z �"u!b���W#�v��j�+��E������F^o-ùP�\��e��C⸁;m��%!c{��f�	N����wJ�c�5���$����vX�#jAm�)_C]�� �*.+2y�b�2�2y�b����L^����\�!t�?��FwS�4�f�穵�ڬF�RP- �#04T �a�F3Ր��]���!�!��B�}�~E3k>��|��9�a*p��V��jn��[�j��6hU	x�C���q��Nl+��j Q�-��g?`YT���n�� �"�7��H"!�zi�#t;z���ߡ���*�)L�O)$�]�cP�<�J@�-x h�J0�7��B���IȦN��*E�z��c�MD�du����7�V���UZ4�E�x�O{TZ|��Ս��!~�Z�s�|�ö���[R�-��B��1��5�\#����ߞgs$��PMK�_�T�-8�*��Z0���D�b��r�dC�8��;�[����q"��i�-�@l�f?4r�2o��+�2-¦~�V�y���1����6�i�jz'>;�ł���^|n�J�`[��V��Zt��i1�s��(@k=����&!��A����ޚA��>Z�+-��O�R�Ճ�<t�/�d�����>���>�W�oi� [;���/34��w����H$�m�g}�� ��_S�iR���o����^�#���R��#���b���G�KU������!.�̟_[L�[��o������p�G$��W���'�*ᒭ�j;_q�^�K����h���O>���f��<�|�tz�~�܉Kl��:_aqj���ߍ�b������n�t!+HZ�:#wiS��j��,r�v�b���G6 �t����J�	.^����ͭ���S�w�l=�)�;d��B˄yFz��j�6�J/r����M��4Y@pM�����Bg�+���믋�V�$�ׯl���_���5�����[s��݋�`
eΑ�L��rE��2�����֮�"cY��64�Uv2@�_�C��(>2"�K[Q$�FGZE��^IS��~����.�^�#-�z� Is�ё
D��E�Tj�?B��
I3��y���II��a
��ǉ�W���
�(�rAy]�$|Q q��BW�F���������S3e�Nos�4U�|Ov�����1Ԥ�h��(�$��n�`4�u����Ϥ�4�u�[�f�zx��|�ߣ�`���y]�+�G�
l���PC^F,�]�7o��9F^B��t��L�Dz�%/!Vg��%��[�bu�Z�ۧ�/N5$��̵`���juFZ�U����2�p�3����_��ǧ'k�fֽ�u�q2�`YQ�6[<O5 �^���=�J�j�/Yn�uFPM��k�u6����h
�-�U&��f��yk�5[�����'<laC��'�����x�N�`�r����.
�c�Qg�&Mr�����h����6��S�	�n*	v:C�7�i��Mk�I(ԙn=Ox��-�S��h�˫3�,M���&�q�΅��hA��.m���C{��G>t�m��K��փ��}�mn�H��\���-D�5A�4�;[�����<�%'FY�74v���a%!�4���á0u�4R�X�<��#�q,lV��������o"Ǐϓ9��v4��i�({�ʌ6tg$	;�������({=�s���C��dݐ�P�3>�4�F3==?<�r>�W󎸡�T&�j�MZo�J�������X�GI���p�@1�wqC\¸������e�g���tf%|L%Bښ��C�8��IR�s��1\�h$$��MZ߿���p��|4���ew��������E)�
�s�����C��]X�y֟P��Ψ3��Ɯ3�y��_@?��P/��H���F�yC=4�~�~�nA@ҳ��O|�[m��B/Z�ER+���6~ ������?�����@�P6��K���j�Z�PW?q{5ܞ�oQz%N����'VJX���P#�����o�_����[3�"��,h��3���{�j��*EEdY�Y�<ƼR�Cu8���3��Ď!�o�m��cp��� L|u���Y�V~%X�}�f�l��/�¥cS_9�f`�Ղ�D�(O�'2��=�z�}UW�HQ
�1��^�m7� �Y�u���[m�|ܬ*�U���hO[[�E+-}����c�[{Fu�2u�\�����'ԇF�Tu]�3��ߘ�BB0G!��S���YG��đ>~������� �4={	pak�e��/���t���J���zŨDW	��]6y�w����gh���������Q��p��=�
HSĊ���D_7}�\��+P�Y���@k*��[q�[��}]XY����ti�W�����`��+j�W�DGcۨ���������%pl�>H��8>��[��o���}:T4]��%���7��8qf��������~��v	pƏ���ԞW-zk{�(������J
z_�z�K�S��A�M�����a���"���Z��� m0�������,Vn���п���%�R��j�������l�Ҩ:Mr	gt�N��Au@2�=�8U�*�ϸ��+�zi�b�-I�����fl��z}� V�h�_o�atu���g��T���źT���	����z�V�oe�S��A�ۺ{S��i��r�,��ꉑ3,>��k�}����"��`�k\E��Pg���p'�"���=�曹��+���u㔽�5�{.�E�y�����Ϯ ��ҁrcYb�-�hXf�i*J�?d�ޏ�eb\m)銪�2�	�a��<�+5Y{���J�\��x�El߉R[Q�E*�\�U^&�b�������ϥX��m��@�$��_�=��w3Ȍ�⯌8�:�����ݯ@�T�I-�*R��V�B�8 f�);��*�qf'�Ui_b۷y��`u���ibA$h�A|^�<1bخ�	��C�������Z�4�-h&~�3��vh'c:���xѠfyx�?� W0�?���nP�Ƒ�߭�H��!���JYg�M~Z��<��z�'���8��k�E5���H]��V(���ިƫ,fɑ��L��Q�P�Hm�ہ��ɻg er�8b,�~O���V�Z��t���^,��$n2L{g�9��J���e�z����m�N���a�MY���m Ā�[��g104׮�slp����W�+u`�����k'�Ì����������{"�y�j����_���&��Ole��Gp~1Ѓx���NJ�6T<���y�,���-8��!oᵸ�a�|���{� "   'z��SC��?������w����߇���c|         �  x��W]o�6}V~����J�,i�i6��R���
�H}��(Ғ<��fNbi���<�9乤��eX�$�$�(p����r��n�hcA�r�T�e�������%��֒VZ�r}�Z�(���[���Yhɣ|�4rܵ�׬B�,\Ȕ���k�$.�$:�d�9c�虌�⢍��0Z���F?
��y;� �iL������j�³8)�`ݚ��3��n���Z�'�B�Ӵj������Ph���5fS����L,y�,x���dy\�Y�˖�^��%c��C��|�����$IU��`�� �Z�ylg�d�dL7�ɝ'ޚ�}cB����I5�r��Q\�A�dͿk�BüM:���h�E��q@Nev��fXm���	�)gqS慴�Qb�4��1��.B�����\�/αp����)̂E���N�=)�[�
�KG:��-�1�Ƙ���lg�V.(ew���C�DLb=��ܪ����̀1KS�L�6�v^2&v.�YO��^ Ta�4���-Y?�!�A[�`�r�e�&<G�3CIޭ��9�3O��d��ڟ�!׉4&�i���X�B14rO7�2VlHJ`�IL�ȬWK�=�k,�g}�d�h��n�~���4�]�9]�DhB�B�&�
�u�{��	0�/zB&�+─/ �w 0�MX��?���K	�&5F�C!�YP��N2.Yƭ�a����l[�ȅ9ܦ[g�Na0Z�G+�0%�+��"��*ob\��UٵP�� ��1r��}�~�C6��5���g�����>rfS�d��}���X�{kԈ��o[o�<e�b�c1�w)&
 㙝ID��j<�:��r1w}�m�T��5��N2�=6��x���l �64�Oӱ�X��]��!`�3r��1��^�#7D�?���r�Pc*V�!Y�n�=M�+�aU��ٛ�k�xaV��J���Iu�4Ｅ��\����ϗ�9�Dh��Y��Ի�W�nלP�q��ŭ�&���U�,�`�'\�97�%r]Z{5�T:�*5����3���FcH@I1p�jU�e����l]�a{����-�/�3x�4ֹ�����q�����}C�Pd�\ܟ7�KOK�vb��^ٌB#��t��ƌ���	��?���U��27Z�|�=E�f0����I�O�co;&K9�@<�Z/>	{���1I��o �����3�˔�)�-�2ۀ7��t(�  7�\���o=kY�X��ޛ�����Np�RJ��!���s�ɯ@n��{��������������ſ��|4      	   �  x����n�0����4���g	�p��!���5M#E�4�T�w?�s׃`�*Y�+�PJX��Y�pė�R�V��]�"��w��0�Q�S�g�n��Om:���"em�
���с���#��jYX�	�-���b�B����{y�>��O0��h�0 >Η�?� {CY���{�n�o�΀��O�J.-qwW���zd�PG�7E����B�����*����ެ�����9�l�F��\�j�r��Wː����/�n��v�́a�Г�!������������D_���9���<���B���p�(�4��>&t�~�?P�_����#���3���\�0�W�i���?��WO��"�1�MB1B��|:�E�/���̰}��+'�p�!�ў$t��%߀|䫓�{4$wc��Y��ò����4s�\���i���t��JS������j�a!RQ�j����K��H���'"�m�7����v��}���      
      x��}Y��Ȳ��W�{>q�J���D���l��f����A 	�����Y�T%���xN����n-��̬�3k���a��nq�}4���w��f��M��k��?���2����{y���Vk���f?�A˴n�vv�m��ݔ����s�fF�<W�騴�g���j���P�4�͍9ߔgFI������g���K���晳m�a�]�\j��6)�?<�K�i��a��4����L���`��>7��zg;�{�,n�Gmn��dl��+p�������9xck��q��aV�Mx��tw���q>۰�@{��_�8c˘�:ynY�������kk�g��t���u�/}/��N2>����O̵�ٸ�C�2�������2���d\^{����q��7���͝Qq��K��=�6��n�E���	k����td鰮K���:�'��cp#�!c['r�'�M�\����q��|V�a��f5���6����cV.^Â�f�9�k�q܊��-��h�{odm���9_��Xo�׶��{��%s�z�����T��]��O���̰�^,�����q~�9O���=�ڐ>&��^ ��t�� ?/3#�O�j��� �FM��6^c�w��>��[��f2�5����Y�p�n�G-r��vf#X+���E炴-�����Y)mE�<j@���t=���\y>�:��G�C�3���o}�lܑ4[��������;����^��W��uq������s��^��9�=�wI{W���98�!�/�ma�5`#�0�V���tGA��m��i���`���9upL���Y�q�3�9p�i�v�����t���u읱7�p�x�^<�t�[dNd^h� �� k��6�w0��7��#�4#�9t]ҽFE���'���5�=�FG�5���la?#�U0#c�}iV�5�c ���h�qO�4g �"Α�}a=��|>�����������t�4����Q,�����c�����v1�~��\���~�{�-���g����f�l�v����>x^��o(���7�����jY��/=M+xp��=��m���og�ϻ篛׵����u�u���t��o�nOa&�o�~��?�>y��l��vJ������9v�8K+�/�G���m�so��k2�3{�����~%�_��^���Q��n�+�W�tv�B�`��������a�� ��mB�c�Fh�
��n���"���"m��ne�<:&�3!����{*��l��/�!<�zYG�O��Z	���Fo�pu��ǅ��5z/����O�~2��ȩ�q29��a�a1��%����� �W	�DYk�ANP8�b �쐟�5�]��e�6�Edw0;�\#�~6�\õy��*�}F�����#�ZN��lÜ���* �|�2i��G��=�%?����_�����$)=��t��e:��eְN���F���h
���l����w��朌)�3��f�:��`8!���1�����&r�W� cidݟ�_������b����s����;� �>8�Ry��cs�^y��߱a���>��=�{[����*�+'�7��387d����G�{�_�����/���@����:�~�^+�Tg<98���	�7D~u�F�-ѭ�RH�Ei�<��Q<�^}���:�v����X�	<Q��d.7��X�]�|�t~�1�D/��z�Y��-�s���>X8TgY�ly:�
��	h��L���WN�����o���#�`�X�W�u���;�:�%��Ҋ§����<�O�ȍ^�m	��#�����.�"2��/�i��~�O^�c{l��*��ר����.��_n����l�\'�s >z	�,��&G7��z�9Y�怯�9�Rӑ�9E�:@NÞ
�T�c4n=��̣P���ƹ̀� ��1z��z.3��8@��ま�?�G>���­18����
�@#8ׄ���x�[x��>�;�Yz�~�F��+��/c�{A� �V�}/T7�惂���z�o���b� �j��z�bߋ<^��u��%��Z��[QP�SqN��*��������?��h;^݃"ln�5qni��/��s#{i:�������^q��Ks��m�ΝzI����Ae�x�hg���Ϩ� c��YNa~i��� �v^R��/��Ё���RݩK����ΫYc��0�Q�n������kg$3���.�w���KMzWA���(���bb,����/��S���Зz������7���I�N������7������20u�3%�!W�:��`���om����"�&���¢ռݯ즣����������u����ڄ�oO��:�ۍ���\���kk������s���m��0�^�Hl�/}r}pހ���k�ް3|
��[�^ܰ�C����i1�mAԁ�Gl��ݬ�j���75�3�e����m����'~~��F��F�R�4 {�㨗����57�6H_N������f:/~G�c>�^��8},�u��f�E&�t.�7|}�5��3�׊ c�'�D�����N�5"����)�uR�E��fd�#�}��^A��KlR���F���?�o}������6�}r'L�#��!�棝����Ȇ�,�����"8F>���~�����	Ι� i�|��D��8=�4ݥv6�]�7XӼ+����O�d�
~��8��h��`��t��<��q�oBЧ$��dܞ/��h�r�����7���s�a�����?��>�qϗXd�8>�'j��SD�F}hPk�%9Fe&{nB�����Y\�˾G��K�}Ď2a��D���z�z܂�p�V�y��je�a��USXYG��!;��b��y��ݍ>�;t��<�k�yPY��6�<��t0O�WX�Yqݰ��@���q��e(�p��w���V���	��#g����ݾȮipZ��|�:m�̵q���w��=�a�O�5{��Ah����1�V�Ч/#��#��1]�~��xo>ANd�����v_�f��Z@ms��B��D��g�GH�]������֬;�G�1t�%~�Y?:�:-�m2�jp�47-d�4g�4���	ƃ�/�̈́��� �7�?�̦���t!|�9��%��-��������R\���>~&[�)_�lc&��t�#Γ�a��	�F��"�y:'�Y�o'�Iĕ�C=A�Y7+�]�+�y@��:ְ��P���c�|�o��([��b��}(b?C�6��t�BQ�gE݇�?��y�N��`�^ބùY�%��G��s��-�T�	W�N���Oj�I�O�'�mG���5��1	����@㭓��U4���|OP;��b�}�yT��朧��O��Q��8�i��y���9�^b�v���`�sQҥ����tB_�]�M�u�]��苌���t��v���S��-��c���=�|�8�y4���c�mqo���cq�/L�!x���Q��,�b>[�(�k8>	��O*�p�-�O�Tkoy�ʊ���3����fu�\�2��6D�I�k�H�z>���B�-�-���zR���h�z `q?�����?fT�nL|�J���+�﨟}cƜ�;�'�{l���|G�ts��a���l�������F�t_I<<���q8O��7��޺&�d�x2�*֡�d�w1���]�V�� ����>��a�+{&���C^�:6����o�V�>a��>#�)�:�Z�/$�S����Md�L�ga �N<'B�[牞*�E�M$:�m��`��e�Ҷ���!��}ZZMG���mJmؓ��AH��g�j���8 [�{�^d���d��`�G�7�~�چ� �Ն�M?�Y�L��i�?,{v���/'�������>�3K�����Ź��wB�N��i�1�kk��$O&�&ʚ4L��%���W���P����D��ЧW��VNt �F]���5-�.�ŵ��������    y&�0�­:��_q�\v�<�,+�ަZ��_�	��`��ㆤ��z�g����k����:c*����Vwk����?����x�=)W�ʡ6�N�)ƪ�_�Jq$ĩY�;��V��1�¯h ���Ol�u�6�t����1�g(�|���|�����O�='��~���W|�׿�{�g��*N�|����y�1h�Ž�8�so�>�ܸ���W���[r�/k|˺���Ac;S6����ȷ�ٯ�*-\�xLo�0��f�����tqĽ��7�(�M����y�g��-1����1�L���l����fh^��*�aDb�b��:��R�/�!�qc������c��]�s��� �if�rp`�N1��^:�����J�����=��s4��O�B��5z[����2̌!�S ���>/,��:�I)޶v���Bt��¡��L/in�Lo2��Q��:��cیyd:ׄ���Ʈ|��� �FF���/�H|���ri�ڿ0�s�a ���o����	� � �:��iٝ�O�|P�k8/�S6�vG�l\)�(��J?�Q�~7>r�����ei�9?�5���,}m�?{���o��� [�������ˋ��nm���WR����y�owϯ_��<�_o�.o6_���W����D}0�1��
w��ݸD�i^Kԯ���^�� �f� AMx^Hb�;:(�ԉ۰ѐXN�]k2vC6ָ����>⤂�#e:�AΊ@��rt-FP�)4&`�1%�j��$��۶5J�`D��]�l|�ɡh4L��y��0�ʑ�~��2��!`��ž��Z�;����0��Y��aa��m����ϓ@��g0F@�������b�W�aA���%�`Z��m���#p����_���0	��k{@��wV��~�1N�D0�́�' `2s�_>g5(ʖ?���ì5�&�u�8~S8��i/�n�%;6�����kH�֥������yL����F�mƶ|��0�W�r�
ٷ�5����y	D��ʙ51�fp+�x�',�����d�^8����3.$�0"��1���n>&���	�d��,3�O	)��'�JYZP�LP����/~��}�:L�w�}�߻J;Ffٹ]�e��1z��8�*X�Y��Þ����)�b~������7�O����N�5��)&K�A�~�����E�G��?]��}�����/�)�E%�J%|st"{�jS�O�+O�$>���2eK�෼��u}13)��8s�SS��X!/�,(�h��)�I���[���=	%I�+���3z����볾��s�� %^�h��$	�w7q��E��c��]l�t�tJ��6Mg4Z^�h��ӁҧTD����H,�I'vr�ȓ�	�q�7IP�=����e����#��kB�ED&����L�<�7R�� �*X�U��[��8��|�$�&ss��	�7^D̒�I �~�������4)	xϊ&���4䄧��ؙ4�Ż�֌��/�ON��oɒx�c·l�u^�o�dU�6��,k�s>X	�����ǝ��=�����#�Qf��6�t�Y#;�(O�Kqrt#����9퉉�םK���q.������Ċ�ƈ&+k���{��q��}�:_Olk�i�s�8.��{�S"�s���6��#u���3�SN����F�z�k�N��y��4�MxAA��U8f�e,FfE�� ��a{�T����`���r��i��ML� {.�t��i_�zۆ��K��D���)����=|o4hB3��}�zH ���gxv�ҋk8/�'3�`$�w�總V��w��r�!��>�+!a�F����1�(�V�9�e�_��vB'��Wm./���d=�&��s�� �
�D�tIh�'R	׌L�O�< �,a�w2	@�))��#|�m���Y��iI�Yi��ϑ�l�F����3J}"�g�sdQ;ͯ1�6z�8�qUL��{ANNOdw"�\fߓ�!єPBy$�0��J���˃���t���$q�ђ
�G̖0Xa�A�T����-�+��ا��d�yU��i�N�f�[�M0�1�웅�$��l�<��f��}~ƀ��/@��}-����=�q&|�rQ����]qٯ*���0U�?��n��J�溉��J���n�u���.?�+K@��ӦXȝ�ߵΈ�I���}6A2.��uhb���$w�
�.��N��{����:NW�$ ����ݙꨢ�#\S�*Zl���v��klM>N���lH�/�>�0
�fU#5����E�!��x�k?�a׋�D 6i��ɟ���u�a�u�.Q�0��cAۮ5}��;���p~1�ﶻ����{��>Og��k����ˏϻ��Џޓ���/�����콟F�����s��������Fv���1�`{q�A4m�.Mt'���!�т#�D����M�Vѐ�A����)�t��.���@����	:���v:�֞Y����xc���\��ة�I���+<��A"!�[��i4`���;��R��<cE5:�r4��L���-x{��I��7ì&ߐA��&R��N�ʧ������ʀ�:�������M1;�_9@���Ё�*�&0�UJ���u��x&������t�$�����#�o��q�X�X�֮�� 50~�ƻ��,v�թ�
�j�L�c���/~��"2V�6A6 �P�_����������ڦ��\n���&�\���"��c��� ��U��J��Ӊ�xSpR�s��V���|3H-�h��Dxݕ䑛ı�6�`7��B33c�8zϢ���gD���x�D��9Ȏ:�ٺ@enlp��{����\P��d0��2�Nѭ@w��	�����W����E'u��b����j��ޕu��*�D9C癄��#OvI�>�ng"(��E�>�'�� �F$3��y����L0Q���l��0!`�ݥ ��SȮ+�a�10ജZ$A���g�O(��J�����M���ʷ�㑯���n��;�ޚ���ߞT�>2=-D����j)l�u2Z����ǺQ��$�s���lb�����:�eq�u1�������(��$�>�t^RByק�]����Kޑ��y̹n�s����d����EX���J��s��Y�}��/e)o�D�5�+�����w��\"��ivg8� �l\쌓���v�Hu���)�a*	.	ψ]{��[762�$��5��i��z����t�������㤉�����Gx��DǛ mL_?mc��O£O���hC��3��bRĭ����u��t,e��89X�۷��v�b���������T"IfA�K���'��}��Jܘ�D��^��: ���5�%KT瓰tp�C3�&�Wvxv����x7b=���;��OUG�Υ�;���úB�I��T�H�j�~1��c򋔄3������I��)�A�����_��c~��vNXz���f&�%����^���刺_BV�:I���3��ߣ����,�?���2�W⻱S�K+'&{!�$5֕~ø��O�|"m^�$Y��s����:(%x��<�[]Avk�tGלyg:�Ω�Q\�4�7�;��ͪ�;杪�B}���T��;���%>#u���j�W�T'
�H���N�S���?�ŗԝUu;���T�x�����C����itOfɉ@�w����F}JqP���ģ��.�i1�9��� �y���)N��Z����!�Ir�Y�VL�T���Ԝ⤇&�	���q�FN�.;	�&x7���$IW���I�(����V���W�	�x2�S���%lghpG2k��%�&���sU���r�Rt�A���$y�<��54�s��s�_���U�x�V�Z?���速t.WT��ү���<��>ݑ^��z��i��V�s���	�W�U'yI~=!-\�c=�x&��^�^WnU8����Gf>�q�ID�/(n��&W�~z[H�`�j<	!�E��Ku]:A�����    ���������^�`�y���������t�)��z	���؈<���C�/�Qꀎ�_U�����[��Xu���i瀱��?E���2�ܞ����4�k���ԇ4d�[>PG�Kp X�3i���*�TWw�k�K�&+�����"NXU�<W��an�w���|1�V�Pc~n\���c�^R����$�f	/���d���� �߽Y�qEv��{��R��ό���7v��}���e��JJw��U�2X��~e���^�n��5{e�km�����$U��Ůmw�ܹ�����g�f98A���`QEW�
#)�	>k�P*��o'lir�P� $�]��4ܺ��.t��ҸVu��m�*�t����}*��pi���8�#�OI����*����RG·w����U����׭����(`-wo�)co����n�(��ǃXt���/##����s�hLb?� e���LK��0O�ί>�%O����b�E>v�d�|z"C$���S������rX(����S(�� )�6>QƮ/6X4 �|��м����yv�n�w�=���C�QJh
(,�x@}��4�~7J�0;L�MWt�[�D�����:�Bf�����gXh���{���=��g�[6�幥ŝp�B�!�ǽ!���~��I�� 5�3�.�3$�$�0"�c;"����V����xn��Q4'�Ɔ���j�a�4�s�����1�ծ�C,
x�Uq���zɀ�W->��$o�i�M�.vy�S@JpƊ���i(�l8��4���D;cc!"��C.���g���Sy��^�Z>��y�l���~B�&�R^��dri�����6�w���p����Ao���Ah1Ɛٴ�+6@Z �����B��N,��Zǎ�X ����yg��,����38M��$��~n����ݡWkV�Zw��f�v�5��Nv��nhv��O�H
��5�}ӣ4˺�2��3llA��c0�f?��b� �t����k�o��<��sgP-��Ms5<��f|mt��~� y��]R2<�\���qj<'O�Z�<*���M��N��l�����h�I��I�Z<��q�A��x?�~W�V���(��.��"ht�� Y	��vr��&�&�����5����ոO�ۤ�_[����3�]���)8&�n�M�H��<6��qY���7(�8���^��lA_�I�}|���ӛ�
��Y�6�6����d&�<�L�/��p����_���Ot<5=�oߢ��X��׎���$8�e���5i_�~��1D�%�{k�m�</G�77_�w�����Z2Y�c�'�>h�Z'�S�\Z4/]c�ei�N���C[��@���:�	S�5��:-@���{�dwrAM� �U�M�ڭf��>95R��>�.�E<R��\�a�Tg*>��c�c~
��${�\g���N�D�a~�d���N&eMO�	2o�[�_U�e|\?�^���y7�g�;�֗U�_�>K����1�m�����	ĦO���^T����9(��Tw�q�=͝�-�U6�`�D�6]��$�f�e��;�pR6iaxf6amP�p���F'}�,�a]��j3����/LĽݖ��}
�9x��D��y�0&���~B�@�K�Ĳ���M�U���~�.�(�,f�)r8����f������'������^���Z����>�5�s�=�<���`��#�$�&������-Z��TO��5�[^<��hN�ˬ�_a��'k.����i��|��p�n�<�H��]�O͹k�(=�7�I�RlNb��h:G��sq�b^�m4W��y��c�t��ːO��Eϔ���O��Qx�6�濦͖�|.X�I�_>G�-l��ƨmǅ^a:���=����<͍Cmn� ���I�@�v��&�A�U�9L�l���s���N��	]FشuI乒�Cc�7� �$̩�Ii���nX�cԗ*�Blg�g'�g��1}�|���R�a6�J>1�;N�I���T#�$��'�7�d��MrO���}7�#�ݐ�AP�1�|0bV�&�9���?R�kD?9A�I�98+�i��|�o�xb#P)wNh�hZ�4���ܫ�ĦQ�$´��7���)�Q�H���Ú��5W���x<�0�Xm�&}���^���c�%?y4�JEܘ�X���?�ou!q���g�q�U�����~��Ra<�K�-�b���Z���k��V{�:���F(Ɯd:i�;g��=<6KoԽ_�o�|�3������'��D̼�q�Uy}�.%�Go��I5��w�t��_��8�����5<!\�1�Snyࡽ����F�o8}�5�E��}q�>Y1n���c��k½7�v�rJ�BS�c�6������nHp8L�0���b2�_�vRo=�WB<X�:���q��_'��{b�_�3��Y�r���z��K�u�~!#E���xm
�Y�Yh�w�/�ߢb/)� ����K�3$�#�o�FA'��j@��&�Z�Ժ4W�u"��*�^RO����ú���mIMO�)�z����ƇR��r����8�ך�\csӹ���h�ƶ����Ӄ���x���07|�x���W��ԏ��?�>����9�}���O��P�Q�U��t��H��ꪨ�yj:=�6�0ʪCN���+[^�G|V��/��K{���a}��~����8)�u�5�MR�oL��wi�s�o�;*9����k�s������C��>9 �Ix�v�~��L\���c�gHܯ@;��:���>��Q>��M������l�×��k�n���e�0�)�}E��u�)x��=n�ߪg���l���u����:R�:�k�2������ֲ�-1ǆ�ڽQ��+��:G�߁�A/Q��U�)�:���~9�����?T�M.�V���&݇��O��������w��w��#@?�$q@�.�f"�&1���o,����|�߹���nJ�����~s�[6�r7�CE�'z~ܐ��9e�tn��#4|#�';�l�[6� �k<53�����)Op�f�?9T���)�=(�{����*/�$��+"�A����{P�I�ً�*�Xy����~_;�����}�1�ݫ��"��ҁ�b���۳�o�� �����ݹ�o�mȇ�
���M�gR�]ˉS��9=f����625O�@X���W����Y��y ]u�ey����0�:{���e�Z%��@s��IE�����l+�Ir�I~��=r��]�~qI�X:V���{����X%�q1�2��3�U/�0����aʑ79v��#�� �m�f3qKs���T����|��ϯe9|��|��3�������@�,A�G��\���?M{,�O�/I~���醴8w��Ƙ���F�y�����R�&����y��v�R���	���Nr�c9S#a�y׶�T��',�kwקg	���qF�E֎ :�%���ǵg2^	�a�o���z��Ԝ�|V'����Y��:@�NMw�i��J:̕��xx�u�D� �EQ�#�K_I�#��ἴ����[�2!W篣�����k�}���]	�gy�9 =}*�2뮊�����	����|��JWY|�7�\=��H>Om����=B��8�K7��r���>���y��=�s�ߔ�J��d����$<�{��~���T�9���?@.�|oT�a��鸃�d9�a�d�l�B��")OJ��̾����>xc��`ο��&>7�6��)�'cX7z`�|��� $����j՜�y�7DrWά޼6��Z�.�+1_`��X_�����?P:�W��pL���g�n�k*��b=v���������pB�/f�h�n	�Izgi���/7���_���{%�pj�37曫4���ς�0���K�cN^*g]����3|������<>=H?+��>w'Oʩ�}�aGw�y�`���pk%���?�*$���S�=[ҵ�*���7��j��|h�6�XS����^���&���e����뜪��Z�7��+��q�L��_Z��Xe�Iz�\��6�{EdK�����/��"O�z��#���z�i}5�u��w����Wm    ƕ�Y�I�`?�X������������z�|�#��_�êZ�k���1�z�\V�-/��m<��k��xu����kt��������Ç��C��S��*�܏;��u�L__/�����~�����:p�            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x��[[��8�~��
#��j����I��$���eCJ�E�2Eݼ������n����]0)�Y*V�R��F�4ݝaȭ᭽0�\�/BEe)YE��C��_ILbP�$�p�J�m:��BCB��&��N�*�C)����^��p�p%��ʘ''��>���F8�8�J�0u[?lH+d�	q��O�/n���\ ^Qi�S%���9����9 n�)�q�\��/g�^��b�<�6��^�P�( ��ε	�Ik�F��mۦ��E%$��	�q�@l5���(��č�@a��� �b��*h�$e��`������D{{ ���A��ۆ��T�N��Bu��[Z�Q�����۔�R��V�����k}����P@M��U��ՠQ*&
�;U��^t��Ů���!�K
��P<Y$�2m�^�����D�]k������i}�+AST��+B�[��ª��},� �4�Ĭ����]_$W�Oů徏��1t Ѕ&n#ըU�:S^T�1+�\%�$���L��cy%h���Ŏ�aE6EȞ|�kW G ��a�*jP�&��@
�)���~8pt]Ƽ��(�Y���� L p����m��[��X������y�P���-/�mp�8 �|�s�Ւ���$���@:�ȩ��[Y?���C�Q4/�n��ز�1�<�(�X�b뤻�=fā���2�m���^ơ��v`t;���Q��h2#/	S��*��r,>�0`YT�6)��Ăsђ�B->�硩�;૸��=����]�v��*p���sN9�[wS�� lS8�Dt�ޗ���=��ū�@ ���o�u������Zܫ#Wx)��Y� M]�?K=!����%*�1+��i�����x�<�U��q;�΢��o�f�����ݸx�< �TL��Ǹ+���i�3�84��%�h
�Yl���$�3�2<�ߕ�Jeh�b^���g72{8���yW�vи���� �����á�J�,̝��Aԥ0�d��V��@N���:�W�BS[�h��j>�X��?�r��j�7��*���[�1�0�q�$U�nKR�����(��\��H����l6:��d�U.cRe5�����"�������pb����٬!`�=�%�{�"����}�k�z\���u]d�Xy6>WN7�z�ۍ�y6G�j��	�EU�'����xT����� ��10�k#��[y�,d2��������,��� �?��)�.�H@9'�꿇���s�qdf��B܊�U��7�X}��f�s6#�kt�U��J�%���p�G2CV����Ҽ��wI]QI�������e��DfX���=�,I�&�y@����y`l?��~uO�~g�H*j���+���vb����ؠ?��(X��$1��I�=���q!��i�������g�O�dI`�ٸ�a4�;!��(��"�߇�y���r����C�A�3���j��i��~����5�g+Y*�r�Ҩ���kW C נ1w��v�F��r�T���V��2�=�%�X���
H���:s������W��h�S�
X� ��q�6��#������j���ʐm�2����K�:�����`[wÊQ��G7)�����d�뢄]h��%�F5�����tN�j�|���1tl�J����W�և�E�w���n���	�JF���5�Z^A@.��ջ��<0�Y�̳�"�s*��� ���xQ1�c�]� 0f��f���}@ʴ�X�Æs�<�1x�����XL2'-���L�E�`_��
PuL�V�6]�BU�4�y���<,��bۇ��8c����`���]�]4&� �n�\���TM��v9�և=�8^�^	mj�n%;�!"�7c�q3��~1����x���:`Y�
���ǭx��[��^Pdm�5$f� �>��fA��J�E��A�ۢ�든�=�\�}��6F�r��,�H��cqd
�ɐ�ldZYօL�����b˒�B�Mx�4֖P"��Q���v0`4yҪ�j�Z�#�p�s�
`VZ4�i���o|���a�������[4��a��w&ѿ��v5�i��W�18���fҚe�,���:�L1��z�jJlbO8��8��Z<�9�AZ�ā߈㜏��p��f��q�;�����}ZTy���,�7�,���f���a̓��[�o���Ǳ �6\�K�Fd�gu>���5���x��~#��|�%���b�������1k�q6w�D�ic��QLυmT_�&q�X��O�s� [�0�}�>�w�����pz��Y��<�1�.d�*�{˖���@C��G�@DYoYkZ45��}�����A@4�E9nnDǀ!1:�E/=�& Hu��� ��2�U�V�iׄ�31�y6�{0@ܟq?�eړNL��(�ά[���c�@��Y�5\�Z���#R}�=֮��Yުb���5�y�*V�
e�랯) F�,$_��yP\��iR^Q��(&ivQ�|�,	�P��+ s��\��u��{�A�3X��)���	�&u����F[
a�o?߆�� c���0�,u �1!�g:4��`%�F3Nv2̛a�l$���:D���>__��&ٴ.D	��o�T�++���Z��8H��v�4V��nBF7���]Ee�B��o��W|nu��~l��A*"�P5` P��_PU�W��}�p���*�#��E,���_�;B.DV��"҄a������A�҉��������Ҵ;��Јf���Ǩ�em�R��a�3��"�}�|^HS�d��3e� ����W�thT�:pV:P���|t���7w�c�p����ۈ�A���d#�b��g��vh{AƇ^o%��H�
�q��� �mYIG]��5���p��1�kȨ������T�>`�z-����c��ʚ�&�'B2`VY�]��.>xu!M��kfi���7�4��~z9�D�J������n�u.�q@��`��e�']E���2��x�:�;��w�4��M���@釜W��28z�t���M�W�j��ߕ�<����n�v��N��5���@`s�KB{Z^ӽ�J�.$0B.nk�����N�^u������M��C�$4t<�0�����.�k]��lGs�}��ut��G�1�>�C\��9��2L����� �b��0M�������R��)Wo�<�yn|#z�nw�j�zu��9@�$�2(D������^���ٹ>����^o7��f��V{�@�L�3����e�<7�]\<r*����w�t�8Vގ[T~�s��:-�"$͕I��d����������MRܮ��Z>���^k�-_�^�+[C� �5D�*��Î�u��|o)�����:�^�l���Vu����p�f�St��d�?��?b�k�8H�)��'���Z���C-}&�9����!&:DBWh�L�˔�,�d����ٻä`����<LͶ��f]��X�&Ry�Ԇ�BM��]�E��Ӎ����9]��C<D{�9�ŭ����_�h�$��T�_���#7}�'N�ƻy{9o,�P������?��1�c{2D��IyL!8
d>U.��?��/U띪˵��W�'h�L2�cA��
���i��@`���ۡ]�s��b8�����"rq�dl��-�j!�E�)+h�~�u��y1.녤U	*�U��cY:���0$��x�8=Xs�'n��?b�ZkD3Z�il������mՂ����H���~�~����{����������6[��:�8������}�������0���n�����x�}Y&�Yp�a�_�˓w�&�z%�}�~6���:�<�~�P�PIn�>G��f*���sʰvb��\�~�g(NY���k�L�.�������<a0�/‎�]�-g�k� �9�#C�E�؞kz�+I$�?
�m���;\����n���*%,���?G�E����*2e�}h�c,O 5  �'�E0��
#H�AJ�"�rs����e�ĻNW�����كe�1Q'*&Ve�H�35|Þ��D��C�Y��\�X�&�k�P�a(N�G�E�(ʍ}ȶbKX1b|�*�*P\�dp�C�D4�mRL
3�&��t����T]�H�$���K�-�P�Z%6��'�ac��,�'\�n��o8����0jt�6��k��Ռ��a��F=��Ჯj�W���e��2Y�V��cy:����'�[<��E��-^��8�����*),�^�`�rG��+0���Oul[���c�S�	��g��g(�?�駟�đ��         �  x����n�0�����U/+HhI.���Vۓ�Y��2ƀ��v���6$�$�JQ�����0�/ˠ�od�i��0�j��jMkN�I�1|nca���� �h�@�qT7
h��ij��3\����cm���M�w�Zɚ(�$RHՀ�N���$u�V�&�pd������U�6°�Q^1��R��}gas'�h�V����?ҙ�2���**W���*k���gh.t�8cʦ� d2R����<?�[�;�B�W���6R��Z��p=��1ǀb�=����<\�����hs�%d�d���Ӟ�ܝ��5QgX�Y��@͐HL��(����X��M���R�5�)k�X;���S������iL���|�� ���i4�pǉE�`�R��OFQĒ�]��.���"d};U����IJ$2FE�p��,|��r^2�/l�eE�ܮ�ͯ�pI�޽?^�/�~q�v��*�=�N�S��q��~Z�8Cߜq)��^π�`��_���nY�!��JdYtÃ�c
ihN��v������S}��wo��*�{�e9��Z���uIf�-�aH�&�0�{=D-.�}���W�U��L(��D���P=����y�P�E�>f2��As)�(�ɮ��-��� �gP�'L8�|�WpK�)�vy2H��D�]���O�ɂ�k_���h4��rO�            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �         �  x��Uێ�0}v�"_Ў��]��Z5��e���N \��l���M��T�ȌGs�33�"�c�-�$���.�6J�j���h7�띳?~�d�1�V�Ȱ)B�6�a�A\���K���S�ą��#f�!���R�F߽� ;am�d.��-I��	�V���+�n>X/�=Vq%9� %.�e%9�-C���c�]�4"����
=|nI�^�ҘR�=�Z\E~�ׯ��N(Wv,8��5A=���J��d^��Y��������<��s\)4e�0�������� ���y����T��ǎ���WnÍM�<��T-�8M3DZK��^��o%-�z�H����f�� �u�(τ�{�7����9�~Q��'}0v�̧I�T�1�x*���.z���'Ó��4 j�נMo�5%�&g{%������s�O	f �wA�j�5�(+%Go�����箜����i�6��c?y�^U�I �IjRoYPQ��YD���.���u��m����y�7����x�,��-�0&�������5��5O*o�o��<�v��7�'���/-��DF��Sy� �J��}����m8��CK���"��A���<�!5�LߴP%��YE�Fp���������E||Y�V���V�         C  x���˶�*E�u>�Fx��Ku_�(����/�s�uh�F�������@�b�> ���d*�=��MU�1�P�K��222��72q-�M�_f���y#��#�~��`���ȵ����D ��F�[C�9�\~ـ��ԛ/����({���:��A&*� 5����R�~�e�0 ������w�ia9 K�gk�T�R���oD��\�o��*- ��F� ����c��Rd�o�$��f�+2 �~#~�wi�cD0�q��K�g����u{�� ���H��_��1>�P��N�a2u���W@)`��t�R�����72\K�Ϯ�Ԡ+,Oy
<�b���
�c$�[�%��� ������
 b��Ehf��Y*�bX�^���=ǔl��j���'��e�|m�:�ݷ�~��%u��7��47��?FA�@{�F�NW�0�3���f���q��9�0; �����֘�ckҙ��Wk㢃�cF�%�ϴ�ӣ�S9fb��z��x�v]����-od��1��1�JS�xNY]�c�8��rUG�Ex>��� �8a��c�,�,�����.�k��Z�Y���y��*�.w|���m)̴	�e����(�~��I�1[���V��n�:�9���x#����X��=a���xK�h�x�,��c���H;�c��ĸ�E	����ẅ<ꏹh�5�K�2Zom�a�b�oH?8�Z���r̨�؄O�DwH���R`��yOҔ�c�j��� ������ŖE��mѶDd�_����D+VoU��Φ'('����6.��F� 5�h�%���0+7�hq������e������])�f�_'~U)�yd�A�#3��:K��6��Ԍ���S��b:��]`�q�n�1v(S�;k�����䘰Ip��i��t=�9怺8Q�=Ϙ�/��}���=��]$4���E �¢�<k�e씴%��٦�}�s
=A�Ԗn��ydk}�*1�B�O��.���zq�Tx�rۻ:8�e&�t���2���2��&�d��|#�"�\2{��O��@�2��:{�I�H~a8��ڑ�ɝ��5
 �K���$�r).d��=3G��������J��g?
s��*�3�P=)b�a���1�N�?`�]���#�x]%M�y��t?�,����Hxś.�0���0Ϛ�aUF�$fT-���3�~�l�خ�*�c`\�Z�Å�I��<��%��Y�#w���K6-�ŵO�Y��a�iŚ:i��!�6B��+�����I���T�����.�e��_�<�j������*̓,�)�, ���"]k�l݊4Ԓ��<�"�C���S�{bZ�m+��d�7�J���,���]RYe�Y���>�3+��~���Q��/�<S��>�����@'|�y��n��20դ��eF���Z�>����.yܧ�`�4�>��Z$f�H��	m��ְ�i�S�=��B�mU��2I0�O�v۾W2�4tH�iG�4�PW��ۉ1Ǒ�ΐS,�����Z"���9��6h=>9��IS��i�Ǜ�c�[+sg�5'/���6-�'昕�-y�!��\�;Ǹ��L%�l�R��m��ח���qe&�����K�}��S�w9��|	z�tV9�ٺ=�Ic����[y���e4���e�]�r�\���|��xϛ\ݼ�S���$��ӭ�p9�3ei	�Q4+�R���\b'V1�/�3.v ^��l��zg��AoP�FN;����u�}�Q�����`<���=C����mi��{�p�9���S�M�S�ᆒ��d� M���IL��x�^f*/����s�&�)M ~/�j~m:�c���F=^�]������~~���jO         �	  x��Zێ�8}��"?��2��ujz�+�jgZ�/#��;��~����쪩���$�Yu��O��a�A�����������F6e,�/��YKe�2M>9��W-҈����{z`�D��������ͼ�E\4V-9'f��ݡŁwNG�n�whI#B��	M�;��l4�	B�H��PY9�p-��R���{/$��ݷL��>�\�S�Ʋ+Ҿ䛃U�_��dE����2�R��UѬ��
������7*�V��C�����@ڕewrs��g�a�e����r�Bk3�S�}�EW2٦������{ =���ؕU&��A/18��5M� z$0Z�Z�h��ҵ����2�֫ˇ�py1PJ3�ޙ��u�(x��H�������B��@f����>xDdA��z�1��
X�}�XOH�����KX4V@��)٦�I U�������h�j���u�.!�3�D*�% �ǋ�rat��#߷�*�h>3*ww���S��í���,u�m���[#ˠ�yJ�<��bAv�u��𯏡�n*��C����bǣ�E:S�o$�����ǩԿŗCj³���8�P<�
��9����8�^2G���]���k?��
5�o�_>N[��v����0lpy�u�ڔw�|�r��{ނ�URCEcb�l���)HB��2�yI��������������T|4������N���ny�~���ceF2��q�+�y誥Nڨ+C�2�P��g�����Kh�F�(��]ܡ�:�HjZ�?�;]�H	1����;.����
P����xWA�w����sN���	L[8BYs�'G���i����vG�YA���|s_Ȝ�R\�<p�S�cG�����ߓ��ݳvwO���i?�JB4> Y���u�1�������p�G[�X�~Ƚ�����C�Cj7~1W�]�EˏeH���t�	�A�ܗ�,�hw��l��V�����T]\�*:�)���:�����jWQ �����*�xkr��3T�>"l���zq/hB<����]��CQ��z�� [�rK+3҃g��NYd�4ڢ�s +y�����l=��[�a!0d��^y���-k�(�_n����},T��O��M����M��ǿ�m/���n�#p��"h�f5���^���^�#��'.e�J�L�([�����oŊd.�Z��J*��>��JW���.7��`_-�-C��;���K�Ϙ�<]�0��eg@ُ�cq�w�j�1�VZ���O_>}�}��������{�S��+�=�|efI��� %z����`r��i�~��5���-�y��7�F��K];TC�ǀ)���z�������nl�"���I��] ?�`�(��`Y3�3��2?�&��,86
��Lզ�^=2ϡ���Y�����J� Nh.Һ�Ir���l���1���E����jl�1�c���yH`�싐�"L�l_h_ ��i�`a(���)iɼ[���uA�ba�*�/^P�`�Yc��>N�X�oE���qSɞ���l��`��\o)Ϟg�f��d8��fW��Y�x|wn;���fJ�uan����m�RM�n�S�����R��-�����nT-�B��1I��M���l񸕳��A(�M�{�H�uζ�p��)wugb�m�o��~��ZQm�$�����%�kR����U�q.�A�����$"��گS�mJ_���8n��E�<���c�z�T�d�B}&�Aod�Y��!�~eA��=��V�كPg��8�jZ�o���D�LX^ �ԩֹ�hB�hpA��f��n���d�\��dy�b�g�Dm��0S��YL.2����G-w`2@I�U�"�; ��D����FA��؄�$~�q=�/v�@7��Wp{�~��y�9]TĜ.�~��V%�L��H�&2v�d�N '��ќmHi`KUH뢳��ن�7�on�H�D��{d:��%�Y���>,�HC������(/��)�]� �Ό=
������C�k9�v�G�]n�����Q�L��LT�Q�T
�h煗�&p�D�?�,�#s��Nbx����)�x��l5o�pÅM���{3����"g?2geƶ`l���:���|j�p�[|ٲ'��YsQX��I91L��4�}NdV]�,!�| �}�`�9����f�au��2So����'�W���d��ķ��t+Ft��Ilz��/���2��.C�2X6��"�
��HA��,4MX�Sn�K��g�vy�	3`��\�\�r�j�j�qY��"g�������V������Ax���egCT���`���k�	�_�\�)O�Κ�8�;/�sծ�F��`sl��&�]��|Un��\�\�H-t��˔H���@���%�&/�͂+��7p�?���Ç��Lvl         �  x���َ������Up)j���Πt&A:A�"��բVj���d[�����4�d��_dU�Hۡ/;�cꀬ3h�v�r]�6=����v����ç��W���o8x��ɿl1VIT@�ӏ�R�gH���+����=|�|�>�Oc�����XZ��(���\3?~̎^TQ�h�1���=�-��K�.��v�k�.�$}{H_D�u�I� J�h9��XY"��ъL;\����Y�n��.���ݓ�������ȍ����n�/���f�h�`a%L �g���QݥSVaھ[�y$JM��׃9%����&��e@E��$LXk+���U����c��2@U�c[#h�,K��s'���T� ��^"���͡(8ՌY�sw��f�e�����s�h��ڥ/�]����{���F�C'�J����P5R /�g�P�Rp�o�_~�T��P��ͅ�l���{�}�,�Q]8S��g���������w�B&T�(�px��~YW5]ѧQ�L|0X|�h~�^~�����/)��ʯI�&|�?]f��~�60�/M�zLt�p�i���Oc��G<zf�Uؕ{!O��k�ʻ�	�.L�F	`��~����&�pb�g�x/x��ƄkTE TC���&��;�"���ܰW�+�v,�����@���#�^�{��{��4 �rO�Nm2�<��<vj����(ry�1s��Y��{�u҃3��>|C�}x}6���F�m��sI	*�Ej�<��{�5��Mt5�]�G��'���"��U�h|B�|�zNa������SiŜ�O>�Tl�,d؀iԳ�ά��������/�~�|��nn����O���";��;4���0�oUQ�g���ߨ�ZU�]{}3�*���Ioir�>�P��J4���N�����e���2�����!��q��t1o�V��0;��4�lN��k��I�Yq� �I�
HT���YE��>�vk�w�C�Qz���3���S�c�CP��-y`�9_�c���0�B}8����>7�"��=��"��|�ro^^>`>�v	&<��"oui�Otjt�X^����%.�wBIEl�jg�d�c땙'd��"D�a�h��6fba�+�}�_o���5�X^�mNi���أ���5z�*Ȋ8��&u-�d�F�Y�0���Ђ dM�)y%�N���3�Ώ��}�I*Jd]g4�T9w7��0lbc��3°�w�oy
L�ͼ��:�e���)�m�����N��dG��^�Y�c
A�;7�%�O����>�*]�@����5�I��q�,���v�+��{��d�1�<Ev;ۢ�Z�C�#K:ql~��pd~8�=�6O�8 ��0hͺ".���������SLbr"�EӅՍ���:a)L�t��)Ò$�U^%`���R�.R��̢��1O�����A������$�3 A��lC�rSk�ߐ��#��Ao5�P���4��iV�N{���$49u\�hmV5�e =EaUiS6��V�mM뉪�$5: K�5��"5TAy����}�ܶ�ӌ�P���XSa��"gP������aC��fT��@!iM�@�43�U� ����܏p����]�����kӉ4��H��%��Qq8\�܎;fRң��fh��#)[�pz���;I��N��U�mk E"-�֩�=�K�����ƾ��f��ژ�9O�K\�L���M�/c�}�E��U�����;A����{����:4���|�ٌ�s�p�W�^��v긻Z���׳(f��X��sE锹��VY�(��(�Ro�i�"�=b�d��yXQŮ�9�v=�b�[�ڵj��!��!��X��z�oŦ7ޮEfr�&
!�4�q��u޲=o�=k��. �"hy�Y�sZԟR�!�t�w�چLd���w����θ���h� ���T�&����E�����|:E�|��TEb�U��QF��M�U����(pQ�bԋ�=k2HkP4jA�2b5T�B�A���UR�P*�v]$3tz����;�NT� &|��T���2��z+U����4�Jrql���.� �]�F|�[@��(�m�ڲz$���	����pf��*���\��i��������S�*�I���G�1�^X�V�K=�lʫ�%u��LP7h���;'h�fl�v��K��W �Q�R�;�Z�͞ξ�(J�3M�Z�t�
iɂ��]F<��EM�ۊ�0��BZ�����`V�"WIy4�;�F�X̵�tYa��,Xu'k��d�fY��X�*�q�x�D}����s6�B��#Cp�[N���|Δ���5��U�HY2��9U�L���b%

"�޷V� �X6U���\�	\W;[��F[���<����/��Ӽ��۩o���kW��V�.�m�����"#��̱��]�I�̲E2� �BS����8)3�$�>p&aw�R5�P�S�{���fF�Ƨ�58m���G��	��4��z���e7I��NDMn���a��H�'=@F/�ݲ>z*�U�h�l6�mO? ��y�b#�wr&^UU��a��c��&\�O\�z'>͹��o�"��������mŗv6�{wf��>\�@_m�=�s�$�.'xG�
�p:k��3�Н��S�"q����.��af��/�ܷ��<�^"�����͋x�<����xw��CY�9�h�(�>��I��6��kǼ=������o�|���6s�R���M��E���6��dE\i�iDj�]&��w�h7���^^��6��T���e��|ѴZ	�I��8�ja^���'��/��Pҷ�gv�r B]�L;�;c�	ѿ�{���*k�gX]�i�Ӭ�ly4�?ۻgVn��牽S��Y>�U��ިtu&��2�R�B�G�'V�Ƿ�U���YoBbFrƷnu�}(ˈ#�3X�V��f���-�u��p��,�D�c�_�Ӭ�Yo�ϯ	-�R�Iv긒�JIZJ�Y��W'�Q�^�/�N
T���ՅY,�v:=�D>5j �xJ5�l3�粺D���N���sX���
��b��i�2�u�׳� �TY��yjm�Z@q#_gMXʧF���_V���Zk}*�d)Ns �7܌�l�����e�/��Z�Z�H$a��)�c3_W�/i�]�ٝy��|�ܧ�Sha3�c�(�Bz�  E:��F�|�:fF���C��8�|i����h�K��d����{R������
��+��e��� Ҫ=�;Q��Za�_Q_�\Z7X4n2P��Y�u\�-���X��hZ����?�����            x��}ٮ�ȑ���W�S?	�;w>NI�� �F��0��@��s�w���ИYUj��˽dd������;��B'd7u-�q�1��m'k�b����'y��П���o����?��{k��8q�{-�K�2������ˌ��c5�
��ωU�?Vy!�f���|�kc�7?+��U2���H$�q{�?�$�k'�6,g��I5���� �h|�U�����r#�3#,��okeM،_~՗?[�x+���/��g������'���毼kn0g,͏OE�sm�m]8t��9Eȣ�l��������:��dLp��.5����>���N<eʺ�W���.�@�t�o��to��M��ӟς��WTC��Q�>��s+R3�\�n��1���)��;��a���X��f��m��_j'o��)����|9�c5�.��d��q9+l������Cee�M�6�N�U= �F��CҘZbH��ZA�Rd��O[�ʬf<4�oj3SS\��� �A�Jm�=�E��Qt�]1k�@������M�[���)��;9b,���I&�Ⱨ�`�hʝ?�B5(8��)α�9��k���L�������3�r`j-o�l��%��S�y�2V���I�eg�?N��H#��	ԩ2I����\��W��[є�R_A�%����E�-'��0�B�����ƇP�_?�j����b��GaUAX�CǾlU���vĿ~2����MO�}��0Q0!�ȕ�ʥ���6�m%�Xa�YI�+d�HD#����Fv(^HF�w~�\���D��w��.��{Bտ�4Ͼ�G%��s�<�`'0�Gz�S��-Ͼ3ٟz����Й?T�PL	��"�z��ɢVZ������b�埾��������Lg�t��2GJO��˜�S�D�8��7���!��:"�d�;��"J8��?D��g/^�t�
�����tЙTQ����Q���p�/?��x��_��oO�&Y
|��0�;��hw����e����4[?��4;@ӢTc��T,ʓ/?$ ���磉5�BnL>� �y��WC������*Gi+{�i�jS�=ok�(y]�c�Jfռ�vX�����~=RR>�Ӑ�� $p�]ᆞ��y�֘h�t-��i��g�m�8J�2h����L��]�?I��_x�p!�;3s�����}�L��(��}�8����yU*�t�������d_LVO��+�`񷿋:��*�������������7��}�z˜���L���!_���)�13'��~���.�Jd�[��6�H@� �4��`ӧ,�D�1�А�F����.�'Fj������^p�R7��`9���N�=��&����,R������z�,��$�i����#kzՈ��7.�i�+Ք	��������09��@s4�v��v7` ��	�eg���PNc1��(M30W�o9ķ��l�3��c��
��uI�m�Yl�"���^jJѫ��H�X��S�D�an!������<�3N�������U���p�X�z�xF-|U��z
����,��;�_wtE-=�;g����4����]m^���վFL� ��Zӽl޹!��*!3I*:��_`�!6�rA�Z{F�K��nc�i��ȇ��⹉��y��A���o�i�f�8�B8T�b�Lܒ�n|.���$�R&5d䴏�<��oއ���GNL�=J̍|��	�D��Ux�[��q�t*�V۳��cx}�Z��u���us4�*�������*��+�Z�KE���)�J�}J�>��������Z��I9���W-�a:�)�����`��%���d(�O�m�_=s��y��["u����y"q�D�����y#�A-Al4������\�9:K-9B˲V�v�Y��=���n_1i���J�nѶ|B�]K�^&)�āJ��ob.���x�j*\�
�rL���`��)�H4	c�9y�mپ2��W�}t�u����t�=��&�'�dو�Lu����,�(�����z0}�j�q	O(y}��U�]�R��1>��Mɤ�N�w6�%����p*�P���q�4�l܂L-Ub&i��u3���ƵY$"�j��
K�[T�3LkQu�L�۰B:����R�XG�_�î���
B@��E����a_��e%@z��@m��s���8�B(���P��
6�L#R33#��ڹ� :D��̨�VvC����6���5"�ŗ���<�����=�w0��m����T�9[}�GH��#���g�B�v�@>(���r9����Z�X
#�7䑑|��/�z�b{L2h��K�2�Z����~����Fl1hE?�Y��Q �%��bu��I��[|8ОM��(�Π&l�YV�h���:zVXVu82X���Y�r��������J�=�ui��gpF��f[�زeB6��-��#�9m��A�ٸeb�gxR�#_2���e�����D���D�����@ld��0�J�)u��<y��<��Ԥ�Z����C�jv~j(��<�\'tJ�Q�����JY�QsD/Aը���������&��[u���{�"WL:Z�a(�r��O��ٵC���K{��T�W�a��Y�V����x:�����	�&�b(��KP�e�'VmBɐ��@%pL%1:H�@����؆o�/���7!�MS2	�E�d��Uل��f:@��ؓ�+���w_���7Ӎ4ՙ$R�
��t�ڋ�o�	rE,�;���-m�9<�!KɃ�&
�/�i��q��$��P���q<����c�G��ߪO�j��9���@�1�!�t�X'�ϾKS:А��ҎME�
��A|��D�齚��DSD�t�6��(`�}j_%���.�5,F���Y�k�wq�v��1��x�G�6�rvu�:���j�I>�"�ϋۅ��lؓ04z&7��V�/�����	2I���\;�Pjᦕ_ؤ�MH�@�L��ڻ���8���`1dO����M,���h�k�<��<����X#WJ�|�T��?��0u�2�NwʮO����Hj�N(��Pw����ޝQ=a��� �8q}5�Xs�4�0#���+�+�<Z7�)�X��RS�C���r�G>��OP˩io��N�M�QŞ�i���W��y�$�_U��ɳ��LjնQ���ۿ �����7��?�DW���Ƚgn�Y����%�(a|���i�$�󷳥/�x���۳ �s_?���0��`��" uH����t���dCjY%'V��"�5?Bck��iȤ��밦��}����'e.,�`KCϵ���-���a���40z3Ц�V��eDS���҉�Z$Q�EA|�P��`���N�����n����?:���@��ߕӔ�ꎑ�z";��jXh9���!���z��8��|���%t��q��#�G�[(g$3��7\(/���G���ǃ�)uo%��B��H�Q4 ���)�"G�+�"*�E��S��AÄ���jY���&s��5�6����.o��w���w4ˁ�pF�
�(b���d������/<������p�c@��(��9��j79����;�qڣޫh%�-����G���w�d����&[m^c��l��g���Ө�v;�襁�8?8J� Y�-��e�5T"�Wݻ��	j�ZT/#ɼ���{������_.)�,;�������}���-PE@�*3����ŏp�DZ��=�J�j�%Yݱ�snrwԕ�A�x�B��{G	��3�'��A����_�3C
$�^m��D�1~X�Z�}��r��>�h�� �T��k;K��\��z�ľ ��Q�d��X�Ao�W���HD"������ȶ�������<�ϧw�m����!5MD��:����L<�n��E�:R�\~��	�'>�x&v5��u/>�tT�A����n%ce��]�5Bs���aW-:a�~��,X	��[�.-�TlQ�����2	���V���iJ��1Y"p(C���>���		y�H��mk�L����a�����A$�f�8a�O�Fn2�cK������樏fBFU:R�U�S ,���£�T    y��d�:	u��j^F/��[�����Pخo�w�P u�r;�I��X�=R��$�|�e��i�����WI�Ԝy����J�)���u���m���y�%L֗3R�t�<��cB�͸�Y��c�͞Ln��M��QkW�&I��m�s��5b�Wŕ�&s�|��i��`��M�;]�J�?�Tԅ�����:�J���h���y�:��Ւ��<GUB�A��É4�E���74ρ1���^�צ�tY���ƓI�ڇjm~⾞�5�A}�>J�$7���=/�;e|X�=V'v�v�3�������/�x�}t��y� _�:H��R8LU������o�a��?����f��g����s�w�� �q/���I���R

�w�~h3�����?YM[3���f:��˩ꨉ��ڽ]Z���¶����{�i*f��XU��y�r6�t��`��@��']��Js��#;�;���Ǽ3{xg9�\z����~|���1��_�'%<U���������#�u��J�Y�亞:��v�w���O�G����׶a|捭�����q6*���Z����L�>7����TJ�~��m:��a����m\dF��1u3���ewX��s!X�@���r���*���Ƹ0�AHO$?5U��_����A�ğ�@T�,Y�tuc=4�M��T>LEm�37�Us���?�I�pN�S��b|��T�F�P�a�|_�Ϫ�N}�}2t ՜~�}�,���7�����Rs�]%�~x�]����<��	W#r5���OI�U295�^&'D�YX�/���w��W��Ԓ�����; �}6]���~"��Ό����l��̮멬��\�%͹t�/��C��:�)ʄ�hP��%���*�WLϏ!}k�	���eDʙ.YIQ�/K��ugz^p_C��!�_����p�1C���U{�L�������[��󉽠uOen�8����ғ�	&	`�e����q�W$�c���:(���N��iWgw:ΰ�;�g \A��v6꼎�΍nR��B~Oe��i07�K2�ǽ��{{ȤǠ���Y��f��	2S�i�V��q�*0��Mƛ�)�6*߳��f���R8�B�9��� ʴ�&oR7�θ���c<�)��>�Ewu�;�Ŋ����U3���>5�e� �B�I��LE�;9�O-��������r͜��v(�;�i6�;KɥD�r"a���{� �*Z�ީ�P�{��DB|��D�KW7l����SP�FCMͲx���m����|V%0`E�:lB��fgO��+dϠ���q���=�D���Ě� �>e/�q�BO���\�k�B�s�kˍ�A_xd���ǟ�ЩaZ	d��M�Fn�E7 �Y.r�Э�uc�n��CAe�b�Tx�e��r���2,)QrnM)��	���eG38�9�qH�0��,L�s��(&�~�s|l��&�va�չ��Pw���Y6t�WFQ����[����,�	�O�T�n�ʖ��t�X�Q�G�;�*��^��/��+�π�e�ɥ���}��AL�0����4h�b�:���4���re�)��e��ss��h�߆9���a+ȑ%�FO�S5�D��!��-�j�*��	]�}^�{FB�7(�Ao�R��WYm]/̼A�1+�<��쎅�Q=A^���W(�f%���^6	؟?�L@P�cn�J6���%��s��E_�aԣ�KϪJ�_���u�N��f�pnL�C��]��q�>{����S(�h�-a����Ԏ<S�WMƏ1؎dh,�R}�ˣ�E�r����d|v�� ƒ]�>|�xv�-�춫�y�f��'��R��~��C�QZb8W������öd�Ι�n��[�G\5Ǌ��x��^��+���)ؽ��xO,f�b<���.R�O��>�O��4�i�������0/˫�����+^4�����0
$n>%n�!�����\��O?�ȍi�b�K�<VpMD����dj����Q� �"�n��,�{�M�]��&�Ye>Q:�]x���#��׻:
�D�8@�q]kg.�޽K�.��]�%�t�e9t5)�P�eb�0�ʲ����:՞���_�����/[��'�=�	&
A7�a��u�贗5�~��1x�$�v�.���c�*[VIm�l#����EPVi��J��]��P��s�tme��ӎbk��cXB�Y1Z��ޫ�{�'�;�0*؈�J���%��!�_�)����v��c���t)���2/�~NzTQ@�P��cC�V��["�2L2�$�%�U�'��j�~,���WC�a9}�$�SR��'8v_D��F}>o��y�Xm��u܋-��(`@
�S���ed��_Vgx����	��0�.`Chܤ����~�W��X��bXa�[����ќ>�w`<j��LU��U^��u~�$R�ty�Lc�פ=,$����:QS�@���j�<8i��T�/���I�T��yB����ݤ`�������&z�d;D��e
�U܆���[TjSY�D�-xj�a��$�>��8t�q.SF�K�*[�t����N+z�9!*�ӱ쁨�^��߻|��������ƙ�&Q�?���]�j���uN�Ո6�݊�Vͱ��R�x�k���\�+b>����	�n���@r䢯�,����򄆘C�]`af���m�����(,S��\��ۺ��M|Yeݝ�E+5X�v�1�ZT����8��O?����e�F�ǓO���yYF�:W_wB�Z�ԝ�k��j��}�}�����X���7n�ڞ|��h���@��\LQ˦�z�z��������0��ULʘ{i��m��&���l��JJ���}��#)x����U�n��^����W��d��T�k+�TU`^���? V bt�a3�h���m�V{O.�L�Y����+�MR���]IQ�Ӱ]�_z�*�2��?�����X_��R���:	;
��1����,L�0�����*��5	�<��� Wέ���9�L����E�!.0"�ԊB7���0�HD"��J�v7����t����x�ǉ߅-�&C���`1j��~�7�z�r��I�aܢ�8�AU��^�Af��^5�]��%rxZ��-G�D*��m݊�Vͱ���es=���fˤ5|" yc
�Aݚ�lv/��'4��&X�V�{�6F;\}�aX�E	f�(kL���~��J�;Ë�b�-Z�W�FJ3��:��W�x���J���w�vG�ǓO�
j�����^�'��NL��N�Y�z�f�nݗ#ą���t�/���׉��ib\DO��U>��8�W}��t�}h���mZM�w���nq]��9(��	���$k������P��#��[ɑ�*�{���}'[(Q�~I4ݱ7���~��1���IO��VԶ����D���Z�ak'̼I����SX�P@n"_�6��?����IX@�ԩ���o�'aGa:��h]��=��S�bj9�R��xN4��CUݭ���"'X�W��\p˻�����x*/��i��ka8��2��ځ�E�Xl#%�9���YT�zy������l9[�}Jv�;.\-��u���X0SCȋh�ej�A�ww�ܤ��e� 3%�r�{�s?�B��l<�:�y8D�d����Us�C@`<�),Cocݔo�<�p=�ɻy�0��G����4|^���ETmH=�n�W�����;d�����m�(�{��u��^L9~D�P�������rp%������OEf�S��pY�5��D"*�(1;*w��b�DH0y�ɸ劺�$LB�Ht�.���ro`|�K�j&��L4j��<���$�i$�B9&F�D��/�((7�N��m�3��[b�t2ݩ�����
�Mi�!˦Z{�^�z���~"ݗ��-�ԫ����{erG������r�D-U�P�-�{��3�\��+(��<�G[�8��@E�9!]�h�]���*W��\Cx�9e4q�CT��EG�Z��M5�T��o���!"!$քc��bh�m8�#�2��7r�q�&y�n���E�P
�׃!�1�5�d�G$r��S�P��#�}    #wF�Y-����iz�j�L�%�iSSD�+aR�^]��D�udE?n8��G�W�����ډ�ұo	�CzI�W�t������Q�R��q	��\�:�}�Q�2�k��=�� [2?�9���'��҉0�~�d��qq�I\Sm�$N
d�(���V�ֿ�'e_Gp�y�X����<��Q�^GE�^�˃*ɍ�0�я˞��f����A4�eȢ̲�6:�C���ZaSi�_�D���ܧ��I:�d:&蛱��ց���j�x|�ht�U�AV���esDQ5P05Z�r?��{ ��͹g�P��-���j�$����9³/V	"���LM1�S4n�4 &��p$L�+��������Y�J2�ӏO^bqS:p>�\:]Sm'��j�]T���]݇;���D5?R�2�J��g��i�IۍS�������H�K�|{Ny��TI˜I�r�t�ª���y�g����5m���Xf���Ue2��&���a���\������D�$�\R��ۀ��g�l+�%�ĺ!�pg��8i+�J�UO�c-�^/d�_��"[��j�8�bD���ll�0U�&�\_�p��`��lYdfe�v~�$B$"��z�R�m*^Q� ˅�fd]�^�W����4_�[GE���Ĝxmu���Wx�\�<���\ԨD���~pu�xt���CT�o�<ʮ&�V�`���Jc<�0&Z[5�]qM����X�rѨ-R��gzs@c.�,\��Xh��U}��v��p�Ϛėݐ�c�i�%DJ!iʽ�W�i�B�aP�\<�^�Z��Q��'O�!0=^��WUۍ� X���t�}jr���b<��a�i��wY�[Um�$:\AL,�ޗۚQ�߫���,GEE�Ѯ��*�V��ݺB( �\�T�E��Ζ��j�4&�D/��deZ�W�K͐N�䃜�H7]�:��1~yk�dN��^��uT%k4��d�cP�J�I���{C��,��Z��ڙNY2fR�/�6�%�ݭ6Ć�d�O��0�a�gq�B#K�L�J��<�_�Hۅ��f����<y��#�&�H���tO�]W�dmk�@�PN8Fy�ZUp1�}����<J�M�m>� 9K:a(��4��wT%ı q��U+���~�k�B+��NLݱZӽ,�j��mɡI�#��#�&��:[�\�T܈I�Rp6�Лbz�*6�Sl8�_���1�f7H��V�]^~�"��u�B�lcӢ0��lvO<ٌ���GU�WN K���� �!6r����F��ZX�GB��0�� �.��.�6�;���19�!8/��~X@�b/�x��^W�9W�I���DI�r|#Al�{oy�Ҩ{�Ş�<o����KL�	Ia��yoJ�޼�����/<J�r$E�Bݏ�:|����M���W5��q7�Vl�ZI(Of�R�� � �����蒣��&�S�n��TK'���~����%~�>	Hk���@l���I^3Ğ_߻[���)�	�_!ˡ�F�_�6�40�S�F�|
�(��fr� ��3�2Q� +B�b,mP����C��� n(�*�6�Un_]+�ȓn�DpLm�*���P>�0�������-k4�唳
�u�&(E�h�-�Hj���wT�T&&K˚�ĦIu쯔�%����ŗE��Gˉ-?���D�K��R��_ �/ů�JO�/���%���s�!���ل~	���ƒ��eS�q��J!JD��a�L+�ؑ���-�I�3�_$�ܘ�;���#�"Ԋ2y�ƛ9l;&-���D�R�4_!Іm�iKk�f�������G�8���� w�:�.f���~zggS�t��yuVW��@:ˉ�2M����Q�J ���v�7u¿�G�oBm0���$��.V�7	�#G�]��<���y�E�4u��琨��'�6x�B�8�sgw�(��5CF3��*+s�l��i����0��E.$���Zt�4>./Z�{x�@7��'��?^y|��N��R���]��I�m�ҹLz�J:�/�eES��ŴsT�TU@�:�]�M�T��-��,VZ����R�,���g4K�5�p9��F����ɞf)�D��4Jix��w5P�M�����S��R"�o?��xk�?�**�J��%��ʳ������	��P	�����	 �����4�.#qx���Tەz;�8���7M"j���l���^��*}Ǫ�����a�?��oscz���nq��\d]j���u�� ��O��.��j�LVIu�$/�ݷ���G�-��OV�֌�=���!�rQr�DF`ջm�Ka-�|��h��q6�\�Ւ��L�6�g����m
k�M�F�C긊���x��*-ܔ��NS�ޓ_Oд�x:�jx����Fsu����6W�sȞ�\�ASkW�޼�?@.���NlV�e�;�6[!�pXq��n�cfD�������|�C)��IzFy�|å����R���|n0`' �>T�V)Oy���G�Z��>�ZU��L��K����qzʀ\(1,ꜙC�t������2,jT�nczck�s�jڤ%�m��1�*�`4�'4�!��}�A�}R� 9�I��<�66�M�B1�2�D}�D*�4��)UX�������i˭�S��Y_�lH�o�=!���4Z"k�h0ZcxŐz�j[C*���֢vW�'7������ϵY1��;�Ў�*T�죬�(��a	�K�IY�:�xwHh���Iv�WDzM��gZV�1�CN	r�	��2Fs�����L�ix�T�M~���\�����'���1��Ok:u�]n8'艂�'�4�r԰��ҴU��������G��'A�U���a͇{�/|�9W��Ts��S��0�༮_6�ݏ�=Y/&��D-����SM��z9��G��ux�O��b0����W,�nk"�!���7%uP�^���6C��!ɤ�)S��C����VS�Sm.��"z���P��Σ�4�O;Y�~
Ĩ)ϳ�b��Ay� ๬s��w�!��hÇ�L3VS��<�smV]^� L�^bc(}O'd�70v䨥4���5mj�ڑ�^<Q(�������e�,�)�Pq�u�*��UO�ăDk�J~�t�X�ښN����kˑe���˚�Xsp��f��@-m��$>Y��=1պW�ZM���K�2�
�i�x�͑��o�} ��/Y��8/i�Oo�[��e���F�����V܏��9F��mwv=x��W!Hog��F�"#�J�nP.M���)���Ҩ�j����A4l���i9�F����«��+?�fJU�L��J����;x���ҩ4;�e��[��a|ɠ�#LE�ʣ}���-%hIS�e�ĥ���}Nİ�
k.׫�ꤳ({�@��t{��� ���ꛮ��i��|��>������`& �\O?dz����D�֠�ǰ:u<]7J�)-�G�'`�;��yk�ͤ�K7>Hl'��*W���;%`�G7%._����
�S#��)*qr�vei�hr����jn�B���ZAh�L�i��a/�C/��A.�mluu3�ږ���v�a���E+L�<zf�������o_�*��	��aǣSG(��E�,J1Hz����~�ޓLe#PF�����;��o��"ʨ��D%�&˾�5�U/:5 �`��H�m{I7d���ep�ݶ�$��s��*l��J��e�����T���S���3�w�X�����s��VGs�G�+v}�apGIс,h1J���6�^��\ʃ��LY�eI˃X�/Ky��t��%�M�ś_L,^n�뢀�
�Ѱ^*�4��+vю!m��RQDq��5��g�X��\&�֕}������h0�R��N����<�s�e)�$������2^|,@� r-;t����qS�#���vah�3V7-u��
�q�6K�S��(W�Y����*Q���Q׆�؈�UN|���׋ʿ���*N-0S��6�����{ꎬ��Tkb�P^-�X�aF���lһ�{�^<I�r1Qj�Ki����cVۑ�ŀw�tG���˞�<�;�b�蔦3�����刟7�۲+7�'�2s��Gǐ��j����k�j�4/��ϵ62%�U�Ol����9�i���N>AA# �  �:]r'��-�l.�5S|c�{6������rU��&՜dG$^�Q/�>-y5��f��	:O�t+���NyU�]�&V�sj�\2���(���˸՟r��]J�U�8՚��	sGM��(�Κ����qOf J�(��4)3�(/k����c�\*`:��a�_�p[�XM���,3�9A�z	����F~Ѱ�����;�MG�A��єd�
am�`s���lG���iDJ��܉;��6�O�YU�9S��y�H�|����+�\�D�
���x�
�O��&�r_�{��'(
�M��,�K�@t��T~���ԄOk�4�!ۈ��q��e����ۓ��i=�F�}�k!����cV�ο�݄N x>��<��6�f��͔zb�b$<�"��u}�W��L�gi�36�l���9w�}&X�W��,���c������4�)0���z�������o�㗿��G���ߌ�蝣�9�=��T���5��q�x֖���x���mz�I]X�Ț��w�m���w�L�5�!�#�>e�%���Ї�k�:"S��5Ӿg*���T�c���ax�z�eû��<1r/
�ݼvV�\����m�LG�H��\�l-�כ_R;#�d�f.%�F>��b�$��^7�D�7��vV	A{��dOC��*%PI����Sԉ�o�)����I�e��/���'U�H�&�ye�G��	��y]
}u蹲���kl�L�����D)�y#�M˼V��ʑrL���`��I@�j)6��v�$±'86YJ�������KmN���0}3?-ss-(D���6�Р�������24`|��d@��5W��.�L�F?vj���q��s�0$@����Ҝ�Sܗ����֬�5B�փ>?�J���M�k|���0ҙNY2f���kc]�w�D{��X�,S��rj�q��W0y7?�a�by�{�8���
֣A��=E�h�*��=V���)�*Cf@��1v㫽��3]����?�����b�            x������ � �             x������ � �      !      x������ � �      "      x������ � �      #      x������ � �      $      x������ � �      %   �  x��W�n�6}���?�bD](�6h� A}	`H$%Q"u��_�!�vv��޵�t�3<��9CV����3P�Aw�&�Δ����1k�Q����Ǉ?��������;�1��-^�,��S�mɃ-<�9U$Wi��|��@("/� �4�f�żN�"��h� l�EZ#�����ޅ]'�����?��lF1h�e:�G����T>A�=|u�M�V�, 3��v�V�pL,��]�4+��;�Ad�-�4!�uʟ~��1~D�d�c� ��o�!��f�X���o.�B�S�p�I�/��ÿO_=��õ[��@���:��*���[�
#,�Q޸�-�c���8��h>���+��ҫW�;i�D�����<>�˳�������(��;w��j�_�/���l�>����5d����)�	�B��xO����S��I��
�6lȲ���:
o���N2��L�V�&X�؆��ES��W"zģ�JH����Jh+�[\�7�W\ ��5x�;1%Sԇf?���`%*׽K�X���4.�Fh�I��h�� \���p;t��vv����ȡ�=7�O�m�`�����b�������A���h���R߂yA�����)[U@�N7A&����_�u%�x3h�5�_u���̹��>���E�&e���^�ս�L�x?�ҽ\!���+�p��@��(u��8���/�k���h9�q����-�%;h�lkæj��x�>؈�ײ�Q
a��Ψ���ÌwVb��N���iS�׵d�?+�'|cU����s��c4.�Lc��%7j�u�>5"/���j��[)���V`H�ƫ�96���v����n$��Vw(&)k�-�%z֦ǲ� ��-,�%T�+s0�@�����\�����D:CZ�F�Y��u�G!�"̺�t�N��ގ�.�.��g���i�䬝xŕ�^H��M%{]ap��i�����n��}�t:e�'����É=^�yk�wS>�!���ב6��Y$��
^8'`�aԉ�����y2�ٝ	!Ƙ
����{�{qx�m�f��3��x�t���2n߻|��L(!
��l(�%����*_��s9N@�� N蠻5y=����a�1�8.l)�ح^~�ϥBQBl��u��i�K�;��ކ�m�xe2\uù���U�-�]���4R�l�U���A�u�5��8�lm?4�0�˗O->����^	j�b�idvP=�پ��`|��7�r���
�5������2��l�J�b۷ϓ�O��o��T�3ǻ�M������;MR�!��[-�B���{�+�\�X#Ϊ�$B�\�_<fk��@P�6[ŒqY<��8�0nS��7mq"�+�}���l(��p������M�~9����s�'5}��������\R      &      x��]Y��6�~N��~����:� ���wm�� I�EQ�E��~���՞�S��άVV`T��\�������<�ܵCBӅx�I�LZN:��^ˡJN����픞�����������2�&U5!�G���#��N��+B����sW7I���GH�>$$��#<t�H��	�\��>5�jU7؊|�e��U"3�Oe��u�]�,rb|�h�8����1#.mA�ш˻��?R�Y�fęJ���=���O�u�꛰K�>����+%i(��:+,�T���u\+�YY[Ϭ����*tQ��S�,�u��'E�Z�?Ix�(g�O�� RjD�&RzE��D�-��� 4�xV����I_�S�??�巿���_�??�k>�р4�7o����zu�k���4k�z�-��u@v���	͈Ad�������A�����*R��t+9�-��Mc��� ���!����Z�d֟�S��)>�˗���64����-�a�Ƹe��Z]0�<�/7H_y*����1^��քђ��'����^#��
�vo�c��iՙA{t'Q\ �G�J��o�VZUsz�"��n��ib=�ʰ�2X�kۺI>I����vn���/'%\d��iy��\��m2�L�4�\�~�A���O?��w����?�V-@PQ�XdI�}-(UsX6m��U�];�t�.�9��dj�j̟YI	YW����ҵ���3�0H*h>�-=](��|M�eU��-�"����j��z<��>y;VP� d����:U^U�����W�H��/���?����1q���t(=ʆ�8�0�rJQ,��˗���{��B�Ԋw��f¨N-Aur���b{�eKN��+7�(^{+K�����.2H� RD���kR��OO�˔�����N���N�r�ixt͢n�ڑ�5�A	���~#��#��#������震�',F:����ʎ�
�1 "��	����!��aQ�(� �U, I�]T(o�F4#U-�j��?E�_iى��0v4��_9l�`g���z����}��RE]����D��X�S��/���+,� �)�����X�}����u���4�-��tj	��!w/�ƞ����w�v����}"�6J����29ry�(�ϯZ����8�����O�����+�WN?���+�y�������8Yk���~���k��Q�v욗�B��Zh�U���CS��7�6�OX1�G����n�?ru���0�����/���AR�F��xo�)�ԯ�Lh�D(I�����}�[�@V��%dMӱ���t�#a1?1�A�A#�*�O�Y��#�f��Pe�e1�T�I]ZO�t���isMm�;Ģ����"}A���6��	^] �c�]B��X�Ȳnv&z�W�Cl�����t��?5����)���Y7"���NW�܉�S�rb���FQ�xA��czЍ�<�,��v�}��f���QkHTV��|s�ژ������:]:"�%��&:���mt�`Z�ՍN�B�O�|�'щk�)�w�1	��џ̄�-.b�4������$'m~�5�P��S]J�b!�k�.*I�����9�����Y$opj����$�,��-�=ϒ�UU��x�H�%�t}�s��L�O�����!H�?�/�%��*���.�<H��f�yY(����&T@���?aC;��}}��K���K����b�O�l;�Iz��!��|����6/Z�7�0��`�M��!+uX��nߐ�{���!��<a�K���tj�2����ɊrJ������,���^C#&q|�� �G�`9�b��L�*�Ěb<%�x��P�%HViGEPX�����+x�D�b�hڞ���� ��o������X�-�J�d�^��u���.R�"m�VS^��e���`�n��w���w�
B��h�-um��=��6+c9|��^�[�㾭����jb�3��K�����{��J�ğ]��5*�f�nW�?�@	FH^�׈G�娞���n�|��*�I���7]ou���$���!cJ���f��ʲom��{��D@	Fh".+�$���6�BͲmk�䑊1��9#,����<y�%ݡs=BDºs��?�s6���ӯy�`��9��0+T�d���@L�g�����6!%�3�e�����g�����1V7K!!'��c�����Ye�L^���-{K����e����U9��ER��P��1=�R�f+�nO�vǧ��aB]�T�h}7�Ӧ�����/O�]w��[͇��֝��ܦI�3���6�~��}ٮ}��3��{
�v��>Xj�(��RN��`���Х
�Y��!z�P�������-g[p��:�9[��h#�uB3<sÐ��^F��neX�DN�J�R���o�a��m�5�m1�d�NݧP���1,(�w�X�N'E�O���X�<?����?C��qU����'�> 0~*?�N�Jj�r�}����C�@-���%ms���E�!�u4Ȏ�cS�����8���`44�Ӣ&?+��j��&}@/�8s�G> ߈X��) x�PDuo���G�;�6�`2��1ɤk?�)�vB�k'��P����:�qb-��͠�y	��]�x�Ї	�:F|����wT ��M��.ϖ����`��!��R���P�e[�.+�8Sv�:0��-�����_Lfb�x�xT.jvn�?_�,����X�H�F>�#
غ�����`)$_�4�0������n���E����Ht��������lZ���0�#X^ɤ*��YO���+�`��h;%�h��`5 X�Y<���\}S"  V˖ё����1�&�<Ԧ-5գd�yu�N�ؚ��+���=ꓜ����WO������늖�<V��x��:�D��t�J;��'i��4��4��Hd5��ֶ8d㋱�ri[�k��U�A{�WS뭋�EV���A	�ҷ�C�wk�ې5��I�,���M�b�������VϑIT�[c�u[�ذ)ʩ�������v�{	a,(U�Ǵ��V`uˌ�L`9�iz�6~��'�b���̗Րs��n'����9ݽ�C%6��^���"|�D;:j�@�?��6:������&��m��ݫc�9��\�h��!A�/��f�����1��u����ji����M�J�T���1�����U�-�{�k��m���C�
h�-���g�9Ǌ]�9sS8�#\b-ѥo춱��3X Xj��+<�}�_������E��A��)��JubK�*"V�G���v�C�s}!�r�H�js��i����a?��dEyд�:��6>���n�� 3	0���^פ��D]��4���+�y<�qPj{p��6��L]8��dwm~�z݆t�WcǛ7&dv]��nk��V�E��5|����*����N=AG�Zo�0
�&`�Ьyju�i��FF��uX<���c�7�z ]�av0��L�F�L1��k�;y��y�(����l_P�?�Y?S�����brۏY��b�޹ߵEϊf ΄�p2��T}����$N�V���n�A�a<���*]�ǏJB!o�!ٷ�N���9߯�z)�#�=�2����{SW�F�*�H��x���MX��S����5"�/��n�����t�S�	�g�נ3�OK���˱m��ܦD�#>8����C��1D�H�62dQ�����*�}���]V~�-��x^p[C��F�P4���IJl ���E�@���Ҽ������y��]u<Ͽy�yLy�ɶ�2��Nj�
�0� G���N�ʣ�?v���9�E5Mٰ:���\��
�e�s���x�no/���Ü(�3�Q<����ei�$��o�y�.��leP��\n�h��:�@x�h����h�b*r�hk0i%^N�{�$��6Ј����l���[>6���U ��1�uZ{~I�eKJۓaNnl�[��X���d�((�0@��'ٻ���혊�$f��M$p>��:g�)�-X��	k`nh
u{��1�Àt.� �  Qfc�X=3۾S����т�,���ّ�dRP΃[c��^���]�q��2[����ͦ���e
i+:�r�JQ��s�t��4���A&�#�F������2j:�q,1dy�[l>V� /�5Ģ8?� �.����o�\�\X}�� e>��m�}�	��0�5��?~�� /�薔����c��ix)�����~���C��Uy�/��'�}�&nd|#pQ��(~�Q��eg����Z���d>d��E��E��_���G�}+o��x=��G�$l)"Le��<(�Ϛt��-��A����2����/�MuM�y��tG�)����&o}���>^o�A^1i�����;��m���s�~�R�cc�8>߀�b�أ�,��m�ݸrLl7$V��'e��}�^���ƕ�&��xd�(i�ȭ�[��7_G�Urn��2���� I[ �������m�5 X����k�P��*9%��\��F�i��bن�8��)xUZ����3�ʪ}�7/`�u�ޙ�(�%`��f�Y���0Hj�a٩�H%��
w�f*HmH�k[�^
R�sX{$i@��N7���ҭ|~�
^0�?'}�J=� )2�����mW2����
;�H���ΖN����	�DT�a,��1{�۬{r��(�������<ʅ�=�B@j�$�Ae��2VvO��sl�i�⃌Wݓ;�3�lk��f�V�>yۨeo��v'+�gVr@z4Ǣ*�҉��伤��	�T�5hs��OT�A� D��y%���ۣB2�������v���d2�SV�Z�C]��hYr����	�]�v������H��q-k;i�~�t{����v����&z�6ۖ܋���e��!v��y8[�鿡�J����-�Ѻ<�5B�%^E�L�D�IeqiH��6*zz���{$��0�0�iU���.�6"
�m�bLE�Y��S��d�qp�aK-kHy���� �AF^I��졦��I����Dy�P�����Z}�h�v�$�?�T�=�c@BT�\�,_�cz|i'曗=�83��~����t�~-��$�DX�UV��:�Ǘd�A�0$�DX=Yn?�h���� C���PÇ�۴ǆ �c�*����_�ٓU������y��P���e\3�$䓣����t5 Xe�z_V��-��w�`S��&	a-F ]K[��,���UL��'��.)���b�n���`�7s�<=���4��ta#��r�E�4a�)@���q��Np���"O6I4�z2� 79c��k�<p�ڞ�5 ���R��7S��F��	� ��M)�)�X#���k��G9�����l�']�9Z[��q|��f�l
_��,m�G���zUM{yS��g�sK������%=P��"�4Y�3Y xvH���f8�5| �<E(d�@R��^���C�� �f���zu�cM���
Xy�_$?ҽ�=r\@��`bQش��� �1�MqM�ģc���nMoE���g2��ǾB�i<u-�$���,����Mf_��l�aYqѫv�ٹ�}� ){Xf9�Ǚ zV�>%t��ZZ���ԩ��أP ��ؙ-�J�G��'X	�k茉�n�G���'�$v�g8ZN!q��_���IS@6�$ׂ%��vj���&���p�����9-���+a3x:����5r��?����i���      '      x��]ۮ�r}�����uM� 89y9�@"u)���_�b�������ۖl�_vӦ�Rժ��%�5��2N�֌���Jސv��TRgJd�Jt���)��?�N�6���~���~�����2��|ɿ�/�)�N" .#f�A�1�D���[�J�߳BdR��g��+�誓���$FB�H�7����m������2!tͧ�_D��q1ј�y&a��g�H����"p"\���V���t��$4+� �VdT|��N��H�ָ��amȋ/��w��4�_���1x@B��|�+�ׂRc���=%q�koW�W���oB��|�M�>�ss1��$d�-uc��=)4F����DټNWKy]�;!�4���Vp�W|@e�k2G�5%K�G���g�n���曁��.�k}Ƅ�Z-�V�)�oB+���4I��C{�'~�����o����r]
��GR�F�,��miD蔚O�h��f[��ZB�F0X�������1Q��~஌5~�Z�%E#Q�d��!}1(My,�J�Q?O+i��L�$����'׹Q�xA��8��C|t�����qh���c�m0!X��d�709>5U!8l�S��ԅ�u�-��Yh����e��� 0���E;�"{?����2��Kg�\meO�3YSx��2/
���\�)OsK�0�9r���n�7ɭ1���J�-�>-�"w��
�7��>�R*��:�1�q7ޚd�@o�k�KV��LGa֒gr(�����<����%�΂������u��)��008�lW����az�-qie*JN���%cG��֧IR����0�������(�q��?yJL\��L{U��^s���}�i����l O�k[>��\�V��G�N�3na^'$��t9=��jzTʙ��π���f�E��U?"�x�;@(\����o��$�s�y�����	�w?�=4ժCɉ3s�^ִ\�����J����:Ն�*ܽ�d���4m ɸ��b.�����1u=o��s��걑8��~�t��}e�1�-�R0d��(��&�����`r&	^��խ���O��Dʓ�M�0�|d�,h��C7zġ�O� peL����'3���ZY�\���!{���MŊ����<���L��u�NKs�h�ڋ��(�5�>Q��^�����g���c��L�1������H��;?Fa�������[젩}K���m�⪴�K��>���Q�l��N�/�i��I�I�(��ҌP 0،�" Į8]\s�IV��]9�`��!	�Ӟ�����jI�0֑~4�'M���f�ea7�W?I<$�����ƶ��b�?y��(?��l�1�fP�L�v9��W�7ө��v[3����� �ڄ�*#oɃ+�i�?x7mGTU����nIp��颌@58�*z��V�	=IT�0 Ľ���o���%��ߐ9���H�M�K�,�6ݟǢ�4����S>{~�'��g���B�_)0�art��4�JW����D���ҽ�a�UWB��K1��3���傧cم�E)�0$$������.PD��"B!��z�p���*�p�9ţz�l%Έz�Ukׯz�²��Q�'�f�Z�S�����Gz�L�>�!/Hw^�Xq�a� 0_N�{�}��|�؁�(�͒3��||'��e;'cM��`
'�l�˓��wl�>��ܯ�L��FT7�!s��k��"��D7��B��Z��� �sЌ"=-�+|�,�s?<�z����"Q���V��v��(u��Q�!�U\9�e���%z�&�Ɖ?���v�ҍ7�ӧ\*1n�a��ѮrQ��w�#�|�#�nk^z~V�2��ӊFUC2D���$�O�h$�0c�u��@_*��`�z5��;��*��`���^�JR3������QA��0�CF�M�ŏ~���?TK/���46������OUT]M ]"�\HV;�����I��B��Yٯ�� �v-݉���˜m�� �<��8;�2�ꥸf��A&��	Qd]vi��� s��UG0牤�O����2�^p%��$�+߽6y}Z�����]A0!<�%����SC����SÎV��>��5��`ܮ�\�D���SK����1�U��J >wȭ�՝��~&>U�?G5ӏ�V�tTm��֎���sj���<���ξ��ԮD����bu���,B�	�~��=^Za]��XT��������݌��1��$�n"]ʙ=R�>QE�3CL��$��j`��tI���?挿@�a(�|i�w&��^�=��o�|	�u�nA����<JN�Qh&��%�����o1���#Z?�,4������|PQ��w�,����B�:�HR0t����~�7Qh�mU�*4�� ST�\i4NS�!F,�!o�3 y��w�M����k�w3��H�t�Q�O��r�:� Ww/"Όe���������+���g��C��m��A秵�~XM,@FG�P�Uf�`̝���*P�)��c���\5��#�Y�������b�tX(�o��b����D��;�)ZJ�.�4f��������:�}���� Zq9������&���l�\��L�ʭ��,���|~B�O�;�74��9�>F��<ň�!Q�}����C�>U��
�K��n!��QO��f�\���E`�!��(�%�+Y:�f�hͽ�բ��
0ʡa�'��^�y��a�g�9�d�3H�o~ӕ��5{X��3�= �� }�v��p��_�y@oX��z�O�(���y�nݷ�Sԁ�+�՘�D��)� ��:���Ʋ�����gw���o��Ӊ�c�@�rr9�ȕ���.���vZ�
 }�㡉)oK���h�7N�O���t�3c��|7if������7����h)?#�Պ���jE*0�;Ӄ'�z=��q�Q�[�����=Y|u��IW��%�W�>,!���Gx`����h�;��zAbi���]U�!��*crh�ӵ��R{��Wʇ�Nz�*ڹs�oi?b��S�Ջ(�����j`"=,)��SQ:	�bퟫ�w��N\򄑷��JjJ6_b�[G���I�G&�	���ʅlOLuwsΩ �Q����n���1k	�G�ُz=��S�"U_�Zqr�1�<��c��)Q�֋��C2������U%�P����������gi�����m .b��ם�ăl��\R]�@~|��z�:��a�����=N�K;o������|�}�?���k #�'R�u��g��� 鹺��N!HiU)q��q�$�_���\]��zdB��	����o�����T]�WdQ���V8�\dg�z���u������l>�`n��w㗾�K	H�Qrqgr���L�{?-)�&l��[�o^Z���+�R�0?�!�c�����	y���l�>�J)�!�]�P  �y�z��qg��(�Ga��0�H�.7v`�d'��7�|~ɺ,O���Nf[�%#`,>>Ɩ.�����
�x��sЃ�]Z:� ��O�U�.�T^��\*oI��#;v�M�~��0�E�S��^��"�%��y�g��-�!���R2� s�J�$���m�W��g	7��L�d��p{��|��ֽ����T'6�A�E�=ͺY����
ߟ��oJ�(R|F��5�6Us���wr���7Bv�������k�*d-T��6VaCo�<:o����C>�9sTy0�mCB1I���^[�<��ܳ-��z�X׫����L@~��mb�c0y�Yb�?�����}�����GM��%-�*��SS'7v��,Ǿm�)�S����8+��4]��{E�X�T����ۉMk�9��#	.�p/�%�ٻ=u��"�u���I�ã� �dS�����ܯ?g�G�m�.O<�'YCMܢ�v���¦m���8��rU�,�A�N"�6��Y���ûIk�G�b/~���œ�=u��莄����D�Z�ڣ�|�Ju�D6�Ҁ^��S��~F;�9����e��e`��"�h�ֻwZG��9�#��7ށ[<��}�w�]1w���C�FQ5 ^  !?g�<YzzÂm'��ίRz����t1�Ѳ���ֿ'�|M�u;#�GL��.XE�=���o�!�|2���&�C^E�x�o��w����h_�)q� qHcGUR��q.� D�@(d�ȋT;p��6A�Kj�0f���B�z�1��?���d�!b}H�q����i6k�מ������햦`��ܗ�ҦP�ֽ͎v�8�g��A�����<��\��H��^}�ku�Tz�w�-M�p}������J�>��g�>ƙx��>P���2n֔�iR����I3�H�l#����h=�,�M���P]R��6a槕���H��PU�55N8}ؒ��]�RO���Yl*ѯ��5�߂� ��+Q�B<D�x��o�̜��V�j�8 c�fM�*|���=�<�`��Lλ`q�X`���p���!��Q�fN�%�b��� dA�k/szy?���G�����?������1 &SL/k6�x�� c f���vf�C���fC�^�9�he,W�wcH��Ԭ�iA��-'��?㐛�K�m�ϫ�ٕ�C�����,�$x���a*��'��~�)���?���ׯ��p({      (      x��Y��H�&��+�i1J��8�5@0;��j�SRy_�$���ׯ�03�#ҍ�fF�ê�ȪJ7s�(E>��PV\��f$��Sw��1�����NY����-�������?��7�������3������<I<����;�r��~�"�e��=�۴�)+��E����.�A���$�Ȱ��#��Xf�K���X�GȘ�t}7LNG~����eA,���K�����O��E2V�y��f���H�_��Sv!#R&���H����o�>�S������O��ƾ��2�xfG�Lm@lf鿠�$���W��Zx �ɚ�ߏƇ�)��Z�c��<���m�?�[֞�C�$f(q�ԤY�_K%!k���U������+����ך��:U�0;t�L(��Od0%ND���[�l&*��_s[�O��{���%H��飹IF�>�|�����L�5ұ4�����$n�8��VP�y����(��k���i���y'�E��?��c���g���u��ùR��g�uxRoםk���S',�6�M��UC��:ʛ������x#Ċ�ׂ~���B89��_K�ъT��Z�oЪ��ɶ�z���sM�'k2��k"*'L���[�~�8���X�F���޼��+�n�Y,��s�5-��w�Q^5��W���X�_c��#����B��=P)|s[��sm���-)��0���X�:?�oŅ��W����%�����Ǜ	W��q�2v(#��,�����u���9���������?/���o�����7�:�<��/O�y$"F�`Iiy�<��9�K��u���d�Ӆη���e�m�������o���_������8U�o�����]��nC�5;�g�����k �7U�e���ϝ��
۪�dK�s)�3�&GX��K,������tY�K��4+��]���!�#��/�
����q#=��?��E4��&_��ǐE͘���x�HhV��y�����Gw�&,�\�\���c,�&��m`J� ����i=���Ԟz��I�5�.�
~бk��y��%�4�/:l� �B���
&k|J�r.>Ŀ�>�'杺er�ĉ���(N�o��:��'��ߕ�U��?��i��k2�Bw)R�K�Ť�BpB��6"`}��K�R��a�0��Hh}q�p #�9�D�?��\�ҽ�;��
���c9�43|�`׹�N!%k�D�}ua�	�(	|�EC��˱�+��R�V�tc��Y��F���1��$P�~ly �P�f/�xY�d�������$�'M=���$߾�}Z�!@��ĭ�&|Jr��;�� ���td�nV4>�����a�~5�`��~��3���-�a��6+��̢=�Ƹ��T>%+-�+����E����j�U Ǡ+Ha�/�˖`�(}Y����i�EX�E�4M4MFv��'��}bO�G 1�_V}��a�0�7� ���*a%n����P��� �,v�����"�+\A��\���z���Z (BBVi����]^�CZ�IS���Nmo����S��f���cWNۜ�g�."��&A;����wJc]T��d��}�C¤I'�#�����/����(��Li��3�u�����]�mT���C�:� ɹ��ٴ��,���K��IK���D(<�g�W�����ߛ��J���:}����: ��'@����/}�#mGK<��#��6��խ��� 5�݀"�����"�{�t�E�k�K��A�G�vd�4�ڼ��H^�����0��V��t���)j�S�M�'*��.i/G���N���#�m�8��|����\�Q�8��Nw����r!kqOB~ڦ�-�N�F$U�tA�����j1���=�О󟓨�RAl��A���� e���/f�W � U���۠�/����9�k"�ԃSC�ǌ<�_L��_�N"G����B�&}[&_۷����M'pHH��~R�.����j�|!�IH��>���LtT:AT�ǉ%ai;��Y�9��O��h��躅��FU��8�Y�:�sE�M(=<��6��$����M�kx߹n]���OD�qVЗ�U��#�_,���!��I3c���.֠3+��d~~q�MC2i��4����Eo���Þ�`N2��]E��=1�O�KL���[����C�*F�	�����eO�݁b�t-GB�4�jCsP��o����Y]�<%�K���7��T�W�>F�m%I2�_�,sp$?iD}+�����O]��� 1v�Sk[^܃3��	x�~���d'���_=�b�\ڃs�v��xP/_d�]6�����U7���˥S�y��X0�wXԔݾZ����C�V�x��t��ɒGWq�
��t���y�zG��ySM�Z���1Q�'�-��|C��:��y	 ����K�&��^�%�L�6�΂&5R���wp�~y���C�mQ�|l����#N��'a�����˳�<�SQiN�a�ju�����fT6�����`�R�����_�W��[�$�¿к��>R±g�YOk?|8W�"D@�P��U��j?Yļ�p㶤��Z*�ɜ�5y�SC��r�)�D�F��YA�䀹,�w�&\�s�i���$�@�iԒUK�{O�?����,��AJI��	6��_�n,���~�{���o����ɳ������\�%'v�:NT705~/#j�d��\wl���׭`��7�����b���D@k���Yw�wt�:���3*�Hf���3��,OA����ґ��
r�$P�[I��{�[>O�a����H�I���H�8j��oET�����;Y���!��(?FcG�����)��wiCh�+�S�҃Cc���'dxS���@:9�x>T6�3�Ⱦ�փ�H��c<�ak��k�0��hI�,Q>.[�6v�CN	�ǭY��i��]�w�V:��<�7%�y	7�ܥ/�Xg�+�K�����k疾��i����!�E���G*����� �VU���W�n4^'1u:~��lu�'��k=Z�$.����Z���1��n��1��)��I��
 �ڤ=����m��ΧWG'h��օ�ͯ�-�ޡP(�ɪ��R*�K������-Ɵ�U��/ݠ�J�6e�(-*N� ~�,���;?ˮ�`��`!�;%����PPK�{]�-�0*E�w��
jN���ad^�Z�y��/\�&�[:�����x����ɢ�;�ο����O���>)��f���<8�%E�nkigRc0���8�b�jŠk�	�
9aC�,���B����N��R��N7~��e͒T�Sd��8~��[w���BI��f��#��~��:��?x�!�e�f�r0�k�+FVy�Al���jh�$�]��t+�w��]?�u+�wԾ�TR8�c��h������F�Փ5�6�c��n����TD�|��6�P�6�H�q��%�J���JP�䏓��j?��Th	�̶Ɖ^69t�,*D�󨳗�f`|P� ��d����o7{(��~�{*���R����G$d)�">�j�l^&����oje;�QQG�yA爔�?FT��̮'��C�_��mjv�J�'B�,��lW�̙6hB
��mW��DNo�1Z����ƈ��:l�ih)�<��\��T���"]k�Ď��-[�)��(���Ԝcy�vm��w.��|��+�Tr@�я�o��S���zd:Oߣ!��Ǖ�'_��Z�=y�>Mq���� �o��@�)�s�B��
�վģ#��mY�c�FW�ggWj�c[~��PV�}�ۃ�k�r�=%R��׿2ǬSM����.>{Yϣ5n��i��P�L���m�GG�B�)Cw�o��>�-�3�zD����u�v�#8<�_�F���`����%����&����eG6'E���T��h`��+����fD�w��<�A���j��x���9i]Y���kk�E
t��\�3`�{��:����8k��ʆo?ؤh�
�qKB={=��s�A�$�ߑk���].�p�q) #�P�[����v��U�� ��C��ٽ+��?�*�� �    �U��
�����)�H&D�N�ɿ��Z3|���iPk҇�yK^�v�G&�泫������"þ��'���	?U�q1�jx:Z�t��לּl��AtP{О[D�m;=����O&�'#��d/�h(����(�Ho�a֘ۡ���6e>2��<ී�|_e�ǲ�g?={�3q!����%�e�+���=(q#�!+�j�n�=?�+F��V�mQ~
�A<�Q�3��Tn����Y��nX�[�2��h�2� #B����JN?�jl���ʽ�^_������z
^J�pN�v{����X���/�7�]���Y���t��M�u��L���˷?FZc��$M����v��������"1���7���(Vk��o�h�Z���惗i-�2���\�N��[�� ������e�����x��ˀNaoQ�Cn����r�7�����]��M�b�?��e��C㏯у՞�g-s���zݬ���k*��c���ۤ-�{3]���~���.�/���t]G�rL����-`�W�8� Ҳ#o&E��A���ҡ{����ֿ�:���+�� ��:�5NS���H>*�U����52�
����o{D~�@��d�����_���<��>$�s�y�'N�=�x�Dh��|�h~ދ���hu"	�EǞ������x)X,�*�'x6�'�i�9z���aa��7�$E�bu��`���[b٤�_�:�>`��}��@2k�P&���9y���a6�2T�����}��r���\C|m��ۣ|v�=rŗ��� -D
�p���.J��IX��g�!�Aq�'�i����{�Wx���z��9�s�q00���(���Ὄ#�:��~��<Z�����4z.Ϋ��0xL���A�֗㸞K�}��ô����4vd�ҭ��O�̤�J�َ�l1!��BT"��5�@L�Ek�V7gcUa?4�욌������,��;��l^/|�	�a������B=w/6H�@b�ȖL��K%=�[��l�bBO�>�*.���%c�҆ -�?�/�g��.�\H\_s@29"�Q��6-?_�I�.qڭ	��ƹ��à$���x�մ~$8<��a+l�M����o+i���$˲ba���l{t[	��Nv�M��V�t�4]A�+���"��S��{#�8l���B�C<g�����c����1��]� �� �,��sO��ND�9c�Pe㣌������~�&�,��{�2x]ok�u��B~hDy��\���_����=5��S�'��kvΰ)�	�p�F�K)ġNZ=��~U�A8:d��H�bADx��4g�F���"̓R<������
]pP��>aI�S_�Ѭ{�1�J";v��4�3-A��@>�$-ۼ�~Mԙ�Pb��� 4�A@y��:�X�`��-��.��V��Qe4(��q��W�����b[��㗮�8o]�yc�#�%dw]���Nd�&ɒ�먯3���|��HA��GV&�;�U�	8`��X�˜�hW1CW�5%!���v���{4�" �b[��W�ǂ]�t����e9v<���2�|����M���pLz�g,b���v��ڧs�i��������lz0���Ee˖���7B����3ڔ�Q��xK��m�>�k�������F�B�LU��bjU�yY����~�"�Ϻ�ʢ�)ȈFުj��z���!������9�������d,@F]��ɑ�	dԙ���+B��&�7�)o��οe���8=�e2X*�����S]�9�^2Ly��=�FUnkl'ݝc��6�M������|@Ǳ1,�]���nω��y��kI���kI	�+�s��7Ne����;�ΘJ��Qi�~�>�!����͑}�^ӢD��C�=�o�~�S�yJ�?���X�Y��#���,νb�UEܽ�,b���q\%V 1���A�D/5�Z��TN6Ě��@e*�qZ��uu��`}'�[��r��n�\t���ֲ��ޚ^���4/r���|3�3�+w���-K�]:�gN&����v�_%����������A��+%@\����bE�\YR��.E���Nܸ��pw�x{$>2�ޯ{���9*���K\Wu�_p0�	*�kJsM�)(�羥 �H/"Gmӊ��B���[�k��KWY��uɷ�����>uc�ԇ���x3�<RF�#sp����:�A,��%ǩZMW��b���m��<k��Qd�L"���yV�KvU�sL�g��Ene�ڛ'����ns�4��f��*髦��j��<$_����	At
̫��QE�5E�[��(/��5]���?*c����!�0�hꙒ�<,>D�����5͜���M�D�➯�ZG��g��>�s��n�4n�&�y��Ɯ�Cc;\ø���m���.�!�	�M�8�(O�Q2��7������sB;�b�ܯv��*iu�^ �͍ۡê?������l���y:z$��)�~�b�S�B��,^�q�L�~�<�E�K��^d
;pvr�ڃ5��h���S�^��+������u�Y�s���YF̶�򋏸��{k�Ȧ�*�d���7F����%�V0�N��[7��ڹ�´�
"��T���W5@M�� ���8,}���Fjz@�z��&a���� [V�_��Lj�%.z���{�j��I�05��1�~
y ��?�a]�v�j���!��o�}��z 1���Y
{�7k�OfY���ȰR�T���G� i�H<�sDO�9�95L�ߥD���%ҵ�@�f{ێ��I��37(�k����U���>.pX��mnI�5��j[Ƕ+��^xLI�c�����X��/S���1��'���0���G	AC��)���t���>��_b�ǩ�����������615����9S��n�;i=�'��y�m�)�IH��O��X^>s�
J�Ĉ���5�o^���_Ѥ�����j��N��WK]E�f�(���t�"IO�%��n����o��_���k�Uٖy\7���YL�	�J/M�5u���z�N�W%�&Q�6a��N��;>�_��b�N�<&�|=�g9�p�lYq��m�)^x�Wd��߹�ʻ�9#��e�%qD��X�!ڽ�x��}�~G�MM�5�3�f���;?�<։�mF�H\2c�o�ڹ���?�����	��o���������wg�Q��R�e��ߧB<ׁ�t��;�=!�T 9�"�b��M4���FHva-��{H���T�:z�56>�(�p��j��������\��5�ZG�t�}�] omhC����Uc�oce�ur#�4<�_3��&:de2��{�������#k��<4��=�����u[���3��&6� zO�0�u8R�_�j� V:Ʃ��ҪϹ��O��p�*�N��q6Q4N�"Y*�9`Q���ֺ�5�H̈3B���O��h~�;>�@?I��{e��WՓ�����	T������L�!�1�ҊA3�ARdC����gɪƓ��<��H�}�y�$��D�O� mZ�U�zҜ�FoU��*	P�ky�=��R���i��_xFh��έ�:���٪4o<��������DA{&iWޖ\Dig��hSq����LҢ:���h<�,����1�/���,U;䏛�t��M�x���6y-;�d���G���
��3�+\ ���743ҕ��Հ�z~�R�>��m��N��H����sEmF��5X���^���"�u[qΞ�u���!;��/4�u�`H��v�vXe~GQ`yx�!m�*���V�� 4�~��NM=�x3�����j�����9� ,���c������E�Y�[�t�j��.3cu��'�-�Nɣ!uL��{gʀ�
d�骾 ���	��A�#�IN�fZ^f:i��'Wt��z������!t/�3��7��vS�%|�1�UD��0m�.S�I���`�=-�I    �6=0J/�%��&�S���}������o�2��{M�x��..HTA�2xo�5�����6�o�ʹk/��@��f�X�H�Q�;V[�����'��=H��̈́Z����n>Q���]Zj��?�+�N�9��iv
�#xD�"+QTpvN-;/E � Y~[w����Z�EGp[-�8^D,kGЄ�8f���E�&C��Z�e/Js�2~ļ����Qz�q&����F�pZ�v#�67i]��D�e��ůh[O�oQШ��:��z�J<��� �L9n�����¯���Ę\뇅�vNn� T� �0���ܷ�}l�������x�D�Ķ��
����Y�'._*1;ԝNs-���5L�9����wD:͔�T55q' (�O�p=��O�*Y���r<��w�E\�*a��}�.7�_O�8�a����ӫ�j.�\�/��X2y'�A�s����~��Y��2�{6�b��L�5�h�#O{�"����,��iTG��-�1$pdA}$�6��1���;6�yv�7�?j°�։�Bz\OQ���>H��f��5�U�|pѷ�O���f�n�Ѷ���0~	���|:�C��u`b&�";�S����HYcѝ�]�S��:�=d_{ނ~cL#����N=Ռ�#6�J0++E�+��-9��0��v��
�5����!�wU�Kg)��0ߔ�jĠ���$�����Td��p������k�9:�=���1by�zψЇy��Z��	�B������jqZ�Y�����2��z����X�s�:�}+W����i8�-t������R_
��4��EFaxj�t��!���Nk����c!|�]ͪqM���{z�Abg��Ҡ�}��'
D���2]�(���*�^X8Փ����D�D픙O#��[�U��F �q�`���A������>����Q�ݦ�&�>a:��"��z��FG2B34n7j�����6����и5�k����m�ʎ��
 ��a P� H?�,kf�wΪ���6J��<����ߋ�w[�7�;`n`i��Ӱ���%��1�h���Eḵ�8R
@/ �Cmr��fu�#��=T�^�)�|xP�K�)֍(�>�7��ԝ���^W���V��΀������U�S��� 1�Nd�R�N٭���A��V�d�P����bNN*��&}��$Fԯ�#���A�'}�צ;��$)��S�Y:R�{�,��v )p��d5~T��Y�g� &�mv�	k1�8�q7��.�����#���1��׵����=�$�AbL�X���46�MS���9Q���,�u��46�  sĆ~�6�ݚwi���@�W�_A���UmK�IM�h�V�ۖ�i�m��)a���%�܌�;նM	�/჈�uh�l���^ـ��]J��\��	8P�	�~s]��7��*�B�sPl�K�h�{���w*6x'ϳ����*ۛ'�m�,����������z���4_�_ �xK�:E��^��#��^�)�g�{�S1�V��J�h���*�S���H����=b�![��Ж��O������u-4�e���ZC4d�k�)Y�|��b����
��C-qc����4e΋����R���9	��m���
g��a���{Ò�5�~��Gi��`cXg�)Tt���͉��g�8���J�l�3�Q@�7 �=Y�zMV������A�)�O�ԩ�&�I�s]ܼ��X��F ��R��Nzx��.ݹ*8i8�66O��,b��ue�-��n�lE�\�qz)�i@b���w!���0NJ���Nj�[�����Ɵ�#�0I�d��'�n�A��G�J	�1�gߤ7��!�m�~K8��>��ː���o\�p2��(����V �!�A���?vd���͆����+����=���=(*��p7���K_�8��?ɾ��	�1�|�ϙ����M��!�!���V�Eم�m'LR^&��{"�"�KM������zTm������F�E��}8�|�)��烜R��]�q�8�~t���6��(�<X���Z���.���e˜m��^����&�^&��l	���ʳQ�<WY����"���>J��Q�{���Ζ�r�h/�ٯjd�u��ajQm�2�]����6H�ŀ�ٮ3,����;!PgpBlLW�k�h=�L?]b�(W���hя8S��c�l6�)[_k�1PZ����:m3���A�b�]�p��%��+�u�݁di:��3	擣����2FCY��`zv\�'��-Fg_�$��iD��JݳΎY��i՘l�6QoV=�4��̈́����+��D�+L�@��uoE�T˴�Ӎ�ՂAasH��9��n�lP�=�Ov�;�}؉��?/�8%Fӆ���x�auI���ɽ���nQ���8R��X�X�6�R�4L"�"T���5����a�y������}
L���ن�*�V,x�Om[�80�]��7`��ԫ�=��k�CP����ұG�:7�O��#N�`va�H��~糓�!��:�*y����M�M�A,�G��y��:V�c�p1U�N2��S�Gܙ��q�^@�I_w�|���S��>�0�+qW�@܅t7��Ӱ���-�w�ov�Q���WN���-�j�`.ǳ��^���/f�R��G	��H�~�ҍEj�gG���F���郦�����'��CJ;I�Ν>�iW� ֿ ��o�{�%��6Ȋ�Mt�~�I�!��4�0Cd�J������DmQ)�b�V�r���q/�O~�A@��)�nU}YZ��9"��� ������l���Ňՠ*�'v�Nѓ��8Q�,�11��\eM��P�=7}� ep
��5��~���?� ������p� ZY|�xo��nQ #bX���t����
5\`�����S.Xɺ-��>��[�z����$�z!�H���@�{��\�C�+C��/�h}o��=%�f������a%�w@�8o�E?���葂�j|B�ۗ��v�>9	o@dx��N�ۛ
��"�E`KBL��unN� �ր��0ن.Y��0�}?�)28,qƩ^tkn��#0�m���A%�x�����b �7R҅^�����[�(o,7���	����GAr�Y�n�٬�bEn�~G �^�w���&��r�~��.�{$�]��$/��^�x���fغ���b�GN�ܚÆX��ip^ƫ)�^Wt(��l�M�����e��j�1����p(�{t�O.D�;�x�Wה=�z�K1�x����X.,�F�E,�M���C���x4���Q����~a��R�$l�-�Ǖ��W�-J�1�c1$rI�C��*�@��d[��b�����I���*})��:�̓9�=8(qcSr���	3��p�����oa˿��S-Z�뵱X�x1ΝbK�A�LQvo�x � M��3ҡ�`��g�I����T�e7x�bo_nŃ�k���~3�I6y�l(Nn��K� �h�/+n���!`�%�7�h��MG�<���AbH)!��l�*-QY�zҼ-����͘5�U�W[��SP7�+�4����n����#�F��߇�Hw,�Wע����� ��7���Ѵ�S��2�����V��ʟT�IP��!1�-Yԇ.�?��۪�����G[J�5�c�4"�ּ�خ�>O�?�.�"�$�j�����0�u��^IQ�h+:[����V3�"��W���mx�X�I�ԫ1Q�$��_-�]��^~�C�{�e%<M��;1���I�.�'Qb�s����{`֘��ƪ����@�c��*b{q5Mi�r��M!l�}�"�I����A��n�(�ݺ�Xe�I��ɻ;.y���pP���D����ۜv��3�9�g��_F���,�r�I�J7~��2�]஭~x�h�	l�#6���]�t����yǢ����ȭ�E�V|ȭ����ra�O�����+ �{Mn
{R��NN��X��1t,��f�ә�ɮ��2����]�ܪ��0?;�b��>�d���/}�0����ˠK3hu��g���    �nL�&*�����k������bt�'0F��Z���.�}�U��='��9�y���mp�����~HbB+Ҹ�hS���uʰh��2�f|/o�+?�L���th[k'"5���P��$F�\�Cޫ��q���
?f�3dX�;�lܶ/v����ރ�46�j�p4ߺE����P�t]����Txě�w_@cBy��R3 ��@�Q�sc=2����z�u�4,�B�ú�C��E�nFѰ{0lвpVd����vJ@�vJ�|�������mk�κ*��#��M��3~z��"���\=��W�N�k���}�v�V'h0e�����|��͓4��J����輡�o�J�i��i���m�01�:�ܛw��*���P�*�<(��*����0���/d��w���w��l���0�O�.��,D�X�(�5�҈�<�;חTG��:i�㵝�(��3=1���\���2SwTfx�&�%W�w��R8�+m�_u��%��òުK,kom�սW���9`a8�:�<w�c�9�w~zi^�q��n�Lϼ���L��rJ��&����y��[,_|�܁y��DӐ�0E
]sߙl�p��q'��z��X�^�5^�3�R'�a�I��	 gH�y1F��>���n���W
�^d��K��(z�V�>!���0�����a:�1�9�����R��ڶ1po�}��pbe��K��)�pg��Q]tR$j�䫯�3�#L0mdݰ���0L��٩��H�$P��̳<ũ�NcnZ�I<����mh�6Z�>�_��������&<Si!,���mS98�S���G ��p�>��]{q������(}�@�㨼���|>��g�p���8�]o�Z0�ؕ��hًa{�C��ܶ8 �� ť_%d�(��t����W����U��(<6ρ�bU&٬&)�詩��8�q\e�Yn�7O���s5� �mӥ)���t�Á͂W�kq�V�y��\�E��EY�S'%�^�������n�{�[�$����*ˣ�%���2�z"����C	��ϴ�?]�A� �A�����W�O��v{���t����,!V��?�U���P���$g�.�3�K�<׸l�Leq�X��f85/�o�򂹫�8����bݺ�hh1�]iF�#�ʿ;'�ǧl��t{U����{U���/�����wM��7;@`�����>�n�: �f.���.��E΢�yp�-m.[ 悉T��?�'�p���^kǂ�;�}i{��������k�,{�Eo��s:��";,�ϋF�(�5���Q6��)��#~|O4[�@0�B�z�k��ޟk1H\���b-�n$n����ZC�m�M���uV�x�W��
탞�iMa�ZN���e�=�������[��Yۘ2]���6�@x�Ax����^��;�b��L�;����F�m�oO���"2Ԁ��n�G6k3�M��|����y \����Z7�{�P�wa?VN�'�گ�:�Ad^"�7U.�ߞl,��Tp�~�ϗ\�r����5h����x� ��1��*�Zh�EK��`7'�5���Q�29���:M�UFMLt�&���������,,���D̶	�G\�~���qb �C�P�s�����<��_^3=��ܯ&$�5��;ݨ����|]lo���Cg�EE½o.�5�\�V҅w{A��}��YV��H���^#��Y'�PU��V��z�p# �@����K��7�Lp�Qkb�׀����n�v�B�K@�H-H\��exw�.3�5�9������-Zmo��/6�ۜTi�lw�z��K��;�WC� ��gX'aBޝT�p�����|<�򯶃������h�0Âk�Y��W �Hd��	��NOa]��=`�<�=� ������uu=��u-�5|���N�ҍ���k��;J�isE7Zg��ׇ"�ڹ��U���")�ѷꃘ��I�`M����cN�3bD�� )j����,�{�(bDހ��n�~nG����`����Y!�7Z�;��"�m�?pO�#� ��ӑ���(O�h/2 t^i���hN��yqt�Ƞ1(Уyo�X;_�ǧ�W�.�����{++#̞�[Ҧ	/w5���u���q�U�v�1����W޽���-i�?��%���g�)�,��͞�̻0�,���Ab$FlaC�f�w��q�<(��kn�]I��ekN���6\k�s�o�R�[�?o����k�K�F��@����3ブ�8D_�uu]~����Q�W� ���y,���ˤ4��NDu���9z�woa������������m�����PS�VP	k`�3�M>�ۇ�M&`YCf���^ߞ������|JVZ�W���^��:��U_���bH��JR��}�#x�� ��D�_�+|��>�KȄ�9]�D�a��A9���#�y����żzW��\V����|ʄX���e{d���A�Dֵk����)��<�G�)�֟�Y9��ErB�R��^4��쪧�D���-t�F�8��6$�pҾf0�LET�(��N�s�4:��D1�����G3�ĵdxO9ZP0K��*mڹ��r���!d;�Z%���U��OaL�C���(\���"�#;�MAZ˨��{�fD���n^2 #V�g/�##��\��n^Lw�e���_�C7ŉ��u�u������?�������/�1��ތ�S/q]�5�Yz��ޏ�e���;��ah	���;�,�5U<��2�� V16����l"���U����5 �������A{t$�j���XP+9�m�_|u����+�!�ЧN�7u��s_��� %���P&�/+�=��\��W�����X�Hi(*Ҟ:���-�5e£	�������8nA�K悍�s"�Ll�W�9kj��J���RY�~D���z�v�LB*�u-K���1�j�`l���o����P��������#�Y������~�czQ��?~$ʯt^�9mc�ƹ�/H\o/r�B\5�p �}��X�Л�����
���@�;ҷ��;1G��ǥJ>x$d���Ѡ������Z����K�c����i���n�=���7yil����𰜼����FpZ�v#̙.nҺ����}v�^q�cMJol��3��!��(#��E� :��>�mݏ�P�=��Y�3��qc��3�5H��>��Ud;AJ*��ޛ�WY�t1�T��pn#�^��ZT&���e��mGm�%�n�N=�0�]���;z<^ˁ��|���Ʊ�}����h
z����Z�{����J4��e�ے��3��БL	�L��L:���w��8&�Ax=^�c��Uָ'O��l�?Ab�"���d�su���~��A�:�23f�o�9��=��Ĩ�,U;��W�Lu�t8ǎ���T�r�/����wVE�E�� �K/�1��I�3��w�ѯ��`��rޢf����oۡ� �\���1!l��<��{�߸��JG
"&��`<��w�G���� ð�������?yʥ�G����� Ϩ�a7Ա�S�~?���?|��H<W���u=UN�v�@���(�@��)�������A��uD<�)Ҙ]�\�?�[c����O�Z8��0����kZx�@L�x���Ӥg�"��`f�/Oim�l6��& )b�e��]�0��tG_q��y�8��=g�h����<f�%���a2�m�� �sT��LGo��y��1��|�9P�V�R���\��2�Fy����h�[%_֢Jz��[n_�ڳ�F��8\���轏�Б�� RE}#V���"ou������K%�qZ=4R}�~�QF��Nxwlb�Un{����U�>�Ŏ-^�B~H��*6��rc�t�m��ޅ�#�`����n�
�=��_.3���V�����qx�\g��i��^�YOG��zr��.-;���3[�-�l�5����$�O���x��C<��7y���)�5���Q���|�խG��'VD�-E�:0�'��	k�Ԑ����_;w��-�:�]]�����/�    ��X�t�0 eF����Y��o���z�0Z�L��}�م��Z�tq��%��؎_m����]>����5*�yM��NSi5=RУ}�T�Q8g�
| ���" S(z���w�~��~�<a�{��%�JNJ�~���������������
k�w��0 J�j�.�������I	�0u�v�[g��vN�5�-�N���y'[��[f��18���y����dB���{����2s*��oϘU֒�	$�`ekQ�\�SoUz �V	��u�;����ǛÑv="���X��,$��n#�d ��UQE2��LS�I\�6��g��5MlM��:�*�A�Əm�1N�F�^[ݹ�,!��w%v4b�}��\6}]�_��	�|1��<���|�����lқ'+?l
�OƋ����h�z:�^#*�1����ͳ�D
3T6U�5�=�>扪����"W��R���u�� �Ɏ�~�)�a�N��d��!��?�xK��G�ֹ}�m�Zb$ơ�eBa�/���m����Z��Κ1�{�}��2PHr�R*k˗�uQO�`�e�� m���l�{!��X�p�pe��������^��3��鼐V��9F�d$$�,Qn���Q�9T���dK�z)S߳�S�*Zi�`й6��]{�@��� 1>�
;�M�s+^�l9�v.@T��v�Mv� ,_��5�RL99�64�)Q�cU �:+'q����"�Y��i�6���������mn5ez���7F*s�O��h��6l��\�y�)�_ԩ9N���*�"}�߿��[y���u7����~]�-�֍C?�7�On���,'�r��.�߯���\P��C�yh޵Q�&���,�%���ݳ�&Z�FV~��`.6/!��]v���Q�QE'�m]h�ܰa��% 1s�tS��wxfgo	�[DE�*[�o��� $���"��-��� �k?J܁����"Pb��{<��0~�){�.(�t�e�Ev�g��<��ϥ7yzE�G�?`�7y��vI�6�su��~�̚_I�W�+b�ʜۧ�U�%�z�6������H?�\���m5
�k�Rrۮ`�{�ucZ�X���*�/�I����bC񔋹[Q��wGv��e��CB�XڹI�}��@�Zk����>�"�;� �I���i�֖T�{���I����Nx���� 3�i�ّI��8�P'�0���ܙ/�Z $<N�����|'��u��}���C=�C;L��Ck��$��̱/���l/�3i�L��R]U�;Z�C�����j��뵠KHr��ui��De�u�U1��|��ssKZ�&x蝽����8vu��!])��6�O�C����.��F�n�aQ�dD�.9����e	��+����߫�<K�G�u����+�N��p�%�a���=�mޛ��J����N)H݉�I���2I3Á�w)����k�0�2`'�����/����ii�C5�K����0��Uh��m�>垱#G�=c�ʇ/�dUdA���--K���i�&�e��ˏ��0@�,76Ho�']�������L�a��_�$dl���r�YH�2�Ӵv�� �4	�R�V`s�+~娚�Kˑ��h��3��iԋ��XZ�Z�a'��*w½���� ��F٪4o<�{���`��.�;�e\.0����ą�k�yyC�΍��ng��^GpsZ��GXx"��MhߓY@�� q�(��,e[�yDf�qMM(āV]�������f0!�n*N��{}G�;$�78e����,`{�`/��RէK�����a�Ib�@X���^E���D�Adl�N�.(Xk�!��;�f"k��D���ȱ��ܹtJ�v�jc���NS����+�]��3���\�������x��Z��ܩ�#W�\��ή��W�j֘ܺ�d���[uf�N�p�2�����I�|���Bj!W�����Q2ˏ-�^䊷R��Hb�Z���n���_���kH�&�bK�<p�������1��N��ڪ0�؜7����`�L�>6���YO6�R��t�\�(q�L����pN�_;��1N ����-�ݛȦ ٰ�η�:R�I���[�Ơ�(|S�$E?o'��~��iZbqavɞ�p��;�~��"��,�>u���ҹ����
��^��Ӑ�m���](qc�h7G��͙�F{��>70�}�R�DAX������6F�M%�x]��)�ݞ���%��Pt��J��q�̮|�_"Tn>�MI^ڮ�o��,X��Ӥ��$�E@R0t�� 5=�7�o	�h�A����Wv^��&e���ɶ$�:v���ncg�R�u_��Y��ۏ��8$�>9��<������лwQmۺ�`8)�����B�x�D����e�obj?�{1EX9�Z5y�mqG���mq8Vt`�BZ�a�ĝ����u���>����Ձ=[�ȝM�Z��
�#�R_
����ƭ��7��� +`1f��d���E��y��^�3������Y����,��7-��BC����\���6*x/ȊV�n��O��IK,A�u��s��[]�w���i��4_�n\�I��s�dD�	$E�ѵIRq�=�'�h��h��Vē��x�����
oQ��"�L椹��Y��{}��٘������V���br�u�|%>I@,r��R�7X�;��Ү�^
��c��M�ӸS�y��\��U{2�����~�}�~_E��ƺΊ��v�$��sN�;p1�O�CK�@�1���85[��6������w��Y��2�bj�SF��?H(	��|a����xS��-ŉ����Ŋ7`g�wd�^7efw�^��w�%����/Un�׃l|ȝbl���9Ͻ�ψ�ZlSD�!?|'w��k�����(���y����RX�Ɇ2v��U}w�x�~��G^ ����f���U�,���}d���VB����&�ש��o�Ս�������h:9�}���^��`�9�,�c/�L���� �bsf1E��w��c�1N��"���!��Ȳ�k������k2��ɽϊ�1�C)��ձǴ3�)<�H�%���b����<�0��u��Z�o�ڜ0t��+Q�8{Gӡb�W��K�5�����~3x�h��_����۩6'���w��R�}<���U�����`�b�s�7�tFt�O�9�1����"�e�����y�0�^-c���'0o-������+UC�3fH�p%������Į	���"yt�����y��`d��Q�ϙ���yL��S�A{����Kf�P�p���0��FE��#Nc�Ev��>	X���8��+��L	=4��ՑaI�.�1gJ��y >۳i(;����oi�5k�w=6�ը���V���4�w�QX~��넂���>����(.��I�z��[x�V�+��JQW�
������/��=��mѕ���ov^4oS�ׂW@j��2H��=�o� |�]ͪqM��4|v���j����`ͧ����NZ�zh��Q���ڙ��x�#�V֘z���r��[�F�����"���Y�L�ە�l������^&b7�=cG���=c��0�J?e�'��ҙ�CU���i|Q`�8g�cC������?[�b�&�kZ��W6��@M���w����ط���ov�5�>�6����>TuT~��O����7�������"���X��7,����a;��)�L�w�P�m�]�'쪄%y�=4���i�j�Z�
>���Qnz�A6�/M���(�7.Ak�5O��3ҡ��6/��\,���R42�P��o_����~�:��aM�Hd��5	�� ��&�E�?7���>W��7 1N���8,��0"lm�!B5�V��Ik%?���û�Y<�!��O_-J�X��;�W 1�r2��K�{���}����z`�RNӬ�����D �f��"�2j�?{D�E�d�V|� �ھK���w��Y&p��$�*o���,���+��t%���#��KGٖ�ͦQ_����H��S�w�S�    >����)@5����)��L=�Mdd�]�z؞�v5u']��t���r��z�y���^�~�-a�/ǡo&�������6WI�G���s&pw`��S�$VX���d�mu_ۺ����ay�&�|X0wUɴ����܏�87U�[@[:��ng��_�a���EG;���>C�ڒT��+@�q�Η�<����W�.�u���߅��>�a5S/�O�N�ܕ�r*��_l��[�ևb�<��ܲ��K4�V��z�B����H�g�>��'�H�Rc�`�\v�A� ~uWQXG�d�0;�JZL�:�(��z{t��$���r�wnc����]����]>J���`J��/!_ ����)Y��2�8 ̣��Y���t����#���߯��joA+Zq�Y�L��I�E�����N�����H�l5 &�Iv��O�uh��ì��0%.yﬃQ}�u��xLr���(L�,
�k�q�ő�	M�U����8���sM;��[��h��v38̾��=�ۜ����5����,���r���)�ˮ��άՆ7h�xIp�D�Y���=@J����i��iF+PXlr��$���{��k#��G�18�x�3Is׽�hE�P$l��;���K8.+��@oJB'u]{���re��M�K�U���31ԅNc�2��AΧ� ԋ��'A�-ô�}�)�O��7]�ao�l���7���������]���Ș�p>l� A�Z���1�dԁb�9r�5x�,��]�\$��"}�V�������99��2�Ú�}~��^��ۢ$���$+���S�,���4�/j����HqL�#a��|a<�k2w&�����5p�k�x0�M�Z��b�CO�e�MZ4��K�vjO�����>�0<�ZkG�S��Q�����UU�����.���Os _�eKްJzq|��]�x_k�,f�֐"�n��wA�S0��bOֳ�a��k]9�δ}���S�飹e7�@�֡'2��G����LMG��cNGYk���,l�(�DHZR8FL����9��	:�������P'�^ `` ´x��PG�n�\������ub	V�]��:�ĄX�&���
S����<�����%�y$ͳ�)��m6���v��۬�Xfc�wp7<�8��_!)#�d "2S}�A"�p�/�/pO2�����b,8�*���(�����VtI�|���uf�9��W)�Aq`���qu6�n�Q�%��fs�ʵ����b�h��Dz���6�}����

v2�w�T��t���0�����1��� �n�E z^&�2̍r�ft@IhVL��0_U�s�{bdhg�J]���_�\��(�¢�?5�W�O�;@1�=�N�<0�{���o8MOR4��M��{��-Y�4��qU�o��Nb�-�� :�
�vg�, ���ٝ��@+\tYZb��0� Ѩ��x�0�M$��ו�n}�����9rݹ�.�o�o^q��g*��v�PWkrS�7ğ��y2ٿ�j���Z�#�Ɓ�7���H����� �&m�nn= �*���X\ǫ�V;�g�Z��
�� ���� �E���ͱh<R0�4Ս��,������\�m��2�Ȃ�WS�x'g�⁗p��2�xMI��<Ɋ(j]xu�ws!��:��i���:�"Χ`��'R���HÃ|��i�V�-�e3�h+���Ҟ����#*���X#�CA�r��7ioW���]a:h�T̩�����s�|qk�/�t��+�d�s$�}:u����2 ����ܾ
-�t��e�`bt3�yĭ���Y�8b%_Ui�=ݢ��Zw���_o�ۢS� �x�(s0t�[}�۝�����eu1]�<�%�����D��ϻTT1�TW6�n�e���}�>����,p�ۊROKj]̥ @ @�H� ��6ym>:Px4��4����3 �VR���Zm�L�]�V��4~��!_���F�[��G��Ql��lދ�i��������h��x��ůc3�O�F���(���破�Y�$�W��Xl����5@�75��r�{��g��F��7�-���R�<m�Tekǟ��T��\0]0�V���q?Y��1��*JȖ�&Zr-�It�8[ԉ�M�3^;6ẳ=WQ�U#D��2軥���H{fd(�FAI�վ�?]���	�G��l/��j����i�6#}o ��rŏ_��S%T�Ͳ��̘�+�;�O��m����K?;8�Ew��m���%P9�9�q�3M������Ȭ���+���� �/=�m՗}'�V������o�6&� ]S3�2ep�xT��׎�iY�t��Ӯ�G� S�M�A����Hc	4Z(�=�ۿi!�#�h�TY���ע�{��,�;`����.��{VA㪡��|�7���ˋܠ����T���_��������W�7���Ὢ����Wn�B�]�o�q'A0]���!�3L��$�Q$�LǑ˗��#'i����yT���+� �%�ê��1��ww�x�������{��م�cV��-�H�x��Q[�@�R�X�v W-����^m�gv�D�fM��+�H���y��I�g���E�2�	�:.�M���������o�z��5��cq�,�����n��&�B��L�����,�ɓ��g6�������с5���^�E���� ��憻��p�=U{k���O��Q�ic����� ��8p�"!KQ�)��FS���ɘ�a�.�����\r�0�cz��b�
�R��E�ks���I�Ԅ�8��%N[$���G= ί0�	N�zA:q�0/�y�s+a�龵�6R:�ƽ�s�}�SL����]A*����E:��ԓc�h��7������ c)V*ֲ �-�����@L�F�i;�M���_��r���)>�i+���^ȫ��)�mv:�­��|������U~�?��ߢ!�F�2��e��{�G�?%�I j�ylu�P��8)�*��%)ͣ�"�x,"[E+ʷ4�[0!�"��4z�=�1�k�}ޙMA���}��=c�J'jU[v��k�DV��^QD�4�>���BFV�n����q�h�AW�V���ܷIB	��@�p�m^΃1��Қ`�����e�t�Ǌ���
A�:�΋'���g�Y#0S��,S{6�{���X�9�6"K^g;7h��5����Y�:G����������X�ׁ���e2��W��[��gx�\ڎo�~�R�3�7�d����~��e�`���ڛ��-�R��M�S\X�}'�0��o�_ӯ��A� [�ș����=G�Z�*��D��~}-y���Ə����5���ה�TXa�V��K�b,�t�Uk��&�0���"��6+c��߻a�2�)�P`�;�M1UA�}H�����͂�q�.!�	�ҷ��Ue���j]���_y�m��$��6�_�ōq���`�44N%g���Ȧ�i��d�P����Iwf7-�b��$2�R�i]����"��� ��ύLv�$��<�����L�W^���@1�i]���ẹl�K��X��,��'C~��P��rxLt�=���6��B>��\&�|eZ疉:��I#:�>1&��AR�������-UԚ��k^�K<b�l��䈢ٙ2|���4�h���IƲx6��l8�d���:r��X����(�w���/k�^���,�\�����{M/����^����;L���hA���S��FjW�NȵtP_M�_eįB�[� " ;�EE[=Бd+��a6��4h�4p��m?�!<���������mH#�V��w�uTki ��X��z* Ů,�L�1'��
�Gj�{�6o�VF�T���r�U����Kj��ٌ���%_+�6M�i��oŰ���g8�M��#���~j�;ޏ��l� u8-��m�����+s�O�2�>�nI��K'��.\{�s���I짱����tX���P���h���Ub2�v�oWh�c�@#�\Iť�z���Gm������9�ly`�ǭ!    �M#�P0�R�[�B���M�Ǧ�~o55(��&�n��ҋ|�w_�!�P�ݗ�fi!��{���A71V��ȋ�ɼ�v���tu�yyўՍ����̓r3�u�m}s͗;G���m��N�{��|~:���"��#�MX�͡�e���Z]����Ǝt�k���Xdrb������3#'�o1�a���V=��Z�0S��!�(��#�����sY+f��&DB�7��z�~@e�eƞ�bXԾ�Fw��X� H���땻������մu��뒚e�Ⱥ�Ǣ���beE;��O��]��D�:�%X��ʁ.�l�r�)n�b�[m��y�w��7��� �,���e=F�g�۹�2�z�7��qe�Do�����
����� ����ZV����=v��D`v��ǆ��1w3R�Yvv�z��34��+� 3�\��Q�,�vv�?*�uգ�Rj7^�\l�̬���k��ײZ�놿&6�'�L8�u_�63�����ߟ� jx[q�r�'���jC��fU�����+��U:�m4
B�����P] �X�t������k����BT�p�F�pk]����c9EV�:��J^
��Z���g��ߢ�\=3�}��M���*�/ȒG#}�l��yCHj宷m��$��/Φ@MO@#�@���>I��ӈC@:[
톊�����{��ʣ�*Ǎl.ve���}����QVU�s��{bZ>��+�-�����q0w�=���9��F���w����?���6�&��'���_���������\��G����S�U� MI繑���HWJ0�n+P�b����q��&(3�f�T��ћ5�G%
���M/��D���=2�u����T��D{����U�8��a��Iͫ���Y`40�⩲�0p޺ �_~�!��[w�ڿ��:������ Fr�,l��f'�w��_w���w�VJh�P�yk��t�d#���Z5���Re)w����M���m����M�������fC �"��9q����!����^�E=��o�Ħ-�EQ�q$��1����uy�ZU��u�0&V��Z�P](��'���p�R/43a$��b�!X$�ך){Lq%(.�;5Fg������h�����v�w@���_�1�ܴ���u���7���y�ܜ���>Hg�q��B�����̍�i����G?�q����h��E�}&��D��Z8M������D0\͸BY��l�C:�e3��V茝�r]������;5ˆR׀W�#Sǐc�9��yJ@bՠM�1Nb瓥}���_-��"���菎%S7��"C�{�~�I�M4|��o�_���.�����2�ss+�b���� c�
��)#+�_�T��}�a(�`i�us�ܭB}|�\��(��R�8�E�d��;�,�~H�u
�k^5��sWfi^@d)]����h�?|[6~!���%�.-�H�+ϮF�+�;�<�Yki������jt�.��m
�0�4����g^	��{�~&��	4��TKڧ�;���1��r���ݮM=cޑ&�G�+~e9/IVl+��c �B�����(s9[̪�ŇHu�V`ʂ;�}h�/�Tw��;R]�ʵc/E%s�Pdf�m�gO�x!H�~0����n^.?7�3���*㕓^��^��J�s�e�pw��T�������p��������TSn=UIs��y������0�?۪류�b\������@<)��P��]\��îj���i��;=��:4�Hte�lI>۸����CF�Q��6�խ9�_>>FGRg��4�k>ذ�3F�cX��1z��q�F!џ4��r�=W;OQW{�L-5��X~�f���O�Stլh��$�6�8���;890�$欜:i�y��^�7�t�z밥�\�;<{b����v{k�!�?��G���x�a��Y����c
���0Y����ħ	�2l���թz���xfQk��>:4�M�<��m�z]��8(��M�p��?y)��4�����ҫ�?kD�n��F��e��æɎ�4���t@1�V��1^Zq�.��.P��z�20�6�¼�
y鶶S��E��	��PEcX���Y�����ʯ����d
H�mn�:�m��C�w��O"妆�a�ت� ���{ޛ:~�{��O�LgF�tb2y]�:����;�t;��FO���;n�,�g�H��m��H��[�ē�x�&-��7pm�a�vɼy
�{�>J{ ��<�6ΠvHmJ�XV��qm���T�d�Y�B��ϊw_�r��	e۱�S{MSqb�ׇ��R+�c�1g��������8&�c�� h��>��?�T4Q����J��r���y�{���Ԋ����l��\%�A��h��c��"�[�5�_)�|��f�'O+pc�9XzUX�1�T�V��SD�����
n
�o8T J�ٶ�͕+S��>ZcR�7x��X��)�|���u��|l����4]�J@�0�����q�Y�+\����B� ذM^�FE�k�� �|E�����B-ulAe��jMj7?{?ζ��� V�S�V6�H����A<�����X��{W@��b�%� Z��)��Q;������L�a��e	̚��������f��������[|p&���溿2�a| Īa����$Fk���ni��Ě�-�3���w"�GxY�8�Q�+��"?�d�q/[W�#;U^66Içh�p4y6�g1��r[[��G���D/��kN�~ٳqN�D_ӼuA^1J�K�Mmh��nsU^��m�}��@���aH����-|�[�/��	�|��vF{\X�cD��6�}��?��{W��d����K���Z��ʙZ�Z��԰v������(8�;��X�'�%}t�)��»4���^If�E�i�~˚�,3�lq�B�z��Q�~�Kxp+}�Mj,�x~�IǁZL͵r�\?�9��G-�A��o��,�B���	�vK��kv����|����h�'.���30�K�qT]�9��[M@08ج����s���Aiע��!w��?��zS~v`+�-���%�_���H�W&+��a�w:�GErYc�õ�}��\k�sajc�4#=�ܕ�Z���mZ��zA��_�V�G*�e���V]'�Ӡ���iDC�����q�Ui<���5ɖW��2�.11h�jamVFΜ�<�'Nz�%��4I��n��������P-��2�Ȣl�3�+b8��)&�m�S?�VWY�+��u����u���g��~�&�t�
�N���j�_��c��~'\@pma�_�}�j�̧�yH9
`����
�j������;����n�p�⋯���E�[Ŧ�ئ����&����Äd�hZK�j2�3njkĤ��W��!�}ܚ��9Z��2Ő�e��'��^�_);Ǣ}��CɈba��v�:�lͫ_>�x�x��"��2�F\��w�|���k�&�N���W�:p����:Д#|Ӈ�/S'_��v]�:�޲P,�4g%~�R��������/�]�`�*E�DA� <{~���Y����dE���:�YW&w�"2KahL�qb',���tA�&+v�H���ڊ�hRB#����S[ �L��T�7��X{�~���Cc!|̞�0`_y�3R�\[���Hyw@�y[\�j����Ǭ���k1����7́�7��1�]��ӗ���{��#�u��h̜�p�L��:w� �x@}ޙMA�э��M�Q�v�,0�`�DV̯.�*�k���f�Y�o���׌��^"�";w,^1��
�����	4�W3���`����>7��Ä�������UZ�Y>wN%�TG��ꖛ�t���渲�C����+��<� L�j,N��n�$�nJE"��z���Z-�OrbO����ɇ��o�~��p�g�:���9Fcb'��Hcv�e��F��-��\���Ah��A�����+��`���~VkԀ����`�Y��Z؛v�2[�~�]�H�ʬaOl�Ӷ*��1� �	  ?3R�mJn�a�:�6���[-�kWP\g�9 /)�;�|c���>|[�BC��?`��_��w�ߡ%��,�ҹ�����������IL����dù �dӭ(³�q�O���
������]D�D��ާ��p@E6�6�u����<�K�u��;BP��h{��
�8s�#�ع����=0��K,��q+�@��|�����!F�1!�RQUc���+����%�m�Ĉ8��VM�h�2Js�\�'T�e�=,�O�������ŵ��3��s��o&�KZ��b��tu�E�^�7��5�k��8lq����	�J_�ة��������6_O%-f���+�WVwA>�쒯9|�U_���!?�-��R/M�K�J/�c�tz���孷�Kx�S�����\4�:�SN1ũ|J�A���+n��nV�`�����x֑�܈g@��b�a��΄�^���$���`�"��*��Qk���v��d��qO<j
� w��B�ʄn��@���5�"��	C�m��Q=�����޳T;@���6��88��Rgv� 3zxpV�S��x?͸%�5>�V�4�ǚ|��E�(��6LYx��a�R�ܧ�Xʿ�2s3�����k
�We�k]�%�����k�����Q���_Oᖊ��._RY�K�.�U}m2�i�#���2T�kg�
~p�v��&/��ޗ���h���6�R �"�)�'t��.��f�oM#&�A���-�Nn)��XSϙ�y��uܲ�x��%<�&rz�t�T@m�J1��qʝ���;j��T=Xăgɺ���@m���<�G��s ��5�ZS=�`�k�-P�!Zܪn�cc����̰��z0��fC��d����������_�[\(fh����:݃["�y3� "T�eMH�\�]����6Lf�à� _3૧�*��M�yU�Q��*_O�<kە� ��Wî����K���5�r2x4��q�^"�������Lݸ�m^��-n���ݰF��� �j��ek�c[v�rfWY�E��AO=H�gԡ+4� ���--��hv�qߍ[�Ã>�6�1�qx� �-P�5x���	�R���BTA��&�Y��v@-b����8g;���� ���
�.齸�����TZ����gF�h�J�4r�ԋ[>+Z�	Q�4��8���@q�yd:�������-m�������!H�N�;}��	��hIX���bf�H^/����K��z����Ld�ǁ	U���Kk;�
�,A�M�|�'�p7�\A8;��N&oǃ�����5�<�"gt8�tQ�����}�W8�8�d`6���sWs���V�����������ͳ�l]f����*fZ�C�n\a���N8�[w����w3��s�`U���ft��э6�B(V�f���u9ͬ�k��_b�g�!���s�21AD�+��a��I�F����pF�Ŷ�Ӯ�w��U�R	[�̎���_G�Z(�&��˞����_��{�¦F� G�	�\�u��a-Nx���s6��3[a�T���l*�tك0���79�C���U�ۥ���]a�:}�OB�@fuN�̾q�?�;�k��վ{*3�Le����Z�{$9��3�pʮg�͆��$_�w��A��E3��42v.�G���"�}j��X}ⱪv�����By���{*�7�L����A�Z")����Hk�b��CfI��a����Y��pU]®���:W�m>2�p��"�8��D7��T�;��<�/g��ό���曲`|��83` "^��TZ;7<
d\e੩O%]��Ai��\z]fw�|�kX8�m/��]�D�G?#7�-���Wv8��7������7nl�D����>��]m!�&�K��ơq��S�t��J����\�Q[8��m�1n�6�m��3⵲&�Zl֮��x*6(�53��4	b.V��am��T:u.yj/�O8���q�w�Rf�5���f�[��$F�9N(���� �a4�@#�4x��Y?��n�֭c��B$�5ZGԌ�����^���@%��=eܢ�m��V���`�蠇�nk�L��MϤ�Sy��*S�-d��9��� _����,f%ו���M�X����9S�&�_�%�̷u��tRX�b]�u��a'Qm�=���o.۸��X�\�������x��i~�"9HsӸ��yR\'��E��E��k+|���:�̬��\$�P�����]db~���U�~���^���^�Z֎;�{�@/�+��1��;����<��;^�e6�:����j���96�������[��}E�����{IS)���Џ�'��x)��+J_��~�of��W�~'2���G�LM���w�:(����o�bb��S��������>�      )      x������ � �      *   �  x���ˎ�0E��WY�ԃ�����u�D�_c����{��i7�Ӯ��=�啌��h�X�����nwM5�/s����idu`p��<ƪU��q�)NjU��y�=]K�t���n*�_�G���m)os�M��b�����U�RVsߪ�h����V\��8�Jm�"gK��d�m��Ӈ t�����yx� ����"^Y�eNC���b�$cYm�,$&��֩\T�2�s��ؐ.*�\z�'��X�e3���=mW�T�Y%�����gkY��V�4�L�i.��\:(�&}+�M�!��
i������!	{
$9C�������H���rH-��6��V���hQ5�c.GԔ�sR�K��sW?@�����@^�Q�9�H�� ����b��w�;�.���B=�� ew��"���}��%1���� �c�_t��m߽m�ϛ��O��      +      x������ � �      ,      x������ � �      -      x������ � �      .     x���͎�0���)��.���`��(���f�f�Y�y��x��d�R3����,���=ǋ�Jiu����!�jH�k'0����i���|��*)�8B�@�,M�SR�h-�c^�N�~�mg����&�OXb�$���Rfr�ɋ�mlk��G8���^@�Q� ����:g1(�/e  (�T^qi��T'���&�6����sc[m	}%�D[����D!2�Z.��L`�Nh�v ;å�����г?�&;���̷��]s��ZA����}y��6M|�m��ˠ�jv�q�� �,liɊN��|`�Z����{�V��p���r%#�O[H@�]&\�M���|;���Hnle�q}���e�y�Y�����i�F��TI��O��0Gb�cX��2)w�:�6���@���}
��ӱ��qtlrҮۈ�����M	��Px`V�5V������q�������"fi���̧>`��CR��mѷF&c����{���c��}:�t��/^^b�0uo!��IuQ�
�E<m�f�f.���%      /      x������ � �      0   �   x�m�1� @���h��vo{��� �@���8;�/����4+�X�7���4�#Hy��'�^h@��nŁ��B�$H>Jҙ�	�����+B��bq@�9+�Sf�4��´��aQː�`��WӖEC��
��w7��+>	      1      x������ � �      2      x������ � �      3      x������ � �      4      x������ � �      5      x������ � �      6      x������ � �      7      x������ � �      8      x������ � �      9      x������ � �      :      x��]ے�F}��
��c;�
��G�x7<�޵ý~q�7q�����jj@h$��a�x�d��"+O�D���Xs9��g Q��@��?,�wB�k�|M����U�����~{�������>=W���χ���{���$\ �iu1�)�X��Ǒn&ɋif�����OO�.U�,�x~��=w�����L��\��6�Nw�	����Տ?G~��<����udA9:����9����._(�3sw2�4��'���A=
CSO������3�3��#�J����5U�ut��)�`�T4�����ra���/�H�Lc����'����f�4����0m?�kA���^�-Q�q�N���iǁ��{�757�{�?����/�2+;>Ei�e3x.���WR���X����4�<�p�'*�3����~I�����I���;(�(����2C�}	z�Dy���qW#+G6����r:3�"[�Jb���y g
��� ��De�G��j������$��R�0�z&}>���S�P�Զ�)���P$ֽ��=�|R;�ʃ|J��>�Y]��uơ�K�4O��Q��V���ʣr��?�g�(I[���.dO�)��?�W�E��3�Q���A�{(k2�L�P�b�j�~m�e�,+�x���F�a�-�%�X�֍�u{%ૢ<�z���hf�eλ'��DZ�"p����o�w��;x��͆�M{�n|��"��+��Xo��6O=ڧ(���	Ux+�xG��g��an0�>���ú��o/{3���Z��s��D��[���4��G��p���}(�\��Ƀ�yŞ�M����<���^R5��^L�e�A��;��<\�B���9H���b}�(1C��"�M^�:���{mC�W5���{�� �{���o�ߣ�	Դ�X=Vͯ�#����ف��c�2�W����B̻�d�����#d��f1[,rYUf떙�u�u��G궳&�\/E.7x�[��`��9ծ���$���o�{����\G��f1�*�����+Go���jr?���P��&�YL�5t��֪0����/����-Z��Z��մ��a�8����&�\������?P�2ļ�"g�NVg��h%�Be�Bc`ߟ�A9���hH�n������g*@T?��E���Tg�6M�%�lY�!�mfF�~�=�T��U����X���p"��I�6 ,��b_߮�ߔ�hFG4[.Pe�쩂W=U�i X�)o����#��e'e��K�:����@���Ls�b�,�|��`�r9q��^�N<�Y�e5ULm����ɥ���V��n"pר^�
�dM��u=dj��V��L���u�pR�2$�Fr�J�18�x�1�*���1��a$E�����?z؃�vl��Gt%�sD��sz��,a�ɖS��lQG���/�ɮ���Y'�B+I���3ѕ���,i�ɩ6p1�#4�h���̌x9۷�THw.����Q���H�+�L�Ӂn�|\�4���+�̭)~ZH4�l�Z�k��b{�#Z=����m��6i <6i@x{���?��'�+K�$�����(gc���!<M��¢����>�4}��r�s��mdR�
*�5V�elRt��G�op�^n���ao6�2�Y�l[���!��H�S�O��k�"��9,6���B�
�K��ǳ�X��e�z�5.�X��bWX9 z=��M��TM�->G����'�oN�d��!�G���S�zb�^��$坒z/F�y+"�'�	�+�"~~�(��nP0q�`O(���G�`�ӧP0�x,	
&�]2=�P0��	L<�`b���	L�FDz����}�`�F�
&J0a*A��4!Uܢ�2���L�J�����jD����'r(�@��#l�H~�`(��TQ0��	L�`(�@�
&�Q0qtdP0�}L�`�TҀ^�(�@�D��(�@��ۙ�&���I��v�e���^\�b3��4x[e�yG��%zc�K\%�E���%n�Q(���)�K<G�r�o�
G�DO;�K�\�O(��|�\���E����;�\b+�2(�@��p�Q.�r�ǒK�Q��5��#YN�8��;�K�+��ZU��m�P���Mb>P,�b�G�P?��@��%P,q��X�(�@��%P,�b	K4@�X�:�6ȠX��(���ʩ���P,�b��Q,�b��3�m�3S3�%J�����ԑ {�ȥe�%��>���%���K\%�E���%n�Q(���)�K<K�r�o�G�DO;�K�\�O(��}�\���E����;�\b+�r(�@��p�Q.�r���KT��/�T����֔�G.�PBmyT�j��H]C��L�`�6�$?P0��	L��(�@�
&P0��	L�`�(���2(��
&f�r*i@/�L�`��`L�`���w��ܤ����(e�A1��4�`.<�]cI��$��=i�"i���]�"i��������H i����i���"#i�8���R�h$�4@� I$�4@���wN���	V�%��%E �*Wq����T�� [�A��f[�s�#��ܜ*�n�~��7��*KW	f� �7��`������<TE���*KXe	�,a�%���U���Xe	�,͌6VY�*KXei �Xe�۳{�*KXe	�,�1�,a��Ǫ������[\X�\_���R�
��fTe��&r(�@��#l�H~�`(��TQ0��	L�`(���Xe�Xe�\L|?�
&P0���c�Q0�7Lܤ��̤�̂	�M��5�"PE��B�EǤ��|u��[����/<+Ǆ�*m���2l�m����)ap~ɢ��$^{��9���v�U�veBy;��,��r�]�����\A�����
�HR=,-Y�Rs5�P��:@��>5UU�ͪ��Q�X�2���C�I�9յ�mS��=V� ����-��ئ���B���7�\v>��^w�d
��u��Y���u狝i勩��96��R3=�zX�=��S�����!
U��+�GitZ�ybQ�y��[9-Y��%Qhw�w6
5���m�
�:x�6qvQ�P,-(�Z�h�(��Uk�ow�������P���ݻ��]��lw@;��!WQ���ݻث��ݻXe�le�(��8�vQ���]��Be�Dz�P����v�le��F��D��+�nE.P��rdmBF��~d�UEխ��TW[��6NDw�wΐ�@���>��@���>^C����r�}���>�D��>�� .rݞ�k(r�} ���r�&O���k���XA!��j@Qi��g+:������U�X�K�b��{d!�d���%K�d)�,Œ�X�K�b�R,Y� �%K��n��,��Á
�X���_X�K�N�X��b,Y��%Kg'f-Y�ti�]E�"g9p7;"������r`� ��SF�Y�M�siƲ�ֶ-ݧ��^�̝�j�x�ج3�H���v�/��V���u��
V�E�J�6A�\{Q�{�Hw��X%y�����hXEU�56��'4�J������k��}��w�-`����~��'�zG�YV�
&��nV��ΙϬ͔��Dr{�����6��Q���o_�����s���BX�ӵ��ً� W�C)����؃��iy�l[�d�[w��b�g�Ğɷ����e���hμ��&&�K�#�)!/�R%��	�H�)�M�B.Rq���$�~��a�@q@��\���9�`���:d��#[T� ��Hm��OK�_m������d�<.	��׽�ޤ>���-�r|��eU�G�m�m r�@��eI<\v�ǐ'�O��{��{T�(\�Ze�J.��֭n�O�������[;Cj����kYYK!,%���=M���~�_n�b�ҟ7������DS�8zϽ���2�$���� ����� �U�rE,�z� �l� [�}��l��ߥ�- �V��#�t7�v3=�ߗD?��/;���
 Y�    :�^���ǿ~���������      ;      x������ � �      <   $  x���Μ*��g��W�|�@o�i�N�4(�;DAD���ts�b�f���ă	���og3���r�pZ@R�hL��'����>KAu�b�����my�[��a��[w�|�,��������e�{\�Գ�$"0:�!�����}4�R�������H�۽�*l��������U����y^P,�|3I�,��<���
�hS>0��"��k�X�J��A��xA��y�)�r29�����r0؏:(-?R�/��
h[q��4��z�<����R���uW��Ľ���7wq�歟�y{`S���T��6�N�|��Iqp��J��;,�|;���A����ۦ�d��{�8�v}r
�@�˞��"6RmS)����,`�MP�T�M~�N��d�RFlSR���#B+1`d��-.:���^7���<b�\��4G���탲Ԩ;�^@/�zlx,���M����-�J�rK@���k&ʙ��U���$����v�����K8H��h^��J_c�u��p ���Wϱ� *#����P��.�_�������d���"k��<���f��蚭g�+����
$�6p�p�v�F�M��َ"ev{�I�2@::��i�&ƿ.B6/8����d��)i��|�q����q��V̾�Dl�Y2������m��2ʹ���3轤|'�2��bb�lJt����Ϝ<�Al���:U���
h����̮��-\�Y�oz�@�<]�n�*�:[BK��n����:�p��:͹�|��e@#�|��i��Ш�_?����o^�      =   Y  x�]��j�0�s�)�eL\7�Rؖ��Pz)Ȩq�IԚ�*>}��B�-��L�B�g��(�~Ϯ���$<�c��O�j����~%�]��zP�F_:?�ZL�,����h�F�����A�<.F��"xX)�i����v��3@�n2b>$r��:�2�ʡ��n���� L��o���/�9:U�Yۮ+7����1�T��D� ��θÌ�/���LG�^\=`�5xEU���H�n�_��F8��۔��a�B'������5�?�|wP����(#';`��<��� H<�X$��qEz9���"�>h�!S�.}�(����yr'�N؝|?�v�_	N�+      >   �  x�ݜ�n������8�DI$�'Yd�Y�M�u�n%Qԥ����v<�D;�t�0�m,�SU���&����uT!�V��!I���s}�9�6M��)������	mߞ��_���8�ײA(��Q�c���9�C�T&�|�u�eڜ?;�1�#�,��D�gjҖ�O�Q�� �����97��휡?%Z��j�#$���ᥧ�U٣���O��������Ŷ#�1J8�ɿ͕�uWo��5KR�/�$�z����$8dm(s�M�*H����~�p`����V?��I��J���v�j>�eu�dt�EV�#9����Vץ�/JaN����魉��lG��)G����k�!T�HSviۨ��/h�M3�kS��9����5�܇�FR��/�齴��	%¾�����g��6j���˛
��n��N��r��!~!�o�S\�V�H�|�D} ��ږ���^8�a��`>�+�u��$�fn-��P:2�"�R¼0��:������β0'+���r��L?�Ԧ��j��������e�V��H�x;C�#Exv�e+6p5��N鴢��߂Wܔ�٢-܉~��L�&���~�Pm�W6�\��v���-\�[�r�a]+�*c1�ߵ~6��Z�3&����tm�Gb��1����z�������*�7���
'�6��g��зwew��
�a�d֔�1��b��7�Z�ΰ$M�vZ:�?�^�B:�x}K��NX��r{��"��M��Y����7�]a'�҄qn�콓㳩x������X[���$����&�~�6�aVa�J�����w��bpV�U�~uP��q�QN.��.�R�Mx����1H�}��}�n�BJl�Ma1���� ���XW"���5��h�k��<�Iɱ�s?sJ�+BҚ�T�	�=�؃?f�G�}v����V�Ѩ�d�^e&1B�%,��*MW�2�!K�|��$�V�J�A���D����m��q;�!���KP���c:�}F%7I�6�dl)���83�َ#ۙ/��M#ӯ	���/�o+8���v�*;�ɒLa$�&�]I �<�"�z��"v �¬�z�k���ԣȹV���svLif�갗=�3uu_S ��-�Y�E��g�,UXVv��*���?�w�gǚ�c����8������g��	��������r��h6n�/!��v�b��^\��N�"��}�Wcm�c��}F�g�l�J���)ˎ����&����\L����W�������	�eY��X3�Y�`�����É{? O�G<�/o �֞�k7�PK� ��F�w����/_��=wn�qv�8�5#�c^�\�߹�)f�*����m�mp�yU��Iy)cEͱ�f�Ͱ�"�m$��z��r
�BC(fԹJ���Ve�a[ձi�O/�z吽��ER^��h�@غԮ�� x�t3D��qSRs�W�i'���3��26�l@��r	50X�ؒri���\��';���#VMfȏ�R�3z�C_�u��
Pu��T��l�;���b�#M�{?=�c���JG]JW���jI�)�:�O$<L����9t����+XR��Ou������`�����U�v<>���s0�:k�ko��|m�oD=L]�P�oD]����{�Ҹ���XF�U�U	i�/[��&��G���
C��o�n\�~�K�}l,����[_��To�_gv�����s
�� bk�,">i=Ӯ9���FаA%���/��F-�j���$]'����TWcJ����<(�c�g�P�jJ=2�������~΀�����ː#��8�&'8JcE���\�HǛ���MG쮓�V!1M��t������y(�c��[�癃sCшh@�y�R��O���d�c�y�@o�]f֍��w�̅����H�._)�?��H���g8���Y��n�a;^��u+q|;�%��֨o�5�����ѻ��0���������8z������5��h9�[�?~xxx�?�v�      ?      x������ � �      @      x������ � �      A      x������ � �      B      x������ � �      C   �   x�K��H7/5Ϸ40�(5072M/�N�3/��,���I-K-�/.ILK��r���?�4�N �+dFyUf��A�	Ȍ���T���J΢C�� Ct�ɸ��m\^��Qa``Rh`ab��ST���^ƙ�W���5����=... <�D�      D   �   x����r� ��u|��T�w�Fo�Q���L�������tG�(��g4����i������q^ U%Q/����"��D50�:W�i�5�.o��$��:/J�5FS��#b�ut��i�`�$nǶ��f��:	�ˠ/R�f���>�)��k�\4��I@�Y�D��ʑ �$Y�9X���޷N �AT��Q���r���7�5����߄N�[�G�|`�����(� ���>      E   N  x�͗�n�0���S�	F�l��b63i��0wl0.O?�$�T�P���HH���8�%ȓ��SN0�}Lɮ⮤\��w�F���<z{�B�3u(OS��L=�D�fxvE�5C`��h�a�Yf� �A�F�n����+x�쵪�n���K���b�D�zT�Rw�ďJ�`;F�#kC���S
����KA�Ҭ�9��cv4�[ODU�݋���E�����]�A�(<a����cIu�YG �F�qGQ@n�X�6U�/�7�@��d�������T�۹�Pz:̍u3�p|���J�R�*��_��C���y�[��׀����'�kt]x2[���
�h�I��4�}���Z�2�����|�M�/E���>Ò3,�%X���kWd�36�a�3�}K�/�k�?���\-�ҵM%-�T�f\����wSg�_��WRl5[q �5bjޑ4�p@�y+֗9 ���N������\�� DfDR��~zu4,�̊u zs]>8���)��G+��s#NQ��]$����Z�����8��1s��{��ǽ��}�J���p���T�BO 6FtĨUa�+��X@~���l��x%P      F      x������ � �      G      x������ � �      H   )  x����n� ���)��e���mY��&F(T�B��h�~`�5�i���@��s�k�Yx]@A���bOhbk�j[����NҎFk�'o��6AG����D%����]�KX;���D��c� ��!�v�*��)��=�<>��a�&�� zEY���/�ܤ��	f �
XΤ=R[�21�����`,¿��G�ok�\�_�tp�ѭ�&��?�f�?"z{2�p�_;@]$t�Ǭ}��>m|�	m�7�[+rkE��jc�=zBﺏ�w�Dy`8N�D2N�tۭ�4��e��      I   b  x�Ŗˎ�0���)�Չc�3�nډ�E7#Eƀ��Đpy�:��5�DEB`0|��D�I�
V��g�Ծ+}���ᦫ�9����I���ޮߖ�閖@d�Oy��£��tt��i�RI�T���$��l�3�j�s��@�]���Afd]�C����S
Ц�_�9y
ޢm~�#?��AG�Y�Btls�x�k��������倖�B���ɋ�-�已�ݐM�Om�\��,O;����y�v��C�9�ćt\}<K�G�x�չ8�L�d�s�=��h7 ��Q��]�|a�;�N�"�bG;r�]�v��'Ώ��v�[~�&�N�ع��{�]�v�RQ�S�ֶc�Of~�n�1g���7��L��Iǉ3ࡾ:{�v璠�<�NU��qm�����y69__�/�������Fh8���z=���f@,�y�@��>���x�����C���{ޅ �d�Iߛ�������%���|�)�	M�`G�������:�����[�ng�<J�Хk��:.,_{uE�����΀��9��k?r�1CnO,�ҩ7�;N�/-��F�?ts�͵H�QO�%�o��/�����.N      J   &  x�ݔ�n�0���Sp�cT^��;dM4�H-������;Q"�!)�FP����M�ի2��8IT�v���Ԓ�kߌ򊮓4V���ߡ?��ſ���?"ATtuU�mZJ�� 3��K̢��O��<M�hTSdK�ǈ<��W��![d��]�bp, =.��u�V��|wM�S�??�����w������;��J���'q3��9�TK%62�{VQ�c�����	��:{zIVlA��'Ӝ�t��U���� � <��K۰+ʍ����K�c���X�	�R�`g�A��baٰO��r�us�*�,�b�v3����z&6�f��Dw����
�,1R�AJ���o�7��=�PbHJ���k�v;e�T�Q<U���eMG�,ҡ�6W�:�61z���T�
R�J�2#���/����?c�Ⱦv���~��7�V����ْ��'̂�-i^T`� *0e��]�T��
�֕"�{��������O����V�0_U�2��{��e!��<��"��x�a����<?\.��9��L      K   �  x�ݚ�n�6������BI<g�$c`�`h�������S,c'�12��v�[��X��b�i]��N^NX�Х�kW�F���q?�\������?n���/OO���6�=I��QEqhd�Z+�	����%%o�pa.�E���4K%�z�y?n����� �I��~��L1���Z�g���!7?+;�O�$F1l� l�܅��o�~��U�#�n�L�3�C)$���=~C��ǿ�3
����J�YL�Чl[Ez�Qd�"قn��&�=�A5���^C]R#fR��M�۟��K)�e>ޖ�g�>�~
�h�A����]�<� f��Μ�4�nO���ѹi���� r�h�5o暤��!SD���U�3��"�D ;ȡ-'�[�2:`�F�>�����Cwc�- �F,��&6��_z nF��6��ͻ����9��$���㒍t����8 �k��"�*߯24y�b��E%Uu����_U�o�ʞS��ډ"r�����k�b��0����אx���I[:�6`�o_D�E�m^:������>��1d� J��-�]!O�輈̱cĩ���\e�xj�2��܅̡�2�]���C�Yp���%;�i�%`}�J��Z8��|��ZFL����n8�<��X��%�pRyn_��ϐ��GP�"�����ﰇ����l��_���#����o�M���kgO��C���(�K�0�[5�&�	�
�7�+��$̅�f?���}9�8�i�Ѯ?��"z�Ed㾌���s�7�|nR�N�m�������܎�,��(j��ҵ?̀#�[��xp|��k�{��q�h�h�,+m8�������}�;��sxv�p��i!����0�� ��N]-.?̜!��1�&�w:�K��y/��lnm��o)�US�!�q�ŷ�i.�����>H����$�H�Ďt?\u&��,
OY�1����a�|iz9���� ��j�N[i͉�|���q�o�
Ֆ�����mV�A=�ݬ���;�]�v�����F1*�m���!o��	��!'���Ԓ`3l!�vLt1
6{��~�5T(��p���c�Y��߈(�<I�-�>�Y��P_��$Mp�I�,�`J_���jn��_9/� �s�E�g[1���-1�S����T[��^7q��V�'�����ٚQ�x3����츋O�Xd�߭A?Nx��2@G/tӼPJ��'�r�x��\�	N��&���p<�к���dw�:������l���j�+����V��U�1�C(uax��<\i#n��!W%t�"�_~r?C�}@Ɛ�ȸ�����)r���m�^tai����B��P*��F�Ŋ`;��}W�8&N�����j����>�]ƣ�
P{+i#MH&H�G=Y����'���cj��������ȍ��[>�j��G����V}�F��?p�0��B�q�CW~�T� �oY���)@��a��j�� �0��(���!+�xm�ɚ������������]��      L      x������ � �      M      x������ � �      N      x������ � �      O      x������ � �      P      x������ � �      Q      x������ � �      R      x������ � �      S      x������ � �      T      x������ � �      U      x������ � �      V      x������ � �      W      x������ � �      X      x������ � �      Y      x������ � �      Z      x������ � �      [   �	  x��[ێ�8}�|E^�1A�I�q�����һ��ݬ�ŒlK��!�ܺ�%YJ;�	t�H�<<E��T��[ߡh�ˁa��n%��!�V��~�����%������ϟ"�-z��헧�?���z ��KV�=YvhE9��><b�h��<J��޹f�`IA��9�k;��1�L9>�qzhy�����Q$�����B*к����%����:4n"7���zxh�Qdy�[ɇ�*�O0fⷪ����?/Z>��I�l�y�$Y�[��� 6|�<|`��q0�O�i���Q�Ʊ�$�c��w3'����Y?
�~�7���wT����S�l��8��w�w����H�8�X���3��<�}���G,I�.?�[�}ʭ�r��<IU��n}3ў +2����W���H�Suɬ2��o��+����Hn0��.fe�� JT:��A�du�E=9Z����X�i��0)i�I�C}6��dS��mj/l�5}3��}/6�B�� ��O�� �Re6ަ>j��lQWJ�ՠP=�N�*2G�e¢v$مA��lQL��
QQ��~��'�R�[�i.�����y�m��X��]�*���=ci������x�w��b�wג�IxM�k.���	O}N���g{߳��L�Bi�F� IR��T%
�������z��~��0�q/۵���]F���`��0��<l�Y�9�ViÁ8:����#��4�M_���e]�ַ�����*
Wdl����8���?*wM�a|CN�6��˖g�ff�"��ث�>��\%�5u��;{ʵtJ���I=AV�If�_#����Ġ#T�\3H>	�txn(~��5����¼|��d"A��ގ��T�gn��ǒ��A��]X�-3�w�$��$�ܗWY��Xɻ�9:�����f�.i�r�����m��mS���82��L�\�"��r*�����������8�]��4�\y�&� ƪ��+��P���z[�.��+���������80�j-���4�ȟ�����?�h�+���y���X��tc�
E_yW�=p(d�g	�j�(�s��z�l������ߖ�
�*�{lD:�Y�+CN�������sT��&�G.�����/@J\�Q0c��ϲ����?���i���CIE��ZR1��������w_�R@#lPd:H'��)7����O	p`��?��7�����CM�[���w��������["��c�ƚ:�4�[��w8�&
�w��¢���l@�VKv��;�NÙiU�����&u���2�B�1X�bu�x��l�z��(���g��[�B����GF��^��,���l�%y��ޯ�\��}�v��LV���dA��fi�UJ:9�R!BnX�W�9�}ɜ���8@��Ј���}13�|�oP��n��B6�I�_��z�Nt]����/��k�ī��d8+�s-��@�����@�G�_�ݚ���}�ǖ�m���#y�e�
�E��*��[g���*^�"��������{N���/�I�C�7s�2�� `��qߤ��'���Mo<��o:E�!��jPT�8��P�'��'������	�2bs�:{@��,D^�e���-�
m�s����� ���`Tk�/2/�Zލ�����ᝍOߎ����� �T��D��	�2���NtS]BpTR$������^�Bx:<y���y��wy�Z����hQ	�����sR�z
��M��6���{�����~oa��xB���*��Vt�[빯 �X��!��t�q�j�c�n����K$��X��)�`u�����s�U$I�*]�]����OG��Q��=�jߡ;Nl){�8�m�h��?N<�&���(�2�D�|�F$b�x�Rd��7��F����Q^������1p@���]�k��B%0-Pd���5)��!��S�%G'���?��H�s�u�0���a�C[��8֑�i�!��d�ͥQ�Ho� Y��~�Ĥ;�5�kA�Mb�V���9׽������heʄ��n�hZeM3t2��uQ�&�	b	6�`khK�ד��"�� &t�ʏ�_�����L`�j�Z��K%a����nw$ v1���z"Pi�>���~�#�F�ڛ�}��������\0,;��$��]������ȫ�C����=8��r�V���v�@I�ن��T+�}9#"�l�M�%�oۦ�{�W��5'�rp�c�唗����Q>%�J����e�d��qR������w�^�쿐{Mx�i�́��FD�}e�*T��XS�=y��$��v��w4�sՕ�V�<N���^��"ϵr�_��4�Mk�X/ v	��f4J��c�H�t/�>�!�@T��
�ְ�1��7������P��Ѣ]�d'-�Mh�;�m�xc��0��3�=Fb�@�19W͋s�.�-'t&�3\��p7����ʔ7qL"��Rf�^c��&�8�cTw��)%�� '1$;Ν�U�?߿y��/�hb�      \      x������ � �      ]      x������ � �      ^   1  x���Kn� �}�� �"�DTu)��`�q�9}���.��T)��3>Q�N���e���[=�KpT�E���T�T��a�Y�&���~���Oǀ��(���܀�_��Ǻ���@sZZYCɋGK
�L���y�Ϟ��-&r\I�6�} ��^���j"���`� �� �<�:J�o1���-����A�;�x a= G��rc��i˕(���N��rݮ�_�^�1��ǭ��� ��<�����,�һ�H"92ߦ�4ҢOff����y|��!9�2��:�}�_�O�      _      x������ � �      `     x����n�0��'O�'X9i�eW�V+��V��J��� ې��_���?$���3�w����C��`�c�N'���Ӈ`F@�R	�/pRr�P��������M���b@�ə	�ۊm�=��ǧh��/�#%i��L�F�1���6}`�ɫJ� Su�
��Uv�������B�hc+�nr���nb�"[��uݥ�F\>��'���x��=�lF#V.��9��@�yNx��z������xFj��H��M��蝖�Lz����;K^/��X�����C��Ľ�y��,\׻��b� �U�˦`�G������A.��*,�B��P�JBΕ�[���{)q��3���ׂ"�1|q�xNL�|��\�F`e�U�<�� ��y���_����b�k�ϸ<�H���N�M���;6	W�[��y 3�!�\�����.����g�*��9���M���"�Ӹ2�Q���u�d�����E7�E���D��6nn���fs�Òi\+�"23Tj32}�-�ˏ�d��\�s      a   N  x��Y���6=w}E��)J�t�,�u�%�@�����'@�>�j�L�>�k[�Uz|���=5���~kg��~���_^�����K�����?'Id��!�����۩�K��?��=��?_>=�������??����z�?��c6���gy�����?������҈ ���g��g}}9��������=�|}~�<��f���L׷G omo��B�	|�lՁp_II̱��C�ȩ�lEL�ܽ×+�P'4Q��'A�!�"j6DA;DX���c�P��s��>��"���'��Q��,�I��)�$��d��s�	D���qV&Y�3�K猁s:��XF�"�JM�g(����!B��X����c�/��%f����c�@�X�$ns������{���\�A�B��f��i�"�yi�M�rC�)��%�Qgxv�c���%��1l8�M "���j�9D�3�w�!��^�c<�j2��S���C�@�U"4�dMm�A�SD*T����0A��T�yX
O ��,<���~�8��]k�#�!���IfXJ59M �rMҤ>"�w��S��� ��#���k
r�D�N���a�ǽ�M\�T5	Ԅ6�l�Z$6��GT��hR��l��+_cS���!�D�h��ьC�Q|����Uc-�A;,9�<Ly����N{�����N:��T0�T�ʡ��Ê�eƱ��E�7�Q��!w�4�AP�]A�N�I�cՠ�Z�YXj�����ЩuUp�T��bD��rhdk�C@܋���\|Ʊ�ɨp{�:E6��6�V�$ÔP�'�tbɮղ�N�Uu	#,w��QV�N{�9���DrЇ��5BF{:�~ی�A~�/2/1�z�6�o�����U�;a��_e%��ay���7����SXG����z��J��a������;r}�A+�-�8<K�o���F\�o�E�cLiYFZ�o�������^�o���e��Y�oᵏ��ٗ��+�-�톱H]�QV�[xm�$�Ju� ���/A�-_ǧ�|�\©mH��|)�*X_֌�A~�/lz�d������Y �es�l�������-1�7��d���b��a�a��&%vl�*B� ����۠+��WuM7�vL��aв�z�R/�����{�L����s�9�e�}QǢ!����ݑlX�C�.�tϏ�������Ύ%J-G\��	4�<"kِ�&@�����&���p�U
;&�kI�W��3Ω&�r�ku؈�5hwL &�.���8y��r�k�:V��d�L@�7���	e��ǵM@�F����|(:*�t>���}]ȇ��Y�tX�ؤQ���K�XN��B��2,E�kȧ؀ ��`?�Q���O
��}Iƌ���)zPڈ�#���x��z"�d�O�Xn�y�����=F��|,���
��2 �j~���
���[�Di���>S4B���H~��o�TdM�TԒl�n�\���b���޳�DFU��ܪ��:���,OU�Vu͹w�eyj%�Oiݹ{&�<�Jk�Z��g5�
9�5��5�&��*��i}3�g;�S�3���gyJ��P�Y��ԧ�N� ����      b     x���=o� �g�+�:V����mǫt�m�"�	]�@���$�Z��M`�������7��!��y���KPvD��5�ԫ��H�g�)wy���to�	'2Ġ��[%��y[潬���޸���g�	>�ӵ�ZL4ƪ)@O�6-�c��huՈ�<�Q�5��`�+�V����m�?���`m���� ����>�:i���F�_��~�ӿ
�O��f�@�1����*,�,�4��>:��z��K�)�&X^�78�=�fY�&���      c   W   x�u�K
�  еs�?9v�6�H*	D�����_(��\O��5����{�A�s&%���[H���7�F[�[�jGr�,m��	�	 \� S      d   �  x��UMo�0=�_�S�`���D�Z�Q"%�U���8Aa��i�����n֛�zhO��ޛ��qU��)'�-tz��a����ɰ�r�P�z^kIJ�UP	��*/ѐ����?;
���}n�v�Zh�yD�����<�r���?d�>U��,a�j`B�Ϧݪj����,���LiY����E �dr��#�4�"g� ��pl��~��@5m��nC%��Q\!83����:�ڛ8�U����z��!XVܐ���:z����,9lV�E�E��4����|��h_�l�i�im�?�QJ[q^(k�5��#����Λ�!�eXN����yb3�֩I}���a��}���{��i�2� #W�Bo|�/� -�͔m0�)� ��Bd���=���F�\TY�A�܎��i���V�pCN�(
����rv���E�::D��T�뀝W����J�B0[j]��8���������]�;�Pr������W��:+5@���ą���E����(�l�Р;������#zC�t���Fq!/���؏.l�Ko\��}]Q�[�������T�sruؙ�I�;�����D�KW�Ҫ�DF�.�q[�{kY�(��t��2�,c&*��[w����vN�	P��N�������V����T+mun�tO�S�6���|܌�Y�u�*��d��p�8�{�4�ý���P��u�3�ɷ�I��|K��      e   �   x���K� ��,���a/M��VmDW_�Ё���|5ִNWS�_�7�;�����T6��B`���r��j���%��� ΃b*z;丱,(��p�w`���`�A���rę6
���	��[0��������p����qz��\�=(#N�P������@� ʏ��      f   �   x���K�0D��a������*Q�nO[��P`��ȣ7O�H,�y-r"E�J��Ƕ8oG���'4��0]���S�Tg�$)@��K��j���:U�M����4)Y �PO.'���J{N$�i'̯S�)�TJj��k}��:��%C'TO`U��F��>��Uâ��2�c��r�h;��Z�6���i�/!z�      g      x������ � �      h      x������ � �      i      x������ � �      j      x������ � �      k      x������ � �      l      x������ � �      m      x������ � �      n      x������ � �      o      x������ � �      p   ~   x�K��0H73��70,�40�4O�)I,�O1�t�?�4NN##]C#]C3+ B34��q%#�0 �aiTddTY�����a� ٰ�*�a�y�fŦ��N@�i��,������ ��4P      q   *  x����n�0�מ���u*0�eҋ��"Uw�*c�Ճ��1<}m7��J��63�o�3mJX�^ b���\���E*NR��Ͷ�~F��.'�'�5�$5ׯ �#|r �=�=���h�B���O!�|�L!SAu.AD���:5~��L��#���3����b?�KsPQ�^W��0k3���ϟon!|91\�*�\.RG��.�*��9�#W�Wi�D����6��맔#��2~��cx�V�a�,
i���]n���cJ��*�g��������ΰ{�EǮi�ü�ab��5D8�X�ԶU[���o�|�t���9e��I�6�ְ%V)%'��ds�ς4�/`3ٗ�V��Y�iJ�
h��˰�%�wU��xFq��I�Ƀ���k��7{�U�������+�y�v+!�f��JW����l{�m7����Z���5rz@TM'��"�k�����pEV������Q�L���S��oK*��ϻ�+c��7�5s3B}!Ȉ�d$[���|�v�b�'���ιl,`_�\U���j^:hA�y�����e��z�,v�&�%��	vtT�b����U��na�v}�>�D�2�nT��p1���#��AQ�̶U�d�;-�zU���̮\u�@{�檫��'$(Q�*��ֹ���-�?��:A���]����U7*�-U�0HM�5�0��v[9��6ᘦ���X�\�2�^��3gFa��E�׼Qˆ�I�X,�HtZ1�hɲ��މ����ד!;���l�YJ}�W���S��6��% *������t�	��P      r     x��VK��0\?&� �DN�� ������͋��aףR^xCK���Q˙��2��H�{1�;��'���Ϗ����>� 3v�g/���!�G��"k9�=��C@�E�t2=o������EBߓ���t� 'xh[�����@'�hv�cH�@�5 /s1��*� #��)�St���<�`S:�^�ܡ��"4m�~Y�;@VlYRK=o�S]ac�u~q]�I�k�N]	t�f��ֆ�eug�u������ ��_�R؊�.�Xú�ܡ;h@��戎(�w$:Qa�H_�U͎���"e�seN�i�a�*_�a�<���P�[媗~}44n�Yʍ���-\,�L�r����.�����
��53�B�ER_5��N]��gs���N�m��<�ⷨ� Iq���߻��L0@�$�Vf���ޝz��k�
ͬ���5M�;�iKD�~`����с��(y?p3��t'�^�y�!�F�M��k^ �i�}��Ǫ�t��&�V�^��S;�=�d��H�"s��@]���%L�Ƽ#U@>K�}߽E�=Dq�a�/{	�'8#��g�{�PP7"bh6������;e���Wtu�U�ѯ�;9���
��4��f�&�f�Ϩh@p ��R���1�x�N�Ȯj����b�ǴM��,��Ձ�k)�?{��|�<�ȃ�%� ���"1���E�?F5�).��s��:�I[�w�;��f�Ù��R��0\�;ix]���c�A�*U����`�8f�t(�q�����~���n��$�      s   N  x�uѻn�0���H̩N�Fh�:1PuC��1&�νO�8咪eq�c�ӯ�4; ��K�e��̏�`I:��~)���9��pI�f��(XA
8�$��"e�Ue�1R!I,�nӀ��t����l(w��iI삩������-A�r�r�G�������ob�eovEU�L%,��f�Z#�A<��tyƔ���KV���oӈ�?*+�\W����*u��c4����|y�\_A�i$���w�Y�Aܿa��F��6��}�RIN�Z��-�!�{����3��d!�=P��,�%��3lu9}��~��ynC��z�O����d�~k�1      t   �   x�U��r� ��u�aR���.� "Q��Dq�~df�_��H��T��0}cb���!���k�>��n��U�oK[q^b����Ft%��txB���8�o�TR�]�O �������d�:i���n����U���%Q]���#���J�5c��ؙx��oR�4^d�d�?C����O xc�O       u   D  x���An�0E��)|��
��jZԨ�H��MlH��/$%��(���K��Ϙ���o�P7si�
��u��j�IS(�\�*���BI4��7ȁ;��˒��fi@WM�͂��NB%��*�M���J����<`��.�F�=]��z�1kż��l�Y�{"�ӥ�E\;�D����z��R1�(7�Ms�0���ևU�db�֊�1���;��a͛?��y:ha�6��_T��A]$"���t!��כ�`�?϶�z?�t|��y���[-|V���,Q�u�"�Pn*��(�"YJ^6���ɝ��8ߏg��      v     x��Yɒ�6=��B�*+��N�u�1��B$��;	�� U]�=n������/���/����.<kA��0�u^���4 Y�C<��+�Ԅ.�d�����l�;3e��~J;c�t�����_0`���'L>"t#�����2_��_��q����d�5#��h�j�zĈ��ͼ!�8�z�����*I)�fO���Ʀ�ޝ �@c�G�z������ϥs�u?�G�]?��T�F�D<�`P&=��u\��"�C�T{����?�TB�/�-HT����CxD�E�����?gcލml�o�"o��B��	�ֶ�G�O���>V�U�gOr�P��8[�cm�'�R=, ��_!Fa-)�3t�25��Gj>������R�������t��_��?�Ejq�F�X0�.��A��uFkb�m@�@P��2��Z�0 *�H�B�[�_~�4��GI�E��'@���q��FɕD(�_a�n�^ݷdc�I��\#����z����FC_ j�xD`!)i�/r�KZdji^H4�
Ɵ���ȴ�gz�#[���剸+��L���퉌	~41;X�?����iB��y�kM�~������f��e|��	����	r��J���ݏ{��:�!+�t��Ixr�[Ok&b�KV=�4��-l�I�HM�C�)ѕ{����R�M!�ˤ���`�厔i�`̓��}�~wQ���E'��jm�P*%k�����$\;GL������	;�~9�/��P)K<&�L�W3C��!�h���'��FťG���D�$��ZT��4֙.mT����ߥ�'xv"�C��2[	��.��W5�~C���[���VU����>."���:ԩN�������?,���v�n࿻��{_�KR�Ņ��dIpSEcO$q��H�K=�.{�0�"���%ӱ�Ҩz�D�ZB{�pi�M�~����5���C�7>�Wx�$�$N��űU�v��� 8'd�Q4]�H�k�&���Y������U|q��F�p�������i �ڳ�����/$� ��Qhqӿ̓�0�Fp��zG-n�j������`��a��l

�c��V�3z�m�ԏ�O�6�x�ʇQS5��P��L�1�4�_f:� �d�q��,�R_����#�����~9#���=/#�W�=d�(��:���4vTa�G&ܣ'e�����p+T��a��	p�x$���2L�2*�D��X%�|�=��-p�TQLS���� Y6�mD���. 	�� H����Zn��2�n�����ʀ�
�0&�ȜVO��~���B���(�rtJF8�G�C6�	�3;�p�xdߴӳ0IS�mh�����G>8�>��]etZlX��5,�S\�}��{lDQ��u�v *�r>�Z�n�8}YT���y="wP�$T+^�Lt�w�8��o�З�A����@�P�X��U����$�ʹ��{ ��x0��<�dHt�֥����B~�I�?���/��A�0^`�x�buϡԕn��������Y���-Hr8���w�1$�1���Z�(?�('ր�BM�z>J�4�������&�*�#:�hb�5hV�$���F�dqSd�=B���lg��b��P&�R�=�.��@Ó���izR_�Zή�C���,���@�Hêm��+5~����B��K�9��b>��-D9���wm��~M�������t�vS]� sx�6#�9�~M�*��C��UHl˽�y��Kz��NՈ���*n$�>"|���HT��:(u���tY��d����y�����<j܊_�ʓ0#Iz����npN"Ϧ!1&�~��D �!�ݮqQ��5���r�n{<�g��ʉ�bB<#VVa{$�������|�'u$�y|E�������;23�Zgw��.� ��=/��F��.$���Y<�>�$��l`UfLXx鑬��tC4�,�^��n�C�U�⩓��̿�H�Sg��M� ��soM�r�r��o�Ϳ�%>�N��RvV���Q�:��🛣��ECXm��m���@������W�r��Q�����)���Ç��V#y      w   �  x���ۊ�0E�3_�h9�-K~�@�P(4�����ݱ����l��uf�~�%�ut��G^g�9�)1�GG�u�]R֭8zn͏M�v����U}�~G�p;/�!����CdO[hxzޡ@?�F1o3��v"��j��T�)K=�As�<�c[*p�~�J�<�%�ub�u:������O�?����u�.���z\�E.��.^5�a9�ic�*��a�*d,
3
�E���� ��U�d��Ђ�M�Эz/j�kU�4Aך��+��)>.L@֨kJ��/-#�v�q��M<���&�ČZ�g��U���|��Ǵ��|�E1�V��'�g���o�u�w�q�3%�8Lt5�ez2�w��>�̕u�����L$	��x�
�We%�2��v|Ăzq��E]UI<�+p]��L*D��ę�zq ���}�����o�}�INw�4�V�N��wӿ2�D��%�M�e�l���x�k���t�w#&��4���\��
�=L�h�$�e����X̸�>�35�,QKA�]n�L�Kn�:�]v����=��P��]�Fa��z����XE�L��&M�Z�KG���S�czl��y
���2뇡��C���@4#��;ϝ������K>�HL�P�jN��G�rI�gw+��H+���~�k{�ػWk5�r������aWbw�p�];h+R�I()m��|Ϟm0��6�T����Le7�\{�3�Q�����;�����h131�8y������_��!�      x   �	  x��ZɎ�<W�틑�(Q:�������Ծ�_�$_WO��q7F�
(�c=)ʌ�L2S��E �-NÐSm�#|����N�z��ܯ��}��K�?���o��_��S���LUdQl����9
T����_�Ou�?�t��3�C>-���ǲ"��a)�~�ʩu+PF�. �uWR2XTD�[�u��HTB��<�������|0��N��j?F��q���Z�e�H�����h�Wt�l�U_�-�	@N�b��	���䀧����8�9ٻ�0�E$:,)b9�ֵ�fB⷇;��x�����a#`�;~\r��B,��2��؅=^�����X\�->H�'�XJ�!А8�I��)��D�% ʬ�RK%;F�r.)�bq��u�n��0A�vX�X�%��&] ��7&��:|Y����qXvj8��*A��@��%�m˒����\e@o��ȧ�[R}U�"��pOb8�^��$fA�;P������4� ��hr�)�lb������X~�gW�o��/��㏒g����-n�vgK��X��])A߲w��"0_�5.k��Zn����z���vԤ^�G�5@�W$�I�U�{�$����,%6j�y�Eoۏ���zU#�����UIӤ�H��rD`���!�j�41�����:,*fT
���׆�PWV.,Ϩ��*3_�� H2yQ��Xb�"�66E#��$Fi%��Z�#cR^a��v�� PYں9W�^X�ߋ��m�W7__�rm�]d����7L�Zڠ,�&�a]���+ٖS���_��3�s<R���bo�lr͖��~��Ͽ-}7��m����;n��Kjo?���׿��v��gM�#LE� �F�cG��avF�F��-�8��|O�@�"�N�����.��Xo�1�7$8��ͧ�vאddo�	H5�jhU�NNY'*�CQ)|_�NG��U+��_�N�����Xb�����vfѴ�_��w7KI�:�i?�*tp�b:�h8�A��Dߒ2����9�����
P�c�O�AmqzS1��y���n�����iŽ���a!hV��Ka5Î�l��x{��4�򸽸_@(�	24�}��u���
H��z��$���P@:��d�?��W
���1�a���J�;�T
F!s�$�&��R�P�^���	N��[9�'O�l��*W!��&c���f_7����(fkt������i!���M�W���\~�͒q����<$>���\���ɓm`:r�����xg�A��j�vu���ҳ���皒I�@G?��H�*.�Mnt�{�UM�g�boN¢ɀ�>,�A[��?�;&3�w|��L�xѸ�cA�4o~�Sn6��2_t�Eշ@����)s�艀T�־A[�lZt�|�EŸ��ŋ����A8d����O� 5�oa�m��F�4�qW�@�-a�ȋ����j/�@�a�x��n"m�$<�1{��&{��ҭne�i ��^`�H�)�C�P;N���>==� m�E)��ϔuR�sQ��*�FގL�K�	<9!� �L����ͭX;(K�zz�u$ ���X���T]�K�X��fm����Z��[�ȟU�`b��Ԯ�Z5��a�X�dY��}O|߃�t+�d�VJL�q�DϿu�o���]�1�O&�E�=о�w	�=���ՙʶ���V��O�b�E.���߀��]���OHu�(��L�����+�ĽA&��X��E����yD[�3)۹h+3��4V���R�"68����}LN'�����$��q���(;����8�!@ĽMY�9���8��� ��Bi�?�7]ȓ��T�0M�H����N>��bp�`�,?��λ���@��΍6[�{�0!�q�'���_wÂmp�%�r�[�>��ow��S���:���;�[�����El9,	b�-����i�*Z�qE�RWZ��Þ�Nbȷh�;����s' 7-bXV-����E5�U���8�h��d|{�N�<y:O(M�����"�u�bF�,�y��syC��2��T]!v�|��?��w�sU+6�ؖ�}>>Q��v���zG��q\lz�U�F틕~4�k�]�}�#0n���s����Ovc��eG�6���]�}�"�l�᠕�H�V_��P������+��v�v�LOn+n�[%�{��!5���-}G��{>&� ������oy���}+EߤW������
е@�tӷ�Ӹ�����E`���w6�W\s��U$~������!�y�^���{��b���P[�C����>���M��U�g�.+�O߃r;�Z�{b��X�Tɯ��r>8�;	�c-ڋ���>�[��4�}�a���^a�$�,퀯���g�����'����@0�<�혒��r�c���;M��}qY�>mv璘f���Б�*�s�)�[�P�}����fCG/.�����Y����?�'L�A.�?}���󩾏)�}s�1�\Ν'���O�>�Ό?u      y      x������ � �      z      x������ � �      {      x��[˲�6�]�_����,��[Ҳ]��=׮p{ܛ���'��"��o�?��O�/�D�P�&�B"�s�H �$��H%�ڤ�$��z��ъ�K�d4M�;ͽHyc��?�˿�����:ś��Uկ��64��վYz�PS�CH2D�.U�G��N8�D�g�<G	��U~dN�J�􀓳�k�y�`��SfA��SΗ�Sf�7�,XO|q�:�m��v��_.��� �%>oo�ʷ���D���@�	@빥ï�B)�.��ˠ~o��}�+k8A�iiX�S7�-+IcIà�@�(�ڍ�$H�&`F�WIF�8���#��)��H�������#����(�#�j	|�[֓�]���������;�ݾ�w�c=�;CQ�JB�Bp���ڲzc�I�}AT5�YO��j�g~�J�I"��tJۄ�9Kl�	��wN"�O��zJC��s���y)�wS<�I�)3?��G��mm9���@`m��Z�E{��Q���{�8�N��hig��H��^��Û�|��^X���w����D�M;o�s}�+�q������IAj'k�I�-w��ȹ�S��a=e_�Z��,��i�9N��i@�G5��т�pw���%rn���XOjq�^�kF;���{:�=��zB���,���{o�\���������{�K�Z�`����o��Ⱥ,-�SX[;���'Y�2��y$�c�����Nn>����|l�*J�Ño[��aM�rS�SU���д+������,n H��~Tn�`����f��`�&f���/�ٹ(nM[�D�mԙ��w9m�U���}Z�O�}�@��>��k [L+Z7^����"oދ���5o�OOExr�,{���is&�#��rsڶQ�����$��ʾ�:+������v�.n�1�^sK�X�(?�mW�3� �� �7�x�����<���E�����l�v�x/~���c�*���)��͊����'�z�&�i���Y���~ ��T��49Ƣ"�G�:���zwܦH7e�<	��X������j@�PG�(�H��*�L�3�ӑ����s	n(��y4e�*ש�G�ީ<��$�`�d֒EbvCz�|~
DMf�26�d!XZve��m��! ���W8^�%I`B=F��4*��Z�se&FX!B��1dn�J���Jp�"X~N������%v�����h.� NU	���Ve{X|���
�C[It�=+Ts�/vW�Ǳʂ����8Zk37^��A��U��o���põB�v aC&C�`5���3/Qڢ������ׯ���%��ΰI�W0:^]�N�9)�~�����J,��]�=�'Ô��o���:�R�L%��'rK]��|�Y�>s��n�l �7��ј�*?�V���ԗ����S���,(_0),�dFL֠#������.W)T�N&�^cK�n�)Q൫ÿp׫ꒂe��'}�Z��\K�H?$��i�G�s� �e�����_��@
j�c[��6úX9A�,�{%@Ŋ����d�sL��@��0�������'�1�݋���s�1�8;O�҉�6�\_�Ȓɑܠ'r�4-j!L;Q�Q@[���r��Zxl\f�����:l�."�ɳ8�x)Qj'Oh(�-��z�BE���>��Pe����]ab�^ ��א��#\��kM9eJ�=�����ܽ�UJ�:�4����Q¢����aQ{03��4oe����6u�8.���O��E�Α���M��/3A��r�Ӹ� ��Ha�h�D5&KuM�������;h>֧��
�)#�A6ȹ��6�a��y�ķδ��G�sw�(p@ɕ��a�R�3�ۉ���|ĸ����:c��J{NJ����:�6N�G�K0z@+�)F�ǩ�E(�tf`�҇�۹P������g�s�z�n�2Cҭ fi0�g=��j|B�|��;��8�V����Յ��w��cf�Ō[���R��,Aٚ��dO�_>&�ȥ=@��i�#j��|KK���53q�[I� �)�7�o�u1�#�Ӎ�w&��r�LX��mX���/������b!ju�E�H'�m�����biz��T���li��O���Uđ��X��jG�T	�����P�G>p`�Zk�е	8W�,�w��w OS�u$�i�m���H�#���r�ʮ/J�f]H��ܗ݅$�!��.&P�E^^֑�۷{2n9ql�����@�S�c��9'Ct�g��'��1ʹ$>Ū�!)�޼��}��eV�X��7f�+-�V��,�A�X����wf?T7�����2���A�F��-��W�gE���A�oL�u��1��_�s8Q�E�(���w��j/-Z&�+�Ĺ�H�!�P��Y���-z�SS��	6�ϰ9؀=��^�ܹ|h������D:�`�#��:�~hģ��aZN��2X��CM�����CKM�ȧ�,��
�Z�)&%����O�H6�$}_��*�on��<z���YA)����GhETEv<��&������y��k�L�cs�2�h�Gtx����Ī����J�����F���b��y[��\ƶ���R���F���b5�S��ZvV? 2��*F���:5�S5�Zi��p�����t��\�h�q�!��˨١x��8]�f�7�lUk��GQ�{�;��%�G���7�\=B-�.�?���eN�LYw?6�p�/��G(/cܾ��I�l���g}O�c{�mH�����5Zrμ�j{�iސ�Y�M:K�X�[��;�9�>��n�|���ds4���VL���Lx0A��2��t��P�q�C��ŭ���x01>��o��y��:�j�/���Dq2 �?�_멼 �"'�fp����J�U����˫���r����B���/�L��s��(+,;H9��ɠB�̪513B�V鋴m�?�sA�cb�Ţ�2�Դ��ڀ�\K�9�����f�`�80�A�Ԝ��i�М�>Rǋ��p����Wy�]�1��)F�)&��8�{�n/��s�%!6��w����O�ν�f�h\�q���U�RA�Y���5O������'��x�������8>y2����OQj���:��C�ww|Ϝ�Q�nM'w<�����_��}�Z2
</6;����y�;�ݰ��x�˂�s��s�%�`"��ʛ����)܈�ݍ7@E��X��N��
H1�ܒkh��4b�Zu_/�X��yc��Ÿ�e�ż��7�����s����.T*)n�SP��ڿz�_�z��Qfb�~2�m�os}��{u�U�o�t�Q�b��Z�E5*m�+��Q�}�4ŝZD��X��������cʹ��lǕ�.p���*����8Y��,�Z�j
i���u[�%����J1�z>Q�ۥV�~��h����0(��&��[�o0��2\�&�/F�%��r����mP�PT��NiP�6(��۠���jP�K�F����@�E��@�7�h��A�,��]�cia]��q���F��^���I% a 2�(�
ˉ�9]-b��Ld̄T������n@i+��S'W~��,h�0p�4 ��,0�BuK��T�R������P2<C��Fs��W��B��L���꘵ ��4��h���l��Q�9�k?�<\&�^^pu@�6�����(�UZ�i}6
X�������;��H�e'aw�Y&`���A��E�����w �;���w���j9�y��d��t�FE4FF�U�"��}=�?��O�qЊ�)&!�ZW�_��ʙ��I���R��a{�
=i�]���Y����Ej�拟6鲻�|Jx7��	0f�s��񶮴3`�z+?H"R�*�� �A#m��B���h�c���:����釽��)3�;K.F\Z�1&Gzf�Z��`5�+��ן�#���1�U�e�R��G�ኚ�`���rԌ�^Y��_�Y�W&��@��s�8.����(��I���ԗI@�CV[�;-��)$�6Pq:�V�J]f�o喿��k�g9���d�4��JQ��u�_�l� i   {���L�A,���r�@����V�؅h���יY��-Mj��x�A��bǰ�m�#|d����4\�1۬cG�u��Y7�6��a=������}��7��x5H      |   �  x�u��r�0����	:����L���N&Ms�#I����w%;��ҋv���EZ�~C����	�}�I^l6Ŵ�Gx:�??�C��gy�Cy��5�+)z麜�z���q<�4xu��!n>n�jJ�
�zd^��"�X�^ɡ��1��z����YA�hKMO]�X�+�1��M���d�h���Ußr�����Ƀ�CB�)��i{d�fE>;�VdV�V�P��b�Hz������wӥ:�T��n"z�ô��� �a�B$J%i�S��%�/��
���}8s��]~?��c_N)�)�Lw����b A`� Z&}��f����ָƗ�&,H���s/��&O�\b]$N ��w�Bz@��ISS�A���]�&�|�m�NCk�Pʔ�W���d�s�ԕ�<V1����&*�֖�%�2x�F�ׯ�"�d{��=�b��6({�㊘81�c!"��̈�fE~��/�8J��B1���B\���S�$:��z]0�����Wo*�:V&�.�x��'ں�9W`,��V1���9��� ;Z��{�z+wP�7mY�W��n��"Ƿ�J���Ȉ��� ��_�e������2��ƃ�1�Ȥ8Zx���J����ݶl�X���&�mn'�N���>�E
�0|w4����- �P�{�O*u�#�G�����m����4�      }      x������ � �      ~      x������ � �            x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     