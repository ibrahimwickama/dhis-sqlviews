

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
         from dataset where uid in('NDcgQeGaJC9'))) 
         and datavalue.periodid in(select periodid from period where startdate between '2022-03-06' and '2023-03-12')) to '/tmp/eidsr-weekly-data.csv' with csv header;




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






-- Upgrading to 37+
-- truncate reporttable cascade;
drop table reporttable cascade;
truncate report cascade;
ALTER TABLE smscodes ALTER COLUMN optionid TYPE integer;



-- Upgrading HMIS from 36+ to 40
drop table reporttable cascade;
-- Then restarted the instance, it failed then restarted again and it took some time to update but it worked



select datasetid,uid,name,expirydays from dataset where name ilike '%NACP%';
update dataset set expirydays=160 where name not ilike '%NACP%';




SELECT DISTINCT  
       te_userinfo.firstname,
       te_userinfo.surname,
       te_userinfo.username,
       te_userinfo.phonenumber,
       te_userinfo.email,
       facility.name AS facility,
       facility.uid AS facilityID,
       facility.district,
       facility.districtid,
       facility.region,
       facility.regionid,
     te_userinfo.uid AS useruid
FROM te_userinfo
INNER JOIN usermembership member
ON member.userinfoid = te_userinfo.userinfoid
INNER JOIN (
	SELECT facility.organisationunitid AS id, 
               facility.uid,
	       facility.name,
               district.district,
               district.districtid,
               district.region,
               district.regionid
        FROM organisationunit facility
        INNER JOIN (
            SELECT d.organisationunitid AS id, 
	           d.name AS district,
                   d.uid AS districtid,
                   (SELECT name
                    FROM organisationunit
                    WHERE organisationunitid = d.parentid) AS region,
            (SELECT uid
                    FROM organisationunit
                    WHERE organisationunitid = d.parentid) AS regionid
            FROM organisationunit d
            WHERE hierarchylevel = 3
            ) district
        ON facility.parentid = district.id
        WHERE hierarchylevel = 4
        ) facility
 ON member.organisationunitid = facility.id
 ORDER BY te_userinfo.firstname ASC;


-- Dataset submission query
SELECT DISTINCT
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
			AND _periodstructure.iso='${period}' AND completedatasetregistration.sourceid IN (
                                   SELECT datasetsource.sourceid
		                   FROM datasetsource
		                   INNER JOIN organisationunit inner_orgunit_expected
		                  ON inner_orgunit_expected.organisationunitid=datasetsource.sourceid
		                   INNER JOIN dataset
		                  ON dataset.datasetid=datasetsource.datasetid
		                  WHERE inner_orgunit_expected.path ilike '%'||outer_orgunit.uid||'%'
			          AND dataset.uid='${datasetId}'
                             )

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
                        AND  completedatasetregistration.sourceid IN (
                                   SELECT datasetsource.sourceid
		                   FROM datasetsource
		                   INNER JOIN organisationunit inner_orgunit_expected
		                  ON inner_orgunit_expected.organisationunitid=datasetsource.sourceid
		                   INNER JOIN dataset
		                  ON dataset.datasetid=datasetsource.datasetid
		                  WHERE inner_orgunit_expected.path ilike '%'||outer_orgunit.uid||'%'
			          AND dataset.uid='${datasetId}'
                             )
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
	) as completed_by_and_date ON completed_by_and_date.sourceid=outer_orgunit.organisationunitid
WHERE (outer_orgunit.path ilike '%${orgUnitId}%'
	and outer_orgunit.hierarchylevel='${orgUnitChildrenLevel}')
        or outer_orgunit.uid='${orgUnitId}'
ORDER BY outer_orgunit.hierarchylevel desc,  grandparentname asc, parent.name asc, outer_orgunit.name asc




INSERT INTO optionvalue VALUES((select nextval('hibernate_sequence')),(select generate_uid()),'Laboratory Manager 1',now()::timestamp,now()::timestamp,'Laboratory Manager 1',1067052476,9,'','',null,'[]','{}');



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
         from dataset where uid in('EANmPUhm7tU'))) 
         and datavalue.periodid in(select periodid from period where startdate between '2023-01-01' and '2023-08-20')) to '/tmp/eidsrDataset2023.csv' with csv header; 



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
where datavalue.dataelementid in(select dataelementid from dataelement where uid in('btVM00WAlRO')) and datavalue.periodid in(select periodid from period where startdate between '2023-01-01' and '2023-08-07')) to '/tmp/eidsr2023.csv' with csv header;







