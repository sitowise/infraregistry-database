-- LIIKENNEMERKIN RAKENNE

-- object: kohteet.koodisto_liikennemerkki_rakenne | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.koodisto_liikennemerkki_rakenne CASCADE;
CREATE TABLE kohteet.koodisto_liikennemerkki_rakenne (
	id integer PRIMARY KEY,
	selite text
);
ALTER TABLE kohteet.koodisto_liikennemerkki_rakenne OWNER TO $DatabaseOwner$;

INSERT INTO kohteet.koodisto_liikennemerkki_rakenne (id, selite) VALUES (1, 'pylväs');
INSERT INTO kohteet.koodisto_liikennemerkki_rakenne (id, selite) VALUES (2, 'seinä');
INSERT INTO kohteet.koodisto_liikennemerkki_rakenne (id, selite) VALUES (3, 'silta');
INSERT INTO kohteet.koodisto_liikennemerkki_rakenne (id, selite) VALUES (4, 'portaali');
INSERT INTO kohteet.koodisto_liikennemerkki_rakenne (id, selite) VALUES (5, 'puoliportaali');
INSERT INTO kohteet.koodisto_liikennemerkki_rakenne (id, selite) VALUES (6, 'puomi tai muu esterakennelma');
INSERT INTO kohteet.koodisto_liikennemerkki_rakenne (id, selite) VALUES (7, 'muu');


-- LIIKENNEMERKIN KOKO

-- object: kohteet.koodisto_liikennemerkki_koko | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.koodisto_liikennemerkki_koko CASCADE;
CREATE TABLE kohteet.koodisto_liikennemerkki_koko (
	id integer PRIMARY KEY,
	selite text
);
ALTER TABLE kohteet.koodisto_liikennemerkki_koko OWNER TO $DatabaseOwner$;

INSERT INTO kohteet.koodisto_liikennemerkki_koko (id, selite) VALUES (1, 'pieni');
INSERT INTO kohteet.koodisto_liikennemerkki_koko (id, selite) VALUES (2, 'normaali');
INSERT INTO kohteet.koodisto_liikennemerkki_koko (id, selite) VALUES (3, 'suuri');

-- KALVON TYYPPI

-- object: kohteet.koodisto_kalvon_tyyppi | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.koodisto_kalvon_tyyppi CASCADE;
CREATE TABLE kohteet.koodisto_kalvon_tyyppi (
	id integer PRIMARY KEY,
	selite text
);
ALTER TABLE kohteet.koodisto_kalvon_tyyppi OWNER TO $DatabaseOwner$;

INSERT INTO kohteet.koodisto_kalvon_tyyppi (id, selite) VALUES (1, 'r1');
INSERT INTO kohteet.koodisto_kalvon_tyyppi (id, selite) VALUES (2, 'r2');
INSERT INTO kohteet.koodisto_kalvon_tyyppi (id, selite) VALUES (3, 'r3');

-- VARUSTEMATERIAALI - new codes: vaneri, alumiini

