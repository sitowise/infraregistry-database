-- Move everything to kohteet schema
DO $$
DECLARE
  v_table record;
  v_start_id integer;
BEGIN
  FOR v_table IN
  SELECT table_name AS "name", table_schema AS "schema"
    FROM information_schema.tables
    WHERE table_schema IN ('abstraktit', 'koodistot', 'meta')
  LOOP
    EXECUTE format('ALTER TABLE %I.%I SET SCHEMA kohteet', v_table."schema", v_table."name");
  END LOOP;
END $$ LANGUAGE plpgsql;

-- Drop the only identity column
ALTER TABLE kohteet.katualueenosa_viheralueenlaji
  ALTER COLUMN id DROP IDENTITY;

DO $$
DECLARE
  v_table_name text;
  v_start_id integer;
  v_sequence_name text;
BEGIN
  -- DROP default values from id columns so sequences can be dropped
  FOR v_table_name IN
    SELECT table_name AS "name"
    FROM information_schema.tables
    WHERE table_schema = 'kohteet'
  LOOP
    EXECUTE format('ALTER TABLE kohteet.%I ALTER COLUMN id DROP DEFAULT', v_table_name);
  END LOOP;

  -- DROP sequences
  FOR v_sequence_name IN
      SELECT sequence_name
      FROM information_schema.sequences
      WHERE sequence_schema = 'kohteet'
  LOOP
    EXECUTE format('DROP SEQUENCE %I.%I', 'kohteet', v_sequence_name);
  END LOOP;

  -- Get max id values and set them as sequence start values for id columns
  FOR v_table_name IN
    SELECT table_name AS "name"
    FROM information_schema.tables
    WHERE table_schema = 'kohteet'
  LOOP
    EXECUTE format('SELECT MAX(id) + 1 FROM kohteet.%I', v_table_name) INTO v_start_id;
    IF v_start_id IS NULL THEN
      v_start_id := 1;
    END IF;
    EXECUTE format('ALTER TABLE kohteet.%I ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (START WITH %s)', v_table_name, v_start_id);
  END LOOP;
END $$ LANGUAGE plpgsql;

DROP SCHEMA abstraktit CASCADE;
DROP SCHEMA koodistot CASCADE;
DROP SCHEMA meta CASCADE;

CREATE OR REPLACE FUNCTION kohteet.geom_relations_for_each_row()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
DECLARE
    target record;
    table_name TEXT;
    updated_count int;
    update_relation_sql text;
    remove_relation_sql text;