select organisationunitid,uid,name,hierarchylevel,closeddate from organisationunit where closeddate between '1970-01-01' and '1970-01-02';

update organisationunit set closeddate='' where closeddate between '1970-01-01' and '1970-01-02';

pg_restore -d your_database_name -t your_table_name -a path/to/your/sql_dump_file.sql

pg_restore -h localhost -U dhismain -p 5432 --format plain -d dhis_temp -t datasetsource -f /mnt/old_data01/dhis/daily_backups/backup2023-08-03-daily/dhis_tz_main.sql
psql -h localhost -U dhismain -p 5432 -d dhis_temp -t datasetsource /mnt/old_data01/dhis/daily_backups/backup2023-08-03-daily/dhis_tz_main.sql

dhismain
dhis987123

pg_dump -h localhost -U dhismain -p 5432 --format plain --exclude-table-data="audit" --exclude-table-data="datavalueaudit" --exclude-table="_categoryoptioncomboname" --exclude-table="_categorystructure" --exclude-table="_dataelementgroupsetstructure" --exclude-table="_dataelementstructure" --exclude-table="_indicatorgroupsetstructure" --exclude-table="_organisationunitgroupsetstructure" --exclude-table="_orgunitstructure" --exclude-table="_periodstructure"  --exclude-table="aggregated*" --exclude-table="analytics*" --exclude-table="completeness_*" --verbose --file /tmp/port-test-db-backup.sql dhis_tz_portal;


copy(
select * from datasetsource where sourceid in(2183295994,238173,2183288797,2182854001,78140,2182664903,80038,79577,77767,75546,75340,77169,78207,77170,77207,78913,297007,77011,78544,291175,80396,79306,77053,76545,234974,77773,77007,75614,2183283639,296962,79290,2183769237,2183769239,80767,79765,237454,2183821612,79313,289204,77577,79320,75439,78452,299344,300177,77920,79268,80433,2183471282,2183471306,79771,78950,293420,2183870235,77430,2183471311,239134,81332,78871,79301,80369,75914,2182763586,78925,2183498299,75369,2183510337,2183510369,80434,2183502925,2183510384,2183503712,2183503055,77566,2183503761,79590,78178,80797,2183536099,291884,2182730948,76491,75785,77768,77442,81090,373115,76379,78568,77180,76518,2183561313,77473,2183580123,237450,2182754021,291408,77016,81210,77757,14876426,77663,77298,78419,78375,78179,77137,77549,80529,239750,77497,80295,80368,78091,80381,81206,79575,77761,79318,77752,77760,79319,75875,79324,77778,237406,40998947,283190,78295,80415,77405,76911,77135,78013,79309,77567,79317,80849,77759,78176,77571,80450,77771,77763,15520347,80791,80824,77769,76676,77924,77916,75642,76641,80285,76227,76156,78348,78379,77244,79305,76944,77006,76143,76689,77777,77780,77766,81138,78854,2182657338,2183634008,300998,296139,81204,76285,77009,78180,77171,2182657367,2182664560,79075,78368,75874,75643,239201,75871,80367,77774,80513,237294,79303,79551,79315,76400,78690,78581,77779,300791,77772,77776,78639,77134,76195,300794,79593,77575,77764,81430,79365)
) to '/tmp/datasetsource.csv' with csv header;



SELECT (categorycombo.*)::text, count(*)
FROM categorycombo
GROUP BY categorycombo.*
HAVING count(*) > 1

select * from categorycombo where name='HCT';


copy(select * from completedatasetregistration ) to '/tmp/datasetcompleteness.csv' with csv header;

copy(select cdr.datasetid,pe.periodid,pe.startdate,pe.enddate,ou.uid,ou.organisationunitid,cdr.date,cdr.storedby 
from completedatasetregistration cdr
inner join organisationunit ou on (ou.organisationunitid=cdr.sourceid)
left join period pe on (pe.periodid=cdr.periodid)) to '/tmp/datasetcompleteness.csv' with csv header;


INSERT INTO completedatasetregistration VALUES(1573,(select periodid from period where startdate='' and enddate=''),(select organisationunitid from organisationunit where uid=''),24,'date','storedby','lastupdatedby','lastupdated',true);


