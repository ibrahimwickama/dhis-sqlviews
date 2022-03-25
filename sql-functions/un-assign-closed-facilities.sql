
CREATE OR REPLACE FUNCTION unassignclosedfacilities() RETURNS void AS $$
DECLARE
    rec record;
BEGIN
    -- Get all datsets
    FOR rec IN SELECT organisationunitid,uid FROM organisationunit WHERE hierarchylevel = 4 and closeddate is not null
    LOOP
        DELETE from datasetsource where sourceid=rec.organisationunitid;
        RETURN NEXT rec; -- return current row of SELECT
    END LOOP;
END
$$
LANGUAGE plpgsql;