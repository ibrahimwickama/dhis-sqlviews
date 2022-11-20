-- List all primary keys from tables in database
COPY(select tab.table_schema,
       tab.table_name,
       tco.constraint_name,
       string_agg(kcu.column_name, ', ') as key_columns
from information_schema.tables tab
left join information_schema.table_constraints tco
          on tco.table_schema = tab.table_schema
          and tco.table_name = tab.table_name
          and tco.constraint_type = 'PRIMARY KEY'
left join information_schema.key_column_usage kcu 
          on kcu.constraint_name = tco.constraint_name
          and kcu.constraint_schema = tco.constraint_schema
          and kcu.constraint_name = tco.constraint_name
where tab.table_schema not in ('pg_catalog', 'information_schema')
      and tab.table_type = 'BASE TABLE'
group by tab.table_schema,
         tab.table_name,
         tco.constraint_name
order by tab.table_schema,
         tab.table_name) to '/tmp/tland-db-pkey.csv' with csv header;



-- DELETION PROCESS
delete from usermessage where usermessageid < 0;
delete from datastatisticsevent where eventid < 0;
delete from message where messageid < 0;
delete from messageconversation where messageconversationid < 0;


delete from visualization_datadimensionitems where datadimensionitemid < 0;
delete from mapview_datadimensionitems where datadimensionitemid < 0;
delete from datadimensionitem where datadimensionitemid < 0;

delete from programstageinstance where programstageinstanceid < 0;
delete from datasetelement where datasetelementid < 0;
delete from visualization_categorydimensions where visualizationid in(select visualizationid from visualization where relativeperiodsid < 0);
delete from visualization_columns where visualizationid in(select visualizationid from visualization where relativeperiodsid < 0);
delete from visualization_filters where visualizationid in(select visualizationid from visualization where relativeperiodsid < 0);
delete from visualization_organisationunits where visualizationid in(select visualizationid from visualization where relativeperiodsid < 0);
delete from visualization_orgunitgroupsetdimensions where visualizationid in(select visualizationid from visualization where relativeperiodsid < 0);
delete from visualization_periods where visualizationid in(select visualizationid from visualization where relativeperiodsid < 0);
delete from visualization_rows where visualizationid in(select visualizationid from visualization where relativeperiodsid < 0);
delete from visualization_orgunitlevels where visualizationid in(select visualizationid from visualization where relativeperiodsid < 0);
delete from visualization_itemorgunitgroups where visualizationid in(select visualizationid from visualization where relativeperiodsid < 0);
delete from visualization_yearlyseries where visualizationid in(select visualizationid from visualization where relativeperiodsid < 0);
delete from visualization_categoryoptiongroupsetdimensions where visualizationid in(select visualizationid from visualization where relativeperiodsid < 0);
delete from interpretation_comments where interpretationid in(select interpretationid from interpretation where visualizationid in(select visualizationid from visualization where relativeperiodsid < 0));
delete from intepretation_likedby where interpretationid in(select interpretationid from interpretation where visualizationid in(select visualizationid from visualization where relativeperiodsid < 0));
delete from interpretation where visualizationid in(select visualizationid from visualization where relativeperiodsid < 0);
delete from dashboard_items where dashboarditemid in(select dashboarditemid from dashboarditem where visualizationid in(select visualizationid from visualization where relativeperiodsid < 0));
delete from dashboarditem where visualizationid in(select visualizationid from visualization where relativeperiodsid < 0);
delete from visualization where relativeperiodsid < 0;

