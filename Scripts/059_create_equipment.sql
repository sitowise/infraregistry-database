-- ============================================================================
-- 059_create_equipment.sql
-- Creates the generic equipment model: equipment_type code list, equipment
-- table with JSONB properties, indexes, and junction tables.
-- ============================================================================

-- Equipment type code list table (koodisto pattern: id, name, sort_order)
CREATE TABLE kohteet.equipment_type (
    id          integer PRIMARY KEY,
    name        text NOT NULL,
    sort_order  integer
);
ALTER TABLE kohteet.equipment_type OWNER TO $DatabaseOwner$;

-- Seed with legacy Phase 1 types and planned Phase 2+ types
INSERT INTO kohteet.equipment_type (id, name, sort_order) VALUES (1, 'hulevesi', 1);
INSERT INTO kohteet.equipment_type (id, name, sort_order) VALUES (2, 'jate', 2);
INSERT INTO kohteet.equipment_type (id, name, sort_order) VALUES (3, 'valaisin', 3);
INSERT INTO kohteet.equipment_type (id, name, sort_order) VALUES (4, 'liikennemerkki', 4);
INSERT INTO kohteet.equipment_type (id, name, sort_order) VALUES (5, 'kaapeli', 5);
INSERT INTO kohteet.equipment_type (id, name, sort_order) VALUES (6, 'ryhmasulake', 6);
INSERT INTO kohteet.equipment_type (id, name, sort_order) VALUES (7, 'kaluste', 7);
INSERT INTO kohteet.equipment_type (id, name, sort_order) VALUES (8, 'opaste', 8);
INSERT INTO kohteet.equipment_type (id, name, sort_order) VALUES (9, 'ymparistotaide', 9);
INSERT INTO kohteet.equipment_type (id, name, sort_order) VALUES (10, 'melu', 10);
INSERT INTO kohteet.equipment_type (id, name, sort_order) VALUES (11, 'leikkivaline', 11);
INSERT INTO kohteet.equipment_type (id, name, sort_order) VALUES (12, 'liikunta', 12);
INSERT INTO kohteet.equipment_type (id, name, sort_order) VALUES (13, 'pysakointiruutu', 13);
INSERT INTO kohteet.equipment_type (id, name, sort_order) VALUES (14, 'rakenne', 14);
INSERT INTO kohteet.equipment_type (id, name, sort_order) VALUES (15, 'ajoratamerkinta', 15);
INSERT INTO kohteet.equipment_type (id, name, sort_order) VALUES (16, 'muuvaruste', 16);

-- Generic equipment table
CREATE TABLE kohteet.equipment (
    id                      SERIAL PRIMARY KEY,
    equipment_type_id       INTEGER NOT NULL REFERENCES kohteet.equipment_type(id),
    properties              JSONB NOT NULL DEFAULT '{}',

    -- Identity & metadata
    uuid                    UUID NOT NULL DEFAULT uuid_generate_v4(),
    metadata                TEXT,

    -- Validity period
    valid_from              TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    valid_to                TIMESTAMPTZ,

    -- Spatial data
    geom_polygon            GEOMETRY(Polygon, $Srid$),
    geom_point              GEOMETRY(Point, $Srid$),
    geom_line               GEOMETRY(LineString, $Srid$),

    -- Tenant
    municipality_id         INTEGER NOT NULL DEFAULT $MunicipalityCode$,

    -- Audit
    created_at              TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    modified_at             TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    created_by              VARCHAR(200) NOT NULL,
    modified_by             VARCHAR(200) NOT NULL,

    -- Soft delete
    is_deleted              BOOLEAN NOT NULL DEFAULT FALSE,

    -- Common equipment fields (columns, not in JSONB)
    model                   VARCHAR(200),
    manufacturer            VARCHAR(200),
    manufacture_year        SMALLINT,
    renovation_year         SMALLINT,
    direction               DOUBLE PRECISION,
    owner                   VARCHAR(200),
    holder                  VARCHAR(200),
    maintainer              VARCHAR(200),
    additional_info         TEXT,
    surveyor                VARCHAR(200),
    material_id             INTEGER REFERENCES kohteet.varustemateriaali(id),
    creation_method_id      INTEGER REFERENCES kohteet.luontitapatyyppi(id),
    location_uncertainty_id INTEGER REFERENCES kohteet.sijaintiepavarmuustyyppi(id),
    lifecycle_id            INTEGER REFERENCES kohteet.koodisto_varuste_elinkaari(id),
    status_id               INTEGER REFERENCES kohteet.koodisto_varuste_tila(id),
    condition_id            INTEGER REFERENCES kohteet.koodisto_varuste_kunto(id),
    address_id              INTEGER REFERENCES kohteet.osoite(id),
    green_area_part_id      INTEGER REFERENCES kohteet.viheralueenosa(id),
    street_area_part_id     INTEGER REFERENCES kohteet.katualueenosa(id)
);
ALTER TABLE kohteet.equipment OWNER TO $DatabaseOwner$;

