-- get all tables with certain name
SELECT table_name FROM information_schema.tables WHERE table_schema='public' AND table_name ilike '%category%';

-- force terminate database connections for easy drop command
SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = 'mydb';


REPLACE(origianl_string, old_substring, new_substring );

UPDATE categoryoptioncombo SET name=REPLACE(name, 'ME', 'Male.');