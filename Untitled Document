select 
tei.trackedentityinstanceid as instance,
"TB Registration".value as "TB Registration",
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
"Source of referrals".value as "Source of referrals", 
"Registration group".value as "Registration group",
"Disease Classification".value as "Disease Classification",
"Site".value as "Site",
"TB: Regimen".value as "Registration Detail:TB Regimen",
"TB: Tests".value as "Lab and Exam:TB Tests",
"Smear microscopy".value as "Lab and Exam:Smear microscopy",
"TB: X-Ray Results".value as "Lab and Exam:TB X-Ray Results",
"Xpert Results".value as "Lab and Exam:Xpert Results",
"HIV Test results".value as "TBHIV:HIV Test results",
"TB: HIV care Reg No".value as "TBHIV:TB HIV care Reg No",
"Start of ART".value as "TBHIV:Start of ART",
"Start of CPT".value as "TBHIV:Start of CPT",
"Referal to CTC".value as "TBHIV:Referal to CTC",
"TB: Treatment outcome".value as "TB Outcome:TB Treatment outcome",
"TB: DOT Option".value as "TB Treatment:TB DOT Option",
"TB: Uptake of treatment".value as "TB Treatment:TB Uptake of treatment",
"TB: Number with active TB".value as "TB: Number with active TB",
"TB: Number with no active TB".value as "TB: Number with no active TB",
"TB: Number started IPT".value as "TB: Number started IPT",
"TB: RR/MDR TB".value as "TB: RR/MDR TB",
"Transfer place".value as "Transfer place",
"District/Facility".value as "District/Facility",
"TB:  Referred to".value as "TB:  Referred to",
"TB: Transfer/Referral".value as "TB: Transfer/Referral",
 date(pi.enrollmentdate) as "Registration date",
 date(psi.executiondate) as "Start of Treatment date",
 date(psi1.executiondate) as "date of TB results",
 date(psi2.executiondate) as "date of HIV Test results",
 date(psi3.executiondate) as "Date treatment ended",
 date(psi5.executiondate) as "Contact investigation date",
 date(psi6.executiondate) as "Transfer/Referral date"
