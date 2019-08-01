select value
from trackedentityattributevalue
where value like '%/KK/%'


    -- Procedure to update a new TB No
    CREATE OR REPLACE FUNCTION updateTBNo(newTBNo VARCHAR(70), trackedentityinstanceid VARCHAR(70)) 
    RETURNS void AS $$
    BEGIN
	update trackedentityattributevalue
	set value = newTBNo
	where trackedentityinstanceid = trackedentityinstanceid;
    END;
    $$ LANGUAGE plpgsql;



        -- Procedure to update a new TB No
    CREATE OR REPLACE FUNCTION updateTBNo(newTBNo VARCHAR(70), usertrackedentityinstanceid INT, usertrackedentityattributeid INT) RETURNS refcursor AS $$
    DECLARE
      ref refcursor;
    BEGIN
	update trackedentityattributevalue
	set value = newTBNo
	where trackedentityinstanceid = usertrackedentityinstanceid and trackedentityattributeid = usertrackedentityattributeid;

	OPEN ref FOR SELECT trackedentityinstanceid, value FROM trackedentityattributevalue where trackedentityinstanceid = trackedentityinstanceid;
	RETURN ref;
    END;
    $$ LANGUAGE plpgsql;




    --  Procedure to update a new TB No
    CREATE OR REPLACE FUNCTION updateTBNo( cast(newTBNo, VARCHAR(20)),cast(oldTBNo VARCHAR(20)), usertrackedentityinstanceid INT, usertrackedentityattributeid INT) RETURNS refcursor AS $$
    DECLARE
      ref refcursor;
    BEGIN
	update trackedentityattributevalue
	set value = cast(newTBNo, VARCHAR(20))
	where trackedentityinstanceid = usertrackedentityinstanceid and trackedentityattributeid = usertrackedentityattributeid;

	OPEN ref FOR SELECT trackedentityinstanceid, value FROM trackedentityattributevalue where trackedentityinstanceid = trackedentityinstanceid;
	RETURN ref;
    END;
    $$ LANGUAGE plpgsql;



    select updateTBNo('0405/kk/2017/26xx','0405/kk/2017/26',255791,8538)


    select teav.trackedentityinstanceid, teav.trackedentityattributeid, teav.value
from trackedentityattributevalue teav
where teav.value like '%2600000%'




SELECT te_attributevalue.trackedentityinstanceid as instance, 
json_object_agg(te_attribute.name, te_attributevalue.value) as data1,
--json_object_agg('organisationunitName', organisationunit.name) as orgUnits,
--td1.programstageinstanceid as f1inst,
--json_object_agg('RegistrationDeatils', td1.value) as registrationdata,
td2.programstageinstanceid as f2inst,
json_object_agg('ExaminationResuts', td2.value) as Labdata
FROM te_attributevalue
INNER JOIN programinstance USING(trackedentityinstanceid)
INNER JOIN program ON(program.programid = programinstance.programid AND program.uid = 'nvz0bEfZ5rj')
INNER JOIN te_attribute ON te_attribute.trackedentityattributeid = te_attributevalue.trackedentityattributeid
INNER JOIN organisationunit ON organisationunit.organisationunitid = programinstance.organisationunitid
LEFT JOIN programstageinstance psi1 ON(psi1.programinstanceid = programinstance.programinstanceid AND psi1.programstageid = 15174)
LEFT JOIN programstageinstance psi2 ON(psi2.programinstanceid = programinstance.programinstanceid AND psi2.programstageid = 15177)
--LEFT JOIN trackedentitydatavalue td1 ON (td1.programstageinstanceid =psi1.programstageinstanceid and td1.dataelementid=15173)
LEFT JOIN trackedentitydatavalue td2 ON (td2.programstageinstanceid =psi2.programstageinstanceid )
LEFT JOIN dataelement de2 ON de2.dataelementid = td2.dataelementid  
--LEFT JOIN dataelement de1 ON de1.dataelementid = td1.dataelementid 
WHERE programinstance.organisationunitid IN(select organisationunitid from organisationunit where path like'%${districtuid}%') 
-- AND td2.programstageinstanceid IS NOT NULL
AND programinstance.enrollmentdate BETWEEN '${startDate}' AND '${endDate}'
GROUP BY te_attributevalue.trackedentityinstanceid,td2.programstageinstanceid
ORDER BY te_attributevalue.trackedentityinstanceid,td2.programstageinstanceid ;





    --  Procedure to update a new TB No
    CREATE OR REPLACE FUNCTION updatetbno2( part1 VARCHAR,part2 VARCHAR,part3 VARCHAR, usertrackedentityinstanceid INT, usertrackedentityattributeid INT)
    RETURNS refcursor AS $$
    DECLARE
      ref refcursor;
    BEGIN
	update trackedentityattributevalue
	set value = concat(part1,'/KK','/',part2,'/',part3)
	where trackedentityinstanceid = usertrackedentityinstanceid and trackedentityattributeid = usertrackedentityattributeid;

	OPEN ref FOR SELECT trackedentityinstanceid, value FROM trackedentityattributevalue where trackedentityinstanceid = trackedentityinstanceid;
	RETURN ref;
    END;
    $$ LANGUAGE plpgsql;



    select updatetbno2('0405','2017','2600000',255791,8544)


--Simple query to update TB No
update trackedentityattributevalue set value ='070206/KK/2019/0302' where trackedentityinstanceid = '10817239' and trackedentityattributeid = '15233';
