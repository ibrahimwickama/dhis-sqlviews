-- Replace the uid of the dataset to the real dataset Uid to extract data from
copy(select dataelement.uid as dataelement,
_periodstructure.iso as period,
organisationunit.uid as orgunit,
coc1.uid as categoryoptioncombouid ,
coc2.uid as attributeoptioncombouid,
datavalue.value as value,
datavalue.storedby as storedby,
date(datavalue.lastupdated) as lastupdated,
datavalue.comment as comment,
datavalue.followup as followup,
datavalue.deleted as deleted
from datavalue inner join dataelement using(dataelementid) 
inner join _periodstructure on _periodstructure.periodid = datavalue.periodid  
inner join organisationunit on (organisationunit.organisationunitid=datavalue.sourceid) 
inner join categoryoptioncombo coc1 on coc1.categoryoptioncomboid=datavalue.categoryoptioncomboid 
inner join categoryoptioncombo coc2 on coc2.categoryoptioncomboid=datavalue.attributeoptioncomboid 
where datavalue.dataelementid 
  in(select dataelementid 
     from datasetelement 
     where datasetid 
       in(select datasetid 
         from dataset where uid in('RpeHQ2saIRg','mU6qzGINdKw','cBPkl0M6T9I','Pw3c2BcqbQ5','xewWZMYbqYc','lxYmUYkjLeS','cap79mdf6Co','qpcwPcj8D6u','v6wdME3ouXu','ZOvFj2vtlor','Dp0VF7ssmcH','ExX34Bpv0qN','f8QXtGOYdbb'))) 
         and datavalue.periodid in(select periodid from period where startdate between '2021-10-01' and '2021-12-31')) to '/tmp/hmisportalData2021Q4.csv' with csv header; 



-- COPY datavalues from dataElement and result it to a new table 
-- Replace the uid of the dataset to the real dataset Uid to extract data from
CREATE TABLE tempdatamigration AS
select *
from datavalue
where datavalue.dataelementid in(select dataelementid from dataelement where uid in('aDBdmQAABCC','ATqlMZypG0h','Aufg85b0HV3')) and datavalue.periodid in(select periodid from period where startdate between '2017-01-01' and '2021-12-31');


-- Then take backup of the table and install it to new database
-- Then copy table data to targeted table 
insert into datavalue (select * from tempdatamigration) ON CONFLICT (dataelementid, periodid, sourceid, categoryoptioncomboid, attributeoptioncomboid) DO NOTHING;

