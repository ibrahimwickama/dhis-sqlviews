delete from programstageinstance where programinstanceid in(select programinstanceid from programinstance where uid='rb8qzubM0Ty');
delete from programinstance where uid='rb8qzubM0Ty';


-- Delete a duplicate enrollment
delete from trackedentityattributevalue where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid='uid-value');
delete from programstageinstance where programinstanceid in(select programinstanceid from programinstance where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid='uid-value'));
delete from programinstance where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid='uid-value');
delete from trackedentityinstance where uid='uid-value';







'yDuAzyqYABS','LGJoObFBwXP','EATVU8tbvb7','wQaWU3KPllK','uYjxkTbwRNf','MNhYWMkR0Z7','qSiV0NsfHOf','DM9n1bUw8W8','xymcybnBNas'


-- Delete a duplicate enrollment
-- delete from trackedentityattributevalue where programstageinstanceid in(select programstageinstanceid from  programstageinstance where programstageid in(select programstageid from programstage where programid in(select programid from program where uid='BLJKZVvEjPn')));
delete from trackedentityattributevalue where trackedentityinstanceid in(select trackedentityinstanceid from programinstance where programid in(select programid from program where uid in ('yDuAzyqYABS','LGJoObFBwXP','EATVU8tbvb7','wQaWU3KPllK','uYjxkTbwRNf','MNhYWMkR0Z7','qSiV0NsfHOf','DM9n1bUw8W8','xymcybnBNas')));
delete from programmessage_phonenumbers where programmessagephonenumberid in(select id from programmessage where programstageinstanceid in(select programstageinstanceid from programstageinstance where programstageid in(select programstageid from programstage where programid in(select programid from program where uid in ('yDuAzyqYABS','LGJoObFBwXP','EATVU8tbvb7','wQaWU3KPllK','uYjxkTbwRNf','MNhYWMkR0Z7','qSiV0NsfHOf','DM9n1bUw8W8','xymcybnBNas')))));
delete from programmessage_deliverychannels where programmessagedeliverychannelsid in(select id from programmessage where programstageinstanceid in(select programstageinstanceid from programstageinstance where programstageid in(select programstageid from programstage where programid in(select programid from program where uid in ('yDuAzyqYABS','LGJoObFBwXP','EATVU8tbvb7','wQaWU3KPllK','uYjxkTbwRNf','MNhYWMkR0Z7','qSiV0NsfHOf','DM9n1bUw8W8','xymcybnBNas')))));
delete from programmessage_emailaddresses where programmessageemailaddressid in(select id from programmessage where programstageinstanceid in(select programstageinstanceid from programstageinstance where programstageid in(select programstageid from programstage where programid in(select programid from program where uid in ('yDuAzyqYABS','LGJoObFBwXP','EATVU8tbvb7','wQaWU3KPllK','uYjxkTbwRNf','MNhYWMkR0Z7','qSiV0NsfHOf','DM9n1bUw8W8','xymcybnBNas')))));
delete from programmessage where programstageinstanceid in(select programstageinstanceid from programstageinstance where programstageid in(select programstageid from programstage where programid in(select programid from program where uid in ('yDuAzyqYABS','LGJoObFBwXP','EATVU8tbvb7','wQaWU3KPllK','uYjxkTbwRNf','MNhYWMkR0Z7','qSiV0NsfHOf','DM9n1bUw8W8','xymcybnBNas'))));

delete from trackedentitydatavalueaudit where programstageinstanceid in(select programstageinstanceid from programstageinstance where programstageid in(select programstageid from programstage where programid in(select programid from program where uid in ('yDuAzyqYABS','LGJoObFBwXP','EATVU8tbvb7','wQaWU3KPllK','uYjxkTbwRNf','MNhYWMkR0Z7','qSiV0NsfHOf','DM9n1bUw8W8','xymcybnBNas'))));
delete from programstageinstance where programstageid in(select programstageid from programstage where programid in(select programid from program where uid in ('yDuAzyqYABS','LGJoObFBwXP','EATVU8tbvb7','wQaWU3KPllK','uYjxkTbwRNf','MNhYWMkR0Z7','qSiV0NsfHOf','DM9n1bUw8W8','xymcybnBNas')));
delete from programinstance where programid in(select programid from program where uid in ('yDuAzyqYABS','LGJoObFBwXP','EATVU8tbvb7','wQaWU3KPllK','uYjxkTbwRNf','MNhYWMkR0Z7','qSiV0NsfHOf','DM9n1bUw8W8','xymcybnBNas'));
delete from trackedentityinstance where trackedentityinstanceid in(select trackedentityinstanceid from programinstance where programid in(select programid from program where uid in ('yDuAzyqYABS','LGJoObFBwXP','EATVU8tbvb7','wQaWU3KPllK','uYjxkTbwRNf','MNhYWMkR0Z7','qSiV0NsfHOf','DM9n1bUw8W8','xymcybnBNas')));
\dt




select count(*) programmessage where programstageinstanceid in(select programstageinstanceid from programstageinstance where programstageid in(select programstageid from programstage where programid in(select programid from program where uid in ('yDuAzyqYABS','LGJoObFBwXP','EATVU8tbvb7','wQaWU3KPllK','uYjxkTbwRNf','MNhYWMkR0Z7','qSiV0NsfHOf','DM9n1bUw8W8','xymcybnBNas'))));

truncate programmessage_phonenumbers;
truncate programmessage_deliverychannels;
truncate programmessage_emailaddresses;

SELECT table_name, table_type, pg_size_pretty( pg_total_relation_size(table_name) ) as size FROM information_schema.tables WHERE table_schema = 'public' order by table_name asc;