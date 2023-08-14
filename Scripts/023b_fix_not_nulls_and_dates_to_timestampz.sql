ALTER TABLE kohteet.abstractpaikkatietopalvelukohde
ALTER COLUMN alkuhetki
TYPE timestamptz
USING alkuhetki::timestamptz;

ALTER TABLE kohteet.abstractpaikkatietopalvelukohde
ALTER COLUMN loppuhetki
TYPE timestamptz
USING loppuhetki::timestamptz;

ALTER TABLE kohteet.abstractpaikkatietopalvelukohde
ALTER COLUMN alkuhetki SET NOT NULL;

CREATE TRIGGER geom_relations_for_each_row AFTER
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
ON kohteet.ajoratamerkinta FOR EACH ROW EXECUTE PROCEDURE kohteet.geom_relations_for_each_row();

CREATE TRIGGER geom_relations_for_each_row AFTER
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
ON kohteet.hulevesi FOR EACH ROW EXECUTE PROCEDURE kohteet.geom_relations_for_each_row();

CREATE TRIGGER geom_relations_for_each_row AFTER
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
ON kohteet.jate FOR EACH ROW EXECUTE PROCEDURE kohteet.geom_relations_for_each_row();

CREATE TRIGGER geom_relations_for_each_row AFTER
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
ON kohteet.kaluste FOR EACH ROW EXECUTE PROCEDURE kohteet.geom_relations_for_each_row();

CREATE TRIGGER geom_relations_for_each_row AFTER
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
ON kohteet.leikkivaline FOR EACH ROW EXECUTE PROCEDURE kohteet.geom_relations_for_each_row();

CREATE TRIGGER geom_relations_for_each_row AFTER
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
ON kohteet.liikennemerkki FOR EACH ROW EXECUTE PROCEDURE kohteet.geom_relations_for_each_row();

CREATE TRIGGER geom_relations_for_each_row AFTER
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
ON kohteet.liikunta FOR EACH ROW EXECUTE PROCEDURE kohteet.geom_relations_for_each_row();

CREATE TRIGGER geom_relations_for_each_row AFTER
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
ON kohteet.melu FOR EACH ROW EXECUTE PROCEDURE kohteet.geom_relations_for_each_row();

CREATE TRIGGER geom_relations_for_each_row AFTER
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
ON kohteet.muuvaruste FOR EACH ROW EXECUTE PROCEDURE kohteet.geom_relations_for_each_row();

CREATE TRIGGER geom_relations_for_each_row AFTER
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
ON kohteet.opaste FOR EACH ROW EXECUTE PROCEDURE kohteet.geom_relations_for_each_row();

CREATE TRIGGER geom_relations_for_each_row AFTER
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
ON kohteet.pysakointiruutu FOR EACH ROW EXECUTE PROCEDURE kohteet.geom_relations_for_each_row();

CREATE TRIGGER geom_relations_for_each_row AFTER
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
ON kohteet.rakenne FOR EACH ROW EXECUTE PROCEDURE kohteet.geom_relations_for_each_row();

CREATE TRIGGER geom_relations_for_each_row AFTER
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
ON kohteet.ymparistotaide FOR EACH ROW EXECUTE PROCEDURE kohteet.geom_relations_for_each_row();


CREATE TRIGGER geom_relations_for_each_row AFTER
INSERT OR UPDATE OF geom, loppuhetki
ON kohteet.katualueenosa FOR EACH ROW EXECUTE PROCEDURE kohteet.geom_relations_for_each_row();

CREATE TRIGGER geom_relations_for_each_row AFTER
INSERT OR UPDATE OF geom, loppuhetki
ON kohteet.viheralueenosa FOR EACH ROW EXECUTE PROCEDURE kohteet.geom_relations_for_each_row();
