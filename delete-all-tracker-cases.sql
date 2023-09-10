-- delete organisationunitid on programstageinstance table
delete from programstageinstance where organisationunitid in(select organisationunitid from organisationunit);
-- delete trackedentitydatavalue, trackedentitydatavalueaudit with dependency to organisationunits to be deleted
delete from trackedentitydatavalueaudit where programstageinstanceid in(select programstageinstanceid from  programstageinstance where organisationunitid in(select organisationunitid from organisationunit));
delete from trackedentityattributevalue;
-- delete organisationunitid on trackedentityinstance table
delete from trackedentityprogramowner where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance);
delete from trackedentityattributevalueaudit where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance);
delete from relationship where relationshipid in(select relationshipid from relationshipitem where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance));
delete from relationshipitem where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance);
truncate relationship cascade;
delete from trackedentityinstance where organisationunitid in(select organisationunitid from organisationunit);
delete from programinstance where organisationunitid in(select organisationunitid from organisationunit);