SELECT
      (SELECT name
       FROM organisationunit
       WHERE organisationunitid=parent.parentid
      ) as grandparentname,
       parent.name as parentname,
        outer_orgunit.name,
        outer_orgunit.uid,
        outer_orgunit.hierarchylevel as level,

	(
		SELECT COUNT(*)
		FROM completedatasetregistration
		INNER JOIN organisationunit inner_orgunit_completed
		ON inner_orgunit_completed.organisationunitid=completedatasetregistration.sourceid
		INNER JOIN dataset
		ON dataset.datasetid=completedatasetregistration.datasetid
		INNER JOIN _periodstructure
		ON _periodstructure.periodid=completedatasetregistration.periodid
		WHERE inner_orgunit_completed.path ilike '%'||outer_orgunit.uid||'%'
			AND dataset.uid='${datasetId}'
			AND _periodstructure.iso='${period}' AND completedatasetregistration.sourceid IN (
                                   SELECT datasetsource.sourceid
		                   FROM datasetsource
		                   INNER JOIN organisationunit inner_orgunit_expected
		                  ON inner_orgunit_expected.organisationunitid=datasetsource.sourceid
		                   INNER JOIN dataset
		                  ON dataset.datasetid=datasetsource.datasetid
		                  WHERE inner_orgunit_expected.path ilike '%'||outer_orgunit.uid||'%'
			          AND dataset.uid='${datasetId}'
                             )

	) as completed,
	(
		SELECT count(*)
		FROM datasetsource
		INNER JOIN organisationunit inner_orgunit_expected
		ON inner_orgunit_expected.organisationunitid=datasetsource.sourceid
		INNER JOIN dataset
		ON dataset.datasetid=datasetsource.datasetid
		WHERE inner_orgunit_expected.path ilike '%'||outer_orgunit.uid||'%'
			AND dataset.uid='${datasetId}'

	) as expected,
	(
	SELECT COUNT(*) 
		FROM completedatasetregistration
		INNER JOIN organisationunit inner_orgunit_timely
		ON inner_orgunit_timely.organisationunitid=completedatasetregistration.sourceid
		INNER JOIN dataset
		ON dataset.datasetid=completedatasetregistration.datasetid
		INNER JOIN _periodstructure
		ON _periodstructure.periodid=completedatasetregistration.periodid
		WHERE inner_orgunit_timely.path ilike '%'||outer_orgunit.uid||'%'
			AND dataset.uid='${datasetId}'
			AND _periodstructure.iso='${period}'
			AND completedatasetregistration.date::date <= (_periodstructure.enddate + dataset.timelydays) 
                        AND  completedatasetregistration.sourceid IN (
                                   SELECT datasetsource.sourceid
		                   FROM datasetsource
		                   INNER JOIN organisationunit inner_orgunit_expected
		                  ON inner_orgunit_expected.organisationunitid=datasetsource.sourceid
		                   INNER JOIN dataset
		                  ON dataset.datasetid=datasetsource.datasetid
		                  WHERE inner_orgunit_expected.path ilike '%'||outer_orgunit.uid||'%'
			          AND dataset.uid='${datasetId}'
                             )
	) as ontime,
	completed_by_and_date.storedby,
	completed_by_and_date.enddate,
	date(completed_by_and_date.submitteddate) as submitteddate

FROM organisationunit outer_orgunit
INNER JOIN _orgunitstructure using(organisationunitid)
LEFT JOIN organisationunit as parent on outer_orgunit.parentid=parent.organisationunitid
LEFT JOIN
	(
		SELECT completedatasetregistration.sourceid,
		completedatasetregistration.storedby storedby,
		completedatasetregistration.date submitteddate,_periodstructure.enddate
		FROM completedatasetregistration
		INNER JOIN organisationunit inner_orgunit_completed_by
		ON inner_orgunit_completed_by.organisationunitid=completedatasetregistration.sourceid
		INNER JOIN dataset
		ON dataset.datasetid=completedatasetregistration.datasetid
		INNER JOIN _periodstructure
		ON _periodstructure.periodid=completedatasetregistration.periodid
		WHERE dataset.uid='${datasetId}'
			AND _periodstructure.iso='${period}'
	) as completed_by_and_date ON completed_by_and_date.sourceid=outer_orgunit.organisationunitid
WHERE (outer_orgunit.path ilike '%${orgUnitId}%'
	and outer_orgunit.hierarchylevel='${orgUnitChildrenLevel}')
        or outer_orgunit.uid='${orgUnitId}'
ORDER BY outer_orgunit.hierarchylevel desc,  grandparentname asc, parent.name asc, outer_orgunit.name asc