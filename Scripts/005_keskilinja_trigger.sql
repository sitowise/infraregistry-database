CREATE OR REPLACE FUNCTION kohteet.geom_relations()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
DECLARE
    table_name TEXT;
    updated_count int;
BEGIN
    RAISE NOTICE 'geom_relations for table %', TG_TABLE_NAME;
    table_name := TG_TABLE_NAME;
    IF table_name IN ('keskilinja', 'katualueenosa') THEN

        --
        -- Case 1: add/update current kuuluukatualueeseen relations
        --
        UPDATE abstraktit.keskilinja SET kuuluukatualueenosaan = katualueenosa.id
            FROM kohteet.katualueenosa
            WHERE ST_Contains(katualueenosa.geom, keskilinja.geom)
              AND (katualueenosa.loppuhetki IS NULL OR NOW() < katualueenosa.loppuhetki);
        GET DIAGNOSTICS updated_count = ROW_COUNT;

        RAISE NOTICE 'updated % keskilinja ==> katualueenosa relations', updated_count;

        --
        -- Case 2: remove expired kuuluukatualueeseen relations
        --
        UPDATE abstraktit.keskilinja SET kuuluukatualueenosaan = NULL
            FROM kohteet.katualueenosa
            WHERE
              keskilinja.kuuluukatualueenosaan = katualueenosa.id
              AND NOT (
                  ST_Contains(katualueenosa.geom, keskilinja.geom)
                      AND (katualueenosa.loppuhetki IS NULL OR NOW() < katualueenosa.loppuhetki)
              );
        GET DIAGNOSTICS updated_count = ROW_COUNT;

        RAISE NOTICE 'removed % keskilinja ==> katualueenosa relations', updated_count;

    END IF;

    RETURN NULL;
END;
$function$;

drop trigger if exists geom_relations ON abstraktit.keskilinja ;
create trigger geom_relations after
insert
    or
update
    of geom on
    abstraktit.keskilinja for each statement execute function kohteet.geom_relations();

drop trigger if exists geom_relations ON kohteet.katualueenosa ;
create trigger geom_relations after
insert
    or
update
    of geom, loppuhetki on
    kohteet.katualueenosa for each statement execute function kohteet.geom_relations();
