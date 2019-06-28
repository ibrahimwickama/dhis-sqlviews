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
         -- ~from dataset where uid in('TfoI3vTGv1f'))) 
         -- from dataset where uid in('Dp0VF7ssmcH'))) 
         --  from dataset where uid in('zeEp4Xu2GOm','lxYmUYkjLeS','AYmj40WLSo7'))) 
         --  from dataset where uid in('qpcwPcj8D6u','v6wdME3ouXu'))) 
         from dataset where uid in('RG7hkeEv7x3','dtcyjZpWYIJ','uX20zjLKwnb','rtytfWmWpe5','m8qp04vE6di','FyuEje5NeVU','HPliDD2QgHB','QmT1qJVW3mk','MzIN8pjcHDf','DsHpsNC7FHN','KgXoIeNQa3V','L8BlOhMx3gT','aKFn3IjBbzw','bMH05jYfAb6','fv28vbNlRSM','cOQwSuuEXPt'))) 
         and datavalue.periodid in(select periodid from period where startdate between '2014-01-01' and '2014-12-31')) to '/tmp/nsmisDataSetsData2014.csv' with csv header; 