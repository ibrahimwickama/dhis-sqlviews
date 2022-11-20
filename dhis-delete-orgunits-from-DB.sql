-- delete ogranisation units dataValues on all wisn dataSets
delete from datavalueaudit where organisationunitid in(select organisationunitid from organisationunit where uid in('h8Su2g85Whc'));
-- delete datavalue orgunits 
delete from datavalue where sourceid in(select organisationunitid from organisationunit where uid in('h8Su2g85Whc'));
--  delete organisationunitid on datasetsource table
delete from datasetsource where sourceid in(select organisationunitid from organisationunit where uid in('h8Su2g85Whc'));
--  delete organisationunitid on completedatasetregistration table
delete from completedatasetregistration where sourceid in(select organisationunitid from organisationunit where uid in('h8Su2g85Whc'));
--  delete organisationunitid on program_organisationunits table
delete from program_organisationunits where organisationunitid in(select organisationunitid from organisationunit where uid in('h8Su2g85Whc'));
--  delete organisationunitid on programstageinstance table
delete from programstageinstance where organisationunitid in(select organisationunitid from organisationunit where uid in('h8Su2g85Whc'));
--  delete trackedentitydatavalue, trackedentitydatavalueaudit with dependency to organisationunits to be deleted
delete from trackedentitydatavalueaudit where programstageinstanceid in(select programstageinstanceid from  programstageinstance where organisationunitid in(select organisationunitid from organisationunit where uid in('h8Su2g85Whc')));
delete from trackedentitydatavalue where programstageinstanceid in(select programstageinstanceid from  programstageinstance where organisationunitid in(select organisationunitid from organisationunit where uid in('h8Su2g85Whc')));
--  delete organisationunitid on trackedentityinstance table
delete from trackedentityinstance where organisationunitid in(select organisationunitid from organisationunit where uid in('h8Su2g85Whc'));
--  delete organisationunitid on categoryoption_organisationunit table
delete from categoryoption_organisationunits where organisationunitid in(select organisationunitid from organisationunit where uid in('h8Su2g85Whc'));
--  dele organisation units on groups
delete from orgunitgroupmembers where organisationunitid in(select organisationunitid from organisationunit where uid in('h8Su2g85Whc'));
delete from userdatavieworgunits where organisationunitid in(select organisationunitid from organisationunit where uid in('h8Su2g85Whc'));
delete from usermembership where organisationunitid in(select organisationunitid from organisationunit where uid in('h8Su2g85Whc'));
delete from visualization_organisationunits where organisationunitid in(select organisationunitid from organisationunit where uid in('h8Su2g85Whc'));
delete from eventreport_organisationunits where organisationunitid in(select organisationunitid from organisationunit where uid in('h8Su2g85Whc'));
delete from userteisearchorgunits where organisationunitid in(select organisationunitid from organisationunit where uid in('h8Su2g85Whc'));
delete from programstageinstancecomments where programstageinstanceid in(select programstageinstanceid from programstageinstance where organisationunitid in(select organisationunitid from organisationunit where uid in('h8Su2g85Whc')));
delete from programstageinstance where programinstanceid in(select programinstanceid from programinstance where organisationunitid in(select organisationunitid from organisationunit where uid in('h8Su2g85Whc')));
delete from programstageinstance where organisationunitid in(select organisationunitid from organisationunit where uid in('h8Su2g85Whc'));
delete from programinstance where organisationunitid in(select organisationunitid from organisationunit where uid in('h8Su2g85Whc'));
delete from trackedentityattributevalue where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where organisationunitid in(select organisationunitid from organisationunit where uid in('h8Su2g85Whc')));
delete from trackedentityprogramowner where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where organisationunitid in(select organisationunitid from organisationunit where uid in('h8Su2g85Whc')));
delete from trackedentityinstance where organisationunitid in(select organisationunitid from organisationunit where uid in('h8Su2g85Whc'));
--  delete actual organisationunits
delete from organisationunit where uid in('h8Su2g85Whc');



-- delete WISN-HMIS data
delete from datavalueaudit where dataelementid in(select dataelementid from dataelement where uid in('wisnHmisUid1','wisnHmisUid2'));
delete from datavalue where dataelementid in(select dataelementid from dataelement where uid in('wisnHmisUid1','wisnHmisUid2'));


UPDATE organisationunit SET uid='lgZ6HfZaj3f' where uid='fQyCUoTPROD';
UPDATE organisationunit SET uid='tq4bMQkHDbC' where uid='WvIaGXaCzuV';
UPDATE organisationunit SET uid='iEIdCVxSJct' where uid='QiP3Wq82xzn';
UPDATE organisationunit SET uid='HeESSqNok0X' where uid='ASZSXHlhwwj';

-- deleting datavalues from stardate to enddate
DELETE FROM datavalue where created BETWEEN '2000-01-01' AND '2019-12-31';

-- check for duplicate orgunits 
SELECT a.name,a.uid,a.organisationunitid,a.parentid
FROM organisationunit a
JOIN (SELECT name, hierarchylevel, parentid, COUNT(*)
FROM organisationunit 
GROUP BY name, hierarchylevel, parentid
HAVING count(*) > 1 ) b
ON a.name = b.name
AND a.hierarchylevel = b.hierarchylevel
AND a.hierarchylevel=4
AND b.hierarchylevel=4
AND a.parentid=b.parentid
ORDER BY a.parentid;


copy(select * from datavalue where sourceid=(select organisationunitid from organisationunit where uid='IfrfalFKbng')) to '/tmp/batch10.csv' with csv header;


update datavalue set sourceid=(select organisationunitid from organisationunit where uid='lvgYm5rutFE') where sourceid=(select organisationunitid from organisationunit where uid='vskJqE5wu1d');
="update datavalue set sourceid=(select organisationunitid from organisationunit where uid='bjrTSfTjQUi') where periodid="&B2&" and sourceid="&C2&";"


update datavalueaudit set organisationunitid=(select organisationunitid from organisationunit where uid='bjrTSfTjQUi') where organisationunitid=(select organisationunitid from organisationunit where uid='IfrfalFKbng');
update trackedentityinstance set organisationunitid=(select organisationunitid from organisationunit where uid='bjrTSfTjQUi') where organisationunitid=(select organisationunitid from organisationunit where uid='IfrfalFKbng');
update programinstance set organisationunitid=(select organisationunitid from organisationunit where uid='bjrTSfTjQUi') where organisationunitid=(select organisationunitid from organisationunit where uid='IfrfalFKbng');
update programstageinstance set organisationunitid=(select organisationunitid from organisationunit where uid='bjrTSfTjQUi') where organisationunitid=(select organisationunitid from organisationunit where uid='IfrfalFKbng');
update trackedentityprogramowner set organisationunitid=(select organisationunitid from organisationunit where uid='bjrTSfTjQUi') where organisationunitid=(select organisationunitid from organisationunit where uid='IfrfalFKbng');
delete from datavalue where sourceid=(select organisationunitid from organisationunit where uid='IfrfalFKbng');