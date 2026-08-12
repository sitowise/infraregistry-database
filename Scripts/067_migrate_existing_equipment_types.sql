-- ============================================================================
-- 067_migrate_existing_equipment_types.sql
-- Enhanced/supplementary migration of legacy per-type equipment data into the
-- generic kohteet.equipment table. Supplements script 060 with:
--   - UUID format validation (regex-based, skips invalid rows with WARNING)
--   - NULL UUID handling (pre-fills with uuid_generate_v4() before migration)
--   - Enhanced per-table and per-junction reporting with orphan row counts
-- Uses ON CONFLICT DO NOTHING for idempotency (rows already migrated by 060
-- are safely skipped).
-- ============================================================================
-- Depends on: 059 (equipment + equipment_type tables)
-- Depends on: 060 (initial migration — this script supplements it)
-- Depends on: 064 (uuid unique index on kohteet.equipment)
-- Requires: uuid-ossp extension (uuid_generate_v4)

DO $$
DECLARE
    v_row_count    integer;
    v_orphan_count integer;
    v_total        integer;
    v_uuid_pattern text := '^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$';
BEGIN

RAISE NOTICE 'Starting equipment type migration...';

-- ============================================================================
-- 1. HULEVESI (equipment_type_id = 1)
-- ============================================================================

-- Pre-fill NULL UUIDs so junction table JOINs can resolve correctly.
-- Safe: entire DO-block is transactional; rollback on failure.
-- On fresh environments (060 + 067 both run), ON CONFLICT handles deduplication.
UPDATE kohteet.hulevesi
SET yksilointitieto = uuid_generate_v4()::text
WHERE yksilointitieto IS NULL;

SELECT count(*) INTO v_total FROM kohteet.hulevesi;
RAISE NOTICE 'hulevesi: starting migration (% total rows)', v_total;

-- Warn about rows with invalid UUID format (non-NULL but not matching pattern)
SELECT count(*) INTO v_orphan_count
FROM kohteet.hulevesi
WHERE yksilointitieto IS NOT NULL AND yksilointitieto !~ v_uuid_pattern;

IF v_orphan_count > 0 THEN
    RAISE WARNING 'hulevesi: skipping % rows with invalid UUID format. IDs: %',
        v_orphan_count,
        (SELECT array_agg(id) FROM kohteet.hulevesi
         WHERE yksilointitieto IS NOT NULL AND yksilointitieto !~ v_uuid_pattern);
END IF;

