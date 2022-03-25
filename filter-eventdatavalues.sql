select
    concat(
        trav_other_name.value,
        ' ',
        trav_last_name.value
    ) as traveller_name,
    p_enrollement.enrollmentdate as arrival_date,
    psi.eventdatavalues -> 'BH5SRLl5PfH' ->> 'value' as temperature,
    psi.eventdatavalues -> 'mHXHXSmX3aB' ->> 'value' as "action_taken",
    psi.eventdatavalues -> 'SeKu9WMNh16' ->> 'value' as "sign_skin rash",
    psi.eventdatavalues -> 'fyzp8BpsPMl' ->> 'value' as "sign_difficult breathing",
    psi.eventdatavalues -> 'cYI3B3KwLX5' ->> 'value' as sign_headache,
    psi.eventdatavalues -> 'tEeXlLZAx9W' ->> 'value' as "sign_unusual bleeding",
    psi.eventdatavalues -> 'qcRlAy9MStY' ->> 'value' as "sign_vomiting",
    psi.eventdatavalues -> 'IrFWIj5ks2p' ->> 'value' as "sign_diarhhea",
    poe.name as traveller_poe,
    p_enrollement.programinstanceid as id
from
    pr_stageinstance psi
    inner join programinstance p_enrollement on psi.programinstanceid = p_enrollement.programinstanceid
    and date_trunc('day',p_enrollement.enrollmentdate) = '${date}'
    and p_enrollement.programid = 1028305
    inner join te_attributevalue trav_other_name on trav_other_name.trackedentityinstanceid = p_enrollement.trackedentityinstanceid
    and trav_other_name.trackedentityattributeid = 1028212
    inner join te_attributevalue trav_last_name on trav_last_name.trackedentityinstanceid = p_enrollement.trackedentityinstanceid
    and trav_last_name.trackedentityattributeid = 10524
    inner join organisationunit poe on poe.organisationunitid = p_enrollement.organisationunitid
where
    psi.programstageid = 1028231
    and (psi.eventdatavalues -> 'BH5SRLl5PfH' ->> 'value') IS NOT NULL 
    and poe.path like '%${orgUnit}%';




-- Trial query

select 
tei.uid as instance, 
"COVID-19 Case ID".value as "EJomRnB5GD8", 
"First Name".value as "sB1IHYu2xQT", 
"Surname".value as "ENRjVGxVL6l", 
"Date of birth".value as "NI0QRzJvQ0k", 
"Sex".value as "oindugucx72", 
CAST("Age".value AS NUMERIC ) as "Rv8WM2mTuS5", 
"Phone #".value as "VOBHV07tHeZ", 
"Uraia/ Nationality".value as "LRIIS30XUZ6", 
"Occupation".value as "wbfOL2jdpKf", 
"Other (Specify)".value as "zoQJcRNgu0G",
"Residence address".value as "j7btmR6ei0l",
"Current address".value as "JMdCDUCEmUs", 
ou.name as "FacilityName",
ou.uid as "FacilityUid",
date(pi.enrollmentdate) as "Registration date",
date(psi.executiondate) as "Stage Event Date",
psi.programstageid as "stageID",
psi.eventdatavalues::text as "Stage Event Values"
from trackedentityinstance tei 
inner join programinstance pi on pi.trackedentityinstanceid = tei.trackedentityinstanceid
inner join organisationunit ou on pi.organisationunitid = ou.organisationunitid
-- dynamic stage
left join programstageinstance as psi on psi.programinstanceid = pi.programinstanceid and psi.programstageid in(select programstageid from programstage where uid='${programStage}') and psi.deleted is false

