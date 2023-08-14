---
--- geom_relations trigger function
---

CREATE OR REPLACE FUNCTION kohteet.geom_relations()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
DECLARE
    table_name TEXT;
    updated_count int;
BEGIN
    table_name := TG_TABLE_NAME;
    IF table_name IN ('viheralueenosa', 'katualueenosa', 'ajoratamerkinta', 'hulevesi', 'jate', 'kaluste', 'leikkivaline', 'liikennemerkki', 'liikennevalo', 'liikunta', 'melu', 'muuvaruste', 'opaste', 'pysakointiruutu', 'rakenne', 'ymparistotaide') THEN

        --
        -- Case 1a: add/update current kuuluukatualueeseen relations
        --
        UPDATE abstraktit.abstractvaruste varuste SET kuuluukatualueenosaan = katualueenosa.id
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
        UPDATE abstraktit.abstractvaruste varuste SET kuuluuviheralueenosaan = viheralueenosa.id
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
        -- Case 2a: remove expired kuuluukatualueeseen relations
        --
        UPDATE abstraktit.abstractvaruste varuste SET kuuluukatualueenosaan = NULL
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
        UPDATE abstraktit.abstractvaruste varuste SET kuuluuviheralueenosaan = NULL
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
$function$;




drop trigger if exists geom_relations ON kohteet.ajoratamerkinta;
create trigger geom_relations after
insert or update of geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.ajoratamerkinta for each statement execute function kohteet.geom_relations();
drop trigger if exists geom_relations ON kohteet.hulevesi;
create trigger geom_relations after
insert or update of geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.hulevesi for each statement execute function kohteet.geom_relations();
drop trigger if exists geom_relations ON kohteet.jate;
create trigger geom_relations after
insert or update of geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.jate for each statement execute function kohteet.geom_relations();
drop trigger if exists geom_relations ON kohteet.kaluste;
create trigger geom_relations after
insert or update of geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.kaluste for each statement execute function kohteet.geom_relations();
drop trigger if exists geom_relations ON kohteet.leikkivaline;
create trigger geom_relations after
insert or update of geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.leikkivaline for each statement execute function kohteet.geom_relations();
-- drop trigger if exists geom_relations ON kohteet.liikennemerkki;
create trigger geom_relations after
insert or update of geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.liikennemerkki for each statement execute function kohteet.geom_relations();
drop trigger if exists geom_relations ON kohteet.liikennevalo;
create trigger geom_relations after
insert or update of geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.liikennevalo for each statement execute function kohteet.geom_relations();
drop trigger if exists geom_relations ON kohteet.liikunta;
create trigger geom_relations after
insert or update of geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.liikunta for each statement execute function kohteet.geom_relations();
drop trigger if exists geom_relations ON kohteet.melu;
create trigger geom_relations after
insert or update of geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.melu for each statement execute function kohteet.geom_relations();
drop trigger if exists geom_relations ON kohteet.muuvaruste;
create trigger geom_relations after
insert or update of geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.muuvaruste for each statement execute function kohteet.geom_relations();
drop trigger if exists geom_relations ON kohteet.opaste;
create trigger geom_relations after
insert or update of geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.opaste for each statement execute function kohteet.geom_relations();
drop trigger if exists geom_relations ON kohteet.pysakointiruutu;
create trigger geom_relations after
insert or update of geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.pysakointiruutu for each statement execute function kohteet.geom_relations();
drop trigger if exists geom_relations ON kohteet.rakenne;
create trigger geom_relations after
insert or update of geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.rakenne for each statement execute function kohteet.geom_relations();
drop trigger if exists geom_relations ON kohteet.ymparistotaide;
create trigger geom_relations after
insert or update of geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.ymparistotaide for each statement execute function kohteet.geom_relations();

drop trigger if exists geom_relations ON kohteet.katualueenosa ;
create trigger geom_relations after
insert
    or
update
    of geom, loppuhetki on
    kohteet.katualueenosa for each statement execute function kohteet.geom_relations();

drop trigger if exists geom_relations ON kohteet.viheralueenosa ;
create trigger geom_relations after
insert
    or
update
    of geom, loppuhetki on
    kohteet.viheralueenosa for each statement execute function kohteet.geom_relations();
