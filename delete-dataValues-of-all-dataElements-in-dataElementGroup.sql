--  delete dataValues of DataElements of a cretain dataElementGroup
delete from datavalueaudit where dataelementid in(select dataelementid from dataelementgroupmembers where dataelementgroupid in(select dataelementgroupid from dataelementgroup where uid='e0JZip33LfY'));
delete from datavalue where dataelementid in(select dataelementid from dataelementgroupmembers where dataelementgroupid in(select dataelementgroupid from dataelementgroup where uid='e0JZip33LfY'));



select * from datavalue where dataelementid in(select dataelementid from dataelementgroupmembers where dataelementgroupid in(select dataelementgroupid from dataelementgroup where uid='IViQ32rQcso'));
