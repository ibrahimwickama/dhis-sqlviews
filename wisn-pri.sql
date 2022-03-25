SELECT
	wrp.pri,
	wrp.iteration,
	wr.ou || '-' || wr.cadrecode as id,
	wr.ou "orgUnitId",
	ou.name as orgunitname,
	ou.path path,
	wr.cadrename cadre,
	wr.cadrecode "cadreCode",
	cast(wr.pe as integer) period
FROM wisnreportpri wrp
INNER JOIN wisnreport wr ON(wr.wisnreportid=wrp.wisnreportid)
INNER JOIN organisationunit ou ON(ou.uid=wr.ou);