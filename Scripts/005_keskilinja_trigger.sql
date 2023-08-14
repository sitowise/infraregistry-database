CREATE OR REPLACE FUNCTION kohteet.geom_relations()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
DECLARE
    table_name TEXT;
    updated_count int;
BEGIN
    RAISE NOTICE 'geom_relations for table %', TG_TABLE_NAME;
    -- TODO Pitääkö täällä huomioida loppuhetki? Keskilinjalla ei ole loppuhetkeä.
    --
    -- IF table_name = 'kohteet.katualueenosa' AND NEW.loppuhetki < NOW()) THEN
    --     RETURN NEW;
    -- END IF;
    table_name := TG_TABLE_NAME;
    IF table_name IN ('keskilinja', 'katualueenosa') THEN
        -- TODO
        -- * Buffer?
        -- * Jos ei käytä bufferia, pitäisi varmaan Containsin sijaan käyttää jotakin, joka sallii katualueenosan ulkorajan koskettamisen
        -- SELECT id INTO matching_katualueenosa FROM kohteet.katualueenosa WHERE (loppuhetki IS NULL OR loppuhetki < NOW()) AND ST_Contains(katualueenosa.geom, NEW.geom);
        
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
                  -- katualueenosa.loppuhetki IS NOT NULL AND NOW() >= katualueenosa.loppuhetki
                  -- OR NOT ST_Contains(katualueenosa.geom, keskilinja.geom
              );
        GET DIAGNOSTICS updated_count = ROW_COUNT;

        RAISE NOTICE 'removed % keskilinja ==> katualueenosa relations', updated_count;

        --
        -- Case 3: whatever cases 1 and 2 did not cover
        --
        -- TBD

    END IF;
    
    RETURN NULL;
END;
$function$;

-- https://stackoverflow.com/questions/32210225/postgresql-run-trigger-after-update-for-each-statement-only-if-data-changed

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

-- BEGIN; INSERT INTO "abstraktit"."keskilinja"("geom","id","digiroadid","kuuluukatualueenosaan") VALUES (st_geomfromwkb('\001\002\000\000\000\002\000\000\000\032\231\016\240\110\367\017\101\365\243\213\244\255\225\131\101\320\302\052\176\357\367\017\101\234\300\231\306\250\225\131\101'::bytea,3067),1222,NULL,917) RETURNING "id"; ROLLBACK;


-- SELECT * FROM abstraktit.keskilinja order by id desc limit 1;


-- SELECT katualueenosa.id, keskilinja.id 
--   FROM kohteet.katualueenosa JOIN abstraktit.keskilinja 
--   ON (katualueenosa.loppuhetki IS NULL OR katualueenosa.loppuhetki < NOW()) AND ST_Contains(katualueenosa.geom, keskilinja.geom);