left join te_attributevalue as "COVID-19 Case ID" on "COVID-19 Case ID".trackedentityinstanceid = tei.trackedentityinstanceid and "COVID-19 Case ID".trackedentityattributeid = 7424352 
left join te_attributevalue as "First Name" on "First Name".trackedentityinstanceid = tei.trackedentityinstanceid and "First Name".trackedentityattributeid = 10504 
left join te_attributevalue as "Surname" on "Surname".trackedentityinstanceid = tei.trackedentityinstanceid and "Surname".trackedentityattributeid = 10524 
left join te_attributevalue as "Date of birth" on "Date of birth".trackedentityinstanceid = tei.trackedentityinstanceid and "Date of birth".trackedentityattributeid = 10496  
left join te_attributevalue as "Sex" on "Sex".trackedentityinstanceid = tei.trackedentityinstanceid and "Sex".trackedentityattributeid = 10520  
left join te_attributevalue as "Age" on "Age".trackedentityinstanceid = tei.trackedentityinstanceid and "Age".trackedentityattributeid = 10488  
left join te_attributevalue as "Phone #" on "Phone #".trackedentityinstanceid = tei.trackedentityinstanceid and "Phone #".trackedentityattributeid = 13916 
left join te_attributevalue as "Uraia/ Nationality" on "Uraia/ Nationality".trackedentityinstanceid = tei.trackedentityinstanceid and "Uraia/ Nationality".trackedentityattributeid = 25157 
left join te_attributevalue as "Occupation" on "Occupation".trackedentityinstanceid = tei.trackedentityinstanceid and "Occupation".trackedentityattributeid = 7422678 
left join te_attributevalue as "Other (Specify)" on "Other (Specify)".trackedentityinstanceid = tei.trackedentityinstanceid and "Other (Specify)".trackedentityattributeid = 7424272 
left join te_attributevalue as "Residence address" on "Residence address".trackedentityinstanceid = tei.trackedentityinstanceid and "Residence address".trackedentityattributeid = 7422679 
left join te_attributevalue as "Current address" on "Current address".trackedentityinstanceid = tei.trackedentityinstanceid and "Current address".trackedentityattributeid = 7422677
where pi.programid IN(select programid from program where uid='uYjxkTbwRNf') AND 
ou.organisationunitid IN(select organisationunitid FROM organisationunit WHERE path like '%${orgUnit}%') AND 
psi.eventdatavalues IS NOT NULL AND 
pi.enrollmentdate BETWEEN '${startDate}' AND '${endDate}' '${queryFilter}'
group by 
instance, 
"EJomRnB5GD8", 
"sB1IHYu2xQT", 
"ENRjVGxVL6l", 
"NI0QRzJvQ0k", 
"oindugucx72", 
"Rv8WM2mTuS5", 
"VOBHV07tHeZ", 
"LRIIS30XUZ6", 
"wbfOL2jdpKf", 
"zoQJcRNgu0G", 
"j7btmR6ei0l", 
"JMdCDUCEmUs",
"FacilityName",
"FacilityUid",
"Registration date"
"Stage Event Date",
"stageID",
"Stage Event Values";












select 
tei.uid as instance, 
"COVID-19 Case ID".value as "EJomRnB5GD8", 
"First Name".value as "sB1IHYu2xQT", 
"Surname".value as "ENRjVGxVL6l", 
"Date of birth".value as "NI0QRzJvQ0k", 
"Sex".value as "oindugucx72", 
CAST("Age".value AS NUMERIC ) as "Rv8WM2mTuS5", 
"Phone #".value as "VOBHV07tHeZ", 
"Uraia/ Nationality".value as "LRIIS30XUZ6", 
"Occupation".value as "wbfOL2jdpKf", 
"Other (Specify)".value as "zoQJcRNgu0G",
"Residence address".value as "j7btmR6ei0l",
"Current address".value as "JMdCDUCEmUs", 
ou.name as "Facilities",
date(psi.executiondate) as "Stage Event Date",
psi.programstageid as "stageID",
psi.eventdatavalues::text as "Stage Event Values"
from trackedentityinstance tei 
inner join programinstance pi on pi.trackedentityinstanceid = tei.trackedentityinstanceid
inner join organisationunit ou on pi.organisationunitid = ou.organisationunitid
-- dynamic stage
left join programstageinstance as psi on psi.programinstanceid = pi.programinstanceid and psi.programstageid in(select programstageid from programstage where uid='iVfs6Jyp7I8') and psi.deleted is false

