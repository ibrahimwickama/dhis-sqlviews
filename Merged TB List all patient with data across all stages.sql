select 
tei.trackedentityinstanceid as instance,
"TB District Number".value as "TB District Number",
"First Name".value as "First Name",
"Middle Name".value as "Middle Name",
"Family Name".value as "Family Name", 
"Sex".value as "Sex", 
CAST("Age(in years)".value AS NUMERIC ) as "Age(in years)", 
"Contact phone".value as "Contact phone", 
"Ward".value as "Ward", 
"Ward or Department".value as "Ward or Department", 
"Village/street of domicile".value as "Village/street of domicile", 
"Village/Street chairperson".value as "Village/Street chairperson", 
"House number".value as "House number",
"Work Place of Patient".value as "Work Place of Patient", 
region.name as "Region name", 
district.name as "District name",
ou.name as "Facilities",
"Referral".value as "Referral", 
"Registration group".value as "Registration group",
"Disease Classification".value as "Disease Classification",
"Site".value as "Site",
"DST-LAB: Registration group".value as "DST-LAB: Registration group",
"TB: Regimen".value as "TB: Regimen",
"TB: Tests".value as "TB: Tests",
"Smear microscopy".value as "Smear microscopy",
"TB: X-Ray Results".value as "TB: X-Ray Results",
"Xpert Results".value as "Xpert Results",
"HIV Test results".value as "HIV Test results",
"TB: Treatment outcome".value as "TB: Treatment outcome",
"DOT Option".value as "DOT Option",
"TB: Number started IPT".value as "TB: Number started IPT",
"Transfer place".value as "Transfer place",
"District/Facility".value as "District/Facility",
"TB:  Referred to".value as "TB:  Referred to",
"TB: Transfer/Referral".value as "TB: Transfer/Referral",
"Start of ART".value as "Start of ART",
"Start of CPT".value as "Start of CPT",
"Referal to CTC".value as "Referal to CTC",
"Start of DR-TB treatment date".value as "Start of DR-TB treatment date",
"DR-TB: Received SLD Previously".value as "DR-TB: Received SLD Previously",
"Is MDR?".value as "Is MDR?",
"DR-TB: Type of DR-TB Regimen".value as "DR-TB: Type of DR-TB Regimen",
"Relative's Name".value as "Relative's Name",
"Relative's Contact Phone".value as "Relative's Contact Phone",
"DR-TB: Registration group".value as "DR-TB: Registration group",
"Drugs regimen: Previous treatment:".value as "Drugs regimen: Previous treatment:",
"TAMBUA TB Messages".value as "TAMBUA TB Messages",
"TB in Mining Sector Key  Population".value as "TB in Mining Sector Key  Population",
"DR-TB Number".value as "DR-TB Number",
"Address".value as "Address",
"Number of Household Contacts".value as "Number of Household Contacts",
"National ID Number".value as "National ID Number",
 date(pi.enrollmentdate) as "Registration date",
 date(psi.executiondate) as "Start of TB treatment date",
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
left join programstageinstance psi on psi.programinstanceid = pi.programinstanceid and psi.programstageid=189022433
left join programstageinstance psi1 on psi1.programinstanceid = pi.programinstanceid and psi1.programstageid=189022440
left join programstageinstance psi2 on psi2.programinstanceid = pi.programinstanceid and psi2.programstageid=189022421
left join programstageinstance psi3 on psi3.programinstanceid = pi.programinstanceid and psi3.programstageid=189022423
left join programstageinstance psi4 on psi4.programinstanceid = pi.programinstanceid and psi4.programstageid=189022429
left join programstageinstance psi5 on psi5.programinstanceid = pi.programinstanceid and psi5.programstageid=189022496
left join programstageinstance psi6 on psi6.programinstanceid = pi.programinstanceid and psi6.programstageid=189022501
left join programstageinstance psi7 on psi7.programinstanceid = pi.programinstanceid and psi7.programstageid=189022461
left join programstageinstance psi8 on psi8.programinstanceid = pi.programinstanceid and psi8.programstageid=189022483
left join programstageinstance psi9 on psi9.programinstanceid = pi.programinstanceid and psi9.programstageid=189022507
left join programstageinstance psi10 on psi10.programinstanceid = pi.programinstanceid and psi10.programstageid=189022488
left join programstageinstance psi11 on psi11.programinstanceid = pi.programinstanceid and psi11.programstageid=189022494
left join programstageinstance psi12 on psi12.programinstanceid = pi.programinstanceid and psi12.programstageid=189022419
left join programstageinstance psi13 on psi13.programinstanceid = pi.programinstanceid and psi13.programstageid=189022899
left join programstageinstance psi14 on psi14.programinstanceid = pi.programinstanceid and psi14.programstageid=189022902
left join programstageinstance psi15 on psi15.programinstanceid = pi.programinstanceid and psi15.programstageid=189022400
left join programstageinstance psi16 on psi16.programinstanceid = pi.programinstanceid and psi16.programstageid=189022398

