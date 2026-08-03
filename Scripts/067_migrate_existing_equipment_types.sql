-- ============================================================================
-- 067_migrate_existing_equipment_types.sql
-- Enhanced/supplementary migration of legacy per-type equipment data into the
-- generic kohteet.equipment table. Supplements script 060 with:
--   - UUID format validation (regex-based, skips invalid rows with WARNING)
--   - NULL UUID handling (generates new UUID via uuid_generate_v4())
--   - Enhanced per-table and per-junction reporting with orphan row counts
-- Uses ON CONFLICT DO NOTHING for idempotency (rows already migrated by 060
-- are safely skipped).
-- ============================================================================

DO $$
DECLARE
    v_row_count    integer;
    v_orphan_count integer;
    v_table_name   text;
    v_total        integer;
    v_uuid_pattern text := '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$';
BEGIN

RAISE NOTICE 'Starting equipment type migration...';

-- ============================================================================
-- 1. HULEVESI (equipment_type_id = 1)
-- ============================================================================
v_table_name := 'hulevesi';
SELECT count(*) INTO v_total FROM kohteet.hulevesi;
RAISE NOTICE 'hulevesi: starting migration (% total rows)', v_total;

-- Warn about rows with invalid UUID format (non-NULL but not matching pattern)
SELECT count(*) INTO v_orphan_count
FROM kohteet.hulevesi
WHERE yksilointitieto IS NOT NULL
  AND yksilointitieto !~ v_uuid_pattern;

IF v_orphan_count > 0 THEN
    RAISE WARNING 'hulevesi: skipping % rows with invalid UUID format', v_orphan_count;
END IF;

-- Insert valid rows (NULL UUID gets generated, valid UUID cast, invalid UUID excluded)
WITH valid_hulevesi AS (
    SELECT *
    FROM kohteet.hulevesi
    WHERE yksilointitieto IS NULL
       OR yksilointitieto ~ v_uuid_pattern
)
INSERT INTO kohteet.equipment (
    equipment_type_id, properties,
    uuid, metadata, valid_from, valid_to,
    geom_polygon, geom_point, geom_line,
    municipality_id,
    created_at, modified_at, created_by, modified_by,
    is_deleted,
    model, manufacturer, manufacture_year, renovation_year,
    direction, owner, holder, maintainer, additional_info, surveyor,
    material_id, creation_method_id, location_uncertainty_id,
    lifecycle_id, status_id, condition_id,
    address_id, green_area_part_id, street_area_part_id
)
SELECT
    1,
    jsonb_build_object(
        'hulevesityyppiId', hulevesityyppi_id,
        'kannenHalkaisija', kannen_halkaisija,
        'kannenTyyppiId', kannen_tyyppi_id
    ),
    COALESCE(yksilointitieto::uuid, uuid_generate_v4()), metatieto, alkuhetki, loppuhetki,
    geom_poly, geom_piste, geom_line,
    kunta_id,
    luonti_pvm, muokkaus_pvm, datan_luoja, muokkaaja,
    is_deleted,
    malli, valmistaja, valmistumisvuosi, perusparannusvuosi,
    suunta, omistaja, haltija, kunnossapitaja, lisatietoja, inventoija,
    materiaali_id, luontitapa_id, sijaintiepavarmuus_id,
    elinkaari_id, tila_id, kunto_id,
    osoite_id, kuuluuviheralueenosaan, kuuluukatualueenosaan
FROM valid_hulevesi
ON CONFLICT (uuid) DO NOTHING;

GET DIAGNOSTICS v_row_count = ROW_COUNT;
RAISE NOTICE 'hulevesi: migrated % of % records', v_row_count, v_total;

-- Hulevesi junction tables
INSERT INTO kohteet.equipment_attachment (equipment_id, attachment_id)
SELECT e.id, hl.liite_id
FROM kohteet.hulevesi_liite hl
JOIN kohteet.hulevesi h ON h.id = hl.hulevesi_id
JOIN kohteet.equipment e ON e.uuid = h.yksilointitieto::uuid AND e.equipment_type_id = 1
ON CONFLICT DO NOTHING;

