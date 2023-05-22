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




select * from trackedentityinstance where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityattributevalue where value='180601100474-6/KK/2022/32');
select * from trackedentityinstance where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityattributevalue where value='701020701/KK/ /19');

delete from trackedentityattributevalueaudit where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid in('BaDPvl29igI','JWRIt63SGg1'));
delete from trackedentityattributevalue where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid  in('BaDPvl29igI','JWRIt63SGg1'));
delete from programstageinstance where programinstanceid in(select programinstanceid from programinstance where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid in('BaDPvl29igI','JWRIt63SGg1')));
delete from programinstance where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid  in('BaDPvl29igI','JWRIt63SGg1'));
delete from trackedentityprogramowner where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid in('BaDPvl29igI','JWRIt63SGg1')));
delete from trackedentityinstance where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid  in('BaDPvl29igI','JWRIt63SGg1'));



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


UPDATE organisationunit SET name=INITCAP(name);


SELECT table_name FROM information_schema.tables WHERE table_schema='public' AND table_name ilike '%category%';

-- first attempt deletion of validation results table with negative pkey
-- this was not the case 
DELETE from validationresult where validationresultid < 0;

-- deletion of expression where expressionid is negative
-- because expressionid is referenced ad  leftexpressionid and rightexpressionid on validationrule
select expressionid,expression from expression where expressionid<0;

delete from validationruleorganisationunitlevels where validationruleid in(select validationruleid from validationrule where leftexpressionid < 0 or rightexpressionid < 0);
delete from validationnotificationtemplatevalidationrules where validationruleid in(select validationruleid from validationrule where leftexpressionid < 0 or rightexpressionid < 0);
delete from validationrulegroupmembers where validationruleid in(select validationruleid from validationrule where leftexpressionid < 0 or rightexpressionid < 0);
delete from validationresult where validationruleid in(select validationruleid from validationrule where leftexpressionid < 0 or rightexpressionid < 0);
delete from validationrule where leftexpressionid < 0 or rightexpressionid < 0;


delete from predictororgunitlevels where predictorid in(select predictorid from predictor where generatorexpressionid in(select expressionid from expression where expressionid < 0));
delete from predictorgroupmembers where predictorid in(select predictorid from predictor where generatorexpressionid in(select expressionid from expression where expressionid < 0));
delete from predictor where generatorexpressionid in(select expressionid from expression where expressionid < 0);
delete from expression where expressionid < 0;






select validationruleid,name,periodtypeid,operator,leftexpressionid,rightexpressionid from validationrule;

copy(select dataelementid,uid,created from dataelement order by created desc) to '/tmp/dataElements.csv' with csv header; 



-- COPY datavalues from dataElement 
-- Replace the uid of the dataset to the real dataset Uid to extract data from
copy(select 
dataelement.uid as dataelement,
_periodstructure.iso as period,
organisationunit.uid as orgunit,
coc1.uid as categoryoptioncombouid ,
coc2.uid as attributeoptioncombouid,
datavalue.value as value,
datavalue.storedby as storedby,
date(datavalue.lastupdated) as lastupdated,
datavalue.comment as comment,
datavalue.followup as followup,
datavalue.deleted as deleted
from datavalue 
inner join dataelement using(dataelementid) 
inner join _periodstructure on _periodstructure.periodid = datavalue.periodid  
inner join organisationunit on (organisationunit.organisationunitid=datavalue.sourceid) 
inner join categoryoptioncombo coc1 on coc1.categoryoptioncomboid=datavalue.categoryoptioncomboid 
inner join categoryoptioncombo coc2 on coc2.categoryoptioncomboid=datavalue.attributeoptioncomboid 
where datavalue.dataelementid in(select dataelementid from dataelement where uid in('axFPBjVeZDZ','bQm0910XkCg','DLUIChaVy5l','Dmg9srebAFx','FSWzIwR4DAz','Gkssgjdhk9x','K0SyFJH0hs6','K2xse8e7j4G','keJFODvt17l','lXtuWOFZp2W','M8aZ1EEj5b9','Psv1NJPkeEh','RId7UWznBFg','rmJJbyGmb2F','S78PmvGuqjw','Sr44kuHjnWd','U9IzoqwfLnT','UvIDJ0INo4Z','vMBIrgx3k74','XJTb77yzd0M','xOrlRzyu7PH','xTeG2Ebb9QT','ZQYFpy8CmdI','ZYl5cdiaIOE','PGnfMIPDUGx')) and datavalue.periodid in(select periodid from period where startdate between '2016-01-01' and '2022-12-31')) to '/tmp/nhs-all.csv' with csv header;


