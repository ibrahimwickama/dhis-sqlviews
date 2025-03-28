
-- SELECT coc.categoryoptioncomboid,coc.uid,coc.name
-- SELECT *
-- SELECT DISTINCT ON(coc.categoryoptioncomboid,coc.uid,coc.name,coo.categoryoptionid,coo.organisationunitid)
SELECT DISTINCT ON(coo.categoryoptionid)
coc.categoryoptioncomboid,coc.uid,coc.name,coo.categoryoptionid,coo.organisationunitid
FROM categoryoptioncombo coc
INNER JOIN categorycombos_optioncombos ccoc ON ccoc.categoryoptioncomboid=coc.categoryoptioncomboid
INNER JOIN dataset ds ON ds.categorycomboid=ccoc.categorycomboid
INNER JOIN datasetsource dss ON dss.datasetid=ds.datasetid
INNER JOIN organisationunit inner_orgunit_expected ON inner_orgunit_expected.organisationunitid=dss.sourceid
INNER JOIN categoryoption_organisationunits coo ON coo.organisationunitid=dss.sourceid
WHERE inner_orgunit_expected.path ilike '%Fsz16WYTvUV%' AND ds.uid='p832hTevsKo';

SELECT COUNT(*)
SELECT *
FROM categoryoption_organisationunits coo
INNER JOIN organisationunit inner_orgunit_expected ON inner_orgunit_expected.organisationunitid=coo.organisationunitid
-- INNER JOIN categorycombos_optioncombos ccoc ON ccoc.categoryoptioncomboid=coc.categoryoptioncomboid
-- INNER JOIN categoryoptioncombo coc ON coc.categoryoptioncomboid =ccoc.categoryoptioncomboid
INNER JOIN datasetsource dss ON dss.sourceid=coo.organisationunitid
INNER JOIN dataset ds ON ds.datasetid=dss.datasetid
INNER JOIN dataelementcategoryoption dco ON dco.categoryoptionid=coo.categoryoptionid
WHERE inner_orgunit_expected.path ilike '%GRDYT0QagNn%' AND ds.uid='p832hTevsKo';


SELECT *
FROM categoryoption_organisationunits coo
INNER JOIN organisationunit inner_orgunit_expected ON inner_orgunit_expected.organisationunitid=coo.organisationunitid
INNER JOIN datasetsource dss ON dss.sourceid=coo.organisationunitid
INNER JOIN dataset ds ON ds.datasetid=dss.datasetid
WHERE inner_orgunit_expected.path ilike '%GRDYT0QagNn%' AND ds.uid='p832hTevsKo';

OU Tungi Disp Fsz16WYTvUV
OU Amana reg hosp GRDYT0QagNn


dataelementcategory
dataelementcategoryoption



SELECT DISTINCT ON(coo.categoryoptionid)
coc.categoryoptioncomboid,coc.uid,coc.name,coo.categoryoptionid,dco.name
-- SELECT DISTINCT ON(coo.categoryoptionid) *
SELECT DISTINCT ON(coo.categoryoptionid) *
-- SELECT *
FROM categoryoptioncombo coc
INNER JOIN categorycombos_optioncombos ccoc ON ccoc.categoryoptioncomboid=coc.categoryoptioncomboid
INNER JOIN dataset ds ON ds.categorycomboid=ccoc.categorycomboid
INNER JOIN datasetelement dse ON dse.datasetid=ds.datasetid 
-- AND dse.categorycomboid=ccoc.categorycomboid
INNER JOIN datasetsource dss ON dss.datasetid=ds.datasetid
INNER JOIN organisationunit inner_orgunit_expected ON inner_orgunit_expected.organisationunitid=dss.sourceid
INNER JOIN categoryoption_organisationunits coo ON coo.organisationunitid=dss.sourceid
INNER JOIN dataelementcategoryoption dco ON dco.categoryoptionid=coo.categoryoptionid
WHERE inner_orgunit_expected.path ilike '%GRDYT0QagNn%' AND ds.uid='p832hTevsKo';