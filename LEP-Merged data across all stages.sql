select 
tei.trackedentityinstanceid as instance,
pi.programid as Programid,
"Leprosy District number".value as "Leprosy District number",
"First Name".value as "First Name",
"Middle Name".value as "Middle Name",
"Family Name".value as "Family Name", 
"Sex".value as "Sex", 
CAST("Age(in years)".value AS NUMERIC ) as "Age(in years)", 
"Contact phone".value as "Contact phone", 
"Ward".value as "Ward", 
"Village/street of domicile".value as "Village/street of domicile", 
"Village/street of domicile LEP".value as "Village/street of domicile LEP",
"Village/Street chairperson".value as "Village/Street chairperson",
"House number".value as "House number",
"Mode of detection".value as "Mode of detection",
"Classification of leprosy".value as "Classification of leprosy",
"LEP: Registration group".value as "LEP: Registration group",
"HIV status".value as "HIV status",
region.name as "Region name", 
district.name as "District name",
ou.name as "Facilities",
"LEP: Condition of patient".value as "LEP: Condition of patient",
"LEP: Treatment outcome".value as "LEP: Treatment outcome",
"LEP: Disability grading at the end of treatment".value as "LEP: Disability grading at the end of treatment",
psi1.programinstanceid as "PrograminstanceofSecondStage",
"LEP: Condition of patient".programstageinstanceid as "programstageinstanceofSecondID",
psi2.programinstanceid as "PrograminstanceofThirdStage",
psi2.programstageinstanceid as "programstageinstanceofThirdID",
date(pi.enrollmentdate) as "Registration date",
date(psi1.executiondate) as "Date of Treatment",
date(psi2.executiondate) as "Outcome date"
from trackedentityinstance tei
inner join programinstance pi on pi.trackedentityinstanceid = tei.trackedentityinstanceid
inner join organisationunit ou on pi.organisationunitid = ou.organisationunitid
inner join organisationunit district on ou.parentid=district.organisationunitid
inner join organisationunit region on district.parentid=region.organisationunitid
left join programstageinstance psi1 on psi1.programinstanceid = pi.programinstanceid and psi1.programstageid=16239
left join programstageinstance psi2 on psi2.programinstanceid = pi.programinstanceid and psi2.programstageid=22532382
left join trackedentitydatavalue as "LEP: Condition of patient" on "LEP: Condition of patient".programstageinstanceid = psi1.programstageinstanceid and "LEP: Condition of patient".dataelementid = 16057
left join trackedentitydatavalue as "LEP: Treatment outcome" on "LEP: Treatment outcome".programstageinstanceid = psi2.programstageinstanceid and "LEP: Treatment outcome".dataelementid = 16248
left join trackedentitydatavalue as "LEP: Disability grading at the end of treatment" on "LEP: Disability grading at the end of treatment".programstageinstanceid = psi2.programstageinstanceid and "LEP: Disability grading at the end of treatment".dataelementid = 16052
left join te_attributevalue as "Leprosy District number" on "Leprosy District number".trackedentityinstanceid = tei.trackedentityinstanceid and "Leprosy District number".trackedentityattributeid = 15802
left join te_attributevalue as "First Name" on "First Name".trackedentityinstanceid = tei.trackedentityinstanceid and "First Name".trackedentityattributeid = 8538
left join te_attributevalue as "Middle Name" on "Middle Name".trackedentityinstanceid = tei.trackedentityinstanceid and "Middle Name".trackedentityattributeid = 8540
left join te_attributevalue as "Family Name" on "Family Name".trackedentityinstanceid = tei.trackedentityinstanceid and "Family Name".trackedentityattributeid = 8539
left join te_attributevalue as "Age(in years)" on "Age(in years)".trackedentityinstanceid = tei.trackedentityinstanceid and "Age(in years)".trackedentityattributeid = 8545
left join te_attributevalue as "Sex" on "Sex".trackedentityinstanceid = tei.trackedentityinstanceid  and "Sex".trackedentityattributeid = 8544 
left join te_attributevalue as "Contact phone" on "Contact phone".trackedentityinstanceid = tei.trackedentityinstanceid and "Contact phone".trackedentityattributeid = 18009 
left join te_attributevalue as "Ward" on "Ward".trackedentityinstanceid = tei.trackedentityinstanceid and "Ward".trackedentityattributeid = 15150 
left join te_attributevalue as "Village/street of domicile" on "Village/street of domicile".trackedentityinstanceid = tei.trackedentityinstanceid and "Village/street of domicile".trackedentityattributeid = 15149 
left join te_attributevalue as "Village/street of domicile LEP" on "Village/street of domicile LEP".trackedentityinstanceid = tei.trackedentityinstanceid and "Village/street of domicile LEP".trackedentityattributeid = 22531634 
left join te_attributevalue as "Village/Street chairperson" on "Village/Street chairperson".trackedentityinstanceid = tei.trackedentityinstanceid and "Village/Street chairperson".trackedentityattributeid = 15151 
left join te_attributevalue as "House number" on "House number".trackedentityinstanceid = tei.trackedentityinstanceid and "House number".trackedentityattributeid = 15152 
left join te_attributevalue as "Mode of detection" on "Mode of detection".trackedentityinstanceid = tei.trackedentityinstanceid and "Mode of detection".trackedentityattributeid = 15811 
left join te_attributevalue as "Classification of leprosy" on "Classification of leprosy".trackedentityinstanceid = tei.trackedentityinstanceid and "Classification of leprosy".trackedentityattributeid = 15970 
left join te_attributevalue as "LEP: Registration group" on "LEP: Registration group".trackedentityinstanceid = tei.trackedentityinstanceid and "LEP: Registration group".trackedentityattributeid = 19096 
left join te_attributevalue as "HIV status" on "HIV status".trackedentityinstanceid = tei.trackedentityinstanceid and "HIV status".trackedentityattributeid = 18211 
where pi.organisationunitid IN(select organisationunitid FROM organisationunit WHERE path like '%${oranisatiounituid}%') and pi.enrollmentdate BETWEEN  '${startDate}' AND '${endDate}' 
and pi.programid = 22532455  AND pi.deleted is false
group by
"Registration date",
instance,
Programid,
"PrograminstanceofSecondStage",
"PrograminstanceofThirdStage",
"Leprosy District number",
"First Name",
"Middle Name",
"Family Name", 
"Sex", 
"Age(in years)", 
"Contact phone", 
"Ward", 
"Village/street of domicile", 
"Village/street of domicile LEP",
"Village/Street chairperson",
"House number",
"Mode of detection",
"Classification of leprosy",
"LEP: Registration group",
"HIV status",
"Region name", 
"District name",
"Facilities",
"LEP: Condition of patient",
"programstageinstanceofSecondID",
"LEP: Treatment outcome",
"LEP: Disability grading at the end of treatment",
"programstageinstanceofThirdID",
"Date of Treatment",
"Outcome date";