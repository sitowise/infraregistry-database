-- ADDITION TO ABSTRACTVARUSTE TABLE

ALTER TABLE kohteet.abstractvaruste
    ADD COLUMN inventoija text;


-- NEW CODE LIST TABLES - VALAISINKESKUS

CREATE TABLE kohteet.koodisto_valaisinkeskus_tyyppi (
    id integer PRIMARY KEY,
    selite text,
    jarjestys double precision NOT NULL DEFAULT 0
);
ALTER TABLE kohteet.koodisto_valaisinkeskus_tyyppi OWNER TO $DatabaseOwner$;

INSERT INTO kohteet.koodisto_valaisinkeskus_tyyppi (id, selite, jarjestys) VALUES (1, 'ei tiedossa', -1);
INSERT INTO kohteet.koodisto_valaisinkeskus_tyyppi (id, selite, jarjestys) VALUES (2, 'jakokaappikeskus', 2);
INSERT INTO kohteet.koodisto_valaisinkeskus_tyyppi (id, selite, jarjestys) VALUES (3, 'pylväskeskus', 3);
INSERT INTO kohteet.koodisto_valaisinkeskus_tyyppi (id, selite, jarjestys) VALUES (4, 'muuntamo', 4);


CREATE TABLE kohteet.koodisto_valaisinkeskus_lukitus (
    id integer PRIMARY KEY,
    selite text,
    jarjestys double precision NOT NULL DEFAULT 0
);
ALTER TABLE kohteet.koodisto_valaisinkeskus_lukitus OWNER TO $DatabaseOwner$;

INSERT INTO kohteet.koodisto_valaisinkeskus_lukitus (id, selite, jarjestys) VALUES (1, 'ei tiedossa', -1);
INSERT INTO kohteet.koodisto_valaisinkeskus_lukitus (id, selite, jarjestys) VALUES (2, 'kolmioavain', 2);
INSERT INTO kohteet.koodisto_valaisinkeskus_lukitus (id, selite, jarjestys) VALUES (3, 'avain', 3);

CREATE TABLE kohteet.koodisto_valaisinkeskus_paasulake (
    id integer PRIMARY KEY,
    selite text,
    jarjestys double precision NOT NULL DEFAULT 0
);
ALTER TABLE kohteet.koodisto_valaisinkeskus_paasulake OWNER TO $DatabaseOwner$;

INSERT INTO kohteet.koodisto_valaisinkeskus_paasulake (id, selite, jarjestys) VALUES (1, '3x25A', 1);
INSERT INTO kohteet.koodisto_valaisinkeskus_paasulake (id, selite, jarjestys) VALUES (2, '3x35A', 2);
INSERT INTO kohteet.koodisto_valaisinkeskus_paasulake (id, selite, jarjestys) VALUES (3, '3x50A', 3);
INSERT INTO kohteet.koodisto_valaisinkeskus_paasulake (id, selite, jarjestys) VALUES (4, '3x63A', 4);
INSERT INTO kohteet.koodisto_valaisinkeskus_paasulake (id, selite, jarjestys) VALUES (5, '3x80A', 5);
INSERT INTO kohteet.koodisto_valaisinkeskus_paasulake (id, selite, jarjestys) VALUES (6, '3x100A', 6);

CREATE TABLE kohteet.koodisto_valaisinkeskus_paasulake_tyyppi (
    id integer PRIMARY KEY,
    selite text,
    jarjestys double precision NOT NULL DEFAULT 0
);
ALTER TABLE kohteet.koodisto_valaisinkeskus_paasulake_tyyppi OWNER TO $DatabaseOwner$;

INSERT INTO kohteet.koodisto_valaisinkeskus_paasulake_tyyppi (id, selite, jarjestys) VALUES (1, 'ei tiedossa', -1);
INSERT INTO kohteet.koodisto_valaisinkeskus_paasulake_tyyppi (id, selite, jarjestys) VALUES (2, 'kahva 000', 2);
INSERT INTO kohteet.koodisto_valaisinkeskus_paasulake_tyyppi (id, selite, jarjestys) VALUES (3, 'kahva 00', 3);
INSERT INTO kohteet.koodisto_valaisinkeskus_paasulake_tyyppi (id, selite, jarjestys) VALUES (4, 'kahva 0', 4);
INSERT INTO kohteet.koodisto_valaisinkeskus_paasulake_tyyppi (id, selite, jarjestys) VALUES (5, 'kahva 1', 5);
INSERT INTO kohteet.koodisto_valaisinkeskus_paasulake_tyyppi (id, selite, jarjestys) VALUES (6, 'kahva 2', 6);
INSERT INTO kohteet.koodisto_valaisinkeskus_paasulake_tyyppi (id, selite, jarjestys) VALUES (7, 'tulppa', 7);

