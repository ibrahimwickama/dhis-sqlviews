delete from flyway_schema_history;
ALTER TABLE programinstance ADD COLUMN longitude DOUBLE PRECISION, ADD COLUMN latitude DOUBLE PRECISION;
ALTER TABLE programstage ADD COLUMN validcompleteonly BOOLEAN;
ALTER TABLE jobconfiguration ADD COLUMN jobparameters bytea;
ALTER TABLE programnotificationtemplate ADD COLUMN programnotificationtemplateid bigint;
ALTER TABLE programnotificationtemplate_deliverychannel ADD COLUMN programnotificationtemplateid bigint;
ALTER TABLE programruleaction ADD COLUMN programnotificationtemplateid bigint;
CREATE TABLE useraccess (useraccessid bigint PRIMARY KEY NOT NULL,access VARCHAR ( 255 ),userid bigint);
CREATE TABLE usergroupaccess (usergroupaccessid bigint PRIMARY KEY NOT NULL,access VARCHAR ( 255 ),usergroupid bigint);
ALTER TABLE keyjsonvalue ADD COLUMN value TEXT;
ALTER TABLE userkeyjsonvalue ADD COLUMN value TEXT;
CREATE TABLE public.colorset ( colorsetid bigint NOT NULL, uid character varying(11) COLLATE pg_catalog."default", code character varying(50) COLLATE pg_catalog."default", created timestamp without time zone, lastupdated timestamp without time zone, name character varying(230) COLLATE pg_catalog."default" NOT NULL, lastupdatedby bigint, translations jsonb, CONSTRAINT colorset_pkey PRIMARY KEY (colorsetid), CONSTRAINT uk_fwso2d10icu8j6720w82tywmq UNIQUE (code) , CONSTRAINT uk_ofc2a89rccimogdp9ownwcuy1 UNIQUE (name) , CONSTRAINT uk_oj2bhkjfgcl9rcwlf579dl1d6 UNIQUE (uid) , CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo (userinfoid) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION ) WITH ( OIDS = FALSE ) TABLESPACE pg_default;
CREATE TABLE public.color ( colorid bigint NOT NULL, uid character varying(11) COLLATE pg_catalog."default", code character varying(50) COLLATE pg_catalog."default", created timestamp without time zone, lastupdated timestamp without time zone, name character varying(230) COLLATE pg_catalog."default" NOT NULL, color character varying(255) COLLATE pg_catalog."default", lastupdatedby bigint, translations jsonb, CONSTRAINT color_pkey PRIMARY KEY (colorid), CONSTRAINT uk_cbnc5ktj6whhh690w32k8cyh8 UNIQUE (code) , CONSTRAINT uk_rrv70c7ej18sptdwj7h6ac5rv UNIQUE (uid) , CONSTRAINT fk_lastupdateby_userid FOREIGN KEY (lastupdatedby) REFERENCES public.userinfo (userinfoid) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION ) WITH ( OIDS = FALSE ) TABLESPACE pg_default;

ALTER TABLE keyjsonvalueuseraccesses ALTER COLUMN useraccessid TYPE bigint;
ALTER TABLE userroledataset ALTER COLUMN userroleid TYPE bigint;
CREATE TABLE maptranslations (objecttranslationid bigint PRIMARY KEY NOT NULL,mapid bigint);
CREATE TABLE predictorgrouptranslations (objecttranslationid bigint PRIMARY KEY NOT NULL,predictorgroupid bigint);
CREATE TABLE dataelementcategoryoptionusergroupaccesses (dataelementcategoryoptionusergroupaccessesid bigint PRIMARY KEY NOT NULL,categoryoptionid bigint, usergroupaccessid bigint);
CREATE TABLE programstageusergroupaccesses (programstageusergroupaccessesid bigint PRIMARY KEY NOT NULL,programid bigint, usergroupaccessid bigint);