-- COPY datavalues from dataElement 
-- Replace the uid of the dataset to the real dataset Uid to extract data from
copy(select 
dataelement.uid as dataelement,
_periodstructure.iso as period,
organisationunit.uid as orgunit,
coc1.uid as categoryoptioncombouid ,
coc2.uid as attributeoptioncombouid,
datavalue.value as value,
datavalue.storedby as storedby,
date(datavalue.lastupdated) as lastupdated,
datavalue.comment as comment,
datavalue.followup as followup,
datavalue.deleted as deleted
from datavalue 
inner join dataelement using(dataelementid) 
inner join _periodstructure on _periodstructure.periodid = datavalue.periodid  
inner join organisationunit on (organisationunit.organisationunitid=datavalue.sourceid) 
inner join categoryoptioncombo coc1 on coc1.categoryoptioncomboid=datavalue.categoryoptioncomboid 
inner join categoryoptioncombo coc2 on coc2.categoryoptioncomboid=datavalue.attributeoptioncomboid 
where datavalue.dataelementid in(select dataelementid from dataelement where uid in('aoYQkYyPC7g','B2eyKOHwhID','B8S9G8wGYqc','BdUClwBqB8C','Bv3q6FhupyJ','caiWY5cspj2','COD1cBzHFfQ','cpQP3e46z5I','cqVY4lusFha','CxCTnT6fKcn','czDqXv6zFo8','d50q3OURYDL','DEXrraRgTvS','Df4vS8Fu2PY','dpZQN93VL5X','DRSd275Miyq','eb3jA9Aaa3o','eD59Nekc1lr','Eh8xwI7ghK6','El21tCkmQRk','eNdlixwXLgU','f21Gs8KiiO1','fPsYMwVmBEU','gjWwcLELdEO','GlUnRRZefsm','grkhy0SX198','GY8GMoMf6XS','H747hAuxODa','hnVAElg9NUK','ipUzQbURGb6','JFCvcU7s8Ej','JXxrQqkk1hB','k4AlztI82au','K8JzjwEa0Uz','KI4LGAVPMbW','KjZXn9GDGgF','ksZFoGqvxqh','la6qTfaqfQ7','LdyQW0gerBJ','lGSIti8j3Kk','LKLkYo6I0Ho','llqv48gaqHs','lmrr7l0lQem','m1FmGOtkvzE','mRNJN164ofE','Msp8JK8Sivh','myRhKXcmBZG','n54na07l1QX','nUnO45pIpG0','o80GSjTZbfl','oRBwflVplGc','oRK6lumuFxJ','pA6tmIlFsRi','QFpdg9yl4f5','qG5ykPI4CeR','qHhWtQW9cgE','QygZa2G6IFz','qzHtSoD3ymu','r2IHLT6XF0A','rbfQX07YePY','RGvvSbp8LcE','rmQlrw86ViK','rWJ2wzsxz4S','RZRr7fd2Qs5','sK2N6qjUf0B','SoDVHRsVXaG','Sp6R9LzgmnV','sSymaIgbYMk','SVow9wHNjAW','THwijFSCxNz','TOVig1SH5BE','tOw4k9BxHXS','U64mBtEnEBN','ul4FEEZDQhS','VESoEuZTrmM','w8BTccRYiEF','wgUK8uIF9Mz','wKzzvmQJb0Z','WqccjpdEzcS','wTxYKNyTYoQ','WwqgkgdJM3K','x08Aoxb6YvM','X3XasjeiMZA','x6naXiXokby','xHuh5UbhzjL','YaMAeaKHxeB','YEPuYfVdM74','yn0dcRNO6uQ','ysh4yaUKi1J','YuNcvA4pciq','yuzWxj4N3yO','yz3kGsLCHFP','Zh8fItne0bY','ZiK2u39Xsi6')) and datavalue.periodid in(select periodid from period where startdate between '1967-01-01' and '2021-12-31')) to '/tmp/nhs-all-manual.csv' with csv header;