-- COPY datavalues from dataElement 
-- Replace the uid of the dataset to the real dataset Uid to extract data from
copy(select dataelement.uid as dataelement,
_periodstructure.iso as period,
organisationunit.uid as orgunit,
coc1.uid as categoryoptioncombouid ,
coc2.uid as attributeoptioncombouid,
datavalue.value as value,
datavalue.storedby as storedby,
date(datavalue.lastupdated) as lastupdated,
datavalue.comment as comment,
datavalue.followup as followup,
datavalue.deleted as deleted
from datavalue inner join dataelement using(dataelementid) 
inner join _periodstructure on _periodstructure.periodid = datavalue.periodid  
inner join organisationunit on (organisationunit.organisationunitid=datavalue.sourceid) 
inner join categoryoptioncombo coc1 on coc1.categoryoptioncomboid=datavalue.categoryoptioncomboid 
inner join categoryoptioncombo coc2 on coc2.categoryoptioncomboid=datavalue.attributeoptioncomboid 
where datavalue.dataelementid in(select dataelementid from dataelement where uid in('aDBdmQAABCC','ATqlMZypG0h','Aufg85b0HV3','awbB2k6c4dy','AYf5GkcQsmY','AyH8C2gvB5E','b0l3x8dmBtI','B9q04d4HYUi','BaV5E58U7Xm','BavfH1EX0eV','Bcy0nyOs0l2','Bd7hJVyjOKl','BfvvJ4rSAVf','bhifJusxiKx','bJqHs8SMglY','bMqo3gXzcw7','bOivZpsDaWp','BOlepbvjZSr','bS3zcjh6lFj','bS6WjHzMLDG','BUotpFFSkPQ','BV9x9mZI9AX','bXhMCyRvSPt','c005UxFtJ7p','C0rY5CYwGfo','c5T3R6QjgQG','C7ZjQl0Hh0o','cBJdSWgNoWD','Ccza2fiSCJZ','CE2CxlQh8vx','ce7ATPhE8Iv','cfl4mkxuLhd','CpSomQpOLkU','cvXtRow4aPz','CWXG9lBSI7Y','czV0Bdb4OMs','D34hFrwiUpq','DE53jCGUTme','DEHUXzpw90t','DickWO4DwCH','DjxrS2a3lfs','DoUU3CT1A07','DPLR0aQemYC','DQ8S8oZCz1O','DUlS90FQGNh','dvwAlTIl4gC','DWWNT5pcrWf','e46BBN2LHfp','EdaxsmnoohA','EEeh0pyQISB','egmmeobrQXV','EGXnlhg55mS','eLo4RXcQIi5','ENPBKqXUs0e','eoZtkUbfrmF','epPM7fO8CnH','Es3Tl7QBsah','eTOV59Rcv4F','eVaCxZYmej4','f096Uub9EvE','f4Woa8xSfs5','fC9eHFeDvRG','foIT9ImHcrf','frIrwyff1Go','fVzXb5qPrCp','FZG8H7NAwJ4','gaaV139sE6x','GDd0U2qgYpn','GGpsoh0DX6T','GKtYtPYBg9p','govkT8UYmsA','GpHn91aoEIN','gq90zkgvcg3','gRhW1h7t1pC','GRz0gNpORHZ','gTJBoztW66Z','GWFza9xVa3F','H2R0UdSYRPn','H8pprB9HXYF','hfZEdu3747h','hGY0CnSS9at','hI7erACK9lx','hjLcTJkb2v0','HlyRR1YbsL0','Hn4HdgfPPss','hpAA82LRAte','hTce3dWh9P7','HWZmyu3j4NX','I3RhiDXDEN2','IcU59e21drO','IDKxYQBGMdd','IEMyGwhBTXd','IFxhP0O4k0W','IGbCo0DIFIa','iI43Bmz4lZu','IIZ21DIqy0J','IKy5L8eGI0g','iP9wSaCAZl5','iqt8sB5fP0d','ItgPHCQ1hm6','IuEbVPEGwcN','iWEg1oWWtYx','iWk2izQWxyb','j8oPXDgmOXz','jbZa8J1H2ET','jmiebz1jQDn','JUqoKP2D7vk','Jv5yvUWcOAn','JXJ6K85BwHb','k1oUKgZdyT5','k4euXQXCIwJ','KAiGnZ0qtWd','kksp2roOMCj','kLI4iGDbN3p','kmpnqbSQLBl','Kpa6sheYah0','kSb2DwIAq9A','KsjpX2i1kOJ','Kt3DuTIieoT','KTXcMFWnbrP','KU1FsxbyE9Z','l5RLq10kd5K','LAHplQxtGSP','lcf03qF7UU3','LD4thW4OmXi','linry41rG3v','Lnf095vgahq','lokIbhypbyR','LpSJNv1zMTi','LznB81FWmWm','m1PpRCnZF4l','mbMw23u6zB3','MBWA8jDpuQO','MF5c1sSclKq','mlfh4fgiFhd','MOoQ280yfAP','MUy8R9WmeST','MXYoYFrLHj7','MxzW4N7GvCx','n5gO4gaIVdR','n62iMxfXPty','Nd47QWL1bhQ','NDUUp45yw9g','nEVETOImwlv','newpmtct042','nGed5u8o6gv','NkPkTgPIf5j','NlXYR3IJWCl','NSYWPEpZBuY','nUInmdAMy9t','nvsyLh5KGGu','NwzMLHAFMSC','Ny6pDv4SxrC','ObvdgLG6Rs8','ofcxyuoTp7c','oI7XZUpAcs6','OkEB2a7MKKz','OkyCfGRhsu0','OQpasUg1Tse','OSgKXpAp7Ip','OX5MJtwnEWY','OZ5YGaP6uwa','P3fFpAt1ymr','PCgQhgC8b3i','pD5AGDT8w9h','PejOKtvw5UW','PHN05p61ByJ','PKK90ZfFx2x','PmSZNZHac3t','pqpVKzE951Y','pVTitSjQ3oL','Q2fFmlGkxRN','q3ELeLciuTh','Q7taI8IlcFa','q8evppqXcvI','qfiHWApDYN4','qND1CpK3cO5','QPCEJmazWgv','qwFz1atKnbC','QY2val5hffZ','RaDWHS6x5aX','rAXlXCjOLcp','rB0DvqiPEVA','RJbnIiS8WVo','rjDxrcFIdgN','rklETIV29RG','RTplHDAOVQQ','RvLskJI6lJE','rWSyEfKWMLn','RyNkn76uTJo','RYzjUSOvbFL','s0mcf9xRpFn','s3XgvK2osoQ','S8FzjhBtEPJ','sBl5QAJEqio','SgeSIiqTN2l','sGY3eyJSxVp','SjNEefHqcz4','snAJ4ADu50F','Svz65UuG6dd','SZJ9iGsglqE','SzvgVKO1p8y','T4KvNZ5gAYI','TafY6G2w7hF','tDDF8JJyVap','tIs7rshvixe','tM1ecc8qcsJ','TMBP4HvViHB','TMXGiqmTZ3M','TntmCu0S3SO','totaZnTeUuK','toWFQOyPa15','tPK3QbHeaOS','TTVbKsy0ujj','tvscIxUNNpl','U1KbGaXmjgY','U50UeP68wpD','uA7nNtZE8bv','UCKrT4buBRQ','UDNIfd3mhin','uH8renKbxVS','ulM6a7dZoXM','V3aIXr7ziS9','v6sdLtxvY1K','V7LvxJUIdhR','vav3peUGYbC','vG53aOxAqLe','vKdJGP5FCOi','VnuhMFIlEyK','VPH0M4oc6bs','VSXdXdsSUd3','vYXCiIEJTwU','W0P7aEA3BrK','WAdaCligbNP','WEgRYalIG2c','Wh7OAyeCy0v','wNYeVWYR054','WWeqGGpUjY5','wy1Y4mixjFu','WzdnDeY1Jeq','X0TXADJv7GA','X3pjg8AMk4S','x5cswY9qs7m','X7Eirp6NPtW','X9fBUnQiiQE','xMJkfcHAvJL','xmpGYpXo68t','xVbmMwUk5ug','y1nw8IpRVtF','Y6cNfApg9Kf','yAPwF74EoEe','ycct6V6ksyU','yDg6ZxE0NLg','ykDWUlQzexW','ykShMtNgDB1','yKypqIROIO9','YPYFiirNajc','yqA1CfsfBHQ','ywZy8KscwP9','ZbmHzUkeJbQ','zfhmMA4HeJn','zOhZ2g9cs9R','zqaHIXl6j7c','zUVxutsJ6eR','ZXMe66Tl0Lo')) and datavalue.periodid in(select periodid from period where startdate between '2017-01-01' and '2021-12-31')) to '/tmp/nhs-all.csv' with csv header;