DELETE FROM kohteet.varustemateriaali;
INSERT INTO kohteet.varustemateriaali (id, selite) OVERRIDING SYSTEM VALUE VALUES (1, 'betoni');
INSERT INTO kohteet.varustemateriaali (id, selite) OVERRIDING SYSTEM VALUE VALUES (2, 'elementtiverkko');
INSERT INTO kohteet.varustemateriaali (id, selite) OVERRIDING SYSTEM VALUE VALUES (3, 'kaksipuolinen teräspalkki');
INSERT INTO kohteet.varustemateriaali (id, selite) OVERRIDING SYSTEM VALUE VALUES (4, 'kivi');
INSERT INTO kohteet.varustemateriaali (id, selite) OVERRIDING SYSTEM VALUE VALUES (5, 'lasikuitu');
INSERT INTO kohteet.varustemateriaali (id, selite) OVERRIDING SYSTEM VALUE VALUES (6, 'metalli');
INSERT INTO kohteet.varustemateriaali (id, selite) OVERRIDING SYSTEM VALUE VALUES (7, 'muovi');
INSERT INTO kohteet.varustemateriaali (id, selite) OVERRIDING SYSTEM VALUE VALUES (8, 'panssariverkko');
INSERT INTO kohteet.varustemateriaali (id, selite) OVERRIDING SYSTEM VALUE VALUES (9, 'putkipalkki');
INSERT INTO kohteet.varustemateriaali (id, selite) OVERRIDING SYSTEM VALUE VALUES (10, 'puu');
INSERT INTO kohteet.varustemateriaali (id, selite) OVERRIDING SYSTEM VALUE VALUES (11, 'teräs');
INSERT INTO kohteet.varustemateriaali (id, selite) OVERRIDING SYSTEM VALUE VALUES (12, 'teräspalkki');
INSERT INTO kohteet.varustemateriaali (id, selite) OVERRIDING SYSTEM VALUE VALUES (13, 'teräsverkko');
INSERT INTO kohteet.varustemateriaali (id, selite) OVERRIDING SYSTEM VALUE VALUES (14, 'vaijeri');
INSERT INTO kohteet.varustemateriaali (id, selite) OVERRIDING SYSTEM VALUE VALUES (15, 'valurauta');
INSERT INTO kohteet.varustemateriaali (id, selite) OVERRIDING SYSTEM VALUE VALUES (16, 'vaneri');
INSERT INTO kohteet.varustemateriaali (id, selite) OVERRIDING SYSTEM VALUE VALUES (17, 'alumiini');
INSERT INTO kohteet.varustemateriaali (id, selite) OVERRIDING SYSTEM VALUE VALUES (18, 'muu');
INSERT INTO kohteet.varustemateriaali (id, selite) OVERRIDING SYSTEM VALUE VALUES (19, 'ei tiedossa');
SELECT setval(pg_get_serial_sequence('kohteet.varustemateriaali', 'id'), (select max(id) from kohteet.varustemateriaali));

-- SIJAINTITARKENNE

-- object: kohteet.koodisto_sijaintitarkenne | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.koodisto_sijaintitarkenne CASCADE;
CREATE TABLE kohteet.koodisto_sijaintitarkenne (
	id integer PRIMARY KEY,
	selite text
);
ALTER TABLE kohteet.koodisto_sijaintitarkenne OWNER TO $DatabaseOwner$;

INSERT INTO kohteet.koodisto_sijaintitarkenne (id, selite) VALUES (1, 'väylän oikea puoli');
INSERT INTO kohteet.koodisto_sijaintitarkenne (id, selite) VALUES (2, 'väylän vasen puoli');
INSERT INTO kohteet.koodisto_sijaintitarkenne (id, selite) VALUES (3, 'kaistan yläpuolella');
INSERT INTO kohteet.koodisto_sijaintitarkenne (id, selite) VALUES (4, 'keskisaareke tai liikenteenjakaja');
INSERT INTO kohteet.koodisto_sijaintitarkenne (id, selite) VALUES (5, 'pitkittäin ajosuuntaan nähden');
INSERT INTO kohteet.koodisto_sijaintitarkenne (id, selite) VALUES (6, 'tie- ja katuverkon ulkopuolella, esimerkiksi parkkialue tai piha');

-- KAISTAN TYYPPI

-- object: kohteet.koodisto_kaistan_tyyppi | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.koodisto_kaistan_tyyppi CASCADE;
CREATE TABLE kohteet.koodisto_kaistan_tyyppi (
	id integer PRIMARY KEY,
	selite text
);
ALTER TABLE kohteet.koodisto_kaistan_tyyppi OWNER TO $DatabaseOwner$;

