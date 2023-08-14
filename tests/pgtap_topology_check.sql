BEGIN;

SELECT plan(4);

DO $$
DECLARE
    v_viheralueenosa kohteet.viheralueenosa%ROWTYPE;
    v_katualueenosa kohteet.katualueenosa%ROWTYPE;
    v_geometry geometry;
BEGIN
    -- TEST viheralueenosa
    INSERT INTO kohteet.viheralueenosa
        (alkuhetki, geom)
        VALUES
        (
            now() - INTERVAL '1 second',
            'SRID=3067; MULTIPOLYGON(((0 0, 100 0, 100 100, 0 100, 0 0)))'
        )
        RETURNING * into v_viheralueenosa;

    v_geometry := 'SRID=3067; MULTIPOLYGON(((100 0, 200 0, 200 100, 100 100, 100 0)))'::geometry;
    RAISE NOTICE '%', ok(kohteet.check_topology(v_geometry), 'Area that touches existing area should return true');

    v_geometry := 'SRID=3067; MULTIPOLYGON(((50 0, 200 0, 200 100, 50 100, 50 0)))'::geometry;
    RAISE NOTICE '%', ok(NOT kohteet.check_topology(v_geometry), 'Area that overlaps existing area should return false');

    DELETE FROM kohteet.viheralueenosa WHERE id = v_viheralueenosa.id;

    -- TEST katualueenosa
    INSERT INTO kohteet.katualueenosa
        (alkuhetki, geom)
        VALUES
        (
            now() - INTERVAL '1 second',
            'SRID=3067; MULTIPOLYGON(((0 0, 100 0, 100 100, 0 100, 0 0)))'
        )
        RETURNING * into v_katualueenosa;

    v_geometry := 'SRID=3067; MULTIPOLYGON(((100 0, 200 0, 200 100, 100 100, 100 0)))'::geometry;
    RAISE NOTICE '%', ok(kohteet.check_topology(v_geometry), 'Area that touches existing area should return true');

    v_geometry := 'SRID=3067; MULTIPOLYGON(((50 0, 200 0, 200 100, 50 100, 50 0)))'::geometry;
    RAISE NOTICE '%', ok(NOT kohteet.check_topology(v_geometry), 'Area that overlaps existing area should return false');

END $$ LANGUAGE plpgsql;

SELECT * from finish();
ROLLBACK;
