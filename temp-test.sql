alter table sequentialnumbercounter alter column id type bigint;



-- DatasetIds
select datasetid from dataset where uid in('nqKkegk1y8U','RixTh0Xs0A7', 'fiDtcNUzKI6')

-- Assigned Dataset DataElements
select dataelementid from datasetmembers where datasetid in(select datasetid from dataset where uid in('nqKkegk1y8U','RixTh0Xs0A7', 'fiDtcNUzKI6'))

-- Delete datasetoperands 
delete from datasetoperands where dataelementoperandid in(select dataelementoperandid from dataelementoperand where dataelementid in(select dataelementid from datasetmembers where datasetid in(select datasetid from dataset where uid in('nqKkegk1y8U','RixTh0Xs0A7', 'fiDtcNUzKI6'))));
delete from dataelementoperand where dataelementid in(select dataelementid from datasetmembers where datasetid in(select datasetid from dataset where uid in('nqKkegk1y8U','RixTh0Xs0A7', 'fiDtcNUzKI6')));
\dt


DELETE                                                                              
FROM datasetoperands a 
USING dataelementoperand
b 
WHERE a.dataelementoperandid = b.dataelementoperandid 
AND b.dataelementid IN (SELECT dataelement.dataelementid FROM dataelement WHERE dataelement.uid = 'd7BWnsxu58U');

DELETE                                                                              
FROM datasetoperands a 
USING dataelementoperand
b 
WHERE a.dataelementoperandid = b.dataelementoperandid 
AND b.dataelementid IN                                                                                           
(SELECT ds.dataelementid
FROM datasetelement ds
WHERE ds.datasetid IN (SELECT dataset.datasetid
FROM dataset
WHERE dataset.uid = 'fiDtcNUzKI6')
)
;

SELECT ds.dataelementid                                                             
FROM datasetelement ds
WHERE ds.datasetid IN (SELECT dataset.datasetid
FROM dataset
WHERE dataset.uid = 'fiDtcNUzKI6');




select * from trackedentityinstance where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityattributevalue where value='0409099264-2  /kk/2022/125');
select * from trackedentityinstance where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityattributevalue where value='180201103098-0/KK/2022/1');

delete from trackedentityattributevalueaudit where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid in('VWLCpm00C30'));
delete from trackedentityattributevalue where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid  in('VWLCpm00C30'));
delete from programstageinstance where programinstanceid in(select programinstanceid from programinstance where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid in('VWLCpm00C30')));
delete from programinstance where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid  in('VWLCpm00C30'));
delete from trackedentityprogramowner where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid in('VWLCpm00C30')));
delete from trackedentityinstance where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid  in('VWLCpm00C30'));



select * from programinstance where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid in('kfEIfNehpbw'));


-- download datavalues for ouToRemove
select count(*) from datavalue where sourceid=(select organisationunitid from organisationunit where uid='smDMxTGfDrO');
copy(select * from datavalue where sourceid=(select organisationunitid from organisationunit where uid='ouUidToRemove')) to '/tmp/batch.csv' with csv header;

-- then csv file add query for updating migrating to new ouToRemain
="update datavalue set sourceid=(select organisationunitid from organisationunit where uid='ouUidToRemain') where periodid="&B2&" and sourceid="&C2&";"

-- run the queries above and wait for it to finish
-- After that run this queries to migrate tracker envent data to ouToRemain
update datavalueaudit set organisationunitid=(select organisationunitid from organisationunit where uid='ouUidToRemain') where organisationunitid=(select organisationunitid from organisationunit where uid='ouUidToRemove');
update trackedentityinstance set organisationunitid=(select organisationunitid from organisationunit where uid='ouUidToRemain') where organisationunitid=(select organisationunitid from organisationunit where uid='ouUidToRemove');
update programinstance set organisationunitid=(select organisationunitid from organisationunit where uid='ouUidToRemain') where organisationunitid=(select organisationunitid from organisationunit where uid='ouUidToRemove');
update programstageinstance set organisationunitid=(select organisationunitid from organisationunit where uid='ouUidToRemain') where organisationunitid=(select organisationunitid from organisationunit where uid='ouUidToRemove');
update trackedentityprogramowner set organisationunitid=(select organisationunitid from organisationunit where uid='ouUidToRemain') where organisationunitid=(select organisationunitid from organisationunit where uid='ouUidToRemove');
delete from datavalue where sourceid=(select organisationunitid from organisationunit where uid='ouUidToRemove');

-- then finally delete the ouToRemove
delete from organisationunit where uid in('ouUidToRemove');


