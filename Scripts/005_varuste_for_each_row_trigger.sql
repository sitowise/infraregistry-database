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
    table_name := TG_TABLE_NAME;
    IF table_name IN ('viheralueenosa') THEN
        --
        -- Case 1b: add/update current kuuluuviheralueeseen relations
        --
        UPDATE abstraktit.abstractvaruste varuste SET kuuluuviheralueenosaan = viheralueenosa.id
            FROM kohteet.viheralueenosa
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
        UPDATE abstraktit.abstractvaruste varuste SET kuuluuviheralueenosaan = NULL
            FROM kohteet.viheralueenosa
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
        UPDATE abstraktit.abstractvaruste varuste SET kuuluukatualueenosaan = katualueenosa.id
            FROM kohteet.katualueenosa
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
        UPDATE abstraktit.abstractvaruste varuste SET kuuluukatualueenosaan = NULL
            FROM kohteet.katualueenosa
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
                'UPDATE kohteet.%I varuste SET %I = alueenosa.id
                    FROM kohteet.%I alueenosa
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
                'UPDATE kohteet.%I varuste SET %I = NULL
                 FROM kohteet.%I alueenosa
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

drop trigger if exists geom_relations_for_each_row ON kohteet.ajoratamerkinta;
create trigger geom_relations_for_each_row after
insert or update of geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.ajoratamerkinta for each row execute function kohteet.geom_relations_for_each_row();

drop trigger if exists geom_relations_for_each_row ON kohteet.hulevesi;
create trigger geom_relations_for_each_row after
insert or update of geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.hulevesi for each row execute function kohteet.geom_relations_for_each_row();

drop trigger if exists geom_relations_for_each_row ON kohteet.jate;
create trigger geom_relations_for_each_row after
insert or update of geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.jate for each row execute function kohteet.geom_relations_for_each_row();

drop trigger if exists geom_relations_for_each_row ON kohteet.kaluste;
create trigger geom_relations_for_each_row after
insert or update of geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.kaluste for each row execute function kohteet.geom_relations_for_each_row();

drop trigger if exists geom_relations_for_each_row ON kohteet.leikkivaline;
create trigger geom_relations_for_each_row after
insert or update of geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.leikkivaline for each row execute function kohteet.geom_relations_for_each_row();

drop trigger if exists geom_relations_for_each_row ON kohteet.liikennemerkki;
create trigger geom_relations_for_each_row after
insert or update of geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.liikennemerkki for each row execute function kohteet.geom_relations_for_each_row();

drop trigger if exists geom_relations_for_each_row ON kohteet.liikennevalo;
create trigger geom_relations_for_each_row after
insert or update of geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.liikennevalo for each row execute function kohteet.geom_relations_for_each_row();

drop trigger if exists geom_relations_for_each_row ON kohteet.liikunta;
create trigger geom_relations_for_each_row after
insert or update of geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.liikunta for each row execute function kohteet.geom_relations_for_each_row();

drop trigger if exists geom_relations_for_each_row ON kohteet.melu;
create trigger geom_relations_for_each_row after
insert or update of geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.melu for each row execute function kohteet.geom_relations_for_each_row();

drop trigger if exists geom_relations_for_each_row ON kohteet.muuvaruste;
create trigger geom_relations_for_each_row after
insert or update of geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.muuvaruste for each row execute function kohteet.geom_relations_for_each_row();

drop trigger if exists geom_relations_for_each_row ON kohteet.opaste;
create trigger geom_relations_for_each_row after
insert or update of geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.opaste for each row execute function kohteet.geom_relations_for_each_row();

drop trigger if exists geom_relations_for_each_row ON kohteet.pysakointiruutu;
create trigger geom_relations_for_each_row after
insert or update of geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.pysakointiruutu for each row execute function kohteet.geom_relations_for_each_row();

drop trigger if exists geom_relations_for_each_row ON kohteet.rakenne;
create trigger geom_relations_for_each_row after
insert or update of geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.rakenne for each row execute function kohteet.geom_relations_for_each_row();

drop trigger if exists geom_relations_for_each_row ON kohteet.ymparistotaide;
create trigger geom_relations_for_each_row after
insert or update of geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.ymparistotaide for each row execute function kohteet.geom_relations_for_each_row();

drop trigger if exists geom_relations_for_each_row ON kohteet.katualueenosa ;
create trigger geom_relations_for_each_row after
insert
    or
update
    of geom, loppuhetki on
    kohteet.katualueenosa for each row execute function kohteet.geom_relations_for_each_row();

drop trigger if exists geom_relations_for_each_row ON kohteet.viheralueenosa ;
create trigger geom_relations_for_each_row after
insert
    or
update
    of geom, loppuhetki on
    kohteet.viheralueenosa for each row execute function kohteet.geom_relations_for_each_row();
