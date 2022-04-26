

SELECT ds.datasetid as dsid,ds.uid as dsuid,ds.name as dsname,ou.organisationunitid as ouid,ou.uid as ouuid,ou.name as ouname 
FROM datasetsource dsource
INNER JOIN organisationunit ou on ou.organisationunitid = dsource.sourceid
LEFT JOIN dataset ds on ds.datasetid = dsource.datasetid LIMIT 10;

-- get all un-assigned orgunits to dataset 
select organisationunitid
from organisationunit 
where organisationunitid NOT IN(SELECT sourceid from datasetsource where datasetid in(select datasetid from dataset where uid='u0bHSwROTdt'));


// event BaA4ayPFig1


select 
d.uid as "Region UID",
d.name as "Region Name",
c.name as "District Name",
c.uid as "District UID",
b.closeddate as "Closed Date",
b.name as "Facility Name",
b.shortname as "Facility shortname",
b.code as "Facility code",
b.uid as "Facility UID",
g."Ownership" as "Ownerships",
g."Type",
count(ds.datasetid) as "Number of Assigned Datasets" 
from _orgunitstructure a 
left outer join organisationunit b on a.organisationunitid = b.organisationunitid 
left outer join organisationunit c on a.idlevel3 = c.organisationunitid 
inner join _organisationunitgroupsetstructure g on g.organisationunitid = b.organisationunitid 
left outer join organisationunit d on a.idlevel2 = d.organisationunitid 
full outer join datasetsource ds on a.organisationunitid = ds.sourceid 
where a.level = 4 and b.closeddate is not null group by "Region UID", "Region Name", "District Name", "District UID", "Closed Date", "Facility Name", "Facility shortname","Facility code", "Facility UID","Ownerships", "Type" order by "Region Name", "District Name", "Facility Name" 




DELETE FROM datasetsource where sourceid in(select organisationunitid from organisationunit where hierarchylevel = 4 and closeddate is not null);
docker exec -it hmismain-db psql -U dhismain -a dhis -c 'DELETE FROM datasetsource where sourceid in(select organisationunitid from organisationunit where hierarchylevel = 4 and closeddate is not null);'



-- check on completedatasetregistration table 
-- completedatasetregistration
select * from completedatasetregistration where completed IS NOT TRUE limit 20;
-- check completenesstarget 
select * from completenesstarget limit 10;






select none(ax."uochSI2xLGI") as value,ax."monthly" from analytics_event_mvc0jfu9ua2 as ax where ax."monthly" in ('202201', '202202') and (ax."uidlevel3" = 'vo788oc0NEn' ) and ax."yearly" in ('2022') group by ax."monthly";


select count(*) from datavalue where value= '1234' and storedby='ussd'; periodid=;




-- Replace the uid of the dataset to the real dataset Uid to extract data from
copy(select dataelement.uid as dataelement,
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
from datavalue inner join dataelement using(dataelementid) 
inner join _periodstructure on _periodstructure.periodid = datavalue.periodid  
inner join organisationunit on (organisationunit.organisationunitid=datavalue.sourceid) 
inner join categoryoptioncombo coc1 on coc1.categoryoptioncomboid=datavalue.categoryoptioncomboid 
inner join categoryoptioncombo coc2 on coc2.categoryoptioncomboid=datavalue.attributeoptioncomboid 
where datavalue.dataelementid 
  in(select dataelementid 
     from datasetelement 
     where datasetid 
       in(select datasetid 
         from dataset where uid in('Pw3c2BcqbQ5'))) 
         and datavalue.periodid in(select periodid from period where startdate between '2021-07-01' and '2021-09-30')) to '/tmp/anchmisportalData2021Q3.csv' with csv header;






-- batch1
copy(select dataelement.uid as dataelement,
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
from datavalue inner join dataelement using(dataelementid) 
inner join _periodstructure on _periodstructure.periodid = datavalue.periodid  
inner join organisationunit on (organisationunit.organisationunitid=datavalue.sourceid) 
inner join categoryoptioncombo coc1 on coc1.categoryoptioncomboid=datavalue.categoryoptioncomboid 
inner join categoryoptioncombo coc2 on coc2.categoryoptioncomboid=datavalue.attributeoptioncomboid 
where datavalue.dataelementid 
  in(select dataelementid 
     from datasetelement 
     where datasetid 
       in(select datasetid 
         from dataset where uid in('RpeHQ2saIRg'))) 
         and datavalue.periodid in(select periodid from period where startdate between '2021-01-01' and '2021-09-30')) to '/tmp/batch1.csv' with csv header; 

-- batch2
copy(select dataelement.uid as dataelement,
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
from datavalue inner join dataelement using(dataelementid) 
inner join _periodstructure on _periodstructure.periodid = datavalue.periodid  
inner join organisationunit on (organisationunit.organisationunitid=datavalue.sourceid) 
inner join categoryoptioncombo coc1 on coc1.categoryoptioncomboid=datavalue.categoryoptioncomboid 
inner join categoryoptioncombo coc2 on coc2.categoryoptioncomboid=datavalue.attributeoptioncomboid 
where datavalue.dataelementid 
  in(select dataelementid 
     from datasetelement 
     where datasetid 
       in(select datasetid 
         from dataset where uid in('mU6qzGINdKw'))) 
         and datavalue.periodid in(select periodid from period where startdate between '2021-01-01' and '2021-09-30')) to '/tmp/batch2.csv' with csv header; 