left join trackedentitydatavalue as "DST LAB: Date Second line LPA results reported" on "DST LAB: Date Second line LPA results reported".programstageinstanceid = psi.programstageinstanceid and "DST LAB: Date Second line LPA results reported".dataelementid = 26815086
left join trackedentitydatavalue as "Transfer place" on "Transfer place".programstageinstanceid = psi1.programstageinstanceid and "Transfer place".dataelementid = 15218
left join trackedentitydatavalue as "DST-LAB: DST Result Streptomycin" on "DST-LAB: DST Result Streptomycin".programstageinstanceid = psi1.programstageinstanceid and "DST-LAB: DST Result Streptomycin".dataelementid = 18347
-- left join trackedentitydatavalue as "DR-TB: Type of DR-TB Regimen" on "DR-TB: Type of DR-TB Regimen".programstageinstanceid = psi1.programstageinstanceid and "DR-TB: Type of DR-TB Regimen".dataelementid = 8589
left join trackedentitydatavalue as "DR TB: Outcome of Adverse event after being resolved" on "DR TB: Outcome of Adverse event after being resolved".programstageinstanceid = psi1.programstageinstanceid and "DR TB: Outcome of Adverse event after being resolved".dataelementid = 108937
left join trackedentitydatavalue as "DST-LAB: DST Result Injectable (KAN)" on "DST-LAB: DST Result Injectable (KAN)".programstageinstanceid = psi2.programstageinstanceid and "DST-LAB: DST Result Injectable (KAN)".dataelementid = 101256
left join trackedentitydatavalue as "TB: Treatment outcome" on "TB: Treatment outcome".programstageinstanceid = psi2.programstageinstanceid and "TB: Treatment outcome".dataelementid = 7079
left join trackedentitydatavalue as "TB: Number started IPT" on "TB: Number started IPT".programstageinstanceid = psi2.programstageinstanceid and "TB: Number started IPT".dataelementid = 7079
left join trackedentitydatavalue as "DST LAB: Date Xpert results reported" on "DST LAB: Date Xpert results reported".programstageinstanceid = psi3.programstageinstanceid and "DST LAB: Date Xpert results reported".dataelementid = 18741332
left join trackedentitydatavalue as "Date of Specimen Inoculated" on "Date of Specimen Inoculated".programstageinstanceid = psi3.programstageinstanceid and "Date of Specimen Inoculated".dataelementid = 95532
left join trackedentitydatavalue as "DR-TB: Culture Results" on "DR-TB: Culture Results".programstageinstanceid = psi4.programstageinstanceid and "DR-TB: Culture Results".dataelementid = 8659
left join trackedentitydatavalue as "HIV Test results" on "HIV Test results".programstageinstanceid = psi4.programstageinstanceid and "HIV Test results".dataelementid = 6989
-- Out of order
left join trackedentitydatavalue as "Smear microscopy" on "Smear microscopy".programstageinstanceid = psi5.programstageinstanceid and "Smear microscopy".dataelementid = 6981
left join trackedentitydatavalue as "TB: Tests" on "TB: Tests".programstageinstanceid = psi5.programstageinstanceid and "TB: Tests".dataelementid = 14979
left join trackedentitydatavalue as "TB: X-Ray Results" on "TB: X-Ray Results".programstageinstanceid = psi6.programstageinstanceid and "TB: X-Ray Results".dataelementid = 6982
left join trackedentitydatavalue as "Xpert Results" on "Xpert Results".programstageinstanceid = psi6.programstageinstanceid and "Xpert Results".dataelementid = 8205
left join trackedentitydatavalue as "District/Facility" on "District/Facility".programstageinstanceid = psi6.programstageinstanceid and "District/Facility".dataelementid = 15221
left join trackedentitydatavalue as "TB:  Referred to" on "TB:  Referred to".programstageinstanceid = psi7.programstageinstanceid and "TB:  Referred to".dataelementid = 17589
left join trackedentitydatavalue as "TB: Transfer/Referral" on "TB: Transfer/Referral".programstageinstanceid = psi7.programstageinstanceid and "TB: Transfer/Referral".dataelementid = 20024
left join trackedentitydatavalue as "Start of ART" on "Start of ART".programstageinstanceid = psi8.programstageinstanceid and "Start of ART".dataelementid = 15205
left join trackedentitydatavalue as "Start of CPT" on "Start of CPT".programstageinstanceid = psi8.programstageinstanceid and "Start of CPT".dataelementid = 15205
left join trackedentitydatavalue as "Referal to CTC" on "Referal to CTC".programstageinstanceid = psi8.programstageinstanceid and "Referal to CTC".dataelementid = 15203