CREATE TABLE kohteet.koodisto_valaisinkeskus_mittarointi (
    id integer PRIMARY KEY,
    selite text,
    jarjestys double precision NOT NULL DEFAULT 0
);
ALTER TABLE kohteet.koodisto_valaisinkeskus_mittarointi OWNER TO $DatabaseOwner$;

INSERT INTO kohteet.koodisto_valaisinkeskus_mittarointi (id, selite, jarjestys) VALUES (1, 'mittaroitu', 1);
INSERT INTO kohteet.koodisto_valaisinkeskus_mittarointi (id, selite, jarjestys) VALUES (2, 'ei mittaroitu', 2);

CREATE TABLE kohteet.koodisto_valaisinkeskus_ohjaustapa (
    id integer PRIMARY KEY,
    selite text,
    jarjestys double precision NOT NULL DEFAULT 0
);
ALTER TABLE kohteet.koodisto_valaisinkeskus_ohjaustapa OWNER TO $DatabaseOwner$;

INSERT INTO kohteet.koodisto_valaisinkeskus_ohjaustapa (id, selite, jarjestys) VALUES (1, 'ei tiedossa', -1);
INSERT INTO kohteet.koodisto_valaisinkeskus_ohjaustapa (id, selite, jarjestys) VALUES (2, 'ohjausjärjestelmä', 2);
INSERT INTO kohteet.koodisto_valaisinkeskus_ohjaustapa (id, selite, jarjestys) VALUES (3, 'kellokytkin', 3);
INSERT INTO kohteet.koodisto_valaisinkeskus_ohjaustapa (id, selite, jarjestys) VALUES (4, 'hämäräkytkin', 4);


-- NEW ABSTRACTVARUSTE TABLE - VALAISINKESKUS

CREATE TABLE kohteet.valaisinkeskus (
    id serial NOT NULL,
    nimi text,
    kayttopaikan_numero text,
    valaisinkeskus_tyyppi_id integer REFERENCES kohteet.koodisto_valaisinkeskus_tyyppi (id) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE,
    lukitus_id integer REFERENCES kohteet.koodisto_valaisinkeskus_lukitus (id) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE,
    kilpiarvo text,
    paasulake_id integer REFERENCES kohteet.koodisto_valaisinkeskus_paasulake (id) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE,
    paasulake_tyyppi_id integer REFERENCES kohteet.koodisto_valaisinkeskus_paasulake_tyyppi (id) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE,
    mittarinumero text,
    yosammutus boolean,
    energiayhtio text,
    energiayhtion_numero text,
    mittarointi_id integer REFERENCES kohteet.koodisto_valaisinkeskus_mittarointi (id) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE,
    syottokaapelien_lkm integer,
    ohjaustapa_id integer REFERENCES kohteet.koodisto_valaisinkeskus_ohjaustapa (id) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE,
    ohjaustunnus text,
    max_lahtoja integer,
    mitattu_oikosulkuvirta integer,
    mittauspaiva timestamptz,
    CONSTRAINT valaisinkeskus_pk PRIMARY KEY (id)
)
 INHERITS(kohteet.abstractvaruste);

ALTER TABLE kohteet.valaisinkeskus OWNER TO $DatabaseOwner$;

