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
where datavalue.dataelementid in(select dataelementid from dataelement where uid in('aDBdmQAABCC','ATqlMZypG0h','Aufg85b0HV3','awbB2k6c4dy','AYf5GkcQsmY','AyH8C2gvB5E','b0l3x8dmBtI','B9q04d4HYUi','BaV5E58U7Xm','BavfH1EX0eV','Bcy0nyOs0l2','Bd7hJVyjOKl','BfvvJ4rSAVf','bhifJusxiKx','bJqHs8SMglY','bMqo3gXzcw7','bOivZpsDaWp','BOlepbvjZSr','bS3zcjh6lFj','bS6WjHzMLDG','BUotpFFSkPQ','BV9x9mZI9AX','bXhMCyRvSPt','c005UxFtJ7p','C0rY5CYwGfo','c5T3R6QjgQG','C7ZjQl0Hh0o','cBJdSWgNoWD','Ccza2fiSCJZ','CE2CxlQh8vx','ce7ATPhE8Iv','cfl4mkxuLhd','CpSomQpOLkU','cvXtRow4aPz','CWXG9lBSI7Y','czV0Bdb4OMs','D34hFrwiUpq','DE53jCGUTme','DEHUXzpw90t','DickWO4DwCH','DjxrS2a3lfs','DoUU3CT1A07','DPLR0aQemYC','DQ8S8oZCz1O','DUlS90FQGNh','dvwAlTIl4gC','DWWNT5pcrWf','e46BBN2LHfp','EdaxsmnoohA','EEeh0pyQISB','egmmeobrQXV','EGXnlhg55mS','eLo4RXcQIi5','ENPBKqXUs0e','eoZtkUbfrmF','epPM7fO8CnH','Es3Tl7QBsah','eTOV59Rcv4F','eVaCxZYmej4','f096Uub9EvE','f4Woa8xSfs5','fC9eHFeDvRG','foIT9ImHcrf','frIrwyff1Go','fVzXb5qPrCp','FZG8H7NAwJ4','gaaV139sE6x','GDd0U2qgYpn','GGpsoh0DX6T','GKtYtPYBg9p','govkT8UYmsA','GpHn91aoEIN','gq90zkgvcg3','gRhW1h7t1pC','GRz0gNpORHZ','gTJBoztW66Z','GWFza9xVa3F','H2R0UdSYRPn','H8pprB9HXYF','hfZEdu3747h','hGY0CnSS9at','hI7erACK9lx','hjLcTJkb2v0','HlyRR1YbsL0','Hn4HdgfPPss','hpAA82LRAte','hTce3dWh9P7','HWZmyu3j4NX','I3RhiDXDEN2','IcU59e21drO','IDKxYQBGMdd','IEMyGwhBTXd','IFxhP0O4k0W','IGbCo0DIFIa','iI43Bmz4lZu','IIZ21DIqy0J','IKy5L8eGI0g','iP9wSaCAZl5','iqt8sB5fP0d','ItgPHCQ1hm6','IuEbVPEGwcN','iWEg1oWWtYx','iWk2izQWxyb','j8oPXDgmOXz','jbZa8J1H2ET','jmiebz1jQDn','JUqoKP2D7vk','Jv5yvUWcOAn','JXJ6K85BwHb','k1oUKgZdyT5','k4euXQXCIwJ','KAiGnZ0qtWd','kksp2roOMCj','kLI4iGDbN3p','kmpnqbSQLBl','Kpa6sheYah0','kSb2DwIAq9A','KsjpX2i1kOJ','Kt3DuTIieoT','KTXcMFWnbrP','KU1FsxbyE9Z','l5RLq10kd5K','LAHplQxtGSP','lcf03qF7UU3','LD4thW4OmXi','linry41rG3v','Lnf095vgahq','lokIbhypbyR','LpSJNv1zMTi','LznB81FWmWm','m1PpRCnZF4l','mbMw23u6zB3','MBWA8jDpuQO','MF5c1sSclKq','mlfh4fgiFhd','MOoQ280yfAP','MUy8R9WmeST','MXYoYFrLHj7','MxzW4N7GvCx','n5gO4gaIVdR','n62iMxfXPty','Nd47QWL1bhQ','NDUUp45yw9g','nEVETOImwlv','newpmtct042','nGed5u8o6gv','NkPkTgPIf5j','NlXYR3IJWCl','NSYWPEpZBuY','nUInmdAMy9t','nvsyLh5KGGu','NwzMLHAFMSC','Ny6pDv4SxrC','ObvdgLG6Rs8','ofcxyuoTp7c','oI7XZUpAcs6','OkEB2a7MKKz','OkyCfGRhsu0','OQpasUg1Tse','OSgKXpAp7Ip','OX5MJtwnEWY','OZ5YGaP6uwa','P3fFpAt1ymr','PCgQhgC8b3i','pD5AGDT8w9h','PejOKtvw5UW','PHN05p61ByJ','PKK90ZfFx2x','PmSZNZHac3t','pqpVKzE951Y','pVTitSjQ3oL','Q2fFmlGkxRN','q3ELeLciuTh','Q7taI8IlcFa','q8evppqXcvI','qfiHWApDYN4','qND1CpK3cO5','QPCEJmazWgv','qwFz1atKnbC','QY2val5hffZ','RaDWHS6x5aX','rAXlXCjOLcp','rB0DvqiPEVA','RJbnIiS8WVo','rjDxrcFIdgN','rklETIV29RG','RTplHDAOVQQ','RvLskJI6lJE','rWSyEfKWMLn','RyNkn76uTJo','RYzjUSOvbFL','s0mcf9xRpFn','s3XgvK2osoQ','S8FzjhBtEPJ','sBl5QAJEqio','SgeSIiqTN2l','sGY3eyJSxVp','SjNEefHqcz4','snAJ4ADu50F','Svz65UuG6dd','SZJ9iGsglqE','SzvgVKO1p8y','T4KvNZ5gAYI','TafY6G2w7hF','tDDF8JJyVap','tIs7rshvixe','tM1ecc8qcsJ','TMBP4HvViHB','TMXGiqmTZ3M','TntmCu0S3SO','totaZnTeUuK','toWFQOyPa15','tPK3QbHeaOS','TTVbKsy0ujj','tvscIxUNNpl','U1KbGaXmjgY','U50UeP68wpD','uA7nNtZE8bv','UCKrT4buBRQ','UDNIfd3mhin','uH8renKbxVS','ulM6a7dZoXM','V3aIXr7ziS9','v6sdLtxvY1K','V7LvxJUIdhR','vav3peUGYbC','vG53aOxAqLe','vKdJGP5FCOi','VnuhMFIlEyK','VPH0M4oc6bs','VSXdXdsSUd3','vYXCiIEJTwU','W0P7aEA3BrK','WAdaCligbNP','WEgRYalIG2c','Wh7OAyeCy0v','wNYeVWYR054','WWeqGGpUjY5','wy1Y4mixjFu','WzdnDeY1Jeq','X0TXADJv7GA','X3pjg8AMk4S','x5cswY9qs7m','X7Eirp6NPtW','X9fBUnQiiQE','xMJkfcHAvJL','xmpGYpXo68t','xVbmMwUk5ug','y1nw8IpRVtF','Y6cNfApg9Kf','yAPwF74EoEe','ycct6V6ksyU','yDg6ZxE0NLg','ykDWUlQzexW','ykShMtNgDB1','yKypqIROIO9','YPYFiirNajc','yqA1CfsfBHQ','ywZy8KscwP9','ZbmHzUkeJbQ','zfhmMA4HeJn','zOhZ2g9cs9R','zqaHIXl6j7c','zUVxutsJ6eR','ZXMe66Tl0Lo')) and datavalue.periodid in(select periodid from period where startdate between '2021-01-01' and '2021-12-31')) to '/tmp/nhs-all.csv' with csv header;


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
where datavalue.dataelementid in(select dataelementid from dataelement where uid in('ipUzQbURGb6','YuNcvA4pciq','eb3jA9Aaa3o','dMvX2C5zE73','dM99TQPUSas','LznB81FWmWm','ruJUrkO4KYq','n54na07l1QX','F4YyZrBCAmB','S9NRLf1s8s3','rbfQX07YePY','mQAMDtF4Jy2','grkhy0SX198','x287d68AXYE','BSUDq9VdJZu','GlUnRRZefsm','qHhWtQW9cgE','GY8GMoMf6XS','LXUTRiAUz8E','hnVAElg9NUK','e2PSlslCWj7','yXgi3eez0RY','oMzMOeaYVtg','UznOyEZZTMH','cpQP3e46z5I','YEPuYfVdM74','H747hAuxODa','PucOlNW8GwB','t88oYi9RhzS','tOJddPimdwn','qG5ykPI4CeR','iWEg1oWWtYx','LKLkYo6I0Ho','aEYe09PwgIz','wTxYKNyTYoQ','yxsmoycfB4g','k84oCUKrqF9','f21Gs8KiiO1','LLWeEXqN0sP','BavfH1EX0eV','rmQlrw86ViK','oRK6lumuFxJ','L2QpntfklTw','xB9bhwmBXKh','GvSsNOfITa2','SoDVHRsVXaG','yuzWxj4N3yO','gjWwcLELdEO','o4eiR3GkzHv','QygZa2G6IFz','eXR1ZnLHVkS','VWCgGc8O2OZ','Nykcf8mlGTc','lGSIti8j3Kk','CcqeSB4Q36V','L32w2TYY0yF','wKzzvmQJb0Z','Enrfop8e1Ym','DRSd275Miyq','buXhgvWQGmQ','vVCjKt3ZUxY','Q6ykv0lLd1j','KI4LGAVPMbW','czDqXv6zFo8','ul4FEEZDQhS','WMNoa7dAYfp','jQQHZwjghqa','b0l3x8dmBtI','DickWO4DwCH','wgUK8uIF9Mz','eeFhPQ3VVW4','dpZQN93VL5X','x6naXiXokby','cqVY4lusFha','mRNJN164ofE','x08Aoxb6YvM','r2IHLT6XF0A','FXmHTOobWWa','d2DobClMCFD','eNdlixwXLgU','gcONnCPOSUx','LdyQW0gerBJ','X7Eirp6NPtW','RGvvSbp8LcE','Bv3q6FhupyJ','OLxyNC3zM93','aKvSOFMkGhy','qW7nFLpxcRc','Ki8hNP9IzT0','idsQ3rxaArP','YAEvFEo4RbB','g0Nb6PglK2l','CpSomQpOLkU','NPn4eFiTlfJ','fPsYMwVmBEU','PjNIzjN8k2i','CyDU323EHbd','sSymaIgbYMk','XsJ2LwL59Ts','ZiK2u39Xsi6','KjZXn9GDGgF','ELqE7MJRNIQ','CxCTnT6fKcn','C7ZjQl0Hh0o','n6MBbUgdKtx','SUD4b5JoRhu','j2d2oaxJeou','ysh4yaUKi1J','lMLWmChDpAe','Sp6R9LzgmnV','THwijFSCxNz','CRmrWQz7cWU','GR1IKuZyIpS','B2eyKOHwhID','V5lIuKUZSbD','ng6EVnhYtqh','eD59Nekc1lr','QFpdg9yl4f5','N8Gc8meGUQ3','JgtfxTM12b1','mbMw23u6zB3','JFCvcU7s8Ej','VESoEuZTrmM','RZRr7fd2Qs5','bCHLti5iUr4','kLxXeXuDzJz','k4AlztI82au','OUIbDbfPuC9','nUnO45pIpG0','JXxrQqkk1hB','ZxGXBjt63EX','lD8XL5pwXsj','pA6tmIlFsRi','vXzWNn0OynW','DE53jCGUTme','TOJyk9QBnyD','ksZFoGqvxqh','NXXdvsgbtXy','oRBwflVplGc','aDBdmQAABCC','KIDGfkiQjv2','EGXnlhg55mS','WqccjpdEzcS','Msp8JK8Sivh','OTD7OhEe7El','xHuh5UbhzjL','tIvq4JHEflo','lmrr7l0lQem','n5gO4gaIVdR','myRhKXcmBZG','izzWsayr71w','BKDxLIkHnIn','DHzSHmXDn0a','Zh8fItne0bY','sK2N6qjUf0B','P2JTF97hJUY','RTplHDAOVQQ','w8BTccRYiEF','OFISrKCOUFN','WwqgkgdJM3K')) and datavalue.periodid in(select periodid from period where startdate between '1967-01-01' and '2021-12-31')) to '/tmp/nhs-all-manual.csv' with csv header;


