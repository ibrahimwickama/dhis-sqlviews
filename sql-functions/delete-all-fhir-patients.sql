CREATE OR REPLACE FUNCTION deleteAllFhirPatients() RETURNS void AS $$
DECLARE
    rec record;
BEGIN
    FOR rec IN SELECT fhir_id from hfj_resource where fhir_id ilike '%HCR-%'
    LOOP
        -- Pass patient HCR number to another postgres function
        PERFORM delete_fhir_patient_resources(rec.fhir_id);
        RAISE NOTICE '[DELETE] Patient deleted with HCR NO: %', rec.fhir_id;
    END LOOP;
END
$$
LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION deleteAllFhirDataAroundPatients() RETURNS void AS $$
DECLARE
    rec record;
BEGIN
    FOR rec IN SELECT fhir_id from hfj_resource where res_type NOT IN ('ValueSet','Organization','CodeSystem','StructureDefinition')
    LOOP
        -- Pass patient HCR number to another postgres function
        PERFORM delete_fhir_patient_resources(rec.fhir_id);
        RAISE NOTICE '[DELETE] FHIR resource deleted with fhir_id: %', rec.fhir_id;
    END LOOP;
END
$$
LANGUAGE plpgsql;


-- how to run the sql procedure 
SELECT deleteAllFhirPatients();