-- delete datavalues of dataElements assigned on a dataset 
select * from datavalue where dataelementid in(select dataelementid from datasetelement where datasetid in(select datasetid from dataset where uid='ggoiwX3RSRr'));

delete from datavalueaudit where dataelementid in(select dataelementid from datasetelement where datasetid in(select datasetid from dataset where uid='ggoiwX3RSRr'));
delete from datavalue where dataelementid in(select dataelementid from datasetelement where datasetid in(select datasetid from dataset where uid='ggoiwX3RSRr'));
/dt

delete from datavalueaudit where organisationunitid=35646065 and dataelementid in(select dataelementid from datasetelement where datasetid in(select datasetid from dataset where uid='ggoiwX3RSRr'));
delete from datavalue where sourceid=35646065 and dataelementid in(select dataelementid from datasetelement where datasetid in(select datasetid from dataset where uid='ggoiwX3RSRr'));