from trackedentityinstance tei
inner join programinstance pi on pi.trackedentityinstanceid = tei.trackedentityinstanceid
inner join organisationunit ou on pi.organisationunitid = ou.organisationunitid
inner join organisationunit district on ou.parentid=district.organisationunitid
inner join organisationunit region on district.parentid=region.organisationunitid
inner join programstageinstance psi on psi.programinstanceid = pi.programinstanceid and psi.programstageid=15174
inner join programstageinstance psi1 on psi1.programinstanceid = pi.programinstanceid and psi1.programstageid=15177
inner join programstageinstance psi2 on psi2.programinstanceid = pi.programinstanceid and psi2.programstageid=15179
inner join programstageinstance psi3 on psi3.programinstanceid = pi.programinstanceid and psi3.programstageid=15181
inner join programstageinstance psi4 on psi4.programinstanceid = pi.programinstanceid and psi4.programstageid=16141
inner join programstageinstance psi5 on psi5.programinstanceid = pi.programinstanceid and psi5.programstageid=99491
inner join programstageinstance psi6 on psi6.programinstanceid = pi.programinstanceid and psi6.programstageid=19497
left join te_attributevalue as "Disease Classification" on "Disease Classification".trackedentityinstanceid = tei.trackedentityinstanceid and "Disease Classification".trackedentityattributeid = 18212
left join te_attributevalue as "Site" on "Site".trackedentityinstanceid = tei.trackedentityinstanceid and "Site".trackedentityattributeid = 18213
left join trackedentitydatavalue as "TB: Regimen" on "TB: Regimen".programstageinstanceid = psi.programstageinstanceid and "TB: Regimen".dataelementid = 15268
left join trackedentitydatavalue as "TB: Tests" on "TB: Tests".programstageinstanceid = psi1.programstageinstanceid and "TB: Tests".dataelementid = 14979
left join trackedentitydatavalue as "Smear microscopy" on "Smear microscopy".programstageinstanceid = psi1.programstageinstanceid and "Smear microscopy".dataelementid = 6981
left join trackedentitydatavalue as "TB: X-Ray Results" on "TB: X-Ray Results".programstageinstanceid = psi1.programstageinstanceid and "TB: X-Ray Results".dataelementid = 6982
left join trackedentitydatavalue as "Xpert Results" on "Xpert Results".programstageinstanceid = psi1.programstageinstanceid and "Xpert Results".dataelementid = 8205
left join trackedentitydatavalue as "HIV Test results" on "HIV Test results".programstageinstanceid = psi2.programstageinstanceid and "HIV Test results".dataelementid = 6989
left join trackedentitydatavalue as "TB: HIV care Reg No" on "TB: HIV care Reg No".programstageinstanceid = psi2.programstageinstanceid and "TB: HIV care Reg No".dataelementid = 6993
left join trackedentitydatavalue as "Start of ART" on "Start of ART".programstageinstanceid = psi2.programstageinstanceid and "Start of ART".dataelementid = 15205
left join trackedentitydatavalue as "Start of CPT" on "Start of CPT".programstageinstanceid = psi2.programstageinstanceid and "Start of CPT".dataelementid = 15202
left join trackedentitydatavalue as "Referal to CTC" on "Referal to CTC".programstageinstanceid = psi2.programstageinstanceid and "Referal to CTC".dataelementid = 15203
left join trackedentitydatavalue as "TB: Treatment outcome" on "TB: Treatment outcome".programstageinstanceid = psi3.programstageinstanceid and "TB: Treatment outcome".dataelementid = 7079
left join trackedentitydatavalue as "TB: DOT Option" on "TB: DOT Option".programstageinstanceid = psi4.programstageinstanceid and "TB: DOT Option".dataelementid = 16139
left join trackedentitydatavalue as "TB: Uptake of treatment" on "TB: Uptake of treatment".programstageinstanceid = psi4.programstageinstanceid and "TB: Uptake of treatment".dataelementid = 16140
left join trackedentitydatavalue as "TB: Number with active TB" on "TB: Number with active TB".programstageinstanceid = psi5.programstageinstanceid and "TB: Number with active TB".dataelementid = 99488
left join trackedentitydatavalue as "TB: Number with no active TB" on "TB: Number with no active TB".programstageinstanceid = psi5.programstageinstanceid and "TB: Number with no active TB".dataelementid = 99489
left join trackedentitydatavalue as "TB: Number started IPT" on "TB: Number started IPT".programstageinstanceid = psi5.programstageinstanceid and "TB: Number started IPT".dataelementid = 99490
left join trackedentitydatavalue as "Transfer place" on "Transfer place".programstageinstanceid = psi6.programstageinstanceid and "Transfer place".dataelementid = 15218
left join trackedentitydatavalue as "TB: RR/MDR TB" on "TB: RR/MDR TB".programstageinstanceid = psi6.programstageinstanceid and "TB: RR/MDR TB".dataelementid = 17588
left join trackedentitydatavalue as "District/Facility" on "District/Facility".programstageinstanceid = psi6.programstageinstanceid and "District/Facility".dataelementid = 15221
left join trackedentitydatavalue as "TB:  Referred to" on "TB:  Referred to".programstageinstanceid = psi6.programstageinstanceid and "TB:  Referred to".dataelementid = 17589
left join trackedentitydatavalue as "TB: Transfer/Referral" on "TB: Transfer/Referral".programstageinstanceid = psi6.programstageinstanceid and "TB: Transfer/Referral".dataelementid = 20024
left join te_attributevalue as "TB Registration" on "TB Registration".trackedentityinstanceid = tei.trackedentityinstanceid and "TB Registration".trackedentityattributeid = 15233
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
left join te_attributevalue as "Source of referrals" on "Source of referrals".trackedentityinstanceid = tei.trackedentityinstanceid and "Source of referrals".trackedentityattributeid = 15154
left join te_attributevalue as "Registration group" on "Registration group".trackedentityinstanceid = tei.trackedentityinstanceid and "Registration group".trackedentityattributeid = 18927
where pi.organisationunitid IN(select organisationunitid FROM organisationunit WHERE path like '%${oranisatiounituid}%') and pi.enrollmentdate BETWEEN  '${startDate}' AND '${endDate}' 
and pi.programid = 15143  AND pi.deleted is false
group by 
instance,
"Registration date",
"TB Registration",
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
"Source of referrals",
"Registration group",
"Disease Classification",
"Site",
"Registration Detail:TB Regimen",
"Lab and Exam:TB Tests",
"Lab and Exam:Smear microscopy",
"Lab and Exam:TB X-Ray Results",
"Lab and Exam:Xpert Results",
"TBHIV:HIV Test results",
"TBHIV:TB HIV care Reg No",
"TBHIV:Start of ART",
"TBHIV:Start of CPT",
"TBHIV:Referal to CTC",
"TB Outcome:TB Treatment outcome",
"TB Treatment:TB DOT Option",
"TB Treatment:TB Uptake of treatment",
"TB: Number with active TB",
"TB: Number with no active TB" ,
"TB: Number started IPT" ,
"TB: RR/MDR TB" ,
"Transfer place" ,
"District/Facility" ,
"TB:  Referred to" ,
"TB: Transfer/Referral" ,
"Registration date",
"Start of Treatment date",
"date of TB results",
"date of HIV Test results",
"Date treatment ended",
"Contact investigation date",
"Transfer/Referral date";