="INSERT INTO completedatasetregistration VALUES(1573,(select periodid from period where startdate='"&TEXT(C2,"yyyy-mm-dd")&"' and enddate='"&TEXT(D2,"yyyy-mm-dd")&"'),(select organisationunitid from organisationunit where uid='"&E2&"'),24,'"&TEXT(G2,"yyyy-mm-dd h:mm:ss")&"','"&H2&"','"&H2&"',now()::timestamp,true);"
="UPDATE completedatasetregistration SET storedby='"&H2&"' WHERE periodid in(select periodid from period where startdate='"&TEXT(C2,"yyyy-mm-dd")&"' and enddate='"&TEXT(D2,"yyyy-mm-dd")&"') and sourceid in(select organisationunitid from organisationunit where uid='"&E2&"') and datasetid=1573;"






delete from trackedentityattributevalueaudit where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid in('m9UET1J7ilX'));
delete from trackedentityattributevalue where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid  in('m9UET1J7ilX'));
delete from programstageinstance where programinstanceid in(select programinstanceid from programinstance where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid in('m9UET1J7ilX')));
delete from programinstance where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid  in('m9UET1J7ilX'));
delete from trackedentityprogramowner where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid in('m9UET1J7ilX')));
delete from trackedentityinstance where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid  in('m9UET1J7ilX'));



-- delete program tracker data by programId
delete from trackedentityattributevalueaudit where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where trackedentitytypeid in(select trackedentitytypeid from program where uid=''));
delete from trackedentityattributevalue where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where trackedentitytypeid in(select trackedentitytypeid from program where uid=''));
delete from programstageinstance where programinstanceid in(select programinstanceid from programinstance where programid in(select programid from program where uid=''));
delete from programinstance where programid in(select programid from program where uid='');
delete from trackedentityprogramowner where programid in(select programid from program where uid='');
delete from trackedentityinstance where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where trackedentitytypeid in(select trackedentitytypeid from program where uid=''));


update program set sharing='{"owner": "Gg1EOlOvKRE", "users": {"FrROTHBszj5": {"id": "FrROTHBszj5", "access": "rwrw----"}}, "public": "rwrw----", "external": false, "userGroups": {"RJ1GMFVfzQ1": {"id": "RJ1GMFVfzQ1", "access": "rwrw----"}}}' where programid=522839043;




COPY (SELECT 'INSERT INTO datavalue VALUES(' || dataelementid || ',' || periodid || ',' || sourceid || ',' || categoryoptioncomboid || ',' || value || ',null,now()::timestamp,null,false,' || attributeoptioncomboid || ',now()::timestamp,false);' from datavalue where created > '2022-01-01') TO '/tmp/hmis_data.sql';


COPY (SELECT 'INSERT INTO datavalue VALUES(' || datasetid || ',' || periodid || ',' || sourceid || ',' || date || ',upgrade,' || attributeoptioncomboid || ',upgrade,'',now()::timestamp,null,false,' || attributeoptioncomboid || ',now()::timestamp,false);' from datavalue where created > '2022-01-01') TO '/tmp/hmis_data.sql';





select datavalue0_.dataelementid as dataelem1_60_, datavalue0_.periodid as periodid2_60_, datavalue0_.sourceid as sourceid3_60_, datavalue0_.categoryoptioncomboid as category4_60_, datavalue0_.attributeoptioncomboid as attribut5_60_, datavalue0_.value as value6_60_, datavalue0_.storedby as storedby7_60_, datavalue0_.created as created8_60_, datavalue0_.lastupdated as lastupda9_60_, datavalue0_.comment as comment10_60_, datavalue0_.followup as followu11_60_, datavalue0_.deleted as deleted12_60_ from datavalue datavalue0_ inner join dataelement dataelemen1_ on datavalue0_.dataelementid=dataelemen1_.dataelementid inner join period period2_ on datavalue0_.periodid=period2_.periodid inner join organisationunit organisati3_ on datavalue0_.sourceid=organisati3_.organisationunitid inner join categoryoptioncombo categoryop4_ on datavalue0_.categoryoptioncomboid=categoryop4_.categoryoptioncomboid inner join categoryoptioncombo categoryop5_ on datavalue0_.attributeoptioncomboid=categoryop5_.categoryoptioncomboid 
where (dataelemen1_.dataelementid in (2180985357,2180985325,2180985329,2180985373,2180985363,2180985326,2180985349,2180985370,2180985368,2180985359,2180985353,2180985323,2180985362,2180985340,2180985358,2180985344,2180985361,2180985356,2180985334,2180985350,2180985337,2180985331,2180985332,2180985343,2180985367,2180985335,2180985346,2180985327,2180985354,2180985348,2180985369,2180985336,2180985351,2180985341,2180985328,2180985338,2180985366,2180985345,2180985330,2180985365,2180985342,2180985322,2180985364,2180985347,2180985372,2180985355,2180985333,2180985371,2180985360,2180985352,2180985339,2180985324)) and (period2_.periodid in (2183563266)) and (organisati3_.organisationunitid in (75372)) and (categoryop5_.categoryoptioncomboid in (13)) and datavalue0_.deleted=false;