-- COPY datavalues from dataElement 
-- Replace the uid of the dataset to the real dataset Uid to extract data from
CREATE TABLE tempdatamigration AS
select *
from datavalue
where datavalue.dataelementid in(select dataelementid from datasetelement where datasetid in(select datasetid from dataset where uid in('NDcgQeGaJC9'))) and datavalue.periodid in(select periodid from period where startdate between '2022-05-16' and '2023-01-29');


CREATE TABLE tempdatamigration AS
select *
from datavalue
where datavalue.dataelementid in(select dataelementid from dataelement where uid in('EGXnlhg55mS','n5gO4gaIVdR','C7ZjQl0Hh0o','iWEg1oWWtYx','b0l3x8dmBtI','BavfH1EX0eV','CpSomQpOLkU','aDBdmQAABCC','DickWO4DwCH','DE53jCGUTme','mbMw23u6zB3','RTplHDAOVQQ','LznB81FWmWm','X7Eirp6NPtW','tIvq4JHEflo','e2PSlslCWj7','L2QpntfklTw','P2JTF97hJUY','ng6EVnhYtqh','OFISrKCOUFN','NPn4eFiTlfJ','j2d2oaxJeou','xB9bhwmBXKh','oMzMOeaYVtg','izzWsayr71w','CcqeSB4Q36V','aEYe09PwgIz','bCHLti5iUr4','o4eiR3GkzHv','eXR1ZnLHVkS','t88oYi9RhzS','n6MBbUgdKtx','Nykcf8mlGTc','dM99TQPUSas','dMvX2C5zE73','FXmHTOobWWa','x287d68AXYE','buXhgvWQGmQ','lgQO1IF6sYH','afLtX9t6umP','v6sdLtxvY1K','UG94vEZlfFR','I3570OWVcKN','s32waVG3uNl','PtNo3nBLCUU','ccIfQsrfWeL','lR0Qh9Qn1Hs','NlCs0dqCXZt','OOnL47t1Ltg','UhmzV02I3Fq','J2QRKPggvRC','r9TEXVjoUun','xCl76XUXHb9','Kap8YCTP0TD','VdJ1s1JdEEf','bJJACF7LQbS','xb7awFT0Rdr','GIJNxgIOWrB','Vcsb5hZMjwh','eAE28F7PS5k','iRbbEnKjnlp','bUhNu9er5rD','YLOMISPpUGV','hiZZMpptMkI','qKwCR9afJf7','bmJ1yet2Nrx','VwMS4UJwmme','GnjUGqe5wfK','VcLdFTZVzcE','CT6xZYjGITB','wwjVVeBjIIZ','Ii4775sELPr','aqHA6pRsv3x','zcMgK5tPoCe','GDuLWweBweW','zOTLtI3xfvf','nJeHlTq4a0R','UzHUrxFQ2TB','mzdmfqOfFvZ','jBo4t923i1R','nuhEfW8E99u','oazOp512ShT','TRoamv0YPt3','vEReJHY4PLq','JeIe5FgaGTX','DUWklIz5Nx0','cqZ6qctQWMS','FbaF9bffhLn','iGbAQJ0V68E','DHP2lGgo4kH','LXyTiQjrYNb','CQ5piUG8AYn','aEcdPpCOi3k','Xe1eq44tfJM','vfaY7k6TINl','CIkvEgNE1bz','jzFXTvkx3QV','qvEVH1cFjKz','LJMTQPo0DSV','JEOx1xbUwMs','YPyKz71qARu','OLWz8aiTGYd','SzM6wFwAray','CatBgyzHWBI','emD1Joakmcf','FyB99O0ca0F','bzrQuwS3DOS','ePEFxdsB7V7','XM9F7edeUlc','SAorNBdnTRS','FVfCxl2Ml7R','YA7zwBYo9dq','bO9Bu1APnzq','js6pIjl8zMN','r0hZJZhG70E','knRXsLepKbb','MPiMYXd5UZD','vz8UCwDZAN4','S0cn3ephUSs','W5fjCGMx6in','xg4hVra8Hto','LKtD9BtpDS8','YrRaVJfn05Z','lcOiUC6RdPw','tUALljzC81C','ELaelwlEfBl','pmcCbdUJyjH','p3XSUq4YeqJ','HAOBA8RHyD4','DoUU3CT1A07','ywAfnRQVhWH','uak4LyAFfCc','rJR8cPsgHNY','bSixqzH1A1l','ElR6xpsE15l','yTL2ygbQw4A','BqowH5E3ytQ','weomiUYTeGt','R3iugh61js0','ngmFBL7h0uK','IeoCkHvMXZU','MGxdKEU7qFe','N49KMfFrg5K','heyJnpx5b37','HiDxNFVP73v','QADlNAs6nRf','YWzT5HDfS3H','Jn7lGDo1fk0','EEeh0pyQISB','HWZmyu3j4NX','sKcdWRV7Ciq','NlXYR3IJWCl','qwFz1atKnbC','Kpa6sheYah0','hfNddrgiD7H','Y6xpjIVTsJ7','x5cswY9qs7m','tD3rjw7FqAM','LD4thW4OmXi','X0TXADJv7GA','NwzMLHAFMSC','fVzXb5qPrCp','eUy4jR5Allq','I8jE9QDZDcD','E2TOPkJgNrB','y4viYfbTYQk','REUAShofeMu','durGeWWZBbm','YnGWhzaqRUU','w6DazbRXj5b','cgHxBtI72rw','iqPAEjbfuKz','em5DpFXaAYN','F2lVk8LKCij','oyL2Y7Vjq1M','pbKJdJdtkFT','CZoAkwbhMon','tLSAVyURaE5','ufs1axV3eiB','GfAWZIvTXiW','XftPr0GDYy9','i7DGqGOoqde','ZodxhwBIeIw','wVWGHmCG1fr','LHhBpgg5gZ5','nl46zp71w1d','gX9r9xcyB21','nMaa5x3C9uu','ATjCbOXe7rw','SeAMAZWLWMa','FtcfXjpSs2T','ZUXcqUe9dF8','ciFk92sQJSW','o3PJzN6gEcM','my2jengJTUq','itIVeB2QV3B','b0PNgYe8Z2k','CJYwFrGqs2s','qrV1OyVXoDj','wlEtRUdJqpL','SUD4b5JoRhu','ZxGXBjt63EX','BKDxLIkHnIn','yXgi3eez0RY','yxsmoycfB4g','g0Nb6PglK2l','ELqE7MJRNIQ','WMNoa7dAYfp','QFpdg9yl4f5','sSymaIgbYMk','Msp8JK8Sivh','H747hAuxODa','lmrr7l0lQem','yuzWxj4N3yO','fPsYMwVmBEU','KjZXn9GDGgF','eeFhPQ3VVW4','VWCgGc8O2OZ','YAEvFEo4RbB','Enrfop8e1Ym','mQAMDtF4Jy2','qW7nFLpxcRc','KIDGfkiQjv2','N8Gc8meGUQ3','lD8XL5pwXsj','S9NRLf1s8s3','CRmrWQz7cWU','Q6ykv0lLd1j','aKvSOFMkGhy','BV9x9mZI9AX','bMqo3gXzcw7','WM8erdo2wWk','xrYmEc4LCCo','XJBnuE4vGhI','fDek0QGORKD','IploLzyqB9r','fJcNKNKP6SS','CaPhxP3hIHD','p1sa4Cl6EGI','kK8GeaqANGS','AYf5GkcQsmY','k4euXQXCIwJ','HCvMNSV7mCZ','GXGhiSvce1l','nJwoN4nFb3W','GPzJ4p3s0BL','rBhalg3JWIR','VC0WjZNnwG1','fDaFOElFSnb','qTDe81jQj0G','io854wxbhgU','GT9NOkcMcmn','htiQI32SeNO','tccVHrnVhmN','nVTWLEJOL0F','cTIcwVDI1Xd','uSCVZoedAk2','SpYnH0qhEiw','WctL2xVc25P','QG9qsX5DkwG','ff5XiskMGti','F2RfqIvWWgG','IDKxYQBGMdd','oI7XZUpAcs6','hjLcTJkb2v0','sKMIaOIEtPe','yxoiPqPkFQF','foIT9ImHcrf','cfl4mkxuLhd','vav3peUGYbC','e46BBN2LHfp')) and datavalue.periodid in(select periodid from period where startdate between '2017-01-01' and '2021-12-31');


