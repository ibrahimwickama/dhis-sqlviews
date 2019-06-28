DELETE from datavalue
where dataelementid 
in(SELECT dataelementid
  from datasetelement
  where datasetid
  in(SELECT datasetid
  from dataset 
  where uid in('ggoiwX3RSRr')));