delete from datavalueaudit where organisationunitid in(select organisationunitid from organisationunit where path ilike '%PHGm198Hcil%');
delete from datavalue where sourceid in(select organisationunitid from organisationunit where path ilike '%PHGm198Hcil%');
delete from datasetsource where sourceid in(select organisationunitid from organisationunit where path ilike '%PHGm198Hcil%');
delete from completedatasetregistration where sourceid in(select organisationunitid from organisationunit where path ilike '%PHGm198Hcil%');
delete from program_organisationunits where organisationunitid in(select organisationunitid from organisationunit where path ilike '%PHGm198Hcil%');
delete from programstageinstance where organisationunitid in(select organisationunitid from organisationunit where path ilike '%PHGm198Hcil%');
delete from trackedentitydatavalueaudit where programstageinstanceid in(select programstageinstanceid from  programstageinstance where organisationunitid in(select organisationunitid from organisationunit where path ilike '%PHGm198Hcil%'));
delete from trackedentitydatavalue where programstageinstanceid in(select programstageinstanceid from  programstageinstance where organisationunitid in(select organisationunitid from organisationunit where path ilike '%PHGm198Hcil%'));
delete from trackedentityinstance where organisationunitid in(select organisationunitid from organisationunit where path ilike '%PHGm198Hcil%');
delete from categoryoption_organisationunits where organisationunitid in(select organisationunitid from organisationunit where path ilike '%PHGm198Hcil%');
delete from usermembership where organisationunitid in(select organisationunitid from organisationunit where path ilike '%PHGm198Hcil%');
delete from orgunitgroupmembers where organisationunitid in(select organisationunitid from organisationunit where path ilike '%PHGm198Hcil%');
delete from visualization_organisationunits where organisationunitid in(select organisationunitid from organisationunit where path ilike '%PHGm198Hcil%');
delete from organisationunit where path ilike '%PHGm198Hcil%';




delete from datavalueaudit where organisationunitid in(select organisationunitid from organisationunit where uid in('smDMxTGfDrO',));
delete from datavalue where sourceid in(select organisationunitid from organisationunit where path ilike '%PHGm198Hcil%');
delete from datasetsource where sourceid in(select organisationunitid from organisationunit where path ilike '%PHGm198Hcil%');
delete from completedatasetregistration where sourceid in(select organisationunitid from organisationunit where path ilike '%PHGm198Hcil%');
delete from program_organisationunits where organisationunitid in(select organisationunitid from organisationunit where path ilike '%PHGm198Hcil%');
delete from programstageinstance where organisationunitid in(select organisationunitid from organisationunit where path ilike '%PHGm198Hcil%');
delete from trackedentitydatavalueaudit where programstageinstanceid in(select programstageinstanceid from  programstageinstance where organisationunitid in(select organisationunitid from organisationunit where path ilike '%PHGm198Hcil%'));
delete from trackedentitydatavalue where programstageinstanceid in(select programstageinstanceid from  programstageinstance where organisationunitid in(select organisationunitid from organisationunit where path ilike '%PHGm198Hcil%'));
delete from trackedentityinstance where organisationunitid in(select organisationunitid from organisationunit where path ilike '%PHGm198Hcil%');
delete from categoryoption_organisationunits where organisationunitid in(select organisationunitid from organisationunit where path ilike '%PHGm198Hcil%');
delete from usermembership where organisationunitid in(select organisationunitid from organisationunit where path ilike '%PHGm198Hcil%');
delete from orgunitgroupmembers where organisationunitid in(select organisationunitid from organisationunit where path ilike '%PHGm198Hcil%');
delete from visualization_organisationunits where organisationunitid in(select organisationunitid from organisationunit where path ilike '%PHGm198Hcil%');
delete from organisationunit where path ilike '%PHGm198Hcil%';