ALTER TABLE kohteet.valaisinkeskus ADD CONSTRAINT valaisinkeskus_elinkaari_id_fkey FOREIGN KEY (elinkaari_id)
REFERENCES kohteet.koodisto_varuste_elinkaari (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE kohteet.valaisinkeskus ADD CONSTRAINT valaisinkeskus_kunto_id_fkey FOREIGN KEY (kunto_id)
REFERENCES kohteet.koodisto_varuste_kunto (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE kohteet.valaisinkeskus ADD CONSTRAINT valaisinkeskus_tila_id_fkey FOREIGN KEY (tila_id)
REFERENCES kohteet.koodisto_varuste_tila (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

CREATE INDEX valaisinkeskus_geom_line_index ON kohteet.valaisinkeskus USING gist (geom_line);
CREATE INDEX valaisinkeskus_geom_piste_index ON kohteet.valaisinkeskus USING gist (geom_piste);
CREATE INDEX valaisinkeskus_geom_poly_index ON kohteet.valaisinkeskus USING gist (geom_poly);

create trigger upsert_metadata_trg before
insert
    or
update
    on
    kohteet.valaisinkeskus for each row execute function kohteet.upsert_metadata_to_table();

create trigger geom_relations_for_each_row before
insert
    or
update
    of geom_piste,
    geom_line,
    geom_poly,
    loppuhetki on
    kohteet.valaisinkeskus for each row execute function kohteet.geom_relations_for_each_row();

create trigger geom_relations after
insert
    or
update
    of geom_piste,
    geom_line,
    geom_poly,
    loppuhetki on
    kohteet.valaisinkeskus for each statement execute function kohteet.geom_relations();


-- NEW CODE LIST TABLES - VALAISIN

CREATE TABLE kohteet.koodisto_valaisin_pylvastyyppi (
    id integer PRIMARY KEY,
    selite text,
    jarjestys double precision NOT NULL DEFAULT 0
);
ALTER TABLE kohteet.koodisto_valaisin_pylvastyyppi OWNER TO $DatabaseOwner$;

INSERT INTO kohteet.koodisto_valaisin_pylvastyyppi (id, selite, jarjestys) VALUES (1, 'ei tiedossa', -1);
INSERT INTO kohteet.koodisto_valaisin_pylvastyyppi (id, selite, jarjestys) VALUES (2, 'puupylväs', 2);
INSERT INTO kohteet.koodisto_valaisin_pylvastyyppi (id, selite, jarjestys) VALUES (3, 'kartiopylväs', 3);
INSERT INTO kohteet.koodisto_valaisin_pylvastyyppi (id, selite, jarjestys) VALUES (4, 'olakepylväs', 4);
INSERT INTO kohteet.koodisto_valaisin_pylvastyyppi (id, selite, jarjestys) VALUES (5, 'valaisinmasto', 5);
INSERT INTO kohteet.koodisto_valaisin_pylvastyyppi (id, selite, jarjestys) VALUES (6, 'turvapylväs', 6);
INSERT INTO kohteet.koodisto_valaisin_pylvastyyppi (id, selite, jarjestys) VALUES (7, 'erikoispylväs', 7);

CREATE TABLE kohteet.koodisto_valaisin_polttimotyyppi (
    id integer PRIMARY KEY,
    selite text,
    jarjestys double precision NOT NULL DEFAULT 0
);
ALTER TABLE kohteet.koodisto_valaisin_polttimotyyppi OWNER TO $DatabaseOwner$;

INSERT INTO kohteet.koodisto_valaisin_polttimotyyppi (id, selite, jarjestys) VALUES (1, 'elohopea', 1);
INSERT INTO kohteet.koodisto_valaisin_polttimotyyppi (id, selite, jarjestys) VALUES (2, 'LED', 2);
INSERT INTO kohteet.koodisto_valaisin_polttimotyyppi (id, selite, jarjestys) VALUES (3, 'suurpainenatrium', 3);
INSERT INTO kohteet.koodisto_valaisin_polttimotyyppi (id, selite, jarjestys) VALUES (4, 'monimetalli', 4);
INSERT INTO kohteet.koodisto_valaisin_polttimotyyppi (id, selite, jarjestys) VALUES (5, 'muu', 999);

CREATE TABLE kohteet.koodisto_valaisin_kaapelityyppi (
    id integer PRIMARY KEY,
    selite text,
    jarjestys double precision NOT NULL DEFAULT 0
);
ALTER TABLE kohteet.koodisto_valaisin_kaapelityyppi OWNER TO $DatabaseOwner$;

INSERT INTO kohteet.koodisto_valaisin_kaapelityyppi (id, selite, jarjestys) VALUES (1, 'maakaapeli', 1);
INSERT INTO kohteet.koodisto_valaisin_kaapelityyppi (id, selite, jarjestys) VALUES (2, 'ilmakaapeli', 2);
INSERT INTO kohteet.koodisto_valaisin_kaapelityyppi (id, selite, jarjestys) VALUES (3, 'yhteiskäyttökaapeli', 3);

CREATE TABLE kohteet.koodisto_valaisin_valaistusluokka (
    id integer PRIMARY KEY,
    selite text,
    jarjestys double precision NOT NULL DEFAULT 0
);
ALTER TABLE kohteet.koodisto_valaisin_valaistusluokka OWNER TO $DatabaseOwner$;

INSERT INTO kohteet.koodisto_valaisin_valaistusluokka (id, selite, jarjestys) VALUES (1, 'M1', 1);
INSERT INTO kohteet.koodisto_valaisin_valaistusluokka (id, selite, jarjestys) VALUES (2, 'M2', 2);
INSERT INTO kohteet.koodisto_valaisin_valaistusluokka (id, selite, jarjestys) VALUES (3, 'M3a', 3);
INSERT INTO kohteet.koodisto_valaisin_valaistusluokka (id, selite, jarjestys) VALUES (4, 'M3b', 4);
INSERT INTO kohteet.koodisto_valaisin_valaistusluokka (id, selite, jarjestys) VALUES (5, 'M4', 5);
INSERT INTO kohteet.koodisto_valaisin_valaistusluokka (id, selite, jarjestys) VALUES (6, 'M5', 6);
INSERT INTO kohteet.koodisto_valaisin_valaistusluokka (id, selite, jarjestys) VALUES (7, 'M6', 7);
INSERT INTO kohteet.koodisto_valaisin_valaistusluokka (id, selite, jarjestys) VALUES (8, 'P1', 8);
INSERT INTO kohteet.koodisto_valaisin_valaistusluokka (id, selite, jarjestys) VALUES (9, 'P2', 9);
INSERT INTO kohteet.koodisto_valaisin_valaistusluokka (id, selite, jarjestys) VALUES (10, 'P3', 10);
INSERT INTO kohteet.koodisto_valaisin_valaistusluokka (id, selite, jarjestys) VALUES (11, 'P4', 11);
INSERT INTO kohteet.koodisto_valaisin_valaistusluokka (id, selite, jarjestys) VALUES (12, 'P5', 12);
INSERT INTO kohteet.koodisto_valaisin_valaistusluokka (id, selite, jarjestys) VALUES (13, 'P6', 13);

CREATE TABLE kohteet.koodisto_valaisintyyppi (
    id integer PRIMARY KEY,
    selite text,
    jarjestys double precision NOT NULL DEFAULT 0
);
ALTER TABLE kohteet.koodisto_valaisintyyppi OWNER TO $DatabaseOwner$;

INSERT INTO kohteet.koodisto_valaisintyyppi (id, selite, jarjestys) VALUES (1, 'katuvalaisin', 1);
INSERT INTO kohteet.koodisto_valaisintyyppi (id, selite, jarjestys) VALUES (2, 'puistovalaisin', 2);
INSERT INTO kohteet.koodisto_valaisintyyppi (id, selite, jarjestys) VALUES (3, 'valonheitin', 3);
INSERT INTO kohteet.koodisto_valaisintyyppi (id, selite, jarjestys) VALUES (4, 'kiskovalaisin', 4);
INSERT INTO kohteet.koodisto_valaisintyyppi (id, selite, jarjestys) VALUES (5, 'muu', 999);

CREATE TABLE kohteet.koodisto_valaisin_asennustapa (
    id integer PRIMARY KEY,
    selite text,
    jarjestys double precision NOT NULL DEFAULT 0
);
ALTER TABLE kohteet.koodisto_valaisin_asennustapa OWNER TO $DatabaseOwner$;

INSERT INTO kohteet.koodisto_valaisin_asennustapa (id, selite, jarjestys) VALUES (1, 'ei tiedossa', -1);
INSERT INTO kohteet.koodisto_valaisin_asennustapa (id, selite, jarjestys) VALUES (2, 'vaakaorsi', 2);
INSERT INTO kohteet.koodisto_valaisin_asennustapa (id, selite, jarjestys) VALUES (3, 'pystyorsi', 3);
INSERT INTO kohteet.koodisto_valaisin_asennustapa (id, selite, jarjestys) VALUES (4, 'ripustettava', 4);
INSERT INTO kohteet.koodisto_valaisin_asennustapa (id, selite, jarjestys) VALUES (5, 'muu', 999);

CREATE TABLE kohteet.koodisto_valaisin_pylvaan_tuenta (
    id integer PRIMARY KEY,
    selite text,
    jarjestys double precision NOT NULL DEFAULT 0
);
ALTER TABLE kohteet.koodisto_valaisin_pylvaan_tuenta OWNER TO $DatabaseOwner$;

INSERT INTO kohteet.koodisto_valaisin_pylvaan_tuenta (id, selite, jarjestys) VALUES (1, 'ei tiedossa', -1);
INSERT INTO kohteet.koodisto_valaisin_pylvaan_tuenta (id, selite, jarjestys) VALUES (2, 'harus', 2);
INSERT INTO kohteet.koodisto_valaisin_pylvaan_tuenta (id, selite, jarjestys) VALUES (3, 'tukipylväs', 3);
INSERT INTO kohteet.koodisto_valaisin_pylvaan_tuenta (id, selite, jarjestys) VALUES (4, 'ei tuentaa', 4);

CREATE TABLE kohteet.koodisto_valaisin_varsityyppi (
    id integer PRIMARY KEY,
    selite text,
    jarjestys double precision NOT NULL DEFAULT 0
);
ALTER TABLE kohteet.koodisto_valaisin_varsityyppi OWNER TO $DatabaseOwner$;

INSERT INTO kohteet.koodisto_valaisin_varsityyppi (id, selite, jarjestys) VALUES (1, 'pystyvarsi', 1);
INSERT INTO kohteet.koodisto_valaisin_varsityyppi (id, selite, jarjestys) VALUES (2, 'yksipuolinen', 2);
INSERT INTO kohteet.koodisto_valaisin_varsityyppi (id, selite, jarjestys) VALUES (3, 'kaksipuolinen', 3);
INSERT INTO kohteet.koodisto_valaisin_varsityyppi (id, selite, jarjestys) VALUES (4, 'orsi', 4);
INSERT INTO kohteet.koodisto_valaisin_varsityyppi (id, selite, jarjestys) VALUES (5, 'varreton', 5);

CREATE TABLE kohteet.koodisto_valaisin_takuuperusteet (
    id integer PRIMARY KEY,
    selite text,
    jarjestys double precision NOT NULL DEFAULT 0
);
ALTER TABLE kohteet.koodisto_valaisin_takuuperusteet OWNER TO $DatabaseOwner$;

INSERT INTO kohteet.koodisto_valaisin_takuuperusteet (id, selite, jarjestys) VALUES (1, 'ei tiedossa', -1);
INSERT INTO kohteet.koodisto_valaisin_takuuperusteet (id, selite, jarjestys) VALUES (2, '1', 2);
INSERT INTO kohteet.koodisto_valaisin_takuuperusteet (id, selite, jarjestys) VALUES (3, '2', 3);
INSERT INTO kohteet.koodisto_valaisin_takuuperusteet (id, selite, jarjestys) VALUES (4, '3', 4);
INSERT INTO kohteet.koodisto_valaisin_takuuperusteet (id, selite, jarjestys) VALUES (5, '4', 5);
INSERT INTO kohteet.koodisto_valaisin_takuuperusteet (id, selite, jarjestys) VALUES (6, '5', 6);
INSERT INTO kohteet.koodisto_valaisin_takuuperusteet (id, selite, jarjestys) VALUES (7, '6', 7);
INSERT INTO kohteet.koodisto_valaisin_takuuperusteet (id, selite, jarjestys) VALUES (8, '7', 8);
INSERT INTO kohteet.koodisto_valaisin_takuuperusteet (id, selite, jarjestys) VALUES (9, '8', 9);
INSERT INTO kohteet.koodisto_valaisin_takuuperusteet (id, selite, jarjestys) VALUES (10, '9', 10);
INSERT INTO kohteet.koodisto_valaisin_takuuperusteet (id, selite, jarjestys) VALUES (11, '10', 11);


-- NEW ABSTRACTVARUSTE TABLE - VALAISIN

CREATE TABLE kohteet.valaisin (
    id serial NOT NULL,
    valaisinkeskus_id integer REFERENCES kohteet.valaisinkeskus (id) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    valaisintyyppi_id integer REFERENCES kohteet.koodisto_valaisintyyppi (id) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE,
    pylvastyyppi_id integer REFERENCES kohteet.koodisto_valaisin_pylvastyyppi (id) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE,
    polttimotyyppi_id integer REFERENCES kohteet.koodisto_valaisin_polttimotyyppi (id) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE,
    kaapelityyppi_id integer REFERENCES kohteet.koodisto_valaisin_kaapelityyppi (id) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE,
    pylvaskorkeus double precision,
    asennuskorkeus double precision,
    valaisinvarren_pituus double precision,
    pylvaan_tuenta_id integer REFERENCES kohteet.koodisto_valaisin_pylvaan_tuenta (id) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE,
    varsityyppi_id integer REFERENCES kohteet.koodisto_valaisin_varsityyppi (id) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE,
    yhteiskayttopylvas boolean,
    valaisinmaara integer,
    lamppujen_maara integer,
    valaistusluokka_id integer REFERENCES kohteet.koodisto_valaisin_valaistusluokka (id) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE,
    valaisin_asennustapa_id integer REFERENCES kohteet.koodisto_valaisin_asennustapa (id) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE,
    valaisin_takuuperusteet_id integer REFERENCES kohteet.koodisto_valaisin_takuuperusteet (id) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE,
    valaisin_takuun_paattymispvm timestamptz,
    valaisin_takuun_vastaaja text,
    pylvaan_maadoitus boolean,
    maadoitusarvo integer,
    pylvas_valmistaja text,
    jalusta text,
    valaisin_valmistaja text,
    valaisin_malli text,
    valaisin_teho integer,
    valaisin_optiikka text,
    himmennysprofiili boolean,
    lampun_valmistaja text,
    tarkenne text,
    CONSTRAINT valaisin_pk PRIMARY KEY (id)
)
 INHERITS(kohteet.abstractvaruste);

ALTER TABLE kohteet.valaisin OWNER TO $DatabaseOwner$;

ALTER TABLE kohteet.valaisin ADD CONSTRAINT valaisin_elinkaari_id_fkey FOREIGN KEY (elinkaari_id)
REFERENCES kohteet.koodisto_varuste_elinkaari (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE kohteet.valaisin ADD CONSTRAINT valaisin_kunto_id_fkey FOREIGN KEY (kunto_id)
REFERENCES kohteet.koodisto_varuste_kunto (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE kohteet.valaisin ADD CONSTRAINT valaisin_tila_id_fkey FOREIGN KEY (tila_id)
REFERENCES kohteet.koodisto_varuste_tila (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

CREATE INDEX valaisin_geom_line_index ON kohteet.valaisin USING gist (geom_line);
CREATE INDEX valaisin_geom_piste_index ON kohteet.valaisin USING gist (geom_piste);
CREATE INDEX valaisin_geom_poly_index ON kohteet.valaisin USING gist (geom_poly);

create trigger upsert_metadata_trg before
insert
    or
update
    on
    kohteet.valaisin for each row execute function kohteet.upsert_metadata_to_table();

create trigger geom_relations_for_each_row before
insert
    or
update
    of geom_piste,
    geom_line,
    geom_poly,
    loppuhetki on
    kohteet.valaisin for each row execute function kohteet.geom_relations_for_each_row();

create trigger geom_relations after
insert
    or
update
    of geom_piste,
    geom_line,
    geom_poly,
    loppuhetki on
    kohteet.valaisin for each statement execute function kohteet.geom_relations();

-- TODO: valaisinkeskus ja kaapeli periytytetään abstractvarusteesta samalla tavalla kuin valaisin
-- TODO: ryhmasulake periytyteään abstractinfraomaisuuskohteesta


-- NEW CODE LIST TABLES - RYHMASULAKE

CREATE TABLE kohteet.koodisto_ryhmasulake_tyyppi (
    id integer PRIMARY KEY,
    selite text,
    jarjestys double precision NOT NULL DEFAULT 0
);
ALTER TABLE kohteet.koodisto_ryhmasulake_tyyppi OWNER TO $DatabaseOwner$;

INSERT INTO kohteet.koodisto_ryhmasulake_tyyppi (id, selite, jarjestys) VALUES (1, '3x20A', 1);
INSERT INTO kohteet.koodisto_ryhmasulake_tyyppi (id, selite, jarjestys) VALUES (2, '3x20A', 1);
INSERT INTO kohteet.koodisto_ryhmasulake_tyyppi (id, selite, jarjestys) VALUES (3, '3x20A', 1);
INSERT INTO kohteet.koodisto_ryhmasulake_tyyppi (id, selite, jarjestys) VALUES (4, '3x20A', 1);

CREATE TABLE kohteet.koodisto_ryhmasulake_laukaisukayra (
    id integer PRIMARY KEY,
    selite text,
    jarjestys double precision NOT NULL DEFAULT 0
);
ALTER TABLE kohteet.koodisto_ryhmasulake_laukaisukayra OWNER TO $DatabaseOwner$;

INSERT INTO kohteet.koodisto_ryhmasulake_laukaisukayra (id, selite, jarjestys) VALUES (1, 'ei tiedossa', -1);
INSERT INTO kohteet.koodisto_ryhmasulake_laukaisukayra (id, selite, jarjestys) VALUES (2, 'B', 2);
INSERT INTO kohteet.koodisto_ryhmasulake_laukaisukayra (id, selite, jarjestys) VALUES (3, 'C', 3);
INSERT INTO kohteet.koodisto_ryhmasulake_laukaisukayra (id, selite, jarjestys) VALUES (4, 'D', 4);

CREATE TABLE kohteet.koodisto_ryhmasulake_virta_arvo (
    id integer PRIMARY KEY,
    selite text,
    jarjestys double precision NOT NULL DEFAULT 0
);
ALTER TABLE kohteet.koodisto_ryhmasulake_virta_arvo OWNER TO $DatabaseOwner$;

INSERT INTO kohteet.koodisto_ryhmasulake_virta_arvo (id, selite, jarjestys) VALUES (1, '6A', 1);
INSERT INTO kohteet.koodisto_ryhmasulake_virta_arvo (id, selite, jarjestys) VALUES (2, '10A', 2);
INSERT INTO kohteet.koodisto_ryhmasulake_virta_arvo (id, selite, jarjestys) VALUES (3, '16A', 3);
INSERT INTO kohteet.koodisto_ryhmasulake_virta_arvo (id, selite, jarjestys) VALUES (4, '20A', 4);
INSERT INTO kohteet.koodisto_ryhmasulake_virta_arvo (id, selite, jarjestys) VALUES (5, '25A', 5);
INSERT INTO kohteet.koodisto_ryhmasulake_virta_arvo (id, selite, jarjestys) VALUES (6, '32A', 6);


-- NEW ABSTRACTINFRAOMAISUUSKOHDE TABLE - RYHMASULAKE

CREATE TABLE kohteet.ryhmasulake (
    id serial NOT NULL,
    valaisinkeskus_id integer REFERENCES kohteet.valaisinkeskus (id) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    tyyppi_id integer REFERENCES kohteet.koodisto_ryhmasulake_tyyppi (id) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE,
    laukaisukayra_id integer REFERENCES kohteet.koodisto_ryhmasulake_laukaisukayra (id) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE,
    virta_arvo_id integer REFERENCES kohteet.koodisto_ryhmasulake_virta_arvo (id) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE,
    johdonsuoja_automaatti boolean,
    ryhmakaapelityyppi text,
    CONSTRAINT ryhmasulake_pk PRIMARY KEY (id)
)
 INHERITS(kohteet.abstractinfraomaisuuskohde);

ALTER TABLE kohteet.ryhmasulake OWNER TO $DatabaseOwner$;

create trigger upsert_metadata_trg before
insert
    or
update
    on
    kohteet.ryhmasulake for each row execute function kohteet.upsert_metadata_to_table();


-- NEW CODE LIST TABLES - KAAPELI

CREATE TABLE kohteet.koodisto_kaapeli_tarkoitus (
    id integer PRIMARY KEY,
    selite text,
    jarjestys double precision NOT NULL DEFAULT 0
);
ALTER TABLE kohteet.koodisto_kaapeli_tarkoitus OWNER TO $DatabaseOwner$;

INSERT INTO kohteet.koodisto_kaapeli_tarkoitus (id, selite, jarjestys) VALUES (1, 'valaistus', 1);
INSERT INTO kohteet.koodisto_kaapeli_tarkoitus (id, selite, jarjestys) VALUES (2, 'muu', 999);

CREATE TABLE kohteet.koodisto_kaapelityyppi (
    id integer PRIMARY KEY,
    selite text,
    jarjestys double precision NOT NULL DEFAULT 0
);
ALTER TABLE kohteet.koodisto_kaapelityyppi OWNER TO $DatabaseOwner$;

INSERT INTO kohteet.koodisto_kaapelityyppi (id, selite, jarjestys) VALUES (1, 'ei tiedossa', -1);
INSERT INTO kohteet.koodisto_kaapelityyppi (id, selite, jarjestys) VALUES (2, 'maakaapeli', 2);
INSERT INTO kohteet.koodisto_kaapelityyppi (id, selite, jarjestys) VALUES (3, 'ilmakaapeli', 3);
INSERT INTO kohteet.koodisto_kaapelityyppi (id, selite, jarjestys) VALUES (4, 'vesistökaapeli', 4);
INSERT INTO kohteet.koodisto_kaapelityyppi (id, selite, jarjestys) VALUES (5, 'maakaapeli, varalla', 5);


-- NEW ABSTRACTVARUSTE TABLE - KAAPELI

CREATE TABLE kohteet.kaapeli (
    id serial NOT NULL,
    valaisinkeskus_id integer REFERENCES kohteet.valaisinkeskus (id) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    kaapelin_tarkoitus_id integer REFERENCES kohteet.koodisto_kaapeli_tarkoitus (id) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE,
    kaapelityyppi_id integer REFERENCES kohteet.koodisto_kaapelityyppi (id) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT kaapeli_pk PRIMARY KEY (id)
)
 INHERITS(kohteet.abstractvaruste);

ALTER TABLE kohteet.kaapeli OWNER TO $DatabaseOwner$;

ALTER TABLE kohteet.kaapeli ADD CONSTRAINT kaapeli_elinkaari_id_fkey FOREIGN KEY (elinkaari_id)
REFERENCES kohteet.koodisto_varuste_elinkaari (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE kohteet.kaapeli ADD CONSTRAINT kaapeli_kunto_id_fkey FOREIGN KEY (kunto_id)
REFERENCES kohteet.koodisto_varuste_kunto (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE kohteet.kaapeli ADD CONSTRAINT kaapeli_tila_id_fkey FOREIGN KEY (tila_id)
REFERENCES kohteet.koodisto_varuste_tila (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

CREATE INDEX kaapeli_geom_line_index ON kohteet.kaapeli USING gist (geom_line);
CREATE INDEX kaapeli_geom_piste_index ON kohteet.kaapeli USING gist (geom_piste);
CREATE INDEX kaapeli_geom_poly_index ON kohteet.kaapeli USING gist (geom_poly);

create trigger upsert_metadata_trg before
insert
    or
update
    on
    kohteet.kaapeli for each row execute function kohteet.upsert_metadata_to_table();

create trigger geom_relations_for_each_row before
insert
    or
update
    of geom_piste,
    geom_line,
    geom_poly,
    loppuhetki on
    kohteet.kaapeli for each row execute function kohteet.geom_relations_for_each_row();

create trigger geom_relations after
insert
    or
update
    of geom_piste,
    geom_line,
    geom_poly,
    loppuhetki on
    kohteet.kaapeli for each statement execute function kohteet.geom_relations();


-- NEW LINK TABLE: VALAISINKESKUS - URAKKA

CREATE TABLE kohteet.valaisinkeskus_urakka (
    valaisinkeskus_id INTEGER NOT NULL REFERENCES kohteet.valaisinkeskus (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    urakka_id INTEGER NOT NULL REFERENCES kohteet.urakka (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT valaisinkeskus_urakka_pk PRIMARY KEY (valaisinkeskus_id, urakka_id)
);


-- NEW LINK TABLE: VALAISIN - URAKKA

CREATE TABLE kohteet.valaisin_urakka (
    valaisin_id INTEGER NOT NULL REFERENCES kohteet.valaisin (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    urakka_id INTEGER NOT NULL REFERENCES kohteet.urakka (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT valaisin_urakka_pk PRIMARY KEY (valaisin_id, urakka_id)
);


-- NEW LINK TABLE: KAAPELI - URAKKA

CREATE TABLE kohteet.kaapeli_urakka (
    kaapeli_id INTEGER NOT NULL REFERENCES kohteet.kaapeli (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    urakka_id INTEGER NOT NULL REFERENCES kohteet.urakka (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT kaapeli_urakka_pk PRIMARY KEY (kaapeli_id, urakka_id)
);
