-- new code table for kannen_tyyppi
CREATE TABLE kohteet.koodisto_hulevesi_kannen_tyyppi (
	id integer PRIMARY KEY,
	selite text
);
ALTER TABLE kohteet.koodisto_hulevesi_kannen_tyyppi OWNER TO $DatabaseOwner$;

INSERT INTO kohteet.koodisto_hulevesi_kannen_tyyppi (id, selite) VALUES (1, 'umpi');
INSERT INTO kohteet.koodisto_hulevesi_kannen_tyyppi (id, selite) VALUES (2, 'ritilä');
INSERT INTO kohteet.koodisto_hulevesi_kannen_tyyppi (id, selite) VALUES (3, 'kupu');
INSERT INTO kohteet.koodisto_hulevesi_kannen_tyyppi (id, selite) VALUES (4, 'kita');
INSERT INTO kohteet.koodisto_hulevesi_kannen_tyyppi (id, selite) VALUES (5, 'muu');

ALTER TABLE kohteet.hulevesi ADD COLUMN kannen_tyyppi_id integer 
    REFERENCES kohteet.koodisto_hulevesi_kannen_tyyppi (id) MATCH FULL
    ON DELETE RESTRICT ON UPDATE CASCADE;