insert into datavalue (select * from tempdatamigration) ON CONFLICT (dataelementid, periodid, sourceid, categoryoptioncomboid, attributeoptioncomboid) DO NOTHING;



delete from userrolemembers cascade where userid in(select userinfoid from userinfo cascade where username ilike '%ffp_%');
delete from previouspasswords cascade where userid in(select userinfoid from userinfo cascade where username ilike '%ffp_%');
delete from userdatavieworgunits cascade where userinfoid in(select userinfoid from userinfo cascade where username ilike '%ffp_%');
delete from usergroupmembers cascade where userid in(select userinfoid from userinfo cascade where username ilike '%ffp_%');
delete from usermembership cascade where userinfoid in(select userinfoid from userinfo cascade where username ilike '%ffp_%');
delete from userinfo cascade where username ilike '%ffp_%';


= UPDATE userdatavieworgunits SET organisationunitid = (SELECT organisationunitid FROM usermembership WHERE userinfoid IN(SELECT userinfoid FROM userinfo WHERE uid='')) AND userinfoid = (SELECT userinfoid FROM userinfo WHERE uid=''));
="UPDATE userdatavieworgunits SET organisationunitid = (SELECT organisationunitid FROM usermembership WHERE userinfoid IN(SELECT userinfoid FROM userinfo WHERE uid='"&A2&"')) AND userinfoid = (SELECT userinfoid FROM userinfo WHERE uid='"&A2&"'));"

