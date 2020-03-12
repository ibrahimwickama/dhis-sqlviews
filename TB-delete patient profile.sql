-- Find first trackedentityinstance uid of patient TB number
select uid from trackedentityinstance where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityattributevalue where value='070204/KK/2020/0097');
-- Then place the uid in uid part of the delete queries
delete from trackedentityattributevalueaudit where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid='');
delete from trackedentityattributevalue where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid='');
delete from trackedentityinstance where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid='');
delete from trackedentityattributevalue where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid='');
