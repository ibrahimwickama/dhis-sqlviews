--  delete dataValues of DataElements of a cretain dataElementGroup
delete from datavalueaudit where dataelementid in(select dataelementid from dataelementgroupmembers where dataelementgroupid in(select dataelementgroupid from dataelementgroup where uid='IENherOuSc1'));
delete from datavalue where dataelementid in(select dataelementid from dataelementgroupmembers where dataelementgroupid in(select dataelementgroupid from dataelementgroup where uid='IENherOuSc1'));
\dt


select * from datavalue where dataelementid in(select dataelementid from dataelementgroupmembers where dataelementgroupid in(select dataelementgroupid from dataelementgroup where uid='IViQ32rQcso'));





docker exec -t container-name pg_dump --no-owner -U db-user db-name > `date +%F`-db-backup.sql
