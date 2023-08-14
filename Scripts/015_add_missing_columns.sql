ALTER TABLE kohteet.jate
    ADD COLUMN koko TEXT,
    ADD COLUMN putkikeraysjarjestelma_kytkin BOOLEAN,
    ADD COLUMN sijainti_maan_pinnalla_kytkin BOOLEAN,
    ADD COLUMN vaarallisten_jateastia_kytkin BOOLEAN;

CREATE TABLE kohteet.katualueenosa_viheralueenlaji (
    id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    katualueenosa_id INTEGER NOT NULL REFERENCES kohteet.katualueenosa(id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    viheralueenlaji_id INTEGER NOT NULL REFERENCES koodistot.viherosanlajityyppi(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    UNIQUE (katualueenosa_id, viheralueenlaji_id)
);

INSERT INTO kohteet.katualueenosa_viheralueenlaji (katualueenosa_id, viheralueenlaji_id)
SELECT id, viherosanlajityypi_id
FROM kohteet.katualueenosa
WHERE viherosanlajityypi_id IS NOT NULL;

ALTER TABLE kohteet.katualueenosa
    DROP COLUMN viherosanlajityypi_id;

ALTER TABLE kohteet.katualueenosa
    ADD COLUMN omistaja TEXT,
    ADD COLUMN haltija TEXT,
    ADD COLUMN kunnossapitaja TEXT,
    ADD COLUMN valmistumisvuosi INTEGER,
    ADD COLUMN luontitapa_id INTEGER REFERENCES koodistot.luontitapatyyppi(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    ADD COLUMN osoite_id INTEGER REFERENCES abstraktit.osoite(id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    ADD COLUMN sijaintiepavarmuus_id INTEGER REFERENCES koodistot.sijaintiepavarmuustyyppi(id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE kohteet.keskilinja
    ADD COLUMN metatieto TEXT,
    ADD COLUMN yksilointitieto TEXT,
    ADD COLUMN alkuhetki DATE,
    ADD COLUMN loppuhetki DATE;

ALTER TABLE kohteet.keskilinja
    INHERIT abstraktit.abstractinfraomaisuuskohde;

ALTER TABLE kohteet.leikkivaline
    ADD COLUMN toiminnallinen_tarkistus_pvm DATE,
    ADD COLUMN vuositarkastus_pvm DATE;

ALTER TABLE kohteet.liikennemerkki
    ADD COLUMN teksti TEXT;

ALTER TABLE kohteet.puu
    ALTER COLUMN korkeusmitta TYPE double precision USING korkeusmitta::double precision,
    ALTER COLUMN ymparysmitta TYPE double precision USING ymparysmitta::double precision;

UPDATE koodistot.viheralueenkayttotarkoitus
	SET selite='talousmetsä'
	WHERE id=10;

-- vaihdettu roomalaisissa numeroinneissa olleet l --> I ( eli pieni L-kirjain --> iso I-kirjain).
UPDATE koodistot.hoitoluokkatyyppi
SET selite =
    CASE id
        WHEN 19 THEN 'ajoradat, luokka II'
        WHEN 20 THEN 'ajoradat, luokka III'
        WHEN 21 THEN 'kevyen liikenteen raitti, luokka I'
        WHEN 22 THEN 'kevyen liikenteen raitti, luokka II'
        WHEN 23 THEN 'kevyen liikenteen väylä, luokka I'
        WHEN 24 THEN 'kevyen liikenteen väylä, luokka II'
        WHEN 25 THEN 'jalkakäytävä, luokka I'
        WHEN 26 THEN 'jalkakäytävä, luokka II'
        WHEN 27 THEN 'torit ja aukiot, luokka I'
        WHEN 28 THEN 'torit ja aukiot, luokka II'
    END
WHERE id IN (19, 20, 21, 22, 23, 24, 25, 26, 27, 28);

ALTER TABLE kohteet.katualueenosa
    ADD COLUMN kunnossapitoluokka_id_temp INTEGER;

ALTER TABLE kohteet.katualueenosa
    ADD CONSTRAINT fk_kunnossapitoluokka_id_temp FOREIGN KEY (kunnossapitoluokka_id_temp) REFERENCES koodistot.hoitoluokkatyyppi(id) ON DELETE RESTRICT ON UPDATE CASCADE;

UPDATE kohteet.katualueenosa
    SET kunnossapitoluokka_id_temp =
        CASE kunnossapitoluokka_id
            WHEN 1 THEN 18
            WHEN 2 THEN 19
            WHEN 3 THEN 20
            WHEN 4 THEN 21
            WHEN 5 THEN 22
            WHEN 6 THEN 23
            WHEN 7 THEN 24
            WHEN 8 THEN 25
            WHEN 9 THEN 26
            WHEN 10 THEN 27
            WHEN 11 THEN 28
            WHEN 12 THEN 29
            WHEN 13 THEN 30
            WHEN 14 THEN 31
            WHEN 15 THEN 32
            WHEN 16 THEN 3
            WHEN 17 THEN 4
            WHEN 18 THEN 9
            WHEN 19 THEN 6
            WHEN 20 THEN 7
            WHEN 21 THEN 8
            WHEN 22 THEN 5
            WHEN 23 THEN 11
            WHEN 24 THEN 12
            WHEN 25 THEN 13
            WHEN 26 THEN 14
            WHEN 27 THEN 10
            WHEN 28 THEN 32
            WHEN 29 THEN 16
            WHEN 30 THEN 17
            WHEN 31 THEN 32
            WHEN 32 THEN 33
        END;

ALTER TABLE kohteet.katualueenosa
    DROP CONSTRAINT kunnossapitoluokka_id__kunnossapitoluokka_id_fk,
    DROP COLUMN kunnossapitoluokka_id;
ALTER TABLE kohteet.katualueenosa
    RENAME COLUMN kunnossapitoluokka_id_temp TO kunnossapitoluokka_id;

DROP TABLE koodistot.kunnossapitoluokka;
