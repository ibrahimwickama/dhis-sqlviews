-- download datavalues for ouToRemove
copy(select * from datavalue where sourceid=(select organisationunitid from organisationunit where uid='ouUidToRemove')) to '/tmp/batch.csv' with csv header;

-- then csv file add query for updating migrating to new ouToRemain
="update datavalue set sourceid=(select organisationunitid from organisationunit where uid='ouUidToRemain') where periodid="&B2&" and sourceid="&C2&";"

-- run the queries above and wait for it to finish
-- After that run this queries to migrate tracker envent data to ouToRemain
update datavalueaudit set organisationunitid=(select organisationunitid from organisationunit where uid='ouUidToRemain') where organisationunitid=(select organisationunitid from organisationunit where uid='ouUidToRemove');
update trackedentityinstance set organisationunitid=(select organisationunitid from organisationunit where uid='ouUidToRemain') where organisationunitid=(select organisationunitid from organisationunit where uid='ouUidToRemove');
update programinstance set organisationunitid=(select organisationunitid from organisationunit where uid='ouUidToRemain') where organisationunitid=(select organisationunitid from organisationunit where uid='ouUidToRemove');
update programstageinstance set organisationunitid=(select organisationunitid from organisationunit where uid='ouUidToRemain') where organisationunitid=(select organisationunitid from organisationunit where uid='ouUidToRemove');
update trackedentityprogramowner set organisationunitid=(select organisationunitid from organisationunit where uid='ouUidToRemain') where organisationunitid=(select organisationunitid from organisationunit where uid='ouUidToRemove');
delete from datavalue where sourceid=(select organisationunitid from organisationunit where uid='ouUidToRemove');

-- then finally delete the ouToRemove
delete from organisationunit where uid in('ouUidToRemove');


-- Procedure function to migrate datavalues 
CREATE OR REPLACE FUNCTION transferOUdatavalues(ouUidToRemove BIGINT,ouUidToRemain BIGINT) RETURNS void AS $$
DECLARE
    dv   record;
BEGIN
    -- Get all datsets
    FOR dv IN SELECT * FROM datavalue WHERE sourceid=ouUidToRemove
    LOOP
        -- Now delete this orgunits with current data from analytics completeness table
        IF ((SELECT count(*) FROM datavalue WHERE sourceid=ouUidToRemain AND periodid=dv.periodid AND dataelementid=dv.dataelementid AND categoryoptioncomboid=dv.categoryoptioncomboid AND attributeoptioncomboid=dv.attributeoptioncomboid) >= 1)
        THEN
            EXECUTE 'UPDATE datavalue SET sourceid='|| ouUidToRemain ||' WHERE periodid=' || dv.periodid ||' AND sourceid=' || dv.sourceid ||' AND dataelementid='|| dv.dataelementid ||' AND categoryoptioncomboid='|| dv.categoryoptioncomboid ||' AND attributeoptioncomboid='|| dv.attributeoptioncomboid ||' AND NOT EXISTS(SELECT 1 FROM datavalue WHERE sourceid='|| ouUidToRemain ||' AND periodid='|| dv.periodid ||' AND dataelementid='|| dv.dataelementid ||' AND categoryoptioncomboid='|| dv.categoryoptioncomboid ||' AND attributeoptioncomboid='|| dv.attributeoptioncomboid ||');';
		    raise notice 'Updated a row';
        ELSE 
            raise notice 'Record with same value found, IGNORED';
        END IF;
    END LOOP;

END
$$
LANGUAGE plpgsql;


-- Procedure function to transfer tracker/event data
CREATE OR REPLACE FUNCTION transferOUtrackerdata(ouUidToRemove BIGINT,ouUidToRemain BIGINT) RETURNS void AS $$
DECLARE
    -- dv   record;
BEGIN
    -- Update and delete orgunit info
    EXECUTE 'UPDATE datavalueaudit SET organisationunitid='|| ouUidToRemain ||' WHERE organisationunitid='|| ouUidToRemove ||';';
    EXECUTE 'UPDATE trackedentityinstance SET organisationunitid='|| ouUidToRemain ||' WHERE organisationunitid='|| ouUidToRemove ||';';
    EXECUTE 'UPDATE programinstance SET organisationunitid='|| ouUidToRemain ||' WHERE organisationunitid='|| ouUidToRemove ||';';
    EXECUTE 'UPDATE programstageinstance SET organisationunitid='|| ouUidToRemain ||' WHERE organisationunitid='|| ouUidToRemove ||';';
    EXECUTE 'UPDATE trackedentityprogramowner SET organisationunitid='|| ouUidToRemain ||' WHERE organisationunitid='|| ouUidToRemove ||';';
    EXECUTE 'DELETE from datavalue WHERE sourceid='|| ouUidToRemove ||';';
    EXECUTE 'DELETE from datavalueaudit WHERE organisationunitid='|| ouUidToRemove ||';';
    EXECUTE 'DELETE from completedatasetregistration WHERE sourceid='|| ouUidToRemove ||';';
    EXECUTE 'DELETE from datasetsource WHERE sourceid='|| ouUidToRemove ||';';
    EXECUTE 'DELETE from orgunitgroupmembers WHERE organisationunitid='|| ouUidToRemove ||';';
    EXECUTE 'DELETE from program_organisationunits WHERE organisationunitid='|| ouUidToRemove ||';';
    EXECUTE 'DELETE from organisationunit WHERE organisationunitid='|| ouUidToRemove ||';';

END
$$
LANGUAGE plpgsql;



-- now how to use the functions 
select transferOUdatavalues(4469116,5905852);
select transferOUtrackerdata(4469116,5905852);






