
-- how to trigger submission status sql
-- https://ards.kilimo.go.tz/api/sqlViews/FIfbenVekHp/data.json?var=datasetId:Ba9mZCFaUCV&var=orgUnitId:x8pf2GJEiUv&var=orgUnitChildrenLevel:4&var=period:202107&var=reportGenarationDate:2022-3-16&_id=5085

-- how to generate on HMIS 
-- https://ards.kilimo.go.tz/api/sqlViews/YuB4tCTJoig/data.json?var=datasetId:Pw3c2BcqbQ5&var=orgUnitId:GRDYT0QagNn&var=orgUnitChildrenLevel:4&var=period:202107&var=reportGenarationDate:2022-3-16&_id=5085
-- submission status from ARDS
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
			AND _periodstructure.iso='${period}'
			AND completedatasetregistration.date::date<='${reportGenarationDate}'

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
			AND completedatasetregistration.date::date<='${reportGenarationDate}'
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
			AND completedatasetregistration.date::date<='${reportGenarationDate}'
	) as completed_by_and_date ON completed_by_and_date.sourceid=outer_orgunit.organisationunitid
WHERE (outer_orgunit.path ilike '%${orgUnitId}%'
	and outer_orgunit.hierarchylevel='${orgUnitChildrenLevel}')
        or outer_orgunit.uid='${orgUnitId}'
ORDER BY outer_orgunit.hierarchylevel desc,  grandparentname asc, parent.name asc, outer_orgunit.name asc