left join te_attributevalue as "COVID-19 Case ID" on "COVID-19 Case ID".trackedentityinstanceid = tei.trackedentityinstanceid and "COVID-19 Case ID".trackedentityattributeid in(select trackedentityattributeid from trackedentityattribute where uid='EJomRnB5GD8') 
left join te_attributevalue as "First Name" on "First Name".trackedentityinstanceid = tei.trackedentityinstanceid and "First Name".trackedentityattributeid in(select trackedentityattributeid from trackedentityattribute where uid='sB1IHYu2xQT') 
left join te_attributevalue as "Surname" on "Surname".trackedentityinstanceid = tei.trackedentityinstanceid and "Surname".trackedentityattributeid in(select trackedentityattributeid from trackedentityattribute where uid='ENRjVGxVL6l') 
left join te_attributevalue as "Date of birth" on "Date of birth".trackedentityinstanceid = tei.trackedentityinstanceid and "Date of birth".trackedentityattributeid in(select trackedentityattributeid from trackedentityattribute where uid='NI0QRzJvQ0k')  
left join te_attributevalue as "Sex" on "Sex".trackedentityinstanceid = tei.trackedentityinstanceid and "Sex".trackedentityattributeid in(select trackedentityattributeid from trackedentityattribute where uid='oindugucx72')  
left join te_attributevalue as "Age" on "Age".trackedentityinstanceid = tei.trackedentityinstanceid and "Age".trackedentityattributeid in(select trackedentityattributeid from trackedentityattribute where uid='Rv8WM2mTuS5')  
left join te_attributevalue as "Phone #" on "Phone #".trackedentityinstanceid = tei.trackedentityinstanceid and "Phone #".trackedentityattributeid in(select trackedentityattributeid from trackedentityattribute where uid='VOBHV07tHeZ') 
left join te_attributevalue as "Uraia/ Nationality" on "Uraia/ Nationality".trackedentityinstanceid = tei.trackedentityinstanceid and "Uraia/ Nationality".trackedentityattributeid in(select trackedentityattributeid from trackedentityattribute where uid='LRIIS30XUZ6') 
left join te_attributevalue as "Occupation" on "Occupation".trackedentityinstanceid = tei.trackedentityinstanceid and "Occupation".trackedentityattributeid in(select trackedentityattributeid from trackedentityattribute where uid='wbfOL2jdpKf') 
left join te_attributevalue as "Other (Specify)" on "Other (Specify)".trackedentityinstanceid = tei.trackedentityinstanceid and "Other (Specify)".trackedentityattributeid in(select trackedentityattributeid from trackedentityattribute where uid='zoQJcRNgu0G') 
left join te_attributevalue as "Residence address" on "Residence address".trackedentityinstanceid = tei.trackedentityinstanceid and "Residence address".trackedentityattributeid in(select trackedentityattributeid from trackedentityattribute where uid='j7btmR6ei0l') 
left join te_attributevalue as "Current address" on "Current address".trackedentityinstanceid = tei.trackedentityinstanceid and "Current address".trackedentityattributeid in(select trackedentityattributeid from trackedentityattribute where uid='JMdCDUCEmUs')
where pi.programid IN(select programid from program where uid='uYjxkTbwRNf') AND ou.organisationunitid IN(select organisationunitid FROM organisationunit WHERE path like '%m0frOspS7JY%') and psi.eventdatavalues IS NOT NULL AND pi.enrollmentdate BETWEEN '2021-10-01' AND '2021-12-31' 
group by 
instance, 
"EJomRnB5GD8", 
"sB1IHYu2xQT", 
"ENRjVGxVL6l", 
"NI0QRzJvQ0k", 
"oindugucx72", 
"Rv8WM2mTuS5", 
"VOBHV07tHeZ", 
"LRIIS30XUZ6", 
"wbfOL2jdpKf", 
"zoQJcRNgu0G", 
"j7btmR6ei0l", 
"JMdCDUCEmUs",
"Facilities",
"Stage Event Date",
"stageID",
"Stage Event Values";



select programstageinstanceid,programinstanceid,programstageid,uid,executiondate,eventdatavalues from programstageinstance limit 3;