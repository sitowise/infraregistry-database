BEGIN;

SELECT plan(36);

DO $$
DECLARE
    v_viheralue record;
    v_viheralueenosa record;
    v_katualue record;
    v_katualueenosa record;
    v_varuste record;
    result record;

BEGIN
    -- CREATE VIHERALUE
    INSERT INTO kohteet.viheralue
        (nimi, alkuhetki)
        VALUES ('koeviheralue', now() - INTERVAL '1 second')
        RETURNING * INTO v_viheralue;

    INSERT INTO kohteet.viheralueenosa
        (kuuluuviheralueeseen_id, alkuhetki, geom)
        VALUES
        (
            v_viheralue.id,
            now() - INTERVAL '1 second',
            'SRID=3067; MULTIPOLYGON(((0 0, 100 0, 100 100, 0 100, 0 0)))'
        )
        RETURNING * into v_viheralueenosa;

    RAISE notice '%', is(
        v_viheralueenosa.kuuluuviheralueeseen_id,
        v_viheralue.id,
        'viheralueenosa.kuuluuviheralueeseen_id should be the same as the viheralue id'
    );

    -- CREATE KATUALUE
    INSERT INTO kohteet.katualue
        (nimi, alkuhetki)
        VALUES ('koekatualue', now() - INTERVAL '1 second')
        RETURNING * INTO v_katualue;

    INSERT INTO kohteet.katualueenosa
        (kuuluukatualueeseen_id, alkuhetki, geom)
        VALUES
        (
            v_katualue.id,
            now() - INTERVAL '1 second',
            'SRID=3067; MULTIPOLYGON(((100 0, 200 0, 200 100, 100 100, 100 0)))'
        )
        RETURNING * into v_katualueenosa;

    RAISE notice '%', is(
        v_katualueenosa.kuuluukatualueeseen_id,
        v_katualue.id,
        'katualueenosa.kuuluukatualueeseen_id should be the same as the katualue id'
    );


    -- TESTS FOR POINT GEOMTRY
    -- When point is inside of the area
    INSERT INTO kohteet.puu
        (alkuhetki, geom_piste)
        VALUES
        (
            now() - INTERVAL '1 second',
            'SRID=3067; POINT(50 50)'
        )
        RETURNING * INTO v_varuste;

    RAISE notice '%', ok(
        v_varuste.kuuluuviheralueenosaan IS NOT NULL,
        'varuste.kuuluuviheralueenosaan should be non-null when geom_point is inside viheralueenosa area'
    );

    RAISE notice '%', is(
        v_varuste.kuuluuviheralueenosaan,
        v_viheralueenosa.id,
        'varuste.kuuluuviheralueenosaan should be the same as the viheralueenosa id when geom_point is inside viheralueenosa area'
    );

    INSERT INTO kohteet.puu
        (alkuhetki, geom_piste)
        VALUES
        (
            now() - INTERVAL '1 second',
            'SRID=3067; POINT(150 50)'
        )
        RETURNING * INTO v_varuste;

    RAISE NOTICE '%', ok(
        v_varuste.kuuluukatualueenosaan IS NOT NULL,
        'varuste.kuuluukatualueenosaan should be non-null when geom_point is on the edge of katualueenosa area'
    );

    RAISE NOTICE '%', is(
        v_varuste.kuuluukatualueenosaan,
        v_katualueenosa.id,
        'varuste.kuuluukatualueenosaan should be the same as the katualueenosa id when geom_point is on the edge of katualueenosa area'
    );

    -- When point is on the edge of the area
    INSERT INTO kohteet.puu
        (alkuhetki, geom_piste)
        VALUES
        (
            now() - INTERVAL '1 second',
            'SRID=3067; POINT(0 0)'
        )
        RETURNING * INTO v_varuste;

    RAISE notice '%', ok(
        v_varuste.kuuluuviheralueenosaan IS NOT NULL,
        'varuste.kuuluuviheralueenosaan should be non-null when geom_point is on the edge of viheralueenosa area'
    );

    RAISE notice '%', is(
        v_varuste.kuuluuviheralueenosaan,
        v_viheralueenosa.id,
        'varuste.kuuluuviheralueenosaan should be the same as the viheralueenosa id when geom_point is on the edge of viheralueenosa area'
    );

    INSERT INTO kohteet.puu
        (alkuhetki, geom_piste)
        VALUES
        (
            now() - INTERVAL '1 second',
            'SRID=3067; POINT(100 0)'
        )
        RETURNING * INTO v_varuste;

    RAISE NOTICE '%', ok(
        v_varuste.kuuluukatualueenosaan IS NOT NULL,
        'varuste.kuuluukatualueenosaan should be non-null when geom_point is on the edge of katualueenosa area'
    );

    RAISE NOTICE '%', is(
        v_varuste.kuuluukatualueenosaan,
        v_katualueenosa.id,
        'varuste.kuuluukatualueenosaan should be the same as the katualueenosa id when geom_point is on the edge of katualueenosa area'
    );

    -- When point is outside of the area
    INSERT INTO kohteet.puu
        (alkuhetki, geom_piste)
        VALUES
        (
            now() - INTERVAL '1 second',
            'SRID=3067; POINT(-1 -1)'
        )
        RETURNING * INTO v_varuste;

    RAISE notice '%', ok(
        v_varuste.kuuluuviheralueenosaan IS NULL,
        'varuste.kuuluuviheralueenosaan should be non-null when geom_point is not inside of any viheralueenosa area'
    );

    RAISE notice '%', ok(
        v_varuste.kuuluukatualueenosaan IS NULL,
        'varuste.kuuluukatualueenosaan should be null when geom_point is not inside of any katualueenosa area'
    );


    -- TESTS FOR LINE GEOMETRY
    -- When line is inside of the area
    INSERT INTO kohteet.puu
        (alkuhetki, geom_line)
        VALUES
        (
            now() - INTERVAL '1 second',
            'SRID=3067; LINESTRING(50 50, 50 60)'
        )
        RETURNING * INTO v_varuste;

    RAISE notice '%', ok(
        v_varuste.kuuluuviheralueenosaan IS NOT NULL,
        'varuste.kuuluuviheralueenosaan should be non-null when geom_line is inside viheralueenosa area'
    );

    RAISE notice '%', is(
        v_varuste.kuuluuviheralueenosaan,
        v_viheralueenosa.id,
        'varuste.kuuluuviheralueenosaan should be the same as the viheralueenosa id when geom_line is inside viheralueenosa area'
    );

    INSERT INTO kohteet.puu
        (alkuhetki, geom_line)
        VALUES
        (
            now() - INTERVAL '1 second',
            'SRID=3067; LINESTRING(150 50, 150 60)'
        )
        RETURNING * INTO v_varuste;

    RAISE notice '%', ok(
        v_varuste.kuuluukatualueenosaan IS NOT NULL,
        'varuste.kuuluukatualueenosaan should be non-null when geom_line is inside katualueenosa area'
    );

    RAISE notice '%', is(
        v_varuste.kuuluukatualueenosaan,
        v_katualueenosa.id,
        'varuste.kuuluukatualueenosaan should be the same as the katualueenosa id when geom_line is inside katualueenosa area'
    );

    -- When line is on the edge of the area
    INSERT INTO kohteet.puu
        (alkuhetki, geom_line)
        VALUES
        (
            now() - INTERVAL '1 second',
            'SRID=3067; LINESTRING(0 0, 50 0)'
        )
        RETURNING * INTO v_varuste;

    RAISE notice '%', ok(
        v_varuste.kuuluuviheralueenosaan IS NOT NULL,
        'varuste.kuuluuviheralueenosaan should be non-null when geom_line is on the edge of viheralueenosa area'
    );

    RAISE notice '%', is(
        v_varuste.kuuluuviheralueenosaan,
        v_viheralueenosa.id,
        'varuste.kuuluuviheralueenosaan should be the same as the viheralueenosa id when geom_line is on the edge of viheralueenosa area'
    );

    INSERT INTO kohteet.puu
        (alkuhetki, geom_line)
        VALUES
        (
            now() - INTERVAL '1 second',
            'SRID=3067; LINESTRING(100 0, 150 0)'
        )
        RETURNING * INTO v_varuste;

    RAISE notice '%', ok(
        v_varuste.kuuluukatualueenosaan IS NOT NULL,
        'varuste.kuuluukatualueenosaan should be non-null when geom_line is on the edge of katualueenosa area'
    );

    RAISE notice '%', is(
        v_varuste.kuuluukatualueenosaan,
        v_katualueenosa.id,
        'varuste.kuuluukatualueenosaan should be the same as the katualueenosa id when geom_line is on the edge of katualueenosa area'
    );

    -- When line is inside and on the edge of the area
    INSERT INTO kohteet.puu
        (alkuhetki, geom_line)
        VALUES
        (
            now() - INTERVAL '1 second',
            'SRID=3067; LINESTRING(0 0, 50 0, 50 50)'
        )
        RETURNING * INTO v_varuste;

    RAISE notice '%', ok(
        v_varuste.kuuluuviheralueenosaan IS NOT NULL,
        'varuste.kuuluuviheralueenosaan should be non-null when geom_line is inside and on the edge of viheralueenosa area'
    );

    RAISE notice '%', is(
        v_varuste.kuuluuviheralueenosaan,
        v_viheralueenosa.id,
        'varuste.kuuluuviheralueenosaan should be the same as the viheralueenosa id when geom_line is inside and on the edge of viheralueenosa area'
    );

    INSERT INTO kohteet.puu
        (alkuhetki, geom_line)
        VALUES
        (
            now() - INTERVAL '1 second',
            'SRID=3067; LINESTRING(100 0, 150 0, 150 50)'
        )
        RETURNING * INTO v_varuste;

    RAISE notice '%', ok(
        v_varuste.kuuluukatualueenosaan IS NOT NULL,
        'varuste.kuuluukatualueenosaan should be non-null when geom_line is inside and on the edge of katualueenosa area'
    );

    RAISE notice '%', is(
        v_varuste.kuuluukatualueenosaan,
        v_katualueenosa.id,
        'varuste.kuuluukatualueenosaan should be the same as the katualueenosa id when geom_line is inside and on the edge of katualueenosa area'
    );

    -- When line cuts through the area
    INSERT INTO kohteet.puu
        (alkuhetki, geom_line)
        VALUES
        (
            now() - INTERVAL '1 second',
            'SRID=3067; LINESTRING(0 0, 50 50, 50 -50)'
        )
        RETURNING * INTO v_varuste;

    RAISE notice '%', ok(
        v_varuste.kuuluuviheralueenosaan IS NULL,
        'varuste.kuuluuviheralueenosaan should be null when geom_line cuts viheralueenosa area border'
    );

    INSERT INTO kohteet.puu
        (alkuhetki, geom_line)
        VALUES
        (
            now() - INTERVAL '1 second',
            'SRID=3067; LINESTRING(100 0, 150 50, 150 -50)'
        )
        RETURNING * INTO v_varuste;

    RAISE notice '%', ok(
        v_varuste.kuuluukatualueenosaan IS NULL,
        'varuste.kuuluukatualueenosaan should be null when geom_line cuts katualueenosa area border'
    );

    -- When line is outside of the area
    INSERT INTO kohteet.puu
        (alkuhetki, geom_line)
        VALUES
        (
            now() - INTERVAL '1 second',
            'SRID=3067; LINESTRING(-50 -50, -100 -100)'
        )
        RETURNING * INTO v_varuste;

    RAISE notice '%', ok(
        v_varuste.kuuluuviheralueenosaan IS NULL,
        'varuste.kuuluuviheralueenosaan should be null when geom_line is outside of viheralueenosa area'
    );

    RAISE notice '%', ok(
        v_varuste.kuuluukatualueenosaan IS NULL,
        'varuste.kuuluukatualueenosaan should be null when geom_line is outside of katualueenosa area'
    );

    -- TESTS FOR AREA GEOMETRY
    -- When area is inside the area
    INSERT INTO kohteet.puu
        (alkuhetki, geom_poly)
        VALUES
        (
            now() - INTERVAL '1 second',
            'SRID=3067; POLYGON((0 0, 50 0, 50 50, 0 50, 0 0))'
        )
        RETURNING * INTO v_varuste;

    RAISE notice '%', ok(
        v_varuste.kuuluuviheralueenosaan IS NOT NULL,
        'varuste.kuuluuviheralueenosaan should be non-null when geom_poly is inside of viheralueenosa area'
    );

    RAISE notice '%', is(
        v_varuste.kuuluuviheralueenosaan,
        v_viheralueenosa.id,
        'varuste.kuuluuviheralueenosaan should be the same as the viheralueenosa id when geom_poly is inside of viheralueenosa area'
    );

    INSERT INTO kohteet.puu
        (alkuhetki, geom_poly)
        VALUES
        (
            now() - INTERVAL '1 second',
            'SRID=3067; POLYGON((100 0, 150 0, 150 50, 100 50, 100 0))'
        )
        RETURNING * INTO v_varuste;

    RAISE notice '%', ok(
        v_varuste.kuuluukatualueenosaan IS NOT NULL,
        'varuste.kuuluukatualueenosaan should be non-null when geom_poly is inside of katualueenosa area'
    );

    RAISE notice '%', is(
        v_varuste.kuuluukatualueenosaan,
        v_katualueenosa.id,
        'varuste.kuuluukatualueenosaan should be the same as the katualueenosa id when geom_poly is inside of katualueenosa area'
    );

    -- When area overlaps the area
    INSERT INTO kohteet.puu
        (alkuhetki, geom_poly)
        VALUES
        (
            now() - INTERVAL '1 second',
            'SRID=3067; POLYGON((-50 0, 50 0, 50 50, -50 50, -50 0))'
        )
        RETURNING * INTO v_varuste;

    RAISE notice '%', ok(
        v_varuste.kuuluuviheralueenosaan IS NULL,
        'varuste.kuuluuviheralueenosaan should be null when geom_poly overlaps viheralueenosa area'
    );

    INSERT INTO kohteet.puu
        (alkuhetki, geom_poly)
        VALUES
        (
            now() - INTERVAL '1 second',
            'SRID=3067; POLYGON((50 0, 150 0, 150 50, 50 50, 50 0))'
        )
        RETURNING * INTO v_varuste;

    RAISE notice '%', ok(
        v_varuste.kuuluukatualueenosaan IS NULL,
        'varuste.kuuluukatualueenosaan should be null when geom_poly overlaps katualueenosa area'
    );

    -- When area is outside of the area
    INSERT INTO kohteet.puu
        (alkuhetki, geom_poly)
        VALUES
        (
            now() - INTERVAL '1 second',
            'SRID=3067; POLYGON((-100 0, -50 0, -50 50, -100 50, -100 0))'
        )
        RETURNING * INTO v_varuste;

    RAISE notice '%', ok(
        v_varuste.kuuluuviheralueenosaan IS NULL,
        'varuste.kuuluuviheralueenosaan should be null when geom_poly is outside of viheralueenosa area'
    );

    RAISE notice '%', ok(
        v_varuste.kuuluukatualueenosaan IS NULL,
        'varuste.kuuluukatualueenosaan should be null when geom_poly is outside of katualueenosa area'
    );



END $$ LANGUAGE plpgsql;

SELECT * FROM finish();

ROLLBACK;