-- create unique index on datavalue table
CREATE UNIQUE INDEX datavalue_pkey ON datavalue (dataelementid, periodid, sourceid, categoryoptioncomboid, attributeoptioncomboid);



(dataelementid, periodid, sourceid, categoryoptioncomboid, attributeoptioncomboid)=(82364, 2183563349, 2183828989, 82361, 13)

select * from datavalue where dataelementid=82364 and periodid=2183563349  and sourceid=2183828989 and categoryoptioncomboid=82361 and attributeoptioncomboid=13;
delete from datavalue where dataelementid=82427 and periodid=2183563349  and sourceid=1325605638 and categoryoptioncomboid=82358 and attributeoptioncomboid=13;

delete from datavalue where created > '2023-12-01';
CREATE UNIQUE INDEX datavalue_pkey ON datavalue (dataelementid, periodid, sourceid, categoryoptioncomboid, attributeoptioncomboid);

datavalue_pkey


-- delete organisationunitid on programstageinstance table
delete from programstageinstance where organisationunitid in(select organisationunitid from organisationunit where path ilike '%k8V8c7k7N6r%' or uid='k8V8c7k7N6r');
-- delete trackedentitydatavalue, trackedentitydatavalueaudit with dependency to organisationunits to be deleted
delete from trackedentitydatavalueaudit where programstageinstanceid in(select programstageinstanceid from  programstageinstance where organisationunitid in(select organisationunitid from organisationunit where path ilike '%k8V8c7k7N6r%' or uid='k8V8c7k7N6r'));
delete from trackedentityattributevalue where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where organisationunitid in(select organisationunitid from organisationunit where path ilike '%k8V8c7k7N6r%' or uid='k8V8c7k7N6r'));
-- delete organisationunitid on trackedentityinstance table
delete from trackedentityprogramowner where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where organisationunitid in(select organisationunitid from organisationunit where path ilike '%k8V8c7k7N6r%' or uid='k8V8c7k7N6r'));
delete from trackedentityattributevalueaudit where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where organisationunitid in(select organisationunitid from organisationunit where path ilike '%k8V8c7k7N6r%' or uid='k8V8c7k7N6r'));
delete from relationship where relationshipid in(select relationshipid from relationshipitem where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where organisationunitid in(select organisationunitid from organisationunit where path ilike '%k8V8c7k7N6r%' or uid='k8V8c7k7N6r'))) cascade;
delete from relationshipitem where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where organisationunitid in(select organisationunitid from organisationunit where path ilike '%k8V8c7k7N6r%' or uid='k8V8c7k7N6r')) cascade;
-- truncate relationship cascade;
delete from trackedentityinstance where organisationunitid in(select organisationunitid from organisationunit where path ilike '%k8V8c7k7N6r%' or uid='k8V8c7k7N6r');
delete from programinstance where organisationunitid in(select organisationunitid from organisationunit where path ilike '%k8V8c7k7N6r%' or uid='k8V8c7k7N6r' or uid='k8V8c7k7N6r');


-- on eTB missing patients on dataEntry while visible on across all stages
INSERT INTO trackedentityprogramowner VALUES((select nextval('hibernate_sequence')),522043014,521914217,now()::timestamp,now()::timestamp,2788,'system');


-- Update orgunits with lat and long from 
="UPDATE organisationunit SET geometry=ST_SetSRID(ST_MakePoint("&H2&", "&G2&"), 4326) WHERE uid='"&B2&"';"



-- eIDSR Zanzibar Sql Queries
xqKqwYeEZLB |      1381 | IDSR_MoHZ Immediate Notification Disease (Tracker) | 2024-02-13 12:08:35.271
Y1Arb55WBGM |    251097 | Immediate Disease Notification                     | 2024-03-01 11:48:16.499

