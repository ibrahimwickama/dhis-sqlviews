delete from programstageinstance where programinstanceid in(select programinstanceid from programinstance where uid='rb8qzubM0Ty');
delete from programinstance where uid='rb8qzubM0Ty';


-- Delete a duplicate enrollment
delete from trackedentityattributevalue where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid='uid-value');
delete from programstageinstance where programinstanceid in(select programinstanceid from programinstance where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid='uid-value'));
delete from programinstance where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid='uid-value');
delete from trackedentityinstance where uid='uid-value';