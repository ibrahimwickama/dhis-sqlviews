SELECT 
	wr.ou || '-' || wr.cadrecode as id,
	wr.ou "orgUnitId",
	ou.name as orgunitname,
	ou.path path,
	wr.cadrename cadre,
	wr.cadrecode "cadreCode",
	wr.existinguid,
	wr.neededuid,
	cast(wr.pe as integer) period,
	wr.existing,
	wr.needed,
	CASE wr.needed
	   WHEN 0 THEN 0
	   ELSE wr.existing/wr.needed
	END "wisnRatio"
FROM wisnreport wr
INNER JOIN organisationunit ou ON(ou.uid=wr.ou)