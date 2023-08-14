alter table abstraktit.keskilinja alter column kuuluukatualueenosaan drop not null;

-- ---
-- --- Use this to generate SQL for trigger if needed.
-- ---
-- WITH
-- tables AS (
--     SELECT * FROM (
--         VALUES (('ajoratamerkinta')), (('hulevesi')), (('jate')), (('kaluste')), (('leikkivaline')), (('liikennemerkki')), (('liikennevalo')), (('liikunta')), (('melu')), (('muuvaruste')), (('opaste')), (('pysakointiruutu')), (('rakenne')), (('ymparistotaide'))
--     ) AS tables (tablename)
-- ),
-- template AS (
--     SELECT 'ALTER TABLE kohteet.{TABLE} ADD CONSTRAINT kuuluukatualueenosaan__katualueenosa_id_fk FOREIGN KEY (kuuluukatualueenosaan)
-- REFERENCES kohteet.katualueenosa (id) MATCH FULL
-- ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

-- ALTER TABLE kohteet.{TABLE} ADD CONSTRAINT kuuluuviheralueenosaan__viheralueenosa_id_fk FOREIGN KEY (kuuluuviheralueenosaan)
-- REFERENCES kohteet.viheralueenosa (id) MATCH FULL
-- ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

-- ALTER TABLE kohteet.{TABLE} ADD CONSTRAINT materiaali_id__varustemateriaali_id_fk FOREIGN KEY (materiaali_id)
-- REFERENCES koodistot.varustemateriaali (id) MATCH FULL
-- ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

-- ALTER TABLE kohteet.{TABLE} ADD CONSTRAINT suunnitelmalinkkitieto__varustemateriaali_id_fk FOREIGN KEY (suunnitelmalinkkitieto)
-- REFERENCES abstraktit.suunnitelmalinkki (id) MATCH FULL
-- ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;' AS cmd
-- )
-- SELECT replace(template.cmd, '{TABLE}', tables.tablename) FROM tables CROSS JOIN template;

