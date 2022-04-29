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
