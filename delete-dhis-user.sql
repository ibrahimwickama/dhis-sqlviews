delete from userrolemembers cascade where userid in(select userid from users cascade where username not in('username'));
delete from previouspasswords cascade where userid in(select userid from users cascade where username not in('username'));
delete from users cascade where username not in('username');