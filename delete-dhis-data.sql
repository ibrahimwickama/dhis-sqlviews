
delete from trackedentitydatavalueaudit where programstageinstanceid in(select programstageinstanceid from  programstageinstance where programstageinstanceid in(select programstageinstanceid from programstageinstance ));
delete from trackedentitydatavalue where programstageinstanceid in(select programstageinstanceid from  programstageinstance where programstageinstanceid in(select programstageinstanceid from programstageinstance ));
delete from programstageinstancecomments where programstageinstanceid in(select programstageinstanceid from programstageinstance );
delete from programstageinstance where programstageinstanceid in(select programstageinstanceid from programstageinstance );
delete from datavalueaudit where created between '2012-01-01' and '2023-03-18';
delete from datavalue where created between '2012-01-01' and '2023-03-18';
-- delete from datavalue where created<='2023-03-18';
/dt