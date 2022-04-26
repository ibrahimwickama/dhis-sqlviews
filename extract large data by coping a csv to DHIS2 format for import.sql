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
         from dataset where uid in('RpeHQ2saIRg','mU6qzGINdKw','cBPkl0M6T9I','Pw3c2BcqbQ5','xewWZMYbqYc','lxYmUYkjLeS','cap79mdf6Co','qpcwPcj8D6u','v6wdME3ouXu','ZOvFj2vtlor','Dp0VF7ssmcH','ExX34Bpv0qN','f8QXtGOYdbb'))) 
         and datavalue.periodid in(select periodid from period where startdate between '2021-10-01' and '2021-12-31')) to '/tmp/hmisportalData2021Q4.csv' with csv header; 