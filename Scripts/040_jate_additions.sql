-- Uusi koodisto: tarkastusväli
CREATE TABLE kohteet.koodisto_jate_tarkastusvali (
	id integer PRIMARY KEY,
	selite text
);
ALTER TABLE kohteet.koodisto_jate_tarkastusvali OWNER TO $DatabaseOwner$;

INSERT INTO kohteet.koodisto_jate_tarkastusvali (id, selite) VALUES (1, 'päivittäin');
INSERT INTO kohteet.koodisto_jate_tarkastusvali (id, selite) VALUES (2, 'kerran viikossa');
INSERT INTO kohteet.koodisto_jate_tarkastusvali (id, selite) VALUES (3, 'kahden viikon välein');
INSERT INTO kohteet.koodisto_jate_tarkastusvali (id, selite) VALUES (4, 'muu');
INSERT INTO kohteet.koodisto_jate_tarkastusvali (id, selite) VALUES (5, 'ei määritetty');

-- Uusia kenttiä jäte-taululle
ALTER TABLE kohteet.jate ADD COLUMN tyhjennysvali_viikkoina_kesa integer;
ALTER TABLE kohteet.jate ADD COLUMN tyhjennysvali_viikkoina_talvi integer;
ALTER TABLE kohteet.jate ADD COLUMN tarkastusvali_id integer
    REFERENCES kohteet.koodisto_jate_tarkastusvali (id) MATCH FULL
    ON DELETE RESTRICT ON UPDATE CASCADE;
