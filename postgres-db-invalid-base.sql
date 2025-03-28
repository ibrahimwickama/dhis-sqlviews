-- Incase of a corrupted database table giving error like this:
-- invalid page in block 54206178 of relation base/16384/90743558
-- Then do this 
-- List all relnames
SELECT pg_class.relfilenode, pg_namespace.nspname as schema_name, pg_class.relname, pg_class.relkind 
FROM pg_class
JOIN pg_namespace on pg_class.relnamespace = pg_namespace.oid
WHERE pg_class.relfilenode=90743558
ORDER BY pg_class.relfilenode ASC;

-- Then take that table name and proceed with vaccuum procedure
SET zero_damaged_pages on;
-- OR 
SET zero_damaged_pages=on;
-- Then 
VACUUM FULL talbe_name;
