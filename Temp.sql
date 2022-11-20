

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
         from dataset where uid in('FLR8w9ntW1R'))) 
         and datavalue.periodid in(select periodid from period where startdate between '2012-01-01' and '2023-12-31')) to '/tmp/population.csv' with csv header;




SELECT table_schema,table_name,column_name,column_default,data_type,character_maximum_length FROM information_schema.columns WHERE table_schema = 'public' AND data_type = 'integer' ORDER BY table_name;


DELETE from datavalue WHERE sourceid=4469951;
DELETE from completedatasetregistration WHERE sourceid=4469951;
DELETE from datasetsource WHERE sourceid=4469951;
DELETE from orgunitgroupmembers WHERE organisationunitid=4469951;
DELETE from program_organisationunits WHERE organisationunitid=4469951;
DELETE from organisationunit WHERE organisationunitid=4469951;




CREATE OR REPLACE VIEW persondetails AS
 SELECT userinfo.userinfoid,
    users.username,
    users.lastlogin,
    users.disabled,
    users.passwordlastupdated,
    userinfo.surname,
    userinfo.firstname,
    userinfo.email,
    userinfo.phonenumber,
    userinfo.uid,
    userinfo.code,
    userinfo.lastupdated,
    userinfo.jobtitle,
    userinfo.lastcheckedinterpretations,
    userinfo.introduction,
    userinfo.gender,
    userinfo.birthday,
    userinfo.nationality,
    userinfo.employer,
    userinfo.education,
    userinfo.interests,
    userinfo.languages,
    userinfo.created,
    ( SELECT replace(replace(replace((ARRAY( SELECT userrole.name
                   FROM userrolemembers
                     JOIN userrole ON userrole.userroleid = userrolemembers.userroleid
                  WHERE userrolemembers.userid = users.userid))::text, '{'::text, ''::text), '}'::text, ''::text), '"'::text, ''::text) AS replace) AS userroles,
    ( SELECT replace(replace(replace((ARRAY( SELECT organisationunit.name
                   FROM usermembership
                     JOIN organisationunit ON organisationunit.organisationunitid = usermembership.organisationunitid
                  WHERE usermembership.userinfoid = users.userid))::text, '{'::text, ''::text), '}'::text, ''::text), '"'::text, ''::text) AS replace) AS userorganisationunits,
    ( SELECT replace(replace(replace((ARRAY( SELECT organisationunit.uid
                   FROM usermembership
                     JOIN organisationunit ON organisationunit.organisationunitid = usermembership.organisationunitid
                  WHERE usermembership.userinfoid = users.userid))::text, '{'::text, ''::text), '}'::text, ''::text), '"'::text, ''::text) AS replace) AS userorganisationunitsuid,
    creatoruserinfo.surname AS creatorsurname,
    creatoruserinfo.firstname AS creatorfirstname,
    creatoruserinfo.email AS creatoremail,
    creatoruserinfo.phonenumber AS creatorphonenumber
   FROM userinfo
     JOIN users ON users.userid = userinfo.userinfoid
     JOIN userinfo creatoruserinfo ON creatoruserinfo.userinfoid = users.userid
  ORDER BY users.created;



alter table sequentialnumbercounter alter column id type bigint;

select * from datavalue where length(value) > 10;  
-- delete from datavalue where length(value) > 10;   



-- delete datavalues of dataElements assigned on a dataset 
select * from datavalue where dataelementid in(select dataelementid from datasetelement where datasetid in(select datasetid from dataset where uid='MjO0xdyZSnO'));
delete from datavalueaudit where dataelementid in(select dataelementid from datasetelement where datasetid in(select datasetid from dataset where uid='MjO0xdyZSnO'));
delete from datavalue where dataelementid in(select dataelementid from datasetelement where datasetid in(select datasetid from dataset where uid='MjO0xdyZSnO'));






select * from analytics_completeness_2020 where monthly='202001' and dx='v6wdME3ouXu' and uidlevel3='lgZ6HfZaj3f';


copy(
  select comp.*,ou.name
  from analytics_completeness_2020 comp
  inner join organisationunit ou on ou.uid=comp.uidlevel4
  where monthly='202001' and dx='v6wdME3ouXu' and uidlevel3='lgZ6HfZaj3f'
  ) to '/tmp/comp_2020.csv' with csv header;



copy(select trackedentityinstanceid, trackedentityattributeid,value 
from trackedentityattributevalue ) to '/tmp/all-teav.csv' with csv header;


select trackedentityinstanceid,trackedentityattributeid,value,storedby
from 
  ( select *, 
           count(1) over (partition by trackedentityinstanceid) as occurs
    from trackedentityattributevalue where trackedentityattributeid=11312
  ) AS t 
where occurs < 2;


delete from trackedentityinstance where trackedentityinstanceid in(select trackedentityinstanceid
from 
  ( select *, 
           count(1) over (partition by trackedentityinstanceid) as occurs
    from trackedentityattributevalue where trackedentityattributeid=11312
  ) AS t 
where occurs < 2);


