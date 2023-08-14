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
                        OR ST_Contains(alueenosa.geom, kohde.geom_line)
                        OR ST_Contains(alueenosa.geom, kohde.geom_poly)
                    )
                    AND (alueenosa.loppuhetki IS NULL OR NOW() < alueenosa.loppuhetki)
                    AND (kohde.loppuhetki IS NULL OR NOW() < kohde.loppuhetki)
            ', abstract_table_name, target_column, table_name, NEW.id);
            EXECUTE update_relation_sql;
            GET DIAGNOSTICS updated_count = ROW_COUNT;
            RAISE NOTICE 'updated % relations for % ==> % relations (triggered by %)', updated_count, abstract_table_name, table_name, table_name;

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
                            OR ST_Contains(alueenosa.geom, kohde.geom_line)
                            OR ST_Contains(alueenosa.geom, kohde.geom_poly)
                        ) AND (alueenosa.loppuhetki IS NULL OR NOW() < alueenosa.loppuhetki)
                        AND (kohde.loppuhetki       IS NULL OR NOW() < kohde.loppuhetki)
                    )
            ', abstract_table_name, target_column, table_name, NEW.id);
            EXECUTE remove_relation_sql;
            GET DIAGNOSTICS updated_count = ROW_COUNT;
            RAISE NOTICE 'removed % relations from % ==> % relations (triggered by %)', updated_count, abstract_table_name, table_name, table_name;
        END LOOP;
    END IF;

    IF table_name IN ('liikennemerkki', 'ajoratamerkinta', 'hulevesi', 'jate', 'kaluste', 'leikkivaline',
                      'liikunta', 'melu', 'muuvaruste', 'opaste', 'pysakointiruutu',
                      'rakenne', 'ymparistotaide', 'puu', 'muukasvi') THEN
        --
        -- Case 1: add/update current kuuluukatualueeseen/kuuluuviheralueeseen relations
        --
        FOR target IN
            SELECT 'katualueenosa' AS target_table, 'kuuluukatualueenosaan' AS target_column
                UNION ALL
            SELECT 'viheralueenosa' AS target_table, 'kuuluuviheralueenosaan' AS target_column
        LOOP
            update_relation_sql := format(
                'UPDATE kohteet.%I kohde SET %I = alueenosa.id
                    FROM kohteet.%I alueenosa
                    WHERE
                        kohde.id = %L
                        AND (
                            COALESCE(ST_Contains(alueenosa.geom, kohde.geom_piste), false)
                            OR COALESCE(ST_Contains(alueenosa.geom, kohde.geom_line), false)
                            OR COALESCE(ST_Contains(alueenosa.geom, kohde.geom_poly), false)
                        )
                        AND (alueenosa.loppuhetki IS NULL OR NOW() < alueenosa.loppuhetki)
                        AND (kohde.loppuhetki   IS NULL OR NOW() < kohde.loppuhetki);',
                table_name, target.target_column, target.target_table, NEW.id);
            EXECUTE update_relation_sql;
            GET DIAGNOSTICS updated_count = ROW_COUNT;
            RAISE NOTICE '%', update_relation_sql;
            RAISE NOTICE 'updated % relations for varuste ==> % relations (triggered by % id=%)', updated_count, target.target_table, table_name, NEW.id;

            --
            -- Case 2: remove expired kuuluukatualueeseen/kuuluuviheralueeseen relations
            --
            remove_relation_sql := format(
                'UPDATE kohteet.%I kohde SET %I = NULL
                 FROM kohteet.%I alueenosa
                    WHERE
                        kohde.%I = alueenosa.id
                        AND kohde.id = %L
                        AND NOT (
                            (
                                ST_Contains(alueenosa.geom, kohde.geom_piste)
                                OR ST_Contains(alueenosa.geom, kohde.geom_line)
                                OR ST_Contains(alueenosa.geom, kohde.geom_poly)
                            )
                            AND (alueenosa.loppuhetki IS NULL OR NOW() < alueenosa.loppuhetki)
                            AND (kohde.loppuhetki   IS NULL OR NOW() < kohde.loppuhetki)
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

drop trigger if exists geom_relations_for_each_row ON kohteet.puu;
create trigger geom_relations_for_each_row after
insert or update of geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.puu for each row execute function kohteet.geom_relations_for_each_row();

drop trigger if exists geom_relations_for_each_row ON kohteet.muukasvi;
create trigger geom_relations_for_each_row after
insert or update of geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.muukasvi for each row execute function kohteet.geom_relations_for_each_row();
