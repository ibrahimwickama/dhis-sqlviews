select 
 psi.programstageinstanceid as programstageinstanceid,
 psi.uid as event,
 psi.status as status,
 p.uid as program,
 ps.uid as programStage,
 pi.enrollmentdate as enrollment,
 ou.uid as orgUnit,
 psi.executiondate as eventDate,
 psi.duedate as dueDate,
 pi.latitude as latitude,
 pi.longitude as longitude,
 de.uid as dataElement,
 tedv.value as value,
 psi.storedby as storedBy,
 tedv.providedelsewhere as providedElsewhere,
 psi.completeddate as completedDate,
 psi.completedby as completedBy
 from programstageinstance psi
 left join programinstance pi on psi.programinstanceid=pi.programinstanceid
 left join program p on p.programid=pi.programid
 left join programstage ps on ps.programstageid=psi.programstageid
 left join organisationunit ou on ou.organisationunitid=pi.organisationunitid
 left join trackedentitydatavalue tedv on tedv.programstageinstanceid=psi.programstageinstanceid
 left join dataelement de on de.dataelementid=tedv.dataelementid
 where p.uid in('RwVrL1Y8RTH','CT0TNl30rld','Z4szHfJebFL','jYsHdmTJNVh','go4MncVomkQ','R8APevjOH0o')
 and psi.executiondate between '2019-01-01' and '2020-02-29';