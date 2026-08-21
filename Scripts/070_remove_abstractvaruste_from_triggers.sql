-- ============================================================================
-- 070_remove_abstractvaruste_from_triggers.sql
-- Removes references to kohteet.abstractvaruste from geometry trigger functions.
--
-- Script 069 dropped kohteet.abstractvaruste (legacy per-type equipment tables).
-- The statement-level trigger function kohteet.geom_relations() and the
-- per-row trigger function kohteet.geom_relations_for_each_row() still
-- referenced that table, causing "relation does not exist" errors when
-- equipment geometry is inserted or updated.
--
-- Changes:
--   geom_relations():
--     - Removed Cases 1a, 1b, 2a, 2b (UPDATE kohteet.abstractvaruste ...)
--     - Preserved Cases 1a-eq, 1b-eq, 2a-eq, 2b-eq (equipment) and
--       keskilinja blocks (Cases 1, 2)
--     - Removed stale legacy per-type table names from IF table_name IN (...)
--       since those tables are dropped by script 069 — only keskilinja,
--       viheralueenosa, katualueenosa, and equipment remain
--
--   geom_relations_for_each_row():
--     - Changed ARRAY['abstractvaruste', 'abstractkasvillisuus'] to
--       ARRAY['abstractkasvillisuus'] in the viheralueenosa/katualueenosa branch
--     - Removed the equipment update/remove blocks that referenced
--       abstractvaruste via the loop
--     - Removed stale legacy per-type table names from IF table_name IN (...)
--       — only puu and muukasvi remain (kasvillisuus with per-type tables)
-- ============================================================================

CREATE OR REPLACE FUNCTION kohteet.geom_relations()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
DECLARE
    table_name TEXT;
    updated_count int;
