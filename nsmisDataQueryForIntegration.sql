select
date(psi.executiondate) as "ReportDate",
psi.uid as "EventUid",
region.name as "RegionName",
region.code as "RegionCode",
district.name as "DistrictName",
district.code as "DistrictCode",
ward.name as "WardName",
ward.uid as "WardUid",
ou.name as "FacilityName",
ou.code as "FacilityCode",
"Sanitation_OPD(Types of Toilet used)".value as "Sanitation_OPD(Types of Toilet used)", 
"Availability of Handwashing facility".value as "Availability of Handwashing facility",
"Separate Toilet for Staff and Patients".value as "Separate Toilet for Staff and Patients",
"HCF_Standard Placenta Pit".value as "HCF_Standard Placenta Pit",
"Toilets separated based on sex".value as "Toilets separated based on sex",
"HCF_Incinerator functional".value as "HCF_Incinerator functional",
"Toilets for people with disability available".value as "Toilets for people with disability available",
"Sanitation_OPD Availability of hand washing facility in nearby patient toilet".value as "Sanitation_OPD Availability of hand washing facility in nearby patient toilet",
"Availability of Handwashing facility with running water and soap and Alcohol handrub within".value as "Availability of Handwashing facility with running water and soap and Alcohol handrub within"
from programstageinstance psi
inner join organisationunit ou on psi.organisationunitid = ou.organisationunitid
inner join organisationunit ward on ou.parentid=ward.organisationunitid
inner join organisationunit district on ward.parentid=district.organisationunitid
inner join organisationunit region on district.parentid=region.organisationunitid
left join trackedentitydatavalue as "Sanitation_OPD(Types of Toilet used)" on "Sanitation_OPD(Types of Toilet used)".programstageinstanceid = psi.programstageinstanceid and "Sanitation_OPD(Types of Toilet used)".dataelementid = 6017036
left join trackedentitydatavalue as "Availability of Handwashing facility" on "Availability of Handwashing facility".programstageinstanceid = psi.programstageinstanceid and "Availability of Handwashing facility".dataelementid = 6017049
left join trackedentitydatavalue as "Separate Toilet for Staff and Patients" on "Separate Toilet for Staff and Patients".programstageinstanceid = psi.programstageinstanceid and "Separate Toilet for Staff and Patients".dataelementid = 6017037
left join trackedentitydatavalue as "HCF_Standard Placenta Pit" on "HCF_Standard Placenta Pit".programstageinstanceid = psi.programstageinstanceid and "HCF_Standard Placenta Pit".dataelementid = 6017076
left join trackedentitydatavalue as "Toilets separated based on sex" on "Toilets separated based on sex".programstageinstanceid = psi.programstageinstanceid and "Toilets separated based on sex".dataelementid = 6017038
left join trackedentitydatavalue as "HCF_Incinerator functional" on "HCF_Incinerator functional".programstageinstanceid = psi.programstageinstanceid and "HCF_Incinerator functional".dataelementid = 6017075
left join trackedentitydatavalue as "Toilets for people with disability available" on "Toilets for people with disability available".programstageinstanceid = psi.programstageinstanceid and "Toilets for people with disability available".dataelementid = 6017039
left join trackedentitydatavalue as "Sanitation_OPD Availability of hand washing facility in nearby patient toilet" on "Sanitation_OPD Availability of hand washing facility in nearby patient toilet".programstageinstanceid = psi.programstageinstanceid and "Sanitation_OPD Availability of hand washing facility in nearby patient toilet".dataelementid = 8089538
left join trackedentitydatavalue as "Availability of Handwashing facility with running water and soap and Alcohol handrub within" on "Availability of Handwashing facility with running water and soap and Alcohol handrub within".programstageinstanceid = psi.programstageinstanceid and "Availability of Handwashing facility with running water and soap and Alcohol handrub within".dataelementid = 6017046
where psi.organisationunitid IN(select organisationunitid FROM organisationunit WHERE path like '%${oranisatiounituid}%') and psi.executiondate BETWEEN  '${startDate}' AND '${endDate}'
--where psi.organisationunitid IN(select organisationunitid FROM organisationunit WHERE path like '%W86VG7YSbK6%') and psi.executiondate BETWEEN  '2024-01-01' AND '2024-12-31' 
and psi.programstageid = 6017087  AND psi.deleted is false
group by
"ReportDate",
"EventUid",
"RegionName",
"RegionCode",
"DistrictName",
"DistrictCode",
"WardName",
"WardUid",
"FacilityName",
"FacilityCode",
"Sanitation_OPD(Types of Toilet used)", 
"Availability of Handwashing facility",
"Separate Toilet for Staff and Patients",
"HCF_Standard Placenta Pit",
"Toilets separated based on sex",
"HCF_Incinerator functional",
"Toilets for people with disability available",
"Sanitation_OPD Availability of hand washing facility in nearby patient toilet",
"Availability of Handwashing facility with running water and soap and Alcohol handrub within";