  -- SQL Queries
DELETE FROM trackedentitydatavalue WHERE programstageinstanceid NOT IN(SELECT programstageinstanceid FROM programstageinstance psi
INNER JOIN programstage ps ON(ps.programstageid = psi.programstageid AND ps.uid = 'TfElxurgcBm')
WHERE psi.executiondate >= '2018-01-01' AND psi.executiondate < '2020-01-01' AND psi.organisationunitid = 2479
GROUP BY psi.organisationunitid, psi.programstageinstanceid
ORDER BY psi.lastupdated DESC LIMIT 1)
AND programstageinstanceid IN(SELECT programstageinstanceid FROM programstageinstance psi2
WHERE psi2.executiondate >= '2018-01-01' AND psi2.executiondate < '2020-01-01' AND psi2.organisationunitid = 2479
GROUP BY psi2.organisationunitid, psi2.programstageinstanceid
ORDER BY psi2.lastupdated DESC);

DELETE FROM trackedentitydatavalueaudit WHERE programstageinstanceid NOT IN(SELECT programstageinstanceid FROM programstageinstance psi
INNER JOIN programstage ps ON(ps.programstageid = psi.programstageid AND ps.uid = 'TfElxurgcBm')
WHERE psi.executiondate >= '2018-01-01' AND psi.executiondate < '2020-01-01' AND psi.organisationunitid = 2479
GROUP BY psi.organisationunitid, psi.programstageinstanceid
ORDER BY psi.lastupdated DESC LIMIT 1)
AND programstageinstanceid IN(SELECT programstageinstanceid FROM programstageinstance psi2
WHERE psi2.executiondate >= '2018-01-01' AND psi2.executiondate < '2020-01-01' AND psi2.organisationunitid = 2479
GROUP BY psi2.organisationunitid, psi2.programstageinstanceid
ORDER BY psi2.lastupdated DESC);

DELETE FROM programstageinstance WHERE programstageinstanceid NOT IN(SELECT programstageinstanceid FROM programstageinstance psi
INNER JOIN programstage ps ON(ps.programstageid = psi.programstageid AND ps.uid = 'TfElxurgcBm')
WHERE psi.executiondate >= '2018-01-01' AND psi.executiondate < '2020-01-01' AND psi.organisationunitid = 2479 
GROUP BY psi.organisationunitid, psi.programstageinstanceid
ORDER BY psi.lastupdated DESC LIMIT 1
) AND organisationunitid = 2479;


-- Procedure Function for deleting one-by-one per orgunitid

CREATE OR REPLACE FUNCTION deleteOldEvents() RETURNS void AS $$
DECLARE
    rec   record;
BEGIN
   FOR rec IN
      SELECT organisationunitid FROM organisationunit WHERE hierarchylevel = 3
   LOOP 
        DELETE FROM trackedentitydatavalueaudit WHERE programstageinstanceid IN(SELECT programstageinstanceid FROM programstageinstance
         WHERE programstageinstanceid NOT IN(SELECT programstageinstanceid FROM programstageinstance psi
        WHERE executiondate >= '2018-01-01' AND executiondate < '2020-01-01' AND organisationunitid = rec.organisationunitid
        GROUP BY organisationunitid, programstageinstanceid
        ORDER BY lastupdated DESC LIMIT 1
        ) AND organisationunitid = rec.organisationunitid);

        DELETE FROM trackedentitydatavalue WHERE programstageinstanceid IN(SELECT programstageinstanceid FROM programstageinstance
        WHERE programstageinstanceid NOT IN(SELECT programstageinstanceid FROM programstageinstance psi
        WHERE executiondate >= '2018-01-01' AND executiondate < '2020-01-01' AND organisationunitid = rec.organisationunitid
        GROUP BY organisationunitid, programstageinstanceid
        ORDER BY lastupdated DESC LIMIT 1
        ) AND organisationunitid = rec.organisationunitid);

        DELETE FROM programstageinstance WHERE programstageinstanceid NOT IN(SELECT programstageinstanceid FROM programstageinstance psi
        WHERE executiondate >= '2018-01-01' AND executiondate < '2020-01-01' AND organisationunitid = rec.organisationunitid
        GROUP BY organisationunitid, programstageinstanceid
        ORDER BY lastupdated DESC LIMIT 1
        ) AND organisationunitid = rec.organisationunitid;

        raise notice 'Deleted on organisationunitid: %', rec.organisationunitid;

   END LOOP;
END
$$
LANGUAGE plpgsql;
