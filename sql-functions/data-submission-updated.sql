CREATE OR REPLACE FUNCTION get_dataset_report_summary(
    ouuid TEXT,
    datasetuid TEXT,
    periodiso TEXT,
    orgUnitChildrenLevel TEXT
)
RETURNS TABLE (
    grandparentname VARCHAR,
    parentname VARCHAR,
    name VARCHAR,
    uid VARCHAR,
    level BIGINT,
    completed BIGINT,
    expected BIGINT,
    ontime BIGINT,
    storedby VARCHAR,
    enddate DATE,
    submitteddate DATE
) AS $$
DECLARE
    row RECORD;
    orgunituid TEXT;
    orgunitid BIGINT;
BEGIN
    FOR row IN
    SELECT oui.uid, oui.organisationunitid
    FROM organisationunit oui
    WHERE oui.path ILIKE '%' || ouuid || '%'
      AND oui.hierarchylevel::TEXT = orgUnitChildrenLevel
  LOOP
    orgunituid := row.uid;
    orgunitid := row.organisationunitid;
  RETURN QUERY
       SELECT
    DISTINCT ON (
        outer_orgunit.hierarchylevel,
        (SELECT ougp.name FROM organisationunit ougp WHERE ougp.organisationunitid = parent.parentid),
        parent.name,
        outer_orgunit.name
    )
    (SELECT ougp.name
     FROM organisationunit ougp
     WHERE ougp.organisationunitid = parent.parentid
    ) AS grandparentname,

    parent.name AS parentname,
    outer_orgunit.name AS orgunit_name,
    outer_orgunit.uid AS orgunit_uid,
    outer_orgunit.hierarchylevel::BIGINT AS level,

    (
        SELECT COUNT(*)
        FROM completedatasetregistration cdr1
        INNER JOIN dataset ds1 ON ds1.datasetid = cdr1.datasetid
        INNER JOIN _periodstructure ps1 ON ps1.periodid = cdr1.periodid
        WHERE 
            ds1.uid = datasetuid
            AND ps1.iso = periodiso
            AND cdr1.sourceid IN (
                SELECT oucdr.organisationunitid
                FROM organisationunit oucdr
                WHERE oucdr.path ILIKE '%'||orgunituid||'%'
            )
    ) AS completed,

    CASE
      WHEN (
        SELECT COUNT(*)
        FROM categoryoption_organisationunits coo
        INNER JOIN categoryoptioncombos_categoryoptions cocc
            ON cocc.categoryoptionid = coo.categoryoptionid
        INNER JOIN categorycombos_optioncombos ccoc
            ON ccoc.categoryoptioncomboid = cocc.categoryoptioncomboid
        INNER JOIN dataset ds3 ON ds3.categorycomboid = ccoc.categorycomboid
        INNER JOIN organisationunit ou ON ou.organisationunitid = coo.organisationunitid
        WHERE ds3.uid = datasetuid AND ou.path ILIKE '%' || orgunituid || '%'
      ) >= 1
    THEN (
        SELECT COUNT(*)
        FROM categoryoption_organisationunits coo
        INNER JOIN categoryoptioncombos_categoryoptions cocc
            ON cocc.categoryoptionid = coo.categoryoptionid
        INNER JOIN categorycombos_optioncombos ccoc
            ON ccoc.categoryoptioncomboid = cocc.categoryoptioncomboid
        INNER JOIN dataset ds3 ON ds3.categorycomboid = ccoc.categorycomboid
        INNER JOIN organisationunit ou ON ou.organisationunitid = coo.organisationunitid
        WHERE ds3.uid = datasetuid AND ou.path ILIKE '%' || orgunituid || '%'
      )
    ELSE (
        SELECT COUNT(*)
        FROM datasetsource ds
        INNER JOIN organisationunit ou
            ON ou.organisationunitid = ds.sourceid
        INNER JOIN dataset d
            ON d.datasetid = ds.datasetid
        WHERE ou.path ILIKE '%' || orgunituid || '%'
          AND d.uid = datasetuid
      )
    END AS expected,

    (
        SELECT COUNT(*)
        FROM completedatasetregistration cdr2
        INNER JOIN organisationunit ou_timely
            ON ou_timely.organisationunitid = cdr2.sourceid
        INNER JOIN dataset ds4 ON ds4.datasetid = cdr2.datasetid
        INNER JOIN _periodstructure ps2 ON ps2.periodid = cdr2.periodid
        WHERE ou_timely.path ILIKE '%'||outer_orgunit.uid||'%'
          AND ds4.uid = datasetuid
          AND ps2.iso = periodiso
          AND cdr2.date::DATE <= (ps2.enddate + ds4.timelydays)
          AND cdr2.sourceid IN (
                SELECT oucdr2.organisationunitid
                FROM organisationunit oucdr2
                WHERE oucdr2.path ILIKE '%'||orgunituid||'%'
            )
    ) AS ontime,

    completed_by_and_date.storedby,
    completed_by_and_date.enddate,
    DATE(completed_by_and_date.submitteddate) AS submitteddate

    FROM organisationunit outer_orgunit
    INNER JOIN _orgunitstructure ous ON ous.organisationunitid = outer_orgunit.organisationunitid
    LEFT JOIN organisationunit parent ON outer_orgunit.parentid = parent.organisationunitid
    LEFT JOIN (
        SELECT
            cdr3.sourceid,
            cdr3.storedby,
            cdr3.date AS submitteddate,
            ps3.enddate
        FROM completedatasetregistration cdr3
        INNER JOIN organisationunit ou_completed_by
            ON ou_completed_by.organisationunitid = cdr3.sourceid
        INNER JOIN dataset ds6 ON ds6.datasetid = cdr3.datasetid
        INNER JOIN _periodstructure ps3 ON ps3.periodid = cdr3.periodid
        WHERE ds6.uid = datasetuid
          AND ps3.iso = periodiso
    ) AS completed_by_and_date
    ON completed_by_and_date.sourceid = orgunitid

    WHERE (
        outer_orgunit.path ILIKE '%'||orgunituid||'%'
        AND outer_orgunit.hierarchylevel::TEXT = orgUnitChildrenLevel
    ) OR outer_orgunit.uid = orgunituid

    ORDER BY
        outer_orgunit.hierarchylevel DESC,
        grandparentname ASC,
        parent.name ASC,
        outer_orgunit.name ASC;
    END LOOP;
END;
$$ LANGUAGE plpgsql;


-- How to run the function 
-- SELECT * FROM get_dataset_report_summary('f7UPzYMgzVH','p832hTevsKo','202505','4');