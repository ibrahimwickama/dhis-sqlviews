select tei.trackedentityinstanceid as instance,
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
ou.name as "Facilities",
"Source of referrals".value as "Source of referrals", 
"Registration group".value as "Registration group",
"Smear microscopy".value as "Smear microscopy"
from trackedentityinstance tei
inner join programinstance pi on pi.trackedentityinstanceid = tei.trackedentityinstanceid
inner join programstageinstance psi on psi.programinstanceid = pi.programinstanceid
inner join programstagedataelement psd on psd.programstageid = psi.programstageid
left join trackedentitydatavalue ted on ted.programstageinstanceid = psi.programstageinstanceid
inner join organisationunit ou on pi.organisationunitid = ou.organisationunitid
left join trackedentitydatavalue as "Smear microscopy" on "Smear microscopy".programstageinstanceid = psi.programstageinstanceid and "Smear microscopy".dataelementid = 6981
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
where psi.programstageid IN (15177) and "Smear microscopy".value IS NULL and ted.value in ('Negative','Scanty','N','Not Suggestive','Suggestive') and pi.organisationunitid IN(select organisationunitid FROM organisationunit WHERE path like '%${oranisatiounituid}%') and pi.enrollmentdate BETWEEN '${startDate}' AND '${endDate}' 
group by 
instance,
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
"Facilities",
"Source of referrals",
"Registration group",
"Smear microscopy";