delete from chart_datadimensionitems where datadimensionitemid in(select datadimensionitemid from datadimensionitem where indicatorid in(select indicatorid from indicator where uid in('vVRVLjgU10c')));

delete from reporttable_datadimensionitems where datadimensionitemid in(select datadimensionitemid from datadimensionitem where indicatorid in(select indicatorid from indicator where uid in('vVRVLjgU10c')));

delete from mapview_datadimensionitems where datadimensionitemid in(select datadimensionitemid from datadimensionitem where indicatorid in(select indicatorid from indicator where uid in('vVRVLjgU10c')));

delete from visualization_datadimensionitems where datadimensionitemid in(select datadimensionitemid from datadimensionitem where indicatorid in(select indicatorid from indicator where uid in('vVRVLjgU10c')));

delete from datadimensionitem where indicatorid in(select indicatorid from indicator where uid in('vVRVLjgU10c'));

delete from indicatorgroupmembers where indicatorid in(select indicatorid from indicator where uid in('vVRVLjgU10c'));

delete from datasetindicators where indicatorid in(select indicatorid from indicator where uid in('vVRVLjgU10c'));

delete from indicator where uid in('vVRVLjgU10c');

