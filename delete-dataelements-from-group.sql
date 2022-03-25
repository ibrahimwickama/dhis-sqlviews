delete from chart_datadimensionitems where datadimensionitemid in(select datadimensionitemid from datadimensionitem where dataelementid in(select dataelementid from dataelement where dataelementid in(select dataelementid from dataelementgroupmembers where dataelementgroupid in(select dataelementgroupid from dataelementgroup where uid='Zi0ONfWeUln'))));

delete from reporttable_datadimensionitems where datadimensionitemid in(select datadimensionitemid from datadimensionitem where dataelementid in(select dataelementid from dataelement where dataelementid in(select dataelementid from dataelementgroupmembers where dataelementgroupid in(select dataelementgroupid from dataelementgroup where uid='Zi0ONfWeUln'))));

delete from mapview_datadimensionitems where datadimensionitemid in(select datadimensionitemid from datadimensionitem where dataelementid in(select dataelementid from dataelement where dataelementid in(select dataelementid from dataelementgroupmembers where dataelementgroupid in(select dataelementgroupid from dataelementgroup where uid='Zi0ONfWeUln'))));

delete from datadimensionitem where dataelementid in(select dataelementid from dataelement where dataelementid in(select dataelementid from dataelementgroupmembers where dataelementgroupid in(select dataelementgroupid from dataelementgroup where uid='Zi0ONfWeUln')));

delete from dataelementgroupmembers where dataelementid in(select dataelementid from dataelement where dataelementid in(select dataelementid from dataelementgroupmembers where dataelementgroupid in(select dataelementgroupid from dataelementgroup where uid='Zi0ONfWeUln')));

delete from datasetindicators where dataelementid in(select dataelementid from dataelement where dataelementid in(select dataelementid from dataelementgroupmembers where dataelementgroupid in(select dataelementgroupid from dataelementgroup where uid='Zi0ONfWeUln')));

delete from dataelement where dataelementid in(select dataelementid from dataelementgroupmembers where dataelementgroupid in(select dataelementgroupid from dataelementgroup where uid='Zi0ONfWeUln'));





delete from dataelementlegendsets where dataelementid in(select dataelementid from dataelement where uid ilike '%SRAREPORT%');
delete from dataelement where uid ilike '%SRAREPORT%';