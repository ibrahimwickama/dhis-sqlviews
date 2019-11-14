
select * from programinstance;
select * from trackedentitydatavalue;












select 
tei.trackedentityinstanceid as instance,
-- "TB Registration".value as "TB Registration",
"First Name".value as "First Name",
"Last Name".value as "Last Name",
"Family Name".value as "Family Name", 
"Sex".value as "Sex", 
CAST("Age".value AS NUMERIC ) as "Age", 
"Phone Number".value as "Phone Number", 
"Ward".value as "Ward", 
"Domicile".value as "Domicile", 
"Chair Person".value as "Chair Person", 
"House number".value as "House number",
"Work place".value as "Work place", 
region.name as "Region name", 
district.name as "District name",
ou.name as "Facilities",
"HIV Test results".value as "TBHIV:HIV Test results",
 date(pi.enrollmentdate) as "Registration date"
from trackedentityinstance tei
inner join programinstance pi on pi.trackedentityinstanceid = tei.trackedentityinstanceid
inner join organisationunit ou on pi.organisationunitid = ou.organisationunitid
inner join organisationunit district on ou.parentid=district.organisationunitid
inner join organisationunit region on district.parentid=region.organisationunitid
inner join programstageinstance psi on psi.programinstanceid = pi.programinstanceid and psi.programstageid=15174
left join trackedentitydatavalue as "HIV Test results" on "HIV Test results".programstageinstanceid = psi.programstageinstanceid and "HIV Test results".dataelementid = 6989
-- left join te_attributevalue as "TB Registration" on "TB Registration".trackedentityinstanceid = tei.trackedentityinstanceid and "TB Registration".trackedentityattributeid = 15233
left join te_attributevalue as "First Name" on "First Name".trackedentityinstanceid = tei.trackedentityinstanceid and "First Name".trackedentityattributeid = 8538
left join te_attributevalue as "Last Name" on "Last Name".trackedentityinstanceid = tei.trackedentityinstanceid and "Last Name".trackedentityattributeid = 8540
left join te_attributevalue as "Family Name" on "Family Name".trackedentityinstanceid = tei.trackedentityinstanceid and "Family Name".trackedentityattributeid = 8539
left join te_attributevalue as "Sex" on "Sex".trackedentityinstanceid = tei.trackedentityinstanceid  and "Sex".trackedentityattributeid = 8544 
left join te_attributevalue as "Age" on "Age".trackedentityinstanceid = tei.trackedentityinstanceid and "Age".trackedentityattributeid = 8545 
left join te_attributevalue as "Phone Number" on "Phone Number".trackedentityinstanceid = tei.trackedentityinstanceid and "Phone Number".trackedentityattributeid = 18009 
left join te_attributevalue as "Ward" on "Ward".trackedentityinstanceid = tei.trackedentityinstanceid and "Ward".trackedentityattributeid = 15150 
left join te_attributevalue as "Domicile" on "Domicile".trackedentityinstanceid = tei.trackedentityinstanceid and "Domicile".trackedentityattributeid = 15149 
left join te_attributevalue as "Chair Person" on "Chair Person".trackedentityinstanceid = tei.trackedentityinstanceid and "Chair Person".trackedentityattributeid = 15151 
left join te_attributevalue as "House number" on "House number".trackedentityinstanceid = tei.trackedentityinstanceid and "House number".trackedentityattributeid = 15152 
left join te_attributevalue as "Work place" on "Work place".trackedentityinstanceid = tei.trackedentityinstanceid and "Work place".trackedentityattributeid = 15153
where pi.programid = 15797  AND pi.deleted is false
group by 
instance,
"Registration date",
-- "TB Registration",
"First Name",
"Last Name",
"Family Name", 
"Sex",
"Age", 
"Phone Number",
"Ward",
"Domicile",
"Chair Person",
"House number",
"Work place",
"Region name", 
"District name",
"Facilities",
"TBHIV:HIV Test results";
