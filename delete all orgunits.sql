-- delete ogranisation units dataValues on all wisn dataSets
delete from datavalueaudit where organisationunitid in(select organisationunitid from organisationunit);
delete from datavalue where sourceid in(select organisationunitid from organisationunit);
-- delete organisationunitid on datasetsource table
delete from datasetsource where sourceid in(select organisationunitid from organisationunit);
-- delete organisationunitid on completedatasetregistration table
delete from completedatasetregistration where sourceid in(select organisationunitid from organisationunit);
-- delete organisationunitid on program_organisationunits table
delete from program_organisationunits where organisationunitid in(select organisationunitid from organisationunit);
delete from trackedentitydatavalueaudit where programstageinstanceid in(select programstageinstanceid from  programstageinstance where programstageid in(select programstageid from programstage where programid in(select programid from program)) and organisationunitid in(select organisationunitid from organisationunit));
delete from trackedentitydatavalue where programstageinstanceid in(select programstageinstanceid from  programstageinstance where programstageid in(select programstageid from programstage where programid in(select programid from program)) and organisationunitid in(select organisationunitid from organisationunit));
delete from programstageinstance where programstageid in(select programstageid from programstage where programid in(select programid from program)) and organisationunitid in(select organisationunitid from organisationunit);
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
delete from trackedentityinstance where organisationunitid in(select organisationunitid from organisationunit);
delete from programinstance where organisationunitid in(select organisationunitid from organisationunit);
-- delete organisationunitid on categoryoption_organisationunit table
delete from categoryoption_organisationunits where organisationunitid in(select organisationunitid from organisationunit);
-- dele organisation units on groups
delete from orgunitgroupmembers where organisationunitid in(select organisationunitid from organisationunit);
delete from userdatavieworgunits;
delete from usermembership;
-- delete actual organisationunits
delete from organisationunit;