delete from trackedentityattributevalue where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid in('QOv0U6j6c60','a0B6cUc60pU','k6vvj0vvpUU','vpvBBcUvHjp','vp6jv0jUHOc','qOj0vBOppvc','A0jpppBpUjB','ABpHpHUHOvO','QUU6HB0O066','AppjvUOpOBO','ABUpHpj6cB0','f0U6U60vv06','AHjHU0pO0HO','qcpcBvpUHUj','FO6666UB6B0','qUc6pHHB60c','vBUUvj0ccjH','fUUUHUvcvUU'));
delete from trackedentityattributevalueaudit where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid in('QOv0U6j6c60','a0B6cUc60pU','k6vvj0vvpUU','vpvBBcUvHjp','vp6jv0jUHOc','qOj0vBOppvc','A0jpppBpUjB','ABpHpHUHOvO','QUU6HB0O066','AppjvUOpOBO','ABUpHpj6cB0','f0U6U60vv06','AHjHU0pO0HO','qcpcBvpUHUj','FO6666UB6B0','qUc6pHHB60c','vBUUvj0ccjH','fUUUHUvcvUU'));
delete from programinstance where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid in('QOv0U6j6c60','a0B6cUc60pU','k6vvj0vvpUU','vpvBBcUvHjp','vp6jv0jUHOc','qOj0vBOppvc','A0jpppBpUjB','ABpHpHUHOvO','QUU6HB0O066','AppjvUOpOBO','ABUpHpj6cB0','f0U6U60vv06','AHjHU0pO0HO','qcpcBvpUHUj','FO6666UB6B0','qUc6pHHB60c','vBUUvj0ccjH','fUUUHUvcvUU'));
delete from trackedentityprogramowner where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid in('QOv0U6j6c60','a0B6cUc60pU','k6vvj0vvpUU','vpvBBcUvHjp','vp6jv0jUHOc','qOj0vBOppvc','A0jpppBpUjB','ABpHpHUHOvO','QUU6HB0O066','AppjvUOpOBO','ABUpHpj6cB0','f0U6U60vv06','AHjHU0pO0HO','qcpcBvpUHUj','FO6666UB6B0','qUc6pHHB60c','vBUUvj0ccjH','fUUUHUvcvUU'));
delete from trackedentityinstance where uid in('QOv0U6j6c60','a0B6cUc60pU','k6vvj0vvpUU','vpvBBcUvHjp','vp6jv0jUHOc','qOj0vBOppvc','A0jpppBpUjB','ABpHpHUHOvO','QUU6HB0O066','AppjvUOpOBO','ABUpHpj6cB0','f0U6U60vv06','AHjHU0pO0HO','qcpcBvpUHUj','FO6666UB6B0','qUc6pHHB60c','vBUUvj0ccjH','fUUUHUvcvUU');


















dhis=#                                                                                                                                                                                                                                                                                      
dhis=# select * from _dataelementgroupsetstructure where dataelementid=2182804483;                                                                                                                                                                                                          
 dataelementid | dataelementname                                                                                                                                                                                                                                                            
---------------+-----------------                                                                                                                                                                                                                                                           
    2182804483 | Data Element 1                                                                                                                                                                                                                                                             
(1 row)                                                                                                                                                                                                                                                                                     
                                                                                                                                                                                                                                                                                            
dhis=#                                                                                                                                                                                                                                                                                      
dhis=# select * from _dataelementstructure where dataelementid=2182804483;                                                                                                                                                                                                                  
 dataelementid | dataelementuid | dataelementname | datasetid  | datasetuid  |   datasetname   | datasetapprovallevel | workflowid | periodtypeid | periodtypename                                                                                                                          
---------------+----------------+-----------------+------------+-------------+-----------------+----------------------+------------+--------------+----------------                                                                                                                         
    2182804483 | H8JOTF3R2Kv    | Data Element 1  | 2182804485 | nP4XeDs7aV5 | Testing Dataset |                    0 |            |            3 | Monthly                                                                                                                                 
(1 row)

dhis=# 
dhis=# select * from dataelement where dataelementid=2182804483;
 dataelementid |      name      |   shortname    | code | description | valuetype | domaintype | aggregationtype | categorycomboid | url |       lastupdated       | zeroissignificant |     uid     | formname | optionsetid |         created         |  userid  | publicaccess | commentoptionsetid | lastupdatedby | style | fieldmask | translations | attributevalues |                                             sharing                                              | valuetypeoptions 
---------------+----------------+----------------+------+-------------+-----------+------------+-----------------+-----------------+-----+-------------------------+-------------------+-------------+----------+-------------+-------------------------+----------+--------------+--------------------+---------------+-------+-----------+--------------+-----------------+--------------------------------------------------------------------------------------------------+------------------
    2182804483 | Data Element 1 | Data Element 1 |      |             | NUMBER    | AGGREGATE  | SUM             |              12 |     | 2022-11-11 13:08:13.392 | f                 | H8JOTF3R2Kv |          |             | 2022-11-11 13:08:13.392 | 44309194 |              |                    |      44309194 |       |           | []           | {}              | {"owner": "OQ1iLIwJXAl", "users": {}, "public": "rw------", "external": false, "userGroups": {}} | 
(1 row)