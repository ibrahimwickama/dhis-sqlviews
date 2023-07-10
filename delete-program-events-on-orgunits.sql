-- Delete all tracker data for a specific orgunit 
delete from trackedentitydatavalueaudit where programstageinstanceid in(select programstageinstanceid from  programstageinstance where organisationunitid in(select organisationunitid from organisationunit where uid='b6OKLRDLlT4'));
delete from programstageinstance where programstageid in(select programstageid from programstage where programid in(select programid from program)) and organisationunitid in(select organisationunitid from organisationunit where uid='b6OKLRDLlT4');
delete from programstageinstance where organisationunitid in(select organisationunitid from organisationunit where uid='b6OKLRDLlT4');
delete from trackedentityattributevalue where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where organisationunitid in(select organisationunitid from organisationunit where uid='b6OKLRDLlT4'));
delete from trackedentityprogramowner where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where organisationunitid in(select organisationunitid from organisationunit where uid='b6OKLRDLlT4'));
delete from trackedentityattributevalueaudit where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where organisationunitid in(select organisationunitid from organisationunit where uid='b6OKLRDLlT4'));
delete from relationship where relationshipid in(select relationshipid from relationshipitem where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where organisationunitid in(select organisationunitid from organisationunit where uid='b6OKLRDLlT4'))) cascade;
delete from relationshipitem cascade where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where organisationunitid in(select organisationunitid from organisationunit where uid='b6OKLRDLlT4'));
-- truncate relationship cascade;
delete from programinstance where organisationunitid in(select organisationunitid from organisationunit where uid='b6OKLRDLlT4');
delete from trackedentityinstance where organisationunitid in(select organisationunitid from organisationunit where uid='b6OKLRDLlT4');


