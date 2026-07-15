-- Replace non-unique index on equipment.uuid with a UNIQUE index
-- to prevent duplicate UUIDs from being inserted.

DROP INDEX IF EXISTS kohteet.idx_equipment_uuid;
CREATE UNIQUE INDEX idx_equipment_uuid ON kohteet.equipment(uuid);
