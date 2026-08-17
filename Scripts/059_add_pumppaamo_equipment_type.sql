-- 059_add_pumppaamo_equipment_type.sql
-- Adds the 'pumppaamo' equipment type to the equipment_type table.

INSERT INTO kohteet.equipment_type (id, name, sort_order)
VALUES (18, 'pumppaamo', 18);

ALTER TABLE kohteet.equipment_type OWNER TO $DatabaseOwner$;
