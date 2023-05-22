-- create view for te_attributevalues

CREATE OR REPLACE VIEW public.te_attributevalue AS
 SELECT trackedentityattributevalue.trackedentityinstanceid,
    trackedentityattributevalue.trackedentityattributeid,
    trackedentityattributevalue.created,
    trackedentityattributevalue.lastupdated,
    trackedentityattributevalue.value,
    trackedentityattributevalue.encryptedvalue,
    trackedentityattributevalue.storedby
   FROM trackedentityattributevalue;



create view te_attributevalue as select * from trackedentityattributevalue;
create view te_instance as select * from trackedentityinstance;
create view te_attribute as select * from trackedentityattribute;
create view te_userinfo as select * from userinfo;