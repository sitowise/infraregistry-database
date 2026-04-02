-- Update function geom_relations
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
                      'valaisinkeskus', 'ymparistotaide') THEN

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
    END IF;

    RETURN NULL;
END;
$function$
;

-- Update function geom_relations_for_each_row()
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
$function$
;
