-- delete datavalues of dataElements assigned on a dataset 
select * from datavalue where dataelementid in(select dataelementid from datasetelement where datasetid in(select datasetid from dataset where uid='ggoiwX3RSRr'));

delete from datavalueaudit where dataelementid in(select dataelementid from datasetelement where datasetid in(select datasetid from dataset where uid='ggoiwX3RSRr'));
delete from datavalue where dataelementid in(select dataelementid from datasetelement where datasetid in(select datasetid from dataset where uid='ggoiwX3RSRr'));
/dt

delete from datavalueaudit where organisationunitid=25246 and dataelementid in(select dataelementid from datasetelement where datasetid in(select datasetid from dataset where uid='v6wdME3ouXu'));
delete from datavalue where sourceid=25246 and dataelementid in(select dataelementid from datasetelement where datasetid in(select datasetid from dataset where uid='v6wdME3ouXu'));
