CREATE OR REPLACE FUNCTION cleanDefaultCoc() RETURNS void AS $$
DECLARE
   r record;
BEGIN
    -- Get all datsets
    FOR r IN SELECT datasetid,periodid,sourceid,attributeoptioncomboid FROM completedatasetregistration
    LOOP
        BEGIN
          UPDATE completedatasetregistration SET attributeoptioncomboid=24 WHERE attributeoptioncomboid=17863 AND datasetid=r.datasetid AND periodid=r.periodid AND sourceid=r.sourceid;
        --   ON CONFLICT (dataelementid, periodid, sourceid, attributeoptioncomboid) DO NOTHING;
          RAISE NOTICE '*** Row UPDATED Successful ***';
        EXCEPTION
          WHEN others THEN
            RAISE NOTICE 'Skipped row %', r.attributeoptioncomboid;
        END;
    END LOOP;

END
$$
LANGUAGE plpgsql;