-- batch3
copy(select dataelement.uid as dataelement,
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
from datavalue inner join dataelement using(dataelementid) 
inner join _periodstructure on _periodstructure.periodid = datavalue.periodid  
inner join organisationunit on (organisationunit.organisationunitid=datavalue.sourceid) 
inner join categoryoptioncombo coc1 on coc1.categoryoptioncomboid=datavalue.categoryoptioncomboid 
inner join categoryoptioncombo coc2 on coc2.categoryoptioncomboid=datavalue.attributeoptioncomboid 
where datavalue.dataelementid 
  in(select dataelementid 
     from datasetelement 
     where datasetid 
       in(select datasetid 
         from dataset where uid in('cBPkl0M6T9I'))) 
         and datavalue.periodid in(select periodid from period where startdate between '2021-01-01' and '2021-09-30')) to '/tmp/batch3.csv' with csv header; 

-- batch4
copy(select dataelement.uid as dataelement,
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
from datavalue inner join dataelement using(dataelementid) 
inner join _periodstructure on _periodstructure.periodid = datavalue.periodid  
inner join organisationunit on (organisationunit.organisationunitid=datavalue.sourceid) 
inner join categoryoptioncombo coc1 on coc1.categoryoptioncomboid=datavalue.categoryoptioncomboid 
inner join categoryoptioncombo coc2 on coc2.categoryoptioncomboid=datavalue.attributeoptioncomboid 
where datavalue.dataelementid 
  in(select dataelementid 
     from datasetelement 
     where datasetid 
       in(select datasetid 
         from dataset where uid in('Pw3c2BcqbQ5'))) 
         and datavalue.periodid in(select periodid from period where startdate between '2021-01-01' and '2021-09-30')) to '/tmp/batch4.csv' with csv header; 

-- batch5
copy(select dataelement.uid as dataelement,
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
from datavalue inner join dataelement using(dataelementid) 
inner join _periodstructure on _periodstructure.periodid = datavalue.periodid  
inner join organisationunit on (organisationunit.organisationunitid=datavalue.sourceid) 
inner join categoryoptioncombo coc1 on coc1.categoryoptioncomboid=datavalue.categoryoptioncomboid 
inner join categoryoptioncombo coc2 on coc2.categoryoptioncomboid=datavalue.attributeoptioncomboid 
where datavalue.dataelementid 
  in(select dataelementid 
     from datasetelement 
     where datasetid 
       in(select datasetid 
         from dataset where uid in('xewWZMYbqYc'))) 
         and datavalue.periodid in(select periodid from period where startdate between '2021-01-01' and '2021-09-30')) to '/tmp/batch5.csv' with csv header; 

-- batch6
copy(select dataelement.uid as dataelement,
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
from datavalue inner join dataelement using(dataelementid) 
inner join _periodstructure on _periodstructure.periodid = datavalue.periodid  
inner join organisationunit on (organisationunit.organisationunitid=datavalue.sourceid) 
inner join categoryoptioncombo coc1 on coc1.categoryoptioncomboid=datavalue.categoryoptioncomboid 
inner join categoryoptioncombo coc2 on coc2.categoryoptioncomboid=datavalue.attributeoptioncomboid 
where datavalue.dataelementid 
  in(select dataelementid 
     from datasetelement 
     where datasetid 
       in(select datasetid 
         from dataset where uid in('lxYmUYkjLeS','cap79mdf6Co','qpcwPcj8D6u','v6wdME3ouXu','ZOvFj2vtlor','Dp0VF7ssmcH','ExX34Bpv0qN'))) 
         and datavalue.periodid in(select periodid from period where startdate between '2021-01-01' and '2021-09-30')) to '/tmp/batch6.csv' with csv header; 

--batch7
copy(select dataelement.uid as dataelement,
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
from datavalue inner join dataelement using(dataelementid) 
inner join _periodstructure on _periodstructure.periodid = datavalue.periodid  
inner join organisationunit on (organisationunit.organisationunitid=datavalue.sourceid) 
inner join categoryoptioncombo coc1 on coc1.categoryoptioncomboid=datavalue.categoryoptioncomboid 
inner join categoryoptioncombo coc2 on coc2.categoryoptioncomboid=datavalue.attributeoptioncomboid 
where datavalue.dataelementid 
  in(select dataelementid 
     from datasetelement 
     where datasetid 
       in(select datasetid 
         from dataset where uid in('f8QXtGOYdbb'))) 
         and datavalue.periodid in(select periodid from period where startdate between '2021-01-01' and '2021-12-31')) to '/tmp/batch7.csv' with csv header; 

--batch8
copy(select dataelement.uid as dataelement,
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
from datavalue inner join dataelement using(dataelementid) 
inner join _periodstructure on _periodstructure.periodid = datavalue.periodid  
inner join organisationunit on (organisationunit.organisationunitid=datavalue.sourceid) 
inner join categoryoptioncombo coc1 on coc1.categoryoptioncomboid=datavalue.categoryoptioncomboid 
inner join categoryoptioncombo coc2 on coc2.categoryoptioncomboid=datavalue.attributeoptioncomboid 
where datavalue.dataelementid 
  in(select dataelementid 
     from datasetelement 
     where datasetid 
       in(select datasetid 
         from dataset where uid in('JNSXD4t9Jrw'))) 
         and datavalue.periodid in(select periodid from period where startdate between '2021-01-01' and '2021-12-31')) to '/tmp/batch8.csv' with csv header; 



SELECT table_schema,table_name,column_name,column_default,data_type,character_maximum_length FROM information_schema.columns WHERE table_schema = 'public' AND data_type = 'integer' ORDER BY table_name;


DELETE from datavalue WHERE sourceid=4469951;
DELETE from completedatasetregistration WHERE sourceid=4469951;
DELETE from datasetsource WHERE sourceid=4469951;
DELETE from orgunitgroupmembers WHERE organisationunitid=4469951;
DELETE from program_organisationunits WHERE organisationunitid=4469951;
DELETE from organisationunit WHERE organisationunitid=4469951;