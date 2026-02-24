-- VARUSTEEN ELINKAARI

-- object: kohteet.koodisto_varuste_elinkaari | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.koodisto_varuste_elinkaari CASCADE;
CREATE TABLE kohteet.koodisto_varuste_elinkaari (
	id integer PRIMARY KEY,
	selite text
);
ALTER TABLE kohteet.koodisto_varuste_elinkaari OWNER TO $DatabaseOwner$;

INSERT INTO kohteet.koodisto_varuste_elinkaari (id, selite) VALUES (1, 'suunnitteilla');
INSERT INTO kohteet.koodisto_varuste_elinkaari (id, selite) VALUES (2, 'rakenteilla');
INSERT INTO kohteet.koodisto_varuste_elinkaari (id, selite) VALUES (3, 'käytössä pysyvästi');
INSERT INTO kohteet.koodisto_varuste_elinkaari (id, selite) VALUES (4, 'käytössä tilapäisesti');
INSERT INTO kohteet.koodisto_varuste_elinkaari (id, selite) VALUES (5, 'pois käytöstä tilapäisesti');
INSERT INTO kohteet.koodisto_varuste_elinkaari (id, selite) VALUES (6, 'poistuva pysyvälaite');

ALTER TABLE kohteet.abstractvaruste ADD COLUMN elinkaari_id integer 
    REFERENCES kohteet.koodisto_varuste_elinkaari (id) MATCH FULL
    ON DELETE RESTRICT ON UPDATE CASCADE;


-- VARUSTEEN TILA

-- object: kohteet.koodisto_varuste_tila | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.koodisto_varuste_tila CASCADE;
CREATE TABLE kohteet.koodisto_varuste_tila (
	id integer PRIMARY KEY,
	selite text
);
ALTER TABLE kohteet.koodisto_varuste_tila OWNER TO $DatabaseOwner$;

INSERT INTO kohteet.koodisto_varuste_tila (id, selite) VALUES (1, 'Kunnossa');
INSERT INTO kohteet.koodisto_varuste_tila (id, selite) VALUES (2, 'Viallinen');

ALTER TABLE kohteet.abstractvaruste ADD COLUMN tila_id integer 
    REFERENCES kohteet.koodisto_varuste_tila (id) MATCH FULL
    ON DELETE RESTRICT ON UPDATE CASCADE;


-- VARUSTEEN KUNTO

-- object: kohteet.koodisto_varuste_kunto | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.koodisto_varuste_kunto CASCADE;
CREATE TABLE kohteet.koodisto_varuste_kunto (
	id integer PRIMARY KEY,
	selite text
);
ALTER TABLE kohteet.koodisto_varuste_kunto OWNER TO $DatabaseOwner$;

INSERT INTO kohteet.koodisto_varuste_kunto (id, selite) VALUES (1, 'erittäin huono');
INSERT INTO kohteet.koodisto_varuste_kunto (id, selite) VALUES (2, 'huono');
INSERT INTO kohteet.koodisto_varuste_kunto (id, selite) VALUES (3, 'tyydyttävä');
INSERT INTO kohteet.koodisto_varuste_kunto (id, selite) VALUES (4, 'hyvä');
INSERT INTO kohteet.koodisto_varuste_kunto (id, selite) VALUES (5, 'erittäin hyvä');

ALTER TABLE kohteet.abstractvaruste ADD COLUMN kunto_id integer 
    REFERENCES kohteet.koodisto_varuste_kunto (id) MATCH FULL
    ON DELETE RESTRICT ON UPDATE CASCADE;