copy(
  select userid from users
  ) to '/tmp/usersid.csv' with csv header;

="INSERT INTO userrolemembers VALUES("&A2&", 522566101);"







delete from trackedentitydatavalueaudit where programstageinstanceid in(select programstageinstanceid from  programstageinstance where programstageid in(select programstageid from programstage where programid in(select programid from program)) and organisationunitid in(select organisationunitid from organisationunit));
delete from trackedentitydatavalue where programstageinstanceid in(select programstageinstanceid from  programstageinstance where programstageid in(select programstageid from programstage where programid in(select programid from program)) and organisationunitid in(select organisationunitid from organisationunit));


delete from trackedentityattributevalue where trackedentityinstanceid in(select trackedentityinstanceid from programinstance where programid in(select programid from program));
delete from programmessage_phonenumbers where programmessagephonenumberid in(select id from programmessage where programstageinstanceid in(select programstageinstanceid from programstageinstance where programstageid in(select programstageid from programstage where programid in(select programid from program ))));
delete from programmessage_deliverychannels where programmessagedeliverychannelsid in(select id from programmessage where programstageinstanceid in(select programstageinstanceid from programstageinstance where programstageid in(select programstageid from programstage where programid in(select programid from program ))));
delete from programmessage_emailaddresses where programmessageemailaddressid in(select id from programmessage where programstageinstanceid in(select programstageinstanceid from programstageinstance where programstageid in(select programstageid from programstage where programid in(select programid from program ))));
delete from programmessage where programstageinstanceid in(select programstageinstanceid from programstageinstance where programstageid in(select programstageid from programstage where programid in(select programid from program )));