delete from mapmapviews where mapviewid in(select mapviewid from mapview where relativeperiodsid < 0);
delete from mapview_columns where mapviewid in(select mapviewid from mapview where relativeperiodsid < 0);
delete from mapview_filters where mapviewid in(select mapviewid from mapview where relativeperiodsid < 0);
delete from mapview_organisationunits where mapviewid in(select mapviewid from mapview where relativeperiodsid < 0);
delete from mapview_orgunitlevels where mapviewid in(select mapviewid from mapview where relativeperiodsid < 0);
delete from mapview_periods where mapviewid in(select mapviewid from mapview where relativeperiodsid < 0);
delete from mapview_itemorgunitgroups where mapviewid in(select mapviewid from mapview where relativeperiodsid < 0);
delete from mapview_categorydimensions where mapviewid in(select mapviewid from mapview where relativeperiodsid < 0);
delete from mapview_orgunitgroupsetdimensions where mapviewid in(select mapviewid from mapview where relativeperiodsid < 0);
delete from mapview_categoryoptiongroupsetdimensions where mapviewid in(select mapviewid from mapview where relativeperiodsid < 0);
delete from mapview where relativeperiodsid < 0;


delete from dashboarditem_reports where reportid in(select reportid from report where relativeperiodsid < 0);
delete from report where relativeperiodsid < 0;

delete from eventreport_columns where eventreportid in(select eventreportid from eventreport where relativeperiodsid < 0);
delete from eventreport_dataelementdimensions where eventreportid in(select eventreportid from eventreport where relativeperiodsid < 0);
delete from eventreport_organisationunits where eventreportid in(select eventreportid from eventreport where relativeperiodsid < 0);
delete from eventreport_periods where eventreportid in(select eventreportid from eventreport where relativeperiodsid < 0);
delete from eventreport_programindicatordimensions where eventreportid in(select eventreportid from eventreport where relativeperiodsid < 0);
delete from eventreport_orgunitlevels where eventreportid in(select eventreportid from eventreport where relativeperiodsid < 0);
delete from eventreport_rows where eventreportid in(select eventreportid from eventreport where relativeperiodsid < 0);
delete from eventreport_filters where eventreportid in(select eventreportid from eventreport where relativeperiodsid < 0);
delete from eventreport_orgunitgroupsetdimensions where eventreportid in(select eventreportid from eventreport where relativeperiodsid < 0);

delete from dashboard_items where dashboarditemid in(select dashboarditemid from dashboarditem where eventreport in(select eventreportid from eventreport where relativeperiodsid < 0));
delete from dashboarditem where eventreport in(select eventreportid from eventreport where relativeperiodsid < 0);
delete from eventreport where relativeperiodsid < 0;

delete from eventchart_columns where eventchartid in(select eventchartid from eventchart where relativeperiodsid < 0);
delete from eventchart_dataelementdimensions where eventchartid in(select eventchartid from eventchart where relativeperiodsid < 0);
delete from eventchart_filters where eventchartid in(select eventchartid from eventchart where relativeperiodsid < 0);
delete from eventchart_organisationunits where eventchartid in(select eventchartid from eventchart where relativeperiodsid < 0);
delete from eventchart_rows where eventchartid in(select eventchartid from eventchart where relativeperiodsid < 0);
delete from eventchart where relativeperiodsid < 0;
delete from relativeperiods where relativeperiodsid < 0;



delete from dataelementoperand where dataelementoperandid < 0;
delete from trackedentityprogramowner where trackedentityprogramownerid < 0;
delete from dataapprovalaudit where dataapprovalauditid < 0;
delete from dataapproval where dataapprovalid < 0;


delete from eventreport_dataelementdimensions where trackedentitydataelementdimensionid < 0;
delete from trackedentitydataelementdimension where trackedentitydataelementdimensionid < 0;
delete from eventreport_programindicatordimensions where trackedentityprogramindicatordimensionid < 0;
delete from trackedentityprogramindicatordimension where trackedentityprogramindicatordimensionid < 0;


delete from trackedentityattributevalue where trackedentityinstanceid < 0;
delete from trackedentityattributevalueaudit where trackedentityinstanceid < 0;
delete from trackedentityinstance where trackedentityinstanceid < 0;


