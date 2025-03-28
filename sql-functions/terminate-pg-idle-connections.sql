CREATE OR REPLACE FUNCTION terminateidlepgprocess() RETURNS void AS $$
DECLARE
    rec record;
    result text;
BEGIN
    FOR rec IN SELECT pid ,datname ,usename ,application_name ,client_hostname ,client_port ,backend_start ,query_start ,query ,state FROM pg_stat_activity WHERE state = 'idle' AND LENGTH(query) < 1
    LOOP
        SELECT pg_terminate_backend(rec.pid) INTO result;
        RAISE NOTICE '[PROCESS TERMINATION] PID deleted %', rec.pid;
    END LOOP;
END
$$
LANGUAGE plpgsql;

select terminateidlepgprocess();

="select assigndatasettoorgunit('"&C2&"','"&B2&"');"