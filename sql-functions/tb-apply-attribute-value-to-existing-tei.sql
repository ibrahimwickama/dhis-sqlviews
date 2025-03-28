CREATE OR REPLACE FUNCTION applyVisitTypeToOldCases() RETURNS void AS $$
DECLARE
   r record;
BEGIN
    -- Get all datsets
    FOR r IN SELECT trackedentityinstanceid,trackedentityattributeid,value,storedby FROM trackedentityattributevalue WHERE value ilike '%KK%'
    LOOP
        BEGIN
          INSERT INTO trackedentityattributevalue VALUES(r.trackedentityinstanceid,523018620,now()::timestamp,now()::timestamp,'TB treatment',null,r.storedby);
          RAISE NOTICE '*** [INSERT] Record inserted OK ***';
        EXCEPTION
          WHEN others THEN
            RAISE NOTICE '[EXCEPTION] Skipped row %', r.trackedentityinstanceid;
        END;
    END LOOP;

END
$$
LANGUAGE plpgsql;


SELECT applyVisitTypeToOldCases();