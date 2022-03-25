-- Procedure Function for deleting enrollment with no 

CREATE OR REPLACE FUNCTION deleteEnrollmentWithNoStagesData(enrollmentuid VARCHAR(70)) RETURNS void AS $$
DECLARE
    -- rec   record;
BEGIN
    IF (((SELECT count(count) as emptystages from (
        SELECT *, count(*) 
            OVER (PARTITION BY programstageinstanceid,uid,programinstanceid) as count
                FROM (
                	select psi.programstageinstanceid,psi.uid,psi.programinstanceid,psi.eventdatavalues 
                    from programstageinstance psi
                    where 
                    psi.programinstanceid in(select programinstanceid from programinstance where uid in(enrollmentuid))
                    group by psi.programstageinstanceid,psi.uid,psi.programinstanceid
                ) as tablerowswithevents) as emptystagesrows) * 2 ) >= (SELECT sum(sum) as datavaluecontent from (
        SELECT *, count(*) 
            OVER (PARTITION BY programstageinstanceid,uid,programinstanceid) as count
                FROM (
                	select psi.programstageinstanceid,psi.uid,psi.programinstanceid,sum(length(psi.eventdatavalues::text)) 
                    from programstageinstance psi
                    where 
                    psi.programinstanceid in(select programinstanceid from programinstance where uid in(enrollmentuid))
					group by psi.programstageinstanceid,psi.uid,psi.programinstanceid
                ) as tablerowswithevents ) as emptystagesrows) )
    THEN
        -- start to delete provided enrollment data 
        raise notice 'Enrollment has no data, Deleting Enrollment';
        DELETE FROM programstageinstancecomments WHERE programstageinstanceid in(SELECT programstageinstanceid from programstageinstance WHERE programinstanceid in(SELECT programinstanceid from programinstance where uid=enrollmentuid));
        DELETE FROM programstageinstance WHERE programinstanceid in(SELECT programinstanceid from programinstance where uid=enrollmentuid);
        DELETE FROM programinstance WHERE uid=enrollmentuid;
        -- Do not delete trackedEntityInstance, this situation solves the issue of one trackedEntityInstance having duplicate programinstances
    ELSE 
      raise notice 'Enrollment has data, will not be deleted';
    END IF;

END
$$
LANGUAGE plpgsql;


-- How to use the function 
select deleteEnrollmentWithNoStagesData('oSkeW50iEPn');

-- On csv file add query column like this 
="SELECT deleteEnrollmentWithNoStagesData('"&B2&"');"