select tea.trackedentityattributeid,tea.code,tea.uid,tea.name 
from program_attributes pa
inner join trackedentityattribute tea on tea.trackedentityattributeid = pa.trackedentityattributeid
where pa.programid=251097
EXCEPT
select tea.trackedentityattributeid,tea.code,tea.uid,tea.name 
from program_attributes pa
inner join trackedentityattribute tea on tea.trackedentityattributeid = pa.trackedentityattributeid
where pa.programid=1381;



SELECT 
    pid
    ,datname
    ,usename
    ,application_name
    ,client_hostname
    ,client_port
    ,backend_start
    ,query_start
    ,query
    ,state
FROM pg_stat_activity
WHERE state = 'active';

SELECT 
    pid
    ,datname
    ,usename
    ,application_name
    ,client_hostname
    ,client_port
    ,backend_start
    ,query_start
    ,query
    ,state
FROM pg_stat_activity
WHERE state = 'idle' AND LENGTH(query) < 1;

SELECT 
    pid
FROM pg_stat_activity
WHERE state = 'idle' AND LENGTH(query) < 1;

SELECT 
    pid
    ,datname
    ,usename
    ,query_start
     ,query
    ,state
FROM pg_stat_activity
WHERE state = 'idle' AND query LIKE '% %';

SELECT 
    pid
    ,datname
    ,usename
    ,query_start
     ,query
    ,state
FROM pg_stat_activity
WHERE state = 'idle' AND pid NOT IN (SELECT pid FROM pg_stat_activity WHERE state = 'idle' AND query LIKE '% %' AND LENGTH(query) > 3);


PERFORM pg_terminate_backend(103344);











-- List old categoryoptioncombo IDS
select categoryoptioncomboid,uid,name from categoryoptioncombo where uid in('oldUid1','oldUid1');

-- List new categoryoptioncombo IDS
select categoryoptioncomboid,uid,name from categoryoptioncombo where uid in('newUid1','newUid1');

-- Note them down and arrange them manually for mapping something like this
  old_categoryoptioncomboid  | new_categoryoptioncomboid | 
-----------------------------+---------------------------+
 3984                        |                      8593 |
 9594                        |                      9284 |
 8492                        |                      8584 |
 9584                        |                      9532 |

-- Then look for period id based on period startdates and enddates
select periodid,startdate,enddate,daysno,monthly from _periodstructure where daysno >= 28 and monthly in('202309','202310','202311');
  periodid  | startdate  |  enddate   | daysno | monthly 
------------+------------+------------+--------+---------
 2183563266 | 2023-10-01 | 2023-10-31 |     31 | 202310
 2183563338 | 2023-09-01 | 2023-09-30 |     30 | 202309
 2183563349 | 2023-11-01 | 2023-11-30 |     30 | 202311

-- Now create the queries based on catoptioncombo mapping results
update datavalue set categoryoptioncomboid= new_categoryoptioncomboid where categoryoptioncomboid=old_categoryoptioncomboid and periodid in(2183563266,2183563338,2183563349);



="UPDATE organisationunit SET code='"&F2&"' WHERE uid='"&E2&"';"

DO $$
DECLARE
    r RECORD;
BEGIN
    FOR r IN SELECT uid, code FROM organisationunit WHERE hierarchylevel=5 LOOP
        BEGIN
            -- Update the column to keep only the last 8 characters
            UPDATE organisationunit
            SET code = RIGHT(r.code, 8)
            WHERE uid = r.uid;
        EXCEPTION
            WHEN OTHERS THEN
                -- Skip the row and continue with the next iteration
                RAISE NOTICE 'Skipping row with id % due to error: %', r.uid, SQLERRM;
        END;
    END LOOP;
END $$;



COPY (
SELECT DISTINCT 
    ps.username,
    ps.firstname,
    ps.middlename,
    ps.surname,
    ps.phonenumber,
    ps.enabled,
    ps.created,
    ps.lastlogin,
    -- ur.name,
    ( SELECT replace(replace(replace((ARRAY( SELECT userrole.name
                   FROM userrolemembers
                     JOIN userrole ON userrole.id = userrolemembers."userroleId"
                  WHERE userrolemembers."userId" = ps.id))::text, '{'::text, ''::text), '}'::text, ''::text), '"'::text, ''::text) AS replace) AS userroles
FROM 
    public.user ps
LEFT JOIN 
    userrolemembers urm ON urm."userId" = ps.id
LEFT JOIN 
    userrole ur ON ur.id = urm."userroleId"
    ) TO '/tmp/hris_user.csv' with csv header;



    20240805