BEGIN
    table_name := TG_TABLE_NAME;
    IF table_name IN ('keskilinja', 'viheralueenosa', 'katualueenosa',
                      'equipment') THEN

        --
        -- Case 1: add/update current kuuluukatualueeseen relations
        --
        UPDATE kohteet.keskilinja SET kuuluukatualueenosaan = katualueenosa.id
            FROM kohteet.katualueenosa
            WHERE ST_Contains(katualueenosa.geom, keskilinja.geom)
              AND (katualueenosa.loppuhetki IS NULL OR NOW() < katualueenosa.loppuhetki);
        GET DIAGNOSTICS updated_count = ROW_COUNT;

        RAISE NOTICE 'updated % keskilinja ==> katualueenosa relations', updated_count;

        --
        -- Case 1a-eq: add/update equipment ==> katualueenosa relations
        --
        UPDATE kohteet.equipment eq SET street_area_part_id = katualueenosa.id
            FROM kohteet.katualueenosa
            WHERE (
                ST_Contains(katualueenosa.geom, eq.geom_point)
                OR ST_Contains(katualueenosa.geom, eq.geom_line)
                OR ST_Contains(katualueenosa.geom, eq.geom_polygon)
            ) AND (katualueenosa.loppuhetki IS NULL OR NOW() < katualueenosa.loppuhetki)
              AND (eq.valid_to IS NULL OR NOW() < eq.valid_to);
        GET DIAGNOSTICS updated_count = ROW_COUNT;
        RAISE NOTICE 'updated % relations for equipment ==> katualueenosa relations (triggered by %)', updated_count, table_name;

        --
        -- Case 1b-eq: add/update equipment ==> viheralueenosa relations
        --
        UPDATE kohteet.equipment eq SET green_area_part_id = viheralueenosa.id
            FROM kohteet.viheralueenosa
            WHERE (
                ST_Contains(viheralueenosa.geom, eq.geom_point)
                OR ST_Contains(viheralueenosa.geom, eq.geom_line)
                OR ST_Contains(viheralueenosa.geom, eq.geom_polygon)
            ) AND (viheralueenosa.loppuhetki IS NULL OR NOW() < viheralueenosa.loppuhetki)
              AND (eq.valid_to IS NULL OR NOW() < eq.valid_to);
        GET DIAGNOSTICS updated_count = ROW_COUNT;
        RAISE NOTICE 'updated % relations for equipment ==> viheralueenosa relations (triggered by %)', updated_count, table_name;

        --
        -- Case 2: remove expired kuuluukatualueeseen relations
        --
        UPDATE kohteet.keskilinja SET kuuluukatualueenosaan = NULL
            FROM kohteet.katualueenosa
            WHERE
              keskilinja.kuuluukatualueenosaan = katualueenosa.id
              AND NOT (
                  ST_Contains(katualueenosa.geom, keskilinja.geom)
                      AND (katualueenosa.loppuhetki IS NULL OR NOW() < katualueenosa.loppuhetki)
              );
        GET DIAGNOSTICS updated_count = ROW_COUNT;

        RAISE NOTICE 'removed % keskilinja ==> katualueenosa relations', updated_count;

        --
        -- Case 2a-eq: remove expired equipment ==> katualueenosa relations
        --
        UPDATE kohteet.equipment eq SET street_area_part_id = NULL
            FROM kohteet.katualueenosa
            WHERE
              eq.street_area_part_id = katualueenosa.id
              AND NOT (
                (
                    ST_Contains(katualueenosa.geom, eq.geom_point)
                    OR ST_Contains(katualueenosa.geom, eq.geom_line)
                    OR ST_Contains(katualueenosa.geom, eq.geom_polygon)
                ) AND (katualueenosa.loppuhetki IS NULL OR NOW() < katualueenosa.loppuhetki)
                  AND (eq.valid_to IS NULL OR NOW() < eq.valid_to)
              );
        GET DIAGNOSTICS updated_count = ROW_COUNT;
        RAISE NOTICE 'removed % relations from equipment ==> katualueenosa relations (triggered by %)', updated_count, table_name;

        --
        -- Case 2b-eq: remove expired equipment ==> viheralueenosa relations
        --
        UPDATE kohteet.equipment eq SET green_area_part_id = NULL
            FROM kohteet.viheralueenosa
            WHERE
              eq.green_area_part_id = viheralueenosa.id
              AND NOT (
                (
                    ST_Contains(viheralueenosa.geom, eq.geom_point)
                    OR ST_Contains(viheralueenosa.geom, eq.geom_line)
                    OR ST_Contains(viheralueenosa.geom, eq.geom_polygon)
                ) AND (viheralueenosa.loppuhetki IS NULL OR NOW() < viheralueenosa.loppuhetki)
                  AND (eq.valid_to IS NULL OR NOW() < eq.valid_to)
              );
        GET DIAGNOSTICS updated_count = ROW_COUNT;
        RAISE NOTICE 'removed % relations from equipment ==> viheralueenosa relations (triggered by %)', updated_count, table_name;
    END IF;

    RETURN NULL;
END;
$function$;

ALTER FUNCTION kohteet.geom_relations() OWNER TO $DatabaseOwner$;

CREATE OR REPLACE FUNCTION kohteet.geom_relations_for_each_row()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
DECLARE
    target record;
    table_name TEXT;
    abstract_table_name TEXT;
    target_column TEXT;
    updated_count int;
    update_relation_sql text;
    remove_relation_sql text;
    v_belongs_to_id integer;