BEGIN
    SET search_path TO kohteet, public;
    table_name := TG_TABLE_NAME;
    IF table_name IN ('viheralueenosa') THEN
        --
        -- Case 1b: add/update current kuuluuviheralueeseen relations
        --
        UPDATE abstractvaruste varuste SET kuuluuviheralueenosaan = viheralueenosa.id
            FROM viheralueenosa
            WHERE
                viheralueenosa.id = NEW.id
                AND (
                    ST_Contains(viheralueenosa.geom, varuste.geom_piste)
                    OR ST_Contains(viheralueenosa.geom, varuste.geom_line)
                    OR ST_Contains(viheralueenosa.geom, varuste.geom_poly)
                )
                AND (viheralueenosa.loppuhetki IS NULL OR NOW() < viheralueenosa.loppuhetki)
                AND (varuste.loppuhetki        IS NULL OR NOW() < varuste.loppuhetki);
        GET DIAGNOSTICS updated_count = ROW_COUNT;
        RAISE NOTICE 'updated % relations for varuste ==> viheralueenosa relations (triggered by %)', updated_count, table_name;

        --
        -- Case 2b: remove expired kuuluuviheralueeseen relations
        --
        UPDATE abstractvaruste varuste SET kuuluuviheralueenosaan = NULL
            FROM viheralueenosa
            WHERE
              varuste.kuuluuviheralueenosaan = viheralueenosa.id
              AND viheralueenosa.id = NEW.id
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

    IF table_name IN ('katualueenosa') THEN
        --
        -- Case 1: add/update current kuuluukatualueeseen relations
        --
        UPDATE abstractvaruste varuste SET kuuluukatualueenosaan = katualueenosa.id
            FROM katualueenosa
            WHERE
                katualueenosa.id = NEW.id
                AND (
                    ST_Contains(katualueenosa.geom, varuste.geom_piste)
                    OR ST_Contains(katualueenosa.geom, varuste.geom_line)
                    OR ST_Contains(katualueenosa.geom, varuste.geom_poly)
                )
                AND (katualueenosa.loppuhetki IS NULL OR NOW() < katualueenosa.loppuhetki)
                AND (varuste.loppuhetki       IS NULL OR NOW() < varuste.loppuhetki);
        GET DIAGNOSTICS updated_count = ROW_COUNT;
        RAISE NOTICE 'updated % relations for varuste ==> katualueenosa relations (triggered by %)', updated_count, table_name;

        --
        -- Case 2: remove expired kuuluukatualueeseen relations
        --
        UPDATE abstractvaruste varuste SET kuuluukatualueenosaan = NULL
            FROM katualueenosa
            WHERE
              varuste.kuuluukatualueenosaan = katualueenosa.id
              AND katualueenosa.id = NEW.id
              AND NOT (
                (
                    COALESCE(ST_Contains(katualueenosa.geom, varuste.geom_piste), false)
                    OR COALESCE(ST_Contains(katualueenosa.geom, varuste.geom_line), false)
                    OR COALESCE(ST_Contains(katualueenosa.geom, varuste.geom_poly), false)
                ) AND (katualueenosa.loppuhetki IS NULL OR NOW() < katualueenosa.loppuhetki)
                  AND (varuste.loppuhetki       IS NULL OR NOW() < varuste.loppuhetki)
              );
        GET DIAGNOSTICS updated_count = ROW_COUNT;
        RAISE NOTICE 'removed % relations from varuste ==> katualueenosa relations (triggered by %)', updated_count, table_name;
    END IF;

    IF table_name IN ('liikennemerkki', 'ajoratamerkinta', 'hulevesi', 'jate', 'kaluste', 'leikkivaline',
                      'liikennevalo', 'liikunta', 'melu', 'muuvaruste', 'opaste', 'pysakointiruutu',
                      'rakenne', 'ymparistotaide') THEN
        --
        -- Case 1: add/update current kuuluukatualueeseen/kuuluuviheralueeseen relations
        --
        FOR target IN
            SELECT 'katualueenosa' AS target_table, 'kuuluukatualueenosaan' AS target_column
                UNION ALL
            SELECT 'viheralueenosa' AS target_table, 'kuuluuviheralueenosaan' AS target_column
        LOOP
            update_relation_sql := format(
                'UPDATE %I varuste SET %I = alueenosa.id
                    FROM %I alueenosa
                    WHERE
                        varuste.id = %L
                        AND (
                            COALESCE(ST_Contains(alueenosa.geom, varuste.geom_piste), false)
                            OR COALESCE(ST_Contains(alueenosa.geom, varuste.geom_line), false)
                            OR COALESCE(ST_Contains(alueenosa.geom, varuste.geom_poly), false)
                        )
                        AND (alueenosa.loppuhetki IS NULL OR NOW() < alueenosa.loppuhetki)
                        AND (varuste.loppuhetki   IS NULL OR NOW() < varuste.loppuhetki);',
                table_name, target.target_column, target.target_table, NEW.id);
            EXECUTE update_relation_sql;
            GET DIAGNOSTICS updated_count = ROW_COUNT;
            RAISE NOTICE '%', update_relation_sql;
            RAISE NOTICE 'updated % relations for varuste ==> % relations (triggered by % id=%)', updated_count, target.target_table, table_name, NEW.id;

            --
            -- Case 2: remove expired kuuluukatualueeseen/kuuluuviheralueeseen relations
            --
            remove_relation_sql := format(
                'UPDATE %I varuste SET %I = NULL
                 FROM %I alueenosa
                    WHERE
                        varuste.%I = alueenosa.id
                        AND varuste.id = %L
                        AND NOT (
                            (
                                ST_Contains(alueenosa.geom, varuste.geom_piste)
                                OR ST_Contains(alueenosa.geom, varuste.geom_line)
                                OR ST_Contains(alueenosa.geom, varuste.geom_poly)
                            )
                            AND (alueenosa.loppuhetki IS NULL OR NOW() < alueenosa.loppuhetki)
                            AND (varuste.loppuhetki   IS NULL OR NOW() < varuste.loppuhetki)
                        );',
                table_name, target.target_column, target.target_table, target.target_column, NEW.id);
            EXECUTE remove_relation_sql;
            GET DIAGNOSTICS updated_count = ROW_COUNT;
            RAISE NOTICE '%', remove_relation_sql;
            RAISE NOTICE 'removed % relations from varuste ==> % relations (triggered by % id=%)', updated_count, target.target_table, table_name, NEW.id;
        END LOOP;
    END IF;

    RETURN NULL;
END;
$function$;