delete from programinstance where programinstanceid < 0;
delete from userkeyjsonvalue where userid < 0 or creatoruserid < 0;
delete from userrolemembers where userid in(select userid from users where userid < 0 or creatoruserid < 0);
delete from previouspasswords where userid in(select userid from users where userid < 0 or creatoruserid < 0);
delete from users where userid < 0 or creatoruserid < 0;
delete from userdatavieworgunits where userinfoid < 0;
delete from usergroupmembers where userid < 0;
delete from usermembership where userinfoid < 0;
delete from usersetting where userinfoid < 0;
delete from userapps where userinfoid < 0;
delete from trackedentityattributevalue where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where lastupdatedby < 0);
delete from trackedentityinstance where lastupdatedby < 0;
delete from mapmapviews where mapid in(select mapid from map where lastupdatedby < 0);
delete from dashboard_items where dashboarditemid in(select dashboarditemid from dashboarditem where mapid in(select mapid from map where lastupdatedby < 0));
delete from dashboarditem where mapid in(select mapid from map where lastupdatedby < 0);
delete from map where lastupdatedby < 0;
delete from fileresource where userid < 0;

delete from dashboard where userid < 0;
delete from keyjsonvalue where userid < 0;
delete from keyjsonvalue where lastupdatedby < 0;
delete from dashboarditem_users where userid in(select userinfoid from userinfo where userinfoid < 0);
delete from interpretation_comments where interpretationid in(select interpretationid from interpretation where userid in(select userinfoid from userinfo where userinfoid < 0));
delete from intepretation_likedby where interpretationid in(select interpretationid from interpretation where userid in(select userinfoid from userinfo where userinfoid < 0));
delete from interpretation where userid in(select userinfoid from userinfo where userinfoid < 0);
delete from trackedentitycomment where lastupdatedby in(select userinfoid from userinfo where userinfoid < 0);
delete from intepretation_likedby where userid in(select userinfoid from userinfo where userinfoid < 0);
delete from interpretation_comments where interpretationcommentid in(select interpretationcommentid from interpretationcomment where userid in(select userinfoid from userinfo where userinfoid < 0));
delete from interpretationcomment where userid in(select userinfoid from userinfo where userinfoid < 0);


delete from mapmapviews where mapid in(select mapid from map where userid in(select userinfoid from userinfo where userinfoid < 0));
delete from dashboard_items where dashboarditemid in(select dashboarditemid from dashboarditem where mapid in(select mapid from map where userid in(select userinfoid from userinfo where userinfoid < 0)));
delete from dashboarditem where mapid in(select mapid from map where userid in(select userinfoid from userinfo where userinfoid < 0));
delete from map where userid in(select userinfoid from userinfo where userinfoid < 0);

