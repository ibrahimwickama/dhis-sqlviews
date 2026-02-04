CREATE OR REPLACE FUNCTION delete_fhir_data_resources_by_facilities() RETURNS VOID AS $$
BEGIN
    -- Step 1: Delete from hfj_res_ver_prov based on res_ver_pid
    RAISE NOTICE 'Deleting from hfj_res_ver_prov based on res_ver_pid...';
    DELETE FROM hfj_res_ver_prov 
    WHERE res_ver_pid IN (
        SELECT pid FROM hfj_res_ver WHERE res_id IN (
            SELECT res_id FROM hfj_resource 
            WHERE res_type NOT IN ('ValueSet','Organization','CodeSystem','StructureDefinition') AND res_id IN (
                SELECT res_link_obs.src_resource_id
                FROM hfj_res_link res_link_obs
                WHERE res_link_obs.target_resource_id IN(
                    SELECT res_patient.res_id FROM hfj_resource res_patient 
                    WHERE res_id IN (
                        SELECT res_link.src_resource_id FROM hfj_res_link res_link
                        WHERE res_link.target_resource_type = 'Organization' AND res_link.target_resource_id IN (
                            SELECT res_ou.res_id FROM hfj_resource res_ou
                            WHERE res_ou.res_type = 'Organization' AND res_ou.fhir_id IN('104547-5','102181-5','104115-1','105721-5')
                        )
                    )
                )
            )
        )
    );

    -- Step 2: Delete from hfj_res_ver
    RAISE NOTICE 'Deleting from hfj_res_ver...';
    DELETE FROM hfj_res_ver 
    WHERE res_id IN (
        SELECT res_id FROM hfj_resource 
        WHERE res_type NOT IN ('ValueSet','Organization','CodeSystem','StructureDefinition') AND res_id IN (
                SELECT res_link_obs.src_resource_id
                FROM hfj_res_link res_link_obs
                WHERE res_link_obs.target_resource_id IN(
                    SELECT res_patient.res_id FROM hfj_resource res_patient 
                    WHERE res_id IN (
                        SELECT res_link.src_resource_id FROM hfj_res_link res_link
                        WHERE res_link.target_resource_type = 'Organization' AND res_link.target_resource_id IN (
                            SELECT res_ou.res_id FROM hfj_resource res_ou
                            WHERE res_ou.res_type = 'Organization' AND res_ou.fhir_id IN('104547-5','102181-5','104115-1','105721-5')
                        )
                    )
                )
            )
    );

    -- Step 3: Delete from index tables
    RAISE NOTICE 'Deleting from hfj_spidx_string...';
    DELETE FROM hfj_spidx_string 
    WHERE res_id IN (
        SELECT res_id FROM hfj_resource 
        WHERE res_type NOT IN ('ValueSet','Organization','CodeSystem','StructureDefinition') AND res_id IN (
                SELECT res_link_obs.src_resource_id
                FROM hfj_res_link res_link_obs
                WHERE res_link_obs.target_resource_id IN(
                    SELECT res_patient.res_id FROM hfj_resource res_patient 
                    WHERE res_id IN (
                        SELECT res_link.src_resource_id FROM hfj_res_link res_link
                        WHERE res_link.target_resource_type = 'Organization' AND res_link.target_resource_id IN (
                            SELECT res_ou.res_id FROM hfj_resource res_ou
                            WHERE res_ou.res_type = 'Organization' AND res_ou.fhir_id IN('104547-5','102181-5','104115-1','105721-5')
                        )
                    )
                )
            )
    );

    RAISE NOTICE 'Deleting from hfj_spidx_token...';
    DELETE FROM hfj_spidx_token 
    WHERE res_id IN (
        SELECT res_id FROM hfj_resource 
        WHERE res_type NOT IN ('ValueSet','Organization','CodeSystem','StructureDefinition') AND res_id IN (
                SELECT res_link_obs.src_resource_id
                FROM hfj_res_link res_link_obs
                WHERE res_link_obs.target_resource_id IN(
                    SELECT res_patient.res_id FROM hfj_resource res_patient 
                    WHERE res_id IN (
                        SELECT res_link.src_resource_id FROM hfj_res_link res_link
                        WHERE res_link.target_resource_type = 'Organization' AND res_link.target_resource_id IN (
                            SELECT res_ou.res_id FROM hfj_resource res_ou
                            WHERE res_ou.res_type = 'Organization' AND res_ou.fhir_id IN('104547-5','102181-5','104115-1','105721-5')
                        )
                    )
                )
            )
    );

    RAISE NOTICE 'Deleting from hfj_spidx_date...';
    DELETE FROM hfj_spidx_date 
    WHERE res_id IN (
        SELECT res_id FROM hfj_resource 
        WHERE res_type NOT IN ('ValueSet','Organization','CodeSystem','StructureDefinition') AND res_id IN (
                SELECT res_link_obs.src_resource_id
                FROM hfj_res_link res_link_obs
                WHERE res_link_obs.target_resource_id IN(
                    SELECT res_patient.res_id FROM hfj_resource res_patient 
                    WHERE res_id IN (
                        SELECT res_link.src_resource_id FROM hfj_res_link res_link
                        WHERE res_link.target_resource_type = 'Organization' AND res_link.target_resource_id IN (
                            SELECT res_ou.res_id FROM hfj_resource res_ou
                            WHERE res_ou.res_type = 'Organization' AND res_ou.fhir_id IN('104547-5','102181-5','104115-1','105721-5')
                        )
                    )
                )
            )
    );

    RAISE NOTICE 'Deleting from hfj_spidx_quantity...';
    DELETE FROM hfj_spidx_quantity 
    WHERE res_id IN (
        SELECT res_id FROM hfj_resource 
        WHERE res_type NOT IN ('ValueSet','Organization','CodeSystem','StructureDefinition') AND res_id IN (
                SELECT res_link_obs.src_resource_id
                FROM hfj_res_link res_link_obs
                WHERE res_link_obs.target_resource_id IN(
                    SELECT res_patient.res_id FROM hfj_resource res_patient 
                    WHERE res_id IN (
                        SELECT res_link.src_resource_id FROM hfj_res_link res_link
                        WHERE res_link.target_resource_type = 'Organization' AND res_link.target_resource_id IN (
                            SELECT res_ou.res_id FROM hfj_resource res_ou
                            WHERE res_ou.res_type = 'Organization' AND res_ou.fhir_id IN('104547-5','102181-5','104115-1','105721-5')
                        )
                    )
                )
            )
    );

    -- Step 4: Delete from hfj_res_link (targets)
    RAISE NOTICE 'Deleting from hfj_res_link...';
    DELETE FROM hfj_res_link 
    WHERE target_resource_id IN (
        SELECT res_id FROM hfj_resource 
        WHERE res_type NOT IN ('ValueSet','Organization','CodeSystem','StructureDefinition') AND res_id IN (
                SELECT res_link_obs.src_resource_id
                FROM hfj_res_link res_link_obs
                WHERE res_link_obs.target_resource_id IN(
                    SELECT res_patient.res_id FROM hfj_resource res_patient 
                    WHERE res_id IN (
                        SELECT res_link.src_resource_id FROM hfj_res_link res_link
                        WHERE res_link.target_resource_type = 'Organization' AND res_link.target_resource_id IN (
                            SELECT res_ou.res_id FROM hfj_resource res_ou
                            WHERE res_ou.res_type = 'Organization' AND res_ou.fhir_id IN('104547-5','102181-5','104115-1','105721-5')
                        )
                    )
                )
            )
    );

    -- Step 5: Delete resources that are sources in links
    RAISE NOTICE 'Deleting from hfj_resource...';
    DELETE FROM hfj_resource 
    WHERE res_id IN (
        SELECT src_resource_id FROM hfj_res_link 
        WHERE target_resource_id IN (
            SELECT res_id FROM hfj_resource 
            WHERE res_type NOT IN ('ValueSet','Organization','CodeSystem','StructureDefinition') AND res_id IN (
                SELECT res_link_obs.src_resource_id
                FROM hfj_res_link res_link_obs
                WHERE res_link_obs.target_resource_id IN(
                    SELECT res_patient.res_id FROM hfj_resource res_patient 
                    WHERE res_id IN (
                        SELECT res_link.src_resource_id FROM hfj_res_link res_link
                        WHERE res_link.target_resource_type = 'Organization' AND res_link.target_resource_id IN (
                            SELECT res_ou.res_id FROM hfj_resource res_ou
                            WHERE res_ou.res_type = 'Organization' AND res_ou.fhir_id IN('104547-5','102181-5','104115-1','105721-5')
                        )
                    )
                )
            )
        )
    );

    -- Step 6: Delete remaining links
    RAISE NOTICE 'Deleting from hfj_res_link...';
    DELETE FROM hfj_res_link 
    WHERE src_resource_id IN (
        SELECT res_id FROM hfj_resource 
        WHERE res_type NOT IN ('ValueSet','Organization','CodeSystem','StructureDefinition') AND res_id IN (
                SELECT res_link_obs.src_resource_id
                FROM hfj_res_link res_link_obs
                WHERE res_link_obs.target_resource_id IN(
                    SELECT res_patient.res_id FROM hfj_resource res_patient 
                    WHERE res_id IN (
                        SELECT res_link.src_resource_id FROM hfj_res_link res_link
                        WHERE res_link.target_resource_type = 'Organization' AND res_link.target_resource_id IN (
                            SELECT res_ou.res_id FROM hfj_resource res_ou
                            WHERE res_ou.res_type = 'Organization' AND res_ou.fhir_id IN('104547-5','102181-5','104115-1','105721-5')
                        )
                    )
                )
            )
    );

    -- Step 7: Delete forced IDs
    RAISE NOTICE 'Deleting from hfj_forced_id...';
    DELETE FROM hfj_forced_id 
    WHERE resource_pid IN (
        SELECT res_id FROM hfj_resource 
        WHERE res_type IN ('Encounter','BiologicallyDerivedProduct','Patient','Specimen','Appointment','Person') AND res_id IN (
                SELECT res_link_obs.src_resource_id
                FROM hfj_res_link res_link_obs
                WHERE res_link_obs.target_resource_id IN(
                    SELECT res_patient.res_id FROM hfj_resource res_patient 
                    WHERE res_id IN (
                        SELECT res_link.src_resource_id FROM hfj_res_link res_link
                        WHERE res_link.target_resource_type = 'Organization' AND res_link.target_resource_id IN (
                            SELECT res_ou.res_id FROM hfj_resource res_ou
                            WHERE res_ou.res_type = 'Organization' AND res_ou.fhir_id IN('104547-5','102181-5','104115-1','105721-5')
                        )
                    )
                )
            )
    );

    -- Step 8: Finally, delete the resources
    RAISE NOTICE 'Deleting from hfj_resource...';
    DELETE FROM hfj_resource 
    WHERE res_id IN (
        SELECT res_id FROM hfj_resource 
        WHERE res_type NOT IN ('ValueSet','Organization','CodeSystem','StructureDefinition') AND res_id IN (
                SELECT res_link_obs.src_resource_id
                FROM hfj_res_link res_link_obs
                WHERE res_link_obs.target_resource_id IN(
                    SELECT res_patient.res_id FROM hfj_resource res_patient 
                    WHERE res_id IN (
                        SELECT res_link.src_resource_id FROM hfj_res_link res_link
                        WHERE res_link.target_resource_type = 'Organization' AND res_link.target_resource_id IN (
                            SELECT res_ou.res_id FROM hfj_resource res_ou
                            WHERE res_ou.res_type = 'Organization' AND res_ou.fhir_id IN('104547-5','102181-5','104115-1','105721-5')
                        )
                    )
                )
            )
    );
END;
$$ LANGUAGE plpgsql;


-- Run the sql function like this SELECT delete_fhir_data_resources_by_facilities();