UPDATE kohteet.abstractpaikkatietopalvelukohde
SET alkuhetki = now()
WHERE alkuhetki IS NULL;

DROP TRIGGER IF EXISTS geom_relations_for_each_row ON kohteet.ajoratamerkinta;
DROP TRIGGER IF EXISTS geom_relations_for_each_row ON kohteet.hulevesi;
DROP TRIGGER IF EXISTS geom_relations_for_each_row ON kohteet.jate;
DROP TRIGGER IF EXISTS geom_relations_for_each_row ON kohteet.kaluste;
DROP TRIGGER IF EXISTS geom_relations_for_each_row ON kohteet.leikkivaline;
DROP TRIGGER IF EXISTS geom_relations_for_each_row ON kohteet.liikennemerkki;
DROP TRIGGER IF EXISTS geom_relations_for_each_row ON kohteet.liikunta;
DROP TRIGGER IF EXISTS geom_relations_for_each_row ON kohteet.melu;
DROP TRIGGER IF EXISTS geom_relations_for_each_row ON kohteet.muuvaruste;
DROP TRIGGER IF EXISTS geom_relations_for_each_row ON kohteet.opaste;
DROP TRIGGER IF EXISTS geom_relations_for_each_row ON kohteet.pysakointiruutu;
DROP TRIGGER IF EXISTS geom_relations_for_each_row ON kohteet.rakenne;
DROP TRIGGER IF EXISTS geom_relations_for_each_row ON kohteet.ymparistotaide;
DROP TRIGGER IF EXISTS geom_relations_for_each_row ON kohteet.katualueenosa;
DROP TRIGGER IF EXISTS geom_relations_for_each_row ON kohteet.viheralueenosa;
