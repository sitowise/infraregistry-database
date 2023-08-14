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

DROP TRIGGER IF EXISTS geom_relations_for_each_row ON kohteet.puu;
CREATE TRIGGER geom_relations_for_each_row BEFORE
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.puu FOR EACH ROW EXECUTE FUNCTION kohteet.geom_relations_for_each_row();

DROP TRIGGER IF EXISTS geom_relations_for_each_row ON kohteet.muukasvi;
CREATE TRIGGER geom_relations_for_each_row BEFORE
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.muukasvi FOR EACH ROW EXECUTE FUNCTION kohteet.geom_relations_for_each_row();

DROP TRIGGER IF EXISTS geom_relations_for_each_row ON kohteet.ajoratamerkinta;
CREATE TRIGGER geom_relations_for_each_row BEFORE
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.ajoratamerkinta FOR EACH ROW EXECUTE FUNCTION kohteet.geom_relations_for_each_row();

DROP TRIGGER IF EXISTS geom_relations_for_each_row ON kohteet.hulevesi;
CREATE TRIGGER geom_relations_for_each_row BEFORE
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.hulevesi FOR EACH ROW EXECUTE FUNCTION kohteet.geom_relations_for_each_row();

DROP TRIGGER IF EXISTS geom_relations_for_each_row ON kohteet.jate;
CREATE TRIGGER geom_relations_for_each_row BEFORE
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.jate FOR EACH ROW EXECUTE FUNCTION kohteet.geom_relations_for_each_row();

DROP TRIGGER IF EXISTS geom_relations_for_each_row ON kohteet.kaluste;
CREATE TRIGGER geom_relations_for_each_row BEFORE
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.kaluste FOR EACH ROW EXECUTE FUNCTION kohteet.geom_relations_for_each_row();

DROP TRIGGER IF EXISTS geom_relations_for_each_row ON kohteet.leikkivaline;
CREATE TRIGGER geom_relations_for_each_row BEFORE
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.leikkivaline FOR EACH ROW EXECUTE FUNCTION kohteet.geom_relations_for_each_row();

DROP TRIGGER IF EXISTS geom_relations_for_each_row ON kohteet.liikennemerkki;
CREATE TRIGGER geom_relations_for_each_row BEFORE
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.liikennemerkki FOR EACH ROW EXECUTE FUNCTION kohteet.geom_relations_for_each_row();

DROP TRIGGER IF EXISTS geom_relations_for_each_row ON kohteet.liikunta;
CREATE TRIGGER geom_relations_for_each_row BEFORE
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.liikunta FOR EACH ROW EXECUTE FUNCTION kohteet.geom_relations_for_each_row();

DROP TRIGGER IF EXISTS geom_relations_for_each_row ON kohteet.melu;
CREATE TRIGGER geom_relations_for_each_row BEFORE
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.melu FOR EACH ROW EXECUTE FUNCTION kohteet.geom_relations_for_each_row();

DROP TRIGGER IF EXISTS geom_relations_for_each_row ON kohteet.muuvaruste;
CREATE TRIGGER geom_relations_for_each_row BEFORE
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.muuvaruste FOR EACH ROW EXECUTE FUNCTION kohteet.geom_relations_for_each_row();

DROP TRIGGER IF EXISTS geom_relations_for_each_row ON kohteet.opaste;
CREATE TRIGGER geom_relations_for_each_row BEFORE
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.opaste FOR EACH ROW EXECUTE FUNCTION kohteet.geom_relations_for_each_row();

DROP TRIGGER IF EXISTS geom_relations_for_each_row ON kohteet.pysakointiruutu;
CREATE TRIGGER geom_relations_for_each_row BEFORE
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.pysakointiruutu FOR EACH ROW EXECUTE FUNCTION kohteet.geom_relations_for_each_row();

DROP TRIGGER IF EXISTS geom_relations_for_each_row ON kohteet.rakenne;
CREATE TRIGGER geom_relations_for_each_row BEFORE
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.rakenne FOR EACH ROW EXECUTE FUNCTION kohteet.geom_relations_for_each_row();

DROP TRIGGER IF EXISTS geom_relations_for_each_row ON kohteet.ymparistotaide;
CREATE TRIGGER geom_relations_for_each_row BEFORE
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
on kohteet.ymparistotaide FOR EACH ROW EXECUTE FUNCTION kohteet.geom_relations_for_each_row();

DROP TRIGGER IF EXISTS geom_relations_for_each_row ON kohteet.katualueenosa ;
CREATE TRIGGER geom_relations_for_each_row BEFORE
INSERT OR UPDATE OF geom, loppuhetki ON
    kohteet.katualueenosa FOR EACH ROW EXECUTE FUNCTION kohteet.geom_relations_for_each_row();

DROP TRIGGER IF EXISTS geom_relations_for_each_row ON kohteet.viheralueenosa ;
CREATE TRIGGER geom_relations_for_each_row BEFORE
INSERT OR UPDATE OF geom, loppuhetki ON
    kohteet.viheralueenosa FOR EACH ROW EXECUTE FUNCTION kohteet.geom_relations_for_each_row();
