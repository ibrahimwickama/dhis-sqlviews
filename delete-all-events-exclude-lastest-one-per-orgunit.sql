  -- SQL Queries
DELETE FROM trackedentitydatavalue WHERE programstageinstanceid NOT IN(SELECT programstageinstanceid FROM programstageinstance
WHERE executiondate >= '2018-01-01' AND executiondate < '2020-01-01' AND organisationunitid = 2479
GROUP BY organisationunitid, programstageinstanceid
ORDER BY lastupdated DESC LIMIT 1)
AND programstageinstanceid IN(SELECT programstageinstanceid FROM programstageinstance
WHERE executiondate >= '2018-01-01' AND executiondate < '2020-01-01' AND organisationunitid = 2479
GROUP BY organisationunitid, programstageinstanceid
ORDER BY lastupdated DESC);

DELETE FROM programstageinstance WHERE programstageinstanceid NOT IN(SELECT programstageinstanceid FROM programstageinstance
WHERE executiondate >= '2018-01-01' AND executiondate < '2020-01-01' AND organisationunitid = 2479 
GROUP BY organisationunitid, programstageinstanceid
ORDER BY lastupdated DESC LIMIT 1
) AND organisationunitid = 2479;


-- Procedure Function for deleting one-by-one per orgunitid

CREATE OR REPLACE FUNCTION deleteOldEvents() RETURNS void AS $$
DECLARE
    rec   record;
BEGIN
   FOR rec IN
      SELECT organisationunitid FROM organisationunit
   LOOP 
        DELETE FROM trackedentitydatavalue WHERE programstageinstanceid NOT IN(SELECT programstageinstanceid FROM programstageinstance
        WHERE executiondate >= '2018-01-01' AND executiondate < '2020-01-01' AND organisationunitid::TEXT = rec::TEXT
        GROUP BY organisationunitid, programstageinstanceid
        ORDER BY lastupdated DESC LIMIT 1)
        AND programstageinstanceid IN(SELECT programstageinstanceid FROM programstageinstance
        WHERE executiondate >= '2018-01-01' AND executiondate < '2020-01-01' AND organisationunitid::TEXT = rec::TEXT
        GROUP BY organisationunitid, programstageinstanceid
        ORDER BY lastupdated DESC);

        DELETE FROM programstageinstance WHERE programstageinstanceid NOT IN(SELECT programstageinstanceid FROM programstageinstance psi
        INNER JOIN programstage ps ON(ps.programstageid = psi.programstageid AND ps.uid = 'TfElxurgcBm')
        WHERE psi.executiondate >= '2018-01-01' AND psi.executiondate < '2020-01-01' AND psi.organisationunitid::TEXT = rec::TEXT
        GROUP BY psi.organisationunitid, psi.programstageinstanceid
        ORDER BY psi.lastupdated DESC LIMIT 1
        ) AND organisationunitid::TEXT = rec::TEXT;

   END LOOP;
END
$$
LANGUAGE plpgsql;
