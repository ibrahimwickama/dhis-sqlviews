-- observed on saving program stage dataelements it fails saying skipanalytics must not be null, so here is the fix
alter table programstagedataelement alter column skipanalytics drop not null;
-- who 
alter table dataset alter column periodtypeid drop not null;
alter table validationrule alter column periodtypeid drop not null;
alter table predictor alter column periodtypeid drop not null;



pg_dump --host localhost --port 5432 --username postgres --format plain --verbose --file "<abstract_file_path>" --table public.tablename dbname


