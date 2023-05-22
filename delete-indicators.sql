delete from chart_datadimensionitems where datadimensionitemid in(select datadimensionitemid from datadimensionitem where indicatorid in(select indicatorid from indicator where uid in('ByUwUUbtKwN')));

delete from reporttable_datadimensionitems where datadimensionitemid in(select datadimensionitemid from datadimensionitem where indicatorid in(select indicatorid from indicator where uid in('ByUwUUbtKwN')));

delete from mapview_datadimensionitems where datadimensionitemid in(select datadimensionitemid from datadimensionitem where indicatorid in(select indicatorid from indicator where uid in('ByUwUUbtKwN')));

delete from visualization_datadimensionitems where datadimensionitemid in(select datadimensionitemid from datadimensionitem where indicatorid in(select indicatorid from indicator where uid in('ByUwUUbtKwN')));

delete from datadimensionitem where indicatorid in(select indicatorid from indicator where uid in('ByUwUUbtKwN'));

delete from indicatorgroupmembers where indicatorid in(select indicatorid from indicator where uid in('ByUwUUbtKwN'));

delete from datasetindicators where indicatorid in(select indicatorid from indicator where uid in('ByUwUUbtKwN'));

delete from indicator where uid in('ByUwUUbtKwN');