UPDATE organisationunit SET uid='SoXc0vm0JrY' WHERE uid='aUdfem97WXP';
UPDATE organisationunit SET uid='cMHodEm1Bpd' WHERE uid='teIvtkQ7pfk';
UPDATE organisationunit SET uid='GFMMtqCiaUG' WHERE uid='S1E9xxs6rn8';
UPDATE organisationunit SET uid='OwqGTochnjW' WHERE uid='hTO1Kiik4WK';
UPDATE organisationunit SET uid='Tp2jluoQwvA' WHERE uid='jaFjHpoOU9t';
UPDATE organisationunit SET uid='TNttitmiKti' WHERE uid='rzGZB4XMGaS';
UPDATE organisationunit SET uid='tn4J9iYIv7I' WHERE uid='QnGcUosXf8H';
UPDATE organisationunit SET uid='KEsG36c8lDx' WHERE uid='TlLqEsMA34R';
UPDATE organisationunit SET uid='chzBato6xed' WHERE uid='oRf47ubwIUF';
UPDATE organisationunit SET uid='TDqOYlV0O1a' WHERE uid='KwCFIoHlNXl';
UPDATE organisationunit SET uid='lUB72k7eAQ3' WHERE uid='DEXDIw2qupC';
UPDATE organisationunit SET uid='k4ijpiPRc3R' WHERE uid='IpKFSMEWrIf';
UPDATE organisationunit SET uid='NCnwqVfx8j4' WHERE uid='NGMFY3jBkLD';
UPDATE organisationunit SET uid='QRjyrYOr2vh' WHERE uid='AKPgrNquTwS';
UPDATE organisationunit SET uid='tCJrHeEyDkg' WHERE uid='w5yyYUdrBK2';
UPDATE organisationunit SET uid='uvsgHtPzLSo' WHERE uid='aOFGNG1im9C';
UPDATE organisationunit SET uid='YUUmbtHrmco' WHERE uid='a8kPYsZOuIZ';
UPDATE organisationunit SET uid='fqlNpTvqMw4' WHERE uid='IBQwIcnl5n5';
UPDATE organisationunit SET uid='DvHoBaCDtec' WHERE uid='u3lMWN2TMVW';


-- delete testing facility MOHeIDSR on live HMIS 
delete from datavalueaudit where organisationunitid in(select organisationunitid from organisationunit where uid='b6OKLRDLlT4');
delete from datavalue where sourceid in(select organisationunitid from organisationunit where uid='b6OKLRDLlT4');
delete from completedatasetregistration where sourceid in(select organisationunitid from organisationunit where uid='b6OKLRDLlT4');
delete from trackedentitydatavalueaudit where programstageinstanceid in(select programstageinstanceid from  programstageinstance where programstageid in(select programstageid from programstage where programid in(select programid from program)) and organisationunitid in(select organisationunitid from organisationunit where uid='b6OKLRDLlT4'));
delete from trackedentitydatavalue where programstageinstanceid in(select programstageinstanceid from  programstageinstance where programstageid in(select programstageid from programstage where programid in(select programid from program)) and organisationunitid in(select organisationunitid from organisationunit where uid='b6OKLRDLlT4'));
delete from programstageinstance where organisationunitid in(select organisationunitid from organisationunit where uid='b6OKLRDLlT4');
delete from trackedentityattributevalueaudit where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where organisationunitid in(select organisationunitid from organisationunit where uid='b6OKLRDLlT4'));
delete from trackedentityattributevalue where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where organisationunitid in(select organisationunitid from organisationunit where uid='b6OKLRDLlT4'));
delete from programinstance where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where organisationunitid in(select organisationunitid from organisationunit where uid='b6OKLRDLlT4'));
delete from trackedentityprogramowner where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where organisationunitid in(select organisationunitid from organisationunit where uid='b6OKLRDLlT4'));
delete from trackedentityinstance where organisationunitid in(select organisationunitid from organisationunit where uid='b6OKLRDLlT4');


COPY(SELECT tablename, indexname, indexdef
FROM pg_indexes
WHERE  schemaname = 'public'
ORDER BY tablename, indexname) to '/tmp/hmis-db-indexes.csv' with csv header;



UPDATE analytics_enrollment_h5c6ek2n7ho SET uidlevel4='SoXc0vm0JrY' WHERE uidlevel4='aUdfem97WXP';
UPDATE analytics_enrollment_nvz0befz5rj SET uidlevel4='SoXc0vm0JrY' WHERE uidlevel4='aUdfem97WXP';
UPDATE analytics_enrollment_rvut3rv6sip SET uidlevel4='SoXc0vm0JrY' WHERE uidlevel4='aUdfem97WXP';
UPDATE analytics_enrollment_t2ucze8phd4 SET uidlevel4='SoXc0vm0JrY' WHERE uidlevel4='aUdfem97WXP';
UPDATE analytics_enrollment_tj4u1ip0ttf SET uidlevel4='SoXc0vm0JrY' WHERE uidlevel4='aUdfem97WXP';
UPDATE analytics_enrollment_u38fbjtunlx SET uidlevel4='SoXc0vm0JrY' WHERE uidlevel4='aUdfem97WXP';
UPDATE analytics_enrollment_ukjbcrvf66z SET uidlevel4='SoXc0vm0JrY' WHERE uidlevel4='aUdfem97WXP';
UPDATE analytics_enrollment_vmvft2fauli SET uidlevel4='SoXc0vm0JrY' WHERE uidlevel4='aUdfem97WXP';
UPDATE analytics_enrollment_xqcwl04tnid SET uidlevel4='SoXc0vm0JrY' WHERE uidlevel4='aUdfem97WXP';
UPDATE analytics_enrollment_zqvzfifwiyk SET uidlevel4='SoXc0vm0JrY' WHERE uidlevel4='aUdfem97WXP';


