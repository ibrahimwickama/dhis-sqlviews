-- Procedure Function for deleting enrollment with no 

CREATE OR REPLACE FUNCTION deleteTrackedEntityInstanceWithNoStagesData(trackedentityinstanceuid VARCHAR(70)) RETURNS void AS $$
DECLARE
    rec   record;
BEGIN
    IF (SELECT count(count) as emptystages from (
        SELECT *, count(*) 
            OVER (PARTITION BY programstageinstanceid,uid,programinstanceid) as count
                FROM (
                	select psi.programstageinstanceid,psi.uid,psi.programinstanceid,psi.eventdatavalues 
                    from programstageinstance psi
                    WHERE 
                    psi.programinstanceid IN(SELECT programinstanceid FROM programinstance WHERE trackedentityinstanceid in(SELECT trackedentityinstanceid from trackedentityinstance WHERE uid in(trackedentityinstanceuid))) and length(psi.eventdatavalues::text) = 2
                ) as tablerowswithevents) as emptystagesrows) = 13
    THEN
        -- start to delete provided enrollment data 
        raise notice 'Enrollment has no data, Deleting Enrollment';
        delete from trackedentityattributevalue where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid = trackedentityinstanceuid);
        delete from programstageinstance where programinstanceid in(select programinstanceid from programinstance where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid = trackedentityinstanceuid));
        delete from programinstance where trackedentityinstanceid in(select trackedentityinstanceid from trackedentityinstance where uid = trackedentityinstanceuid);
        delete from trackedentityinstance where uid = trackedentityinstanceuid;
    ELSE 
      raise notice 'Enrollment has data, will not be deleted';
    END IF;

END
$$
LANGUAGE plpgsql;


-- How to use the function 
select deleteTrackedEntityInstanceWithNoStagesData('gE4DXessV6C');
select deleteTrackedEntityInstanceWithNoStagesData('KIuXbdtF8OJ');


