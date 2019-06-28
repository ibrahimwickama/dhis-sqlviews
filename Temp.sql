select dv.sourceid,ou.uid as organisationUnitId,ou.name as organisationUnitName, ou.path as organisationunitPath ,dv.value,ps.iso,de.name as dataElementName,coc.name as categoryOptionName from datavalue dv 
inner join dataelement de on dv.dataelementid=de.dataelementid
inner join datasetelement dse on dse.dataelementid=de.dataelementid
inner join dataset ds on ds.datasetid=dse.datasetid
inner join organisationunit ou on ou.organisationunitid=dv.sourceid
inner join _periodstructure ps on ps.periodid=dv.periodid
inner join categoryoptioncombo coc on coc.categoryoptioncomboid=dv.categoryoptioncomboid
where ds.uid='uMV8HPjFpjf'
and de.uid in('zGJFOiPn0Eh','Wi04TcVks3h','ZZpXBBzETFJ','SZAyDmdWM3m','jXEUqQSt4dx','DTBWEAWgqUc',
  'ir4VYuJYJOJ','MYO1slQ2Hyh','TH6WeXrey99','xD1aMIBl2I7','SFsfVCemVPh','E3V32diLsB1','nyOhXy6g8NP',
  'icRKuxRMJsa','R5zLV1L1AwG','vSUGNwUzq9I','EKOoVR76QDf','Mv82eKjwpCe','wF3wWw5YEo5','qOKAmTV6Ppz',
  'vZZVleMx08Z','Tdj0yyC2qTy','lNlSf2d4Pyf','YICpcRHCvKO','TVOTNWA5x9H','X8QiB00k9DJ','PxI5VvEiXao','ydrsK20LBJD','dC4zqNLTgoB',
  'Yp6630c5ZJh','XB3PYuOyUOe','bxeWT7dsAjD','sKcdWRV7Ciq','Enf7N2DmULY','tgg7EpAzvrp','tUGw1hUYs8T',
  'i8jYvLfzNVG','SeH4cqfDK32','Yos0QGlxLBi','SeH4cqfDK32','Yos0QGlxLBi')
and dv.value is not null
and ou.path like '%${oranisatiounituid}%'
and dv.periodid in(select periodid from period where startdate between '${startDate}' and '${endDate}') group by dv.sourceid,ou.uid, ou.path,ou.name,dv.value,ps.iso,de.name,coc.name;