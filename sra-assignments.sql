-- assign dataset to  facility
INSERT INTO datasetsource VALUES((select datasetid from dataset where uid='nqKkegk1y8U'),(select organisationunitid from organisationunit where uid='ZzIV2xX5r1I'));

UPDATE datasetsource set datasetid=2182090595 where datasetid=2182089201 and sourceid=78080;

 2182089201 | nqKkegk1y8U | SRA Dispensary Assessment Tool
 2182092337 | fiDtcNUzKI6 | SRA Hospital Assessment Tool
 2182090595 | RixTh0Xs0A7 | SRA Health Center Assessment Tool

2181994105



select dataelementoperandid from datasetoperands where datasetid=2182090595 and dataelementoperandid in(select dataelementoperandid from dataelementoperand where dataelementid=2181993799);

delete from datasetoperands where dataelementoperandid=2182643915;
delete from dataelementoperand where dataelementoperandid=2182643915;
delete from dataelementoperand where dataelementid=2181994105 and dataelementoperandid in(select dataelementoperandid from datasetoperands where datasetid=2182090595)





delete from datavalue where sourceid=78080 and periodid=5143375 and dataelementid in(select dataelementid from datasetelement where datasetid=2182089201);



select count(*) from datavalue where sourceid=78080 and periodid=5143375 and dataelementid in(select dataelementid from datasetelement where datasetid=2182089201);