left join te_attributevalue as "Ward or Department" on "Ward or Department".trackedentityinstanceid = tei.trackedentityinstanceid and "Ward or Department".trackedentityattributeid = 18143
left join te_attributevalue as "First Name" on "First Name".trackedentityinstanceid = tei.trackedentityinstanceid and "First Name".trackedentityattributeid = 8538
left join te_attributevalue as "DST-LAB: Registration group" on "DST-LAB: Registration group".trackedentityinstanceid = tei.trackedentityinstanceid and "DST-LAB: Registration group".trackedentityattributeid = 18228
left join te_attributevalue as "TB: Regimen" on "TB: Regimen".trackedentityinstanceid = tei.trackedentityinstanceid and "TB: Regimen".trackedentityattributeid = 189022391
left join te_attributevalue as "Start of DR-TB treatment date" on "Start of DR-TB treatment date".trackedentityinstanceid = tei.trackedentityinstanceid  and "Start of DR-TB treatment date".trackedentityattributeid = 189022392 
left join te_attributevalue as "DR-TB: Received SLD Previously" on "DR-TB: Received SLD Previously".trackedentityinstanceid = tei.trackedentityinstanceid and "DR-TB: Received SLD Previously".trackedentityattributeid = 189022393 
left join te_attributevalue as "DOT Option" on "DOT Option".trackedentityinstanceid = tei.trackedentityinstanceid and "DOT Option".trackedentityattributeid = 189022394 
left join te_attributevalue as "Is MDR?" on "Is MDR?".trackedentityinstanceid = tei.trackedentityinstanceid and "Is MDR?".trackedentityattributeid = 189022395 
left join te_attributevalue as "Start of TB treatment date" on "Start of TB treatment date".trackedentityinstanceid = tei.trackedentityinstanceid and "Start of TB treatment date".trackedentityattributeid = 189022396 
left join te_attributevalue as "DR-TB: Type of DR-TB Regimen" on "DR-TB: Type of DR-TB Regimen".trackedentityinstanceid = tei.trackedentityinstanceid and "DR-TB: Type of DR-TB Regimen".trackedentityattributeid = 189022397 
left join te_attributevalue as "Family Name" on "Family Name".trackedentityinstanceid = tei.trackedentityinstanceid and "Family Name".trackedentityattributeid = 8539 
left join te_attributevalue as "Sex" on "Sex".trackedentityinstanceid = tei.trackedentityinstanceid and "Sex".trackedentityattributeid = 8544 
left join te_attributevalue as "Relative's Name" on "Relative's Name".trackedentityinstanceid = tei.trackedentityinstanceid and "Relative's Name".trackedentityattributeid = 19837
left join te_attributevalue as "Relative's Contact Phone" on "Relative's Contact Phone".trackedentityinstanceid = tei.trackedentityinstanceid and "Relative's Contact Phone".trackedentityattributeid = 19838
left join te_attributevalue as "DR-TB: Registration group" on "DR-TB: Registration group".trackedentityinstanceid = tei.trackedentityinstanceid and "DR-TB: Registration group".trackedentityattributeid = 8557
left join te_attributevalue as "Ward" on "Ward".trackedentityinstanceid = tei.trackedentityinstanceid and "Ward".trackedentityattributeid = 15150
left join te_attributevalue as "Village/street of domicile" on "Village/street of domicile".trackedentityinstanceid = tei.trackedentityinstanceid and "Village/street of domicile".trackedentityattributeid = 15149
left join te_attributevalue as "Village/Street chairperson" on "Village/Street chairperson".trackedentityinstanceid = tei.trackedentityinstanceid and "Village/Street chairperson".trackedentityattributeid = 15151
left join te_attributevalue as "Site" on "Site".trackedentityinstanceid = tei.trackedentityinstanceid and "Site".trackedentityattributeid = 18213
left join te_attributevalue as "Drugs regimen: Previous treatment:" on "Drugs regimen: Previous treatment:".trackedentityinstanceid = tei.trackedentityinstanceid and "Drugs regimen: Previous treatment:".trackedentityattributeid = 18227
left join te_attributevalue as "TAMBUA TB Messages" on "TAMBUA TB Messages".trackedentityinstanceid = tei.trackedentityinstanceid and "TAMBUA TB Messages".trackedentityattributeid = 19523268
left join te_attributevalue as "Referral" on "Referral".trackedentityinstanceid = tei.trackedentityinstanceid and "Referral".trackedentityattributeid = 15154
left join te_attributevalue as "Work Place of Patient" on "Work Place of Patient".trackedentityinstanceid = tei.trackedentityinstanceid and "Work Place of Patient".trackedentityattributeid = 15153
left join te_attributevalue as "TB in Mining Sector Key  Population" on "TB in Mining Sector Key  Population".trackedentityinstanceid = tei.trackedentityinstanceid and "TB in Mining Sector Key  Population".trackedentityattributeid = 21054833
left join te_attributevalue as "DR-TB Number" on "DR-TB Number".trackedentityinstanceid = tei.trackedentityinstanceid and "DR-TB Number".trackedentityattributeid = 8537
left join te_attributevalue as "TB District Number" on "TB District Number".trackedentityinstanceid = tei.trackedentityinstanceid and "TB District Number".trackedentityattributeid = 15233
left join te_attributevalue as "Middle Name" on "Middle Name".trackedentityinstanceid = tei.trackedentityinstanceid and "Middle Name".trackedentityattributeid = 8540
left join te_attributevalue as "Age(in years)" on "Age(in years)".trackedentityinstanceid = tei.trackedentityinstanceid and "Age(in years)".trackedentityattributeid = 8545
left join te_attributevalue as "Address" on "Address".trackedentityinstanceid = tei.trackedentityinstanceid and "Address".trackedentityattributeid = 8546
left join te_attributevalue as "Contact phone" on "Contact phone".trackedentityinstanceid = tei.trackedentityinstanceid and "Contact phone".trackedentityattributeid = 18009
left join te_attributevalue as "House number" on "House number".trackedentityinstanceid = tei.trackedentityinstanceid and "House number".trackedentityattributeid = 15152
left join te_attributevalue as "Number of Household Contacts" on "Number of Household Contacts".trackedentityinstanceid = tei.trackedentityinstanceid and "Number of Household Contacts".trackedentityattributeid = 36109
left join te_attributevalue as "Disease Classification" on "Disease Classification".trackedentityinstanceid = tei.trackedentityinstanceid and "Disease Classification".trackedentityattributeid = 18212
left join te_attributevalue as "National ID Number" on "National ID Number".trackedentityinstanceid = tei.trackedentityinstanceid and "National ID Number".trackedentityattributeid = 16085
left join te_attributevalue as "Registration group" on "Registration group".trackedentityinstanceid = tei.trackedentityinstanceid and "Registration group".trackedentityattributeid = 18927