delete from trackedentitydatavalueaudit where programstageinstanceid in(select programstageinstanceid from programstageinstance where programstageid in(select programstageid from programstage where programid in(select programid from program )));
delete from programstageinstance where programstageid in(select programstageid from programstage where programid in(select programid from program ));
delete from programinstance where programid in(select programid from program );
delete from trackedentityinstance where trackedentityinstanceid in(select trackedentityinstanceid from programinstance where programid in(select programid from program ));





delete from programstageinstance where programstageid in(select programstageid from programstage where programid in(select programid from program)) and organisationunitid in(select organisationunitid from organisationunit);
-- delete organisationunitid on programstageinstance table
delete from programstageinstance where organisationunitid in(select organisationunitid from organisationunit);
-- delete trackedentitydatavalue, trackedentitydatavalueaudit with dependency to organisationunits to be deleted
delete from trackedentitydatavalueaudit where programstageinstanceid in(select programstageinstanceid from  programstageinstance where organisationunitid in(select organisationunitid from organisationunit));
delete from trackedentityattributevalue;
-- delete organisationunitid on trackedentityinstance table
delete from trackedentityprogramowner where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance);
delete from trackedentityattributevalueaudit where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance);
delete from relationship where relationshipid in(select relationshipid from relationshipitem where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance));
delete from relationshipitem where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance);
truncate relationship cascade;
delete from trackedentityinstance where organisationunitid in(select organisationunitid from organisationunit);
delete from programinstance where organisationunitid in(select organisationunitid from organisationunit);





select user0_.userinfoid as userinfo1_231_, user0_.uid as uid2_231_, user0_.code as code3_231_, user0_.lastUpdated as lastupda4_231_, user0_.created as created5_231_, user0_.surname as surname6_231_, user0_.firstName as firstnam7_231_, user0_.email as email8_231_, user0_.phoneNumber as phonenum9_231_, user0_.jobTitle as jobtitl10_231_, user0_.introduction as introdu11_231_, user0_.gender as gender12_231_, user0_.birthday as birthda13_231_, user0_.nationality as nationa14_231_, user0_.employer as employe15_231_, user0_.education as educati16_231_, user0_.interests as interes17_231_, user0_.languages as languag18_231_, user0_.welcomeMessage as welcome19_231_, user0_.lastCheckedInterpretations as lastche20_231_, user0_.whatsApp as whatsap21_231_, user0_.skype as skype22_231_, user0_.facebookMessenger as faceboo23_231_, user0_.telegram as telegra24_231_, user0_.twitter as twitter25_231_, user0_.lastupdatedby as lastupd26_231_, user0_.avatar as avatar27_231_, user0_.dataviewmaxorgunitlevel as datavie28_231_, user0_.attributeValues as attribu29_231_, user0_.uuid as uuid30_231_, user0_.creatoruserid as creator31_231_, user0_.username as usernam32_231_, user0_.password as passwor33_231_, user0_.secret as secret34_231_, user0_.twoFA as twofa35_231_, user0_.externalauth as externa36_231_, user0_.openid as openid37_231_, user0_.ldapid as ldapid38_231_, user0_.passwordLastUpdated as passwor39_231_, user0_.lastLogin as lastlog40_231_, user0_.idToken as idtoken41_231_, user0_.restoreToken as restore42_231_, user0_.restoreExpiry as restore43_231_, user0_.selfRegistered as selfreg44_231_, user0_.invitation as invitat45_231_, user0_.disabled as disable46_231_, user0_.accountExpiry as account47_231_ from userinfo user0_ where user0_.username='ibrahimwickama' limit 1;