delete from dataelementgroupmembers where dataelementid in(select dataelementid from dataelement where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from smscommandcodes where codeid in(select smscodeid from smscodes where dataelementid in(select dataelementid from dataelement where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0)));
delete from smscodes where dataelementid in(select dataelementid from dataelement where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from datasetmembers where dataelementid in(select dataelementid from dataelement where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from visualization_datadimensionitems where datadimensionitemid in(select datadimensionitemid from datadimensionitem where dataelementid in(select dataelementid from dataelement where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0)));
delete from visualization_datadimensionitems where datadimensionitemid in(select datadimensionitemid from datadimensionitem where dataelementoperand_dataelementid in(select dataelementid from dataelement where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0)));
delete from mapview_datadimensionitems where datadimensionitemid in(select datadimensionitemid from datadimensionitem where dataelementid in(select dataelementid from dataelement where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0)));
delete from mapview_datadimensionitems where datadimensionitemid in(select datadimensionitemid from datadimensionitem where dataelementoperand_dataelementid in(select dataelementid from dataelement where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0)));
delete from datadimensionitem where dataelementid in(select dataelementid from dataelement where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from datadimensionitem where dataelementoperand_dataelementid in(select dataelementid from dataelement where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from dataelementoperand where dataelementid in(select dataelementid from dataelement where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from minmaxdataelement where dataelementid in(select dataelementid from dataelement where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from predictororgunitlevels where predictorid in(select predictorid from predictor where generatoroutput in(select dataelementid from dataelement where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0)));
delete from predictorgroupmembers where predictorid in(select predictorid from predictor where generatoroutput in(select dataelementid from dataelement where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0)));
delete from predictor where generatoroutput in(select dataelementid from dataelement where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from dataelementlegendsets where dataelementid in(select dataelementid from dataelement where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from datasetelement where dataelementid in(select dataelementid from dataelement where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from dataelementaggregationlevels where dataelementid in(select dataelementid from dataelement where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from dataelement where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0);
delete from dataelementgroupmembers where dataelementgroupid in(select dataelementgroupid from dataelementgroup where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from dataelementgroup where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0);

delete from datasetsource where datasetid in(select datasetid from dataset where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from datasetindicators where datasetid in(select datasetid from dataset where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from interpretation_comments where interpretationid in(select interpretationid from interpretation where datasetid in(select datasetid from dataset where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0)));
delete from interpretation where datasetid in(select datasetid from dataset where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from dataset where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0);
delete from indicatorgroupmembers where indicatorid in(select indicatorid from indicator where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from datadimensionitem where indicatorid in(select indicatorid from indicator where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from indicatorlegendsets where indicatorid in(select indicatorid from indicator where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from indicator where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0);
delete from orgunitgroupmembers where orgunitgroupid in(select orgunitgroupid from orgunitgroup where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from orgunitgroup where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0);
delete from indicatorgroupmembers where indicatorgroupid in(select indicatorgroupid from indicatorgroup where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from indicatorgroupsetmembers where indicatorgroupid in(select indicatorgroupid from indicatorgroup where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from indicatorgroup where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0);
delete from datasetsource where datasetid in(select datasetid from dataset where dataentryform in(select dataentryformid from dataentryform where lastupdatedby in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0)));

delete from visualization_datadimensionitems where datadimensionitemid in(select datadimensionitemid from datadimensionitem where datasetid in(select datasetid from dataset where dataentryform in(select dataentryformid from dataentryform where lastupdatedby in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0))));
delete from datadimensionitem where datasetid in(select datasetid from dataset where dataentryform in(select dataentryformid from dataentryform where lastupdatedby in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0)));
delete from datasetmembers where datasetid in(select datasetid from dataset where dataentryform in(select dataentryformid from dataentryform where lastupdatedby in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0)));
-- ended here 
delete from smscommandcodes where codeid in(select smscommandid from smscommands where datasetid in(select datasetid from dataset where dataentryform in(select dataentryformid from dataentryform where lastupdatedby in(select userinfoid from userinfo where userinfoid < 0))));
delete from smscommandcodes where id in(select smscommandid from smscommands where datasetid in(select datasetid from dataset where dataentryform in(select dataentryformid from dataentryform where lastupdatedby in(select userinfoid from userinfo where userinfoid < 0))));
delete from smscommands where datasetid in(select datasetid from dataset where dataentryform in(select dataentryformid from dataentryform where lastupdatedby in(select userinfoid from userinfo where userinfoid < 0)));
delete from userroledataset where datasetid in(select datasetid from dataset where dataentryform in(select dataentryformid from dataentryform where lastupdatedby in(select userinfoid from userinfo where userinfoid < 0)));
delete from datasetindicators where datasetid in(select datasetid from dataset where dataentryform in(select dataentryformid from dataentryform where lastupdatedby in(select userinfoid from userinfo where userinfoid < 0)));
delete from interpretation where datasetid in(select datasetid from dataset where dataentryform in(select dataentryformid from dataentryform where lastupdatedby in(select userinfoid from userinfo where userinfoid < 0)));
delete from dataset where dataentryform in(select dataentryformid from dataentryform where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from dataentryform where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0);
delete from maplegend where maplegendsetid in(select maplegendsetid from maplegendset where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from maplegendset where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0);
delete from datasetsource where sourceid in(select organisationunitid from organisationunit where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from minmaxdataelement where sourceid in(select organisationunitid from organisationunit where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from orgunitgroupmembers where organisationunitid in(select organisationunitid from organisationunit where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from program_organisationunits where organisationunitid in(select organisationunitid from organisationunit where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));

delete from trackedentityattributevalue where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where organisationunitid in(select organisationunitid from organisationunit where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0)));
delete from trackedentityprogramowner where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where organisationunitid in(select organisationunitid from organisationunit where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0)));
delete from trackedentityinstance where organisationunitid in(select organisationunitid from organisationunit where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from userdatavieworgunits where organisationunitid in(select organisationunitid from organisationunit where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from usermembership where organisationunitid in(select organisationunitid from organisationunit where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from visualization_organisationunits where organisationunitid in(select organisationunitid from organisationunit where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from organisationunit where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0);
delete from predictorgroup where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0);
delete from validationrulegroup where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0);
delete from userroledataset where userroleid in(select userroleid from userrole where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from userroleauthorities where userroleid in(select userroleid from userrole where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from userrolemembers where userroleid in(select userroleid from userrole where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from userrole where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0);
delete from categorycombos_optioncombos where categorycomboid in(select categorycomboid from categorycombo where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from categorycombos_categories where categorycomboid in(select categorycomboid from categorycombo where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from visualization_datadimensionitems where datadimensionitemid in(select datadimensionitemid from datadimensionitem where dataelementid in(select dataelementid from dataelement where categorycomboid in(select categorycomboid from categorycombo where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0))));
delete from datadimensionitem where dataelementid in(select dataelementid from dataelement where categorycomboid in(select categorycomboid from categorycombo where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0)));
delete from smscommandcodes where codeid in(select smscodeid from smscodes where dataelementid in(select dataelementid from dataelement where categorycomboid in(select categorycomboid from categorycombo where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0))));
delete from smscommandcodes where id in(select smscodeid from smscodes where dataelementid in(select dataelementid from dataelement where categorycomboid in(select categorycomboid from categorycombo where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0))));
delete from smscodes where dataelementid in(select dataelementid from dataelement where categorycomboid in(select categorycomboid from categorycombo where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0)));
delete from dataelementgroupmembers where dataelementid in(select dataelementid from dataelement where categorycomboid in(select categorycomboid from categorycombo where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0)));
delete from dataelementoperand where dataelementid in(select dataelementid from dataelement where categorycomboid in(select categorycomboid from categorycombo where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0)));
delete from datasetmembers where dataelementid in(select dataelementid from dataelement where categorycomboid in(select categorycomboid from categorycombo where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0)));
delete from visualization_datadimensionitems where datadimensionitemid  in(select datadimensionitemid from datadimensionitem where dataelementoperand_dataelementid  in(select dataelementid from dataelement where categorycomboid in(select categorycomboid from categorycombo where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0))));
delete from datadimensionitem where dataelementoperand_dataelementid  in(select dataelementid from dataelement where categorycomboid in(select categorycomboid from categorycombo where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0)));
delete from datasetelement where dataelementid in(select dataelementid from dataelement where categorycomboid in(select categorycomboid from categorycombo where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0)));
delete from dataelement where categorycomboid in(select categorycomboid from categorycombo where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from categorycombo where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0);

