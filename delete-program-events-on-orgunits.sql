
delete from trackedentitydatavalueaudit where programstageinstanceid in(select programstageinstanceid from  programstageinstance where programstageid in(select programstageid from programstage where programid in(select programid from program where uid='BLJKZVvEjPn')) and organisationunitid in(select organisationunitid from organisationunit));
delete from trackedentitydatavalue where programstageinstanceid in(select programstageinstanceid from  programstageinstance where programstageid in(select programstageid from programstage where programid in(select programid from program where uid='BLJKZVvEjPn')) and organisationunitid in(select organisationunitid from organisationunit));
delete from programstageinstance where programstageid in(select programstageid from programstage where programid in(select programid from program where uid='BLJKZVvEjPn')) and organisationunitid in(select organisationunitid from organisationunit);


-- delete all tracker data
delete from trackedentitydatavalueaudit;
delete from trackedentitydatavalue;
delete from trackedentityattributeattributevalues;
delete from trackedentityattributevalue;
delete from programstageinstance;
delete from programinstance;