-- Indexes
CREATE INDEX idx_equipment_type ON kohteet.equipment(equipment_type_id);
CREATE INDEX idx_equipment_municipality ON kohteet.equipment(municipality_id);
CREATE INDEX idx_equipment_uuid ON kohteet.equipment(uuid);
CREATE INDEX idx_equipment_properties ON kohteet.equipment USING GIN (properties);
CREATE INDEX idx_equipment_geom_point ON kohteet.equipment USING GIST (geom_point);
CREATE INDEX idx_equipment_geom_polygon ON kohteet.equipment USING GIST (geom_polygon);
CREATE INDEX idx_equipment_geom_line ON kohteet.equipment USING GIST (geom_line);
CREATE INDEX idx_equipment_not_deleted ON kohteet.equipment(is_deleted) WHERE NOT is_deleted;

-- Junction table: equipment <-> liite (attachments)
CREATE TABLE kohteet.equipment_attachment (
    equipment_id  INTEGER NOT NULL REFERENCES kohteet.equipment(id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    attachment_id INTEGER NOT NULL REFERENCES kohteet.liite(id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT equipment_attachment_pk PRIMARY KEY (equipment_id, attachment_id)
);
ALTER TABLE kohteet.equipment_attachment OWNER TO $DatabaseOwner$;

-- Junction table: equipment <-> urakka (contracts)
CREATE TABLE kohteet.equipment_contract (
    equipment_id INTEGER NOT NULL REFERENCES kohteet.equipment(id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    contract_id  INTEGER NOT NULL REFERENCES kohteet.urakka(id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT equipment_contract_pk PRIMARY KEY (equipment_id, contract_id)
);
ALTER TABLE kohteet.equipment_contract OWNER TO $DatabaseOwner$;

-- Junction table: equipment <-> suunnitelmalinkki (plan links)
CREATE TABLE kohteet.equipment_plan_link (
    equipment_id INTEGER NOT NULL REFERENCES kohteet.equipment(id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    plan_link_id INTEGER NOT NULL REFERENCES kohteet.suunnitelmalinkki(id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT equipment_plan_link_pk PRIMARY KEY (equipment_id, plan_link_id)
);
ALTER TABLE kohteet.equipment_plan_link OWNER TO $DatabaseOwner$;

-- Junction table: equipment <-> varustetoimenpide (maintenance actions)
CREATE TABLE kohteet.equipment_maintenance_action (
    equipment_id          INTEGER NOT NULL REFERENCES kohteet.equipment(id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    maintenance_action_id INTEGER NOT NULL REFERENCES kohteet.varuste_toimenpide(id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT equipment_maintenance_action_pk PRIMARY KEY (equipment_id, maintenance_action_id)
);
ALTER TABLE kohteet.equipment_maintenance_action OWNER TO $DatabaseOwner$;