delete from datavalue where periodid=27108 and sourceid in(1199,3412);

select organisationunitid from organisationunit where uid in('K2vzLZeTssW','sXvhJ1kCNq9');
K2vzLZeTssW
sXvhJ1kCNq9

COPY (select uid,name,geometry from organisationunit where hierarchylevel=3) TO '/tmp/lga_geometry.csv' with csv header;

="UPDATE organisationunit SET geometry='"&C2&"' WHERE uid='"&A2&"';"



SELECT
date(pi.enrollmentdate) as "case_date",
date(psi.executiondate) as "traige_date",
date(psi1.executiondate) as "verificaiton_date"
FROM trackedentityinstance tei
inner join programinstance pi on pi.trackedentityinstanceid = tei.trackedentityinstanceid
-- Triage stage
inner join programstageinstance psi on psi.programinstanceid = pi.programinstanceid and psi.programstageid=11348
-- Verification stage
inner join programstageinstance psi1 on psi1.programinstanceid = pi.programinstanceid and psi1.programstageid=11344
left join te_attributevalue as "Disease Classification" on "Disease Classification".trackedentityinstanceid = tei.trackedentityinstanceid and "Disease Classification".trackedentityattributeid = 18212
and pi.programid = 11354  AND pi.deleted is false;

COPY (SELECT * FROM _orgunitstructure) TO '/tmp/orgunitstructure.csv' with csv header;


="UPDATE userinfo SET username='"&E2&"' WHERE uis='"&A2&"';"


-- Get period ids 
select periodid,startdate,enddate,daysno,monthly from _periodstructure where daysno >= 28 and monthly in('202301','202302','202303','202304','202305','202306','202307','202308','202309','202310','202311','202312','202401','202402','202403','202404','202405','202406','202407','202408','202409','202410','202411','202412');

-- Get dataElement ids 
select dataelementid,uid from dataelement where uid in('KU1FsxbyE9Z','CE2CxlQh8vx','hfZEdu3747h','nUInmdAMy9t','dU2Te9w4kX3','FyMgk7gu6sM','veNyYfnryba','EedsGEZYgrJ','akJaRI9HXkw','SpATOGBWN4x','Wo3IAYaAaOw','tExuo3o7twa','KCqXueTAFab','PDUaZ1SG2Nx','oZ01LlJJUXb','ZMqXEOua0gm','K6IIFFTr9C2','BMmABnLo9wc','Wf281LtOA0f','oixPV2SYqgG');

DELETE FROM datavalue WHERE 
periodid IN(2183563266,2183563338,2183563345,2183563349,2183563352,2183563726,2183563747,2183563901,2183564119,2183564556,2183567036,2183578389,2183693778,2184317782,2184316474,2184316490,2184316502,2184316859,2184317023,2184317028,2184317786,2184317939,2184319066,2184331375) AND 
dataelementid IN(1079138,1079145,1079139,1079150,1079152,1079153,1079155,1079154,1079144,1079148,1079149,1079143,1079141,1079147,1079142,1079140,1079137,1079146,1079151,1079136);



usermembership
userteisearchorgunits
userdatavieworgunits

userinfo
username

INSERT INTO usermembership VALUES((SELECT organisationunitid FROM organisationunit WHERE uid='j7EZnVuXl3C'),(SELECT userinfoid FROM userinfo WHERE username='ombeningulo'));
="INSERT INTO usermembership VALUES((SELECT organisationunitid FROM organisationunit WHERE uid='"&B2&"'),(SELECT userinfoid FROM userinfo WHERE username='"&A2&"'));"
="INSERT INTO userdatavieworgunits VALUES((SELECT userinfoid FROM userinfo WHERE username='"&A2&"'),(SELECT organisationunitid FROM organisationunit WHERE uid='"&C2&"'));"
="INSERT INTO userteisearchorgunits VALUES((SELECT userinfoid FROM userinfo WHERE username='"&A2&"'),(SELECT organisationunitid FROM organisationunit WHERE uid='"&C2&"'));"

