
delete from trackedentitydatavalueaudit where programstageinstanceid in(select programstageinstanceid from  programstageinstance where programstageinstanceid in(select programstageinstanceid from programstageinstance where executiondate between '2012-01-01' and '2019-12-31'));
delete from trackedentitydatavalue where programstageinstanceid in(select programstageinstanceid from  programstageinstance where programstageinstanceid in(select programstageinstanceid from programstageinstance where executiondate between '2012-01-01' and '2019-12-31'));
delete from programstageinstancecomments where programstageinstanceid in(select programstageinstanceid from programstageinstance where executiondate between '2012-01-01' and '2019-12-31');
delete from programstageinstance where programstageinstanceid in(select programstageinstanceid from programstageinstance where executiondate between '2012-01-01' and '2019-12-31');
delete from datavalueaudit where created between '2012-01-01' and '2019-12-31';
delete from datavalue where created between '2012-01-01' and '2019-12-31';
-- delete from datavalue where created<='2019-12-31';
/dt