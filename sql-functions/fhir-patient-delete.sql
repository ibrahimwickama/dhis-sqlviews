CREATE OR REPLACE FUNCTION delete_fhir_patient_resources(p_fhir_id TEXT) RETURNS VOID AS $$
DECLARE
    v_res_id INT;
BEGIN
    -- Step 1: Get the res_id of the patient
    SELECT res_id INTO v_res_id 
    FROM hfj_resource 
    WHERE fhir_id = p_fhir_id 
    LIMIT 1;

    -- If no patient is found, exit the function
    IF v_res_id IS NULL THEN
        RAISE NOTICE 'No patient found with fhir_id = %', p_fhir_id;
        RETURN;
    END IF;

    -- Step 2: Delete related resources first (bulk delete)
    DELETE FROM hfj_res_ver_prov 
    WHERE res_ver_pid IN (
        SELECT pid FROM hfj_res_ver WHERE res_id = v_res_id
    );
    DELETE FROM hfj_res_ver WHERE res_id = v_res_id;
    DELETE FROM hfj_spidx_string WHERE res_id = v_res_id;
    DELETE FROM hfj_spidx_token WHERE res_id = v_res_id;
    DELETE FROM hfj_spidx_date WHERE res_id = v_res_id;
    DELETE FROM hfj_res_link WHERE target_resource_id = v_res_id;
    DELETE FROM hfj_resource 
    WHERE res_id IN (
        SELECT src_resource_id FROM hfj_res_link WHERE target_resource_id = v_res_id
    );

    -- Step 3: Delete the patient itself
    DELETE FROM hfj_res_link WHERE src_resource_id = v_res_id;
    DELETE FROM hfj_resource WHERE res_id = v_res_id;

    RAISE NOTICE 'Deleted patient and associated resources for fhir_id = %', p_fhir_id;
END;
$$ LANGUAGE plpgsql;


-- Run the sql function like this SELECT delete_fhir_patient_resources('HCR-F-00298-4102004');