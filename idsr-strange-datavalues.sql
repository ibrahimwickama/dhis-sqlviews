select dataelementid,uid,name from dataelement where dataelementid in(select dataelementid from datavalue where value='1234' and storedBy='ussd' and created between '2021-01-01' and '2021-03-01') limit 100;


select de.uid,de.name,dv.value,ou.name,ou.uid,dv.storedBy,dv.created
from datavalue dv
inner join dataelement de on de.dataelementid = dv.dataelementid
inner join organisationunit ou on ou.organisationunitid = dv.sourceid
where dv.value='1234' and dv.created between '2021-01-01' and '2021-03-01' and de.name ilike '%IDSR%';