GET DIAGNOSTICS v_row_count = ROW_COUNT;
RAISE NOTICE 'hulevesi_liite → equipment_attachment: migrated % rows', v_row_count;

INSERT INTO kohteet.equipment_contract (equipment_id, contract_id)
SELECT e.id, hu.urakka_id
FROM kohteet.hulevesi_urakka hu
JOIN kohteet.hulevesi h ON h.id = hu.hulevesi_id
JOIN kohteet.equipment e ON e.uuid = h.yksilointitieto::uuid AND e.equipment_type_id = 1
ON CONFLICT DO NOTHING;

GET DIAGNOSTICS v_row_count = ROW_COUNT;
RAISE NOTICE 'hulevesi_urakka → equipment_contract: migrated % rows', v_row_count;

INSERT INTO kohteet.equipment_maintenance_action (equipment_id, maintenance_action_id)
SELECT e.id, hvt.varuste_toimenpide_id
FROM kohteet.hulevesi_varuste_toimenpide_linkki hvt
JOIN kohteet.hulevesi h ON h.id = hvt.hulevesi_id
JOIN kohteet.equipment e ON e.uuid = h.yksilointitieto::uuid AND e.equipment_type_id = 1
ON CONFLICT DO NOTHING;

GET DIAGNOSTICS v_row_count = ROW_COUNT;
RAISE NOTICE 'hulevesi_varuste_toimenpide_linkki → equipment_maintenance_action: migrated % rows', v_row_count;

INSERT INTO kohteet.equipment_plan_link (equipment_id, plan_link_id)
SELECT e.id, hs.suunnitelmalinkki_id
FROM kohteet.hulevesi_suunnitelmalinkki hs
JOIN kohteet.hulevesi h ON h.id = hs.hulevesi_id
JOIN kohteet.equipment e ON e.uuid = h.yksilointitieto::uuid AND e.equipment_type_id = 1
ON CONFLICT DO NOTHING;

GET DIAGNOSTICS v_row_count = ROW_COUNT;
RAISE NOTICE 'hulevesi_suunnitelmalinkki → equipment_plan_link: migrated % rows', v_row_count;

-- Report orphan rows (junction rows with no matching equipment record)
SELECT count(*) INTO v_orphan_count
FROM kohteet.hulevesi h
WHERE (h.yksilointitieto IS NULL OR h.yksilointitieto !~ v_uuid_pattern)
  AND EXISTS (
    SELECT 1 FROM kohteet.hulevesi_liite hl WHERE hl.hulevesi_id = h.id
    UNION ALL
    SELECT 1 FROM kohteet.hulevesi_urakka hu WHERE hu.hulevesi_id = h.id
    UNION ALL
    SELECT 1 FROM kohteet.hulevesi_varuste_toimenpide_linkki hvt WHERE hvt.hulevesi_id = h.id
    UNION ALL
    SELECT 1 FROM kohteet.hulevesi_suunnitelmalinkki hs WHERE hs.hulevesi_id = h.id
  );

IF v_orphan_count > 0 THEN
    RAISE NOTICE 'hulevesi: % orphaned junction rows (parent has no valid UUID → no equipment match)', v_orphan_count;
END IF;

-- ============================================================================
-- 2. JATE (equipment_type_id = 2)
-- ============================================================================
-- TODO: Implement jate main row migration (Task 4.1)

-- ============================================================================
-- 3. LIIKENNEMERKKI (equipment_type_id = 4)
-- ============================================================================
-- TODO: Implement liikennemerkki main row migration (Task 5.1)

-- ============================================================================
-- MIGRATION SUMMARY
-- ============================================================================
RAISE NOTICE '========================================';
RAISE NOTICE 'Equipment type migration complete.';
RAISE NOTICE '========================================';

END $$;
