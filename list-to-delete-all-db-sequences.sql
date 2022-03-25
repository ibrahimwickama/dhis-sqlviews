select 'drop sequence "' || relname || '" cascade;' from pg_class where relkind='S';

-- Restart sequence with next number 
ALTER SEQUENCE users_userid_seq RESTART WITH 2;
ALTER SEQUENCE category_categoryid_seq RESTART WITH 219;