-- Migrate legacy FK relationships and junction table records to equipment_relationship.
-- Depends on:
--   059: equipment and equipment_type tables exist
--   060: Legacy equipment data migrated to equipment table
--   062: valaisinkeskus added to equipment_type (id=17) and data migrated
--   065: equipment_relationship and equipment_relationship_type tables exist

DO $$
DECLARE
    v_migrated   INTEGER;
    v_total      INTEGER;
BEGIN

-- ============================================================================
-- 1. VALAISIN → VALAISINKESKUS (belongs_to_center, type_id=1)
-- ============================================================================
SELECT count(*) INTO v_total
FROM kohteet.valaisin v
WHERE v.valaisinkeskus_id IS NOT NULL;

INSERT INTO kohteet.equipment_relationship (
    source_equipment_id, target_equipment_id, relationship_type_id,
    created_at, modified_at, created_by, modified_by
)
SELECT
    e_src.id,
    e_tgt.id,
    1,
    NOW(), NOW(), 'migration', 'migration'
FROM kohteet.valaisin v
JOIN kohteet.equipment e_src
    ON e_src.uuid = v.yksilointitieto::uuid AND e_src.equipment_type_id = 3
JOIN kohteet.valaisinkeskus vk ON vk.id = v.valaisinkeskus_id
JOIN kohteet.equipment e_tgt
    ON e_tgt.uuid = vk.yksilointitieto::uuid AND e_tgt.equipment_type_id = 17
WHERE v.valaisinkeskus_id IS NOT NULL
ON CONFLICT ON CONSTRAINT uq_equipment_relationship DO NOTHING;

GET DIAGNOSTICS v_migrated = ROW_COUNT;
RAISE NOTICE 'valaisin→valaisinkeskus: migrated % of % relationships', v_migrated, v_total;

-- ============================================================================
-- 2. RYHMASULAKE → VALAISINKESKUS (belongs_to_center, type_id=1)
-- ============================================================================
SELECT count(*) INTO v_total
FROM kohteet.ryhmasulake r
WHERE r.valaisinkeskus_id IS NOT NULL;

INSERT INTO kohteet.equipment_relationship (
    source_equipment_id, target_equipment_id, relationship_type_id,
    created_at, modified_at, created_by, modified_by
)
SELECT
    e_src.id,
    e_tgt.id,
    1,
    NOW(), NOW(), 'migration', 'migration'
FROM kohteet.ryhmasulake r
JOIN kohteet.equipment e_src
    ON e_src.uuid = r.yksilointitieto::uuid AND e_src.equipment_type_id = 6
JOIN kohteet.valaisinkeskus vk ON vk.id = r.valaisinkeskus_id
JOIN kohteet.equipment e_tgt
    ON e_tgt.uuid = vk.yksilointitieto::uuid AND e_tgt.equipment_type_id = 17
WHERE r.valaisinkeskus_id IS NOT NULL
ON CONFLICT ON CONSTRAINT uq_equipment_relationship DO NOTHING;

GET DIAGNOSTICS v_migrated = ROW_COUNT;
RAISE NOTICE 'ryhmasulake→valaisinkeskus: migrated % of % relationships', v_migrated, v_total;

-- ============================================================================
-- 3. KAAPELI → VALAISINKESKUS (belongs_to_center, type_id=1)
-- ============================================================================
SELECT count(*) INTO v_total
FROM kohteet.kaapeli k
WHERE k.valaisinkeskus_id IS NOT NULL;

INSERT INTO kohteet.equipment_relationship (
    source_equipment_id, target_equipment_id, relationship_type_id,
    created_at, modified_at, created_by, modified_by
)
SELECT
    e_src.id,
    e_tgt.id,
    1,
    NOW(), NOW(), 'migration', 'migration'
FROM kohteet.kaapeli k
JOIN kohteet.equipment e_src
    ON e_src.uuid = k.yksilointitieto::uuid AND e_src.equipment_type_id = 5
JOIN kohteet.valaisinkeskus vk ON vk.id = k.valaisinkeskus_id
JOIN kohteet.equipment e_tgt
    ON e_tgt.uuid = vk.yksilointitieto::uuid AND e_tgt.equipment_type_id = 17
WHERE k.valaisinkeskus_id IS NOT NULL
ON CONFLICT ON CONSTRAINT uq_equipment_relationship DO NOTHING;

GET DIAGNOSTICS v_migrated = ROW_COUNT;
RAISE NOTICE 'kaapeli→valaisinkeskus: migrated % of % relationships', v_migrated, v_total;

-- ============================================================================
-- 4. LIIKENNEMERKKI ↔ LIIKENNEMERKKI (co_located, type_id=2, bidirectional)
-- ============================================================================
SELECT count(*) INTO v_total
FROM kohteet.liikennemerkki_liikennemerkki_linkki;

INSERT INTO kohteet.equipment_relationship (
    source_equipment_id, target_equipment_id, relationship_type_id,
    created_at, modified_at, created_by, modified_by
)
SELECT
    e1.id,
    e2.id,
    2,
    NOW(), NOW(), 'migration', 'migration'
FROM kohteet.liikennemerkki_liikennemerkki_linkki lll
JOIN kohteet.liikennemerkki lm1 ON lm1.id = lll.liikennemerkki_id1
JOIN kohteet.equipment e1
    ON e1.uuid = lm1.yksilointitieto::uuid AND e1.equipment_type_id = 4
JOIN kohteet.liikennemerkki lm2 ON lm2.id = lll.liikennemerkki_id2
JOIN kohteet.equipment e2
    ON e2.uuid = lm2.yksilointitieto::uuid AND e2.equipment_type_id = 4
ON CONFLICT ON CONSTRAINT uq_equipment_relationship DO NOTHING;

GET DIAGNOSTICS v_migrated = ROW_COUNT;
RAISE NOTICE 'liikennemerkki↔liikennemerkki: migrated % of % relationships', v_migrated, v_total;

-- ============================================================================
-- 5. Remove valaisinkeskusId from JSONB properties
-- ============================================================================
UPDATE kohteet.equipment
SET properties = properties - 'valaisinkeskusId',
    modified_at = NOW(),
    modified_by = 'migration'
WHERE equipment_type_id IN (3, 5, 6)
  AND properties ? 'valaisinkeskusId';

GET DIAGNOSTICS v_migrated = ROW_COUNT;
RAISE NOTICE 'Removed valaisinkeskusId from % equipment JSONB records', v_migrated;

-- ============================================================================
RAISE NOTICE '========================================';
RAISE NOTICE 'Legacy relationship migration complete.';
RAISE NOTICE '========================================';

END $$;