where pi.organisationunitid IN(select organisationunitid FROM organisationunit WHERE path like '%${oranisatiounituid}%') and pi.enrollmentdate BETWEEN  '${startDate}' AND '${endDate}' 
and pi.programid = 189022512  AND pi.deleted is false
group by 
instance,
"Registration date",
"TB District Number",
"First Name",
"Middle Name",
"Family Name", 
"Sex",
"Age(in years)", 
"Contact phone",
"Ward",
"Ward or Department",
"Village/street of domicile",
"Village/Street chairperson",
"House number",
"Work Place of Patient",
"Region name", 
"District name",
"Facilities",
"Referral",
"Registration group",
"Disease Classification",
"Site",
"DST-LAB: Registration group",
"TB: Regimen",
"TB: Tests",
"Smear microscopy",
"TB: X-Ray Results",
"Xpert Results",
"HIV Test results",
"TB: Treatment outcome",
"DOT Option",
"TB: Number started IPT" ,
"Transfer place" ,
"District/Facility" ,
"TB:  Referred to" ,
"TB: Transfer/Referral",
"Start of ART",
"Start of CPT",
"Referal to CTC",
"Start of DR-TB treatment date",
"DR-TB: Received SLD Previously",
"Is MDR?",
"DR-TB: Type of DR-TB Regimen",
"Relative's Name",
"Relative's Contact Phone",
"DR-TB: Registration group",
"Drugs regimen: Previous treatment:",
"TAMBUA TB Messages",
"TB in Mining Sector Key  Population",
"DR-TB Number",
"Address",
"Number of Household Contacts",
"National ID Number",
"Start of TB treatment date",
"date of TB results",
"date of HIV Test results",
"Date treatment ended",
"Contact investigation date",
"Transfer/Referral date";