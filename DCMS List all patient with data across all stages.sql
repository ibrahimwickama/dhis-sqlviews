select 
tei.trackedentityinstanceid as instance,
"Case Sequence No.".value as "Case Sequence No.",
"Source of Referral".value as "Source of Referral",
"Area/Place of Incidence".value as "Area/Place of Incidence",
"File No".value as "File No", 
"Sex".value as "Sex", 
"Ward of Residence".value as "Ward of Residence", 
"Date of Birth".value as "Date of Birth",
CAST("Age".value AS NUMERIC ) as "Age",
"Parental Circumstances".value as "Parental Circumstances", 
"Care Situation".value as "Care Situation", 
"Education".value as "Education",
"Type of case".value as "Type of case",
region.name as "Region name", 
district.name as "District name",
ward.name as "Ward name",
ou.name as "Facilities",
psi.eventdatavalues as "Registration details",
date(pi.enrollmentdate) as "Registration date"
from trackedentityinstance tei
inner join programinstance pi on pi.trackedentityinstanceid = tei.trackedentityinstanceid
inner join organisationunit ou on pi.organisationunitid = ou.organisationunitid
inner join organisationunit ward on ou.parentid=ward.organisationunitid
inner join organisationunit district on ward.parentid=district.organisationunitid
inner join organisationunit region on district.parentid=region.organisationunitid
inner join programstageinstance psi on psi.programinstanceid = pi.programinstanceid and psi.programstageid = 4477951
-- left join programstageinstance psi1 on psi1.programinstanceid = pi.programinstanceid and psi1.programstageid=15177

left join te_attributevalue as "File No" on "File No".trackedentityinstanceid = tei.trackedentityinstanceid and "File No".trackedentityattributeid = 4478368
left join te_attributevalue as "Sex" on "Sex".trackedentityinstanceid = tei.trackedentityinstanceid and "Sex".trackedentityattributeid = 4478372
left join te_attributevalue as "Ward of Residence" on "Ward of Residence".trackedentityinstanceid = tei.trackedentityinstanceid and "Ward of Residence".trackedentityattributeid = 4478364
left join te_attributevalue as "Date of Birth" on "Date of Birth".trackedentityinstanceid = tei.trackedentityinstanceid and "Date of Birth".trackedentityattributeid = 4478370
left join te_attributevalue as "Age" on "Age".trackedentityinstanceid = tei.trackedentityinstanceid and "Age".trackedentityattributeid = 4478367
left join te_attributevalue as "Parental Circumstances" on "Parental Circumstances".trackedentityinstanceid = tei.trackedentityinstanceid and "Parental Circumstances".trackedentityattributeid = 4478371
left join te_attributevalue as "Care Situation" on "Care Situation".trackedentityinstanceid = tei.trackedentityinstanceid and "Care Situation".trackedentityattributeid = 4478365
left join te_attributevalue as "Education" on "Education".trackedentityinstanceid = tei.trackedentityinstanceid and "Education".trackedentityattributeid = 4478373
left join te_attributevalue as "Type of case" on "Type of case".trackedentityinstanceid = tei.trackedentityinstanceid and "Type of case".trackedentityattributeid = 4478363

left join te_attributevalue as "Case Sequence No." on "Case Sequence No.".trackedentityinstanceid = tei.trackedentityinstanceid and "Case Sequence No.".trackedentityattributeid = 4477945
left join te_attributevalue as "Source of Referral" on "Source of Referral".trackedentityinstanceid = tei.trackedentityinstanceid and "Source of Referral".trackedentityattributeid = 4477941
left join te_attributevalue as "Area/Place of Incidence" on "Area/Place of Incidence".trackedentityinstanceid = tei.trackedentityinstanceid and "Area/Place of Incidence".trackedentityattributeid = 4477943
where pi.organisationunitid IN(select organisationunitid FROM organisationunit WHERE path like '%${oranisatiounituid}%') and pi.enrollmentdate BETWEEN  '${startDate}' AND '${endDate}' 
and pi.programid = 4478178  AND pi.deleted is false
group by 
instance,
"Registration date",
"Case Sequence No.",
"Source of Referral",
"Area/Place of Incidence",
"File No", 
"Sex", 
"Ward of Residence", 
"Date of Birth",
"Age",
"Parental Circumstances", 
"Care Situation", 
"Education",
"Type of case",
"Region name",
"District name",
"Ward name",
"Registration details",
"Facilities";