delete from categories_categoryoptions where categoryid in(select categoryid from dataelementcategory where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from categorycombos_categories where categoryid in(select categoryid from dataelementcategory where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from categorydimension_items where categorydimensionid in(select categorydimensionid from categorydimension where categoryid in(select categoryid from dataelementcategory where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0)));
delete from visualization_categorydimensions where categorydimensionid in(select categorydimensionid from categorydimension where categoryid in(select categoryid from dataelementcategory where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0)));
delete from categorydimension where categoryid in(select categoryid from dataelementcategory where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from dataelementcategory where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0);
delete from categoryoptioncombos_categoryoptions where categoryoptionid in(select categoryoptionid from dataelementcategoryoption where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from categoryoption_organisationunits where categoryoptionid in(select categoryoptionid from dataelementcategoryoption where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from categories_categoryoptions where categoryoptionid in(select categoryoptionid from dataelementcategoryoption where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from categorydimension_items where categoryoptionid in(select categoryoptionid from dataelementcategoryoption where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from categoryoptiongroupmembers where categoryoptionid in(select categoryoptionid from dataelementcategoryoption where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from dataelementcategoryoption where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0);
delete from categoryoptioncombos_categoryoptions where categoryoptioncomboid in(select categoryoptioncomboid from categoryoptioncombo where lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from categoryoptioncombo where lastupdatedby in(select userinfoid from userinfo where userinfoid < 0);
delete from usergroupmembers where usergroupid in(select usergroupid from usergroup where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from usergroupmanaged where managedgroupid in(select usergroupid from usergroup where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from usergroupmanaged where usergroup in(select usergroupid from usergroup where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from programnotificationtemplate where usergroupid in(select usergroupid from usergroup where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from configuration_corswhitelist where configurationid in(select configurationid from configuration where feedbackrecipientsid in(select usergroupid from usergroup where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0)));
delete from configuration where feedbackrecipientsid in(select usergroupid from usergroup where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from validationnotificationtemplate_recipientusergroups where usergroupid in(select usergroupid from usergroup where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0));
delete from usergroup where userid in(select userinfoid from userinfo where userinfoid < 0) or lastupdatedby in(select userinfoid from userinfo where userinfoid < 0);
delete from userteisearchorgunits where userinfoid in(select userinfoid from userinfo where userinfoid < 0);
delete from userinfo cascade where userinfoid < 0;

delete from datasetindicators where indicatorid in(select indicatorid from indicator where indicatorid < 0);
delete from datadimensionitem where indicatorid in(select indicatorid from indicator where indicatorid < 0);
delete from indicatorgroupmembers where indicatorid in(select indicatorid from indicator where indicatorid < 0);
delete from indicatorlegendsets where indicatorid in(select indicatorid from indicator where indicatorid < 0);
delete from indicator where indicatorid < 0;

delete from categorydimension_items where categorydimensionid < 0;
delete from categorydimension where categorydimensionid < 0;
delete from reporttable where reporttableid < 0;
delete from deletedobject where deletedobjectid < 0;
delete from chart where chartid < 0;

delete from periodboundary where programindicatorid < 0;
delete from programindicatorgroupmembers where programindicatorid < 0;
delete from datadimensionitem where programindicatorid < 0;
delete from programindicator where programindicatorid < 0;
delete from datadimensionitem where dataelementid < 0;
delete from dataelementgroupmembers where dataelementid < 0;
delete from programstagedataelement where dataelementid < 0;
delete from programstagesection_dataelements where dataelementid < 0;
delete from minmaxdataelement where dataelementid < 0;
delete from datadimensionitem where dataelementid < 0 or dataelementoperand_dataelementid < 0 or programdataelement_dataelementid < 0;
delete from dataelement where dataelementid < 0;

delete from intepretation_likedby where interpretationid in(select interpretationid from interpretation where periodid < 0);
delete from interpretation_comments where interpretationid in(select interpretationid from interpretation where periodid < 0);
delete from interpretation where periodid < 0;
delete from period where periodid < 0;


delete from periodboundary where periodboundaryid < 0;
delete from trackedentitycomment where trackedentitycommentid < 0;
delete from userkeyjsonvalue where userkeyjsonvalueid < 0;
delete from programruleaction where programruleactionid < 0;
delete from datasetsource where sourceid < 0;
delete from orgunitgroupmembers where organisationunitid < 0;
delete from program_organisationunits where organisationunitid < 0;
delete from userdatavieworgunits where organisationunitid < 0;
delete from usermembership where organisationunitid < 0;
delete from validationresult where organisationunitid < 0;
delete from mapview_organisationunits where organisationunitid < 0;
delete from trackedentityattributevalueaudit where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where organisationunitid < 0);
delete from trackedentityattributevalue where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where organisationunitid < 0);
delete from programownershiphistory where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where organisationunitid < 0);
delete from trackedentityinstance where organisationunitid < 0;
delete from organisationunit where organisationunitid < 0;
delete from categorycombos_optioncombos where categoryoptioncomboid < 0;
delete from minmaxdataelement where categoryoptioncomboid < 0;
delete from categoryoptioncombos_categoryoptions where categoryoptioncomboid < 0;
delete from datadimensionitem where dataelementoperand_categoryoptioncomboid < 0;
delete from categoryoptioncombo where categoryoptioncomboid < 0;
delete from datastatistics where statisticsid < 0;
delete from interpretation_comments where interpretationcommentid < 0;
delete from interpretationcomment where interpretationcommentid < 0;
delete from programruleaction where programruleid < 0;
delete from programrule where programruleid < 0;
delete from orgunitgroupsetdimension_items where orgunitgroupsetdimensionid < 0;
delete from orgunitgroupsetdimension where orgunitgroupsetdimensionid < 0;
delete from mapmapviews where mapviewid < 0;
delete from mapview_columns where mapviewid < 0;
delete from mapview_organisationunits where mapviewid < 0;
delete from mapview_orgunitlevels where mapviewid < 0;
delete from mapview_itemorgunitgroups where mapviewid < 0;
delete from mapview where mapviewid < 0;
delete from dashboard_items where dashboarditemid < 0;
delete from dashboarditem_resources where dashboarditemid < 0;
delete from dashboarditem where dashboarditemid < 0;
delete from dashboard_items where dashboardid < 0;
delete from dashboard where dashboardid < 0;
delete from mapmapviews where mapid < 0;
delete from map where mapid < 0;
delete from interpretation_comments where interpretationid < 0;
delete from intepretation_likedby where interpretationid < 0;
delete from interpretation where interpretationid < 0;
delete from categoryoptiongroupsetdimension_items where categoryoptiongroupsetdimensionid < 0;
delete from categoryoptiongroupsetdimension where categoryoptiongroupsetdimensionid < 0;
delete from maplegend where maplegendsetid < 0;
delete from indicatorlegendsets where legendsetid < 0;
delete from maplegendset where maplegendsetid < 0;
delete from categories_categoryoptions where categoryoptionid < 0;
delete from categoryoptioncombos_categoryoptions where categoryoptionid < 0;
delete from dataelementcategoryoption where categoryoptionid < 0;
delete from indicatorgroupmembers where indicatorgroupid < 0;
delete from indicatorgroupsetmembers where indicatorgroupid < 0;
delete from indicatorgroup where indicatorgroupid < 0;
delete from categories_categoryoptions where categoryid < 0;
delete from categorycombos_categories where categoryid < 0;
delete from users_catdimensionconstraints where dataelementcategoryid < 0;
delete from dataelementcategory where categoryid < 0;
delete from datasetsource where datasetid < 0;
delete from datadimensionitem where datasetid < 0;
delete from datasetindicators where datasetid < 0;
delete from interpretation_comments where interpretationid in(select interpretationid from interpretation where datasetid < 0);
delete from intepretation_likedby where interpretationid in(select interpretationid from interpretation where datasetid < 0);
delete from interpretation where datasetid < 0;
delete from dataset where datasetid < 0;
delete from categorycombos_categories where categorycomboid < 0;
delete from datadimensionitem where dataelementid in(select dataelementid from dataelement where categorycomboid < 0);
delete from dataelementgroupmembers where dataelementid in(select dataelementid from dataelement where categorycomboid < 0);
delete from sectiondataelements where dataelementid in(select dataelementid from dataelement where categorycomboid < 0);
delete from dataelement where categorycomboid < 0;
delete from categorycombo where categorycomboid < 0;
delete from dataentryform where dataentryformid < 0;
delete from categoryoptiongroupmembers where categoryoptiongroupid < 0;
delete from categoryoptiongroup where categoryoptiongroupid < 0;
delete from period where periodtypeid < 0;
delete from periodtype where periodtypeid < 0;
delete from organisationunitattributevalues where attributevalueid < 0;
delete from attributevalue where attributevalueid < 0;
delete from program_organisationunits where programid < 0;
delete from programstagesection_dataelements where programstagesectionid in(select programstagesectionid from programstagesection where programstageid in(select programstageid from programstage where programid < 0));
delete from programstagesection where programstageid in(select programstageid from programstage where programid < 0);
delete from programstagedataelement where programstageid in(select programstageid from programstage where programid < 0);
delete from programstage where programid < 0;
delete from program where programid < 0;
delete from programindicatorgroupmembers where programindicatorgroupid < 0;
delete from programindicatorgroup where programindicatorgroupid < 0;
delete from programstage where programstageid < 0;
delete from datadimensionitem where datadimensionitemid < 0;



-- deletion of validation rules
delete from validationruleorganisationunitlevels where validationruleid in(select validationruleid from validationrule where leftexpressionid < 0 or rightexpressionid < 0);
delete from validationnotificationtemplatevalidationrules where validationruleid in(select validationruleid from validationrule where leftexpressionid < 0 or rightexpressionid < 0);
delete from validationrulegroupmembers where validationruleid in(select validationruleid from validationrule where leftexpressionid < 0 or rightexpressionid < 0);
delete from validationresult where validationruleid in(select validationruleid from validationrule where leftexpressionid < 0 or rightexpressionid < 0);
delete from validationrule where leftexpressionid < 0 or rightexpressionid < 0;

-- deletion of predicators and expressions
delete from predictororgunitlevels where predictorid in(select predictorid from predictor where generatorexpressionid in(select expressionid from expression where expressionid < 0));
delete from predictorgroupmembers where predictorid in(select predictorid from predictor where generatorexpressionid in(select expressionid from expression where expressionid < 0));
delete from predictor where generatorexpressionid in(select expressionid from expression where expressionid < 0);
delete from expression where expressionid < 0;



select * from period where periodid=73207188;
201910
qsKcSQtJElu | Kakesio Dispensary

select * from validationrule where validationruleid=2180978505;
dhis=# select * from validationrule where validationruleid=2180978505;
 validationruleid |                                                                                         name                                                                                         | description |   operator   | leftexpressionid | rightexpressionid | periodtypeid |     uid     | code |       lastupdated       |         created         | importance | instruction | lastupdatedby | skipformvalidation |  userid  | publicaccess | translations | attributevalues |                                               sharing                                                
------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------+--------------+------------------+-------------------+--------------+-------------+------+-------------------------+-------------------------+------------+-------------+---------------+--------------------+----------+--------------+--------------+-----------------+------------------------------------------------------------------------------------------------------
       2180978505 | (Idadi walioanza tiba ya ART (initiates) + Idadi waliotayari kwenye tiba ya ART) =< Idadi ya wajawazito na wanaonyonyesha walioandikishwa katika kundi katika mwezi husika (Month 0) |             | not_equal_to |       2180978506 |        2180978507 |            3 | OHWxHozUBIH |      | 2021-01-29 12:48:13.215 | 2021-01-25 11:45:47.305 | MEDIUM     |             |      44309194 | f                  | 26841993 | rw------     | []           | {}              | {"owner": "K5zs1PyrqeC", "users": null, "public": "rw------", "external": false, "userGroups": null}
(1 row)

// validation rule to testing
http://localhost:8080/dhis-web-maintenance/index.html#/edit/validationSection/validationRule/xEKCyZK31tz