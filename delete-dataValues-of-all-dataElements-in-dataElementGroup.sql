--  delete dataValues of DataElements of a cretain dataElementGroup
delete from datavalueaudit where dataelementid in(select dataelementid from dataelementgroupmembers where dataelementgroupid in(select dataelementgroupid from dataelementgroup where uid='e0JZip33LfY'));
delete from datavalue where dataelementid in(select dataelementid from dataelementgroupmembers where dataelementgroupid in(select dataelementgroupid from dataelementgroup where uid='e0JZip33LfY'));
\dt



--  delete dataValues of DataElements of a cretain dataElementGroup
delete from datavalueaudit where dataelementid in(select dataelementid from dataelementgroupmembers where dataelementgroupid in(select dataelementgroupid from dataelementgroup where uid='gIMeIniXGeP')) and organisationunitid in(select organisationunitid from organisationunit where uid='GRDYT0QagNn');
delete from datavalue where dataelementid in(select dataelementid from dataelementgroupmembers where dataelementgroupid in(select dataelementgroupid from dataelementgroup where uid='gIMeIniXGeP')) and sourceid in(select organisationunitid from organisationunit where uid='GRDYT0QagNn');
\dt



--  delete dataValues of DataElements of a cretain dataElementGroup
delete from datavalueaudit where dataelementid in(select dataelementid from dataelementgroupmembers where dataelementgroupid in(select dataelementgroupid from dataelementgroup where uid='e0JZip33LfY')) and periodid in(176819244,181721923,181721924,181722440,181722439,181722441,181722714,181723589,181723590,181723477,181723478,181723476);
delete from datavalue where dataelementid in(select dataelementid from dataelementgroupmembers where dataelementgroupid in(select dataelementgroupid from dataelementgroup where uid='e0JZip33LfY')) and periodid in(176819244,181721923,181721924,181722440,181722439,181722441,181722714,181723589,181723590,181723477,181723478,181723476);
\dt


select * from datavalue where dataelementid in(select dataelementid from dataelementgroupmembers where dataelementgroupid in(select dataelementgroupid from dataelementgroup where uid='IViQ32rQcso'));





docker exec -t container-name pg_dump --no-owner -U db-user db-name > `date +%F`-db-backup.sql


from datavalue where dataelementid in(select dataelementid from dataelementgroupmembers where dataelementgroupid in(select dataelementgroupid from dataelementgroup where uid='e0JZip33LfY')) and sourceid in(select organisationunitid from organisationunit where hierarchylevel=4);

