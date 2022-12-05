CREATE OR REPLACE FUNCTION deleteTBpatientByTBNo(tbnumber VARCHAR(70)) RETURNS void AS $$
DECLARE
    rec record;
BEGIN
    FOR rec IN SELECT uid FROM trackedentityinstance WHERE trackedentityinstanceid IN(SELECT trackedentityinstanceid FROM trackedentityattributevalue WHERE value=tbnumber)
    LOOP
        DELETE FROM trackedentityattributevalueaudit WHERE trackedentityinstanceid IN(SELECT trackedentityinstanceid FROM trackedentityinstance WHERE uid=rec.uid);
        DELETE FROM trackedentityattributevalue WHERE trackedentityinstanceid IN(SELECT trackedentityinstanceid FROM trackedentityinstance WHERE uid=rec.uid);
        DELETE FROM programstageinstance WHERE programinstanceid IN(SELECT programinstanceid FROM programinstance WHERE trackedentityinstanceid IN(SELECT trackedentityinstanceid FROM trackedentityinstance WHERE uid=rec.uid));
        DELETE FROM programinstance WHERE trackedentityinstanceid IN(SELECT trackedentityinstanceid FROM trackedentityinstance WHERE uid=rec.uid);
        DELETE FROM trackedentityprogramowner WHERE trackedentityinstanceid IN(SELECT trackedentityinstanceid FROM trackedentityinstance WHERE trackedentityinstanceid IN(SELECT trackedentityinstanceid FROM trackedentityinstance WHERE uid=rec.uid));
        DELETE FROM trackedentityinstance WHERE trackedentityinstanceid IN(SELECT trackedentityinstanceid FROM trackedentityinstance WHERE uid=rec.uid);
        RAISE NOTICE '[DELETE] Patient deleted with TB NO %', tbnumber;
    END LOOP;
END
$$
LANGUAGE plpgsql;


-- how to run the sql procedure 
SELECT deleteTBpatientByTBNo('070107102508-9/KK/2022/36');