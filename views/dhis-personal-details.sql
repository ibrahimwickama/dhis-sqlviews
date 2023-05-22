-- see created view definition and query used
-- \sv view-name
-- Create view for personal details
CREATE OR REPLACE VIEW persondetails AS
 SELECT userinfo.userinfoid,
    users.username,
    users.lastlogin,
    users.disabled,
    users.passwordlastupdated,
    userinfo.surname,
    userinfo.firstname,
    userinfo.email,
    userinfo.phonenumber,
    userinfo.uid,
    userinfo.code,
    userinfo.lastupdated,
    userinfo.jobtitle,
    userinfo.lastcheckedinterpretations,
    userinfo.introduction,
    userinfo.gender,
    userinfo.birthday,
    userinfo.nationality,
    userinfo.employer,
    userinfo.education,
    userinfo.interests,
    userinfo.languages,
    userinfo.created,
    ( SELECT replace(replace(replace((ARRAY( SELECT userrole.name
                   FROM userrolemembers
                     JOIN userrole ON userrole.userroleid = userrolemembers.userroleid
                  WHERE userrolemembers.userid = users.userid))::text, '{'::text, ''::text), '}'::text, ''::text), '"'::text, ''::text) AS replace) AS userroles,
    ( SELECT replace(replace(replace((ARRAY( SELECT organisationunit.name
                   FROM usermembership
                     JOIN organisationunit ON organisationunit.organisationunitid = usermembership.organisationunitid
                  WHERE usermembership.userinfoid = users.userid))::text, '{'::text, ''::text), '}'::text, ''::text), '"'::text, ''::text) AS replace) AS userorganisationunits,
   ( SELECT replace(replace(replace((ARRAY( SELECT organisationunit.uid
                   FROM usermembership
                     JOIN organisationunit ON organisationunit.organisationunitid = usermembership.organisationunitid
                  WHERE usermembership.userinfoid = users.userid))::text, '{'::text, ''::text), '}'::text, ''::text), '"'::text, ''::text) AS replace) AS userorganisationunitsuid,
    creatoruserinfo.surname AS creatorsurname,
    creatoruserinfo.firstname AS creatorfirstname,
    creatoruserinfo.email AS creatoremail,
    creatoruserinfo.phonenumber AS creatorphonenumber
   FROM userinfo
     JOIN users ON users.userid = userinfo.userinfoid
     JOIN userinfo creatoruserinfo ON creatoruserinfo.userinfoid = users.userid
  ORDER BY users.created;





-- personal details with hierarchylevel and dataCapture orgunit
CREATE OR REPLACE VIEW persondetailsadvanced AS
 SELECT userinfo.userinfoid,
    users.username,
    users.lastlogin,
    users.disabled,
    users.passwordlastupdated,
    userinfo.surname,
    userinfo.firstname,
    userinfo.email,
    userinfo.phonenumber,
    userinfo.uid,
    userinfo.code,
    userinfo.lastupdated,
    userinfo.jobtitle,
    userinfo.lastcheckedinterpretations,
    userinfo.introduction,
    userinfo.gender,
    userinfo.birthday,
    userinfo.nationality,
    userinfo.employer,
    userinfo.education,
    userinfo.interests,
    userinfo.languages,
    userinfo.created,
    ( SELECT replace(replace(replace((ARRAY( SELECT userrole.name
                   FROM userrolemembers
                     JOIN userrole ON userrole.userroleid = userrolemembers.userroleid
                  WHERE userrolemembers.userid = users.userid))::text, '{'::text, ''::text), '}'::text, ''::text), '"'::text, ''::text) AS replace) AS userroles,
    ( SELECT replace(replace(replace((ARRAY( SELECT organisationunit.name
                   FROM usermembership
                     JOIN organisationunit ON organisationunit.organisationunitid = usermembership.organisationunitid
                  WHERE usermembership.userinfoid = users.userid))::text, '{'::text, ''::text), '}'::text, ''::text), '"'::text, ''::text) AS replace) AS userorganisationunits,
    ( SELECT replace(replace(replace((ARRAY( SELECT organisationunit.hierarchylevel
                   FROM usermembership
                     JOIN organisationunit ON organisationunit.organisationunitid = usermembership.organisationunitid
                  WHERE usermembership.userinfoid = users.userid))::text, '{'::text, ''::text), '}'::text, ''::text), '"'::text, ''::text) AS replace) AS userorganisationunitslevel,
    ( SELECT replace(replace(replace((ARRAY( SELECT organisationunit.name
                   FROM userdatavieworgunits
                     JOIN organisationunit ON organisationunit.organisationunitid = userdatavieworgunits.organisationunitid
                  WHERE userdatavieworgunits.userinfoid = users.userid))::text, '{'::text, ''::text), '}'::text, ''::text), '"'::text, ''::text) AS replace) AS userdatavieworganisationunits,
    creatoruserinfo.surname AS creatorsurname,
    creatoruserinfo.firstname AS creatorfirstname,
    creatoruserinfo.email AS creatoremail,
    creatoruserinfo.phonenumber AS creatorphonenumber
   FROM userinfo
     JOIN users ON users.userid = userinfo.userinfoid
     JOIN userinfo creatoruserinfo ON creatoruserinfo.userinfoid = users.userid
  ORDER BY users.created;





CREATE VIEW te_userinfo as select * from userinfo;