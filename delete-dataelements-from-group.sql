delete from chart_datadimensionitems where datadimensionitemid in(select datadimensionitemid from datadimensionitem where dataelementid in(select dataelementid from dataelement where dataelementid in(select dataelementid from dataelementgroupmembers where dataelementgroupid in(select dataelementgroupid from dataelementgroup where uid='IENherOuSc1'))));

delete from reporttable_datadimensionitems where datadimensionitemid in(select datadimensionitemid from datadimensionitem where dataelementid in(select dataelementid from dataelement where dataelementid in(select dataelementid from dataelementgroupmembers where dataelementgroupid in(select dataelementgroupid from dataelementgroup where uid='IENherOuSc1'))));

delete from mapview_datadimensionitems where datadimensionitemid in(select datadimensionitemid from datadimensionitem where dataelementid in(select dataelementid from dataelement where dataelementid in(select dataelementid from dataelementgroupmembers where dataelementgroupid in(select dataelementgroupid from dataelementgroup where uid='IENherOuSc1'))));

delete from datadimensionitem where dataelementid in(select dataelementid from dataelement where dataelementid in(select dataelementid from dataelementgroupmembers where dataelementgroupid in(select dataelementgroupid from dataelementgroup where uid='IENherOuSc1')));

delete from dataelementgroupmembers where dataelementid in(select dataelementid from dataelement where dataelementid in(select dataelementid from dataelementgroupmembers where dataelementgroupid in(select dataelementgroupid from dataelementgroup where uid='IENherOuSc1')));

delete from datasetindicators where dataelementid in(select dataelementid from dataelement where dataelementid in(select dataelementid from dataelementgroupmembers where dataelementgroupid in(select dataelementgroupid from dataelementgroup where uid='IENherOuSc1')));

delete from dataelement where dataelementid in(select dataelementid from dataelementgroupmembers where dataelementgroupid in(select dataelementgroupid from dataelementgroup where uid='IENherOuSc1'));


delete from dataelement where name ilike '%CTC%';


delete from dataelementlegendsets where dataelementid in(select dataelementid from dataelement where uid ilike '%SRAREPORT%');
delete from dataelement where uid ilike '%SRAREPORT%';