select distinct 
user0_.userinfoid as userinfo1_231_, 
user0_.uid as uid2_231_, 
user0_.code as code3_231_, 
user0_.lastUpdated as lastupda4_231_, 
user0_.created as created5_231_, 
user0_.surname as surname6_231_, 
user0_.firstName as firstnam7_231_, 
user0_.email as email8_231_, 
user0_.phoneNumber as phonenum9_231_, 
user0_.jobTitle as jobtitl10_231_, 
user0_.introduction as introdu11_231_, 
user0_.gender as gender12_231_, 
user0_.birthday as birthda13_231_, 
user0_.nationality as nationa14_231_, 
user0_.employer as employe15_231_, 
user0_.education as educati16_231_, 
user0_.interests as interes17_231_, 
user0_.languages as languag18_231_, 
user0_.welcomeMessage as welcome19_231_, 
user0_.lastCheckedInterpretations as lastche20_231_, 
user0_.whatsApp as whatsap21_231_, 
user0_.skype as skype22_231_, 
user0_.facebookMessenger as faceboo23_231_, 
user0_.telegram as telegra24_231_, 
user0_.twitter as twitter25_231_, 
user0_.lastupdatedby as lastupd26_231_, 
user0_.avatar as avatar27_231_, 
user0_.dataviewmaxorgunitlevel as datavie28_231_, 
user0_.attributeValues as attribu29_231_, 
user0_.uuid as uuid30_231_, 
user0_.creatoruserid as creator31_231_, 
user0_.username as usernam32_231_, 
user0_.password as passwor33_231_, 
user0_.secret as secret34_231_, 
user0_.twoFA as twofa35_231_, 
user0_.externalauth as externa36_231_, 
user0_.openid as openid37_231_, 
user0_.ldapid as ldapid38_231_, 
user0_.passwordLastUpdated as passwor39_231_, 
user0_.lastLogin as lastlog40_231_, 
user0_.idToken as idtoken41_231_, 
user0_.restoreToken as restore42_231_, 
user0_.restoreExpiry as restore43_231_, 
user0_.selfRegistered as selfreg44_231_, 
user0_.invitation as invitat45_231_, 
user0_.disabled as disable46_231_, 
user0_.accountExpiry as account47_231_ 
from 
userinfo user0_ 
left outer join usergroupmembers groups1_ on user0_.userinfoid=groups1_.userid 
left outer join usergroup usergroup2_ on groups1_.usergroupid=usergroup2_.usergroupid 
order by user0_.surname, user0_.firstName



trackedentityprogramowner
delete from trackedentityprogramowner where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where lastupdatedby in (select userinfoid from userinfo where username is null));
delete from trackedentityattributevalue where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where lastupdatedby in (select userinfoid from userinfo where username is null));
delete from trackedentityattributevalueaudit where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where lastupdatedby in (select userinfoid from userinfo where username is null));
delete from trackedentityinstance where lastupdatedby in (select userinfoid from userinfo where username is null);
delete from userkeyjsonvalue where userid in (select userinfoid from userinfo where username is null);
delete from userdatavieworgunits where userinfoid in (select userinfoid from userinfo where username is null);
delete from usergroupmembers where userid in (select userinfoid from userinfo where username is null);
delete from usermembership where userinfoid in (select userinfoid from userinfo where username is null);

delete from messageconversation_usermessages where usermessageid in (select usermessageid from usermessage where userid in (select userinfoid from userinfo where username is null));
delete from usermessage where userid in (select userinfoid from userinfo where username is null);
delete from userteisearchorgunits where userinfoid in (select userinfoid from userinfo where username is null);
delete from usersetting where userinfoid in (select userinfoid from userinfo where username is null);
delete from dashboard_items where dashboardid in (select dashboardid from dashboard where userid in (select userinfoid from userinfo where username is null));
delete from dashboard where userid in (select userinfoid from userinfo where username is null);
delete from programruleaction where programruleid in (select programruleid from programrule where lastupdatedby in (select userinfoid from userinfo where username is null));
delete from programrule where lastupdatedby in (select userinfoid from userinfo where username is null);
delete from userinfo cascade where username is null;


delete from datavalue where dataelementid in (select datalementid from dataelement where uid in('LdyQW0gerBJ','QFpdg9yl4f5','sSymaIgbYMk','Msp8JK8Sivh','H747hAuxODa','lmrr7l0lQem','yuzWxj4N3yO','fPsYMwVmBEU','KjZXn9GDGgF')) and attributeoptioncomboid=181744345;