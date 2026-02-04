DROP TABLE trackedentityaudit;
ALTER TABLE organisationunit DROP CONSTRAINT IF EXISTS fk_organisationunit_fileresourceid;

-- Add this 2 columns with will be deleted later
ALTER TABLE datastatistics 
ADD COLUMN IF NOT EXISTS reporttableviews DOUBLE PRECISION DEFAULT 0,
ADD COLUMN IF NOT EXISTS reporttables DOUBLE PRECISION DEFAULT 0,
ADD COLUMN IF NOT EXISTS charts DOUBLE PRECISION DEFAULT 0,
ADD COLUMN IF NOT EXISTS chartviews DOUBLE PRECISION DEFAULT 0;
ALTER TABLE configuration DROP CONSTRAINT IF EXISTS fk_configuration_facilityorgunitgroupset;
ALTER TABLE configuration DROP CONSTRAINT IF EXISTS fk_configuration_facilityorgunitlevel;

-- By pass flyway check for duplicates on users table that does not exist 
CREATE TABLE IF NOT EXISTS users ( userid BIGINT PRIMARY KEY, username VARCHAR(255) NOT NULL);
ALTER TABLE users ADD COLUMN IF NOT EXISTS password VARCHAR(255), 
ADD COLUMN IF NOT EXISTS secret VARCHAR(255),
ADD COLUMN IF NOT EXISTS twofa BOOLEAN DEFAULT FALSE,
ADD COLUMN IF NOT EXISTS externalauth BOOLEAN DEFAULT FALSE,
ADD COLUMN IF NOT EXISTS openid VARCHAR(255),
ADD COLUMN IF NOT EXISTS ldapid VARCHAR(255),
ADD COLUMN IF NOT EXISTS passwordlastupdated TIMESTAMP,
ADD COLUMN IF NOT EXISTS lastlogin TIMESTAMP,
ADD COLUMN IF NOT EXISTS restoretoken VARCHAR(255),
ADD COLUMN IF NOT EXISTS restoreexpiry TIMESTAMP,
ADD COLUMN IF NOT EXISTS selfregistered BOOLEAN DEFAULT FALSE,
ADD COLUMN IF NOT EXISTS invitation BOOLEAN DEFAULT FALSE,
ADD COLUMN IF NOT EXISTS disabled BOOLEAN DEFAULT FALSE,
ADD COLUMN IF NOT EXISTS uuid TYPE UUID USING uuid::UUID,
ADD COLUMN IF NOT EXISTS idtoken TEXT,
ADD COLUMN IF NOT EXISTS accountexpiry TIMESTAMP;
ALTER TABLE potentialduplicate ADD COLUMN IF NOT EXISTS lastupdatedby BIGINT;
ALTER TABLE dataapproval DROP CONSTRAINT IF EXISTS fk_dataapproval_lastupdateby;

DROP INDEX IF EXISTS in_relationship_key;
DROP INDEX IF EXISTS in_relationship_inverted_key;
DROP INDEX IF EXISTS in_relationship_from_key;
DROP INDEX IF EXISTS in_relationship_to_key;
ALTER TABLE interpretation DROP CONSTRAINT IF EXISTS fk_interpretation_evisualizationid;
ALTER TABLE dashboarditem DROP CONSTRAINT IF EXISTS fk_dashboarditem_evisualizationid;


-- this is tricky, not recommended but for MVC was only 1 data 
DELETE FROM eventvisualization_attributedimensions WHERE eventvisualizationid IN (SELECT eventreportid FROM eventreport);
DELETE FROM eventvisualization_categorydimensions WHERE eventvisualizationid IN (SELECT eventreportid FROM eventreport);
DELETE FROM eventvisualization_categoryoptiongroupsetdimensions WHERE eventvisualizationid IN (SELECT eventreportid FROM eventreport);
DELETE FROM eventvisualization_columns WHERE eventvisualizationid IN (SELECT eventreportid FROM eventreport);
DELETE FROM eventvisualization_dataelementdimensions WHERE eventvisualizationid IN (SELECT eventreportid FROM eventreport);
DELETE FROM eventvisualization_filters WHERE eventvisualizationid IN (SELECT eventreportid FROM eventreport);
DELETE FROM eventvisualization_itemorgunitgroups WHERE eventvisualizationid IN (SELECT eventreportid FROM eventreport);
DELETE FROM eventvisualization_organisationunits WHERE eventvisualizationid IN (SELECT eventreportid FROM eventreport);
DELETE FROM eventvisualization_orgunitgroupsetdimensions WHERE eventvisualizationid IN (SELECT eventreportid FROM eventreport);
DELETE FROM eventvisualization_orgunitlevels WHERE eventvisualizationid IN (SELECT eventreportid FROM eventreport);
DELETE FROM eventvisualization_periods WHERE eventvisualizationid IN (SELECT eventreportid FROM eventreport);
DELETE FROM eventvisualization_rows WHERE eventvisualizationid IN (SELECT eventreportid FROM eventreport);
DELETE FROM eventvisualization WHERE eventvisualizationid IN (SELECT eventreportid FROM eventreport);
DELETE FROM eventreport_columns;
DELETE FROM eventreport_organisationunits;
DELETE FROM eventreport_periods;
DELETE FROM eventreport;

ALTER TABLE userinfo DROP CONSTRAINT IF EXISTS uk_userinfo_username;

-- tricky by pass, drop them first and re-create them later
ALTER TABLE potentialduplicate DROP CONSTRAINT potentialduplicate_lastupdatedby_user;
ALTER TABLE userinfo DROP CONSTRAINT uk_userinfo_username;

-- Then later re-create them by this 
ALTER TABLE potentialduplicate ADD CONSTRAINT potentialduplicate_lastupdatedby_user FOREIGN KEY (lastupdatedby) REFERENCES userinfo(userinfoid);
-- ALTER TABLE userinfo ADD CONSTRAINT uk_userinfo_username UNIQUE (username);

DROP INDEX IF EXISTS in_userinfo_username;
DROP INDEX IF EXISTS in_userinfo_ldapid;
DROP INDEX IF EXISTS in_userinfo_uuid;


ALTER TABLE trackedentityinstancefilter 
ADD COLUMN IF NOT EXISTS enrollmentstatus VARCHAR(50),
ADD COLUMN IF NOT EXISTS followup BOOLEAN,
ADD COLUMN IF NOT EXISTS enrollmentcreatedperiod JSONB;

ALTER TABLE datadimensionitem DROP COLUMN IF EXISTS expressiondimensionitemid;

ALTER TABLE eventhook DROP CONSTRAINT IF EXISTS fk_eventhook_userid_userinfoid;
ALTER TABLE eventhook DROP CONSTRAINT IF EXISTS fk_eventhook_lastupdateby_userinfoid;

-- Create the missing program_attribute_group table
CREATE TABLE program_attribute_group (
    programtrackedentityattributegroupid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    lastupdatedby integer,
    name character varying(230) NOT NULL,
    shortname character varying(255),
    description text,
    uniqunessype bytea NOT NULL
);

DROP INDEX IF EXISTS "create index in_userinfo_openid";
