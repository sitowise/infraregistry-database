-- ============================================================================
-- 061_update_geometry_triggers_for_equipment.sql
-- Adds geometry relation triggers for the kohteet.equipment table.
-- The equipment table uses different column names than abstractvaruste:
--   geom_point (not geom_piste), geom_polygon (not geom_poly),
--   geom_line (same), valid_to (not loppuhetki),
--   street_area_part_id (not kuuluukatualueenosaan),
--   green_area_part_id (not kuuluuviheralueenosaan).
-- Therefore a dedicated trigger function is needed.
-- ============================================================================

-- Per-row trigger: assigns street_area_part_id and green_area_part_id
-- based on spatial containment, matching the pattern from
-- geom_relations_for_each_row() but using equipment column names.
CREATE OR REPLACE FUNCTION kohteet.equipment_geom_relations_for_each_row()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
DECLARE
    target record;
    v_belongs_to_id integer;
BEGIN
    FOR target IN
        SELECT 'katualueenosa' AS target_table, 'street_area_part_id' AS target_column
            UNION ALL
        SELECT 'viheralueenosa' AS target_table, 'green_area_part_id' AS target_column
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
        USING NEW.geom_point, NEW.geom_line, NEW.geom_polygon, NEW.valid_to
        INTO v_belongs_to_id;

        IF target.target_column = 'street_area_part_id' THEN
            NEW.street_area_part_id := v_belongs_to_id;
        ELSIF target.target_column = 'green_area_part_id' THEN
            NEW.green_area_part_id := v_belongs_to_id;
        END IF;

    END LOOP;
    RETURN NEW;
END;
$function$;

ALTER FUNCTION kohteet.equipment_geom_relations_for_each_row() OWNER TO $DatabaseOwner$;

-- Per-row trigger: fires before INSERT or UPDATE of geometry/validity columns
CREATE TRIGGER equipment_geom_relations_for_each_row
    BEFORE INSERT OR UPDATE OF geom_point, geom_line, geom_polygon, valid_to
    ON kohteet.equipment
    FOR EACH ROW
    EXECUTE FUNCTION kohteet.equipment_geom_relations_for_each_row();

-- Statement-level trigger: updates equipment area relations when
-- katualueenosa or viheralueenosa geometries change.
-- We also add 'equipment' to the existing geom_relations() function's
-- table name check so it processes equipment rows too.

-- Update the existing geom_relations() function to also handle equipment
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
                      'ajoratamerkinta', 'hulevesi', 'jate', 'kaapeli', 'kaluste', 'leikkivaline', 'liikennemerkki',
                      'liikunta', 'melu', 'muuvaruste', 'opaste', 'pysakointiruutu', 'rakenne', 'valaisin',
                      'valaisinkeskus', 'ymparistotaide',
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
        -- Case 1a: add/update current kuuluukatualueeseen relations
        --
        UPDATE kohteet.abstractvaruste varuste SET kuuluukatualueenosaan = katualueenosa.id
            FROM kohteet.katualueenosa
            WHERE (
                ST_Contains(katualueenosa.geom, varuste.geom_piste)
                OR ST_Contains(katualueenosa.geom, varuste.geom_line)
                OR ST_Contains(katualueenosa.geom, varuste.geom_poly)
            ) AND (katualueenosa.loppuhetki IS NULL OR NOW() < katualueenosa.loppuhetki)
              AND (varuste.loppuhetki       IS NULL OR NOW() < varuste.loppuhetki);
        GET DIAGNOSTICS updated_count = ROW_COUNT;
        RAISE NOTICE 'updated % relations for varuste ==> katualueenosa relations (triggered by %)', updated_count, table_name;

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
        -- Case 1b: add/update current kuuluuviheralueeseen relations
        --
        UPDATE kohteet.abstractvaruste varuste SET kuuluuviheralueenosaan = viheralueenosa.id
            FROM kohteet.viheralueenosa
            WHERE (
                ST_Contains(viheralueenosa.geom, varuste.geom_piste)
                OR ST_Contains(viheralueenosa.geom, varuste.geom_line)
                OR ST_Contains(viheralueenosa.geom, varuste.geom_poly)
            ) AND (viheralueenosa.loppuhetki IS NULL OR NOW() < viheralueenosa.loppuhetki)
              AND (varuste.loppuhetki       IS NULL OR NOW() < varuste.loppuhetki);
        GET DIAGNOSTICS updated_count = ROW_COUNT;
        RAISE NOTICE 'updated % relations for varuste ==> viheralueenosa relations (triggered by %)', updated_count, table_name;

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
        -- Case 2a: remove expired kuuluukatualueeseen relations
        --
        UPDATE kohteet.abstractvaruste varuste SET kuuluukatualueenosaan = NULL
            FROM kohteet.katualueenosa
            WHERE
              varuste.kuuluukatualueenosaan = katualueenosa.id
              AND NOT (
                (
                    ST_Contains(katualueenosa.geom, varuste.geom_piste)
                    OR ST_Contains(katualueenosa.geom, varuste.geom_line)
                    OR ST_Contains(katualueenosa.geom, varuste.geom_poly)
                ) AND (katualueenosa.loppuhetki IS NULL OR NOW() < katualueenosa.loppuhetki)
                  AND (varuste.loppuhetki       IS NULL OR NOW() < varuste.loppuhetki)
              );
        GET DIAGNOSTICS updated_count = ROW_COUNT;
        RAISE NOTICE 'removed % relations from varuste ==> katualueenosa relations (triggered by %)', updated_count, table_name;

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
        -- Case 2b: remove expired kuuluuviheralueeseen relations
        --
        UPDATE kohteet.abstractvaruste varuste SET kuuluuviheralueenosaan = NULL
            FROM kohteet.viheralueenosa
            WHERE
              varuste.kuuluuviheralueenosaan = viheralueenosa.id
              AND NOT (
                (
                    ST_Contains(viheralueenosa.geom, varuste.geom_piste)
                    OR ST_Contains(viheralueenosa.geom, varuste.geom_line)
                    OR ST_Contains(viheralueenosa.geom, varuste.geom_poly)
                ) AND (viheralueenosa.loppuhetki IS NULL OR NOW() < viheralueenosa.loppuhetki)
                  AND (varuste.loppuhetki       IS NULL OR NOW() < varuste.loppuhetki)
              );
        GET DIAGNOSTICS updated_count = ROW_COUNT;
        RAISE NOTICE 'removed % relations from varuste ==> viheralueenosa relations (triggered by %)', updated_count, table_name;

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

-- Statement-level trigger on equipment table
CREATE TRIGGER equipment_geom_relations
    AFTER INSERT OR UPDATE OF geom_point, geom_line, geom_polygon, valid_to
    ON kohteet.equipment
    FOR EACH STATEMENT
    EXECUTE FUNCTION kohteet.geom_relations();

-- Also update geom_relations_for_each_row() to handle equipment in the
-- viheralueenosa/katualueenosa branch (when area geometry changes,
-- update equipment rows too)
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

        FOREACH abstract_table_name IN ARRAY ARRAY['abstractvaruste', 'abstractkasvillisuus']
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

    IF table_name IN ('ajoratamerkinta', 'hulevesi', 'jate', 'kaapeli', 'kaluste', 'leikkivaline', 'liikennemerkki',
                      'liikunta', 'melu', 'muuvaruste', 'opaste', 'pysakointiruutu', 'rakenne', 'valaisin',
                      'valaisinkeskus', 'ymparistotaide',
                      'puu', 'muukasvi') THEN
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
