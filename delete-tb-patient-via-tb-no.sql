select * from trackedentityinstance where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityattributevalue where value='180201102053-6/KK/2022/108');

delete from trackedentityattributevalueaudit where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid in('nMeC5EOemIL'));
delete from trackedentityattributevalue where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid  in('nMeC5EOemIL'));
delete from programstageinstancecomments where programstageinstanceid in(select programstageinstanceid from programstageinstance where programinstanceid in(select programinstanceid from programinstance where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid in('nMeC5EOemIL'))));
delete from programstageinstance where programinstanceid in(select programinstanceid from programinstance where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid in('nMeC5EOemIL')));
delete from programinstance where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid  in('nMeC5EOemIL'));
delete from trackedentityprogramowner where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid in('nMeC5EOemIL')));
delete from trackedentityinstance where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid  in('nMeC5EOemIL'));
