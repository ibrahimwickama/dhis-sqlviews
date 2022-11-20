-- delete outbreak alerts
delete from programinstance where programid in(select programid from program where uid='EYBG2f6X8Yc');

-- delete trackedentityinstance with no enrollment
delete from trackedentityattributevalueaudit where trackedentityinstanceid not in(select trackedentityinstanceid from programinstance);
delete from trackedentityattributevalue where trackedentityinstanceid not in(select trackedentityinstanceid from programinstance);
delete from trackedentityprogramowner where trackedentityinstanceid not in(select trackedentityinstanceid from programinstance);
delete from trackedentityinstance where (storedby='jmdachi' or storedby='ibrahimwickama' or storedby='automationuser' or storedby='ussd') and trackedentityinstanceid not in(select trackedentityinstanceid from programinstance);


-- delete immediate case attribute value for alert ref ID 
delete from trackedentityattributevalueaudit where trackedentityattributeid in(select trackedentityattributeid from trackedentityattribute where uid='jvj35ywfpFB');
delete from trackedentityattributevalue where trackedentityattributeid in(select trackedentityattributeid from trackedentityattribute where uid='jvj35ywfpFB');


-- search for trackedEntityInstances with no enrollment 
select trackedentityinstanceid,uid,createdatclient,lastupdatedby,organisationunitid,storedby from trackedentityinstance where trackedentityinstanceid not in(select trackedentityinstanceid from programinstance);

-- search for trackedEntityInstances with no enrollment with attribute value of caseID
select tei.trackedentityinstanceid,tei.uid,tei.createdatclient,tei.lastupdatedby,tei.organisationunitid,tei.storedby,teav.value 
from trackedentityinstance tei
inner join trackedentityattributevalue teav on teav.trackedentityinstanceid = tei.trackedentityinstanceid
where 
tei.trackedentityinstanceid not in(select trackedentityinstanceid from programinstance) and 
teav.trackedentityattributeid in(select trackedentityattributeid from trackedentityattribute where uid='aVaIArx5S41' or uid='CxSxifEaRzd')
order by tei.createdatclient;


select 
tei.uid as "trackedEntityInstance",
tei.createdatclient,
tei.lastupdatedby,
ou.uid as "orgunitUid",
ou.name as "orgunitName",
tei.storedby,
teav.value as "caseId"
from te_instance tei
inner join te_attributevalue teav on teav.trackedentityinstanceid = tei.trackedentityinstanceid
inner join organisationunit ou on ou.organisationunitid = tei.organisationunitid
where 
tei.trackedentityinstanceid not in(select trackedentityinstanceid from p_instance) and 
teav.trackedentityattributeid in(select trackedentityattributeid from te_attribute tea where tea.uid='aVaIArx5S41' or tea.uid='CxSxifEaRzd')
order by tei.createdatclient;
