CREATE OR REPLACE FUNCTION assigndatasettoorgunit(datasetuid VARCHAR(70),facilityuid VARCHAR(70)) RETURNS void AS $$
DECLARE
    recdx record;
    recou record;
BEGIN
    FOR recdx IN SELECT datasetid FROM dataset WHERE uid=datasetuid
    LOOP
        FOR recou IN SELECT organisationunitid,name from organisationunit where uid=facilityuid
        LOOP
            INSERT INTO datasetsource VALUES(recdx.datasetid,recou.organisationunitid);
            RAISE NOTICE 'Assigned dataset to OU %', recou.name;
        END LOOP;
    END LOOP;

END
$$
LANGUAGE plpgsql;

select assigndatasettoorgunit('nqKkegk1y8U','rlq235aD72v');
="select assigndatasettoorgunit('"&C2&"','"&B2&"');"