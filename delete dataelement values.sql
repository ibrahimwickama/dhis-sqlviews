--  delete WISN-HMIS data
delete from datavalueaudit where dataelementid in(select dataelementid from dataelement where uid = 'ykShMtNgDB1') and organisationunitid in(select organisationunitid from organisationunit where hierarchylevel = 5);
delete from datavalue where dataelementid in(select dataelementid from dataelement where uid = 'ykShMtNgDB1') and sourceid in(select organisationunitid from organisationunit where hierarchylevel = 5);



--  delete 
delete from datavalueaudit where dataelementid in(select dataelementid from dataelement where uid in('uI7CltzhEnK','uVvzXRgVUXr')) and organisationunitid in(select organisationunitid from organisationunit where hierarchylevel = 4);
delete from datavalue where dataelementid in(select dataelementid from dataelement where uid in('uI7CltzhEnK','uVvzXRgVUXr')) and sourceid in(select organisationunitid from organisationunit where hierarchylevel = 4);
