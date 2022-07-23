SELECT 
ous.uidlevel2 as regionuid,
ous.namelevel2 as region, 
ous.uidlevel3 as districtuid,
ous.namelevel3 as district,
ou.name as facility,
ou.uid as facilityuid
FROM organisationunit ou
LEFT JOIN _orgunitstructure ous ON(ous.organisationunitid=ou.organisationunitid)
WHERE ou.hierarchylevel=4 AND ou.organisationunitid NOT IN(
    SELECT 
    ou.organisationunitid as organisationunitid
    FROM organisationunit ou
    INNER JOIN datasetsource dss ON(dss.sourceid = ou.organisationunitid)
    LEFT JOIN dataset ds ON(ds.datasetid=dss.datasetid)
    LEFT JOIN _orgunitstructure ous ON(ous.organisationunitid=ou.organisationunitid)
    WHERE ds.uid = 'NDcgQeGaJC9' AND dss.sourceid IN(select organisationunitid FROM organisationunit WHERE hierarchylevel=4)
);