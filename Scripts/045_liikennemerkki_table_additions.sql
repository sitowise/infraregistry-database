-- KUNTA - lisätään päätasolle, koska tarvitaan myös käyttöoikeuksien hallintaan

ALTER TABLE kohteet.abstractpaikkatietopalvelukohde
    ADD COLUMN kunta_id integer NOT NULL DEFAULT $MunicipalityCode$;

-- ARVO

ALTER TABLE kohteet.liikennemerkki
    ADD COLUMN arvo integer;

-- RAKENNE

ALTER TABLE kohteet.liikennemerkki
    ADD COLUMN rakenne_id integer
	REFERENCES kohteet.koodisto_liikennemerkki_rakenne (id) MATCH FULL
    ON DELETE RESTRICT ON UPDATE CASCADE;

-- KOKO

ALTER TABLE kohteet.liikennemerkki
    ADD COLUMN koko_id integer
	REFERENCES kohteet.koodisto_liikennemerkki_koko (id) MATCH FULL
    ON DELETE RESTRICT ON UPDATE CASCADE;

-- KORKEUS, kilven alareunan korkeus maanpinnasta

ALTER TABLE kohteet.liikennemerkki
    ADD COLUMN korkeus integer;

-- KALVON TYYPPI

ALTER TABLE kohteet.liikennemerkki
    ADD COLUMN kalvon_tyyppi_id integer
	REFERENCES kohteet.koodisto_kalvon_tyyppi (id) MATCH FULL
    ON DELETE RESTRICT ON UPDATE CASCADE;

-- SIJAINTITARKENNE

ALTER TABLE kohteet.liikennemerkki
    ADD COLUMN sijaintitarkenne_id integer
	REFERENCES kohteet.koodisto_sijaintitarkenne (id) MATCH FULL
    ON DELETE RESTRICT ON UPDATE CASCADE;

-- KAISTAN TYYPPI

ALTER TABLE kohteet.liikennemerkki
	ADD COLUMN kaistan_tyyppi_id integer
	REFERENCES kohteet.koodisto_kaistan_tyyppi (id) MATCH FULL
	ON DELETE RESTRICT ON UPDATE CASCADE;

-- KAISTAN NUMERO

ALTER TABLE kohteet.liikennemerkki
	ADD COLUMN kaistan_numero_id integer
	REFERENCES kohteet.koodisto_kaistan_numero (id) MATCH FULL
	ON DELETE RESTRICT ON UPDATE CASCADE;

-- KAKSIPUOLEINEN

ALTER TABLE kohteet.liikennemerkki
    ADD COLUMN kaksipuoleinen_kytkin boolean NOT NULL DEFAULT false;

-- SUUNTIMA

ALTER TABLE kohteet.liikennemerkki
    ADD COLUMN suuntima integer NOT NULL DEFAULT 0
	CHECK (suuntima BETWEEN 0 AND 359);

-- LISÄKILVEN VÄRI

ALTER TABLE kohteet.liikennemerkki
	ADD COLUMN lisakilven_vari_id integer
	REFERENCES kohteet.koodisto_lisakilven_vari (id) MATCH FULL
	ON DELETE RESTRICT ON UPDATE CASCADE;