BEGIN
    table_name := TG_TABLE_NAME;
    IF table_name IN ('viheralueenosa', 'katualueenosa') THEN
        IF table_name = 'viheralueenosa' THEN
            target_column := 'kuuluuviheralueenosaan';
        ELSE
            target_column := 'kuuluukatualueenosaan';
        END IF;

        FOREACH abstract_table_name IN ARRAY ARRAY['abstractkasvillisuus']
        LOOP
            update_relation_sql := FORMAT('
                UPDATE kohteet.%I kohde
                SET %I = alueenosa.id
                FROM kohteet.%I alueenosa
                WHERE
                    alueenosa.id = %s
                    And (
                        ST_Contains(alueenosa.geom, kohde.geom_piste)
                        OR ST_Touches(alueenosa.geom, kohde.geom_piste)
                        OR (
                            alueenosa.geom && kohde.geom_line
                            AND ST_Relate(alueenosa.geom, kohde.geom_line, ''******FF*'')
                        )
                        OR ST_Contains(alueenosa.geom, kohde.geom_poly)
                    )
                    AND (alueenosa.loppuhetki IS NULL OR NOW() < alueenosa.loppuhetki)
                    AND (kohde.loppuhetki IS NULL OR NOW() < kohde.loppuhetki)
            ', abstract_table_name, target_column, table_name, NEW.id);
            EXECUTE update_relation_sql;

            remove_relation_sql := FORMAT('
                UPDATE kohteet.%I kohde
                SET %I = NULL
                FROM kohteet.%I alueenosa
                WHERE
                    kohde.kuuluuviheralueenosaan = alueenosa.id
                    AND alueenosa.id = %s
                    AND NOT (
                        (
                            ST_Contains(alueenosa.geom, kohde.geom_piste)
                            OR ST_Touches(alueenosa.geom, kohde.geom_piste)
                            OR (
                                alueenosa.geom && kohde.geom_line
                                AND ST_Relate(alueenosa.geom, kohde.geom_line, ''******FF*'')
                            )
                            OR ST_Contains(alueenosa.geom, kohde.geom_poly)
                        )
                        AND (alueenosa.loppuhetki IS NULL OR NOW() < alueenosa.loppuhetki)
                        AND (kohde.loppuhetki       IS NULL OR NOW() < kohde.loppuhetki)
                    )
            ', abstract_table_name, target_column, table_name, NEW.id);
            EXECUTE remove_relation_sql;
        END LOOP;

        -- Also update equipment table (uses different column names)
        IF table_name = 'katualueenosa' THEN
            EXECUTE FORMAT('
                UPDATE kohteet.equipment eq
                SET street_area_part_id = alueenosa.id
                FROM kohteet.katualueenosa alueenosa
                WHERE
                    alueenosa.id = %s
                    AND (
                        ST_Contains(alueenosa.geom, eq.geom_point)
                        OR ST_Touches(alueenosa.geom, eq.geom_point)
                        OR (
                            alueenosa.geom && eq.geom_line
                            AND ST_Relate(alueenosa.geom, eq.geom_line, ''******FF*'')
                        )
                        OR ST_Contains(alueenosa.geom, eq.geom_polygon)
                    )
                    AND (alueenosa.loppuhetki IS NULL OR NOW() < alueenosa.loppuhetki)
                    AND (eq.valid_to IS NULL OR NOW() < eq.valid_to)
            ', NEW.id);

            EXECUTE FORMAT('
                UPDATE kohteet.equipment eq
                SET street_area_part_id = NULL
                FROM kohteet.katualueenosa alueenosa
                WHERE
                    eq.street_area_part_id = alueenosa.id
                    AND alueenosa.id = %s
                    AND NOT (
                        (
                            ST_Contains(alueenosa.geom, eq.geom_point)
                            OR ST_Touches(alueenosa.geom, eq.geom_point)
                            OR (
                                alueenosa.geom && eq.geom_line
                                AND ST_Relate(alueenosa.geom, eq.geom_line, ''******FF*'')
                            )
                            OR ST_Contains(alueenosa.geom, eq.geom_polygon)
                        )
                        AND (alueenosa.loppuhetki IS NULL OR NOW() < alueenosa.loppuhetki)
                        AND (eq.valid_to IS NULL OR NOW() < eq.valid_to)
                    )
            ', NEW.id);
        ELSIF table_name = 'viheralueenosa' THEN
            EXECUTE FORMAT('
                UPDATE kohteet.equipment eq
                SET green_area_part_id = alueenosa.id
                FROM kohteet.viheralueenosa alueenosa
                WHERE
                    alueenosa.id = %s
                    AND (
                        ST_Contains(alueenosa.geom, eq.geom_point)
                        OR ST_Touches(alueenosa.geom, eq.geom_point)
                        OR (
                            alueenosa.geom && eq.geom_line
                            AND ST_Relate(alueenosa.geom, eq.geom_line, ''******FF*'')
                        )
                        OR ST_Contains(alueenosa.geom, eq.geom_polygon)
                    )
                    AND (alueenosa.loppuhetki IS NULL OR NOW() < alueenosa.loppuhetki)
                    AND (eq.valid_to IS NULL OR NOW() < eq.valid_to)
            ', NEW.id);

            EXECUTE FORMAT('
                UPDATE kohteet.equipment eq
                SET green_area_part_id = NULL
                FROM kohteet.viheralueenosa alueenosa
                WHERE
                    eq.green_area_part_id = alueenosa.id
                    AND alueenosa.id = %s
                    AND NOT (
                        (
                            ST_Contains(alueenosa.geom, eq.geom_point)
                            OR ST_Touches(alueenosa.geom, eq.geom_point)
                            OR (
                                alueenosa.geom && eq.geom_line
                                AND ST_Relate(alueenosa.geom, eq.geom_line, ''******FF*'')
                            )
                            OR ST_Contains(alueenosa.geom, eq.geom_polygon)
                        )
                        AND (alueenosa.loppuhetki IS NULL OR NOW() < alueenosa.loppuhetki)
                        AND (eq.valid_to IS NULL OR NOW() < eq.valid_to)
                    )
            ', NEW.id);
        END IF;

        RETURN NEW;
    END IF;

    IF table_name IN ('puu', 'muukasvi') THEN
        --
        -- Case 1: add/update current kuuluukatualueeseen/kuuluuviheralueeseen relations
        --
        FOR target IN
            SELECT 'katualueenosa' AS target_table, 'kuuluukatualueenosaan' AS target_column
                UNION ALL
            SELECT 'viheralueenosa' AS target_table, 'kuuluuviheralueenosaan' AS target_column
        LOOP
            EXECUTE FORMAT('
                SELECT alueenosa.id
                FROM kohteet.%I alueenosa
                WHERE
                    (
                        CASE
                            WHEN $1 IS NOT NULL THEN
                                ST_Contains(alueenosa.geom, $1)
                                OR ST_Touches(alueenosa.geom, $1)
                            WHEN $2 IS NOT NULL THEN
                                alueenosa.geom && $2
                                AND ST_Relate(alueenosa.geom, $2, ''******FF*'')
                            WHEN $3 IS NOT NULL THEN
                                ST_Contains(alueenosa.geom, $3)
                            ELSE
                                FALSE
                        END
                    )
                    AND (alueenosa.loppuhetki IS NULL OR NOW() < alueenosa.loppuhetki)
                    AND ($4 IS NULL OR NOW() < $4)
                ORDER BY alueenosa.id DESC
                LIMIT 1
            ', target.target_table)
            USING NEW.geom_piste, NEW.geom_line, NEW.geom_poly, NEW.loppuhetki
            INTO v_belongs_to_id;


            IF target.target_column = 'kuuluukatualueenosaan' THEN
                NEW.kuuluukatualueenosaan := v_belongs_to_id;
            ELSIF target.target_column = 'kuuluuviheralueenosaan' THEN
                NEW.kuuluuviheralueenosaan := v_belongs_to_id;
            END IF;

        END LOOP;
        RETURN NEW;
    END IF;

    RETURN NULL;
END;
$function$;

ALTER FUNCTION kohteet.geom_relations_for_each_row() OWNER TO $DatabaseOwner$;
