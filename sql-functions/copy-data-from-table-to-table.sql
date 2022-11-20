DO
LANGUAGE plpgsql
$$
DECLARE
  r record;
BEGIN
  FOR r IN SELECT a, b FROM mytable
  LOOP
    BEGIN
      INSERT INTO newtable (x, y)
      VALUES (r.a, r.b);
    EXCEPTION
      WHEN check_violation THEN
        RAISE NOTICE 'Skipped row %', r.a;
    END;
  END LOOP;
END;
$$;





CREATE OR REPLACE FUNCTION copytabledata() RETURNS void AS $$
DECLARE
   r record;
BEGIN
    -- Get all datsets
    FOR r IN SELECT dataelementid, periodid, sourceid, categoryoptioncomboid, value, storedby, lastupdated, comment, followup, attributeoptioncomboid, created, deleted FROM tempdatamigration
    LOOP
        BEGIN
          INSERT INTO datavalue (dataelementid, periodid, sourceid, categoryoptioncomboid, value, storedby, lastupdated, comment, followup, attributeoptioncomboid, created, deleted)
          VALUES (r.dataelementid, r.periodid, r.sourceid, r.categoryoptioncomboid, r.value, r.storedby, r.lastupdated, r.comment, r.followup, r.attributeoptioncomboid, r.created, r.deleted)
          ON CONFLICT (dataelementid, periodid, sourceid, categoryoptioncomboid, attributeoptioncomboid) DO NOTHING;
          RAISE NOTICE '*** Row INSERT Successful ***';
        EXCEPTION
          WHEN others THEN
            RAISE NOTICE 'Skipped row %', r.dataelementid;
        END;
    END LOOP;

END
$$
LANGUAGE plpgsql;