-- then csv file add query for updating migrating to new ouToRemain
="update trackedentityattributevalue set value='"&B2&"' where trackedentityattributeid=2182769240 and value='"&A2&"';"
="DROP TABLE '"&A2&"' CASCADE;"




SELECT ou.uid,ous.namelevel2,ous.namelevel3,ous.namelevel4,ou.name,ARRAY_TO_STRING(ARRAY_AGG(oug.name),',') grps FROM organisationunit ou
INNER JOIN orgunitgroupmembers ougm ON(ougm.organisationunitid=ou.organisationunitid)
INNER JOIN orgunitgroup oug ON(ougm.orgunitgroupid=oug.orgunitgroupid)
INNER JOIN _orgunitstructure ous ON(ous.organisationunitid=ou.organisationunitid)
WHERE ou.hierarchylevel=5 AND oug.uid NOT IN('m16TP0k7LVw','ZGhwSwcXKla')
GROUP BY ou.uid,ous.namelevel2,ous.namelevel3,ous.namelevel4,ou.name
HAVING COUNT(ougm.*) > 0
ORDER BY ous.namelevel2,ous.namelevel3,ous.namelevel4,ou.name;



SELECT ou.uid,ous.namelevel2,ous.namelevel3,ous.namelevel4,ou.name,ARRAY_TO_STRING(ARRAY_AGG(oug.name),',') grps 
FROM organisationunit ou
INNER JOIN orgunitgroupmembers ougm ON(ougm.organisationunitid=ou.organisationunitid)
INNER JOIN orgunitgroup oug ON(ougm.orgunitgroupid=oug.orgunitgroupid)
INNER JOIN _orgunitstructure ous ON(ous.organisationunitid=ou.organisationunitid)
WHERE ou.hierarchylevel=5 AND oug.uid NOT IN('m16TP0k7LVw','ZGhwSwcXKla')
GROUP BY ou.uid,ous.namelevel2,ous.namelevel3,ous.namelevel4,ou.name
HAVING COUNT(ougm.*) > 0
ORDER BY ous.namelevel2,ous.namelevel3,ous.namelevel4,ou.name;






// with idsr weekly form 
SELECT 
outmpR.uid as regionuid,
outmpR.name as region, 
outmpD.uid as districtuid,
outmpD.name as district,
ou.name as facility,
ou.uid as facilityuid,
ds.name as dataSetName 
FROM dataset ds,
organisationunit ou, 
organisationunit outmpR, 
organisationunit outmpD, 
datasetsource dssrc, 
_orgunitstructure oustr 
WHERE ds.datasetid = dssrc.datasetid AND 
dssrc.sourceid = ou.organisationunitid AND 
ou.organisationunitid = oustr.organisationunitid AND 
oustr.idlevel2 = outmpR.organisationunitid AND 
oustr.idlevel3 = outmpD.organisationunitid AND 
oustr.level = 4  AND 
ds.uid IN('NDcgQeGaJC9') 
ORDER BY region ASC, 
district ASC, 
facility ASC;



// with no idsr 
SELECT 
ous.uidlevel2 as regionuid,
ous.namelevel2 as region, 
ous.uidlevel3 as districtuid,
ous.namelevel3 as district,
ou.name as facility,
ou.uid as facilityuid,
ds.name as dataSetName 
FROM dataset ds
INNER JOIN datasetsource dss ON(dss.datasetid = ds.datasetid)
LEFT JOIN organisationunit ou ON(ou.organisationunitid=dss.sourceid)
LEFT JOIN _orgunitstructure ous ON(ous.organisationunitid=ou.organisationunitid)
WHERE ds.uid = 'NDcgQeGaJC9' AND dss.sourceid NOT IN(select organisationunitid FROM organisationunit WHERE hierarchylevel=4);

SELECT 
ou.organisationunitid as organisationunitid
FROM organisationunit ou

INNER JOIN datasetsource dss ON(dss.sourceid = ou.organisationunitid)
-- LEFT JOIN organisationunit ou ON(ou.organisationunitid=dss.sourceid)
LEFT JOIN dataset ds ON(ds.datasetid=dss.datasetid)
LEFT JOIN _orgunitstructure ous ON(ous.organisationunitid=ou.organisationunitid)
WHERE ds.uid = 'NDcgQeGaJC9' AND dss.sourceid IN(select organisationunitid FROM organisationunit WHERE hierarchylevel=4);


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
