INSERT INTO datavalue(dataelementid,periodid,sourceid,categoryoptioncomboid,attributeoptioncomboid,value,storedby,created,lastupdated,deleted)
SELECT
	ted.dataelementid, 			--dataelementid
	period.periodid, 				--periodid
	psi.organisationunitid, 	--sourceid
	(SELECT categoryoptioncomboid FROM categoryoptioncombo WHERE name='default'),	--categoryoptioncomboid
	(SELECT categoryoptioncomboid FROM categoryoptioncombo WHERE name='default'),	--attributeoptioncomboid
	ted.value,					--value
	ted.storedby,				--storedby
	ted.created,				--created
	ted.lastupdated,			--lastupdated
	false						--deleted
FROM trackedentitydatavalue ted
INNER JOIN programstageinstance psi ON(ted.programstageinstanceid=psi.programstageinstanceid)
INNER JOIN programstage ps ON(ps.programstageid=psi.programstageid)
INNER JOIN program p ON(p.programid=ps.programid AND p.uid='BLJKZVvEjPn')
INNER JOIN period ON(psi.executiondate BETWEEN period.startdate AND period.enddate)
INNER JOIN periodtype ON(periodtype.periodtypeid=period.periodtypeid AND periodtype.name='Yearly')
WHERE psi.executiondate like '%-12-30%';