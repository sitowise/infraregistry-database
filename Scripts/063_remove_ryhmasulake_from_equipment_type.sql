-- ============================================================================
-- 063_remove_ryhmasulake_from_equipment_type.sql
-- Removes ryhmasulake (id=6) from the generic equipment model.
-- Ryhmasulake inherits from abstractinfraomaisuuskohde, NOT abstractvaruste,
-- and is handled via InfraomaisuuskohdeController / InfraomaisuuskohdeRepository.
-- It was incorrectly included in the equipment_type registry and migration.
-- ============================================================================

-- Remove junction table rows for any migrated ryhmasulake equipment records
DELETE FROM kohteet.equipment_maintenance_action
WHERE equipment_id IN (SELECT id FROM kohteet.equipment WHERE equipment_type_id = 6);

DELETE FROM kohteet.equipment_plan_link
WHERE equipment_id IN (SELECT id FROM kohteet.equipment WHERE equipment_type_id = 6);

DELETE FROM kohteet.equipment_contract
WHERE equipment_id IN (SELECT id FROM kohteet.equipment WHERE equipment_type_id = 6);

DELETE FROM kohteet.equipment_attachment
WHERE equipment_id IN (SELECT id FROM kohteet.equipment WHERE equipment_type_id = 6);

-- Remove migrated ryhmasulake rows from the equipment table
DELETE FROM kohteet.equipment WHERE equipment_type_id = 6;

-- Remove the equipment_type code list entry
DELETE FROM kohteet.equipment_type WHERE id = 6;