delete from indicatorgroupmembers where indicatorid in(select indicatorid from indicator where DATE(created) ='2025-02-05');
delete from indicator where DATE(created) ='2025-02-05';
delete from dataelementgroupmembers where dataelementid in(select dataelementid from dataelement where DATE(created) ='2025-02-05');
delete from datasetelement where dataelementid in(select dataelementid from dataelement where DATE(created) ='2025-02-05');
delete from datavalue where dataelementid in(select dataelementid from dataelement where DATE(created) ='2025-02-05');
delete from datavalueaudit where dataelementid in(select dataelementid from dataelement where DATE(created) ='2025-02-05');
delete from dataelement where DATE(created) ='2025-02-05';


delete from trackedentitydatavalueaudit where programstageinstanceid=6240567;
delete from programstageinstance where programinstanceid=6107253;
delete from programinstance where trackedentityinstanceid=6106933;


select * from programinstance where organisationunitid in(select organisationunitid from organisationunit where path ilike '%vMMvZfLtNus%');

-- Slow query on Etl upgrade, takes 8 seconds then validations runs, optimize this
select 
    TE.trackedentityid,
    TE.uid,
    TE.created,
    TE.lastupdated,
    TE.createdatclient,
    TE.lastupdatedatclient,
    TE.inactive,
    TE.potentialduplicate,
    TE.deleted,
    TE.trackedentitytypeid
FROM 
    (SELECT DISTINCT 
    TE.trackedentityid as trackedentityid,
    TE.trackedentitytypeid as trackedentitytypeid,
    TE.uid as uid,
    TE.created as created,
    TE.lastupdated as lastupdated,
    TE.createdatclient as createdatclient,
    TE.lastupdatedatclient as lastupdatedatclient,
    TE.inactive as inactive,
    TE.potentialduplicate as potentialduplicate,
    TE.deleted as deleted
    FROM trackedentity TE 
    INNER JOIN program P  ON P.trackedentitytypeid = TE.trackedentitytypeid AND P.programid IN (17997, 17631, 347476, 8558, 15797, 175093, 522564251, 15143, 522839043, 522637978, 522726208, 521917622, 522837893, 523254128, 521914217)
    INNER JOIN trackedentityattributevalue "aihxG1tTqba" ON "aihxG1tTqba".trackedentityattributeid = 15233 AND "aihxG1tTqba".trackedentityid = TE.trackedentityid AND lower("aihxG1tTqba".value) = '109601-5/kk/2025/0'
    LEFT JOIN trackedentityprogramowner PO ON  PO.trackedentityid = TE.trackedentityid AND P.programid = PO.programid
    INNER JOIN organisationunit OU ON OU.organisationunitid = COALESCE(PO.organisationunitid, TE.organisationunitid) AND OU.organisationunitid IN (5065)  where TE.trackedentitytypeid = 16 and TE.deleted IS FALSE
    ORDER BY TE.trackedentityid desc LIMIT 50 OFFSET 0 ) TE 
ORDER BY TE.trackedentityid desc;




-- optmized query, takes 2 seconds
SELECT 
    TE.trackedentityid,
    TE.uid,
    TE.created,
    TE.lastupdated,
    TE.createdatclient,
    TE.lastupdatedatclient,
    TE.inactive,
    TE.potentialduplicate,
    TE.deleted,
    TE.trackedentitytypeid
FROM 
    trackedentity TE 
WHERE 
    TE.trackedentitytypeid = 16
    AND TE.deleted IS FALSE
    AND EXISTS (
        SELECT 1
        FROM trackedentityattributevalue TEAV
        WHERE TEAV.trackedentityid = TE.trackedentityid
        AND TEAV.trackedentityattributeid = 15233
        AND lower(TEAV.value) = '109601-5/kk/2025/0'
    )
    AND EXISTS (
        SELECT 1
        FROM program P
        LEFT JOIN trackedentityprogramowner PO ON PO.trackedentityid = TE.trackedentityid AND P.programid = PO.programid
        WHERE P.trackedentitytypeid = TE.trackedentitytypeid
        AND P.programid IN (17997, 17631, 347476, 8558, 15797, 175093, 522564251, 15143, 522839043, 522637978, 522726208, 521917622, 522837893, 523254128, 521914217)
        AND COALESCE(PO.organisationunitid, TE.organisationunitid) IN (5065)
    )
ORDER BY TE.trackedentityid DESC
LIMIT 50;