INSERT INTO kohteet.koodisto_kaistan_tyyppi (id, selite) VALUES (1, 'pääkaista');
INSERT INTO kohteet.koodisto_kaistan_tyyppi (id, selite) VALUES (2, 'ohituskaista');
INSERT INTO kohteet.koodisto_kaistan_tyyppi (id, selite) VALUES (3, 'kääntymiskaista oikealle');
INSERT INTO kohteet.koodisto_kaistan_tyyppi (id, selite) VALUES (4, 'kääntymiskaista vasemmalle');
INSERT INTO kohteet.koodisto_kaistan_tyyppi (id, selite) VALUES (5, 'lisäkaista suoraan ajaville');
INSERT INTO kohteet.koodisto_kaistan_tyyppi (id, selite) VALUES (6, 'liittymiskaista');
INSERT INTO kohteet.koodisto_kaistan_tyyppi (id, selite) VALUES (7, 'erkanemiskaista');
INSERT INTO kohteet.koodisto_kaistan_tyyppi (id, selite) VALUES (8, 'sekoittumiskaista');
INSERT INTO kohteet.koodisto_kaistan_tyyppi (id, selite) VALUES (9, 'joukkoliikenteen kaista / taksikaista');
INSERT INTO kohteet.koodisto_kaistan_tyyppi (id, selite) VALUES (10, 'raskaan liikenteen kaista');
INSERT INTO kohteet.koodisto_kaistan_tyyppi (id, selite) VALUES (11, 'vaihtuvasuuntainen kaista');
INSERT INTO kohteet.koodisto_kaistan_tyyppi (id, selite) VALUES (12, 'pyöräkaista');
INSERT INTO kohteet.koodisto_kaistan_tyyppi (id, selite) VALUES (20, 'yhdistetty pyörätie ja jalkakäytävä');
INSERT INTO kohteet.koodisto_kaistan_tyyppi (id, selite) VALUES (21, 'jalkakäytävä');
INSERT INTO kohteet.koodisto_kaistan_tyyppi (id, selite) VALUES (22, 'pyörätie');
INSERT INTO kohteet.koodisto_kaistan_tyyppi (id, selite) VALUES (23, 'kävelykatu');
INSERT INTO kohteet.koodisto_kaistan_tyyppi (id, selite) VALUES (24, 'pyöräkatu');

-- KAISTAN NUMERO

-- object: kohteet.koodisto_kaistan_numero | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.koodisto_kaistan_numero CASCADE;
CREATE TABLE kohteet.koodisto_kaistan_numero (
	id integer PRIMARY KEY,
	selite text
);
ALTER TABLE kohteet.koodisto_kaistan_numero OWNER TO $DatabaseOwner$;

INSERT INTO kohteet.koodisto_kaistan_numero (id, selite) VALUES (1, '11 - pääkaista');
INSERT INTO kohteet.koodisto_kaistan_numero (id, selite) VALUES (2, '21 - pääkaista');
INSERT INTO kohteet.koodisto_kaistan_numero (id, selite) VALUES (3, '31 - molempiin suuntiin liikenteen salliva kaista');
INSERT INTO kohteet.koodisto_kaistan_numero (id, selite) VALUES (4, 'X2 - ensimmäinen lisäkaista pääkaistan vasemmalla puolella');
INSERT INTO kohteet.koodisto_kaistan_numero (id, selite) VALUES (5, 'X3 - ensimmäinen lisäkaista pääkaistan oikealla puolella');
INSERT INTO kohteet.koodisto_kaistan_numero (id, selite) VALUES (6, 'X4 - toinen lisäkaista pääkaistan vasemmalla puolella');
INSERT INTO kohteet.koodisto_kaistan_numero (id, selite) VALUES (7, 'X5 - toinen lisäkaistan pääkaistan oikealla puolella');
INSERT INTO kohteet.koodisto_kaistan_numero (id, selite) VALUES (8, 'X6 - kolmas lisäkaista pääkaistan vasemmalla puolella');
INSERT INTO kohteet.koodisto_kaistan_numero (id, selite) VALUES (9, 'X7 - kolmas lisäkaistan pääkaistan oikealla puolella');
INSERT INTO kohteet.koodisto_kaistan_numero (id, selite) VALUES (10, 'X8 - neljäs lisäkaista pääkaistan vasemmalla puolella');
INSERT INTO kohteet.koodisto_kaistan_numero (id, selite) VALUES (11, 'X9 - neljäs lisäkaista pääkaistan oikealla puolella');

-- LISÄKILVEN VÄRI

-- object: kohteet.koodisto_lisakilven_vari | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.koodisto_lisakilven_vari CASCADE;
CREATE TABLE kohteet.koodisto_lisakilven_vari (
	id integer PRIMARY KEY,
	selite text
);
ALTER TABLE kohteet.koodisto_lisakilven_vari OWNER TO $DatabaseOwner$;

INSERT INTO kohteet.koodisto_lisakilven_vari (id, selite) VALUES (1, 'sininen');
INSERT INTO kohteet.koodisto_lisakilven_vari (id, selite) VALUES (2, 'keltainen');
