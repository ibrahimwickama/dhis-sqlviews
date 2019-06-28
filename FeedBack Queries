select messageid,messagetext,userid,lastupdated from message where to_char(lastupdated, 'YYYY-MM-DD HH24:MI:SS') like '2017-05%'



select firstname,surname,uid,userinfoid from userinfo



    // query gives user fname lname user uid and message text and its id and time
select userinfo.uid,userinfo.firstname,userinfo.surname,message.messageid,message.messagetext,message.lastupdated 
from message
inner join userinfo on userinfo.userinfoid = message.userid
where to_char(message.lastupdated, 'YYYY-MM-DD HH24:MI:SS') like '2017-05%'




select * from usergroupmembers

// feedback group uid 82034




select * from usergroupmembers where usergroupid = '82034'


select usergroupid from usergroup where name like 'Feedback Recipients'



    // query fetchs all users assigned to feedback receipnts group
select userinfo.uid,userinfo.firstname,userinfo.surname,usergroup.name, usergroup.usergroupid, usergroupmembers.userid
from usergroupmembers
inner join usergroup on usergroup.usergroupid = usergroupmembers.usergroupid
inner join userinfo on userinfo.userinfoid = usergroupmembers.userid
where usergroup.name like 'Feedback Recipients'





select userinfo.uid,userinfo.firstname,userinfo.surname,message.messageid,message.messagetext,message.lastupdated 
from message
inner join userinfo on userinfo.userinfoid = message.userid
where to_char(message.lastupdated, 'YYYY-MM-DD HH24:MI:SS') like '2017-05%' AND
exists (select userinfo.userinfoid,userinfo.firstname,userinfo.surname,usergroup.name, usergroup.usergroupid, usergroupmembers.userid
from usergroupmembers
inner join usergroup on usergroup.usergroupid = usergroupmembers.usergroupid
inner join userinfo on userinfo.userinfoid = usergroupmembers.userid
where usergroup.name like 'Feedback Recipients')




 // PERFECT query
select userinfo.uid,userinfo.firstname,userinfo.surname,message.messageid,message.messagetext,message.lastupdated 
from message
inner join userinfo on userinfo.userinfoid = message.userid
where to_char(message.lastupdated, 'YYYY-MM-DD HH24:MI:SS') like '2018%' AND message.userid IN (select userinfoid
from usergroupmembers
inner join usergroup on usergroup.usergroupid = usergroupmembers.usergroupid
inner join userinfo on userinfo.userinfoid = usergroupmembers.userid
where usergroup.name like 'Feedback Recipients')



// make a date range 
where to_char(message.lastupdated, 'YYYY-MM-DD HH24:MI:SS') between '2018-01-03' AND '2018-02-03'