-- Call #1
-- When api call with program only, it includes 1 program, hence takes 2 seconds
-- ../api/41/tracker/trackedEntities?program=tj4u1ip0tTF&orgUnit=SuoqM5pXPWG&filter=aihxG1tTqba:EQ:109601-5//KK//2025//0
select 
    TE.trackedentityid,
    TE.uid,
    TE.created,
    TE.lastupdated,
    TE.createdatclient,
    TE.lastupdatedatclient,
    TE.inactive,
    TE.potentialduplicate,
    TE.deleted,
    TE.trackedentitytypeid
FROM 
    (SELECT DISTINCT
    TE.trackedentityid as trackedentityid,
    TE.trackedentitytypeid as trackedentitytypeid,
    TE.uid as uid,
    TE.created as created,
    TE.lastupdated as lastupdated,
    TE.createdatclient as createdatclient,
    TE.lastupdatedatclient as lastupdatedatclient,
    TE.inactive as inactive,
    TE.potentialduplicate as potentialduplicate,
    TE.deleted as deleted
    FROM trackedentity TE 
    INNER JOIN program P  ON P.trackedentitytypeid = TE.trackedentitytypeid 
    INNER JOIN trackedentityattributevalue "aihxG1tTqba" ON "aihxG1tTqba".trackedentityattributeid = 15233 AND "aihxG1tTqba".trackedentityid = TE.trackedentityid AND lower("aihxG1tTqba".value) = '109601-5/kk/2025/0'
    INNER JOIN trackedentityprogramowner PO ON PO.programid = 521914217 AND PO.trackedentityid = TE.trackedentityid  AND P.programid = PO.programid 
    INNER JOIN organisationunit OU ON OU.organisationunitid = PO.organisationunitid AND OU.organisationunitid IN (5065)  
    where TE.deleted IS FALSE  and EXISTS (
        SELECT 
        EN.trackedentityid 
        FROM enrollment EN 
        WHERE EN.trackedentityid = TE.trackedentityid AND EN.programid = 521914217 AND EN.deleted is false ) 
        ORDER BY TE.trackedentityid desc LIMIT 50 OFFSET 0 ) TE 
    ORDER BY TE.trackedentityid desc


-- Call #2
-- When api call with trackedentitytype, it includes all programs associated with it, hence taking long, for us 8 seconds
-- ../api/41/tracker/trackedEntities?trackedEntityType=MCPQUTHX1Ze&orgUnit=SuoqM5pXPWG&filter=aihxG1tTqba:EQ:109601-5//KK//2025//0
select 
    TE.trackedentityid,
    TE.uid,
    TE.created,
    TE.lastupdated,
    TE.createdatclient,
    TE.lastupdatedatclient,
    TE.inactive,
    TE.potentialduplicate,
    TE.deleted,
    TE.trackedentitytypeid
FROM 
    (SELECT DISTINCT 
    TE.trackedentityid as trackedentityid,
    TE.trackedentitytypeid as trackedentitytypeid,
    TE.uid as uid,
    TE.created as created,
    TE.lastupdated as lastupdated,
    TE.createdatclient as createdatclient,
    TE.lastupdatedatclient as lastupdatedatclient,
    TE.inactive as inactive,
    TE.potentialduplicate as potentialduplicate,
    TE.deleted as deleted
    FROM trackedentity TE 
    -- INNER JOIN program P  ON P.trackedentitytypeid = TE.trackedentitytypeid AND P.programid IN (17997, 17631, 347476, 8558, 15797, 175093, 522564251, 15143, 522839043, 522637978, 522726208, 521917622, 522837893, 523254128, 521914217)
    INNER JOIN program P  ON P.trackedentitytypeid = TE.trackedentitytypeid AND P.programid IN (521914217)
    INNER JOIN trackedentityattributevalue "aihxG1tTqba" ON "aihxG1tTqba".trackedentityattributeid = 15233 AND "aihxG1tTqba".trackedentityid = TE.trackedentityid AND lower("aihxG1tTqba".value) = '109601-5/kk/2025/0'
    LEFT JOIN trackedentityprogramowner PO ON  PO.trackedentityid = TE.trackedentityid AND P.programid = PO.programid
    INNER JOIN organisationunit OU ON OU.organisationunitid = COALESCE(PO.organisationunitid, TE.organisationunitid) AND OU.organisationunitid IN (5065)  where TE.trackedentitytypeid = 16 and TE.deleted IS FALSE
    ORDER BY TE.trackedentityid desc LIMIT 50 OFFSET 0 ) TE 
ORDER BY TE.trackedentityid desc;