-- COPY datavalues from dataElement 
-- Replace the uid of the dataset to the real dataset Uid to extract data from
CREATE TABLE tempdatamigration AS
select *
from datavalue
where datavalue.dataelementid in(select dataelementid from dataelement where uid in('aDBdmQAABCC','ATqlMZypG0h','Aufg85b0HV3')) and datavalue.periodid in(select periodid from period where startdate between '2017-01-01' and '2021-12-31');


CREATE TABLE tempdatamigration AS
select *
from datavalue
where datavalue.dataelementid in(select dataelementid from dataelement where uid in('EGXnlhg55mS','n5gO4gaIVdR','C7ZjQl0Hh0o','iWEg1oWWtYx','b0l3x8dmBtI','BavfH1EX0eV','CpSomQpOLkU','aDBdmQAABCC','DickWO4DwCH','DE53jCGUTme','mbMw23u6zB3','RTplHDAOVQQ','LznB81FWmWm','X7Eirp6NPtW','tIvq4JHEflo','e2PSlslCWj7','L2QpntfklTw','P2JTF97hJUY','ng6EVnhYtqh','OFISrKCOUFN','NPn4eFiTlfJ','j2d2oaxJeou','xB9bhwmBXKh','oMzMOeaYVtg','izzWsayr71w','CcqeSB4Q36V','aEYe09PwgIz','bCHLti5iUr4','o4eiR3GkzHv','eXR1ZnLHVkS','t88oYi9RhzS','n6MBbUgdKtx','Nykcf8mlGTc','dM99TQPUSas','dMvX2C5zE73','FXmHTOobWWa','x287d68AXYE','buXhgvWQGmQ','lgQO1IF6sYH','afLtX9t6umP','v6sdLtxvY1K','UG94vEZlfFR','I3570OWVcKN','s32waVG3uNl','PtNo3nBLCUU','ccIfQsrfWeL','lR0Qh9Qn1Hs','NlCs0dqCXZt','OOnL47t1Ltg','UhmzV02I3Fq','J2QRKPggvRC','r9TEXVjoUun','xCl76XUXHb9','Kap8YCTP0TD','VdJ1s1JdEEf','bJJACF7LQbS','xb7awFT0Rdr','GIJNxgIOWrB','Vcsb5hZMjwh','eAE28F7PS5k','iRbbEnKjnlp','bUhNu9er5rD','YLOMISPpUGV','hiZZMpptMkI','qKwCR9afJf7','bmJ1yet2Nrx','VwMS4UJwmme','GnjUGqe5wfK','VcLdFTZVzcE','CT6xZYjGITB','wwjVVeBjIIZ','Ii4775sELPr','aqHA6pRsv3x','zcMgK5tPoCe','GDuLWweBweW','zOTLtI3xfvf','nJeHlTq4a0R','UzHUrxFQ2TB','mzdmfqOfFvZ','jBo4t923i1R','nuhEfW8E99u','oazOp512ShT','TRoamv0YPt3','vEReJHY4PLq','JeIe5FgaGTX','DUWklIz5Nx0','cqZ6qctQWMS','FbaF9bffhLn','iGbAQJ0V68E','DHP2lGgo4kH','LXyTiQjrYNb','CQ5piUG8AYn','aEcdPpCOi3k','Xe1eq44tfJM','vfaY7k6TINl','CIkvEgNE1bz','jzFXTvkx3QV','qvEVH1cFjKz','LJMTQPo0DSV','JEOx1xbUwMs','YPyKz71qARu','OLWz8aiTGYd','SzM6wFwAray','CatBgyzHWBI','emD1Joakmcf','FyB99O0ca0F','bzrQuwS3DOS','ePEFxdsB7V7','XM9F7edeUlc','SAorNBdnTRS','FVfCxl2Ml7R','YA7zwBYo9dq','bO9Bu1APnzq','js6pIjl8zMN','r0hZJZhG70E','knRXsLepKbb','MPiMYXd5UZD','vz8UCwDZAN4','S0cn3ephUSs','W5fjCGMx6in','xg4hVra8Hto','LKtD9BtpDS8','YrRaVJfn05Z','lcOiUC6RdPw','tUALljzC81C','ELaelwlEfBl','pmcCbdUJyjH','p3XSUq4YeqJ','HAOBA8RHyD4','DoUU3CT1A07','ywAfnRQVhWH','uak4LyAFfCc','rJR8cPsgHNY','bSixqzH1A1l','ElR6xpsE15l','yTL2ygbQw4A','BqowH5E3ytQ','weomiUYTeGt','R3iugh61js0','ngmFBL7h0uK','IeoCkHvMXZU','MGxdKEU7qFe','N49KMfFrg5K','heyJnpx5b37','HiDxNFVP73v','QADlNAs6nRf','YWzT5HDfS3H','Jn7lGDo1fk0','EEeh0pyQISB','HWZmyu3j4NX','sKcdWRV7Ciq','NlXYR3IJWCl','qwFz1atKnbC','Kpa6sheYah0','hfNddrgiD7H','Y6xpjIVTsJ7','x5cswY9qs7m','tD3rjw7FqAM','LD4thW4OmXi','X0TXADJv7GA','NwzMLHAFMSC','fVzXb5qPrCp','eUy4jR5Allq','I8jE9QDZDcD','E2TOPkJgNrB','y4viYfbTYQk','REUAShofeMu','durGeWWZBbm','YnGWhzaqRUU','w6DazbRXj5b','cgHxBtI72rw','iqPAEjbfuKz','em5DpFXaAYN','F2lVk8LKCij','oyL2Y7Vjq1M','pbKJdJdtkFT','CZoAkwbhMon','tLSAVyURaE5','ufs1axV3eiB','GfAWZIvTXiW','XftPr0GDYy9','i7DGqGOoqde','ZodxhwBIeIw','wVWGHmCG1fr','LHhBpgg5gZ5','nl46zp71w1d','gX9r9xcyB21','nMaa5x3C9uu','ATjCbOXe7rw','SeAMAZWLWMa','FtcfXjpSs2T','ZUXcqUe9dF8','ciFk92sQJSW','o3PJzN6gEcM','my2jengJTUq','itIVeB2QV3B','b0PNgYe8Z2k','CJYwFrGqs2s','qrV1OyVXoDj','wlEtRUdJqpL','SUD4b5JoRhu','ZxGXBjt63EX','BKDxLIkHnIn','yXgi3eez0RY','yxsmoycfB4g','g0Nb6PglK2l','ELqE7MJRNIQ','WMNoa7dAYfp','QFpdg9yl4f5','sSymaIgbYMk','Msp8JK8Sivh','H747hAuxODa','lmrr7l0lQem','yuzWxj4N3yO','fPsYMwVmBEU','KjZXn9GDGgF','eeFhPQ3VVW4','VWCgGc8O2OZ','YAEvFEo4RbB','Enrfop8e1Ym','mQAMDtF4Jy2','qW7nFLpxcRc','KIDGfkiQjv2','N8Gc8meGUQ3','lD8XL5pwXsj','S9NRLf1s8s3','CRmrWQz7cWU','Q6ykv0lLd1j','aKvSOFMkGhy','BV9x9mZI9AX','bMqo3gXzcw7','WM8erdo2wWk','xrYmEc4LCCo','XJBnuE4vGhI','fDek0QGORKD','IploLzyqB9r','fJcNKNKP6SS','CaPhxP3hIHD','p1sa4Cl6EGI','kK8GeaqANGS','AYf5GkcQsmY','k4euXQXCIwJ','HCvMNSV7mCZ','GXGhiSvce1l','nJwoN4nFb3W','GPzJ4p3s0BL','rBhalg3JWIR','VC0WjZNnwG1','fDaFOElFSnb','qTDe81jQj0G','io854wxbhgU','GT9NOkcMcmn','htiQI32SeNO','tccVHrnVhmN','nVTWLEJOL0F','cTIcwVDI1Xd','uSCVZoedAk2','SpYnH0qhEiw','WctL2xVc25P','QG9qsX5DkwG','ff5XiskMGti','F2RfqIvWWgG','IDKxYQBGMdd','oI7XZUpAcs6','hjLcTJkb2v0','sKMIaOIEtPe','yxoiPqPkFQF','foIT9ImHcrf','cfl4mkxuLhd','vav3peUGYbC','e46BBN2LHfp')) and datavalue.periodid in(select periodid from period where startdate between '2017-01-01' and '2021-12-31');


insert into datavalue (select * from tempdatamigration) ON CONFLICT (dataelementid, periodid, sourceid, categoryoptioncomboid, attributeoptioncomboid) DO NOTHING;



delete from userrolemembers cascade where userid in(select userid from users cascade where username not in('username'));
delete from previouspasswords cascade where userid in(select userid from users cascade where username not in('username'));
delete from users cascade where username not in('username');