ALTER TABLE kohteet.ajoratamerkinta ADD CONSTRAINT kuuluukatualueenosaan__katualueenosa_id_fk FOREIGN KEY (kuuluukatualueenosaan)
REFERENCES kohteet.katualueenosa (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.ajoratamerkinta ADD CONSTRAINT kuuluuviheralueenosaan__viheralueenosa_id_fk FOREIGN KEY (kuuluuviheralueenosaan)
REFERENCES kohteet.viheralueenosa (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.ajoratamerkinta ADD CONSTRAINT materiaali_id__varustemateriaali_id_fk FOREIGN KEY (materiaali_id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.ajoratamerkinta ADD CONSTRAINT suunnitelmalinkkitieto__varustemateriaali_id_fk FOREIGN KEY (suunnitelmalinkkitieto)
REFERENCES abstraktit.suunnitelmalinkki (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.hulevesi ADD CONSTRAINT kuuluukatualueenosaan__katualueenosa_id_fk FOREIGN KEY (kuuluukatualueenosaan)
REFERENCES kohteet.katualueenosa (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.hulevesi ADD CONSTRAINT kuuluuviheralueenosaan__viheralueenosa_id_fk FOREIGN KEY (kuuluuviheralueenosaan)
REFERENCES kohteet.viheralueenosa (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

-- ALTER TABLE kohteet.hulevesi ADD CONSTRAINT materiaali_id__varustemateriaali_id_fk FOREIGN KEY (materiaali_id)
-- REFERENCES koodistot.varustemateriaali (id) MATCH FULL
-- ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.hulevesi ADD CONSTRAINT suunnitelmalinkkitieto__varustemateriaali_id_fk FOREIGN KEY (suunnitelmalinkkitieto)
REFERENCES abstraktit.suunnitelmalinkki (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.jate ADD CONSTRAINT kuuluukatualueenosaan__katualueenosa_id_fk FOREIGN KEY (kuuluukatualueenosaan)
REFERENCES kohteet.katualueenosa (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.jate ADD CONSTRAINT kuuluuviheralueenosaan__viheralueenosa_id_fk FOREIGN KEY (kuuluuviheralueenosaan)
REFERENCES kohteet.viheralueenosa (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.jate ADD CONSTRAINT materiaali_id__varustemateriaali_id_fk FOREIGN KEY (materiaali_id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.jate ADD CONSTRAINT suunnitelmalinkkitieto__varustemateriaali_id_fk FOREIGN KEY (suunnitelmalinkkitieto)
REFERENCES abstraktit.suunnitelmalinkki (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.kaluste ADD CONSTRAINT kuuluukatualueenosaan__katualueenosa_id_fk FOREIGN KEY (kuuluukatualueenosaan)
REFERENCES kohteet.katualueenosa (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.kaluste ADD CONSTRAINT kuuluuviheralueenosaan__viheralueenosa_id_fk FOREIGN KEY (kuuluuviheralueenosaan)
REFERENCES kohteet.viheralueenosa (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

-- ALTER TABLE kohteet.kaluste ADD CONSTRAINT materiaali_id__varustemateriaali_id_fk FOREIGN KEY (materiaali_id)
-- REFERENCES koodistot.varustemateriaali (id) MATCH FULL
-- ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.kaluste ADD CONSTRAINT suunnitelmalinkkitieto__varustemateriaali_id_fk FOREIGN KEY (suunnitelmalinkkitieto)
REFERENCES abstraktit.suunnitelmalinkki (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.leikkivaline ADD CONSTRAINT kuuluukatualueenosaan__katualueenosa_id_fk FOREIGN KEY (kuuluukatualueenosaan)
REFERENCES kohteet.katualueenosa (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.leikkivaline ADD CONSTRAINT kuuluuviheralueenosaan__viheralueenosa_id_fk FOREIGN KEY (kuuluuviheralueenosaan)
REFERENCES kohteet.viheralueenosa (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.leikkivaline ADD CONSTRAINT materiaali_id__varustemateriaali_id_fk FOREIGN KEY (materiaali_id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.leikkivaline ADD CONSTRAINT suunnitelmalinkkitieto__varustemateriaali_id_fk FOREIGN KEY (suunnitelmalinkkitieto)
REFERENCES abstraktit.suunnitelmalinkki (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.liikennemerkki ADD CONSTRAINT kuuluukatualueenosaan__katualueenosa_id_fk FOREIGN KEY (kuuluukatualueenosaan)
REFERENCES kohteet.katualueenosa (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.liikennemerkki ADD CONSTRAINT kuuluuviheralueenosaan__viheralueenosa_id_fk FOREIGN KEY (kuuluuviheralueenosaan)
REFERENCES kohteet.viheralueenosa (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

-- ALTER TABLE kohteet.liikennemerkki ADD CONSTRAINT materiaali_id__varustemateriaali_id_fk FOREIGN KEY (materiaali_id)
-- REFERENCES koodistot.varustemateriaali (id) MATCH FULL
-- ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.liikennemerkki ADD CONSTRAINT suunnitelmalinkkitieto__varustemateriaali_id_fk FOREIGN KEY (suunnitelmalinkkitieto)
REFERENCES abstraktit.suunnitelmalinkki (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.liikennevalo ADD CONSTRAINT kuuluukatualueenosaan__katualueenosa_id_fk FOREIGN KEY (kuuluukatualueenosaan)
REFERENCES kohteet.katualueenosa (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.liikennevalo ADD CONSTRAINT kuuluuviheralueenosaan__viheralueenosa_id_fk FOREIGN KEY (kuuluuviheralueenosaan)
REFERENCES kohteet.viheralueenosa (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

-- ALTER TABLE kohteet.liikennevalo ADD CONSTRAINT materiaali_id__varustemateriaali_id_fk FOREIGN KEY (materiaali_id)
-- REFERENCES koodistot.varustemateriaali (id) MATCH FULL
-- ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.liikennevalo ADD CONSTRAINT suunnitelmalinkkitieto__varustemateriaali_id_fk FOREIGN KEY (suunnitelmalinkkitieto)
REFERENCES abstraktit.suunnitelmalinkki (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.liikunta ADD CONSTRAINT kuuluukatualueenosaan__katualueenosa_id_fk FOREIGN KEY (kuuluukatualueenosaan)
REFERENCES kohteet.katualueenosa (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.liikunta ADD CONSTRAINT kuuluuviheralueenosaan__viheralueenosa_id_fk FOREIGN KEY (kuuluuviheralueenosaan)
REFERENCES kohteet.viheralueenosa (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

-- ALTER TABLE kohteet.liikunta ADD CONSTRAINT materiaali_id__varustemateriaali_id_fk FOREIGN KEY (materiaali_id)
-- REFERENCES koodistot.varustemateriaali (id) MATCH FULL
-- ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.liikunta ADD CONSTRAINT suunnitelmalinkkitieto__varustemateriaali_id_fk FOREIGN KEY (suunnitelmalinkkitieto)
REFERENCES abstraktit.suunnitelmalinkki (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.melu ADD CONSTRAINT kuuluukatualueenosaan__katualueenosa_id_fk FOREIGN KEY (kuuluukatualueenosaan)
REFERENCES kohteet.katualueenosa (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.melu ADD CONSTRAINT kuuluuviheralueenosaan__viheralueenosa_id_fk FOREIGN KEY (kuuluuviheralueenosaan)
REFERENCES kohteet.viheralueenosa (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.melu ADD CONSTRAINT materiaali_id__varustemateriaali_id_fk FOREIGN KEY (materiaali_id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.melu ADD CONSTRAINT suunnitelmalinkkitieto__varustemateriaali_id_fk FOREIGN KEY (suunnitelmalinkkitieto)
REFERENCES abstraktit.suunnitelmalinkki (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.muuvaruste ADD CONSTRAINT kuuluukatualueenosaan__katualueenosa_id_fk FOREIGN KEY (kuuluukatualueenosaan)
REFERENCES kohteet.katualueenosa (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.muuvaruste ADD CONSTRAINT kuuluuviheralueenosaan__viheralueenosa_id_fk FOREIGN KEY (kuuluuviheralueenosaan)
REFERENCES kohteet.viheralueenosa (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

-- ALTER TABLE kohteet.muuvaruste ADD CONSTRAINT materiaali_id__varustemateriaali_id_fk FOREIGN KEY (materiaali_id)
-- REFERENCES koodistot.varustemateriaali (id) MATCH FULL
-- ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.muuvaruste ADD CONSTRAINT suunnitelmalinkkitieto__varustemateriaali_id_fk FOREIGN KEY (suunnitelmalinkkitieto)
REFERENCES abstraktit.suunnitelmalinkki (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.opaste ADD CONSTRAINT kuuluukatualueenosaan__katualueenosa_id_fk FOREIGN KEY (kuuluukatualueenosaan)
REFERENCES kohteet.katualueenosa (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.opaste ADD CONSTRAINT kuuluuviheralueenosaan__viheralueenosa_id_fk FOREIGN KEY (kuuluuviheralueenosaan)
REFERENCES kohteet.viheralueenosa (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

-- ALTER TABLE kohteet.opaste ADD CONSTRAINT materiaali_id__varustemateriaali_id_fk FOREIGN KEY (materiaali_id)
-- REFERENCES koodistot.varustemateriaali (id) MATCH FULL
-- ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.opaste ADD CONSTRAINT suunnitelmalinkkitieto__varustemateriaali_id_fk FOREIGN KEY (suunnitelmalinkkitieto)
REFERENCES abstraktit.suunnitelmalinkki (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.pysakointiruutu ADD CONSTRAINT kuuluukatualueenosaan__katualueenosa_id_fk FOREIGN KEY (kuuluukatualueenosaan)
REFERENCES kohteet.katualueenosa (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.pysakointiruutu ADD CONSTRAINT kuuluuviheralueenosaan__viheralueenosa_id_fk FOREIGN KEY (kuuluuviheralueenosaan)
REFERENCES kohteet.viheralueenosa (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

-- ALTER TABLE kohteet.pysakointiruutu ADD CONSTRAINT materiaali_id__varustemateriaali_id_fk FOREIGN KEY (materiaali_id)
-- REFERENCES koodistot.varustemateriaali (id) MATCH FULL
-- ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.pysakointiruutu ADD CONSTRAINT suunnitelmalinkkitieto__varustemateriaali_id_fk FOREIGN KEY (suunnitelmalinkkitieto)
REFERENCES abstraktit.suunnitelmalinkki (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.rakenne ADD CONSTRAINT kuuluukatualueenosaan__katualueenosa_id_fk FOREIGN KEY (kuuluukatualueenosaan)
REFERENCES kohteet.katualueenosa (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.rakenne ADD CONSTRAINT kuuluuviheralueenosaan__viheralueenosa_id_fk FOREIGN KEY (kuuluuviheralueenosaan)
REFERENCES kohteet.viheralueenosa (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

-- ALTER TABLE kohteet.rakenne ADD CONSTRAINT materiaali_id__varustemateriaali_id_fk FOREIGN KEY (materiaali_id)
-- REFERENCES koodistot.varustemateriaali (id) MATCH FULL
-- ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.rakenne ADD CONSTRAINT suunnitelmalinkkitieto__varustemateriaali_id_fk FOREIGN KEY (suunnitelmalinkkitieto)
REFERENCES abstraktit.suunnitelmalinkki (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.ymparistotaide ADD CONSTRAINT kuuluukatualueenosaan__katualueenosa_id_fk FOREIGN KEY (kuuluukatualueenosaan)
REFERENCES kohteet.katualueenosa (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.ymparistotaide ADD CONSTRAINT kuuluuviheralueenosaan__viheralueenosa_id_fk FOREIGN KEY (kuuluuviheralueenosaan)
REFERENCES kohteet.viheralueenosa (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

-- ALTER TABLE kohteet.ymparistotaide ADD CONSTRAINT materiaali_id__varustemateriaali_id_fk FOREIGN KEY (materiaali_id)
-- REFERENCES koodistot.varustemateriaali (id) MATCH FULL
-- ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.ymparistotaide ADD CONSTRAINT suunnitelmalinkkitieto__varustemateriaali_id_fk FOREIGN KEY (suunnitelmalinkkitieto)
REFERENCES abstraktit.suunnitelmalinkki (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

