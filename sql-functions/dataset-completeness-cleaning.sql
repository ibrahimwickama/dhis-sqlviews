
CREATE OR REPLACE FUNCTION cleanDatasetCompleteness2022() RETURNS void AS $$
DECLARE
    -- rec   record;
BEGIN
    -- Get all datsets
    FOR dr IN SELECT datasetid,uid FROM dataset
    LOOP
        -- Get un assigned orgunits from dataset 
        FOR our IN SELECT organisationunitid,uid
            FROM organisationunit 
            WHERE organisationunitid NOT IN(SELECT sourceid FROM datasetsource WHERE datasetid=dr.datasetid)
        LOOP
            -- Now delete this orgunits with current data from analytics completeness table 
            EXECUTE 'DELETE FROM analytics_completeness_2022 WHERE dx='|| dr.uid ||' AND uidlevel4='|| our.uid ||'';
            RETURN NEXT our;
        END LOOP;
        RETURN NEXT dr; -- return current row of SELECT
    END LOOP;

END
$$
LANGUAGE plpgsql;