ALTER TABLE visualization DROP COLUMN fontstyle;
ALTER TABLE users DROP COLUMN idtoken;
ALTER TABLE programnotificationinstance DROP COLUMN programnotificationtemplatesnapshot;

DROP INDEX in_programtempowner_validtill;

CREATE TABLE public.attributetranslations (
    attributeid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.attributetranslations OWNER TO dhismain;

--
-- TOC entry 274 (class 1259 OID 22570)
-- Name: categorycombotranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.categorycombotranslations (
    categorycomboid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.categorycombotranslations OWNER TO dhismain;

--
-- TOC entry 283 (class 1259 OID 22600)
-- Name: categoryoptioncombotranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.categoryoptioncombotranslations (
    categoryoptioncomboid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.categoryoptioncombotranslations OWNER TO dhismain;

--
-- TOC entry 292 (class 1259 OID 22633)
-- Name: categoryoptiongroupsettranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.categoryoptiongroupsettranslations (
    categoryoptiongroupsetid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.categoryoptiongroupsettranslations OWNER TO dhismain;

--
-- TOC entry 295 (class 1259 OID 22642)
-- Name: categoryoptiongrouptranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.categoryoptiongrouptranslations (
    categoryoptiongroupid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.categoryoptiongrouptranslations OWNER TO dhismain;

--
-- TOC entry 298 (class 1259 OID 22651)
-- Name: categoryoptiontranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.categoryoptiontranslations (
    categoryoptionid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.categoryoptiontranslations OWNER TO dhismain;

--
-- TOC entry 310 (class 1259 OID 22690)
-- Name: charttranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.charttranslations (
    chartid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.charttranslations OWNER TO dhismain;

--
-- TOC entry 316 (class 1259 OID 22708)
-- Name: colorsettranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.colorsettranslations (
    colorsetid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.colorsettranslations OWNER TO dhismain;

--
-- TOC entry 317 (class 1259 OID 22711)
-- Name: colortranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.colortranslations (
    colorid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.colortranslations OWNER TO dhismain;

--
-- TOC entry 323 (class 1259 OID 22732)
-- Name: constanttranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.constanttranslations (
    colorid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.constanttranslations OWNER TO dhismain;

--
-- TOC entry 332 (class 1259 OID 22765)
-- Name: dashboarditemtranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dashboarditemtranslations (
    dashboarditemid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.dashboarditemtranslations OWNER TO dhismain;

--
-- TOC entry 333 (class 1259 OID 22768)
-- Name: dashboardtranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dashboardtranslations (
    dashboardid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.dashboardtranslations OWNER TO dhismain;

--
-- TOC entry 339 (class 1259 OID 22786)
-- Name: dataapprovalleveltranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataapprovalleveltranslations (
    dataapprovallevelid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.dataapprovalleveltranslations OWNER TO dhismain;

--
-- TOC entry 344 (class 1259 OID 22801)
-- Name: dataapprovalworkflowtranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataapprovalworkflowtranslations (
    workflowid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.dataapprovalworkflowtranslations OWNER TO dhismain;

--
-- TOC entry 356 (class 1259 OID 22846)
-- Name: dataelementcategorytranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataelementcategorytranslations (
    categoryid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.dataelementcategorytranslations OWNER TO dhismain;

--
-- TOC entry 367 (class 1259 OID 22882)
-- Name: dataelementgroupsettranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataelementgroupsettranslations (
    dataelementgroupsetid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.dataelementgroupsettranslations OWNER TO dhismain;

--
-- TOC entry 370 (class 1259 OID 22891)
-- Name: dataelementgrouptranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataelementgrouptranslations (
    dataelementgroupid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.dataelementgrouptranslations OWNER TO dhismain;

--
-- TOC entry 375 (class 1259 OID 22906)
-- Name: dataelementtranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataelementtranslations (
    dataelementid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.dataelementtranslations OWNER TO dhismain;

--
-- TOC entry 379 (class 1259 OID 22921)
-- Name: dataentryformtranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.dataentryformtranslations (
    dataentryformid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.dataentryformtranslations OWNER TO dhismain;

--
-- TOC entry 390 (class 1259 OID 22960)
-- Name: datasetsectiontranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.datasetsectiontranslations (
    sectionid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.datasetsectiontranslations OWNER TO dhismain;

--
-- TOC entry 392 (class 1259 OID 22966)
-- Name: datasettranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.datasettranslations (
    datasetid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.datasettranslations OWNER TO dhismain;

--
-- TOC entry 402 (class 1259 OID 23011)
-- Name: documenttranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.documenttranslations (
    documentid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.documenttranslations OWNER TO dhismain;

--
-- TOC entry 419 (class 1259 OID 23065)
-- Name: eventcharttranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.eventcharttranslations (
    eventchartid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.eventcharttranslations OWNER TO dhismain;

--
-- TOC entry 436 (class 1259 OID 23119)
-- Name: eventreporttranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.eventreporttranslations (
    eventreportid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.eventreporttranslations OWNER TO dhismain;

--
-- TOC entry 456 (class 1259 OID 23199)
-- Name: indicatorgroupsettranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.indicatorgroupsettranslations (
    indicatorgroupsetid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.indicatorgroupsettranslations OWNER TO dhismain;

--
-- TOC entry 459 (class 1259 OID 23208)
-- Name: indicatorgrouptranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.indicatorgrouptranslations (
    indicatorgroupid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.indicatorgrouptranslations OWNER TO dhismain;

--
-- TOC entry 463 (class 1259 OID 23220)
-- Name: indicatortranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.indicatortranslations (
    indicatorid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.indicatortranslations OWNER TO dhismain;

--
-- TOC entry 465 (class 1259 OID 23226)
-- Name: indicatortypetranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.indicatortypetranslations (
    indicatortypeid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.indicatortypetranslations OWNER TO dhismain;

--
-- TOC entry 483 (class 1259 OID 23301)
-- Name: maplegendsettranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.maplegendsettranslations (
    maplegendsetid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.maplegendsettranslations OWNER TO dhismain;

--
-- TOC entry 484 (class 1259 OID 23304)
-- Name: maplegendtranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.maplegendtranslations (
    maplegendid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.maplegendtranslations OWNER TO dhismain;

--
-- TOC entry 497 (class 1259 OID 23346)
-- Name: mapviewtranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.mapviewtranslations (
    mapviewid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.mapviewtranslations OWNER TO dhismain;

--
-- TOC entry 518 (class 1259 OID 23436)
-- Name: optiongroupsettranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.optiongroupsettranslations (
    optiongroupsetid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.optiongroupsettranslations OWNER TO dhismain;

--
-- TOC entry 521 (class 1259 OID 23445)
-- Name: optiongrouptranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.optiongrouptranslations (
    optiongroupid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.optiongrouptranslations OWNER TO dhismain;

--
-- TOC entry 526 (class 1259 OID 23460)
-- Name: optionsettranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.optionsettranslations (
    optionsetid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.optionsettranslations OWNER TO dhismain;

--
-- TOC entry 530 (class 1259 OID 23475)
-- Name: optionvaluetranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.optionvaluetranslations (
    optionvalueid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.optionvaluetranslations OWNER TO dhismain;

--
-- TOC entry 533 (class 1259 OID 23487)
-- Name: organisationunittranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.organisationunittranslations (
    organisationunitid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.organisationunittranslations OWNER TO dhismain;

--
-- TOC entry 542 (class 1259 OID 23520)
-- Name: orgunitgroupsettranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.orgunitgroupsettranslations (
    orgunitgroupsetid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.orgunitgroupsettranslations OWNER TO dhismain;

--
-- TOC entry 545 (class 1259 OID 23529)
-- Name: orgunitgrouptranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.orgunitgrouptranslations (
    orgunitgroupid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.orgunitgrouptranslations OWNER TO dhismain;

--
-- TOC entry 549 (class 1259 OID 23541)
-- Name: orgunitleveltranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.orgunitleveltranslations (
    orgunitlevelid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.orgunitleveltranslations OWNER TO dhismain;

--
-- TOC entry 571 (class 1259 OID 23637)
-- Name: programindicatorgrouptranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programindicatorgrouptranslations (
    programindicatorgroupid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.programindicatorgrouptranslations OWNER TO dhismain;

--
-- TOC entry 575 (class 1259 OID 23649)
-- Name: programindicatortranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programindicatortranslations (
    programindicatorid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.programindicatortranslations OWNER TO dhismain;

--
-- TOC entry 585 (class 1259 OID 23691)
-- Name: programmessagetranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programmessagetranslations (
    id bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.programmessagetranslations OWNER TO dhismain;

--
-- TOC entry 590 (class 1259 OID 23715)
-- Name: programruletranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programruletranslations (
    programruleid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.programruletranslations OWNER TO dhismain;

--
-- TOC entry 594 (class 1259 OID 23733)
-- Name: programsectiontranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programsectiontranslations (
    programsectionid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.programsectiontranslations OWNER TO dhismain;

--
-- TOC entry 604 (class 1259 OID 23775)
-- Name: programstagesectiontranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programstagesectiontranslations (
    programstagesectionid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.programstagesectiontranslations OWNER TO dhismain;

--
-- TOC entry 605 (class 1259 OID 23778)
-- Name: programstagetranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programstagetranslations (
    programstageid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.programstagetranslations OWNER TO dhismain;

--
-- TOC entry 609 (class 1259 OID 23790)
-- Name: programtrackedentityattributegrouptranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programtrackedentityattributegrouptranslations (
    programtrackedentityattributegroupid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.programtrackedentityattributegrouptranslations OWNER TO dhismain;

--
-- TOC entry 610 (class 1259 OID 23793)
-- Name: programtranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.programtranslations (
    programid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.programtranslations OWNER TO dhismain;

--
-- TOC entry 617 (class 1259 OID 23823)
-- Name: relationshiptypetranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.relationshiptypetranslations (
    relationshiptypeid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.relationshiptypetranslations OWNER TO dhismain;

--
-- TOC entry 633 (class 1259 OID 23877)
-- Name: reporttabletranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.reporttabletranslations (
    reporttableid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.reporttabletranslations OWNER TO dhismain;

--
-- TOC entry 636 (class 1259 OID 23886)
-- Name: reporttranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.reporttranslations (
    reportid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.reporttranslations OWNER TO dhismain;

--
-- TOC entry 661 (class 1259 OID 23994)
-- Name: trackedentityattributetranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.trackedentityattributetranslations (
    trackedentityattributeid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.trackedentityattributetranslations OWNER TO dhismain;

--
-- TOC entry 673 (class 1259 OID 24057)
-- Name: trackedentitytranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.trackedentitytranslations (
    trackedentitytypeid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.trackedentitytranslations OWNER TO dhismain;

--
-- TOC entry 688 (class 1259 OID 24105)
-- Name: usergrouptranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.usergrouptranslations (
    usergroupid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.usergrouptranslations OWNER TO dhismain;

--
-- TOC entry 698 (class 1259 OID 24144)
-- Name: userroletranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.userroletranslations (
    userroleid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);


ALTER TABLE public.userroletranslations OWNER TO dhismain;

--
-- TOC entry 707 (class 1259 OID 24180)
-- Name: validationcriteriatranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE public.validationcriteriatranslations (
    validationcriteriaid bigint NOT NULL,
    objecttranslationid bigint NOT NULL
);
ALTER TABLE public.validationcriteriatranslations OWNER TO dhismain;
CREATE TABLE public.validationrulegrouptranslations (validationrulegroupid bigint NOT NULL, objecttranslationid bigint NOT NULL);
ALTER TABLE public.validationrulegrouptranslations OWNER TO dhismain;
CREATE TABLE public.validationruletranslations (validationruleid bigint NOT NULL, objecttranslationid bigint NOT NULL);
