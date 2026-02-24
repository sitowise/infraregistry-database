CREATE TRIGGER geom_relations AFTER
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
ON kohteet.ajoratamerkinta FOR EACH STATEMENT EXECUTE FUNCTION kohteet.geom_relations();

CREATE TRIGGER geom_relations AFTER
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
ON kohteet.hulevesi FOR EACH STATEMENT EXECUTE FUNCTION kohteet.geom_relations();

CREATE TRIGGER geom_relations AFTER
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
ON kohteet.jate FOR EACH STATEMENT EXECUTE FUNCTION kohteet.geom_relations();

CREATE TRIGGER geom_relations AFTER
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
ON kohteet.kaluste FOR EACH STATEMENT EXECUTE FUNCTION kohteet.geom_relations();

CREATE TRIGGER geom_relations AFTER
INSERT OR UPDATE OF geom, loppuhetki on
    kohteet.katualueenosa FOR EACH STATEMENT EXECUTE FUNCTION kohteet.geom_relations();

CREATE TRIGGER geom_relations AFTER
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
ON kohteet.leikkivaline FOR EACH STATEMENT EXECUTE FUNCTION kohteet.geom_relations();

CREATE TRIGGER geom_relations AFTER
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
ON kohteet.liikennemerkki FOR EACH STATEMENT EXECUTE FUNCTION kohteet.geom_relations();

CREATE TRIGGER geom_relations AFTER
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
ON kohteet.liikunta FOR EACH STATEMENT EXECUTE FUNCTION kohteet.geom_relations();

CREATE TRIGGER geom_relations AFTER
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
ON kohteet.melu FOR EACH STATEMENT EXECUTE FUNCTION kohteet.geom_relations();

CREATE TRIGGER geom_relations AFTER
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
ON kohteet.muuvaruste FOR EACH STATEMENT EXECUTE FUNCTION kohteet.geom_relations();

CREATE TRIGGER geom_relations AFTER
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
ON kohteet.opaste FOR EACH STATEMENT EXECUTE FUNCTION kohteet.geom_relations();

CREATE TRIGGER geom_relations AFTER
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
ON kohteet.pysakointiruutu FOR EACH STATEMENT EXECUTE FUNCTION kohteet.geom_relations();

CREATE TRIGGER geom_relations AFTER
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
ON kohteet.rakenne FOR EACH STATEMENT EXECUTE FUNCTION kohteet.geom_relations();

CREATE TRIGGER geom_relations AFTER
INSERT OR UPDATE OF geom, loppuhetki on
    kohteet.viheralueenosa FOR EACH STATEMENT EXECUTE FUNCTION kohteet.geom_relations();

CREATE TRIGGER geom_relations AFTER
INSERT OR UPDATE OF geom_piste, geom_line, geom_poly, loppuhetki
ON kohteet.ymparistotaide FOR EACH STATEMENT EXECUTE FUNCTION kohteet.geom_relations();
