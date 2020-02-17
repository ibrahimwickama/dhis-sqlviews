select 
tei.trackedentityinstanceid as instance,
-- "Case Sequence No.".value as "Case Sequence No.",
-- "Source of Referral".value as "Source of Referral",
-- "Area/Place of Incidence".value as "Area/Place of Incidence",
"DCMS: Child File".value as "DCMS: Child File", 
"DCMS: Sex".value as "DCMS: Sex", 
"DCMS: Ward of Residence".value as "DCMS: Ward of Residence", 
"DCMS: Date of Birth".value as "DCMS: Date of Birth",
CAST("DCMS: Age".value AS NUMERIC ) as "DCMS: Age",
"DCMS: Parental Circumstances".value as "DCMS: Parental Circumstances", 
"DCMS: Care Situation".value as "DCMS: Care Situation", 
"DCMS: Education".value as "DCMS: Education",
"DCMS: Previous Child Protection Concern(s)".value as "DCMS: Previous Child Protection Concern(s)", 
"DCMS: Number of Cases Child is involved in".value as "DCMS: Number of Cases Child is involved in", 
"DCMS: Type of Case: VANE".value as "DCMS: Type of Case: VANE", 
"DCMS: Type of Case: CICL".value as "DCMS: Type of Case: CICL", 
region.name as "Region name", 
district.name as "District name",
ward.name as "Ward name",
ou.name as "Facilities",
 date(pi.enrollmentdate) as "Registration date"
from trackedentityinstance tei
inner join programinstance pi on pi.trackedentityinstanceid = tei.trackedentityinstanceid
inner join organisationunit ou on pi.organisationunitid = ou.organisationunitid
inner join organisationunit ward on ou.parentid=ward.organisationunitid
inner join organisationunit district on ward.parentid=district.organisationunitid
inner join organisationunit region on district.parentid=region.organisationunitid
inner join programstageinstance psi on psi.programinstanceid = pi.programinstanceid and psi.programstageid = 4477951
left join trackedentitydatavalue as "DCMS: Child File" on "DCMS: Child File".programstageinstanceid = psi.programstageinstanceid and "DCMS: Child File".dataelementid = 4477770
left join trackedentitydatavalue as "DCMS: Sex" on "DCMS: Sex".programstageinstanceid = psi.programstageinstanceid and "DCMS: Sex".dataelementid = 4477867
left join trackedentitydatavalue as "DCMS: Ward of Residence" on "DCMS: Ward of Residence".programstageinstanceid = psi.programstageinstanceid and "DCMS: Ward of Residence".dataelementid = 4477752
left join trackedentitydatavalue as "DCMS: Date of Birth" on "DCMS: Date of Birth".programstageinstanceid = psi.programstageinstanceid and "DCMS: Date of Birth".dataelementid = 4477877
left join trackedentitydatavalue as "DCMS: Age" on "DCMS: Age".programstageinstanceid = psi.programstageinstanceid and "DCMS: Age".dataelementid = 4477742
left join trackedentitydatavalue as "DCMS: Parental Circumstances" on "DCMS: Parental Circumstances".programstageinstanceid = psi.programstageinstanceid and "DCMS: Parental Circumstances".dataelementid = 4477781
left join trackedentitydatavalue as "DCMS: Care Situation" on "DCMS: Care Situation".programstageinstanceid = psi.programstageinstanceid and "DCMS: Care Situation".dataelementid = 4477831
left join trackedentitydatavalue as "DCMS: Education" on "DCMS: Education".programstageinstanceid = psi.programstageinstanceid and "DCMS: Education".dataelementid = 4478814
left join trackedentitydatavalue as "DCMS: Previous Child Protection Concern(s)" on "DCMS: Previous Child Protection Concern(s)".programstageinstanceid = psi.programstageinstanceid and "DCMS: Previous Child Protection Concern(s)".dataelementid = 4477812
left join trackedentitydatavalue as "DCMS: Number of Cases Child is involved in" on "DCMS: Number of Cases Child is involved in".programstageinstanceid = psi.programstageinstanceid and "DCMS: Number of Cases Child is involved in".dataelementid = 4477783
left join trackedentitydatavalue as "DCMS: Type of Case: VANE" on "DCMS: Type of Case: VANE".programstageinstanceid = psi.programstageinstanceid and "DCMS: Type of Case: VANE".dataelementid = 4477835
left join trackedentitydatavalue as "DCMS: Type of Case: CICL" on "DCMS: Type of Case: CICL".programstageinstanceid = psi.programstageinstanceid and "DCMS: Type of Case: CICL".dataelementid = 4477839
-- left join te_attributevalue as "Case Sequence No." on "Case Sequence No.".trackedentityinstanceid = tei.trackedentityinstanceid and "Case Sequence No.".trackedentityattributeid = 4477945
-- left join te_attributevalue as "Source of Referral" on "Source of Referral".trackedentityinstanceid = tei.trackedentityinstanceid and "Source of Referral".trackedentityattributeid = 4477941
-- left join te_attributevalue as "Area/Place of Incidence" on "Area/Place of Incidence".trackedentityinstanceid = tei.trackedentityinstanceid and "Area/Place of Incidence".trackedentityattributeid = 4477943
where pi.organisationunitid IN(select organisationunitid FROM organisationunit WHERE path like '%${oranisatiounituid}%') and pi.enrollmentdate BETWEEN  '${startDate}' AND '${endDate}' 
and pi.programid = 4478178  AND pi.deleted is false
group by 
instance,
"Registration date",
-- "Case Sequence No.",
-- "Source of Referral",
-- "Area/Place of Incidence",
"DCMS: Child File", 
"DCMS: Sex", 
"DCMS: Ward of Residence", 
"DCMS: Date of Birth",
"DCMS: Age",
"DCMS: Parental Circumstances", 
"DCMS: Care Situation", 
"DCMS: Education",
"DCMS: Previous Child Protection Concern(s)", 
"DCMS: Number of Cases Child is involved in", 
"DCMS: Type of Case: VANE", 
"DCMS: Type of Case: CICL",
"Region name",
"District name",
"Ward name",
"Facilities";