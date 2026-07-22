-- Create equipment relationship tables for equipment-to-equipment connections.
-- Replaces legacy FK relationships (valaisin→valaisinkeskus, etc.) and
-- junction tables (liikennemerkki_liikennemerkki_linkki) with a generic
-- relationship model supporting both directional and bidirectional connections.

-- ============================================================================
-- 1. EQUIPMENT_RELATIONSHIP_TYPE code list table
-- ============================================================================

CREATE TABLE kohteet.equipment_relationship_type (
    id          INTEGER PRIMARY KEY,
    name        TEXT NOT NULL,
    direction   TEXT NOT NULL CHECK (direction IN ('directional', 'bidirectional')),
    sort_order  INTEGER
);
ALTER TABLE kohteet.equipment_relationship_type OWNER TO $DatabaseOwner$;

-- Seed initial relationship types
INSERT INTO kohteet.equipment_relationship_type (id, name, direction, sort_order) VALUES
    (1, 'belongs_to_center', 'directional',   1),
    (2, 'co_located',        'bidirectional', 2),
    (3, 'connected_to',      'bidirectional', 3),
    (4, 'mounted_on',        'directional',   4),
    (5, 'part_of',           'directional',   5);

-- ============================================================================
-- 2. EQUIPMENT_RELATIONSHIP junction table
-- ============================================================================

CREATE TABLE kohteet.equipment_relationship (
    id                      SERIAL PRIMARY KEY,
    source_equipment_id     INTEGER NOT NULL REFERENCES kohteet.equipment(id)
                            ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    target_equipment_id     INTEGER NOT NULL REFERENCES kohteet.equipment(id)
                            ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    relationship_type_id    INTEGER NOT NULL REFERENCES kohteet.equipment_relationship_type(id)
                            ON DELETE RESTRICT ON UPDATE CASCADE,

    -- Unique constraint: no duplicate relationships
    CONSTRAINT uq_equipment_relationship
        UNIQUE (source_equipment_id, target_equipment_id, relationship_type_id),

    -- Audit fields
    created_at              TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    modified_at             TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    created_by              VARCHAR(200) NOT NULL,
    modified_by             VARCHAR(200) NOT NULL
);
ALTER TABLE kohteet.equipment_relationship OWNER TO $DatabaseOwner$;

-- ============================================================================
-- 3. Indexes for efficient lookup
-- ============================================================================

-- B-tree indexes on source and target for efficient lookup from either side
CREATE INDEX idx_equipment_relationship_source
    ON kohteet.equipment_relationship(source_equipment_id);
CREATE INDEX idx_equipment_relationship_target
    ON kohteet.equipment_relationship(target_equipment_id);

-- Composite index for filtered queries by source + type
CREATE INDEX idx_equipment_relationship_source_type
    ON kohteet.equipment_relationship(source_equipment_id, relationship_type_id);