-- Insert valid rows (NULLs already pre-filled, invalid UUIDs excluded)
WITH valid_hulevesi AS (
    SELECT *
    FROM kohteet.hulevesi
    WHERE yksilointitieto ~ v_uuid_pattern
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

-- Report orphan rows (parents with invalid UUID that were not migrated)
SELECT count(*) INTO v_orphan_count
FROM kohteet.hulevesi h
WHERE h.yksilointitieto IS NOT NULL AND h.yksilointitieto !~ v_uuid_pattern
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
    RAISE NOTICE 'hulevesi: % orphaned junction rows (parent has invalid UUID → no equipment match)', v_orphan_count;
END IF;

-- ============================================================================
-- 2. JATE (equipment_type_id = 2)
-- ============================================================================

-- Pre-fill NULL UUIDs so junction table JOINs can resolve correctly.
-- Safe: entire DO-block is transactional; rollback on failure.
-- On fresh environments (060 + 067 both run), ON CONFLICT handles deduplication.
UPDATE kohteet.jate
SET yksilointitieto = uuid_generate_v4()::text
WHERE yksilointitieto IS NULL;

SELECT count(*) INTO v_total FROM kohteet.jate;
RAISE NOTICE 'jate: starting migration (% total rows)', v_total;

-- Warn about rows with invalid UUID format (non-NULL but not matching pattern)
SELECT count(*) INTO v_orphan_count
FROM kohteet.jate
WHERE yksilointitieto IS NOT NULL AND yksilointitieto !~ v_uuid_pattern;

IF v_orphan_count > 0 THEN
    RAISE WARNING 'jate: skipping % rows with invalid UUID format. IDs: %',
        v_orphan_count,
        (SELECT array_agg(id) FROM kohteet.jate
         WHERE yksilointitieto IS NOT NULL AND yksilointitieto !~ v_uuid_pattern);
END IF;

-- Insert valid rows (NULLs already pre-filled, invalid UUIDs excluded)
WITH valid_jate AS (
    SELECT *
    FROM kohteet.jate
    WHERE yksilointitieto ~ v_uuid_pattern
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
    2,
    jsonb_build_object(
        'jatetyyppiId', jatetyyppi_id,
        'koko', koko,
        'putkikeraysjarjestelmaKytkin', putkikeraysjarjestelma_kytkin,
        'sijaintiMaanPinnallaKytkin', sijainti_maan_pinnalla_kytkin,
        'vaarallistenJateastiaKytkin', vaarallisten_jateastia_kytkin,
        'tyhjennysvaliViikkoinaKesa', tyhjennysvali_viikkoina_kesa,
        'tyhjennysvaliViikkoinaTalvi', tyhjennysvali_viikkoina_talvi,
        'tarkastusvaliId', tarkastusvali_id
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
FROM valid_jate
ON CONFLICT (uuid) DO NOTHING;

GET DIAGNOSTICS v_row_count = ROW_COUNT;
RAISE NOTICE 'jate: migrated % of % records', v_row_count, v_total;

-- Jate junction tables
INSERT INTO kohteet.equipment_attachment (equipment_id, attachment_id)
SELECT e.id, jl.liite_id
FROM kohteet.jate_liite jl
JOIN kohteet.jate j ON j.id = jl.jate_id
JOIN kohteet.equipment e ON e.uuid = j.yksilointitieto::uuid AND e.equipment_type_id = 2
ON CONFLICT DO NOTHING;

GET DIAGNOSTICS v_row_count = ROW_COUNT;
RAISE NOTICE 'jate_liite → equipment_attachment: migrated % rows', v_row_count;

INSERT INTO kohteet.equipment_contract (equipment_id, contract_id)
SELECT e.id, ju.urakka_id
FROM kohteet.jate_urakka ju
JOIN kohteet.jate j ON j.id = ju.jate_id
JOIN kohteet.equipment e ON e.uuid = j.yksilointitieto::uuid AND e.equipment_type_id = 2
ON CONFLICT DO NOTHING;

GET DIAGNOSTICS v_row_count = ROW_COUNT;
RAISE NOTICE 'jate_urakka → equipment_contract: migrated % rows', v_row_count;

INSERT INTO kohteet.equipment_maintenance_action (equipment_id, maintenance_action_id)
SELECT e.id, jvt.varuste_toimenpide_id
FROM kohteet.jate_varuste_toimenpide_linkki jvt
JOIN kohteet.jate j ON j.id = jvt.jate_id
JOIN kohteet.equipment e ON e.uuid = j.yksilointitieto::uuid AND e.equipment_type_id = 2
ON CONFLICT DO NOTHING;

GET DIAGNOSTICS v_row_count = ROW_COUNT;
RAISE NOTICE 'jate_varuste_toimenpide_linkki → equipment_maintenance_action: migrated % rows', v_row_count;

INSERT INTO kohteet.equipment_plan_link (equipment_id, plan_link_id)
SELECT e.id, js.suunnitelmalinkki_id
FROM kohteet.jate_suunnitelmalinkki js
JOIN kohteet.jate j ON j.id = js.jate_id
JOIN kohteet.equipment e ON e.uuid = j.yksilointitieto::uuid AND e.equipment_type_id = 2
ON CONFLICT DO NOTHING;

GET DIAGNOSTICS v_row_count = ROW_COUNT;
RAISE NOTICE 'jate_suunnitelmalinkki → equipment_plan_link: migrated % rows', v_row_count;

-- Report orphan rows (parents with invalid UUID that were not migrated)
SELECT count(*) INTO v_orphan_count
FROM kohteet.jate j
WHERE j.yksilointitieto IS NOT NULL AND j.yksilointitieto !~ v_uuid_pattern
  AND EXISTS (
    SELECT 1 FROM kohteet.jate_liite jl WHERE jl.jate_id = j.id
    UNION ALL
    SELECT 1 FROM kohteet.jate_urakka ju WHERE ju.jate_id = j.id
    UNION ALL
    SELECT 1 FROM kohteet.jate_varuste_toimenpide_linkki jvt WHERE jvt.jate_id = j.id
    UNION ALL
    SELECT 1 FROM kohteet.jate_suunnitelmalinkki js WHERE js.jate_id = j.id
  );

IF v_orphan_count > 0 THEN
    RAISE NOTICE 'jate: % orphaned junction rows (parent has invalid UUID → no equipment match)', v_orphan_count;
END IF;

-- ============================================================================
-- 3. LIIKENNEMERKKI (equipment_type_id = 4)
-- ============================================================================
-- Note: liikennemerkki_liikennemerkki_linkki is NOT migrated here (handled by 064/065)

-- Pre-fill NULL UUIDs so junction table JOINs can resolve correctly.
-- Safe: entire DO-block is transactional; rollback on failure.
-- On fresh environments (060 + 067 both run), ON CONFLICT handles deduplication.
UPDATE kohteet.liikennemerkki
SET yksilointitieto = uuid_generate_v4()::text
WHERE yksilointitieto IS NULL;

SELECT count(*) INTO v_total FROM kohteet.liikennemerkki;
RAISE NOTICE 'liikennemerkki: starting migration (% total rows)', v_total;

-- Warn about rows with invalid UUID format (non-NULL but not matching pattern)
SELECT count(*) INTO v_orphan_count
FROM kohteet.liikennemerkki
WHERE yksilointitieto IS NOT NULL AND yksilointitieto !~ v_uuid_pattern;

IF v_orphan_count > 0 THEN
    RAISE WARNING 'liikennemerkki: skipping % rows with invalid UUID format. IDs: %',
        v_orphan_count,
        (SELECT array_agg(id) FROM kohteet.liikennemerkki
         WHERE yksilointitieto IS NOT NULL AND yksilointitieto !~ v_uuid_pattern);
END IF;

-- Insert valid rows (NULLs already pre-filled, invalid UUIDs excluded)
WITH valid_liikennemerkki AS (
    SELECT *
    FROM kohteet.liikennemerkki
    WHERE yksilointitieto ~ v_uuid_pattern
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
    4,
    jsonb_build_object(
        'liikennemerkkityyppiId', liikennemerkkityyppi_id,
        'liikennemerkkityyppi2020Id', liikennemerkkityyppi2020_id,
        'teksti', teksti,
        'arvo', arvo,
        'rakenneId', rakenne_id,
        'kokoId', koko_id,
        'korkeus', korkeus,
        'kalvonTyyppiId', kalvon_tyyppi_id,
        'sijaintitarkenneId', sijaintitarkenne_id,
        'kaistanTyyppiId', kaistan_tyyppi_id,
        'kaistanNumeroId', kaistan_numero_id,
        'kaksipuoleinenKytkin', kaksipuoleinen_kytkin,
        'suuntima', suuntima,
        'lisakilvenVariId', lisakilven_vari_id
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
FROM valid_liikennemerkki
ON CONFLICT (uuid) DO NOTHING;

GET DIAGNOSTICS v_row_count = ROW_COUNT;
RAISE NOTICE 'liikennemerkki: migrated % of % records', v_row_count, v_total;

-- Liikennemerkki junction tables
-- Note: liikennemerkki_liikennemerkki_linkki is NOT included (handled by 064/065)
INSERT INTO kohteet.equipment_attachment (equipment_id, attachment_id)
SELECT e.id, ll.liite_id
FROM kohteet.liikennemerkki_liite ll
JOIN kohteet.liikennemerkki lm ON lm.id = ll.liikennemerkki_id
JOIN kohteet.equipment e ON e.uuid = lm.yksilointitieto::uuid AND e.equipment_type_id = 4
ON CONFLICT DO NOTHING;

GET DIAGNOSTICS v_row_count = ROW_COUNT;
RAISE NOTICE 'liikennemerkki_liite → equipment_attachment: migrated % rows', v_row_count;

INSERT INTO kohteet.equipment_contract (equipment_id, contract_id)
SELECT e.id, lu.urakka_id
FROM kohteet.liikennemerkki_urakka lu
JOIN kohteet.liikennemerkki lm ON lm.id = lu.liikennemerkki_id
JOIN kohteet.equipment e ON e.uuid = lm.yksilointitieto::uuid AND e.equipment_type_id = 4
ON CONFLICT DO NOTHING;

GET DIAGNOSTICS v_row_count = ROW_COUNT;
RAISE NOTICE 'liikennemerkki_urakka → equipment_contract: migrated % rows', v_row_count;

INSERT INTO kohteet.equipment_maintenance_action (equipment_id, maintenance_action_id)
SELECT e.id, lvt.varuste_toimenpide_id
FROM kohteet.liikennemerkki_varuste_toimenpide_linkki lvt
JOIN kohteet.liikennemerkki lm ON lm.id = lvt.liikennemerkki_id
JOIN kohteet.equipment e ON e.uuid = lm.yksilointitieto::uuid AND e.equipment_type_id = 4
ON CONFLICT DO NOTHING;

GET DIAGNOSTICS v_row_count = ROW_COUNT;
RAISE NOTICE 'liikennemerkki_varuste_toimenpide_linkki → equipment_maintenance_action: migrated % rows', v_row_count;

INSERT INTO kohteet.equipment_plan_link (equipment_id, plan_link_id)
SELECT e.id, ls.suunnitelmalinkki_id
FROM kohteet.liikennemerkki_suunnitelmalinkki ls
JOIN kohteet.liikennemerkki lm ON lm.id = ls.liikennemerkki_id
JOIN kohteet.equipment e ON e.uuid = lm.yksilointitieto::uuid AND e.equipment_type_id = 4
ON CONFLICT DO NOTHING;

GET DIAGNOSTICS v_row_count = ROW_COUNT;
RAISE NOTICE 'liikennemerkki_suunnitelmalinkki → equipment_plan_link: migrated % rows', v_row_count;

-- Report orphan rows (parents with invalid UUID that were not migrated)
SELECT count(*) INTO v_orphan_count
FROM kohteet.liikennemerkki lm
WHERE lm.yksilointitieto IS NOT NULL AND lm.yksilointitieto !~ v_uuid_pattern
  AND EXISTS (
    SELECT 1 FROM kohteet.liikennemerkki_liite ll WHERE ll.liikennemerkki_id = lm.id
    UNION ALL
    SELECT 1 FROM kohteet.liikennemerkki_urakka lu WHERE lu.liikennemerkki_id = lm.id
    UNION ALL
    SELECT 1 FROM kohteet.liikennemerkki_varuste_toimenpide_linkki lvt WHERE lvt.liikennemerkki_id = lm.id
    UNION ALL
    SELECT 1 FROM kohteet.liikennemerkki_suunnitelmalinkki ls WHERE ls.liikennemerkki_id = lm.id
  );

IF v_orphan_count > 0 THEN
    RAISE NOTICE 'liikennemerkki: % orphaned junction rows (parent has invalid UUID → no equipment match)', v_orphan_count;
END IF;

-- ============================================================================
-- MIGRATION SUMMARY
-- ============================================================================
RAISE NOTICE '========================================';
RAISE NOTICE 'Equipment type migration complete.';
RAISE NOTICE '========================================';

END $$;
