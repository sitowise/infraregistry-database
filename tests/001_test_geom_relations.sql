BEGIN;

CREATE OR REPLACE FUNCTION kohteet.test_geom_relations_puu(out status boolean, out reason text)
 RETURNS RECORD
 LANGUAGE plpgsql
AS $function$
DECLARE
    sql_clause text;
    viheralue record;
    katualue record;
    viheralueenosa record;
    katualueenosa record;

    varuste record;
BEGIN
    -- viheralue := (insert into kohteet.viheralue (nimi, alkuhetki) VALUES ('koeviheralue', now()) RETURNING *);

    insert into kohteet.viheralue (nimi, alkuhetki) VALUES ('koeviheralue', now() - INTERVAL '1 second') RETURNING * INTO viheralue;

    insert into kohteet.viheralueenosa 
        (kuuluuviheralueeseen_id, alkuhetki, luonti_pvm, muokkaus_pvm, datan_luoja, muokkaaja, geom) 
        VALUES (viheralue.id, now() - INTERVAL '1 second', NOW(), NOW(), current_user, current_user, 'SRID=3067; MULTIPOLYGON(((0 0, 100 0, 100 100, 0 100, 0 0)))')
        RETURNING * into viheralueenosa;

    insert into kohteet.puu (alkuhetki, luonti_pvm, muokkaus_pvm, datan_luoja, muokkaaja, geom_piste)
        VALUES (now() - INTERVAL '1 second', NOW(), NOW(), current_user, current_user, 'SRID=3067; POINT(0 0)')
        returning * into varuste;

    if varuste.kuuluuviheralueenosaan is null then
        status := false;
        reason = 'varuste.kuuluuviheralueenosaan should be non-null when geom_point is intersecting area border';
        return;
    end if;

    if varuste.kuuluuviheralueenosaan != viheralueenosa.id then
        status := false;
        reason = 'varuste.kuuluuviheralueenosaan should be ' || viheralueenosa.id || ', but is ' ||  varuste.kuuluuviheralueenosaan || ' instead when geom_point is intersecting area border';
        return;
    end if;

    insert into kohteet.puu (alkuhetki, luonti_pvm, muokkaus_pvm, datan_luoja, muokkaaja, geom_piste)
        VALUES (NOW(), NOW(), NOW(), current_user, current_user, 'SRID=3067; POINT(1 1)')
        returning * into varuste;

    if varuste.kuuluuviheralueenosaan is null then
        status := false;
        reason = 'varuste.kuuluuviheralueenosaan should be non-null when geom_point is inside interior area';
        return;
    end if;

    if varuste.kuuluuviheralueenosaan != viheralueenosa.id then
        status := false;
        reason = 'varuste.kuuluuviheralueenosaan should be ' || viheralueenosa.id || ', but is ' ||  varuste.kuuluuviheralueenosaan || ' instead when geom_point is inside interior area';
        return;
    end if;

    RAISE NOTICE 'viheralue %', viheralue.id;

    status := true;
    reason := 'success';
END;
$function$;

SELECT kohteet.test_geom_relations_puu();

select st_asewkt(geom_piste), * from kohteet.puu;
select st_asewkt(geom), * from kohteet.viheralueenosa where luonti_pvm = NOW();

ROLLBACK;

BEGIN;

CREATE OR REPLACE FUNCTION kohteet.test_geom_relations_liikennemerkki(out status boolean, out reason text)
 RETURNS RECORD
 LANGUAGE plpgsql
AS $function$
DECLARE
    sql_clause text;
    viheralue record;
    katualue record;
    viheralueenosa record;
    katualueenosa record;

    varuste record;
BEGIN

    insert into kohteet.viheralue (nimi, alkuhetki) VALUES ('koeviheralue', now() - INTERVAL '1 second') RETURNING * INTO viheralue;

    insert into kohteet.viheralueenosa 
        (kuuluuviheralueeseen_id, alkuhetki, luonti_pvm, muokkaus_pvm, datan_luoja, muokkaaja, geom) 
        VALUES (viheralue.id, now() - INTERVAL '1 second', NOW(), NOW(), current_user, current_user, 'SRID=3067; MULTIPOLYGON(((0 0, 100 0, 100 100, 0 100, 0 0)))')
        RETURNING * into viheralueenosa;

    -- insert into kohteet.liikennemerkki (alkuhetki, luonti_pvm, muokkaus_pvm, datan_luoja, muokkaaja, geom_piste)
    --     VALUES (NOW(), NOW(), NOW(), current_user, current_user, 'SRID=3067; POINT(0 0)')
    --     returning * into varuste;

    -- if varuste.kuuluuviheralueenosaan is null then
    --     status := false;
    --     reason = 'varuste.kuuluuviheralueenosaan should be non-null when geom_point is intersecting area border';
    --     return;
    -- end if;

    -- if varuste.kuuluuviheralueenosaan != viheralueenosa.id then
    --     status := false;
    --     reason = 'varuste.kuuluuviheralueenosaan should be ' || viheralueenosa.id || ', but is ' ||  varuste.kuuluuviheralueenosaan || ' instead when geom_point is intersecting area border';
    --     return;
    -- end if;

    insert into kohteet.liikennemerkki (alkuhetki, luonti_pvm, muokkaus_pvm, datan_luoja, muokkaaja, geom_piste)
        VALUES (now() - INTERVAL '1 second', NOW(), NOW(), current_user, current_user, 'SRID=3067; POINT(1 1)')
        returning * into varuste;

    select * from kohteet.liikennemerkki where id = varuste.id into varuste;

    if varuste.kuuluuviheralueenosaan is null then
        status := false;
        reason = 'varuste.kuuluuviheralueenosaan should be non-null when geom_point is inside interior area (' || varuste || ')' ;
        return;
    end if;

    if varuste.kuuluuviheralueenosaan != viheralueenosa.id then
        status := false;
        reason = 'varuste.kuuluuviheralueenosaan should be ' || viheralueenosa.id || ', but is ' ||  varuste.kuuluuviheralueenosaan || ' instead when geom_point is inside interior area';
        return;
    end if;

    -- RAISE NOTICE 'viheralue %', viheralue.id;

    status := true;
    reason := 'success';
END;
$function$;


SELECT kohteet.test_geom_relations_liikennemerkki();

select st_asewkt(geom_piste), * from kohteet.liikennemerkki;
select st_asewkt(geom), * from kohteet.viheralueenosa where luonti_pvm = NOW();

ROLLBACK;
