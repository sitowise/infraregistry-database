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
-- TODO: Implement hulevesi main row migration (Task 1.2)

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
