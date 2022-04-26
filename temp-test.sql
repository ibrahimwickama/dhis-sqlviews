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




select * from trackedentityinstance where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityattributevalue where value='210301111180-6/LP2022/3');
select * from trackedentityinstance where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityattributevalue where value='010501104115-1/KK/2022/1');

delete from trackedentityattributevalueaudit where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid in('Hs2FR8lRDrc'));
delete from trackedentityattributevalue where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid  in('Hs2FR8lRDrc'));
delete from programstageinstance where programinstanceid in(select programinstanceid from programinstance where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid in('Hs2FR8lRDrc')));
delete from programinstance where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid  in('Hs2FR8lRDrc'));
delete from trackedentityprogramowner where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid in('Hs2FR8lRDrc')));
delete from trackedentityinstance where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid  in('Hs2FR8lRDrc'));



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

