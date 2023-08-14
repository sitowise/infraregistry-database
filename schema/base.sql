--
-- Based on https://github.com/GispoCoding/infraO-open/commits/dev/db/migrations/V1.0.0__initial.sql (5c3dd1c3b6da401fe6f91e7cbcf064be7025ae0d)
--

-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler version: 0.9.4
-- PostgreSQL version: 13.0
-- Project Site: pgmodeler.io
-- Model Author: ---
-- object: infrao_admin | type: ROLE --
-- DROP ROLE IF EXISTS infrao_admin;
--CREATE ROLE infrao_admin WITH 
--	CREATEROLE
--	LOGIN;
-- ddl-end --


-- Database creation must be performed outside a multi lined SQL file. 
-- These commands were put in this file only as a convenience.
-- 
-- object: infrao | type: DATABASE --
-- DROP DATABASE IF EXISTS infrao;
--CREATE DATABASE infrao
--	TABLESPACE = pg_default
--	OWNER = infrao_admin;
-- ddl-end --


-- object: koodistot | type: SCHEMA --
-- DROP SCHEMA IF EXISTS koodistot CASCADE;
CREATE SCHEMA koodistot;
-- ddl-end --
ALTER SCHEMA koodistot OWNER TO infrao_admin;
-- ddl-end --

-- object: kohteet | type: SCHEMA --
-- DROP SCHEMA IF EXISTS kohteet CASCADE;
CREATE SCHEMA IF NOT EXISTS kohteet;
-- ddl-end --
ALTER SCHEMA kohteet OWNER TO infrao_admin;
-- ddl-end --

-- object: abstraktit | type: SCHEMA --
-- DROP SCHEMA IF EXISTS abstraktit CASCADE;
CREATE SCHEMA abstraktit;
-- ddl-end --
ALTER SCHEMA abstraktit OWNER TO infrao_admin;
-- ddl-end --

-- object: meta | type: SCHEMA --
-- DROP SCHEMA IF EXISTS meta CASCADE;
CREATE SCHEMA meta;
-- ddl-end --
ALTER SCHEMA meta OWNER TO infrao_admin;
-- ddl-end --

SET search_path TO pg_catalog,public,koodistot,kohteet,abstraktit,meta;
-- ddl-end --

-- object: koodistot.viheralueen_kayttotarkoitus_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS koodistot.viheralueen_kayttotarkoitus_id_seq CASCADE;
CREATE SEQUENCE koodistot.viheralueen_kayttotarkoitus_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE koodistot.viheralueen_kayttotarkoitus_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: koodistot.viheralueenkayttotarkoitus | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.viheralueenkayttotarkoitus CASCADE;
CREATE TABLE koodistot.viheralueenkayttotarkoitus (
	id serial NOT NULL,
	selite text NOT NULL,
	CONSTRAINT viheralueen_kayttotarkoitus_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.viheralueenkayttotarkoitus OWNER TO infrao_admin;
-- ddl-end --

INSERT INTO koodistot.viheralueenkayttotarkoitus (id, selite) VALUES (E'1', E'erityisalue');
-- ddl-end --
INSERT INTO koodistot.viheralueenkayttotarkoitus (id, selite) VALUES (E'2', E'koirapuisto');
-- ddl-end --
INSERT INTO koodistot.viheralueenkayttotarkoitus (id, selite) VALUES (E'3', E'leikkipaikka');
-- ddl-end --
INSERT INTO koodistot.viheralueenkayttotarkoitus (id, selite) VALUES (E'4', E'liikenneviheralue');
-- ddl-end --
INSERT INTO koodistot.viheralueenkayttotarkoitus (id, selite) VALUES (E'5', E'liikuntapaikka');
-- ddl-end --
INSERT INTO koodistot.viheralueenkayttotarkoitus (id, selite) VALUES (E'6', E'lumenvastaanottopaikka');
-- ddl-end --
INSERT INTO koodistot.viheralueenkayttotarkoitus (id, selite) VALUES (E'7', E'puisto');
-- ddl-end --
INSERT INTO koodistot.viheralueenkayttotarkoitus (id, selite) VALUES (E'8', E'siirtolapuutarha');
-- ddl-end --
INSERT INTO koodistot.viheralueenkayttotarkoitus (id, selite) VALUES (E'9', E'suojelualue');
-- ddl-end --
INSERT INTO koodistot.viheralueenkayttotarkoitus (id, selite) VALUES (E'10', E'talousmetsa');
-- ddl-end --
INSERT INTO koodistot.viheralueenkayttotarkoitus (id, selite) VALUES (E'11', E'ulkoilu- ja retkeilyalue');
-- ddl-end --
INSERT INTO koodistot.viheralueenkayttotarkoitus (id, selite) VALUES (E'12', E'muu');
-- ddl-end --
INSERT INTO koodistot.viheralueenkayttotarkoitus (id, selite) VALUES (E'13', E'ei tiedossa');
-- ddl-end --

-- object: koodistot.varuste_materiaali_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS koodistot.varuste_materiaali_id_seq CASCADE;
CREATE SEQUENCE koodistot.varuste_materiaali_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE koodistot.varuste_materiaali_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: koodistot.varustemateriaali | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.varustemateriaali CASCADE;
CREATE TABLE koodistot.varustemateriaali (
	id serial NOT NULL,
	selite text NOT NULL,
	CONSTRAINT varuste_materiaali_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.varustemateriaali OWNER TO infrao_admin;
-- ddl-end --

INSERT INTO koodistot.varustemateriaali (id, selite) VALUES (E'1', E'betoni');
-- ddl-end --
INSERT INTO koodistot.varustemateriaali (id, selite) VALUES (E'2', E'elementtiverkko');
-- ddl-end --
INSERT INTO koodistot.varustemateriaali (id, selite) VALUES (E'3', E'kaksipuolinen teräspalkki');
-- ddl-end --
INSERT INTO koodistot.varustemateriaali (id, selite) VALUES (E'4', E'kivi');
-- ddl-end --
INSERT INTO koodistot.varustemateriaali (id, selite) VALUES (E'5', E'metalli');
-- ddl-end --
INSERT INTO koodistot.varustemateriaali (id, selite) VALUES (E'6', E'muovi');
-- ddl-end --
INSERT INTO koodistot.varustemateriaali (id, selite) VALUES (E'7', E'panssariverkko');
-- ddl-end --
INSERT INTO koodistot.varustemateriaali (id, selite) VALUES (E'8', E'putkipalkki');
-- ddl-end --
INSERT INTO koodistot.varustemateriaali (id, selite) VALUES (E'9', E'puu');
-- ddl-end --
INSERT INTO koodistot.varustemateriaali (id, selite) VALUES (E'10', E'teräs');
-- ddl-end --
INSERT INTO koodistot.varustemateriaali (id, selite) VALUES (E'11', E'teräspalkki');
-- ddl-end --
INSERT INTO koodistot.varustemateriaali (id, selite) VALUES (E'12', E'teräsverkko');
-- ddl-end --
INSERT INTO koodistot.varustemateriaali (id, selite) VALUES (E'13', E'vaijeri');
-- ddl-end --
INSERT INTO koodistot.varustemateriaali (id, selite) VALUES (E'14', E'muu');
-- ddl-end --
INSERT INTO koodistot.varustemateriaali (id, selite) VALUES (E'15', E'ei tiedossa');
-- ddl-end --

-- object: koodistot.hoitoluokka_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS koodistot.hoitoluokka_id_seq CASCADE;
CREATE SEQUENCE koodistot.hoitoluokka_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE koodistot.hoitoluokka_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: koodistot.hoitoluokkatyyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.hoitoluokkatyyppi CASCADE;
CREATE TABLE koodistot.hoitoluokkatyyppi (
	id serial NOT NULL,
	selite text NOT NULL,
	CONSTRAINT hoitoluokka_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.hoitoluokkatyyppi OWNER TO infrao_admin;
-- ddl-end --

INSERT INTO koodistot.hoitoluokkatyyppi (id, selite) VALUES (E'1', E'R1 Rakennettu arvoviheralue');
-- ddl-end --
INSERT INTO koodistot.hoitoluokkatyyppi (id, selite) VALUES (E'2', E'R2 Toimintaviheralue');
-- ddl-end --
INSERT INTO koodistot.hoitoluokkatyyppi (id, selite) VALUES (E'3', E'R3 Käyttöviheralue');
-- ddl-end --
INSERT INTO koodistot.hoitoluokkatyyppi (id, selite) VALUES (E'4', E'R4 Suoja- ja vaihettumisviheralue');
-- ddl-end --
INSERT INTO koodistot.hoitoluokkatyyppi (id, selite) VALUES (E'5', E'A1 Arvoniitty');
-- ddl-end --
INSERT INTO koodistot.hoitoluokkatyyppi (id, selite) VALUES (E'6', E'A2 Käyttöniitty');
-- ddl-end --
INSERT INTO koodistot.hoitoluokkatyyppi (id, selite) VALUES (E'7', E'A3 Maisemaniitty');
-- ddl-end --
INSERT INTO koodistot.hoitoluokkatyyppi (id, selite) VALUES (E'8', E'A4 Avoin alue');
-- ddl-end --
INSERT INTO koodistot.hoitoluokkatyyppi (id, selite) VALUES (E'9', E'A5 Maisemapelto');
-- ddl-end --
INSERT INTO koodistot.hoitoluokkatyyppi (id, selite) VALUES (E'10', E'M1 Arvometsä');
-- ddl-end --
INSERT INTO koodistot.hoitoluokkatyyppi (id, selite) VALUES (E'11', E'M2 Lähimetsä');
-- ddl-end --
INSERT INTO koodistot.hoitoluokkatyyppi (id, selite) VALUES (E'12', E'M3 Ulkoilu- ja virkistysmetsä');
-- ddl-end --
INSERT INTO koodistot.hoitoluokkatyyppi (id, selite) VALUES (E'13', E'M4 Suojametsä');
-- ddl-end --
INSERT INTO koodistot.hoitoluokkatyyppi (id, selite) VALUES (E'14', E'M5 Talousmetsä');
-- ddl-end --
INSERT INTO koodistot.hoitoluokkatyyppi (id, selite) VALUES (E'15', E'S Suojelualueet');
-- ddl-end --
INSERT INTO koodistot.hoitoluokkatyyppi (id, selite) VALUES (E'16', E'ei hoidossa');
-- ddl-end --
INSERT INTO koodistot.hoitoluokkatyyppi (id, selite) VALUES (E'17', E'U urheilualue');
-- ddl-end --
INSERT INTO koodistot.hoitoluokkatyyppi (id, selite) VALUES (E'18', E'ajoradat, luokka I');
-- ddl-end --
INSERT INTO koodistot.hoitoluokkatyyppi (id, selite) VALUES (E'19', E'ajoradat, luokka Il');
-- ddl-end --
INSERT INTO koodistot.hoitoluokkatyyppi (id, selite) VALUES (E'20', E'ajoradat, luokka Ill');
-- ddl-end --
INSERT INTO koodistot.hoitoluokkatyyppi (id, selite) VALUES (E'21', E'kevyen liikenteen raitti, luokka l');
-- ddl-end --
INSERT INTO koodistot.hoitoluokkatyyppi (id, selite) VALUES (E'22', E'kevyen liikenteen raitti, luokka ll');
-- ddl-end --
INSERT INTO koodistot.hoitoluokkatyyppi (id, selite) VALUES (E'23', E'kevyen liikenteen väylä, luokka l');
-- ddl-end --
INSERT INTO koodistot.hoitoluokkatyyppi (id, selite) VALUES (E'24', E'kevyen liikenteen väylä, luokka ll');
-- ddl-end --
INSERT INTO koodistot.hoitoluokkatyyppi (id, selite) VALUES (E'25', E'jalkakäytävä, luokka l');
-- ddl-end --
INSERT INTO koodistot.hoitoluokkatyyppi (id, selite) VALUES (E'26', E'jalkakäytävä, luokka ll');
-- ddl-end --
INSERT INTO koodistot.hoitoluokkatyyppi (id, selite) VALUES (E'27', E'torit ja aukiot, luokka l');
-- ddl-end --
INSERT INTO koodistot.hoitoluokkatyyppi (id, selite) VALUES (E'28', E'torit ja aukiot, luokka ll');
-- ddl-end --
INSERT INTO koodistot.hoitoluokkatyyppi (id, selite) VALUES (E'29', E'kiinteistön kunnossapitovastuu');
-- ddl-end --
INSERT INTO koodistot.hoitoluokkatyyppi (id, selite) VALUES (E'30', E'ei kunnossapitoa');
-- ddl-end --
INSERT INTO koodistot.hoitoluokkatyyppi (id, selite) VALUES (E'31', E'ei talvikunnossapitoa');
-- ddl-end --
INSERT INTO koodistot.hoitoluokkatyyppi (id, selite) VALUES (E'32', E'muu');
-- ddl-end --
INSERT INTO koodistot.hoitoluokkatyyppi (id, selite) VALUES (E'33', E'ei tiedossa');
-- ddl-end --

-- object: public.viheralue_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.viheralue_id_seq CASCADE;
CREATE SEQUENCE public.viheralue_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.viheralue_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: kohteet.viheralue | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.viheralue CASCADE;
CREATE TABLE kohteet.viheralue (
	id serial NOT NULL,
	CONSTRAINT viheralue_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE kohteet.viheralue OWNER TO infrao_admin;
-- ddl-end --

-- object: kohteet.viheralueenosa_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS kohteet.viheralueenosa_id_seq CASCADE;
CREATE SEQUENCE kohteet.viheralueenosa_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE kohteet.viheralueenosa_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: abstraktit.abstractpaikkatietopalvelukohde | type: TABLE --
-- DROP TABLE IF EXISTS abstraktit.abstractpaikkatietopalvelukohde CASCADE;
CREATE TABLE abstraktit.abstractpaikkatietopalvelukohde (
	id serial NOT NULL,
	name text,
	metatieto text,
	yksilointitieto text,
	alkuhetki date,
	loppuhetki date,
	CONSTRAINT abstractpaikkatietopalvelukohde_pk PRIMARY KEY (id)
);
-- ddl-end --
COMMENT ON TABLE abstraktit.abstractpaikkatietopalvelukohde IS E'Kohde josta periytetään kaikki kohteet';
-- ddl-end --
COMMENT ON COLUMN abstraktit.abstractpaikkatietopalvelukohde.metatieto IS E'Kohteen metatiedot.';
-- ddl-end --
COMMENT ON COLUMN abstraktit.abstractpaikkatietopalvelukohde.yksilointitieto IS E'Kohteen lähtötietojärjestelmän tvs. mukainen yksilöintitieto';
-- ddl-end --
COMMENT ON COLUMN abstraktit.abstractpaikkatietopalvelukohde.alkuhetki IS E'Kohteen luontipäivämäärä';
-- ddl-end --
COMMENT ON COLUMN abstraktit.abstractpaikkatietopalvelukohde.loppuhetki IS E'Milloin kohde on poistettu. Tämän avulla voidaan tunnistaa poistetut kohteet, jos järjestelmät tukevat historiatietojen tallentamista';
-- ddl-end --
ALTER TABLE abstraktit.abstractpaikkatietopalvelukohde OWNER TO infrao_admin;
-- ddl-end --

-- object: koodistot.katuosanlaji_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS koodistot.katuosanlaji_id_seq CASCADE;
CREATE SEQUENCE koodistot.katuosanlaji_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE koodistot.katuosanlaji_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: koodistot.katuosanlaji | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.katuosanlaji CASCADE;
CREATE TABLE koodistot.katuosanlaji (
	id serial NOT NULL,
	selite text NOT NULL,
	CONSTRAINT katuosanlaji_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.katuosanlaji OWNER TO infrao_admin;
-- ddl-end --

INSERT INTO koodistot.katuosanlaji (id, selite) VALUES (E'1', E'ajorata');
-- ddl-end --
INSERT INTO koodistot.katuosanlaji (id, selite) VALUES (E'2', E'alikulkukäytävä');
-- ddl-end --
INSERT INTO koodistot.katuosanlaji (id, selite) VALUES (E'3', E'jalkakäytävä');
-- ddl-end --
INSERT INTO koodistot.katuosanlaji (id, selite) VALUES (E'4', E'kävelytie');
-- ddl-end --
INSERT INTO koodistot.katuosanlaji (id, selite) VALUES (E'5', E'luiska');
-- ddl-end --
INSERT INTO koodistot.katuosanlaji (id, selite) VALUES (E'6', E'portaat');
-- ddl-end --
INSERT INTO koodistot.katuosanlaji (id, selite) VALUES (E'7', E'pyöräilykaista');
-- ddl-end --
INSERT INTO koodistot.katuosanlaji (id, selite) VALUES (E'8', E'pyörätie');
-- ddl-end --
INSERT INTO koodistot.katuosanlaji (id, selite) VALUES (E'9', E'raitiotie');
-- ddl-end --
INSERT INTO koodistot.katuosanlaji (id, selite) VALUES (E'10', E'silta');
-- ddl-end --
INSERT INTO koodistot.katuosanlaji (id, selite) VALUES (E'11', E'tasoristeys');
-- ddl-end --
INSERT INTO koodistot.katuosanlaji (id, selite) VALUES (E'12', E'tonttiliittymä');
-- ddl-end --
INSERT INTO koodistot.katuosanlaji (id, selite) VALUES (E'13', E'tunneli');
-- ddl-end --
INSERT INTO koodistot.katuosanlaji (id, selite) VALUES (E'14', E'viheralue');
-- ddl-end --
INSERT INTO koodistot.katuosanlaji (id, selite) VALUES (E'15', E'välikaista');
-- ddl-end --
INSERT INTO koodistot.katuosanlaji (id, selite) VALUES (E'16', E'yhdistetty kevyen liikenteen väylä');
-- ddl-end --
INSERT INTO koodistot.katuosanlaji (id, selite) VALUES (E'17', E'muu');
-- ddl-end --
INSERT INTO koodistot.katuosanlaji (id, selite) VALUES (E'18', E'ei tiedossa');
-- ddl-end --

-- object: koodistot.talvihoidonluokka_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS koodistot.talvihoidonluokka_id_seq CASCADE;
CREATE SEQUENCE koodistot.talvihoidonluokka_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE koodistot.talvihoidonluokka_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: koodistot.talvihoidonluokka | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.talvihoidonluokka CASCADE;
CREATE TABLE koodistot.talvihoidonluokka (
	id serial NOT NULL,
	selite text NOT NULL,
	CONSTRAINT talvihoidonluokka_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.talvihoidonluokka OWNER TO infrao_admin;
-- ddl-end --

INSERT INTO koodistot.talvihoidonluokka (id, selite) VALUES (E'1', E'A - kiireellisyysluokka');
-- ddl-end --
INSERT INTO koodistot.talvihoidonluokka (id, selite) VALUES (E'2', E'B - kiireellisyysluokka');
-- ddl-end --
INSERT INTO koodistot.talvihoidonluokka (id, selite) VALUES (E'3', E'C - kiireellisyysluokka');
-- ddl-end --
INSERT INTO koodistot.talvihoidonluokka (id, selite) VALUES (E'4', E'Ei kiireellisyysluokkaa');
-- ddl-end --
INSERT INTO koodistot.talvihoidonluokka (id, selite) VALUES (E'5', E'Ei talvikunnossapitoa');
-- ddl-end --

-- object: public.katualue_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.katualue_id_seq CASCADE;
CREATE SEQUENCE public.katualue_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.katualue_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: kohteet.katualue | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.katualue CASCADE;
CREATE TABLE kohteet.katualue (
	id serial NOT NULL,
	CONSTRAINT katualue_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE kohteet.katualue OWNER TO infrao_admin;
-- ddl-end --

-- object: public.katualueenosa_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.katualueenosa_id_seq CASCADE;
CREATE SEQUENCE public.katualueenosa_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.katualueenosa_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: postgis | type: EXTENSION --
-- DROP EXTENSION IF EXISTS postgis CASCADE;
--CREATE EXTENSION postgis
--WITH SCHEMA public;
-- ddl-end --

-- object: public.melu_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.melu_id_seq CASCADE;
CREATE SEQUENCE public.melu_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.melu_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: kohteet.viheralueenosa | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.viheralueenosa CASCADE;
CREATE TABLE kohteet.viheralueenosa (
	id serial NOT NULL,
	omistaja varchar(255),
	haltija varchar(255),
	kunnossapitaja varchar(255),
	perusparannusvuosi smallint,
	valmistumisvuosi smallint,
	suojelualuekytkin boolean,
	kuuluuviheralueeseen_id integer,
	kayttotarkoitus_id integer,
	laji_id integer,
	hoitoluokka_id integer,
	katualueenlaji_id integer,
	suunnitelmalinkkitieto_id integer,
	talvihoidonluokka_id integer,
	puhtaanapitoluokka_id integer,
	muutoshoitoluokka_id integer,
	sisaltaakasvillisuus_id integer,
	sisaltaavaruste integer,
	geom geometry(MULTIPOLYGON, 3067),
-- 	name text,
-- 	metatieto text,
-- 	yksilointitieto text,
-- 	alkuhetki date,
-- 	loppuhetki date,
	CONSTRAINT viheralueenosa_pk PRIMARY KEY (id)
)
 INHERITS(abstraktit.abstractpaikkatietopalvelukohde);
-- ddl-end --
ALTER TABLE kohteet.viheralueenosa OWNER TO infrao_admin;
-- ddl-end --

-- object: public.liikunta_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.liikunta_id_seq CASCADE;
CREATE SEQUENCE public.liikunta_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.liikunta_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: kohteet.katualueenosa | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.katualueenosa CASCADE;
CREATE TABLE kohteet.katualueenosa (
	id serial NOT NULL,
	paatostieto_id integer,
	kunnossapito varchar(255),
	leveys double precision,
	perusparannusvuosi integer,
	pinta_ala double precision,
	pituus double precision,
	puhtaanapito varchar(255),
	talvikunnossapito varchar(255),
	kuuluukatualueeseen_id integer,
	luokka_id integer,
	kunnossapitoluokka_id integer NOT NULL,
	katuosanlaji_id integer,
	pintamateriaali_id integer,
	viherosanlajityypi_id integer,
	suunnitelmalinkkitieto_id integer,
	talvihoidonluokka_id integer,
	sisaltaakasvillisuus_id integer,
	geom geometry(MULTIPOLYGON, 3067),
-- 	name text,
-- 	metatieto text,
-- 	yksilointitieto text,
-- 	alkuhetki date,
-- 	loppuhetki date,
	CONSTRAINT katualueenosa_pk PRIMARY KEY (id)
)
 INHERITS(abstraktit.abstractpaikkatietopalvelukohde);
-- ddl-end --
COMMENT ON COLUMN kohteet.katualueenosa.geom IS E'sijaintitieto';
-- ddl-end --
ALTER TABLE kohteet.katualueenosa OWNER TO infrao_admin;
-- ddl-end --

-- object: public.ymparistotaide_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.ymparistotaide_id_seq CASCADE;
CREATE SEQUENCE public.ymparistotaide_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.ymparistotaide_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: koodistot.liikuntatyyppi_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS koodistot.liikuntatyyppi_id_seq CASCADE;
CREATE SEQUENCE koodistot.liikuntatyyppi_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE koodistot.liikuntatyyppi_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: koodistot.liikuntatyyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.liikuntatyyppi CASCADE;
CREATE TABLE koodistot.liikuntatyyppi (
	id serial NOT NULL,
	selite text NOT NULL,
	CONSTRAINT liikuntatyyppi_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.liikuntatyyppi OWNER TO infrao_admin;
-- ddl-end --

INSERT INTO koodistot.liikuntatyyppi (id, selite) VALUES (E'1', E'jalkapallomaali');
-- ddl-end --
INSERT INTO koodistot.liikuntatyyppi (id, selite) VALUES (E'2', E'jääkiekkomaali');
-- ddl-end --
INSERT INTO koodistot.liikuntatyyppi (id, selite) VALUES (E'3', E'koripalloteline');
-- ddl-end --
INSERT INTO koodistot.liikuntatyyppi (id, selite) VALUES (E'4', E'kuntoilutelineet');
-- ddl-end --
INSERT INTO koodistot.liikuntatyyppi (id, selite) VALUES (E'5', E'lentopallotolppa');
-- ddl-end --
INSERT INTO koodistot.liikuntatyyppi (id, selite) VALUES (E'6', E'luistinkoppi');
-- ddl-end --
INSERT INTO koodistot.liikuntatyyppi (id, selite) VALUES (E'7', E'palloseinä');
-- ddl-end --
INSERT INTO koodistot.liikuntatyyppi (id, selite) VALUES (E'8', E'skeittiramppi');
-- ddl-end --
INSERT INTO koodistot.liikuntatyyppi (id, selite) VALUES (E'9', E'sählymaali');
-- ddl-end --
INSERT INTO koodistot.liikuntatyyppi (id, selite) VALUES (E'10', E'talviliukumäki(siirrettävä)');
-- ddl-end --
INSERT INTO koodistot.liikuntatyyppi (id, selite) VALUES (E'11', E'muu');
-- ddl-end --
INSERT INTO koodistot.liikuntatyyppi (id, selite) VALUES (E'12', E'ei tiedossa');
-- ddl-end --

-- object: public.kaluste_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.kaluste_id_seq CASCADE;
CREATE SEQUENCE public.kaluste_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.kaluste_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: abstraktit.abstractvaruste | type: TABLE --
-- DROP TABLE IF EXISTS abstraktit.abstractvaruste CASCADE;
CREATE TABLE abstraktit.abstractvaruste (
	id serial NOT NULL,
	malli text,
	perusparannusvuosi smallint,
	suunta text,
	valmistaja text,
	valmistumisvuosi smallint,
	kuuluuviheralueenosaan integer,
	kuuluukatualueenosaan integer,
	materiaali_id integer,
	suunnitelmalinkkitieto integer,
	geom_poly geometry(POLYGON, 3067),
	geom_piste geometry(POINT, 3067),
	geom_line geometry(LINESTRING, 3067),
-- 	name text,
-- 	metatieto text,
-- 	yksilointitieto text,
-- 	alkuhetki date,
-- 	loppuhetki date,
	CONSTRAINT abstractvaruste_pk PRIMARY KEY (id)
)
 INHERITS(abstraktit.abstractpaikkatietopalvelukohde);
-- ddl-end --
ALTER TABLE abstraktit.abstractvaruste OWNER TO infrao_admin;
-- ddl-end --

-- object: public.valaistus_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.valaistus_id_seq CASCADE;
CREATE SEQUENCE public.valaistus_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.valaistus_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: public.hulevesi_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.hulevesi_id_seq CASCADE;
CREATE SEQUENCE public.hulevesi_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.hulevesi_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: kohteet.melu | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.melu CASCADE;
CREATE TABLE kohteet.melu (
	id serial NOT NULL,
	melutyyppi_id integer NOT NULL,
-- 	malli text,
-- 	perusparannusvuosi smallint,
-- 	suunta text,
-- 	valmistaja text,
-- 	valmistumisvuosi smallint,
-- 	kuuluuviheralueenosaan integer,
-- 	kuuluukatualueenosaan integer,
-- 	materiaali_id integer,
-- 	suunnitelmalinkkitieto integer,
-- 	geom_poly geometry(POLYGON, 3067),
-- 	geom_piste geometry(POINT, 3067),
-- 	geom_line geometry(LINESTRING, 3067),
-- 	name text,
-- 	metatieto text,
-- 	yksilointitieto text,
-- 	alkuhetki date,
-- 	loppuhetki date,
	CONSTRAINT melu_pk PRIMARY KEY (id)
)
 INHERITS(abstraktit.abstractvaruste);
-- ddl-end --
ALTER TABLE kohteet.melu OWNER TO infrao_admin;
-- ddl-end --

-- object: public.jate_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.jate_id_seq CASCADE;
CREATE SEQUENCE public.jate_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.jate_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: kohteet.liikunta | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.liikunta CASCADE;
CREATE TABLE kohteet.liikunta (
	id serial NOT NULL,
	liikuntatyyppi_id integer NOT NULL,
-- 	malli text,
-- 	perusparannusvuosi smallint,
-- 	suunta text,
-- 	valmistaja text,
-- 	valmistumisvuosi smallint,
-- 	kuuluuviheralueenosaan integer,
-- 	kuuluukatualueenosaan integer,
-- 	materiaali_id integer,
-- 	suunnitelmalinkkitieto integer,
-- 	geom_poly geometry(POLYGON, 3067),
-- 	geom_piste geometry(POINT, 3067),
-- 	geom_line geometry(LINESTRING, 3067),
-- 	name text,
-- 	metatieto text,
-- 	yksilointitieto text,
-- 	alkuhetki date,
-- 	loppuhetki date,
	CONSTRAINT liikunta_pk PRIMARY KEY (id)
)
 INHERITS(abstraktit.abstractvaruste);
-- ddl-end --
ALTER TABLE kohteet.liikunta OWNER TO infrao_admin;
-- ddl-end --

-- object: public.opaste_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.opaste_id_seq CASCADE;
CREATE SEQUENCE public.opaste_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.opaste_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: kohteet.opaste | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.opaste CASCADE;
CREATE TABLE kohteet.opaste (
	id serial NOT NULL,
	opastetyyppi_id integer,
-- 	malli text,
-- 	perusparannusvuosi smallint,
-- 	suunta text,
-- 	valmistaja text,
-- 	valmistumisvuosi smallint,
-- 	kuuluuviheralueenosaan integer,
-- 	kuuluukatualueenosaan integer,
-- 	materiaali_id integer,
-- 	suunnitelmalinkkitieto integer,
-- 	geom_poly geometry(POLYGON, 3067),
-- 	geom_piste geometry(POINT, 3067),
-- 	geom_line geometry(LINESTRING, 3067),
-- 	name text,
-- 	metatieto text,
-- 	yksilointitieto text,
-- 	alkuhetki date,
-- 	loppuhetki date,
	CONSTRAINT opaste_pk PRIMARY KEY (id)
)
 INHERITS(abstraktit.abstractvaruste);
-- ddl-end --
ALTER TABLE kohteet.opaste OWNER TO infrao_admin;
-- ddl-end --

-- object: public.rakenne_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.rakenne_id_seq CASCADE;
CREATE SEQUENCE public.rakenne_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.rakenne_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: kohteet.rakenne | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.rakenne CASCADE;
CREATE TABLE kohteet.rakenne (
	id serial NOT NULL,
	rakennetyyyppi_id integer,
-- 	malli text,
-- 	perusparannusvuosi smallint,
-- 	suunta text,
-- 	valmistaja text,
-- 	valmistumisvuosi smallint,
-- 	kuuluuviheralueenosaan integer,
-- 	kuuluukatualueenosaan integer,
-- 	materiaali_id integer,
-- 	suunnitelmalinkkitieto integer,
-- 	geom_poly geometry(POLYGON, 3067),
-- 	geom_piste geometry(POINT, 3067),
-- 	geom_line geometry(LINESTRING, 3067),
-- 	name text,
-- 	metatieto text,
-- 	yksilointitieto text,
-- 	alkuhetki date,
-- 	loppuhetki date,
	CONSTRAINT rakenne_pk PRIMARY KEY (id)
)
 INHERITS(abstraktit.abstractvaruste);
-- ddl-end --
ALTER TABLE kohteet.rakenne OWNER TO infrao_admin;
-- ddl-end --

-- object: public.ajoratamerkinta_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.ajoratamerkinta_id_seq CASCADE;
CREATE SEQUENCE public.ajoratamerkinta_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.ajoratamerkinta_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: public.liikennemerkki_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.liikennemerkki_id_seq CASCADE;
CREATE SEQUENCE public.liikennemerkki_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.liikennemerkki_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: kohteet.liikennemerkki | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.liikennemerkki CASCADE;
CREATE TABLE kohteet.liikennemerkki (
	id serial NOT NULL,
	liikennemerkkityyppi_id integer,
	liikennemerkkityyppi2020_id integer,
-- 	malli text,
-- 	perusparannusvuosi smallint,
-- 	suunta text,
-- 	valmistaja text,
-- 	valmistumisvuosi smallint,
-- 	kuuluuviheralueenosaan integer,
-- 	kuuluukatualueenosaan integer,
-- 	materiaali_id integer,
-- 	suunnitelmalinkkitieto integer,
-- 	geom_poly geometry(POLYGON, 3067),
-- 	geom_piste geometry(POINT, 3067),
-- 	geom_line geometry(LINESTRING, 3067),
-- 	name text,
-- 	metatieto text,
-- 	yksilointitieto text,
-- 	alkuhetki date,
-- 	loppuhetki date,
	CONSTRAINT liikennemerkki_pk PRIMARY KEY (id)
)
 INHERITS(abstraktit.abstractvaruste);
-- ddl-end --
ALTER TABLE kohteet.liikennemerkki OWNER TO infrao_admin;
-- ddl-end --

-- object: public.leikkivaline_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.leikkivaline_id_seq CASCADE;
CREATE SEQUENCE public.leikkivaline_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.leikkivaline_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: kohteet.leikkivaline | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.leikkivaline CASCADE;
CREATE TABLE kohteet.leikkivaline (
	id serial NOT NULL,
	leikkivalinetyyppi_id integer,
-- 	malli text,
-- 	perusparannusvuosi smallint,
-- 	suunta text,
-- 	valmistaja text,
-- 	valmistumisvuosi smallint,
-- 	kuuluuviheralueenosaan integer,
-- 	kuuluukatualueenosaan integer,
-- 	materiaali_id integer,
-- 	suunnitelmalinkkitieto integer,
-- 	geom_poly geometry(POLYGON, 3067),
-- 	geom_piste geometry(POINT, 3067),
-- 	geom_line geometry(LINESTRING, 3067),
-- 	name text,
-- 	metatieto text,
-- 	yksilointitieto text,
-- 	alkuhetki date,
-- 	loppuhetki date,
	CONSTRAINT leikkivaline_pk PRIMARY KEY (id)
)
 INHERITS(abstraktit.abstractvaruste);
-- ddl-end --
ALTER TABLE kohteet.leikkivaline OWNER TO infrao_admin;
-- ddl-end --

-- object: public.muuvaruste_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.muuvaruste_id_seq CASCADE;
CREATE SEQUENCE public.muuvaruste_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.muuvaruste_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: kohteet.muuvaruste | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.muuvaruste CASCADE;
CREATE TABLE kohteet.muuvaruste (
	id serial NOT NULL,
	muuvarustetyyppi_id integer,
-- 	malli text,
-- 	perusparannusvuosi smallint,
-- 	suunta text,
-- 	valmistaja text,
-- 	valmistumisvuosi smallint,
-- 	kuuluuviheralueenosaan integer,
-- 	kuuluukatualueenosaan integer,
-- 	materiaali_id integer,
-- 	suunnitelmalinkkitieto integer,
-- 	geom_poly geometry(POLYGON, 3067),
-- 	geom_piste geometry(POINT, 3067),
-- 	geom_line geometry(LINESTRING, 3067),
-- 	name text,
-- 	metatieto text,
-- 	yksilointitieto text,
-- 	alkuhetki date,
-- 	loppuhetki date,
	CONSTRAINT muuvaruste_pk PRIMARY KEY (id)
)
 INHERITS(abstraktit.abstractvaruste);
-- ddl-end --
ALTER TABLE kohteet.muuvaruste OWNER TO infrao_admin;
-- ddl-end --

-- object: public.liikennevalo_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.liikennevalo_id_seq CASCADE;
CREATE SEQUENCE public.liikennevalo_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.liikennevalo_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: kohteet.liikennevalo | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.liikennevalo CASCADE;
CREATE TABLE kohteet.liikennevalo (
	id serial NOT NULL,
-- 	malli text,
-- 	perusparannusvuosi smallint,
-- 	suunta text,
-- 	valmistaja text,
-- 	valmistumisvuosi smallint,
-- 	kuuluuviheralueenosaan integer,
-- 	kuuluukatualueenosaan integer,
-- 	materiaali_id integer,
-- 	suunnitelmalinkkitieto integer,
-- 	geom_poly geometry(POLYGON, 3067),
-- 	geom_piste geometry(POINT, 3067),
-- 	geom_line geometry(LINESTRING, 3067),
-- 	name text,
-- 	metatieto text,
-- 	yksilointitieto text,
-- 	alkuhetki date,
-- 	loppuhetki date,
	CONSTRAINT liikennevalo_pk PRIMARY KEY (id)
)
 INHERITS(abstraktit.abstractvaruste);
-- ddl-end --
ALTER TABLE kohteet.liikennevalo OWNER TO infrao_admin;
-- ddl-end --

-- object: koodistot.kunnossapitoluokka_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS koodistot.kunnossapitoluokka_id_seq CASCADE;
CREATE SEQUENCE koodistot.kunnossapitoluokka_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE koodistot.kunnossapitoluokka_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: koodistot.kunnossapitoluokka | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.kunnossapitoluokka CASCADE;
CREATE TABLE koodistot.kunnossapitoluokka (
	id serial NOT NULL,
	selite text NOT NULL,
	CONSTRAINT kunnossapitoluokka_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.kunnossapitoluokka OWNER TO infrao_admin;
-- ddl-end --

INSERT INTO koodistot.kunnossapitoluokka (id, selite) VALUES (E'1', E'ajoradat, luokka I');
-- ddl-end --
INSERT INTO koodistot.kunnossapitoluokka (id, selite) VALUES (E'2', E'ajoradat, luokka II');
-- ddl-end --
INSERT INTO koodistot.kunnossapitoluokka (id, selite) VALUES (E'3', E'ajoradat, luokka III');
-- ddl-end --
INSERT INTO koodistot.kunnossapitoluokka (id, selite) VALUES (E'4', E'kevyen liikenteen raitti, luokka I');
-- ddl-end --
INSERT INTO koodistot.kunnossapitoluokka (id, selite) VALUES (E'5', E'kevyen liikenteen raitti, luokka II');
-- ddl-end --
INSERT INTO koodistot.kunnossapitoluokka (id, selite) VALUES (E'6', E'kevyen liikenteen väylä, luokka I');
-- ddl-end --
INSERT INTO koodistot.kunnossapitoluokka (id, selite) VALUES (E'7', E'kevyen liikenteen väylä, luokka II');
-- ddl-end --
INSERT INTO koodistot.kunnossapitoluokka (id, selite) VALUES (E'8', E'jalkakäytävä, luokka I');
-- ddl-end --
INSERT INTO koodistot.kunnossapitoluokka (id, selite) VALUES (E'9', E'jalkakäytävä, luokka II');
-- ddl-end --
INSERT INTO koodistot.kunnossapitoluokka (id, selite) VALUES (E'10', E'torit ja aukiot, luokka I');
-- ddl-end --
INSERT INTO koodistot.kunnossapitoluokka (id, selite) VALUES (E'11', E'torit ja aukiot, luokka II');
-- ddl-end --
INSERT INTO koodistot.kunnossapitoluokka (id, selite) VALUES (E'12', E'kiinteistön kunnossapitovastuu');
-- ddl-end --
INSERT INTO koodistot.kunnossapitoluokka (id, selite) VALUES (E'13', E'ei kunnossapitoa');
-- ddl-end --
INSERT INTO koodistot.kunnossapitoluokka (id, selite) VALUES (E'14', E'ei talvikunnosspitoa');
-- ddl-end --
INSERT INTO koodistot.kunnossapitoluokka (id, selite) VALUES (E'15', E'A1 edustusviheralue');
-- ddl-end --
INSERT INTO koodistot.kunnossapitoluokka (id, selite) VALUES (E'16', E'A2 käyttöviheralue');
-- ddl-end --
INSERT INTO koodistot.kunnossapitoluokka (id, selite) VALUES (E'17', E'A3 käyttö- ja suojaviheralue');
-- ddl-end --
INSERT INTO koodistot.kunnossapitoluokka (id, selite) VALUES (E'18', E'B1 maisemapelto');
-- ddl-end --
INSERT INTO koodistot.kunnossapitoluokka (id, selite) VALUES (E'19', E'B2 käyttöniitty');
-- ddl-end --
INSERT INTO koodistot.kunnossapitoluokka (id, selite) VALUES (E'20', E'B3 maisemaniitty ja laidunalue');
-- ddl-end --
INSERT INTO koodistot.kunnossapitoluokka (id, selite) VALUES (E'21', E'B4 avoin alue ja näkymät');
-- ddl-end --
INSERT INTO koodistot.kunnossapitoluokka (id, selite) VALUES (E'22', E'B5 arvoniitty');
-- ddl-end --
INSERT INTO koodistot.kunnossapitoluokka (id, selite) VALUES (E'23', E'C1 lähimetsä');
-- ddl-end --
INSERT INTO koodistot.kunnossapitoluokka (id, selite) VALUES (E'24', E'C2 ulkoilu- ja virkistysmetsä');
-- ddl-end --
INSERT INTO koodistot.kunnossapitoluokka (id, selite) VALUES (E'25', E'C3 suojametsä');
-- ddl-end --
INSERT INTO koodistot.kunnossapitoluokka (id, selite) VALUES (E'26', E'C4 talousmetsä');
-- ddl-end --
INSERT INTO koodistot.kunnossapitoluokka (id, selite) VALUES (E'27', E'C5 arvometsä');
-- ddl-end --
INSERT INTO koodistot.kunnossapitoluokka (id, selite) VALUES (E'28', E'E erityisalue');
-- ddl-end --
INSERT INTO koodistot.kunnossapitoluokka (id, selite) VALUES (E'29', E'ei hoidossa');
-- ddl-end --
INSERT INTO koodistot.kunnossapitoluokka (id, selite) VALUES (E'30', E'U urheilualue');
-- ddl-end --
INSERT INTO koodistot.kunnossapitoluokka (id, selite) VALUES (E'31', E'muu');
-- ddl-end --
INSERT INTO koodistot.kunnossapitoluokka (id, selite) VALUES (E'32', E'ei tiedossa');
-- ddl-end --

-- object: public.abstrakti_varuste_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.abstrakti_varuste_id_seq CASCADE;
CREATE SEQUENCE public.abstrakti_varuste_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.abstrakti_varuste_id_seq OWNER TO infrao_admin;
-- ddl-end --

-- object: koodistot.melutyyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.melutyyppi CASCADE;
CREATE TABLE koodistot.melutyyppi (
	id serial NOT NULL,
	selite text NOT NULL,
	CONSTRAINT melutyyppi_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.melutyyppi OWNER TO infrao_admin;
-- ddl-end --

INSERT INTO koodistot.melutyyppi (id, selite) VALUES (E'1', E'meluaita');
-- ddl-end --
INSERT INTO koodistot.melutyyppi (id, selite) VALUES (E'2', E'melueste');
-- ddl-end --
INSERT INTO koodistot.melutyyppi (id, selite) VALUES (E'3', E'melumuuri');
-- ddl-end --
INSERT INTO koodistot.melutyyppi (id, selite) VALUES (E'4', E'meluvalli');
-- ddl-end --
INSERT INTO koodistot.melutyyppi (id, selite) VALUES (E'5', E'muu');
-- ddl-end --
INSERT INTO koodistot.melutyyppi (id, selite) VALUES (E'6', E'ei tiedossa');
-- ddl-end --

-- object: kohteet.jate | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.jate CASCADE;
CREATE TABLE kohteet.jate (
	id serial NOT NULL,
	jatetyyppi_id integer,
-- 	malli text,
-- 	perusparannusvuosi smallint,
-- 	suunta text,
-- 	valmistaja text,
-- 	valmistumisvuosi smallint,
-- 	kuuluuviheralueenosaan integer,
-- 	kuuluukatualueenosaan integer,
-- 	materiaali_id integer,
-- 	suunnitelmalinkkitieto integer,
-- 	geom_poly geometry(POLYGON, 3067),
-- 	geom_piste geometry(POINT, 3067),
-- 	geom_line geometry(LINESTRING, 3067),
-- 	name text,
-- 	metatieto text,
-- 	yksilointitieto text,
-- 	alkuhetki date,
-- 	loppuhetki date,
	CONSTRAINT jate_pk PRIMARY KEY (id)
)
 INHERITS(abstraktit.abstractvaruste);
-- ddl-end --
ALTER TABLE kohteet.jate OWNER TO infrao_admin;
-- ddl-end --

-- object: koodistot.kalustetyyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.kalustetyyppi CASCADE;
CREATE TABLE koodistot.kalustetyyppi (
	id serial NOT NULL,
	selite text,
	CONSTRAINT kalustetyyppi_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.kalustetyyppi OWNER TO infrao_admin;
-- ddl-end --

INSERT INTO koodistot.kalustetyyppi (id, selite) VALUES (E'1', E'irtopenkki');
-- ddl-end --
INSERT INTO koodistot.kalustetyyppi (id, selite) VALUES (E'2', E'istuin muu');
-- ddl-end --
INSERT INTO koodistot.kalustetyyppi (id, selite) VALUES (E'3', E'kalusteryhmä');
-- ddl-end --
INSERT INTO koodistot.kalustetyyppi (id, selite) VALUES (E'4', E'kiintopenkki');
-- ddl-end --
INSERT INTO koodistot.kalustetyyppi (id, selite) VALUES (E'5', E'pöytä');
-- ddl-end --
INSERT INTO koodistot.kalustetyyppi (id, selite) VALUES (E'6', E'pöytä-penkkiyhdistelmä');
-- ddl-end --
INSERT INTO koodistot.kalustetyyppi (id, selite) VALUES (E'7', E'yhdenistuttava penkki');
-- ddl-end --
INSERT INTO koodistot.kalustetyyppi (id, selite) VALUES (E'8', E'muu');
-- ddl-end --
INSERT INTO koodistot.kalustetyyppi (id, selite) VALUES (E'9', E'ei tiedossa');
-- ddl-end --

-- object: koodistot.opastetyyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.opastetyyppi CASCADE;
CREATE TABLE koodistot.opastetyyppi (
	id serial NOT NULL,
	selite text,
	CONSTRAINT opastetyyyppi_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.opastetyyppi OWNER TO infrao_admin;
-- ddl-end --

INSERT INTO koodistot.opastetyyppi (id, selite) VALUES (E'1', E'invapaikka');
-- ddl-end --
INSERT INTO koodistot.opastetyyppi (id, selite) VALUES (E'2', E'koiraparkki');
-- ddl-end --
INSERT INTO koodistot.opastetyyppi (id, selite) VALUES (E'3', E'opastaulut ja -kyltit');
-- ddl-end --
INSERT INTO koodistot.opastetyyppi (id, selite) VALUES (E'4', E'muu');
-- ddl-end --
INSERT INTO koodistot.opastetyyppi (id, selite) VALUES (E'5', E'ei tiedossa');
-- ddl-end --

-- object: koodistot.jatetyyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.jatetyyppi CASCADE;
CREATE TABLE koodistot.jatetyyppi (
	id serial NOT NULL,
	selite text,
	CONSTRAINT jatetyyppi_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.jatetyyppi OWNER TO infrao_admin;
-- ddl-end --

INSERT INTO koodistot.jatetyyppi (id, selite) VALUES (E'1', E'jäteastia');
-- ddl-end --
INSERT INTO koodistot.jatetyyppi (id, selite) VALUES (E'2', E'koiranroska-astia');
-- ddl-end --
INSERT INTO koodistot.jatetyyppi (id, selite) VALUES (E'3', E'roskakori');
-- ddl-end --
INSERT INTO koodistot.jatetyyppi (id, selite) VALUES (E'4', E'muu');
-- ddl-end --
INSERT INTO koodistot.jatetyyppi (id, selite) VALUES (E'5', E'ei tiedossa');
-- ddl-end --

-- object: koodistot.pintamateriaali | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.pintamateriaali CASCADE;
CREATE TABLE koodistot.pintamateriaali (
	id serial NOT NULL,
	selite text,
	CONSTRAINT pintamateriaali_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.pintamateriaali OWNER TO infrao_admin;
-- ddl-end --

INSERT INTO koodistot.pintamateriaali (id, selite) VALUES (E'1', E'asfalttipäällyste');
-- ddl-end --
INSERT INTO koodistot.pintamateriaali (id, selite) VALUES (E'2', E'asfalttibetoni');
-- ddl-end --
INSERT INTO koodistot.pintamateriaali (id, selite) VALUES (E'3', E'betonilaatta');
-- ddl-end --
INSERT INTO koodistot.pintamateriaali (id, selite) VALUES (E'4', E'betonikivi- ja -laattapäällyste');
-- ddl-end --
INSERT INTO koodistot.pintamateriaali (id, selite) VALUES (E'5', E'betonipäällyste (valettavat)');
-- ddl-end --
INSERT INTO koodistot.pintamateriaali (id, selite) VALUES (E'6', E'emulsiopintaus (LP)');
-- ddl-end --
INSERT INTO koodistot.pintamateriaali (id, selite) VALUES (E'7', E'kenttäkivetys');
-- ddl-end --
INSERT INTO koodistot.pintamateriaali (id, selite) VALUES (E'8', E'liuskekivetys');
-- ddl-end --
INSERT INTO koodistot.pintamateriaali (id, selite) VALUES (E'9', E'luonnonkivilaatoitus');
-- ddl-end --
INSERT INTO koodistot.pintamateriaali (id, selite) VALUES (E'10', E'metallirakenne');
-- ddl-end --
INSERT INTO koodistot.pintamateriaali (id, selite) VALUES (E'11', E'murskepäällyste');
-- ddl-end --
INSERT INTO koodistot.pintamateriaali (id, selite) VALUES (E'12', E'noppakivetys');
-- ddl-end --
INSERT INTO koodistot.pintamateriaali (id, selite) VALUES (E'13', E'nupukivetys');
-- ddl-end --
INSERT INTO koodistot.pintamateriaali (id, selite) VALUES (E'14', E'puupäällyste');
-- ddl-end --
INSERT INTO koodistot.pintamateriaali (id, selite) VALUES (E'15', E'sirotepintaus (SIP)');
-- ddl-end --
INSERT INTO koodistot.pintamateriaali (id, selite) VALUES (E'16', E'sorapäällyste');
-- ddl-end --
INSERT INTO koodistot.pintamateriaali (id, selite) VALUES (E'17', E'soratien pintaus (SOP)');
-- ddl-end --
INSERT INTO koodistot.pintamateriaali (id, selite) VALUES (E'18', E'muu');
-- ddl-end --
INSERT INTO koodistot.pintamateriaali (id, selite) VALUES (E'19', E'ei tiedossa');
-- ddl-end --

-- object: koodistot.hulevesityyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.hulevesityyppi CASCADE;
CREATE TABLE koodistot.hulevesityyppi (
	id serial NOT NULL,
	selite text,
	CONSTRAINT hulevesityyppi_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.hulevesityyppi OWNER TO infrao_admin;
-- ddl-end --

INSERT INTO koodistot.hulevesityyppi (id, selite) VALUES (E'1', E'avo-oja');
-- ddl-end --
INSERT INTO koodistot.hulevesityyppi (id, selite) VALUES (E'2', E'avopainanne');
-- ddl-end --
INSERT INTO koodistot.hulevesityyppi (id, selite) VALUES (E'3', E'avouoma');
-- ddl-end --
INSERT INTO koodistot.hulevesityyppi (id, selite) VALUES (E'4', E'hulevesiallas');
-- ddl-end --
INSERT INTO koodistot.hulevesityyppi (id, selite) VALUES (E'5', E'hulevesikaivo');
-- ddl-end --
INSERT INTO koodistot.hulevesityyppi (id, selite) VALUES (E'6', E'hulevesikosteikko');
-- ddl-end --
INSERT INTO koodistot.hulevesityyppi (id, selite) VALUES (E'7', E'imeytyskaivanto');
-- ddl-end --
INSERT INTO koodistot.hulevesityyppi (id, selite) VALUES (E'8', E'imeytyskenttä');
-- ddl-end --
INSERT INTO koodistot.hulevesityyppi (id, selite) VALUES (E'9', E'imeytyspainanne');
-- ddl-end --
INSERT INTO koodistot.hulevesityyppi (id, selite) VALUES (E'10', E'noro');
-- ddl-end --
INSERT INTO koodistot.hulevesityyppi (id, selite) VALUES (E'11', E'patorakenne');
-- ddl-end --
INSERT INTO koodistot.hulevesityyppi (id, selite) VALUES (E'12', E'pidätysallas');
-- ddl-end --
INSERT INTO koodistot.hulevesityyppi (id, selite) VALUES (E'13', E'puro');
-- ddl-end --
INSERT INTO koodistot.hulevesityyppi (id, selite) VALUES (E'14', E'purkukaivo');
-- ddl-end --
INSERT INTO koodistot.hulevesityyppi (id, selite) VALUES (E'15', E'rumpu');
-- ddl-end --
INSERT INTO koodistot.hulevesityyppi (id, selite) VALUES (E'16', E'sulkukaivo');
-- ddl-end --
INSERT INTO koodistot.hulevesityyppi (id, selite) VALUES (E'17', E'säätökaivo');
-- ddl-end --
INSERT INTO koodistot.hulevesityyppi (id, selite) VALUES (E'18', E'säätöpato');
-- ddl-end --
INSERT INTO koodistot.hulevesityyppi (id, selite) VALUES (E'19', E'tarkastuskaivo');
-- ddl-end --
INSERT INTO koodistot.hulevesityyppi (id, selite) VALUES (E'20', E'tarkastusputki');
-- ddl-end --
INSERT INTO koodistot.hulevesityyppi (id, selite) VALUES (E'21', E'tulvauoma');
-- ddl-end --
INSERT INTO koodistot.hulevesityyppi (id, selite) VALUES (E'22', E'vesikouru');
-- ddl-end --
INSERT INTO koodistot.hulevesityyppi (id, selite) VALUES (E'23', E'viivytysallas');
-- ddl-end --
INSERT INTO koodistot.hulevesityyppi (id, selite) VALUES (E'24', E'muu');
-- ddl-end --
INSERT INTO koodistot.hulevesityyppi (id, selite) VALUES (E'25', E'ei tiedossa');
-- ddl-end --

-- object: koodistot.ajoratamerkintatyyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.ajoratamerkintatyyppi CASCADE;
CREATE TABLE koodistot.ajoratamerkintatyyppi (
	id serial NOT NULL,
	selite text NOT NULL,
	CONSTRAINT ajoramerkintatyyppi_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.ajoratamerkintatyyppi OWNER TO infrao_admin;
-- ddl-end --

INSERT INTO koodistot.ajoratamerkintatyyppi (id, selite) VALUES (E'1', E'katkoviiva');
-- ddl-end --
INSERT INTO koodistot.ajoratamerkintatyyppi (id, selite) VALUES (E'2', E'sulkuviiva');
-- ddl-end --
INSERT INTO koodistot.ajoratamerkintatyyppi (id, selite) VALUES (E'3', E'suojatie');
-- ddl-end --
INSERT INTO koodistot.ajoratamerkintatyyppi (id, selite) VALUES (E'4', E'muu');
-- ddl-end --
INSERT INTO koodistot.ajoratamerkintatyyppi (id, selite) VALUES (E'5', E'ei tiedossa');
-- ddl-end --

-- object: koodistot.puutyyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.puutyyppi CASCADE;
CREATE TABLE koodistot.puutyyppi (
	id serial NOT NULL,
	selite text NOT NULL,
	CONSTRAINT puutyppi_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.puutyyppi OWNER TO infrao_admin;
-- ddl-end --

INSERT INTO koodistot.puutyyppi (id, selite) VALUES (E'1', E'havupuu');
-- ddl-end --
INSERT INTO koodistot.puutyyppi (id, selite) VALUES (E'2', E'lehtipuu');
-- ddl-end --
INSERT INTO koodistot.puutyyppi (id, selite) VALUES (E'3', E'muu');
-- ddl-end --
INSERT INTO koodistot.puutyyppi (id, selite) VALUES (E'4', E'ei tiedossa');
-- ddl-end --

-- object: abstraktit.abstractkasvillisuus | type: TABLE --
-- DROP TABLE IF EXISTS abstraktit.abstractkasvillisuus CASCADE;
CREATE TABLE abstraktit.abstractkasvillisuus (
	id serial NOT NULL,
	omistaja varchar,
	haltija varchar,
	kunnossapitaja varchar,
	kuuluuviheralueenosaan integer,
	kuuluukatualueenosaan integer,
	geom_poly geometry(POLYGON, 3067),
	geom_piste geometry(POINT, 3067),
	geom_line geometry(LINESTRING, 3067),
-- 	name text,
-- 	metatieto text,
-- 	yksilointitieto text,
-- 	alkuhetki date,
-- 	loppuhetki date,
	CONSTRAINT abstractkasvillisuus_pk PRIMARY KEY (id)
)
 INHERITS(abstraktit.abstractpaikkatietopalvelukohde);
-- ddl-end --
ALTER TABLE abstraktit.abstractkasvillisuus OWNER TO infrao_admin;
-- ddl-end --

-- object: koodistot.puulaji | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.puulaji CASCADE;
CREATE TABLE koodistot.puulaji (
	id serial NOT NULL,
	selite text,
	CONSTRAINT puulaji_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.puulaji OWNER TO infrao_admin;
-- ddl-end --

INSERT INTO koodistot.puulaji (id, selite) VALUES (E'1', E'Abies amabilis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'2', E'Abies balsamea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'3', E'Abies concolor');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'4', E'Abies fraseri');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'5', E'Abies grandis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'6', E'Abies holophylla');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'7', E'Abies homolepis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'8', E'Abies koreana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'9', E'Abies lasiocarpa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'10', E'Abies lasiocarpa var. arizonica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'11', E'Abies mariesii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'12', E'Abies nephrolepis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'13', E'Abies nordmanniana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'14', E'Abies procera');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'15', E'Abies sachalinensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'16', E'Abies sibirica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'17', E'Abies sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'18', E'Abies veitchii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'19', E'Acanthopanax senticosus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'20', E'Acer barbinerve');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'21', E'Acer campestre');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'22', E'Acer circinatum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'23', E'Acer japonicum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'24', E'Acer mono');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'25', E'Acer negundo');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'26', E'Acer palmatum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'27', E'Acer pensylvanicum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'28', E'Acer platanoides');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'29', E'Acer platanoides ''Reitenbachii''');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'30', E'Acer platanoides ''Schwedleri''');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'31', E'Acer pseudoplatanus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'32', E'Acer pseudosieboldianum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'33', E'Acer rubrum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'34', E'Acer saccharinum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'35', E'Acer saccharum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'36', E'Acer sieboldianum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'37', E'Acer sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'38', E'Acer spicatum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'39', E'Acer tataricum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'40', E'Acer tataricum subsp. ginnala');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'41', E'Acer tataricum subsp. semenowii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'42', E'Acer tataricum subsp. tataricum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'43', E'Acer tegmentosum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'44', E'Acer triflorum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'45', E'Acer ukurunduense');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'46', E'Actinidia arguta');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'47', E'Actinidia kolomikta');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'48', E'Aesculus hippocastanum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'49', E'Aesculus octandra');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'50', E'Alnus glutinosa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'51', E'Alnus glutinosa f. quercifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'52', E'Alnus incana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'53', E'Alnus incana f. gibberosa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'54', E'Alnus incana f. laciniata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'55', E'Alnus incana subsp. kolaënsis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'56', E'Alnus mandshurica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'57', E'Alnus sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'58', E'Alnus viridis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'59', E'Amelanchier alnifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'60', E'Amelanchier laevis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'61', E'Amelanchier lamarckii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'62', E'Amelanchier sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'63', E'Amelanchier spicata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'64', E'Andromeda polifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'65', E'Aralia elata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'66', E'Arctostaphylos alpinus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'67', E'Arctostaphylos uva-ursi');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'68', E'Aristolochia macrophylla');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'69', E'Aronia ×prunifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'70', E'Aronia arbutifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'71', E'Aronia melanocarpa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'72', E'Aronia sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'73', E'Artemisia abronatum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'74', E'Berberis koreana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'75', E'Berberis sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'76', E'Berberis thunbergii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'77', E'Berberis vulgaris');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'78', E'Betula alleghaniensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'79', E'Betula ermanii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'80', E'Betula fruticosa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'81', E'Betula lenta');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'82', E'Betula nana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'83', E'Betula papyrifera');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'84', E'Betula pendula');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'85', E'Betula pendula ''Dalecarlica''');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'86', E'Betula pendula f. bircalensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'87', E'Betula pendula f. crispa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'88', E'Betula pendula f. palmeri');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'89', E'Betula pendula f. tristis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'90', E'Betula pendula var. carelica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'91', E'Betula pendula ''Youngii''');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'92', E'Betula pubescens');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'93', E'Betula pubescens f. aurea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'94', E'Betula pubescens f. rubra');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'95', E'Betula pubescens subsp. czerepanovii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'96', E'Betula sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'97', E'Buddleja davidii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'98', E'Buxus sempervirens');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'99', E'Calluna vulgaris');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'100', E'Caragana arborescens');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'101', E'Caragana aurantiaca');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'102', E'Caragana frutex');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'103', E'Carpinus betulus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'104', E'Cassiope hypnoides');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'105', E'Cassiope tetragona');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'106', E'Celastrus orbiculatus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'107', E'Celastrus scandens');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'108', E'Cercidiphyllum japonicum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'109', E'Cercidiphyllum magnificum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'110', E'Chaenomeles japonica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'111', E'Chamaecyparis lawsoniana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'112', E'Chamaecyparis nootkatensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'113', E'Chamaecyparis pisifera');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'114', E'Chamaecyparis sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'115', E'Chamaedaphne calyculata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'116', E'Chimaphila umbellata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'117', E'Cladrastis kentukea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'118', E'Clematis alpina');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'119', E'Clematis ochotensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'120', E'Clematis sibirica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'121', E'Clematis sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'122', E'Clematis tangutica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'123', E'Clematis vitalba');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'124', E'Clematis viticella');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'125', E'Colutea arborescens');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'126', E'Cornus alba');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'127', E'Cornus alba ''Sibirica''');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'128', E'Cornus alba subsp. alba');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'129', E'Cornus alba subsp. stolonifera');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'130', E'Cornus mas');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'131', E'Cornus sanguinea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'132', E'Cornus sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'133', E'Corylus avellana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'134', E'Corylus colurna');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'135', E'Corylus cornuta');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'136', E'Corylus maxima ''Purpurea''');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'137', E'Corylus sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'138', E'Cotoneaster dammeri');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'139', E'Cotoneaster dammeri var. radicans');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'140', E'Cotoneaster divaricatus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'141', E'Cotoneaster horizontalis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'142', E'Cotoneaster integerrimus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'143', E'Cotoneaster lucidus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'144', E'Cotoneaster nanshan');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'145', E'Cotoneaster niger');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'146', E'Cotoneaster ''Skogholm''');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'147', E'Cotoneaster sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'148', E'Crataegus ×mordenensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'149', E'Crataegus chlorosarca');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'150', E'Crataegus douglasii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'151', E'Crataegus flabellata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'152', E'Crataegus grayana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'153', E'Crataegus intricata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'154', E'Crataegus korolkovii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'155', E'Crataegus laevigata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'156', E'Crataegus macracantha');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'157', E'Crataegus monogyna');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'158', E'Crataegus nigra');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'159', E'Crataegus rhipidophylla');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'160', E'Crataegus sanguinea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'161', E'Crataegus sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'162', E'Crataegus submollis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'163', E'Cytisus ×versicolor');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'164', E'Cytisus decumbens');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'165', E'Cytisus glaber');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'166', E'Cytisus purpureus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'167', E'Cytisus scoparius');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'168', E'Cytisus sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'169', E'Daphne blagayana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'170', E'Daphne cneorum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'171', E'Daphne mezereum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'172', E'Daphne sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'173', E'Deutzia amurensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'174', E'Deutzia scabra');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'175', E'Diapensia lapponica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'176', E'Diervilla lonicera');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'177', E'Diervilla sessilifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'178', E'Dryas octopetala');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'179', E'Elaeagnus commutata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'180', E'Empetrum nigrum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'181', E'Erica herbacea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'182', E'Erica tetralix');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'183', E'Euonymus alatus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'184', E'Euonymus europaeus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'185', E'Euonymus fortunei');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'186', E'Euonymus hamiltonianus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'187', E'Euonymus nanus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'188', E'Euonymus planipes');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'189', E'Euonymus sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'190', E'Exochorda racemosa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'191', E'Fagus grandifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'192', E'Fagus sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'193', E'Fagus sylvatica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'194', E'Fagus sylvatica f. purpurea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'195', E'Forsythia ovata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'196', E'Fothergilla major');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'197', E'Fraxinus americana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'198', E'Fraxinus excelsior');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'199', E'Fraxinus mandshurica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'200', E'Fraxinus nigra');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'201', E'Fraxinus pennsylvanica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'202', E'Fraxinus sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'203', E'Genista tinctoria');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'204', E'Ginkgo biloba');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'205', E'Gleditsia triacanthos');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'206', E'Halesia carolina');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'207', E'Hamamelis virginiana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'208', E'Hedera helix');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'209', E'Hippophaë rhamnoides');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'210', E'Holodiscus discolor');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'211', E'Hydrangea anomala');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'212', E'Hydrangea anomala subsp. petiolaris');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'213', E'Hydrangea arborescens');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'214', E'Hydrangea heteromalla ''Bretschneideri''');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'215', E'Hydrangea paniculata ''Grandiflora''');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'216', E'Hydrangea sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'217', E'Ilex verticillata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'218', E'Jamesia americana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'219', E'Juglans ailanthifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'220', E'Juglans cinerea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'221', E'Juglans mandshurica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'222', E'Juglans nigra');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'223', E'Juglans sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'224', E'Juniperus chinensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'225', E'Juniperus communis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'226', E'Juniperus communis subsp. alpina');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'227', E'Juniperus horizontalis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'228', E'Juniperus sabina');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'229', E'Juniperus sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'230', E'Juniperus squamata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'231', E'Juniperus virginiana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'232', E'Kalmia angustifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'233', E'Kalmia latifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'234', E'Kalmia polifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'235', E'Kalmia sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'236', E'Kerria japonica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'237', E'Kolkwitzia amabilis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'238', E'Laburnum ×watereri');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'239', E'Laburnum alpinum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'240', E'Larix ×marschlinsii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'241', E'Larix decidua');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'242', E'Larix decidua subsp. polonica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'243', E'Larix gmelinii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'244', E'Larix gmelinii var. gmelinii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'245', E'Larix gmelinii var. japonica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'246', E'Larix gmelinii var. olgensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'247', E'Larix gmelinii var. principis-rupprechtii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'248', E'Larix kaempferi');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'249', E'Larix laricina');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'250', E'Larix lyallii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'251', E'Larix occidentalis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'252', E'Larix sibirica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'253', E'Larix sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'254', E'Ledum palustre');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'255', E'Ligustrum vulgare');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'256', E'Linnaea borealis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'257', E'Liquidambar styraciflua');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'258', E'Liriodendron tulipifera');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'259', E'Loiseleuria procumbens');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'260', E'Lonicera ×bella');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'261', E'Lonicera ×brownii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'262', E'Lonicera ×notha');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'263', E'Lonicera ×xylosteoides');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'264', E'Lonicera albertii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'265', E'Lonicera alpigena');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'266', E'Lonicera caerulea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'267', E'Lonicera caprifolium');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'268', E'Lonicera caucasica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'269', E'Lonicera chrysantha');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'270', E'Lonicera involucrata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'271', E'Lonicera maackii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'272', E'Lonicera nigra');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'273', E'Lonicera periclymenum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'274', E'Lonicera sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'275', E'Lonicera tatarica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'276', E'Lonicera xylosteum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'277', E'Maackia amurensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'278', E'Magnolia acuminata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'279', E'Magnolia kobus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'280', E'Magnolia sieboldii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'281', E'Magnolia sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'282', E'Mahonia aquifolium');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'283', E'Malus baccata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'284', E'Malus domestica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'285', E'Malus prunifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'286', E'Malus sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'287', E'Malus sylvestris');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'288', E'Malus toringo');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'289', E'Malus toringo var. sargentii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'290', E'Menispermum canadense');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'291', E'Menispermum dauricum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'292', E'Metasequoia glyptostroboides');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'293', E'Microbiota decussata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'294', E'Myrica gale');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'295', E'Myricaria germanica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'296', E'Oplopanax horridus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'297', E'Ostrya carpinifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'298', E'Pachysandra terminalis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'299', E'Parthenocissus inserta');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'300', E'Parthenocissus quinquefolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'301', E'Paxistima myrtifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'302', E'Phellodendron amurense');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'303', E'Philadelphus ×lemoinei');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'304', E'Philadelphus ×virginalis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'305', E'Philadelphus coronarius');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'306', E'Philadelphus lewisii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'307', E'Philadelphus lewisii var. gordonianus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'308', E'Philadelphus pubescens');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'309', E'Philadelphus sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'310', E'Phyllodoce caerulea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'311', E'Physocarpus opulifolius');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'312', E'Picea ×lutzii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'313', E'Picea abies');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'314', E'Picea abies f. aurea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'315', E'Picea abies f. condensata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'316', E'Picea abies f. cruenta');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'317', E'Picea abies f. globosa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'318', E'Picea abies f. nana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'319', E'Picea abies f. nidiformis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'320', E'Picea abies f. pendula');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'321', E'Picea abies f. tabulaeformis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'322', E'Picea abies f. variegata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'323', E'Picea abies f. viminalis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'324', E'Picea abies f. virgata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'325', E'Picea abies subsp. abies');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'326', E'Picea abies subsp. obovata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'327', E'Picea asperata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'328', E'Picea engelmannii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'329', E'Picea glauca');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'330', E'Picea glauca var. albertiana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'331', E'Picea glehnii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'332', E'Picea jezoënsis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'333', E'Picea koraiensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'334', E'Picea likiangensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'335', E'Picea mariana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'336', E'Picea omorika');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'337', E'Picea pungens');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'338', E'Picea retroflexa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'339', E'Picea rubens');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'340', E'Picea schrenkiana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'341', E'Picea sitchensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'342', E'Picea sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'343', E'Pieris floribunda');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'344', E'Pinus banksiana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'345', E'Pinus cembra');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'346', E'Pinus cembra subsp. cembra');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'347', E'Pinus cembra subsp. sibirica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'348', E'Pinus contorta');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'349', E'Pinus contorta var. contorta');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'350', E'Pinus contorta var. latifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'351', E'Pinus koraiensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'352', E'Pinus monticola');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'353', E'Pinus mugo');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'354', E'Pinus mugo subsp. uncinata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'355', E'Pinus nigra');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'356', E'Pinus peuce');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'357', E'Pinus ponderosa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'358', E'Pinus pumila');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'359', E'Pinus resinosa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'360', E'Pinus sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'361', E'Pinus strobus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'362', E'Pinus sylvestris');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'363', E'Pinus sylvestris f. aurea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'364', E'Pinus sylvestris f. condensata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'365', E'Pinus sylvestris f. globosa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'366', E'Pinus sylvestris f. virgata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'367', E'Pinus sylvestris ''Globosa''');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'368', E'Populus ×canadensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'369', E'Populus ×jackii ''Gileadensis''');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'370', E'Populus ×wettsteinii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'371', E'Populus alba');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'372', E'Populus balsamifera');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'373', E'Populus balsamifera ''Tristis''');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'374', E'Populus canescens');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'375', E'Populus deltoides');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'376', E'Populus koreana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'377', E'Populus laurifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'378', E'Populus nigra');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'379', E'Populus ''Rasumowskiana''');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'380', E'Populus simonii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'381', E'Populus sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'382', E'Populus suaveolens');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'383', E'Populus tremula');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'384', E'Populus tremuloides');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'385', E'Populus trichocarpa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'386', E'Populus wilsonii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'387', E'Potentilla fruticosa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'388', E'Prunus avium');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'389', E'Prunus cerasifera');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'390', E'Prunus cerasus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'391', E'Prunus domestica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'392', E'Prunus domestica subsp. domestica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'393', E'Prunus domestica subsp. insititia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'394', E'Prunus laurocerasus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'395', E'Prunus maackii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'396', E'Prunus maximowiczii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'397', E'Prunus padus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'398', E'Prunus pensylvanica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'399', E'Prunus prostrata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'400', E'Prunus pumila');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'401', E'Prunus sargentii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'402', E'Prunus serotina');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'403', E'Prunus sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'404', E'Prunus spinosa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'405', E'Prunus tenella');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'406', E'Prunus tomentosa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'407', E'Prunus triloba');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'408', E'Prunus virginiana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'409', E'Pseudolarix amabilis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'410', E'Pseudotsuga menziesii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'411', E'Pseudotsuga menziesii var. glauca');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'412', E'Pterocarya pterocarpa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'413', E'Pterocarya rhoifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'414', E'Pyrus communis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'415', E'Pyrus ussuriensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'416', E'Quercus coccinea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'417', E'Quercus petraea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'418', E'Quercus robur');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'419', E'Quercus rubra');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'420', E'Rhamnus cathartica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'421', E'Rhamnus frangula');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'422', E'Rhododendron ×fraseri');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'423', E'Rhododendron aureum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'424', E'Rhododendron brachycarpum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'425', E'Rhododendron brachycarpum subsp. tigerstedtii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'426', E'Rhododendron canadense');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'427', E'Rhododendron Catawbiense -ryhmä/gruppen/group');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'428', E'Rhododendron ''Cunningham''s White''');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'429', E'Rhododendron dauricum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'430', E'Rhododendron ferrugineum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'431', E'Rhododendron Kosterianum -ryhmä/gruppen/group');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'432', E'Rhododendron lapponicum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'433', E'Rhododendron luteum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'434', E'Rhododendron molle');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'435', E'Rhododendron molle subsp. japonicum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'436', E'Rhododendron schlippenbachii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'437', E'Rhododendron smirnowii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'438', E'Rhododendron sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'439', E'Rhododendron Tigerstedtii -ryhmä/gruppen/group');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'440', E'Rhus hirta');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'441', E'Ribes alpinum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'442', E'Ribes nigrum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'443', E'Ribes rubrum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'444', E'Ribes spicatum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'445', E'Ribes uva-crispa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'446', E'Robinia pseudoacacia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'447', E'Rosa acicularis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'448', E'Rosa canina');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'449', E'Rosa dumalis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'450', E'Rosa majalis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'451', E'Rosa mollis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'452', E'Rosa pimpinellifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'453', E'Rosa rugosa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'454', E'Rosa sherardii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'455', E'Rosa sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'456', E'Rubus caesius');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'457', E'Rubus idaeus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'458', E'Rubus odoratus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'459', E'Rubus parviflorus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'460', E'Rubus pruinosus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'461', E'Rubus sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'462', E'Salix alba');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'463', E'Salix arbutifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'464', E'Salix aurita');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'465', E'Salix borealis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'466', E'Salix caprea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'467', E'Salix cinerea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'468', E'Salix daphnoides');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'469', E'Salix daphnoides subsp. acutifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'470', E'Salix daphnoides subsp. daphnoides');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'471', E'Salix fragilis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'472', E'Salix fragilis ''Bullata''');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'473', E'Salix glauca');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'474', E'Salix hastata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'475', E'Salix herbacea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'476', E'Salix lanata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'477', E'Salix lapponum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'478', E'Salix lucida');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'479', E'Salix myrsinifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'480', E'Salix myrsinites');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'481', E'Salix myrtilloides');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'482', E'Salix pentandra');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'483', E'Salix phylicifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'484', E'Salix polaris');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'485', E'Salix purpurea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'486', E'Salix pyrolifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'487', E'Salix repens');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'488', E'Salix reticulata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'489', E'Salix rosmarinifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'490', E'Salix ''Sibirica''');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'491', E'Salix sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'492', E'Salix starkeana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'493', E'Salix triandra');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'494', E'Salix viminalis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'495', E'Sambucus canadensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'496', E'Sambucus nigra');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'497', E'Sambucus racemosa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'498', E'Sambucus sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'499', E'Schisandra chinensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'500', E'Sequoia sempervirens');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'501', E'Sequoiadendron giganteum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'502', E'Solanum dulcamara');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'503', E'Sorbaria grandiflora');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'504', E'Sorbaria sorbifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'505', E'Sorbaria sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'506', E'Sorbus ×thuringiaca ''Fastigiata''');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'507', E'Sorbus alnifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'508', E'Sorbus americana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'509', E'Sorbus aria');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'510', E'Sorbus aucuparia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'511', E'Sorbus commixta');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'512', E'Sorbus hybrida');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'513', E'Sorbus intermedia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'514', E'Sorbus koehneana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'515', E'Sorbus prattii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'516', E'Sorbus scopulina');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'517', E'Sorbus sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'518', E'Sorbus teodori');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'519', E'Sorbus torminalis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'520', E'Spiraea ×cinerea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'521', E'Spiraea ×multiflora');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'522', E'Spiraea ×rosalba');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'523', E'Spiraea ×sanssouciana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'524', E'Spiraea ×vanhouttei');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'525', E'Spiraea alba');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'526', E'Spiraea ''Arguta''');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'527', E'Spiraea betulifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'528', E'Spiraea Billiardii -ryhmä/gruppen/group');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'529', E'Spiraea cana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'530', E'Spiraea chamaedryfolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'531', E'Spiraea douglasii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'532', E'Spiraea fritschiana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'533', E'Spiraea ''Grefsheim''');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'534', E'Spiraea hypericifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'535', E'Spiraea japonica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'536', E'Spiraea ''Margaritae''');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'537', E'Spiraea media');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'538', E'Spiraea nipponica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'539', E'Spiraea rosthornii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'540', E'Spiraea salicifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'541', E'Spiraea sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'542', E'Spiraea tomentosa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'543', E'Spiraea trichocarpa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'544', E'Spiraea trilobata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'545', E'Stephanandra incisa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'546', E'Symphoricarpos albus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'547', E'Symphoricarpos albus var. laevigatus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'548', E'Syringa ×chinensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'549', E'Syringa ×henryi');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'550', E'Syringa ×josiflexa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'551', E'Syringa ×nanceana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'552', E'Syringa ×swegiflexa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'553', E'Syringa josikaea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'554', E'Syringa Preston -ryhmä/gruppen/group');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'555', E'Syringa reflexa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'556', E'Syringa reticulata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'557', E'Syringa sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'558', E'Syringa sweginowii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'559', E'Syringa tigerstedtii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'560', E'Syringa tomentella');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'561', E'Syringa villosa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'562', E'Syringa wolfii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'563', E'Syringa vulgaris');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'564', E'Tamarix pentandra');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'565', E'Taxus ×media');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'566', E'Taxus baccata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'567', E'Taxus brevifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'568', E'Taxus cuspidata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'569', E'Taxus sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'570', E'Thuja koraiensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'571', E'Thuja occidentalis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'572', E'Thuja plicata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'573', E'Thuja sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'574', E'Thuja standishii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'575', E'Thujopsis dolabrata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'576', E'Tilia ×moltkei');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'577', E'Tilia ×vulgaris');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'578', E'Tilia americana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'579', E'Tilia cordata');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'580', E'Tilia euchlora');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'581', E'Tilia japonica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'582', E'Tilia mongolica');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'583', E'Tilia platyphyllos');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'584', E'Tilia sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'585', E'Tilia tomentosa');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'586', E'Tripterygium regelii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'587', E'Tsuga canadensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'588', E'Tsuga caroliniana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'589', E'Tsuga diversifolia');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'590', E'Tsuga heterophylla');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'591', E'Tsuga mertensiana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'592', E'Tsuga sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'593', E'Ulmus americana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'594', E'Ulmus glabra');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'595', E'Ulmus laevis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'596', E'Ulmus minor');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'597', E'Ulmus pumila');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'598', E'Ulmus sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'599', E'Vaccinium corymbosum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'600', E'Vaccinium microcarpum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'601', E'Vaccinium myrtillus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'602', E'Vaccinium oxycoccos');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'603', E'Vaccinium sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'604', E'Vaccinium uliginosum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'605', E'Vaccinium vitis-idaea');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'606', E'Weigela Florida -ryhmä/gruppen/group');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'607', E'Weigela middendorffiana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'608', E'Weigela praecox');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'609', E'Weigela sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'610', E'Viburnum carlesii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'611', E'Viburnum cassinoides');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'612', E'Viburnum dentatum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'613', E'Viburnum dentatum var. lucidum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'614', E'Viburnum lantana');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'615', E'Viburnum lentago');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'616', E'Viburnum opulus');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'617', E'Viburnum rafinesquianum');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'618', E'Viburnum sargentii');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'619', E'Viburnum sp');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'620', E'Vinca minor');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'621', E'Vitis amurensis');
-- ddl-end --
INSERT INTO koodistot.puulaji (id, selite) VALUES (E'622', E'Vitis riparia');
-- ddl-end --

-- object: koodistot.ymparistotaidetyyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.ymparistotaidetyyppi CASCADE;
CREATE TABLE koodistot.ymparistotaidetyyppi (
	id serial NOT NULL,
	selite text,
	CONSTRAINT ymparistotaidetyyppi_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.ymparistotaidetyyppi OWNER TO infrao_admin;
-- ddl-end --

INSERT INTO koodistot.ymparistotaidetyyppi (id, selite) VALUES (E'1', E'kivi');
-- ddl-end --
INSERT INTO koodistot.ymparistotaidetyyppi (id, selite) VALUES (E'2', E'maakivet');
-- ddl-end --
INSERT INTO koodistot.ymparistotaidetyyppi (id, selite) VALUES (E'3', E'paasikivi');
-- ddl-end --
INSERT INTO koodistot.ymparistotaidetyyppi (id, selite) VALUES (E'4', E'patsas/muistomerkki');
-- ddl-end --
INSERT INTO koodistot.ymparistotaidetyyppi (id, selite) VALUES (E'5', E'puistoveistokset');
-- ddl-end --
INSERT INTO koodistot.ymparistotaidetyyppi (id, selite) VALUES (E'6', E'rantakiveys');
-- ddl-end --
INSERT INTO koodistot.ymparistotaidetyyppi (id, selite) VALUES (E'7', E'muu');
-- ddl-end --
INSERT INTO koodistot.ymparistotaidetyyppi (id, selite) VALUES (E'8', E'ei tiedossa');
-- ddl-end --

-- object: kohteet.kaluste | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.kaluste CASCADE;
CREATE TABLE kohteet.kaluste (
	id serial NOT NULL,
	kalustetyyppi_id integer NOT NULL,
-- 	malli text,
-- 	perusparannusvuosi smallint,
-- 	suunta text,
-- 	valmistaja text,
-- 	valmistumisvuosi smallint,
-- 	kuuluuviheralueenosaan integer,
-- 	kuuluukatualueenosaan integer,
-- 	materiaali_id integer,
-- 	suunnitelmalinkkitieto integer,
-- 	geom_poly geometry(POLYGON, 3067),
-- 	geom_piste geometry(POINT, 3067),
-- 	geom_line geometry(LINESTRING, 3067),
-- 	name text,
-- 	metatieto text,
-- 	yksilointitieto text,
-- 	alkuhetki date,
-- 	loppuhetki date,
	CONSTRAINT kaluste_pk PRIMARY KEY (id)
)
 INHERITS(abstraktit.abstractvaruste);
-- ddl-end --
ALTER TABLE kohteet.kaluste OWNER TO infrao_admin;
-- ddl-end --

-- object: koodistot.kantavuusluokkatyyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.kantavuusluokkatyyppi CASCADE;
CREATE TABLE koodistot.kantavuusluokkatyyppi (
	id serial NOT NULL,
	selite text,
	CONSTRAINT kantavuusluokkatyyppi_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.kantavuusluokkatyyppi OWNER TO infrao_admin;
-- ddl-end --

INSERT INTO koodistot.kantavuusluokkatyyppi (id, selite) VALUES (E'1', E'A');
-- ddl-end --
INSERT INTO koodistot.kantavuusluokkatyyppi (id, selite) VALUES (E'2', E'B');
-- ddl-end --
INSERT INTO koodistot.kantavuusluokkatyyppi (id, selite) VALUES (E'3', E'C');
-- ddl-end --
INSERT INTO koodistot.kantavuusluokkatyyppi (id, selite) VALUES (E'4', E'D');
-- ddl-end --
INSERT INTO koodistot.kantavuusluokkatyyppi (id, selite) VALUES (E'5', E'E');
-- ddl-end --
INSERT INTO koodistot.kantavuusluokkatyyppi (id, selite) VALUES (E'6', E'F');
-- ddl-end --
INSERT INTO koodistot.kantavuusluokkatyyppi (id, selite) VALUES (E'7', E'G');
-- ddl-end --

-- object: koodistot.kasvilaji | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.kasvilaji CASCADE;
CREATE TABLE koodistot.kasvilaji (
	id serial NOT NULL,
	selite text,
	CONSTRAINT kasvilaji_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.kasvilaji OWNER TO infrao_admin;
-- ddl-end --

INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1', E'Acanthopanax senticosus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'2', E'Acer campestre');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'3', E'Acer ginnala');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'4', E'Acer spicatum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'5', E'Acer tataricum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'6', E'Acer');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'7', E'Achillea filipendulina');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'8', E'Achillea millefolium');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'9', E'Achillea ptarmica ''Flore pleno');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'10', E'Achillea ptarmica');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'11', E'Aconitum henryi');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'12', E'Aconitum lycoctonum ssp septentrionale');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'13', E'Aconitum lycoctonum ssp.lycoctonum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'14', E'Aconitum lycoctonum ssp.neapolitanum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'15', E'Aconitum napellus album');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'16', E'Aconitum napellus ssp. lusitanicum ''Newry Blue''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'17', E'Aconitum napellus ssp. lusitanicum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'18', E'Aconitum x stoerkianum ''Bicolor''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'19', E'Aconitum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'20', E'Aconitun x stoerkianum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'21', E'Aconogonon alpinum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'22', E'Aconogonon divaricatum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'23', E'Aconogonon polystachyum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'24', E'Aconogonon weyrichii');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'25', E'Acorus calamus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'26', E'Actaea erythrocarpa');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'27', E'Actinidia kolomikta');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'28', E'Adonis vernalis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'29', E'Aegopodium podagraria');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'30', E'Agapanthus campanulatus ''Blue Giant''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'31', E'Agastache foeniculum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'32', E'Aguilegia x hybr. ''McKana''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'33', E'Ajuga pyramidalis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'34', E'Ajuga reptans ''Atropurpurea''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'35', E'Ajuga reptans');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'36', E'Alcea rosea');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'37', E'Alchemilla alpina');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'38', E'Alchemilla mollis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'39', E'Alisma plantago-aquatica');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'40', E'Allium aflatunense');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'41', E'Allium atropurpureum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'42', E'Allium caeruleum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'43', E'Allium carinatum subsp. pulchellum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'44', E'Allium cernuum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'45', E'Allium christophii');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'46', E'Allium cyaneum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'47', E'Allium fistulosum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'48', E'Allium giganteum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'49', E'Allium karataviense');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'50', E'Allium moly');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'51', E'Allium narcissiflorum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'52', E'Allium nigrum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'53', E'Allium porrum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'54', E'Allium rosenbachianum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'55', E'Allium sativum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'56', E'Allium schoeneprasum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'57', E'Allium sphaerocephalum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'58', E'Allium tuberosum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'59', E'Allium ursinum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'60', E'Alnus viridis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'61', E'Alopecurus pratensis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'62', E'Amelanchier alnifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'63', E'Amelanchier laevis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'64', E'Amelanchier lamarckii');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'65', E'Amelanchier spicata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'66', E'Amelanchier');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'67', E'Anaphalis margaritacea');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'68', E'Anaphalis triplinervis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'69', E'Anchusa angustissima');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'70', E'Anchusa azurea');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'71', E'Andromeda polifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'72', E'Anemone canadensis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'73', E'Anemone hupehensis var. japonica');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'74', E'Anemone multifida');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'75', E'Anemone narcissiflora');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'76', E'Anemone nemorosa');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'77', E'Anemone rivularis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'78', E'Anemone sylvestris');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'79', E'Anemone tomentosa');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'80', E'Anemone x fulgens');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'81', E'Anemone x lesseri');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'82', E'Anethum graveolens');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'83', E'Angelica archangelica');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'84', E'Antchriscus cerefolium');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'85', E'Antemis marchalliana');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'86', E'Antennaria dioica ''Rubra''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'87', E'Antennaria dioica');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'88', E'Antennaria parvifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'89', E'Antennaria plantaginifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'90', E'Anthemis carpatica');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'91', E'Anthemis tinctoria');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'92', E'Anthericum liliago');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'93', E'Anthericum ramosum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'94', E'Anthyllis vulneraria');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'95', E'Apium var. dulce');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'96', E'Aquilegia alpina');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'97', E'Aquilegia chrysantha');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'98', E'Aquilegia flabellata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'99', E'Aquilegia formosa');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'100', E'Aquilegia glandulosa var. jucunda');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'101', E'Aquilegia skinneri');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'102', E'Aquilegia vulgaris ''Alba''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'103', E'Aquilegia vulgaris ''Altrosa''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'104', E'Aquilegia vulgaris ''Rosea''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'105', E'Aquilegia vulgaris');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'106', E'Aquilegia x hybr. ''Blue Star''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'107', E'Aquilegia x hybr. ''Crimson Star''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'108', E'Aquilegia x hybr. ''Snow Queen''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'109', E'Aquilegia x hybr.');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'110', E'Arabis blepharophylla');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'111', E'Arabis caucasica');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'112', E'Arabis ferdinandi-coburgi');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'113', E'Arabis x arendsii');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'114', E'Arctostaphylos uva-ursi');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'115', E'Arenaria balearica');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'116', E'Arenaria montana');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'117', E'Arenaria tetraquerta');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'118', E'Aristolochia macrophylla');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'119', E'Aristolochia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'120', E'Armeria juniperifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'121', E'Armeria maritima');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'122', E'Arnica montana');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'123', E'Arnica sachalinensis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'124', E'Aronia arbutifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'125', E'Aronia melanocarpa ''Glorie''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'126', E'Aronia melanocarpa');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'127', E'Aronia mitschurinii ''Viking''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'128', E'Aronia mitschurinii');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'129', E'Aronia x prunifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'130', E'Aronia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'131', E'Artemisia absinthium');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'132', E'Artemisia arbotanum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'133', E'Artemisia dracunculus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'134', E'Artemisia lactiflora');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'135', E'Artemisia ludoviciana');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'136', E'Artemisia maritima');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'137', E'Artemisia schmidtiana ''Nana''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'138', E'Artemisia schmidtiana');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'139', E'Artemisia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'140', E'Arum italicum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'141', E'Arum maculatum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'142', E'Aruncus aethusifolius');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'143', E'Aruncus dioicus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'144', E'Aruncus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'145', E'Asarum canadense');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'146', E'Asarum europaeum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'147', E'Asparagus officinalis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'148', E'Asperula orientalis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'149', E'Aster alpinus ''Abendschein''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'150', E'Aster alpinus ''Albus''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'151', E'Aster alpinus ''Blue Star''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'152', E'Aster alpinus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'153', E'Aster amellus ''Blue King''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'154', E'Aster amellus ''Danzig''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'155', E'Aster amellus ''King George''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'156', E'Aster amellus ''Rudolf Goethe''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'157', E'Aster amellus ''Sonia''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'158', E'Aster amellus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'159', E'Aster dumosus ''Starlight''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'160', E'Aster dumosus ''Waldenberg''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'161', E'Aster novi-belgii ''Dauerblau''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'162', E'Aster novi-belgii ''Eventide''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'163', E'Aster novi-belgii ''Red Sunset''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'164', E'Aster novi-belgii ''White Ladies''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'165', E'Aster novi-belgii ''Winston Churchill''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'166', E'Aster x alpellus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'167', E'Astilbe Arendsii -hybr. ''Federsee''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'168', E'Astilbe Arendsii-hybr. ''Amethyst''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'169', E'Astilbe Arendsii-hybr. ''Bonn''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'170', E'Astilbe Arendsii-hybr. ''Brautschleier''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'171', E'Astilbe Arendsii-hybr. ''Bremen''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'172', E'Astilbe Arendsii-hybr. ''Cattleya''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'173', E'Astilbe Arendsii-hybr. ''Deutschland''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'174', E'Astilbe Arendsii-hybr. ''Erika''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'175', E'Astilbe Arendsii-hybr. ''Etna''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'176', E'Astilbe Arendsii-hybr. ''Europa''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'177', E'Astilbe Arendsii-hybr. ''Fanal''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'178', E'Astilbe Arendsii-hybr. ''Feuer''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'179', E'Astilbe Arendsii-hybr. ''Gladstone''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'180', E'Astilbe Arendsii-hybr. ''Gloria Purpurea''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'181', E'Astilbe Arendsii-hybr. ''Gloria''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'182', E'Astilbe Arendsii-hybr. ''Glut''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'183', E'Astilbe Arendsii-hybr. ''Hyasinth''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'184', E'Astilbe Arendsii-hybr. ''Irrlicht''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'185', E'Astilbe Arendsii-hybr. ''Montgomery''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'186', E'Astilbe Arendsii-hybr. ''Peach Blossom''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'187', E'Astilbe Arendsii-hybr. ''Red Sentinel''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'188', E'Astilbe Arendsii-hybr. ''Rheinland''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'189', E'Astilbe Arendsii-hybr. ''Spinelli''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'190', E'Astilbe Arendsii-hybr. ''Straussenf.''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'191', E'Astilbe Arendsii-hybr. ''Weisse Gloria''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'192', E'Astilbe Arendsii-hybr.');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'193', E'Astilbe chinensis ''Finale''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'194', E'Astilbe chinensis ''Pumila''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'195', E'Astilbe chinensis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'196', E'Astilbe Japonica-ryhmä');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'197', E'Astilbe');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'198', E'Astilboides tabularis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'199', E'Astrantia major');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'200', E'Athyrium filix-femina');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'201', E'Athyrium niponicum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'202', E'Aubrieta deltoidea');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'203', E'Aubrieta x cultorum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'204', E'Azalea mollis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'205', E'Bellis perennis ''Purpurmandel''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'206', E'Bellis perennis ''Rosa''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'207', E'Bellis perennis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'208', E'Berberis thunbergii ''Admiration''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'209', E'Berberis thunbergii ''Atropurpurea nana''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'210', E'Berberis thunbergii ''Atropurpurea''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'211', E'Berberis thunbergii');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'212', E'Berberis vulgaris ''Atropurpurea''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'213', E'Berberis vulgaris');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'214', E'Berberis x ottawensis ''Superba''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'215', E'Berberis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'216', E'Bergenia cordifolia ''Rotblom''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'217', E'Bergenia cordifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'218', E'Bergenia crassifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'219', E'Bergenia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'220', E'Bistorta affinis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'221', E'Bistorta major ''Superba''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'222', E'Bistorta major');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'223', E'Borago officinalis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'224', E'Brunnera macrophylla');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'225', E'Butomus umbellatus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'226', E'Calamagrostis epigejos');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'227', E'Calendula officinalis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'228', E'Calla palustris');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'229', E'Calluna vulgaris');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'230', E'Caltha palustris');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'231', E'Campanula carpatica ''Blaue Clips''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'232', E'Campanula carpatica ''Weisse Clips''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'233', E'Campanula carpatica');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'234', E'Campanula glomerata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'235', E'Campanula latifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'236', E'Campanula patula');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'237', E'Campanula persicifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'238', E'Campanula portenschlagiana');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'239', E'Campanula rapunculoides');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'240', E'Campanula rotundifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'241', E'Caragana arborescens ''Lorbergii Pendula''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'242', E'Caragana arborescens ''Lorbergii''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'243', E'Caragana arborescens ''Walker''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'244', E'Caragana arborescens');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'245', E'Caragana frutex');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'246', E'Caragana');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'247', E'Carex acuta');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'248', E'Carex brunnea');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'249', E'Carex nigra');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'250', E'Carex ovalis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'251', E'Carex pseudocyperus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'252', E'Carex rhynchophysa');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'253', E'Carex rostrata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'254', E'Carex vesicaria');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'255', E'Carum carvi');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'256', E'Celastrus orbiculatus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'257', E'Celastrus scandens ''Autumn Revolution''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'258', E'Centaurea cyanus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'259', E'Centaurea montana');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'260', E'Centaurea');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'261', E'Centranthus ruber');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'262', E'Cerastium tomentosum ''Columnae''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'263', E'Cerastium tomentosum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'264', E'Cercidiphyllum japonicum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'265', E'Chaenomeles japonica');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'266', E'Chamaecyparis lawsoniana ''Alumii''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'267', E'Chamaecyparis pisifera');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'268', E'Chelone obliqua');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'269', E'Chiastophyllum oppositifolium');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'270', E'Chimaphila umbellata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'271', E'Chrysanthemum leucanthemum ''Maikönigin''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'272', E'Chrysanthemum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'273', E'Cimicifuga racemosa var. cordifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'274', E'Claytonia sibirica');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'275', E'Clematis alpina');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'276', E'Clematis integrif. ''Blue Panno''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'277', E'Clematis ''Nadezda''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'278', E'Clematis ''Niobe''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'279', E'Clematis ''Paul Farges''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'280', E'Clematis recta');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'281', E'Clematis sibirica');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'282', E'Clematis tangutica');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'283', E'Clematis viticella');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'284', E'Clematis x jackmanii');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'285', E'Colchicum autumnale');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'286', E'Colchicum bommuelleri');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'287', E'Colchicum cilicicum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'288', E'Colchicum hybridum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'289', E'Colchicum speciosum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'290', E'Comarum palustre');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'291', E'Convallaria majalis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'292', E'Coreopsis grandiflora');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'293', E'Coreopsis verticillata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'294', E'Coriandrum sativum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'295', E'Cornus alba ''Argenteomarginata''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'296', E'Cornus alba ''Gouchaultii''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'297', E'Cornus alba ''Kesselringii''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'298', E'Cornus alba ''Sibirica Variegata''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'299', E'Cornus alba ''Sibirica''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'300', E'Cornus alba ssp.alba');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'301', E'Cornus alba ssp.stolonifera ''Flaviramea''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'302', E'Cornus alba stolonifera ''Kelsey''s Dwarf');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'303', E'Cornus sanguinea');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'304', E'Cornus sericea ''Bailadeline''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'305', E'Cornus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'306', E'Coronilla varia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'307', E'Corydalis lutea');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'308', E'Corydalis nobilis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'309', E'Corydalis solida');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'310', E'Corylus avellana ''Contorta''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'311', E'Corylus avellana');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'312', E'Cotoneaster dammerii');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'313', E'Cotoneaster integerrimus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'314', E'Cotoneaster lucidus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'315', E'Cotoneaster ''Skogsholm''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'316', E'Cotoneaster');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'317', E'Crataegus douglasii');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'318', E'Crataegus grayana');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'319', E'Crataegus intricata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'320', E'Crataegus laevigata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'321', E'Crataegus monogyna');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'322', E'Crataegus sp.');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'323', E'Crataegus submollis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'324', E'Crataegus x media ''Paul''s Scarlet''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'325', E'Crataegus x mordenensis ''Toba''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'326', E'Crocus ancyrensis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'327', E'Crocus angustifolius');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'328', E'Crocus chrysanthus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'329', E'Crocus corsicus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'330', E'Crocus etruscus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'331', E'Crocus laevigatus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'332', E'Crocus speciosus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'333', E'Crocus tommasinianus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'334', E'Crocus vernus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'335', E'Cymbalaria muralis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'336', E'Cytisus decumbens');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'337', E'Cytisus glaber');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'338', E'Cytisus purpureus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'339', E'Daphne mezereum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'340', E'Darmera peltata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'341', E'Dasiphora fruticosa ''Abbotswood''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'342', E'Dasiphora fruticosa ''Elizabeth''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'343', E'Dasiphora fruticosa ''Floppy Disk''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'344', E'Dasiphora fruticosa ''Fridhem''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'345', E'Dasiphora fruticosa ''Goldfinger''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'346', E'Dasiphora fruticosa ''Goldteppic''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'347', E'Dasiphora fruticosa ''Hacemann''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'348', E'Dasiphora fruticosa ''Jackman''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'349', E'Dasiphora fruticosa ''Kobold''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'350', E'Dasiphora fruticosa ''Longacre''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'351', E'Dasiphora fruticosa ''Lovely Pink''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'352', E'Dasiphora fruticosa ''Mount Everest''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'353', E'Dasiphora fruticosa ''Månelys''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'354', E'Dasiphora fruticosa ''Primrose Beauty''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'355', E'Dasiphora fruticosa ''Princess''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'356', E'Dasiphora fruticosa ''Red Ace''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'357', E'Dasiphora fruticosa ''Sandved''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'358', E'Dasiphora fruticosa ''Snow Flake''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'359', E'Dasiphora fruticosa ''Tervola''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'360', E'Dasiphora fruticosa ''Tilford Cream''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'361', E'Dasiphora fruticosa');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'362', E'Delphinium ''Astolat''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'363', E'Delphinium ''Black Knight''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'364', E'Delphinium ''Blue Beauty''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'365', E'Delphinium ''Blue Bird''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'366', E'Delphinium ''Galahad''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'367', E'Delphinium ''King Arthur''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'368', E'Deschampsia flexuosa');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'369', E'Dianthus barbatus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'370', E'Dianthus deltoides');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'371', E'Dianthus gratianopolitanus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'372', E'Dianthus plumarius');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'373', E'Dicentra formosa ''Alba''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'374', E'Dicentra formosa ''Luxuriant''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'375', E'Dicentra formosa');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'376', E'Dicentra spectabilis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'377', E'Dictamnus albus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'378', E'Diervilla lonicera ''Helo''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'379', E'Diervilla lonicera');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'380', E'Diervilla sessilifolia ''Cool Splash''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'381', E'Diervilla sessilifolia ''Kajo''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'382', E'Diervilla sessilifolia ''Rusko''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'383', E'Diervilla sessilifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'384', E'Diervilla x splendens');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'385', E'Digitalis grandiflora');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'386', E'Digitalis purpurea');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'387', E'Doronicum orientale ''Finesse''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'388', E'Doronicum orientale');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'389', E'Doronicum plantagineum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'390', E'Doronicum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'391', E'Dracokephalum sibiricum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'392', E'Dryas octopetala');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'393', E'Dryopteris carthusiana');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'394', E'Dryopteris filix-mas');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'395', E'Dryoptreris filix-mas');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'396', E'Echinacea purpurea ''Magnus''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'397', E'Echinacea purpurea');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'398', E'Echinops bannaticus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'399', E'Empetrum nigrum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'400', E'Epimedium x rubrum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'401', E'Epimedium x youngianum ''Niveum''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'402', E'Eremurus robustus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'403', E'Erigeron ''Adria''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'404', E'Erigeron aurantiacus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'405', E'Erigeron ''Azurfee''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'406', E'Erigeron ''Grandiflorus''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'407', E'Erigeron ''Schöne Blau''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'408', E'Erigeron speciosus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'409', E'Erigeron');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'410', E'Eryngium alpinum ''Amethyst''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'411', E'Eryngium alpinum ''James Ivory''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'412', E'Eryngium alpinum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'413', E'Eryngium planum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'414', E'Euonymus europaeus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'415', E'Euonymus nanus var. turkestanicus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'416', E'Eupatorium cannabinum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'417', E'Eupatorium purpureum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'418', E'Eupatorium');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'419', E'Euphorbia cyparissias');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'420', E'Euphorbia palustris');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'421', E'Euphorbia polychroma');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'422', E'Fallopia jabonica var. compacta');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'423', E'Fallopia japonica var. compacta');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'424', E'Fallopia japonica');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'425', E'Fallopia sachalinensis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'426', E'Festuca cinerea');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'427', E'Festuca gautieri');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'428', E'Filipendula rubra');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'429', E'Filipendula ulmaria');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'430', E'Filipendula vulgaris ''Plena''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'431', E'Filipendula vulgaris ''Rosea''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'432', E'Filipendula vulgaris');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'433', E'Foeniculum vulgare var. dulce');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'434', E'Forsythia ''Northern Gold''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'435', E'Forsythia ovata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'436', E'Forsythia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'437', E'Fothergilla major ''Velho''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'438', E'Fothergilla major');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'439', E'Fritillaria imperialis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'440', E'Fritillaria meleagris');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'441', E'Galanthus elwesii');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'442', E'Galanthus nivalis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'443', E'Galium odoratum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'444', E'Galium verum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'445', E'Genista tinctoria');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'446', E'Gentiana cruciata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'447', E'Gentiana septemfida');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'448', E'Gentiana sino-ornata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'449', E'Geranium himalayense ''Derrick Cook''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'450', E'Geranium himalayense ''Gravetye''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'451', E'Geranium himalayense');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'452', E'Geranium ibericum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'453', E'Geranium ''Johnson''s Blue''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'454', E'Geranium macrorrhizum ''Purple Red''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'455', E'Geranium macrorrhizum ''Purpurrot''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'456', E'Geranium macrorrhizum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'457', E'Geranium nepalense');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'458', E'Geranium palustre');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'459', E'Geranium pratense');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'460', E'Geranium sanguineum ''Elke''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'461', E'Geranium sanguineum ''Max Frei''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'462', E'Geranium sanguineum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'463', E'Geranium sylvaticum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'464', E'Geranium x cantabrigiense ''Biokovo''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'465', E'Geranium x cantabrigiense ''Cambridge''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'466', E'Geranium x cantabrigiense ''Karmina''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'467', E'Geranium x cantabrigiense');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'468', E'Geranium x magnificum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'469', E'Geum coccineum ''Borisii''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'470', E'Geum coccineum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'471', E'Gillenia trifoliata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'472', E'Gladioulus imbricatus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'473', E'Glechoma hederacea');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'474', E'Glyceria maxima');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'475', E'Gymnocarpium dryopteris');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'476', E'Gypsophila paniculata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'477', E'Gypsophilla repens');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'478', E'Hedera helix');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'479', E'Helenium ''Grimson Beauty''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'480', E'Helenium hoopesii');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'481', E'Helenium hybrida');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'482', E'Helenium ''The Bishop''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'483', E'Helenium ''Wesergold''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'484', E'Heliopsis helianthoides v.sca. ''Goldball');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'485', E'Heliopsis helianthoides v.sca.''Goldfiede');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'486', E'Heliopsis helianthoides v.scabra ''Patula');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'487', E'Hemerocallis ''Aino''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'488', E'Hemerocallis ''Apricot''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'489', E'Hemerocallis ''Atlas''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'490', E'Hemerocallis ''Carminea''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'491', E'Hemerocallis citrina');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'492', E'Hemerocallis ''Corky''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'493', E'Hemerocallis ''Elegant Candy''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'494', E'Hemerocallis ''Entrapment''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'495', E'Hemerocallis ''Flaming Sword''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'496', E'Hemerocallis ''Frans Hals');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'497', E'Hemerocallis ''Free Wheelin''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'498', E'Hemerocallis fulva ''Europa''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'499', E'Hemerocallis fulva');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'500', E'Hemerocallis ''Golden Seapter''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'501', E'Hemerocallis ''Indian Sky''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'502', E'Hemerocallis ''Joan Senior''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'503', E'Hemerocallis ''Kantarelli''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'504', E'Hemerocallis ''Kurt''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'505', E'Hemerocallis lilio-asphodelus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'506', E'Hemerocallis ''Little Girl''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'507', E'Hemerocallis ''Margaret Perry''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'508', E'Hemerocallis middendorffii');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'509', E'Hemerocallis minor');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'510', E'Hemerocallis ''Pink Damask''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'511', E'Hemerocallis ''Radiant''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'512', E'Hemerocallis ''Rocket City''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'513', E'Hemerocallis ''Sammy Russel''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'514', E'Hemerocallis ''Sirkku''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'515', E'Hemerocallis ''Stella D''oro''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'516', E'Hemerocallis ''Tejas''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'517', E'Hemerocallis ''Valliant''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'518', E'Hemerocallis ''Watchyl Wild Indian''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'519', E'Hemerocallis ''Violet Hour''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'520', E'Hemerocallis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'521', E'Hepatica nobilis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'522', E'Heracleum mantegazzianum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'523', E'Hesperis matronalis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'524', E'Heuchera micrantha ''Palace Purple''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'525', E'Heuchera sanguinea');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'526', E'Heucherella tiarelloides');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'527', E'Hippophae rhamnoides ''Raisa''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'528', E'Hippophae rhamnoides ''Rudolf''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'529', E'Hippophaë rhamnoides');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'530', E'Holodiscus discolor');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'531', E'Hosta ''Color Festival''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'532', E'Hosta crispula');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'533', E'Hosta Fortunei ''Albopicta''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'534', E'Hosta Fortunei ''Aurea''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'535', E'Hosta Fortunei ''Francee''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'536', E'Hosta Fortunei ''Patriot''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'537', E'Hosta Fortunei');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'538', E'Hosta lancifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'539', E'Hosta ''Orange Marmalade''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'540', E'Hosta plantaginea ''Grandiflora''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'541', E'Hosta plantaginea');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'542', E'Hosta rectifolia ''Tallboy''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'543', E'Hosta rectifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'544', E'Hosta sieboldiana ''Elegans''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'545', E'Hosta sieboldiana ''Reykjavik''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'546', E'Hosta sieboldiana');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'547', E'Hosta sieboldii ''Alba''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'548', E'Hosta sieboldii');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'549', E'Hosta undulata ''Albomarginata''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'550', E'Hosta undulata ''Crispum''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'551', E'Hosta undulata ''Erromena''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'552', E'Hosta undulata ''Mediovariegata''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'553', E'Hosta undulata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'554', E'Hosta ventricosa ''Aureomaculata''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'555', E'Hosta ventricosa ''Variegata''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'556', E'Hosta ventricosa');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'557', E'Hosta');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'558', E'Humulus lupulus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'559', E'Hyacinthus orientalis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'560', E'Hydrangea anomala ssp. petiolaris');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'561', E'Hydrangea arborescens ''Annabelle''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'562', E'Hydrangea arborescens ''Grandiflora''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'563', E'Hydrangea heteromalla');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'564', E'Hydrangea paniculata ''Early Sensation''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'565', E'Hydrangea paniculata ''Grandiflora''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'566', E'Hydrangea paniculata ''Mustila''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'567', E'Hydrangea paniculata ''Praecox''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'568', E'Hydrangea paniculata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'569', E'Hyssopus officinalis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'570', E'Iberis semperfirens');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'571', E'Incarvillea mairei');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'572', E'Inula ensifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'573', E'Inula helenium');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'574', E'Iris ''Azurea''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'575', E'Iris barbata elatior ''Joanna''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'576', E'Iris Barbata-hybrida ´Pastel Charme´');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'577', E'Iris Barbata-hybrida');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'578', E'Iris ''Cyanea''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'579', E'Iris ''Eleanor Roosevelt''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'580', E'Iris ''Empress of India''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'581', E'Iris ensata ''Higo Stain''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'582', E'Iris ensata ''Nippon''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'583', E'Iris ''Espada''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'584', E'Iris germanica ''Helge''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'585', E'Iris germanica ''Snow Queen''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'586', E'Iris germanica');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'587', E'Iris orentalis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'588', E'Iris orientalis ''Aloa''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'589', E'Iris pseudacorus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'590', E'Iris pumila');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'591', E'Iris reticulata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'592', E'Iris ''Romance''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'593', E'Iris setosa');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'594', E'Iris sibirica alba');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'595', E'Iris sibirica ''Blue King''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'596', E'Iris sibirica ''Blue Moon''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'597', E'Iris sibirica ''Ceasar''s Brother''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'598', E'Iris sibirica ''Heavenly Blue''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'599', E'Iris sibirica ''Julius''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'600', E'Iris sibirica ''Marja-Leena''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'601', E'Iris sibirica ''Perry Blue''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'602', E'Iris sibirica ''Ruffled Velvet''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'603', E'Iris sibirica ''Snow Queen''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'604', E'Iris sibirica ''Thunkhannock''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'605', E'Iris sibirica');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'606', E'Iris ''Terry''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'607', E'Iris ''White Knight''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'608', E'Juncus conglomeratus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'609', E'Juncus effusus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'610', E'Juniperus chinensis ''Mint Julep''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'611', E'Juniperus chinensis ''Pfitzeriana Compact');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'612', E'Juniperus communis ''Hongisto 13''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'613', E'Juniperus communis ''Jääkäri''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'614', E'Juniperus communis ''Norrback''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'615', E'Juniperus communis ''Repanda''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'616', E'Juniperus communis ''Sisu''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'617', E'Juniperus communis ''Suecica''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'618', E'Juniperus communis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'619', E'Juniperus horizontalis ''Glauca''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'620', E'Juniperus sabina ''Tamarischifolia''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'621', E'Juniperus sabina');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'622', E'Juniperus squamata ''Meyeri''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'623', E'Juniperus virginiana ''Sky Rocket''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'624', E'Kalmia angustifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'625', E'Kalmia latifolia ''Peppermint''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'626', E'Kalmia polifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'627', E'Kolkwitzia amabilis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'628', E'Laburnum alpinum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'629', E'Lamiastrum galeobdolon');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'630', E'Lathyrus latifolius');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'631', E'Lavandula angustifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'632', E'Lavatera thuringiaca');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'633', E'Ledum palustre');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'634', E'Leontopodium alpinum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'635', E'Leucanthemum x superbum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'636', E'Leucathemum vulgare');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'637', E'Levisticum officinale');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'638', E'Leymus arenarius');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'639', E'Liatris spicata ''Floristan Weiss''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'640', E'Liatris spicata ''Kobold''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'641', E'Liatris spicata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'642', E'Liatris');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'643', E'Ligularia dentata ''Desdemona''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'644', E'Ligularia dentata ''Orange Queen''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'645', E'Ligularia dentata ''Othello''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'646', E'Ligularia dentata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'647', E'Ligularia fischeri');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'648', E'Ligularia ''Hietala''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'649', E'Ligularia japonica');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'650', E'Ligularia macrophylla ''New Star''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'651', E'Ligularia przewalskii ''Romeo''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'652', E'Ligularia przewalskii');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'653', E'Ligularia sibirica');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'654', E'Ligularia tangutica');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'655', E'Ligularia veitchiana');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'656', E'Ligularia wilsoniana ''Hiisi''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'657', E'Ligularia wilsoniana');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'658', E'Ligularia x hessei ''Greynok Gold''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'659', E'Ligularia x hessei');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'660', E'Ligularia x palmatiloba');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'661', E'Ligularia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'662', E'Ligustrum vulgare');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'663', E'Lilium bulbiferum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'664', E'Lilium candidum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'665', E'Lilium lancifolium');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'666', E'Lilium martagon ''Album''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'667', E'Lilium martagon');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'668', E'Lilium regale');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'669', E'Lilium');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'670', E'Linaria vulgaris');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'671', E'Linnea borealis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'672', E'Linum usitatissimum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'673', E'Lonicera alpigena');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'674', E'Lonicera caerulea '' Jörgen''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'675', E'Lonicera caerulea');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'676', E'Lonicera caprifolium');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'677', E'Lonicera caucasica');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'678', E'Lonicera chrysantha');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'679', E'Lonicera involucrata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'680', E'Lonicera morrowii');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'681', E'Lonicera nigra');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'682', E'Lonicera periclymenum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'683', E'Lonicera tatarica ''Rosea''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'684', E'Lonicera tatarica ''Sanna''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'685', E'Lonicera tatarica');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'686', E'Lonicera x amoena');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'687', E'Lonicera x bella ''Dropmore''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'688', E'Lonicera x bella ''Sakura''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'689', E'Lonicera x bella ''Zabelii''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'690', E'Lonicera x bella');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'691', E'Lonicera x xylosteoides ''Clavey''s Dwarf''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'692', E'Lonicera xylosteum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'693', E'Lonicera');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'694', E'Lotus corniculatus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'695', E'Lupinus polyphyllus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'696', E'Luzula nivea');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'697', E'Luzula pilosa');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'698', E'Lychnis alpina');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'699', E'Lychnis chalcedonica');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'700', E'Lychnis coronaria');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'701', E'Lychnis viscaria');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'702', E'Lysimachia clethroides');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'703', E'Lysimachia nummularia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'704', E'Lysimachia punctata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'705', E'Lysimachia thyrsiflora');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'706', E'Lysimachia vulgaris');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'707', E'Lythrum salicaria ''Robert''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'708', E'Lythrum salicaria');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'709', E'Macleya cordata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'710', E'Magnolia sieboldii');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'711', E'Magnolia stellata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'712', E'Magnolia x soulangiana');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'713', E'Mahonia aquifolium');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'714', E'Malus toringo var. sargentii');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'715', E'Malva alcea');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'716', E'Malva moscata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'717', E'Matricaria retutita');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'718', E'Matteuccia struthiopteris');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'719', E'Matteuchia struthiopteris');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'720', E'Mecanopsis betonicifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'721', E'Melica nutans');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'722', E'Melissa officinalis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'723', E'Menispermum canadense');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'724', E'Menispermum dauricum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'725', E'Mentha spicata var. crispa');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'726', E'Mentha spicata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'727', E'Mentha x piperita');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'728', E'Menyanthes trifoliata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'729', E'Meum athamanticum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'730', E'Microbiota decussata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'731', E'Milium effusum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'732', E'Miscanthus sacchariflorus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'733', E'Miscanthus sinensis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'734', E'Molinia caerulea var. arundinacea');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'735', E'Molinia caerulea');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'736', E'Monarda didyma ''Purpurea''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'737', E'Monarda didyma ''Sarlakka''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'738', E'Monarda didyma ''Syklaami''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'739', E'Monarda didyma');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'740', E'Muscari armeniacum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'741', E'Muscari azureum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'742', E'Muscari botryoides');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'743', E'Muscari comosum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'744', E'Muscari neglectum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'745', E'Myosotis scorpioides');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'746', E'Myosotis sylvatica');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'747', E'Myrica gale');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'748', E'Myrica germanica');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'749', E'Myricaria germanica');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'750', E'Narcissus asturiensis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'751', E'Narcissus bulbocodium');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'752', E'Narcissus cyclamineus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'753', E'Narcissus jonquilla');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'754', E'Narcissus poëticus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'755', E'Narcissus pseudonarcissus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'756', E'Narcissus tazetta');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'757', E'Narcissus triandrus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'758', E'Narcissus x incomparabilis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'759', E'Narcissus x medioluteus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'760', E'Nepeta x faassenii');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'761', E'Nymphaea alba');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'762', E'Nymphaea candida');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'763', E'Nymphaea tetragona');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'764', E'Ocimum basilicum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'765', E'Oenothera missouriensis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'766', E'Oenothera tetragona');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'767', E'Omphalodes verna');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'768', E'Oplopanax horridus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'769', E'Origanum majorana');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'770', E'Origanum vulgare');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'771', E'Oxalis fontana ''Rufa''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'772', E'Pachysandra terminalis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'773', E'Paeonia Lactiflora-hybr.');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'774', E'Paeonia officinalis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'775', E'Paeonia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'776', E'Papaver croceum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'777', E'Papaver pseudo-orientale ''Allergo''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'778', E'Papaver pseudo-orientale ''Border Beauty''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'779', E'Papaver pseudo-orientale ''Peter Pan''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'780', E'Papaver pseudo-orientale');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'781', E'Parthenocissus inserta');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'782', E'Parthenocissus quinquefolia ''Engelmannii');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'783', E'Penstemon barbatus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'784', E'Penstemon hirsutus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'785', E'Petasites hybridus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'786', E'Petasites japonicus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'787', E'Petasites');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'788', E'Petroselinum crispum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'789', E'Phalaris arundinacea ''Picta''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'790', E'Phalaris arundinacea');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'791', E'Philadelphus coronarius');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'792', E'Philadelphus inodorus var. grandiflorus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'793', E'Philadelphus lewisii var. gordonianus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'794', E'Philadelphus lewisii var. lew.''Waterton''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'795', E'Philadelphus Lewisii-hybr. ''Tähtisilmä''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'796', E'Philadelphus pubescens');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'797', E'Philadelphus x lemoinei');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'798', E'Philadelphus x virginalis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'799', E'Philadelphus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'800', E'Phlox carolina');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'801', E'Phlox paniculata ''Aida''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'802', E'Phlox paniculata ''Amethyst''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'803', E'Phlox paniculata ''Bor der Gem''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'804', E'Phlox paniculata ''Jules Sandeau''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'805', E'Phlox paniculata ''Kirchenfürst''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'806', E'Phlox paniculata ''Lassberg''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'807', E'Phlox paniculata ''Mia Ruys''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'808', E'Phlox paniculata ''Orange Perfection''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'809', E'Phlox paniculata ''Pax''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'810', E'Phlox paniculata ''Rheinländer''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'811', E'Phlox paniculata ''Spitfire''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'812', E'Phlox paniculata ''Starfire''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'813', E'Phlox paniculata ''Wilhelm Kesselring''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'814', E'Phlox paniculata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'815', E'Phlox stolonifera');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'816', E'Phlox subulata ''Atropurpurea''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'817', E'Phlox subulata ''Betty''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'818', E'Phlox subulata ''Mai''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'819', E'Phlox subulata ''Moerheimii''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'820', E'Phlox subulata ''Rosea''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'821', E'Phlox subulata ''Temiscaming''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'822', E'Phlox subulata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'823', E'Phragmites australis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'824', E'Physalis alkekengi');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'825', E'Physocarpus opulifolius ''Diablo''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'826', E'Physocarpus opulifolius');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'827', E'Physocarpus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'828', E'Picea abies ''Echiniformis''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'829', E'Picea abies ''Globosa''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'830', E'Picea abies ''Kartio''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'831', E'Picea abies ''Nana''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'832', E'Picea abies ''Nidiformis''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'833', E'Picea abies ''Tabuliformis''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'834', E'Picea glauca ''Conica''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'835', E'Pieris floribunda');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'836', E'Pimpinella anisum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'837', E'Pinus mugo ''Gnom''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'838', E'Pinus mugo ''Pumilio''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'839', E'Pinus mugo ssp. mugo');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'840', E'Pinus pumila');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'841', E'Pinus pumila''Glauca''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'842', E'Pinus sylvestris ''Nana''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'843', E'Platycodon grandiflorus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'844', E'Polemonium caeruleum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'845', E'Polygonatum multiflorum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'846', E'Polygonatum odoratum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'847', E'Polygonatum x hybridum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'848', E'Polypodium vulgare');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'849', E'Portulaca oleracea ssp. sativa');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'850', E'Potentilla anserina');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'851', E'Potentilla atrosanguinea');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'852', E'Potentilla aurea');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'853', E'Potentilla nepalensis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'854', E'Potentilla tridentata ''Nuuk''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'855', E'Potentilla');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'856', E'Primula Auricula -hybr.');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'857', E'Primula denticulata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'858', E'Primula florindae');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'859', E'Primula rosea ''Gigas''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'860', E'Primula vulgaris');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'861', E'Prunella grandiflora');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'862', E'Prunus cerasus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'863', E'Prunus padus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'864', E'Prunus pumila var. depressa');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'865', E'Prunus sp.');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'866', E'Prunus tenella');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'867', E'Prunus virginiana ''Shubert''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'868', E'Pteridium aquilinum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'869', E'Pulmonaria saccharata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'870', E'Pulmonaria');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'871', E'Pulsatilla vulgaris');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'872', E'Puschkinia scilloides var. libanotica');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'873', E'Ranunculus ficaria');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'874', E'Rhamnus cathartica');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'875', E'Rheum palmatum subsp. tanguticum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'876', E'Rhodiola kirilowii');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'877', E'Rhodiola rosea');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'878', E'Rhododendron canadense');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'879', E'Rhododendron catawbiense ''Grandiflorum''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'880', E'Rhododendron ''Cunninghams''s White''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'881', E'Rhododendron ferrugineum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'882', E'Rhododendron Forrestii-hybr. ''Elviira''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'883', E'Rhododendron Ghent-Ryhmä ''Aamurusko''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'884', E'Rhododendron japonicum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'885', E'Rhododendron ''Kullervo''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'886', E'Rhododendron Lights-Ryhmä ''Orchid Lights''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'887', E'Rhododendron luteum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'888', E'Rhododendron ''Nova Zembla''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'889', E'Rhododendron ''P.M.A. Tigerstedt''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'890', E'Rhododendron ''Pohjanatsalea''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'891', E'Rhododendron ''Pohjolan Tytär''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'892', E'Rhododendron smirnowii ''Hellikki''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'893', E'Rhododendron ''St.Micchel''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'894', E'Rhododendron Tigerst.-hybr. ''Helsinki Un');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'895', E'Rhododendron Tigerstedii-hybr. ''Haaga''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'896', E'Rhododendron x fraseri');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'897', E'Rhododendron');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'898', E'Rhus aromatica ''Gro-Low''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'899', E'Ribes alpinum ''Pumilum''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'900', E'Ribes alpinum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'901', E'Ribes aureum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'902', E'Ribes glandulosum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'903', E'Ribes ''Hinnonmäen Keltainen''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'904', E'Ribes ''Jonkheer van Tets''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'905', E'Ribes ''Lepaan Punainen''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'906', E'Ribes nigrum ''Melalahti''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'907', E'Ribes nigrum ''Mortti''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'908', E'Ribes nigrum ''Vertti''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'909', E'Ribes nigrum ''Öjebyn''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'910', E'Ribes nigrum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'911', E'Ribes ''Punainen Hollantilainen''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'912', E'Ribes ''Rondom''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'913', E'Ribes ''Rotes Wunder Katri''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'914', E'Ribes rubrum ''Aili''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'915', E'Ribes rubrum ''Katri''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'916', E'Ribes rubrum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'917', E'Ribes Rubrum-ryhmä');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'918', E'Ribes sanguineum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'919', E'Ribes uva-crispa ''Hinnonmäen keltainen''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'920', E'Ribes uva-crispa');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'921', E'Ribes ''Valkea Jüterborger''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'922', E'Ribes ''Valkoinen Hollantilainen''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'923', E'Ribes ''Valkoinen suomalainen''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'924', E'Ribes');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'925', E'Rodgersia aesculifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'926', E'Rodgersia pinnata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'927', E'Rosa '' Hein Mück''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'928', E'Rosa ''Abigaile''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'929', E'Rosa acicularis ''Dornröschen''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'930', E'Rosa acicularis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'931', E'Rosa ''Alain''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'932', E'Rosa alba ''Celestial''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'933', E'Rosa alba');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'934', E'Rosa ''Alchymist''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'935', E'Rosa ''Allgold''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'936', E'Rosa ''Allotria''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'937', E'Rosa ''Amber Queen''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'938', E'Rosa amblyotis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'939', E'Rosa ''Anabell''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'940', E'Rosa ''Andalusien''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'941', E'Rosa ''Angela''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'942', E'Rosa ''Armsterdam''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'943', E'Rosa ''Australian Gold''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'944', E'Rosa ''Bad Füssing''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'945', E'Rosa ''Ballet''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'946', E'Rosa ''Barkarole''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'947', E'Rosa ''Bassino'' -runkoruusu');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'948', E'Rosa ''Bassino''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'949', E'Rosa ''Bella Rosa''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'950', E'Rosa ''Bella Weiss''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'951', E'Rosa ''Bengali''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'952', E'Rosa ''Bernina''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'953', E'Rosa ''Bernstein-Rose''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'954', E'Rosa ''Black Lady''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'955', E'Rosa blanda');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'956', E'Rosa ''Blue Parfym''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'957', E'Rosa ''Bonica''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'958', E'Rosa ''Buismans Triumph''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'959', E'Rosa canina');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'960', E'Rosa canina''General Jaquemonot''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'961', E'Rosa carolina');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'962', E'Rosa centifolia muscosa ''Nuits de Young''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'963', E'Rosa ''Champagner''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'964', E'Rosa ''Champs Elysees''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'965', E'Rosa ''Chinatown''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'966', E'Rosa ''Chorus''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'967', E'Rosa ''Dalli Dalli''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'968', E'Rosa ''Deutsche Welle''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'969', E'Rosa ''Dolly Parton''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'970', E'Rosa ''Dorola''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'971', E'Rosa ''Duftrauch''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'972', E'Rosa ''Duftwolke''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'973', E'Rosa ''Duftzauber''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'974', E'Rosa dumalis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'975', E'Rosa ''Dwarf Pavement''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'976', E'Rosa ''Edelweiss''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'977', E'Rosa ''Elisabeth of Glamis''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'978', E'Rosa ''Elmshorn''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'979', E'Rosa ''Erna Grootendorst''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'980', E'Rosa ''Erna Harkness''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'981', E'Rosa ''Erotica''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'982', E'Rosa ''Europeana''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'983', E'Rosa ''F. J. Grootendorst''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'984', E'Rosa ''Fair Play''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'985', E'Rosa ''Fairy Dance''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'986', E'Rosa ''Fiona''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'987', E'Rosa ''Flammentanz''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'988', E'Rosa foetida ''Bicolor''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'989', E'Rosa foetida ''Persian Yellow''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'990', E'Rosa ''Foxi Pavement''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'991', E'Rosa ''Francofort''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'992', E'Rosa ''Frau Astrid Späth''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'993', E'Rosa ''Fresco''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'994', E'Rosa ''Friesia'' -runkoruusu');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'995', E'Rosa ''Friesia''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'996', E'Rosa ''Friz Nobis''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'997', E'Rosa ''Frühlingsduft''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'998', E'Rosa ''Fuggerstad Augsburg''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'999', E'Rosa gallica ''Merveille''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1000', E'Rosa gallica ''Splendens''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1001', E'Rosa ''Gartenzauber 84''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1002', E'Rosa ''Gisselfeldt''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1003', E'Rosa glabrifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1004', E'Rosa glauca');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1005', E'Rosa ''Golden Holstein''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1006', E'Rosa ''Goldmarie 82''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1007', E'Rosa ''Goldmarie''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1008', E'Rosa ''Goldquelle''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1009', E'Rosa ''Graham Thomas''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1010', E'Rosa ''Gruss an Bayern''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1011', E'Rosa ''Hanne''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1012', E'Rosa ''Hansa''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1013', E'Rosa ''Hanseat''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1014', E'Rosa ''Heckenfeuer''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1015', E'Rosa ''Heidekind''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1016', E'Rosa ''Heidekönigin''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1017', E'Rosa ''Heidesommer'' -runkoruusu');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1018', E'Rosa ''Heinz Erhard''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1019', E'Rosa ''Heinzelmännchen''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1020', E'Rosa ''Helga''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1021', E'Rosa ''Helsingör''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1022', E'Rosa ''Herzog von Windsor''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1023', E'Rosa ''Holstein 87''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1024', E'Rosa ''Iced Ginger''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1025', E'Rosa ''Ingrid Bergman''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1026', E'Rosa ''Ingrid Weibull''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1027', E'Rosa ''Insel Mainau''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1028', E'Rosa ''Interrama''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1029', E'Rosa ''Irene af Danmark''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1030', E'Rosa ''Jan Spek''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1031', E'Rosa ''Joseph Guy''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1032', E'Rosa ''Juhannusmorsian''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1033', E'Rosa ''Kaarina''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1034', E'Rosa ''Karen Blixen''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1035', E'Rosa ''Kimono''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1036', E'Rosa ''King''s Ransom''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1037', E'Rosa ''Kordes Brilliant''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1038', E'Rosa ''Korona''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1039', E'Rosa ''Kotiliesi''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1040', E'Rosa ''Königin Beatrix''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1041', E'Rosa ''Königin der Rosen''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1042', E'Rosa ''La Paloma 85''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1043', E'Rosa ''Lady Rose''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1044', E'Rosa ''Landora''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1045', E'Rosa ''Lapponia''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1046', E'Rosa ''Lavaglut''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1047', E'Rosa ''Lavender Dream''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1048', E'Rosa ''Lili Marleen''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1049', E'Rosa ''Little Lemmy''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1050', E'Rosa ''Lolita''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1051', E'Rosa ''Ludvigshafen am Rhein''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1052', E'Rosa ''Lübecker Rotspon''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1053', E'Rosa ''Maiden''s Blush''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1054', E'Rosa ''Maigold''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1055', E'Rosa ''Mainzer Fastnacht''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1056', E'Rosa majalis ''Foecundissima''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1057', E'Rosa majalis ''Tornedal''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1058', E'Rosa majalis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1059', E'Rosa ''Maria Mathilda''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1060', E'Rosa ''Mariandel''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1061', E'Rosa ''Marietta''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1062', E'Rosa ''Marlena''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1063', E'Rosa ''Marselisborg''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1064', E'Rosa ''Meteor''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1065', E'Rosa ''Michelle''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1066', E'Rosa ''Mildred Scheel''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1067', E'Rosa ''Minette''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1068', E'Rosa ''Moje');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1069', E'Rosa ''Monica''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1070', E'Rosa ''Montana''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1071', E'Rosa ''Moyesii''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1072', E'Rosa ''Nevada''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1073', E'Rosa ''Nicole''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1074', E'Rosa ''Nina Weibull''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1075', E'Rosa nitida');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1076', E'Rosa omaiensis f. pteracantha');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1077', E'Rosa ''Onni''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1078', E'Rosa ''Orange Meillandina''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1079', E'Rosa ''Orange Sensation''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1080', E'Rosa ''Orange Triumph''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1081', E'Rosa ''Osiana''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1082', E'Rosa ''Papula''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1083', E'Rosa ''Pascali''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1084', E'Rosa ''Peace''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1085', E'Rosa pendulina');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1086', E'Rosa ''Pernille Poulsen''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1087', E'Rosa ''Pfälzer Gold''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1088', E'Rosa ''Piccadilly');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1089', E'Rosa ''Piccolo''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1090', E'Rosa pimpinellifolia ''Aicha''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1091', E'Rosa pimpinellifolia ''Frulingsduft''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1092', E'Rosa pimpinellifolia ''Frühlingsgold''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1093', E'Rosa pimpinellifolia ''Grandiflora''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1094', E'Rosa pimpinellifolia ''Maigold''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1095', E'Rosa pimpinellifolia ''Plena''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1096', E'Rosa pimpinellifolia ''Stanwell Perpetual''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1097', E'Rosa pimpinellifolia ''Tove Jansson''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1098', E'Rosa pimpinellifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1099', E'Rosa pimpinellifolia''Fruhlingsduft''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1100', E'Rosa pimpinellifolia''Prarie Dawn''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1101', E'Rosa ''Pink Grootendorst''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1102', E'Rosa ''Pink Minimo''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1103', E'Rosa ''Pink Pavement''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1104', E'Rosa ''Pink Robusta''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1105', E'Rosa ''Pohjantähti''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1106', E'Rosa ''Poppet''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1107', E'Rosa ''Poppius''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1108', E'Rosa ''President Kekkonen''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1109', E'Rosa ''Prins Claus''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1110', E'Rosa ''Prominent''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1111', E'Rosa ''Pussta''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1112', E'Rosa ''Queen Elisabeth''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1113', E'Rosa ''Red Minimo''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1114', E'Rosa ''Red Peace''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1115', E'Rosa ''Regensberg''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1116', E'Rosa ''Rheinaupark''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1117', E'Rosa ''Robusta''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1118', E'Rosa ''Rosali''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1119', E'Rosa ''Rosamunde''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1120', E'Rosa ''Rosenfee''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1121', E'Rosa ''Rosenstadt Zweibrücken''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1122', E'Rosa ''Roseromantic''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1123', E'Rosa ''Rosy Carpet''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1124', E'Rosa rubiginosa ''Magnifiga''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1125', E'Rosa rubiginosa');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1126', E'Rosa ''Rubina''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1127', E'Rosa rugosa f. alba');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1128', E'Rosa rugosa ''Fru Dagmar Hastrup''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1129', E'Rosa rugosa ''Max Graf''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1130', E'Rosa rugosa ''Pink Robusta''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1131', E'Rosa rugosa ''Pohjolan Kuningatar''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1132', E'Rosa rugosa ''Rote Max Graf''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1133', E'Rosa rugosa ''Scabrosa''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1134', E'Rosa rugosa ''Schneezwerg''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1135', E'Rosa rugosa ''Signe Relander''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1136', E'Rosa rugosa');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1137', E'Rosa ''Rumba''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1138', E'Rosa ''Ruskeala''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1139', E'Rosa ''Samba''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1140', E'Rosa ''Scarlet Pavement''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1141', E'Rosa ''Schloss Mannheim''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1142', E'Rosa ''Schneekönigin''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1143', E'Rosa ''Schneewitchen''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1144', E'Rosa ''Schwarze Madonna''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1145', E'Rosa ''Schweizergrüss''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1146', E'Rosa ''Shalom''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1147', E'Rosa ''Sipi''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1148', E'Rosa ''Smarty''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1149', E'Rosa ''Snow Ballet''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1150', E'Rosa ''Sommerwind'' -runkoruusu');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1151', E'Rosa ''Sommerwind''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1152', E'Rosa ''Sonnenröschen''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1153', E'Rosa ''Southampton''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1154', E'Rosa ''Souvenir de Christophe Cochet''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1155', E'Rosa ''Souvenir de la Malmaison''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1156', E'Rosa ''Splendens''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1157', E'Rosa ''Staffa''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1158', E'Rosa ''Summer Holiday''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1159', E'Rosa ''Sunflare''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1160', E'Rosa ''Super Star''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1161', E'Rosa ''Swany''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1162', E'Rosa ''The Fairy'' -runkoruusu');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1163', E'Rosa ''The Fairy''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1164', E'Rosa ''Thérèse Bugnet''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1165', E'Rosa ''Tip Top''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1166', E'Rosa ''Tom Tom''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1167', E'Rosa ''Topsi''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1168', E'Rosa ''Tornado''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1169', E'Rosa ''Traumerei'' -runkoruusu');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1170', E'Rosa ''Traumerei''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1171', E'Rosa ''Traumland''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1172', E'Rosa ''Trier''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1173', E'Rosa ''Troika''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1174', E'Rosa ''Uncle Walter''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1175', E'Rosa ''Uwe Seeler''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1176', E'Rosa ''Weibull''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1177', E'Rosa ''Western Sun''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1178', E'Rosa ''Whisky''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1179', E'Rosa villosa');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1180', E'Rosa virginiana');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1181', E'Rosa x harisonii ''Harison''s Yellow''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1182', E'Rosa x harisonii');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1183', E'Rosa x malyi ''Kempeleen Kaunotar''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1184', E'Rosa x mariae-graebneriae');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1185', E'Rosa x rugotida ''Dart''s Defender''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1186', E'Rosa x rugotida');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1187', E'Rosa x spaethiana');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1188', E'Rosa ''Yellow Meillandina''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1189', E'Rosa ''Yesterday''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1190', E'Rosa ''Zonta-Rose''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1191', E'Rosa');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1192', E'Rosmarinus officinalis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1193', E'Rubus alleghaniensis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1194', E'Rubus articus x idaeus ''Heisa''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1195', E'Rubus caesius');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1196', E'Rubus deliciosus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1197', E'Rubus idaeus ''Muskoka''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1198', E'Rubus idaeus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1199', E'Rubus odoratus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1200', E'Rubus saxatilis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1201', E'Rudbeckia fulgida var. speciosa');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1202', E'Rudbeckia fulgida var. sullivantii');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1203', E'Rudbeckia laciniata ''Goldball''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1204', E'Salix alba');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1205', E'Salix aurita');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1206', E'Salix caprea');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1207', E'Salix cinerea');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1208', E'Salix daphnoides acutifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1209', E'Salix daphnoides');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1210', E'Salix dasyclados');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1211', E'Salix fragilis ''Bullata''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1212', E'Salix gl.callicarpaea ''Haltia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1213', E'Salix glauca');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1214', E'Salix lanata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1215', E'Salix lapponum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1216', E'Salix myrsinifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1217', E'Salix myrtilloides');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1218', E'Salix pentandra');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1219', E'Salix phylicifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1220', E'Salix purpurea ''Nana''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1221', E'Salix purpurea x rosmarinifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1222', E'Salix purpurea');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1223', E'Salix pyrolifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1224', E'Salix repens arenaria');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1225', E'Salix repens ''Saret''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1226', E'Salix repens');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1227', E'Salix rosmarinifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1228', E'Salix ''Sibirica''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1229', E'Salix starkeana');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1230', E'Salix triandra');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1231', E'Salix viminalis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1232', E'Salix ''Vitellina Tristis''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1233', E'Salix ''Vitellina''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1234', E'Salix x aurora ''Tuhkimo''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1235', E'Salix x dasyclados');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1236', E'Salix x mollissima');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1237', E'Salix x rubens');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1238', E'Salix');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1239', E'Salvia nemorosa');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1240', E'Salvia officinalis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1241', E'Salvia x sylvestris ''Blaukönigin''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1242', E'Salvia x sylvestris ''Rosakönigin''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1243', E'Salvia x sylvestris');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1244', E'Sambucus canadensis ´Maxima´');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1245', E'Sambucus racemosa');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1246', E'Sanguisorba officinalis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1247', E'Saponaria officinalis ''Alba Plena''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1248', E'Saponaria officinalis ''Rubra Plena''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1249', E'Saponaria officinalis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1250', E'Satureja hortensis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1251', E'Saxifraga Arendsii-hybr.');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1252', E'Saxifraga hostii');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1253', E'Saxifraga paniculata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1254', E'Saxifraga ''Purpurteppich''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1255', E'Saxifraga rotundifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1256', E'Saxifraga ''Schneeteppich''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1257', E'Schisandra chinensis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1258', E'Scirpus sylvaticus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1259', E'Sedum acre');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1260', E'Sedum aizoon');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1261', E'Sedum album');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1262', E'Sedum ''Common Red''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1263', E'Sedum ewersii');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1264', E'Sedum floriferum ''Weihenstephaner Gold''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1265', E'Sedum ''Herbstfreude''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1266', E'Sedum pachyclados');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1267', E'Sedum spathulifolium ''Purpureum''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1268', E'Sedum spathulifolium');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1269', E'Sedum spectabile');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1270', E'Sedum spurium ''Rosea''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1271', E'Sedum spurium');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1272', E'Sedum ''Stewed Rhubarb Mountain''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1273', E'Sedum telephium ''Munstead Dark Red''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1274', E'Sedum telephium subsp. maximum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1275', E'Sedum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1276', E'Sempervivum tectorum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1277', E'Sinapsis alba');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1278', E'Solidago canadensis ''Goldking''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1279', E'Solidago canadensis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1280', E'Solidago virgaurea');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1281', E'Solidago x hybr. ''Golden Mosa''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1282', E'Solidago x hybr. ''Goldstar''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1283', E'Solidago x hybr. ''Leraft''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1284', E'Solidago x hybr.');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1285', E'Solidago');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1286', E'Sorbaria sorbifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1287', E'Sorbus aucuparia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1288', E'Spiraea alba ''Allikko''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1289', E'Spiraea alba var. latifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1290', E'Spiraea alba');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1291', E'Spiraea ''Arguta''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1292', E'Spiraea beauverdiana ''Lumikki''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1293', E'Spiraea beauverdiana');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1294', E'Spiraea betulifolia `Thor´');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1295', E'Spiraea betulifolia ''Island''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1296', E'Spiraea betulifolia ''Renko''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1297', E'Spiraea betulifolia var. ''Aemiliana''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1298', E'Spiraea betulifolia var. lucida');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1299', E'Spiraea betulifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1300', E'Spiraea Billiardii-hybr.');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1301', E'Spiraea cana');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1302', E'Spiraea chamaedryfolia ''Martti''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1303', E'Spiraea chamaedryfolia var. ulmifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1304', E'Spiraea chamaedryfolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1305', E'Spiraea decumbens');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1306', E'Spiraea densiflora');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1307', E'Spiraea douglasii');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1308', E'Spiraea fritschiana');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1309', E'Spiraea ''Grefsheim''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1310', E'Spiraea hypericifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1311', E'Spiraea japonica ''Albiflora''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1312', E'Spiraea japonica ''Anthony Waterer''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1313', E'Spiraea japonica ''Arnold''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1314', E'Spiraea japonica ''Firelight''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1315', E'Spiraea japonica ''Froebelii''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1316', E'Spiraea japonica ''Golden Princess''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1317', E'Spiraea japonica ''Goldflame''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1318', E'Spiraea japonica ''Goldmound''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1319', E'Spiraea japonica ''Lilly''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1320', E'Spiraea japonica ''Little Princess''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1321', E'Spiraea japonica ''Manon''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1322', E'Spiraea japonica ''Nana''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1323', E'Spiraea japonica ''Neon Flash''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1324', E'Spiraea japonica ''Odensala''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1325', E'Spiraea japonica ''Shirobana''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1326', E'Spiraea japonica ''walbuma Magic Carpet''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1327', E'Spiraea japonica');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1328', E'Spiraea ''Margaritae''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1329', E'Spiraea media');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1330', E'Spiraea nipponica ''Halwards Silwer''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1331', E'Spiraea nipponica ''June Bride''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1332', E'Spiraea nipponica');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1333', E'Spiraea rubella');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1334', E'Spiraea salicifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1335', E'Spiraea stevenii');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1336', E'Spiraea ''Summersnow''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1337', E'Spiraea trichocarpa');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1338', E'Spiraea trilobata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1339', E'Spiraea x bumalda ''Denistar''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1340', E'Spiraea x bumalda ''Superstar''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1341', E'Spiraea x cinerea');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1342', E'Spiraea x rosalba');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1343', E'Spiraea x sanssouciana');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1344', E'Spiraea x vanhouttei');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1345', E'Spiraea x watsoniana ''Kruunu''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1346', E'Spiraea x watsoniana');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1347', E'Spiraea');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1348', E'Stachys byzantina');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1349', E'Stachys macrantha ''Superba''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1350', E'Stachys macrantha');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1351', E'Stephanandra incisa ''Crispa''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1352', E'Stephnandra incisa ''Crispa''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1353', E'Symphoricarpos albus var. laevigatus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1354', E'Syringa josikaea');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1355', E'Syringa patula');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1356', E'Syringa Preston-hybr. ''Coral''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1357', E'Syringa Preston-hybr. ''Elinor''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1358', E'Syringa Preston-hybr. ''Holger''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1359', E'Syringa Preston-hybr. ''James MacFarlane''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1360', E'Syringa Preston-hybr. ''Royalty''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1361', E'Syringa reflexa');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1362', E'Syringa reticulata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1363', E'Syringa vulgaris ''Alba''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1364', E'Syringa vulgaris ''Amoena''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1365', E'Syringa vulgaris ''Andenken an Ludvig Späth''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1366', E'Syringa vulgaris ''Charles Joly''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1367', E'Syringa vulgaris hybr.');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1368', E'Syringa vulgaris ''Katherine Havemayer''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1369', E'Syringa vulgaris ''Michel Buchner''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1370', E'Syringa vulgaris ''Mme Lemoine''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1371', E'Syringa vulgaris ''Moskovan kaunotar''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1372', E'Syringa vulgaris ''Sensation''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1373', E'Syringa vulgaris');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1374', E'Syringa x chinensis ''Bicolor''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1375', E'Syringa x chinensis ''Saugeana''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1376', E'Syringa x chinensis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1377', E'Syringa x henryi ''Tammelan Kaunotar''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1378', E'Syringa x henryi ''Tapaninsyreeni''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1379', E'Syringa x henryi');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1380', E'Syringa x josiflexa '' Veera''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1381', E'Syringa x josiflexa');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1382', E'Syringa');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1383', E'Tanacetum coccineum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1384', E'Tanacetum vulgare');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1385', E'Taxus baccata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1386', E'Taxus cuspidata ''Nana''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1387', E'Taxus cuspidata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1388', E'Taxus x media ''Hicksii''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1389', E'Taxus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1390', E'Telekia speciosa');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1391', E'Tellima grandiflora');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1392', E'Thalictrum aquilegiifolium');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1393', E'Thalictrum delavayi');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1394', E'Thalictrum flavum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1395', E'Thelypteris phegopteris');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1396', E'Thuja koraiensis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1397', E'Thuja occidentalis ''Brabant''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1398', E'Thuja occidentalis ''Columna''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1399', E'Thuja occidentalis ''Fastigiata''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1400', E'Thuja occidentalis ''Globosa''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1401', E'Thuja occidentalis ''Holmstrup''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1402', E'Thuja occidentalis ''Hoveyi''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1403', E'Thuja occidentalis ''Smaragd''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1404', E'Thuja occidentalis ''Sunkist''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1405', E'Thuja occidentalis ''Woodwardii''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1406', E'Thuja occidentalis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1407', E'Thujopsis dolabrata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1408', E'Thymus citriodorus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1409', E'Thymus serphyllum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1410', E'Thymus vulgaris');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1411', E'Tiarella cordifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1412', E'Tiarella wherryi');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1413', E'Tiarella');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1414', E'Trientalis europaea');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1415', E'Trifolium repens');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1416', E'Trollius chinensis ''Goldkönigin''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1417', E'Trollius chinensis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1418', E'Trollius europaeus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1419', E'Trollius-hybr. ''Orange Globe''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1420', E'Trollius-hybr. ''Orange Princess''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1421', E'Trollius-hybr.');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1422', E'Tsuga canadensis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1423', E'Tsuga diversifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1424', E'Tsuga heterophylla');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1425', E'Tsuga mertensiana');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1426', E'Tulipa armena');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1427', E'Tulipa biflora');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1428', E'Tulipa celsiana');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1429', E'Tulipa clusiana');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1430', E'Tulipa fosteriana');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1431', E'Tulipa greigii');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1432', E'Tulipa humilis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1433', E'Tulipa kaufmanniana');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1434', E'Tulipa lanata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1435', E'Tulipa linifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1436', E'Tulipa marjoletti');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1437', E'Tulipa ostrowskiana');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1438', E'Tulipa sylvestris');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1439', E'Tulipa tarda');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1440', E'Typha angustifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1441', E'Typha latifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1442', E'Vaccinium ''Aron''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1443', E'Vaccinium corymbosum ''Aino''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1444', E'Vaccinium corymbosum ''North Blue''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1445', E'Vaccinium corymbosum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1446', E'Vaccinium microcarpum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1447', E'Vaccinium myrtilus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1448', E'Vaccinium oxycoccos');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1449', E'Vaccinium uliginosum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1450', E'Vaccinium vitis-idaea');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1451', E'Waldsteinia ternata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1452', E'Weigela florida ''Minuet''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1453', E'Weigela hybrida');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1454', E'Weigela middendorffiana');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1455', E'Weigela praecox');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1456', E'Verbascum nigrum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1457', E'Verbascum olympicum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1458', E'Verbascum thapsus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1459', E'Veronica austriaca ''Royal Blue''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1460', E'Veronica austriaca');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1461', E'Veronica longifolia');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1462', E'Veronica officinalis');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1463', E'Veronica prostrata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1464', E'Veronica spicata nana ''Blauteppich''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1465', E'Veronica spicata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1466', E'Veronica');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1467', E'Viburnum dentatum var. lucidum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1468', E'Viburnum lantana');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1469', E'Viburnum lentago ''Jenkki''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1470', E'Viburnum opulus f. roseum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1471', E'Viburnum opulus ''Kallion Pallo''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1472', E'Viburnum opulus ''Nanum''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1473', E'Viburnum opulus ''Nordplant''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1474', E'Viburnum opulus ''Pohjan Neito''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1475', E'Viburnum opulus ssp. opulus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1476', E'Viburnum opulus ssp. trilobum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1477', E'Viburnum opulus');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1478', E'Viburnum sargentii ''Blue Muffin''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1479', E'Viburnum sargentii ''Onondaga''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1480', E'Viburnum');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1481', E'Vinca minor ''Argenteovariegata''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1482', E'Vinca minor');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1483', E'Viola ''Ella''');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1484', E'Viola odorata');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1485', E'Vitis labrusca');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1486', E'muu');
-- ddl-end --
INSERT INTO koodistot.kasvilaji (id, selite) VALUES (E'1487', E'ei tiedossa');
-- ddl-end --

-- object: koodistot.kasviryhmatyyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.kasviryhmatyyppi CASCADE;
CREATE TABLE koodistot.kasviryhmatyyppi (
	id serial NOT NULL,
	selite text,
	CONSTRAINT kasviryhmatyyppi_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.kasviryhmatyyppi OWNER TO infrao_admin;
-- ddl-end --

INSERT INTO koodistot.kasviryhmatyyppi (id, selite) VALUES (E'1', E'havupensas');
-- ddl-end --
INSERT INTO koodistot.kasviryhmatyyppi (id, selite) VALUES (E'2', E'köynnös');
-- ddl-end --
INSERT INTO koodistot.kasviryhmatyyppi (id, selite) VALUES (E'3', E'köynnösruusu');
-- ddl-end --
INSERT INTO koodistot.kasviryhmatyyppi (id, selite) VALUES (E'4', E'lehtipensas');
-- ddl-end --
INSERT INTO koodistot.kasviryhmatyyppi (id, selite) VALUES (E'5', E'maustekasvi');
-- ddl-end --
INSERT INTO koodistot.kasviryhmatyyppi (id, selite) VALUES (E'6', E'perenna');
-- ddl-end --
INSERT INTO koodistot.kasviryhmatyyppi (id, selite) VALUES (E'7', E'varpu');
-- ddl-end --
INSERT INTO koodistot.kasviryhmatyyppi (id, selite) VALUES (E'8', E'ryhmäruusu');
-- ddl-end --
INSERT INTO koodistot.kasviryhmatyyppi (id, selite) VALUES (E'9', E'yksivuotinen kasvi');
-- ddl-end --
INSERT INTO koodistot.kasviryhmatyyppi (id, selite) VALUES (E'10', E'muu');
-- ddl-end --
INSERT INTO koodistot.kasviryhmatyyppi (id, selite) VALUES (E'11', E'ei tiedossa');
-- ddl-end --

-- object: koodistot.leikkivalinetyyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.leikkivalinetyyppi CASCADE;
CREATE TABLE koodistot.leikkivalinetyyppi (
	id serial NOT NULL,
	selite text,
	CONSTRAINT leikkivalinetyyppi_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.leikkivalinetyyppi OWNER TO infrao_admin;
-- ddl-end --

INSERT INTO koodistot.leikkivalinetyyppi (id, selite) VALUES (E'1', E'aita');
-- ddl-end --
INSERT INTO koodistot.leikkivalinetyyppi (id, selite) VALUES (E'2', E'hiekkalaatikko');
-- ddl-end --
INSERT INTO koodistot.leikkivalinetyyppi (id, selite) VALUES (E'3', E'jousilelu');
-- ddl-end --
INSERT INTO koodistot.leikkivalinetyyppi (id, selite) VALUES (E'4', E'karuselli');
-- ddl-end --
INSERT INTO koodistot.leikkivalinetyyppi (id, selite) VALUES (E'5', E'katos');
-- ddl-end --
INSERT INTO koodistot.leikkivalinetyyppi (id, selite) VALUES (E'6', E'keinulauta');
-- ddl-end --
INSERT INTO koodistot.leikkivalinetyyppi (id, selite) VALUES (E'7', E'keinumisvälineet');
-- ddl-end --
INSERT INTO koodistot.leikkivalinetyyppi (id, selite) VALUES (E'8', E'keinut');
-- ddl-end --
INSERT INTO koodistot.leikkivalinetyyppi (id, selite) VALUES (E'9', E'kiipeilyteline');
-- ddl-end --
INSERT INTO koodistot.leikkivalinetyyppi (id, selite) VALUES (E'10', E'köysirata');
-- ddl-end --
INSERT INTO koodistot.leikkivalinetyyppi (id, selite) VALUES (E'11', E'leikkimökki');
-- ddl-end --
INSERT INTO koodistot.leikkivalinetyyppi (id, selite) VALUES (E'12', E'liukumäki');
-- ddl-end --
INSERT INTO koodistot.leikkivalinetyyppi (id, selite) VALUES (E'13', E'monitoimiväline');
-- ddl-end --
INSERT INTO koodistot.leikkivalinetyyppi (id, selite) VALUES (E'14', E'patsas');
-- ddl-end --
INSERT INTO koodistot.leikkivalinetyyppi (id, selite) VALUES (E'15', E'tasapainoiluväline');
-- ddl-end --
INSERT INTO koodistot.leikkivalinetyyppi (id, selite) VALUES (E'16', E'muu');
-- ddl-end --
INSERT INTO koodistot.leikkivalinetyyppi (id, selite) VALUES (E'17', E'ei tiedossa');
-- ddl-end --

-- object: koodistot.liikennemerkkityyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.liikennemerkkityyppi CASCADE;
CREATE TABLE koodistot.liikennemerkkityyppi (
	id serial NOT NULL,
	selite text,
	CONSTRAINT liikennemerkkityyppi_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.liikennemerkkityyppi OWNER TO infrao_admin;
-- ddl-end --

INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'1', E'111. Mutka oikealle');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'2', E'112. Mutka vasemmalle');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'3', E'113. Mutkia, joista ensimmäinen oikealle');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'4', E'114. Mutkia, joista ensimmäinen vasemmalle');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'5', E'115. Jyrkkä alamäki');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'6', E'116. Jyrkkä ylämäki');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'7', E'121. Kapeneva tie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'8', E'122. Kaksisuuntainen liikenne');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'9', E'131. Avattava silta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'10', E'132. Lautta, laituri tai ranta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'11', E'133. Liikenneruuhka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'12', E'141. Epätasainen tie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'13', E'141 a. Töyssyjä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'14', E'142. Tietyö');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'15', E'143. Irtokiviä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'16', E'144. Liukas ajorata');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'17', E'147. Vaarallinen tien reuna');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'18', E'151. Suojatien ennakkovaroitus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'19', E'152. Lapsia');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'20', E'153. Pyöräilijöitä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'21', E'154. Hiihtolatu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'22', E'155. Hirvieläimiä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'23', E'156. Poroja');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'24', E'161. Tienristeys');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'25', E'162. Sivutien risteys');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'26', E'163. Sivutien risteys');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'27', E'164. Sivutien risteys');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'28', E'165. Liikennevalot');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'29', E'166. Liikenneympyrä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'30', E'167. Raitiotie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'31', E'171. Rautatien tasoristeys ilman puomeja');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'32', E'172. Rautatien tasoristeys, jossa on puomit');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'33', E'173. 174. 175. Rautatien tasoristeyksen lähestymismerkit');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'34', E'176. Yksiraiteisen rautatien tasoristeys');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'35', E'177. Kaksi- tai useampiraiteisen rautatien tasoristeys');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'36', E'181. Putoavia kiviä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'37', E'182. Matalalla lentäviä lentokoneita');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'38', E'183. Sivutuuli');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'39', E'189. Muu vaara');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'40', E'211. Etuajo-oikeutettu tie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'41', E'212. Etuajo-oikeuden päättyminen');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'42', E'221. Etuajo-oikeus kohdattaessa');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'43', E'222. Väistämisvelvollisuus kohdattaessa');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'44', E'231. Väistämisvelvollisuus risteyksessä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'45', E'232. Pakollinen pysäyttäminen');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'46', E'311. Ajoneuvolla ajo kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'47', E'312. Moottorikäyttöisellä ajoneuvolla ajo kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'48', E'313. Kuorma- ja pakettiautolla ajo kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'49', E'314. Ajoneuvoyhdistelmällä ajo kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'50', E'315. Traktorilla ajo kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'51', E'316. Moottoripyörällä ajo kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'52', E'317. Moottorikelkalla ajo kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'53', E'318. Vaarallisten aineiden kuljetus kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'54', E'319. Linja-autolla ajo kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'55', E'321. Mopolla ajo kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'56', E'322. Polkupyörällä ja mopolla ajo kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'57', E'323. Jalankulku kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'58', E'324. Jalankulku sekä polkupyörällä ja mopolla ajo kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'59', E'325. Ratsastus kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'60', E'331. Kielletty ajosuunta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'61', E'332. Vasemmalle kääntyminen kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'62', E'333. Oikealle kääntyminen kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'63', E'334. U-käännös kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'64', E'341. Ajoneuvon suurin sallittu leveys');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'65', E'342. Ajoneuvon suurin sallittu korkeus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'66', E'343. Ajoneuvon tai ajoneuvoyhdistelmän suurin sallittu pituus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'67', E'344. Ajoneuvon suurin sallittu massa');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'68', E'345. Ajoneuvoyhdistelmän suurin sallittu massa');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'69', E'346. Ajoneuvon suurin sallittu akselille kohdistuva massa');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'70', E'347. Ajoneuvon suurin sallittu telille kohdistuva massa');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'71', E'351. Ohituskielto');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'72', E'352. Ohituskielto päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'73', E'353. Ohituskielto kuorma-autolla');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'74', E'354. Ohituskielto kuorma-autolla päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'75', E'361. Nopeusrajoitus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'76', E'362. Nopeusrajoitus päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'77', E'363. Nopeusrajoitusalue');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'78', E'364. Nopeusrajoitusalue päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'79', E'365. Ajokaistakohtainen kielto tai rajoitus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'80', E'371. Pysäyttäminen kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'81', E'372. Pysäköinti kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'82', E'373. Pysäköintikieltoalue');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'83', E'374. Pysäköintikieltoalue päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'84', E'375. Taksiasema-alue');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'85', E'376. Taksin pysäyttämispaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'86', E'381. Vuoropysäköinti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'87', E'382. Vuoropysäköinti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'88', E'391. Pakollinen pysäyttäminen tullitarkastusta varten');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'89', E'392. Pakollinen pysäyttäminen tarkastusta varten');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'90', E'393. Moottorikäyttöisten ajoneuvojen vähimmäisetäisyys');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'91', E'411. Pakollinen ajosuunta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'92', E'412. Pakollinen ajosuunta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'93', E'413. Pakollinen ajosuunta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'94', E'414. Pakollinen ajosuunta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'95', E'415. Pakollinen ajosuunta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'96', E'416. Pakollinen kiertosuunta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'97', E'417. Liikenteen jakaja');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'98', E'418. Liikenteen jakaja');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'99', E'421. Jalkakäytävä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'100', E'422. Pyörätie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'101', E'423. Yhdistetty pyörätie ja jalkakäytävä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'102', E'424. Pyörätie ja jalkakäytävä rinnakkain');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'103', E'425. Pyörätie ja jalkakäytävä rinnakkain');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'104', E'426. Moottorikelkkailureitti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'105', E'427. Ratsastustie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'106', E'511. Suojatie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'107', E'520. Liityntäpysäköintipaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'108', E'521. Pysäköintipaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'109', E'521 a. Ajoneuvojen sijoitus pysäköintipaikalla');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'110', E'521 b. Ajoneuvojen sijoitus pysäköintipaikalla');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'111', E'521 c. Ajoneuvojen sijoitus pysäköintipaikalla');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'112', E'522. Kohtaamispaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'113', E'531. Paikallisliikenteen linja-auton pysäkki');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'114', E'532. Kaukoliikenteen linja-auton pysäkki');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'115', E'533. Raitiovaunun pysäkki');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'116', E'534. Taksiasema');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'117', E'541 a. Linja-autokaista');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'118', E'541 b. Linja-autokaista');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'119', E'542 a. Linja-autokaista päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'120', E'542 b. Linja-autokaista päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'121', E'543 a. Raitiovaunukaista');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'122', E'543 b. Raitiovaunukaista');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'123', E'544 a. Raitiovaunukaista päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'124', E'544 b. Raitiovaunukaista päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'125', E'551. Yksisuuntainen tie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'126', E'561. Moottoritie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'127', E'562. Moottoritie päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'128', E'563. Moottoriliikennetie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'129', E'564. Moottoriliikennetie päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'130', E'565. Tunneli');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'131', E'566. Tunneli päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'132', E'567. Hätäpysäyttämispaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'133', E'571. Taajama');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'134', E'572. Taajama päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'135', E'573. Pihakatu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'136', E'574. Pihakatu päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'137', E'575. Kävelykatu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'138', E'576. Kävelykatu päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'139', E'611. Suunnistustaulu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'140', E'612. Suunnistustaulu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'141', E'613. Kiertotien suunnistustaulu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'142', E'614. Kiertotien suunnistustaulu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'143', E'615. Kiertotieopastus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'144', E'616. Ajoreittiopastus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'145', E'621. Ajokaistaopastus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'146', E'622. Ajokaistaopastus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'147', E'623. Ajokaistan päättyminen');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'148', E'631. Ajokaistan yläpuolinen viitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'149', E'632. Ajokaistan yläpuolinen viitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'150', E'633. Ajokaistan yläpuolinen erkanemisviitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'151', E'641. Tienviitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'152', E'642. Erkanemisviitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'153', E'643. Yksityisen tien viitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'154', E'644. Osoiteviitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'155', E'644 a. Osoiteviittan ennakkomerkki');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'156', E'645. Kevyen liikenteen viitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'157', E'646. Kiertotien viitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'158', E'647. Kiertotien viitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'159', E'648. Paikalliskohteen viitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'160', E'649. Moottori- ja moottoriliikennetien viitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'161', E'650. Liityntäpysäköintiviitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'162', E'651. Umpitie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'163', E'652. Umpitie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'164', E'653. Enimmäisnopeussuositus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'165', E'661. Etäisyystaulu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'166', E'662. Paikannimi');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'167', E'663. Kansainvälisen pääliikenneväylän numero');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'168', E'664. Valtatien numero');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'169', E'665. Kantatien numero');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'170', E'665 a. Seututien numero');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'171', E'666. Muun yleisen tien numero');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'172', E'667. Opastus numeron tarkoittamalle tielle');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'173', E'671. Moottoritien tunnus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'174', E'672. Moottoriliikennetien tunnus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'175', E'673. Lentoasema');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'176', E'674. Autolautta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'177', E'675. Tavarasatama');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'178', E'676. Teollisuusalue');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'179', E'677. Pysäköinti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'180', E'677 a. Katettu pysäköinti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'181', E'678. Rautatieasema');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'182', E'679. Linja-autoasema');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'183', E'681. Tietyille ajoneuvoille tai ajoneuvoyhdistelmille tarkoitettu reitti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'184', E'682. Jalankulkijoille tarkoitettu reitti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'185', E'683. Vammaisille tarkoitettu reitti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'186', E'684. Vaarallisten aineiden kuljetuksille tarkoitettu reitti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'187', E'685. Reitti, jolla on portaat');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'188', E'686. Reitti ilman portaita');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'189', E'690. Hätäuloskäynti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'190', E'691. Poistumisreitti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'191', E'701. Palvelukohteen opastustaulu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'192', E'702. Palvelukohteen opastustaulu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'193', E'703. Palvelukohteen erkanemisviitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'194', E'704. Palvelukohteen osoiteviitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'195', E'704 a. Palvelukohteen osoiteviittan ennakkomerkki');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'196', E'710. Radioaseman taajuus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'197', E'711. Opastuspiste');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'198', E'712. Opastustoimisto');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'199', E'715. Ensiapu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'200', E'721. Autokorjaamo');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'201', E'722. Huoltoasema');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'202', E'723. Hotelli tai motelli');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'203', E'724. Ruokailupaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'204', E'725. Kahvila tai pikaruokapaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'205', E'726. Käymälä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'206', E'731. Retkeilymaja');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'207', E'733. Leirintäalue');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'208', E'734. Matkailuajoneuvoalue');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'209', E'741. Levähdysalue');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'210', E'742. Ulkoilualue');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'211', E'791. Hätäpuhelin');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'212', E'792. Sammutin');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'213', E'771 a. Matkailutie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'214', E'771 b. Matkailutie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'215', E'772 a. Museo tai historiallinen rakennus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'216', E'772 b. Maailmanperintökohde');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'217', E'772 c. Luontokohde');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'218', E'772 d. Näköalapaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'219', E'772 e. Eläintarha tai -puisto');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'220', E'772 f. Muu nähtävyys');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'221', E'773 a. Uintipaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'222', E'773 b. Kalastuspaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'223', E'773 c. Hiihtohissi');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'224', E'773 d. Golfkenttä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'225', E'773 e. Huvi- tai teemapuisto');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'226', E'774 a. Mökkimajoitus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'227', E'774 b. Aamiaismajoitus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'228', E'774 c. Suoramyyntipaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'229', E'774 d. Käsityöpaja');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'230', E'774 e. Kotieläinpiha');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'231', E'774 f. Ratsastuspaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'232', E'811. Kohde risteävällä tiellä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'233', E'812. Kohde nuolen suunnassa');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'234', E'813. Kohde nuolen suunnassa');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'235', E'814. Vaikutusalueen pituus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'236', E'815. Etäisyys kohteeseen');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'237', E'816. Etäisyys pakolliseen pysäyttämiseen');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'238', E'821. Vapaa leveys');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'239', E'822. Vapaa korkeus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'240', E'823. Sähköjohdon korkeus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'241', E'824. Vaikutusalue molempiin suuntiin');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'242', E'825. Vaikutusalue molempiin suuntiin');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'243', E'826. Vaikutusalue nuolen suuntaan');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'244', E'827. Vaikutusalue alkaa');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'245', E'828. Vaikutusalue päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'246', E'831. Henkilöauto');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'247', E'832. Linja-auto');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'248', E'833. Kuorma-auto');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'249', E'834. Pakettiauto');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'250', E'835. Matkailuajoneuvo');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'251', E'836. Invalidin ajoneuvo');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'252', E'841. Moottoripyörä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'253', E'842. Mopo');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'254', E'843. Polkupyörä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'255', E'844. Pysäköintitapa');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'256', E'845. Pysäköintitapa');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'257', E'848. Kielto ryhmän A vaarallisten aineiden kuljetukselle');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'258', E'849. Läpiajokielto ryhmän B vaarallisten aineiden kuljetukselle');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'259', E'851. Voimassaoloaika');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'260', E'852. Voimassaoloaika');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'261', E'853. Voimassaoloaika');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'262', E'854. Aikarajoitus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'263', E'855 a. Maksullinen pysäköinti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'264', E'855 b. Maksullinen pysäköinti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'265', E'856 a. Pysäköintikiekon käyttövelvollisuus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'266', E'856 b. Pysäköintikiekon käyttövelvollisuus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'267', E'861 a. Etuajo-oikeutetun liikenteen suunta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'268', E'861 b. Etuajo-oikeutetun liikenteen suunta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'269', E'862. Tukkitie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'270', E'863. Kaksisuuntainen pyörätie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'271', E'871. Tekstillinen lisäkilpi');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'272', E'872. Tekstillinen lisäkilpi Huoltoajo sallittu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi (id, selite) VALUES (E'273', E'880. Hätäpuhelin ja sammutin');
-- ddl-end --

-- object: koodistot.liikennemerkkityyppi2020 | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.liikennemerkkityyppi2020 CASCADE;
CREATE TABLE koodistot.liikennemerkkityyppi2020 (
	id serial NOT NULL,
	selite text,
	CONSTRAINT liikennemerkkityyppi2020_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.liikennemerkkityyppi2020 OWNER TO infrao_admin;
-- ddl-end --

INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'1', E'113. Mutkia');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'2', E'114. Mutkia');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'3', E'132. Lautta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'4', E'172. Rautatien tasoristeys');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'5', E'685. Reitti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'6', E'A1.1. Mutka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'7', E'A27. Rautatien tasoristeys');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'8', E'A7. Lautta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'9', E'C36. Ajokaistakohtainen kielto');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'10', E'F54. Reitti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'11', E'joista ensimmäinen oikealle');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'12', E'joista ensimmäinen vasemmalle');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'13', E'jolla on portaat');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'14', E'jolla on portaat');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'15', E'jossa on puomit');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'16', E'laituri tai ranta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'17', E'rajoitus tai määräys');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'18', E'A1.2. Mutka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'19', E'A2.1. Mutkia');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'20', E'A2.2. Mutkia');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'21', E'A3.1. Jyrkkä mäki');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'22', E'A3.2. Jyrkkä mäki');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'23', E'A4. Kapeneva tie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'24', E'A5. Kaksisuuntainen liikenne');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'25', E'A6. Avattava silta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'26', E'A8. Liikenneruuhka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'27', E'A9. Epätasainen tie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'28', E'A10. Töyssyjä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'29', E'A11. Tietyö');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'30', E'A12. Irtokiviä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'31', E'A13. Liukas ajorata');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'32', E'A14. Vaarallinen tienreuna');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'33', E'A15. Suojatien ennakkovaroitus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'34', E'A16. Jalankulkijoita');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'35', E'A17. Lapsia');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'36', E'A18. Pyöräilijöitä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'37', E'A19. Hiihtolatu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'38', E'A20.1. Hirvi');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'39', E'A20.2. Poro');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'40', E'A20.3. Kauriseläin');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'41', E'A21. Tienristeys');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'42', E'A22.1. Sivutien risteys');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'43', E'A22.2. Sivutien risteys');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'44', E'A22.3. Sivutien risteys');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'45', E'A22.4. Sivutien risteys');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'46', E'A23. Liikennevalot');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'47', E'A24. Liikenneympyrä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'48', E'A25. Raitiovaunu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'49', E'A26. Rautatien tasoristeys ilman puomeja');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'50', E'A28.1–A28.3. Rautatien tasoristeyksen lähestymismerkit');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'51', E'A29.1. Tasoristeys');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'52', E'A29.2. Tasoristeys');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'53', E'A30. Putoavia kiviä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'54', E'A31. Matalalla lentäviä lentokoneita');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'55', E'A32. Sivutuuli');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'56', E'A33. Muu vaara');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'57', E'B1. Etuajo-oikeutettu tie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'58', E'B2. Etuajo-oikeuden päättyminen');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'59', E'B3. Etuajo-oikeus kohdattaessa');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'60', E'B4. Väistämisvelvollisuus kohdattaessa');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'61', E'B5. Väistämisvelvollisuus risteyksessä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'62', E'B6. Pakollinen pysäyttäminen');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'63', E'B6. Pakollinen pysäyttäminen');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'64', E'B7. Väistämisvelvollisuus pyöräilijän tienylityspaikassa');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'65', E'C1. Ajoneuvolla ajo kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'66', E'C2. Moottorikäyttöisellä ajoneuvolla ajo kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'67', E'C3. Kuorma- ja pakettiautolla ajo kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'68', E'C4. Ajoneuvoyhdistelmällä ajo kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'69', E'C5. Traktorilla ajo kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'70', E'C6. Moottoripyörällä ajo kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'71', E'C7. Moottorikelkalla ajo kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'72', E'C8. Vaarallisten aineiden kuljetus kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'73', E'C9. Linja-autolla ajo kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'74', E'C10. Mopolla ajo kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'75', E'C11. Polkupyörällä ajo kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'76', E'C12. Polkupyörällä ja mopolla ajo kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'77', E'C13. Jalankulku kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'78', E'C14. Jalankulku ja polkupyörällä ajo kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'79', E'C15. Jalankulku ja polkupyörällä ja mopolla ajo kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'80', E'C16. Ratsastus kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'81', E'C17. Kielletty ajosuunta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'82', E'C18. Vasemmalle kääntyminen kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'83', E'C19. Oikealle kääntyminen kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'84', E'C20. U-käännös kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'85', E'C21. Ajoneuvon suurin sallittu leveys');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'86', E'C22. Ajoneuvon suurin sallittu korkeus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'87', E'C23. Ajoneuvon tai ajoneuvoyhdistelmän suurin sallittu pituus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'88', E'C24. Ajoneuvon suurin sallittu massa');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'89', E'C25. Ajoneuvoyhdistelmän suurin sallittu massa');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'90', E'C26. Ajoneuvon suurin sallittu akselille kohdistuva massa');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'91', E'C27. Ajoneuvon suurin sallittu telille kohdistuva massa');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'92', E'C28. Ohituskielto');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'93', E'C29. Ohituskielto päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'94', E'C30. Ohituskielto kuorma-autolla');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'95', E'C31. Ohituskielto kuorma-autolla päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'96', E'C32. Nopeusrajoitus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'97', E'C33. Nopeusrajoitus päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'98', E'C34. Nopeusrajoitusalue');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'99', E'C35. Nopeusrajoitusalue päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'100', E'C37. Pysäyttäminen kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'101', E'C38. Pysäköinti kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'102', E'C39. Pysäköintikieltoalue');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'103', E'C40. Pysäköintikieltoalue päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'104', E'C41. Taksiasema-alue');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'105', E'C42. Taksin pysäyttämispaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'106', E'C43. Kuormauspaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'107', E'C44.1. Vuoropysäköinti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'108', E'C44.2. Vuoropysäköinti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'109', E'C45. Pakollinen pysäyttäminen tullitarkastusta varten');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'110', E'C46. Pakollinen pysäyttäminen tarkastusta varten');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'111', E'C47. Moottorikäyttöisten ajoneuvojen vähimmäisetäisyys');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'112', E'C48. Nastarenkailla varustetulla moottorikäyttöisellä ajoneuvolla ajo kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'113', E'D1.1. Pakollinen ajosuunta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'114', E'D1.2. Pakollinen ajosuunta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'115', E'D1.3. Pakollinen ajosuunta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'116', E'D1.4. Pakollinen ajosuunta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'117', E'D1.5. Pakollinen ajosuunta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'118', E'D1.6. Pakollinen ajosuunta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'119', E'D1.7. Pakollinen ajosuunta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'120', E'D1.8. Pakollinen ajosuunta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'121', E'D1.9. Pakollinen ajosuunta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'122', E'D2. Pakollinen kiertosuunta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'123', E'D3.1. Liikenteenjakaja');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'124', E'D3.2. Liikenteenjakaja');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'125', E'D3.3. Liikenteenjakaja');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'126', E'D4. Jalkakäytävä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'127', E'D5. Pyörätie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'128', E'D6. Yhdistetty pyörätie ja jalkakäytävä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'129', E'D7.1. Pyörätie ja jalkakäytävä rinnakkain');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'130', E'D7.2. Pyörätie ja jalkakäytävä rinnakkain');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'131', E'D8. Moottorikelkkailureitti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'132', E'D9. Ratsastustie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'133', E'D10. Vähimmäisnopeus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'134', E'D11. Vähimmäisnopeus päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'135', E'E1. Suojatie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'136', E'E2. Pysäköintipaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'137', E'E3.1. Liityntäpysäköintipaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'138', E'E3.2. Liityntäpysäköintipaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'139', E'E3.3. Liityntäpysäköintipaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'140', E'E3.4. Liityntäpysäköintipaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'141', E'E3.5. Liityntäpysäköintipaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'142', E'E4.1. Ajoneuvojen sijoitus pysäköintipaikalla');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'143', E'E4.2. Ajoneuvojen sijoitus pysäköintipaikalla');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'144', E'E4.3. Ajoneuvojen sijoitus pysäköintipaikalla');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'145', E'E5. Kohtaamispaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'146', E'E6. Linja-autopysäkki');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'147', E'E7. Raitiovaunupysäkki');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'148', E'E8. Taksiasema');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'149', E'E9.1. Linja-autokaista');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'150', E'E9.2. Linja-autokaista');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'151', E'E10.1. Linja-autokaista päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'152', E'E10.2. Linja-autokaista päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'153', E'E11.1. Raitiovaunukaista');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'154', E'E11.2. Raitiovaunukaista');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'155', E'E12.1. Raitiovaunukaista päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'156', E'E12.2. Raitiovaunukaista päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'157', E'E13.1. Pyöräkaista');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'158', E'E13.2. Pyöräkaista');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'159', E'E14.1. Yksisuuntainen tie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'160', E'E14.2. Yksisuuntainen tie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'161', E'E15. Moottoritie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'162', E'E16. Moottoritie päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'163', E'E17. Moottoriliikennetie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'164', E'E18. Moottoriliikennetie päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'165', E'E19. Tunneli');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'166', E'E20. Tunneli päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'167', E'E21. Hätäpysäyttämispaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'168', E'E22. Taajama');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'169', E'E23. Taajama päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'170', E'E24. Pihakatu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'171', E'E25. Pihakatu päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'172', E'E26. Kävelykatu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'173', E'E27. Kävelykatu päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'174', E'E28. Pyöräkatu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'175', E'E29. Pyöräkatu päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'176', E'E30. Ajokaistojen yhdistyminen');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'177', E'F1.1. Suunnistustaulu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'178', E'F1.2. Suunnistustaulu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'179', E'F1.3. Suunnistustaulu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'180', E'F2.1. Suunnistustaulu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'181', E'F2.2. Suunnistustaulu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'182', E'F2.3. Suunnistustaulu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'183', E'F3. Ajokaistakohtainen suunnistustaulu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'184', E'F4.1. Kiertotien suunnistustaulu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'185', E'F4.2. Kiertotien suunnistustaulu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'186', E'F5. Kiertotieopastus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'187', E'F6. Ajoreittiopastus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'188', E'F7.1. Ajokaistaopastus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'189', E'F7.2. Ajokaistaopastus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'190', E'F7.3. Ajokaistaopastus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'191', E'F7.4. Ajokaistaopastus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'192', E'F7.5. Ajokaistaopastus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'193', E'F7.6. Ajokaistaopastus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'194', E'F8.1. Ajokaistan päättyminen');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'195', E'F8.2. Ajokaistan päättyminen');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'196', E'F9. Viitoituksen koontimerkki');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'197', E'F10. Ajokaistan yläpuolinen viitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'198', E'F11. Ajokaistan yläpuolinen viitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'199', E'F12. Ajokaistan yläpuolinen erkanemisviitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'200', E'F13. Tienviitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'201', E'F14. Erkanemisviitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'202', E'F15. Kiertotien viitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'203', E'F16. Osoiteviitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'204', E'F17. Osoiteviitan ennakkomerkki');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'205', E'F18. Liityntäpysäköintiviitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'206', E'F19. Jalankulun viitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'207', E'F20.1. Pyöräilyn viitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'208', E'F20.2. Pyöräilyn viitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'209', E'F21.1. Pyöräilyn suunnistustaulu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'210', E'F21.2. Pyöräilyn suunnistustaulu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'211', E'F22. Pyöräilyn etäisyystaulu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'212', E'F23. Pyöräilyn paikannimi');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'213', E'F24.1. Umpitie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'214', E'F24.2. Umpitie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'215', E'F25. Enimmäisnopeussuositus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'216', E'F26. Etäisyystaulu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'217', E'F27.1. Paikannimi');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'218', E'F27.2. Paikannimi');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'219', E'F28. Kansainvälisen pääliikenneväylän numero');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'220', E'F29. Valtatien numero');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'221', E'F30. Kantatien numero');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'222', E'F31. Seututien numero');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'223', E'F32. Muun maantien numero');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'224', E'F33. Kehätien numero');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'225', E'F34. Eritasoliittymän numero');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'226', E'F35. Opastus merkin tarkoittamalle tielle');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'227', E'F35. Opastus merkin tarkoittamalle tielle');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'228', E'F37. Moottoritien tunnus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'229', E'F38. Moottoriliikennetien tunnus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'230', E'F39. Lentoasema');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'231', E'F40. Autolautta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'232', E'F41. Matkustajasatama');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'233', E'F42. Tavarasatama');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'234', E'F43. Tavaraterminaali');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'235', E'F44. Teollisuusalue tai yritysalue');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'236', E'F45. Vähittäiskaupan suuryksikkö');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'237', E'F46.1. Pysäköinti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'238', E'F46.2. Pysäköinti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'239', E'F47. Rautatieasema');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'240', E'F48. Linja-autoasema');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'241', E'F49. Keskusta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'242', E'F50. Tietylle ajoneuvolle tarkoitettu reitti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'243', E'F51. Vaarallisten aineiden kuljetukselle tarkoitettu reitti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'244', E'F52. Jalankulkijalle tarkoitettu reitti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'245', E'F53. Esteetön reitti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'246', E'F55. Reitti ilman portaita');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'247', E'F56. Hätäuloskäynti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'248', E'F57. Poistumisreitti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'249', E'G1. Palvelukohteen opastustaulu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'250', E'G2. Palvelukohteen opastustaulu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'251', E'G3. Palvelukohteen erkanemisviitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'252', E'G4. Palvelukohteen osoiteviitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'253', E'G5. Palvelukohteen osoiteviitan ennakkomerkki');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'254', E'G6. Radioaseman taajuus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'255', E'G7. Opastuspiste');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'256', E'G8. Opastustoimisto');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'257', E'G9. Ensiapu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'258', E'G10. Autokorjaamo');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'259', E'G11.1. Polttoaineen jakelu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'260', E'G11.2. Polttoaineen jakelu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'261', E'G11.3. Polttoaineen jakelu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'262', E'G11.4. Polttoaineen jakelu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'263', E'G12. Hotelli tai motelli');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'264', E'G13. Ruokailupaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'265', E'G14. Kahvila tai pikaruokapaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'266', E'G15. Käymälä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'267', E'G16. Retkeilymaja');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'268', E'G17. Leirintäalue');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'269', E'G18. Matkailuajoneuvoalue');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'270', E'G19. Levähdysalue');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'271', E'G20. Ulkoilualue');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'272', E'G21. Hätäpuhelin');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'273', E'G22. Sammutin');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'274', E'G23. Museo tai historiallinen rakennus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'275', E'G24. Maailmanperintökohde');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'276', E'G25. Luontokohde');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'277', E'G26. Näköalapaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'278', E'G27. Eläintarha tai -puisto');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'279', E'G28. Muu nähtävyys');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'280', E'G29. Uintipaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'281', E'G30. Kalastuspaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'282', E'G31. Hiihtohissi');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'283', E'G32. Maastohiihtokeskus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'284', E'G33. Golfkenttä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'285', E'G34. Huvi- ja teemapuisto');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'286', E'G35. Mökkimajoitus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'287', E'G36. Aamiaismajoitus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'288', E'G37. Suoramyyntipaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'289', E'G38. Käsityöpaja');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'290', E'G39. Kotieläinpiha');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'291', E'G40. Ratsastuspaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'292', E'G41.1. Matkailutie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'293', E'G41.2. Matkailutie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'294', E'H1. Kohde risteävässä suunnassa');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'295', E'H2.1. Kohde nuolen suunnassa');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'296', E'H2.2. Kohde nuolen suunnassa');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'297', E'H2.3. Kohde nuolen suunnassa');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'298', E'H3. Vaikutusalueen pituus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'299', E'H4. Etäisyys kohteeseen');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'300', E'H5. Etäisyys pakolliseen pysäyttämiseen');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'301', E'H6. Vapaa leveys');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'302', E'H7. Vapaa korkeus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'303', E'H8. Sähköjohdon korkeus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'304', E'H9.1. Vaikutusalue molempiin suuntiin');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'305', E'H9.2. Vaikutusalue molempiin suuntiin');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'306', E'H10. Vaikutusalue nuolen suuntaan');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'307', E'H11. Vaikutusalue päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'308', E'H12.1. Henkilöauto');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'309', E'H12.2. Linja-auto');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'310', E'H12.3. Kuorma-auto');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'311', E'H12.4. Pakettiauto');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'312', E'H12.5. Matkailuperävaunu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'313', E'H12.6. Matkailuauto');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'314', E'H12.7. Invalidin ajoneuvo');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'315', E'H12.8. Moottoripyörä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'316', E'H12.9. Mopo');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'317', E'H12.10. Polkupyörä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'318', E'H12.11. Moottorikelkka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'319', E'H12.12. Traktori');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'320', E'H12.13. Vähäpäästöinen ajoneuvo');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'321', E'H13.1. Pysäköintitapa');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'322', E'H13.2. Pysäköintitapa');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'323', E'H14. Kielto ryhmän A vaarallisten aineiden kuljetukselle');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'324', E'H15. Läpiajokielto ryhmän B vaarallisten aineiden kuljetukselle');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'325', E'H16. Tunneliluokka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'326', E'H17.1. Voimassaoloaika arkisin');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'327', E'H17.2. Voimassaoloaika lauantaisin');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'328', E'H17.3. Voimassaoloaika sunnuntaisin ja pyhinä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'329', E'H18. Aikarajoitus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'330', E'H19.1. Pysäköintiajan alkamisen osoittamisvelvollisuus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'331', E'H19.2. Pysäköintiajan alkamisen osoittamisvelvollisuus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'332', E'H20. Maksullinen pysäköinti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'333', E'H21. Latauspaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'334', E'H22.1. Etuajo-oikeutetun liikenteen suunta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'335', E'H22.2. Etuajo-oikeutetun liikenteen suunta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'336', E'H23.1. Kaksisuuntainen pyörätie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'337', E'H23.2. Kaksisuuntainen pyörätie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'338', E'H24. Tekstillinen lisäkilpi');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'339', E'H25. Huoltoajo sallittu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'340', E'H26. Hätäpuhelin ja sammutin');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'341', E'Aiemman tieliikennelain mukaiset liikennemerkit[muokkaa | muokkaa wikitekstiä]');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'342', E'111. Mutka oikealle');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'343', E'112. Mutka vasemmalle');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'344', E'115. Jyrkkä alamäki');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'345', E'116. Jyrkkä ylämäki');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'346', E'121. Kapeneva tie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'347', E'122. Kaksisuuntainen liikenne');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'348', E'131. Avattava silta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'349', E'133. Liikenneruuhka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'350', E'141. Epätasainen tie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'351', E'141a. Töyssyjä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'352', E'142. Tietyö');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'353', E'143. Irtokiviä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'354', E'144. Liukas ajorata');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'355', E'147. Vaarallinen tien reuna');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'356', E'151. Suojatien ennakkovaroitus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'357', E'152. Lapsia');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'358', E'153. Pyöräilijöitä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'359', E'154. Hiihtolatu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'360', E'155. Hirvieläimiä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'361', E'156. Poroja');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'362', E'161. Tienristeys');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'363', E'162. Sivutien risteys');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'364', E'163. Sivutien risteys');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'365', E'164. Sivutien risteys');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'366', E'165. Liikennevalot');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'367', E'166. Liikenneympyrä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'368', E'167. Raitiotie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'369', E'171. Rautatien tasoristeys ilman puomeja');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'370', E'173–175. Rautatien tasoristeyksen lähestymismerkit');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'371', E'176. Yksiraiteisen rautatien tasoristeys');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'372', E'177. Kaksi- tai useampiraiteisen rautatien tasoristeys');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'373', E'181. Putoavia kiviä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'374', E'182. Matalalla lentäviä lentokoneita');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'375', E'183. Sivutuuli');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'376', E'189. Muu vaara');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'377', E'211. Etuajo-oikeutettu tie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'378', E'212. Etuajo-oikeuden päättyminen');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'379', E'221. Etuajo-oikeus kohdattaessa');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'380', E'222. Väistämisvelvollisuus kohdattaessa');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'381', E'231. Väistämisvelvollisuus risteyksessä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'382', E'232. Pakollinen pysäyttäminen');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'383', E'311. Ajoneuvolla ajo kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'384', E'312. Moottorikäyttöisellä ajoneuvolla ajo kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'385', E'313. Kuorma- ja pakettiautolla ajo kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'386', E'314. Ajoneuvoyhdistelmällä ajo kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'387', E'315. Traktorilla ajo kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'388', E'316. Moottoripyörällä ajo kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'389', E'317. Moottorikelkalla ajo kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'390', E'318. Vaarallisten aineiden kuljetus kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'391', E'319. Linja-autolla ajo kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'392', E'321. Mopolla ajo kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'393', E'322. Polkupyörällä ja mopolla ajo kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'394', E'323. Jalankulku kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'395', E'324. Jalankulku sekä polkupyörällä ja mopolla ajo kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'396', E'325. Ratsastus kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'397', E'331. Kielletty ajosuunta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'398', E'332. Vasemmalle kääntyminen kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'399', E'333. Oikealle kääntyminen kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'400', E'334. U-käännös kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'401', E'341. Ajoneuvon suurin sallittu leveys');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'402', E'342. Ajoneuvon suurin sallittu korkeus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'403', E'343. Ajoneuvon tai ajoneuvoyhdistelmän suurin sallittu pituus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'404', E'344. Ajoneuvon suurin sallittu massa');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'405', E'345. Ajoneuvoyhdistelmän suurin sallittu massa');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'406', E'346. Ajoneuvon suurin sallittu akselille kohdistuva massa');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'407', E'347. Ajoneuvon suurin sallittu telille kohdistuva massa');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'408', E'351. Ohituskielto');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'409', E'352. Ohituskielto päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'410', E'353. Ohituskielto kuorma-autolla');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'411', E'354. Ohituskielto kuorma-autolla päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'412', E'361. Nopeusrajoitus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'413', E'362. Nopeusrajoitus päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'414', E'363. Nopeusrajoitusalue');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'415', E'364. Nopeusrajoitusalue päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'416', E'365. Ajokaistakohtainen kielto tai rajoitus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'417', E'371. Pysäyttäminen kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'418', E'372. Pysäköinti kielletty');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'419', E'373. Pysäköintikieltoalue');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'420', E'374. Pysäköintikieltoalue päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'421', E'375. Taksiasema-alue');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'422', E'376. Taksin pysäyttämispaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'423', E'381. Vuoropysäköinti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'424', E'382. Vuoropysäköinti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'425', E'391. Pakollinen pysäyttäminen tullitarkastusta varten');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'426', E'392. Pakollinen pysäyttäminen tarkastusta varten');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'427', E'393. Moottorikäyttöisten ajoneuvojen vähimmäisetäisyys');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'428', E'411. Pakollinen ajosuunta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'429', E'412. Pakollinen ajosuunta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'430', E'413. Pakollinen ajosuunta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'431', E'414. Pakollinen ajosuunta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'432', E'415. Pakollinen ajosuunta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'433', E'416. Pakollinen kiertosuunta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'434', E'417. Liikenteen jakaja');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'435', E'418. Liikenteen jakaja');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'436', E'421. Jalkakäytävä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'437', E'422. Pyörätie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'438', E'423. Yhdistetty pyörätie ja jalkakäytävä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'439', E'424. Pyörätie ja jalkakäytävä rinnakkain');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'440', E'425. Pyörätie ja jalkakäytävä rinnakkain');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'441', E'426. Moottorikelkkailureitti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'442', E'427. Ratsastustie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'443', E'511. Suojatie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'444', E'520a. Liityntäpysäköintipaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'445', E'520b. Liityntäpysäköintipaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'446', E'521. Pysäköintipaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'447', E'521a. Ajoneuvojen sijoitus pysäköintipaikalla');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'448', E'521b. Ajoneuvojen sijoitus pysäköintipaikalla');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'449', E'521c. Ajoneuvojen sijoitus pysäköintipaikalla');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'450', E'522. Kohtaamispaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'451', E'531. Paikallisliikenteen linja-auton pysäkki');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'452', E'532. Kaukoliikenteen linja-auton pysäkki');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'453', E'533. Raitiovaunun pysäkki');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'454', E'534. Taksiasema');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'455', E'541a. Linja-autokaista');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'456', E'541b. Linja-auto- ja taksikaista');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'457', E'542a. Linja-autokaista päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'458', E'542b. Linja-auto- ja taksikaista päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'459', E'543a. Raitiovaunukaista');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'460', E'543b. Raitiovaunu- ja taksikaista');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'461', E'544a. Raitiovaunukaista päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'462', E'544b. Raitiovaunu- ja taksikaista päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'463', E'551. Yksisuuntainen tie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'464', E'561. Moottoritie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'465', E'562. Moottoritie päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'466', E'563. Moottoriliikennetie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'467', E'564. Moottoriliikennetie päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'468', E'565. Tunneli');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'469', E'566. Tunneli päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'470', E'567. Hätäpysäyttämispaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'471', E'571. Taajama');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'472', E'572. Taajama päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'473', E'573. Pihakatu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'474', E'574. Pihakatu päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'475', E'575. Kävelykatu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'476', E'576. Kävelykatu päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'477', E'611. Suunnistustaulu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'478', E'612. Suunnistustaulu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'479', E'613. Kiertotien suunnistustaulu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'480', E'614. Kiertotien suunnistustaulu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'481', E'615. Kiertotieopastus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'482', E'616. Ajoreittiopastus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'483', E'621. Ajokaistaopastus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'484', E'622. Ajokaistaopastus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'485', E'623. Ajokaistan päättyminen');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'486', E'631. Ajokaistan yläpuolinen viitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'487', E'632. Ajokaistan yläpuolinen viitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'488', E'633. Ajokaistan yläpuolinen erkanemisviitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'489', E'641. Tienviitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'490', E'642. Erkanemisviitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'491', E'643. Yksityisen tien viitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'492', E'643. Yksityisen tien viitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'493', E'644. Osoiteviitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'494', E'644 a. Osoiteviitan ennakkomerkki');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'495', E'645. Kevyen liikenteen viitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'496', E'645. Kevyen liikenteen viitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'497', E'646. Kiertotien viitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'498', E'647. Kiertotien viitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'499', E'648. Paikalliskohteen viitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'500', E'649. Moottori- ja moottoriliikennetien viitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'501', E'650. Liityntäpysäköintiviitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'502', E'651. Umpitie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'503', E'651a. Umpitie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'504', E'652. Umpitie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'505', E'653. Enimmäisnopeussuositus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'506', E'661. Etäisyystaulu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'507', E'662. Paikannimi');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'508', E'663. Kansainvälisen pääliikenneväylän numero');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'509', E'663. Kansainvälisen pääliikenneväylän numero');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'510', E'664. Valtatien numero');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'511', E'665. Kantatien numero');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'512', E'665a. Seututien numero');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'513', E'666. Muun yleisen tien numero');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'514', E'666. Muun yleisen tien numero');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'515', E'667. Opastus numeron tarkoittamalle tielle');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'516', E'667. Opastus numeron tarkoittamalle tielle');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'517', E'671. Moottoritien tunnus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'518', E'672. Moottoriliikennetien tunnus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'519', E'673. Lentoasema');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'520', E'674. Autolautta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'521', E'675. Tavarasatama');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'522', E'676. Teollisuusalue');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'523', E'677. Pysäköinti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'524', E'677a. Katettu pysäköinti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'525', E'678. Rautatieasema');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'526', E'679. Linja-autoasema');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'527', E'681. Tietyille ajoneuvoille tai ajoneuvoyhdistelmille tarkoitettu reitti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'528', E'681. Tietyille ajoneuvoille tai ajoneuvoyhdistelmille tarkoitettu reitti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'529', E'682. Jalankulkijoille tarkoitettu reitti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'530', E'682. Jalankulkijoille tarkoitettu reitti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'531', E'683. Vammaisille tarkoitettu reitti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'532', E'683. Vammaisille tarkoitettu reitti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'533', E'684. Vaarallisten aineiden kuljetuksille tarkoitettu reitti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'534', E'686. Reitti ilman portaita');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'535', E'690. Hätäuloskäynti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'536', E'691. Poistumisreitti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'537', E'701. Palvelukohteen opastustaulu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'538', E'702. Palvelukohteen opastustaulu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'539', E'703. Palvelukohteen erkanemisviitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'540', E'704. Palvelukohteen osoiteviitta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'541', E'704 a. Palvelukohteen osoiteviitan ennakkomerkki');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'542', E'710. Radioaseman taajuus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'543', E'711. Opastuspiste');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'544', E'712. Opastustoimisto');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'545', E'715. Ensiapu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'546', E'721. Autokorjaamo');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'547', E'722. Huoltoasema');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'548', E'723. Hotelli tai motelli');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'549', E'724. Ruokailupaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'550', E'725. Kahvila tai pikaruokapaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'551', E'726. Käymälä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'552', E'731. Retkeilymaja');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'553', E'732. Mökkimajoitus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'554', E'733. Leirintäalue');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'555', E'734. Matkailuajoneuvoalue');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'556', E'741. Levähdysalue');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'557', E'742. Ulkoilualue');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'558', E'771 a. Matkailutie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'559', E'771 a. Matkailutie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'560', E'771 b. Matkailutie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'561', E'772 a. Museo tai historiallinen rakennus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'562', E'772 b. Maailmanperintökohde');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'563', E'772 c. Luontokohde');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'564', E'772 d. Näköalapaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'565', E'772 e. Eläintarha tai -puisto');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'566', E'772 f. Muu nähtävyys');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'567', E'773 a. Uintipaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'568', E'773 b. Kalastuspaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'569', E'773 c. Hiihtohissi');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'570', E'773 d. Golfkenttä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'571', E'773 e. Huvi- tai teemapuisto');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'572', E'774 a. Mökkimajoitus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'573', E'774 b. Aamiaismajoitus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'574', E'774 c. Suoramyyntipaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'575', E'774 d. Käsityöpaja');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'576', E'774 e. Kotieläinpiha');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'577', E'774 f. Ratsastuspaikka');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'578', E'791. Hätäpuhelin');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'579', E'792. Sammutin');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'580', E'811. Kohde risteävällä tiellä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'581', E'812. Kohde nuolen suunnassa');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'582', E'813. Kohde nuolen suunnassa');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'583', E'814. Vaikutusalueen pituus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'584', E'815. Etäisyys kohteeseen');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'585', E'816. Etäisyys pakolliseen pysäyttämiseen');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'586', E'821. Vapaa leveys');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'587', E'822. Vapaa korkeus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'588', E'823. Sähköjohdon korkeus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'589', E'824. Vaikutusalue molempiin suuntiin');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'590', E'825. Vaikutusalue molempiin suuntiin');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'591', E'826. Vaikutusalue nuolen suuntaan');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'592', E'827. Vaikutusalue alkaa');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'593', E'828. Vaikutusalue päättyy');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'594', E'831. Henkilöauto');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'595', E'832. Linja-auto');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'596', E'833. Kuorma-auto');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'597', E'833.2. Ajoneuvoyhdistelmä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'598', E'834. Pakettiauto');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'599', E'835. Matkailuajoneuvo');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'600', E'836. Invalidin ajoneuvo');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'601', E'841. Moottoripyörä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'602', E'842. Mopo');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'603', E'843. Polkupyörä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'604', E'844. Pysäköintitapa');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'605', E'845. Pysäköintitapa');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'606', E'848. Kielto ryhmän A vaarallisten aineiden kuljetukselle');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'607', E'849. Läpiajokielto ryhmän B vaarallisten aineiden kuljetukselle');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'608', E'851. Voimassaoloaika arkisin');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'609', E'852. Voimassaoloaika lauantaisin');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'610', E'853. Voimassaoloaika sunnuntaisin ja pyhinä');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'611', E'854. Aikarajoitus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'612', E'855a. Maksullinen pysäköinti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'613', E'855b. Maksullinen pysäköinti');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'614', E'856a. Pysäköintikiekon käyttövelvollisuus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'615', E'856b. Pysäköintikiekon käyttövelvollisuus');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'616', E'861a. Etuajo-oikeutetun liikenteen suunta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'617', E'861b. Etuajo-oikeutetun liikenteen suunta');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'618', E'862. Tukkitie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'619', E'863. Kaksisuuntainen pyörätie');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'620', E'871. Tekstillinen lisäkilpi');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'621', E'872. Tekstillinen lisäkilpi Huoltoajo sallittu');
-- ddl-end --
INSERT INTO koodistot.liikennemerkkityyppi2020 (id, selite) VALUES (E'622', E'880. Hätäpuhelin ja sammutin');
-- ddl-end --

-- object: koodistot.muutoshoitoluokkatyyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.muutoshoitoluokkatyyppi CASCADE;
CREATE TABLE koodistot.muutoshoitoluokkatyyppi (
	id serial NOT NULL,
	selite text,
	CONSTRAINT muutoshoitoluokkatyyppi_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.muutoshoitoluokkatyyppi OWNER TO infrao_admin;
-- ddl-end --

INSERT INTO koodistot.muutoshoitoluokkatyyppi (id, selite) VALUES (E'1', E'R1 Rakennettu arvoviheralue');
-- ddl-end --
INSERT INTO koodistot.muutoshoitoluokkatyyppi (id, selite) VALUES (E'2', E'R2 Toimintaviheralue');
-- ddl-end --
INSERT INTO koodistot.muutoshoitoluokkatyyppi (id, selite) VALUES (E'3', E'R3 Käyttöviheralue');
-- ddl-end --
INSERT INTO koodistot.muutoshoitoluokkatyyppi (id, selite) VALUES (E'4', E'R4 Suoja- ja vaihettumisviheralue');
-- ddl-end --
INSERT INTO koodistot.muutoshoitoluokkatyyppi (id, selite) VALUES (E'5', E'A1 Arvoniitty');
-- ddl-end --
INSERT INTO koodistot.muutoshoitoluokkatyyppi (id, selite) VALUES (E'6', E'A2 Käyttöniitty');
-- ddl-end --
INSERT INTO koodistot.muutoshoitoluokkatyyppi (id, selite) VALUES (E'7', E'A3 Maisemaniitty');
-- ddl-end --
INSERT INTO koodistot.muutoshoitoluokkatyyppi (id, selite) VALUES (E'8', E'A4 Avoin alue');
-- ddl-end --
INSERT INTO koodistot.muutoshoitoluokkatyyppi (id, selite) VALUES (E'9', E'A5 Maisemapelto');
-- ddl-end --
INSERT INTO koodistot.muutoshoitoluokkatyyppi (id, selite) VALUES (E'10', E'M1 Arvometsä');
-- ddl-end --
INSERT INTO koodistot.muutoshoitoluokkatyyppi (id, selite) VALUES (E'11', E'M2 Lähimetsä');
-- ddl-end --
INSERT INTO koodistot.muutoshoitoluokkatyyppi (id, selite) VALUES (E'12', E'M3 Ulkoilu- ja virkistysmetsä');
-- ddl-end --
INSERT INTO koodistot.muutoshoitoluokkatyyppi (id, selite) VALUES (E'13', E'M4 Suojametsä');
-- ddl-end --
INSERT INTO koodistot.muutoshoitoluokkatyyppi (id, selite) VALUES (E'14', E'M5 Talousmetsä');
-- ddl-end --

-- object: koodistot.muuvarustetyyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.muuvarustetyyppi CASCADE;
CREATE TABLE koodistot.muuvarustetyyppi (
	id serial NOT NULL,
	selite text,
	CONSTRAINT muuvarustetyyppi_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.muuvarustetyyppi OWNER TO infrao_admin;
-- ddl-end --

INSERT INTO koodistot.muuvarustetyyppi (id, selite) VALUES (E'1', E'irtovaruste');
-- ddl-end --
INSERT INTO koodistot.muuvarustetyyppi (id, selite) VALUES (E'2', E'jakokaappi');
-- ddl-end --
INSERT INTO koodistot.muuvarustetyyppi (id, selite) VALUES (E'3', E'kastelulaite');
-- ddl-end --
INSERT INTO koodistot.muuvarustetyyppi (id, selite) VALUES (E'4', E'kelkkamäki');
-- ddl-end --
INSERT INTO koodistot.muuvarustetyyppi (id, selite) VALUES (E'5', E'kuivikeastia');
-- ddl-end --
INSERT INTO koodistot.muuvarustetyyppi (id, selite) VALUES (E'6', E'pelastusväline');
-- ddl-end --
INSERT INTO koodistot.muuvarustetyyppi (id, selite) VALUES (E'7', E'rungonsuojus');
-- ddl-end --
INSERT INTO koodistot.muuvarustetyyppi (id, selite) VALUES (E'8', E'suihku');
-- ddl-end --
INSERT INTO koodistot.muuvarustetyyppi (id, selite) VALUES (E'9', E'sähköauton latauspiste');
-- ddl-end --
INSERT INTO koodistot.muuvarustetyyppi (id, selite) VALUES (E'10', E'sähkökaapeli');
-- ddl-end --
INSERT INTO koodistot.muuvarustetyyppi (id, selite) VALUES (E'11', E'valaisin');
-- ddl-end --
INSERT INTO koodistot.muuvarustetyyppi (id, selite) VALUES (E'12', E'verkkoaita');
-- ddl-end --
INSERT INTO koodistot.muuvarustetyyppi (id, selite) VALUES (E'13', E'vesijohto');
-- ddl-end --
INSERT INTO koodistot.muuvarustetyyppi (id, selite) VALUES (E'14', E'vesipiste');
-- ddl-end --
INSERT INTO koodistot.muuvarustetyyppi (id, selite) VALUES (E'15', E'WC');
-- ddl-end --
INSERT INTO koodistot.muuvarustetyyppi (id, selite) VALUES (E'16', E'muu');
-- ddl-end --
INSERT INTO koodistot.muuvarustetyyppi (id, selite) VALUES (E'17', E'ei tiedossa');
-- ddl-end --

-- object: koodistot.toiminnallinenluokka | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.toiminnallinenluokka CASCADE;
CREATE TABLE koodistot.toiminnallinenluokka (
	id serial NOT NULL,
	selite text,
	CONSTRAINT toiminnallinenluokka_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.toiminnallinenluokka OWNER TO infrao_admin;
-- ddl-end --

INSERT INTO koodistot.toiminnallinenluokka (id, selite) VALUES (E'1', E'aukio');
-- ddl-end --
INSERT INTO koodistot.toiminnallinenluokka (id, selite) VALUES (E'2', E'asuntokatu');
-- ddl-end --
INSERT INTO koodistot.toiminnallinenluokka (id, selite) VALUES (E'3', E'hidaskatu');
-- ddl-end --
INSERT INTO koodistot.toiminnallinenluokka (id, selite) VALUES (E'4', E'kevyen liikenteen väylä');
-- ddl-end --
INSERT INTO koodistot.toiminnallinenluokka (id, selite) VALUES (E'5', E'kokoojakatu');
-- ddl-end --
INSERT INTO koodistot.toiminnallinenluokka (id, selite) VALUES (E'6', E'kävelykatu');
-- ddl-end --
INSERT INTO koodistot.toiminnallinenluokka (id, selite) VALUES (E'7', E'pihakatu');
-- ddl-end --
INSERT INTO koodistot.toiminnallinenluokka (id, selite) VALUES (E'8', E'pysäköintialue');
-- ddl-end --
INSERT INTO koodistot.toiminnallinenluokka (id, selite) VALUES (E'9', E'pääkatu');
-- ddl-end --
INSERT INTO koodistot.toiminnallinenluokka (id, selite) VALUES (E'10', E'tori');
-- ddl-end --
INSERT INTO koodistot.toiminnallinenluokka (id, selite) VALUES (E'11', E'yksityistie');
-- ddl-end --
INSERT INTO koodistot.toiminnallinenluokka (id, selite) VALUES (E'12', E'muu');
-- ddl-end --
INSERT INTO koodistot.toiminnallinenluokka (id, selite) VALUES (E'13', E'ei tiedossa');
-- ddl-end --

-- object: kohteet.hulevesi | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.hulevesi CASCADE;
CREATE TABLE kohteet.hulevesi (
	id serial NOT NULL,
	hulevesityyppi_id integer,
-- 	malli text,
-- 	perusparannusvuosi smallint,
-- 	suunta text,
-- 	valmistaja text,
-- 	valmistumisvuosi smallint,
-- 	kuuluuviheralueenosaan integer,
-- 	kuuluukatualueenosaan integer,
-- 	materiaali_id integer,
-- 	suunnitelmalinkkitieto integer,
-- 	geom_poly geometry(POLYGON, 3067),
-- 	geom_piste geometry(POINT, 3067),
-- 	geom_line geometry(LINESTRING, 3067),
-- 	name text,
-- 	metatieto text,
-- 	yksilointitieto text,
-- 	alkuhetki date,
-- 	loppuhetki date,
	CONSTRAINT hulevesi_pk PRIMARY KEY (id)
)
 INHERITS(abstraktit.abstractvaruste);
-- ddl-end --
ALTER TABLE kohteet.hulevesi OWNER TO infrao_admin;
-- ddl-end --

-- object: kohteet.ajoratamerkinta | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.ajoratamerkinta CASCADE;
CREATE TABLE kohteet.ajoratamerkinta (
	id serial NOT NULL,
	ajoratamerkintatyyppi_id integer,
	jyrsittypintakytkin boolean,
-- 	malli text,
-- 	perusparannusvuosi smallint,
-- 	suunta text,
-- 	valmistaja text,
-- 	valmistumisvuosi smallint,
-- 	kuuluuviheralueenosaan integer,
-- 	kuuluukatualueenosaan integer,
-- 	materiaali_id integer,
-- 	suunnitelmalinkkitieto integer,
-- 	geom_poly geometry(POLYGON, 3067),
-- 	geom_piste geometry(POINT, 3067),
-- 	geom_line geometry(LINESTRING, 3067),
-- 	name text,
-- 	metatieto text,
-- 	yksilointitieto text,
-- 	alkuhetki date,
-- 	loppuhetki date,
	CONSTRAINT ajoratamerkinta_pk PRIMARY KEY (id)
)
 INHERITS(abstraktit.abstractvaruste);
-- ddl-end --
ALTER TABLE kohteet.ajoratamerkinta OWNER TO infrao_admin;
-- ddl-end --

-- object: kohteet.ymparistotaide | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.ymparistotaide CASCADE;
CREATE TABLE kohteet.ymparistotaide (
	id serial NOT NULL,
	ymparistotaidetyyppi_id integer,
-- 	malli text,
-- 	perusparannusvuosi smallint,
-- 	suunta text,
-- 	valmistaja text,
-- 	valmistumisvuosi smallint,
-- 	kuuluuviheralueenosaan integer,
-- 	kuuluukatualueenosaan integer,
-- 	materiaali_id integer,
-- 	suunnitelmalinkkitieto integer,
-- 	geom_poly geometry(POLYGON, 3067),
-- 	geom_piste geometry(POINT, 3067),
-- 	geom_line geometry(LINESTRING, 3067),
-- 	name text,
-- 	metatieto text,
-- 	yksilointitieto text,
-- 	alkuhetki date,
-- 	loppuhetki date,
	CONSTRAINT ymparistotaide_pk PRIMARY KEY (id)
)
 INHERITS(abstraktit.abstractvaruste);
-- ddl-end --
ALTER TABLE kohteet.ymparistotaide OWNER TO infrao_admin;
-- ddl-end --

-- object: meta.aineistotoimituksentiedot | type: TABLE --
-- DROP TABLE IF EXISTS meta.aineistotoimituksentiedot CASCADE;
CREATE TABLE meta.aineistotoimituksentiedot (
	id serial,
	toimitus_id integer,
	aineistonnimi text,
	aineistotoimittaja text,
	tila text,
	toimituspvm date,
	kuntakoodi text,
	kielitieto text,
	metatietotunniste text,
	metatietoxmlurl text,
	metatietourl text,
	tietotuoteurl text

);
-- ddl-end --
COMMENT ON COLUMN meta.aineistotoimituksentiedot.aineistonnimi IS E'Aineistoa kuvaava nimi,';
-- ddl-end --
COMMENT ON COLUMN meta.aineistotoimituksentiedot.aineistotoimittaja IS E'Kuka on tehnyt kyseisen siirtotiedoston, yhteyshenkilö';
-- ddl-end --
COMMENT ON COLUMN meta.aineistotoimituksentiedot.tila IS E'Aineiston valmiustila; onko kokonaan valmis, luonnos, demo';
-- ddl-end --
COMMENT ON COLUMN meta.aineistotoimituksentiedot.toimituspvm IS E'Milloin kyseinen siirtotiedosto on tehty';
-- ddl-end --
COMMENT ON COLUMN meta.aineistotoimituksentiedot.kielitieto IS E'Kunnan kieli tai kielitieto';
-- ddl-end --
COMMENT ON COLUMN meta.aineistotoimituksentiedot.metatietotunniste IS E'Paikkatietohakemistossa aineiston yksilöivä metatietotunniste. Muita nimityksiä: UUID, tiedostotunniste, resurssitunniste, aineiston ID. Esim: 924a68ba-665f-4ea0-a830- 26e80112b5dc';
-- ddl-end --
COMMENT ON COLUMN meta.aineistotoimituksentiedot.metatietoxmlurl IS E'URL, joka palauttaa aineiston metatiedot XML tiedostona ISO 19139 skeeman mukaisesti. Esim: http://geonetwork.nls.fi/geonetwork/srv/fi/iso19139.xml?uuid=924a68ba-665f-4ea0-a830-26e80112b5dc';
-- ddl-end --
COMMENT ON COLUMN meta.aineistotoimituksentiedot.metatietourl IS E'URL www-sivulle, josta aineiston metatiedot ovat luettavissa ”selkokielisenä”. Esim: http://www.paikkatietoikkuna.fi/web/fi/paikkatietoaineisto?inspireMetadat aUIID=924a68ba-665f-4ea0-a830-26e80112b5dc';
-- ddl-end --
COMMENT ON COLUMN meta.aineistotoimituksentiedot.tietotuoteurl IS E'URL, josta saadaan aineistoon liittyvän tietotuotteen tiedot';
-- ddl-end --
ALTER TABLE meta.aineistotoimituksentiedot OWNER TO infrao_admin;
-- ddl-end --

-- object: koodistot.aineistotilatype | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.aineistotilatype CASCADE;
CREATE TABLE koodistot.aineistotilatype (
	id serial NOT NULL,
	selite text,
	CONSTRAINT aineistotilatype_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.aineistotilatype OWNER TO infrao_admin;
-- ddl-end --

INSERT INTO koodistot.aineistotilatype (id, selite) VALUES (E'1', E'valmis');
-- ddl-end --
INSERT INTO koodistot.aineistotilatype (id, selite) VALUES (E'2', E'keskeneräinen');
-- ddl-end --
INSERT INTO koodistot.aineistotilatype (id, selite) VALUES (E'3', E'muu');
-- ddl-end --
INSERT INTO koodistot.aineistotilatype (id, selite) VALUES (E'4', E'ei tiedossa');
-- ddl-end --

-- object: meta.infraokohteet | type: TABLE --
-- DROP TABLE IF EXISTS meta.infraokohteet CASCADE;
CREATE TABLE meta.infraokohteet (
	id serial NOT NULL,
	CONSTRAINT infraokohteet_pk PRIMARY KEY (id)
);
-- ddl-end --
COMMENT ON TABLE meta.infraokohteet IS E'Skeeman juurielementti';
-- ddl-end --
ALTER TABLE meta.infraokohteet OWNER TO infrao_admin;
-- ddl-end --

-- object: abstraktit.abstractinfraomaisuuskohde | type: TABLE --
-- DROP TABLE IF EXISTS abstraktit.abstractinfraomaisuuskohde CASCADE;
CREATE TABLE abstraktit.abstractinfraomaisuuskohde (
	id serial NOT NULL,
	CONSTRAINT abstractinfraomaisuuskohde_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE abstraktit.abstractinfraomaisuuskohde OWNER TO infrao_admin;
-- ddl-end --

-- object: abstraktit.nimi | type: TABLE --
-- DROP TABLE IF EXISTS abstraktit.nimi CASCADE;
CREATE TABLE abstraktit.nimi (
	id serial NOT NULL,
	teksti text,
	lang varchar(10) DEFAULT 'fi',
	CONSTRAINT nimi_pk PRIMARY KEY (id)
);
-- ddl-end --
COMMENT ON TABLE abstraktit.nimi IS E'Voidaan käyttää esim. nimistö tai osoitekohteessa';
-- ddl-end --
ALTER TABLE abstraktit.nimi OWNER TO infrao_admin;
-- ddl-end --

-- object: abstraktit.osoite | type: TABLE --
-- DROP TABLE IF EXISTS abstraktit.osoite CASCADE;
CREATE TABLE abstraktit.osoite (
	id integer NOT NULL,
	kunta varchar(255),
	osoitenumero integer,
	osoitenumero2 integer,
	jakokirjain varchar(255),
	jakokirjain2 varchar(255),
	porras varchar(255),
	huoneisto integer,
	huoneistojakokirjain varchar(255),
	postinmero varchar(5),
	postitoimipaikannimi varchar(255),
	geom_point geometry(POINT, 3067),
	geom_poly geometry(POLYGON, 3067),
	geom_line geometry(LINESTRING, 3067),
	viitesijaintialue varchar(255),
	nimitieto_id integer,
	CONSTRAINT osoite_pk PRIMARY KEY (id)
);
-- ddl-end --
COMMENT ON COLUMN abstraktit.osoite.osoitenumero IS E'Yksi osoitenumero esim. "24"';
-- ddl-end --
COMMENT ON COLUMN abstraktit.osoite.osoitenumero2 IS E'Osoitenumeroväli esimerkiksi 35-37 jälikimmäinen numero';
-- ddl-end --
COMMENT ON COLUMN abstraktit.osoite.jakokirjain IS E'numeron perään tuleva pieni kirjain';
-- ddl-end --
COMMENT ON COLUMN abstraktit.osoite.jakokirjain2 IS E'Jakokirjainvälin jälkimmäinen osa';
-- ddl-end --
COMMENT ON COLUMN abstraktit.osoite.huoneistojakokirjain IS E'Huoneistonumeron perään tuleva pieni kirjain';
-- ddl-end --
COMMENT ON COLUMN abstraktit.osoite.viitesijaintialue IS E'Esim. Korso, Tikkurila';
-- ddl-end --
ALTER TABLE abstraktit.osoite OWNER TO infrao_admin;
-- ddl-end --

-- object: kohteet.pysakointiruutu | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.pysakointiruutu CASCADE;
CREATE TABLE kohteet.pysakointiruutu (
	id serial NOT NULL,
	latauspistekytkin boolean,
-- 	malli text,
-- 	perusparannusvuosi smallint,
-- 	suunta text,
-- 	valmistaja text,
-- 	valmistumisvuosi smallint,
-- 	kuuluuviheralueenosaan integer,
-- 	kuuluukatualueenosaan integer,
-- 	materiaali_id integer,
-- 	suunnitelmalinkkitieto integer,
-- 	geom_poly geometry(POLYGON, 3067),
-- 	geom_piste geometry(POINT, 3067),
-- 	geom_line geometry(LINESTRING, 3067),
-- 	name text,
-- 	metatieto text,
-- 	yksilointitieto text,
-- 	alkuhetki date,
-- 	loppuhetki date,
	CONSTRAINT pysakointiruutu_pk PRIMARY KEY (id)
)
 INHERITS(abstraktit.abstractvaruste);
-- ddl-end --
ALTER TABLE kohteet.pysakointiruutu OWNER TO infrao_admin;
-- ddl-end --

-- object: koodistot.rakennetyyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.rakennetyyppi CASCADE;
CREATE TABLE koodistot.rakennetyyppi (
	id serial NOT NULL,
	CONSTRAINT rakennetyyppi_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.rakennetyyppi OWNER TO infrao_admin;
-- ddl-end --

INSERT INTO koodistot.rakennetyyppi (id) VALUES (E'1');
-- ddl-end --
INSERT INTO koodistot.rakennetyyppi (id) VALUES (E'2');
-- ddl-end --
INSERT INTO koodistot.rakennetyyppi (id) VALUES (E'3');
-- ddl-end --
INSERT INTO koodistot.rakennetyyppi (id) VALUES (E'4');
-- ddl-end --
INSERT INTO koodistot.rakennetyyppi (id) VALUES (E'5');
-- ddl-end --
INSERT INTO koodistot.rakennetyyppi (id) VALUES (E'6');
-- ddl-end --
INSERT INTO koodistot.rakennetyyppi (id) VALUES (E'7');
-- ddl-end --
INSERT INTO koodistot.rakennetyyppi (id) VALUES (E'8');
-- ddl-end --
INSERT INTO koodistot.rakennetyyppi (id) VALUES (E'9');
-- ddl-end --
INSERT INTO koodistot.rakennetyyppi (id) VALUES (E'10');
-- ddl-end --
INSERT INTO koodistot.rakennetyyppi (id) VALUES (E'11');
-- ddl-end --
INSERT INTO koodistot.rakennetyyppi (id) VALUES (E'12');
-- ddl-end --
INSERT INTO koodistot.rakennetyyppi (id) VALUES (E'13');
-- ddl-end --
INSERT INTO koodistot.rakennetyyppi (id) VALUES (E'14');
-- ddl-end --
INSERT INTO koodistot.rakennetyyppi (id) VALUES (E'15');
-- ddl-end --
INSERT INTO koodistot.rakennetyyppi (id) VALUES (E'16');
-- ddl-end --
INSERT INTO koodistot.rakennetyyppi (id) VALUES (E'17');
-- ddl-end --
INSERT INTO koodistot.rakennetyyppi (id) VALUES (E'18');
-- ddl-end --
INSERT INTO koodistot.rakennetyyppi (id) VALUES (E'19');
-- ddl-end --
INSERT INTO koodistot.rakennetyyppi (id) VALUES (E'20');
-- ddl-end --
INSERT INTO koodistot.rakennetyyppi (id) VALUES (E'21');
-- ddl-end --
INSERT INTO koodistot.rakennetyyppi (id) VALUES (E'22');
-- ddl-end --
INSERT INTO koodistot.rakennetyyppi (id) VALUES (E'23');
-- ddl-end --
INSERT INTO koodistot.rakennetyyppi (id) VALUES (E'24');
-- ddl-end --
INSERT INTO koodistot.rakennetyyppi (id) VALUES (E'25');
-- ddl-end --
INSERT INTO koodistot.rakennetyyppi (id) VALUES (E'26');
-- ddl-end --
INSERT INTO koodistot.rakennetyyppi (id) VALUES (E'27');
-- ddl-end --
INSERT INTO koodistot.rakennetyyppi (id) VALUES (E'28');
-- ddl-end --
INSERT INTO koodistot.rakennetyyppi (id) VALUES (E'29');
-- ddl-end --
INSERT INTO koodistot.rakennetyyppi (id) VALUES (E'30');
-- ddl-end --
INSERT INTO koodistot.rakennetyyppi (id) VALUES (E'31');
-- ddl-end --
INSERT INTO koodistot.rakennetyyppi (id) VALUES (E'32');
-- ddl-end --
INSERT INTO koodistot.rakennetyyppi (id) VALUES (E'33');
-- ddl-end --
INSERT INTO koodistot.rakennetyyppi (id) VALUES (E'34');
-- ddl-end --
INSERT INTO koodistot.rakennetyyppi (id) VALUES (E'35');
-- ddl-end --
INSERT INTO koodistot.rakennetyyppi (id) VALUES (E'36');
-- ddl-end --
INSERT INTO koodistot.rakennetyyppi (id) VALUES (E'37');
-- ddl-end --
INSERT INTO koodistot.rakennetyyppi (id) VALUES (E'38');
-- ddl-end --
INSERT INTO koodistot.rakennetyyppi (id) VALUES (E'39');
-- ddl-end --
INSERT INTO koodistot.rakennetyyppi (id) VALUES (E'40');
-- ddl-end --

-- object: koodistot.viherosanlajityyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.viherosanlajityyppi CASCADE;
CREATE TABLE koodistot.viherosanlajityyppi (
	id serial NOT NULL,
	selite text,
	CONSTRAINT viherosanlajityyppi_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.viherosanlajityyppi OWNER TO infrao_admin;
-- ddl-end --

INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'1', E'alikulkukäytävä');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'2', E'beach volley -kenttä');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'3', E'hautausmaa');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'4', E'istutusallas');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'5', E'joki/puro');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'6', E'joutomaa');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'7', E'juoksurata');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'8', E'jättömaa');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'9', E'kallio');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'10', E'kanoottilaituri');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'11', E'katsomo');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'12', E'kenttä');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'13', E'kesäkukkamaa');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'14', E'kesäteatteri');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'15', E'kitumaa');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'16', E'koira-aitaus');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'17', E'koripallokenttä');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'18', E'kosteikko');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'19', E'kuntoilualue');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'20', E'käytävä');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'21', E'laidun');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'22', E'laituri');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'23', E'lampi');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'24', E'lastenallas');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'25', E'leikkialue');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'26', E'leikkikenttä');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'27', E'luonnonsuojelualue');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'28', E'matonpesupaikka');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'29', E'metsitysalue');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'30', E'metsä');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'31', E'monitoimikenttä');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'32', E'muu urheilukenttä');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'33', E'niitty');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'34', E'nurmikko');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'35', E'oja');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'36', E'oleskelualue');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'37', E'paikoitusalue');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'38', E'pallokenttä');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'39', E'pelikenttä');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'40', E'pelto');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'41', E'perennamaa');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'42', E'petankkikenttä');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'43', E'portaat');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'44', E'pukusuoja');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'45', E'pulkkamäki');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'46', E'ranta');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'47', E'ratsastuskenttä');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'48', E'rullaluistelurata');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'49', E'silta');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'50', E'skeittikenttä');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'51', E'suo');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'52', E'tenniskenttä');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'53', E'uimala');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'54', E'ulkoilureitti');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'55', E'ulkoliikunta-alue');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'56', E'uimaranta');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'57', E'venesatama');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'58', E'vesialue');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'59', E'viheralue');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'60', E'viljelyspalsta');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'61', E'muu');
-- ddl-end --
INSERT INTO koodistot.viherosanlajityyppi (id, selite) VALUES (E'62', E'ei tiedossa');
-- ddl-end --

-- object: abstraktit.keskilinja | type: TABLE --
-- DROP TABLE IF EXISTS abstraktit.keskilinja CASCADE;
CREATE TABLE abstraktit.keskilinja (
	id serial NOT NULL,
	digiroadid varchar(255),
	kuuluukatualueenosaan int NOT NULL,
	geom geometry(LINESTRING, 3067),
	CONSTRAINT keskilinja_pk PRIMARY KEY (id)
);
-- ddl-end --
COMMENT ON COLUMN abstraktit.keskilinja.geom IS E'sijainti';
-- ddl-end --
ALTER TABLE abstraktit.keskilinja OWNER TO infrao_admin;
-- ddl-end --

-- object: abstraktit.sijainti | type: TABLE --
-- DROP TABLE IF EXISTS abstraktit.sijainti CASCADE;
CREATE TABLE abstraktit.sijainti (
	id serial NOT NULL,
	alue geometry(POLYGON, 3067),
	piste geometry(POINT, 3067),
	viiva geometry(LINESTRING, 3067),
	luontitapa varchar(255),
	osoitetieto_id integer,
	sijaintiepavarmuus_id integer,
	CONSTRAINT sijainti_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE abstraktit.sijainti OWNER TO infrao_admin;
-- ddl-end --

-- object: koodistot.sijaintiepavarmuustyyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.sijaintiepavarmuustyyppi CASCADE;
CREATE TABLE koodistot.sijaintiepavarmuustyyppi (
	id serial NOT NULL,
	selite varchar(255),
	CONSTRAINT sijaintiepavarmuustyyppi_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.sijaintiepavarmuustyyppi OWNER TO infrao_admin;
-- ddl-end --

INSERT INTO koodistot.sijaintiepavarmuustyyppi (id, selite) VALUES (E'1', E'0.15');
-- ddl-end --
INSERT INTO koodistot.sijaintiepavarmuustyyppi (id, selite) VALUES (E'2', E'0.2');
-- ddl-end --
INSERT INTO koodistot.sijaintiepavarmuustyyppi (id, selite) VALUES (E'3', E'0.3');
-- ddl-end --
INSERT INTO koodistot.sijaintiepavarmuustyyppi (id, selite) VALUES (E'4', E'0.5');
-- ddl-end --
INSERT INTO koodistot.sijaintiepavarmuustyyppi (id, selite) VALUES (E'5', E'0.7');
-- ddl-end --
INSERT INTO koodistot.sijaintiepavarmuustyyppi (id, selite) VALUES (E'6', E'1');
-- ddl-end --
INSERT INTO koodistot.sijaintiepavarmuustyyppi (id, selite) VALUES (E'7', E'1.5');
-- ddl-end --
INSERT INTO koodistot.sijaintiepavarmuustyyppi (id, selite) VALUES (E'8', E'2');
-- ddl-end --
INSERT INTO koodistot.sijaintiepavarmuustyyppi (id, selite) VALUES (E'9', E'3');
-- ddl-end --
INSERT INTO koodistot.sijaintiepavarmuustyyppi (id, selite) VALUES (E'10', E'5');
-- ddl-end --
INSERT INTO koodistot.sijaintiepavarmuustyyppi (id, selite) VALUES (E'11', E'7.5');
-- ddl-end --
INSERT INTO koodistot.sijaintiepavarmuustyyppi (id, selite) VALUES (E'12', E'10');
-- ddl-end --
INSERT INTO koodistot.sijaintiepavarmuustyyppi (id, selite) VALUES (E'13', E'20');
-- ddl-end --

-- object: kohteet.erikoisrakennekerros | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.erikoisrakennekerros CASCADE;
CREATE TABLE kohteet.erikoisrakennekerros (
	id serial NOT NULL,
	erikoisrakennekerrosmateriaalityyppi_id integer,
	omistaja varchar(255),
	haltija varchar(255),
	kunnossapitaja varchar(255),
	selite varchar(255),
	materiaali varchar(255),
	geom geometry(POLYGON, 3067),
	CONSTRAINT erikoisrakennekerros_pk PRIMARY KEY (id)
);
-- ddl-end --
COMMENT ON COLUMN kohteet.erikoisrakennekerros.geom IS E'sijainti';
-- ddl-end --
ALTER TABLE kohteet.erikoisrakennekerros OWNER TO infrao_admin;
-- ddl-end --

-- object: koodistot.erikoisrakennekerrosmateriaalityyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.erikoisrakennekerrosmateriaalityyppi CASCADE;
CREATE TABLE koodistot.erikoisrakennekerrosmateriaalityyppi (
	id serial NOT NULL,
	selite varchar(255),
	CONSTRAINT erikoisrakennekerrosmateriaalityyppi_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.erikoisrakennekerrosmateriaalityyppi OWNER TO infrao_admin;
-- ddl-end --

INSERT INTO koodistot.erikoisrakennekerrosmateriaalityyppi (id, selite) VALUES (E'1', E'paalulaatat ja -hatut');
-- ddl-end --
INSERT INTO koodistot.erikoisrakennekerrosmateriaalityyppi (id, selite) VALUES (E'2', E'vahvistetut maarakenteet');
-- ddl-end --
INSERT INTO koodistot.erikoisrakennekerrosmateriaalityyppi (id, selite) VALUES (E'3', E'roudan- ja lämmöneristykset');
-- ddl-end --
INSERT INTO koodistot.erikoisrakennekerrosmateriaalityyppi (id, selite) VALUES (E'4', E'kevennetyt penkereet');
-- ddl-end --
INSERT INTO koodistot.erikoisrakennekerrosmateriaalityyppi (id, selite) VALUES (E'5', E'maapadot');
-- ddl-end --
INSERT INTO koodistot.erikoisrakennekerrosmateriaalityyppi (id, selite) VALUES (E'6', E'kantava kasvualusta');
-- ddl-end --

-- object: kohteet.muukasvi | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.muukasvi CASCADE;
CREATE TABLE kohteet.muukasvi (
	id serial NOT NULL,
	kasviryhma integer,
	kasvilaji integer,
-- 	omistaja varchar,
-- 	haltija varchar,
-- 	kunnossapitaja varchar,
-- 	kuuluuviheralueenosaan integer,
-- 	kuuluukatualueenosaan integer,
-- 	geom_poly geometry(POLYGON, 3067),
-- 	geom_piste geometry(POINT, 3067),
-- 	geom_line geometry(LINESTRING, 3067),
-- 	name text,
-- 	metatieto text,
-- 	yksilointitieto text,
-- 	alkuhetki date,
-- 	loppuhetki date,
	CONSTRAINT muukasvi_pk PRIMARY KEY (id)
)
 INHERITS(abstraktit.abstractkasvillisuus);
-- ddl-end --
ALTER TABLE kohteet.muukasvi OWNER TO infrao_admin;
-- ddl-end --

-- object: kohteet.puu | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.puu CASCADE;
CREATE TABLE kohteet.puu (
	id serial NOT NULL,
	korkeusmitta smallint,
	ymparysmitta smallint,
	puutyyppi_id integer,
	puulaji_id integer,
-- 	omistaja varchar,
-- 	haltija varchar,
-- 	kunnossapitaja varchar,
-- 	kuuluuviheralueenosaan integer,
-- 	kuuluukatualueenosaan integer,
-- 	geom_poly geometry(POLYGON, 3067),
-- 	geom_piste geometry(POINT, 3067),
-- 	geom_line geometry(LINESTRING, 3067),
-- 	name text,
-- 	metatieto text,
-- 	yksilointitieto text,
-- 	alkuhetki date,
-- 	loppuhetki date,
	CONSTRAINT puu_pk PRIMARY KEY (id)
)
 INHERITS(abstraktit.abstractkasvillisuus);
-- ddl-end --
ALTER TABLE kohteet.puu OWNER TO infrao_admin;
-- ddl-end --

-- object: abstraktit.paatos | type: TABLE --
-- DROP TABLE IF EXISTS abstraktit.paatos CASCADE;
CREATE TABLE abstraktit.paatos (
	id serial NOT NULL,
	liitetieto_id integer,
	kuvaus varchar(2000),
	paivamaarapvm date,
	CONSTRAINT paatos_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE abstraktit.paatos OWNER TO infrao_admin;
-- ddl-end --

-- object: abstraktit.liitetieto | type: TABLE --
-- DROP TABLE IF EXISTS abstraktit.liitetieto CASCADE;
CREATE TABLE abstraktit.liitetieto (
	id serial NOT NULL,
	tiedot varchar(1000),
	suunnitelma_id integer,
	CONSTRAINT liitetieto_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE abstraktit.liitetieto OWNER TO infrao_admin;
-- ddl-end --

-- object: abstraktit.suunnitelma | type: TABLE --
-- DROP TABLE IF EXISTS abstraktit.suunnitelma CASCADE;
CREATE TABLE abstraktit.suunnitelma (
	id serial NOT NULL,
	kuvaus varchar(2000),
	paivamaarapvm date,
	CONSTRAINT suunnitelma_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE abstraktit.suunnitelma OWNER TO infrao_admin;
-- ddl-end --

-- object: abstraktit.suunnitelmalinkki | type: TABLE --
-- DROP TABLE IF EXISTS abstraktit.suunnitelmalinkki CASCADE;
CREATE TABLE abstraktit.suunnitelmalinkki (
	id serial NOT NULL,
	suunnitelmakohdeid varchar(255),
	liitetieto_id integer,
	CONSTRAINT suunnitelmalinkki_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE abstraktit.suunnitelmalinkki OWNER TO infrao_admin;
-- ddl-end --

-- object: abstraktit.liite | type: TABLE --
-- DROP TABLE IF EXISTS abstraktit.liite CASCADE;
CREATE TABLE abstraktit.liite (
	id serial NOT NULL,
	kuvaus varchar(3000),
	linkkiliitteeseen varchar(600),
	muokkaushetki timestamptz,
	versionumero varchar(300),
	CONSTRAINT liite_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE abstraktit.liite OWNER TO infrao_admin;
-- ddl-end --

-- object: koodistot.puhtaanapitoluokkatyyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.puhtaanapitoluokkatyyppi CASCADE;
CREATE TABLE koodistot.puhtaanapitoluokkatyyppi (
	id serial NOT NULL,
	selite text,
	CONSTRAINT puhtaanapitoluokkatyyppi_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE koodistot.puhtaanapitoluokkatyyppi OWNER TO infrao_admin;
-- ddl-end --

INSERT INTO koodistot.puhtaanapitoluokkatyyppi (id, selite) VALUES (E'1', E'P1 Päivittäin (ma-la)');
-- ddl-end --
INSERT INTO koodistot.puhtaanapitoluokkatyyppi (id, selite) VALUES (E'2', E'P2 Työpäivinä (ma-pe)');
-- ddl-end --
INSERT INTO koodistot.puhtaanapitoluokkatyyppi (id, selite) VALUES (E'3', E'P3 Viikoittain (3 krt/vk)');
-- ddl-end --
INSERT INTO koodistot.puhtaanapitoluokkatyyppi (id, selite) VALUES (E'4', E'P4 Viikoittain (2 krt/vk)');
-- ddl-end --
INSERT INTO koodistot.puhtaanapitoluokkatyyppi (id, selite) VALUES (E'5', E'P5 Viikoittain (1 krt/vk)');
-- ddl-end --
INSERT INTO koodistot.puhtaanapitoluokkatyyppi (id, selite) VALUES (E'6', E'P6 Kuukausittain');
-- ddl-end --
INSERT INTO koodistot.puhtaanapitoluokkatyyppi (id, selite) VALUES (E'7', E'P7 Vuosittain');
-- ddl-end --

-- object: talvihoidonluokka_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.viheralueenosa DROP CONSTRAINT IF EXISTS talvihoidonluokka_fk CASCADE;
ALTER TABLE kohteet.viheralueenosa ADD CONSTRAINT talvihoidonluokka_fk FOREIGN KEY (talvihoidonluokka_id)
REFERENCES koodistot.talvihoidonluokka (id) MATCH SIMPLE
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: hoitoluokka_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.viheralueenosa DROP CONSTRAINT IF EXISTS hoitoluokka_fk CASCADE;
ALTER TABLE kohteet.viheralueenosa ADD CONSTRAINT hoitoluokka_fk FOREIGN KEY (hoitoluokka_id)
REFERENCES koodistot.hoitoluokkatyyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kuuluuviherlaueeseen_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.viheralueenosa DROP CONSTRAINT IF EXISTS kuuluuviherlaueeseen_fk CASCADE;
ALTER TABLE kohteet.viheralueenosa ADD CONSTRAINT kuuluuviherlaueeseen_fk FOREIGN KEY (kuuluuviheralueeseen_id)
REFERENCES kohteet.viheralue (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kayttotarkoitus_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.viheralueenosa DROP CONSTRAINT IF EXISTS kayttotarkoitus_fk CASCADE;
ALTER TABLE kohteet.viheralueenosa ADD CONSTRAINT kayttotarkoitus_fk FOREIGN KEY (kayttotarkoitus_id)
REFERENCES koodistot.viheralueenkayttotarkoitus (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: laji_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.viheralueenosa DROP CONSTRAINT IF EXISTS laji_fk CASCADE;
ALTER TABLE kohteet.viheralueenosa ADD CONSTRAINT laji_fk FOREIGN KEY (laji_id)
REFERENCES koodistot.viherosanlajityyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: katualueenlaji_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.viheralueenosa DROP CONSTRAINT IF EXISTS katualueenlaji_fk CASCADE;
ALTER TABLE kohteet.viheralueenosa ADD CONSTRAINT katualueenlaji_fk FOREIGN KEY (katualueenlaji_id)
REFERENCES koodistot.katuosanlaji (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: suunnitelmalinkkitieto_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.viheralueenosa DROP CONSTRAINT IF EXISTS suunnitelmalinkkitieto_fk CASCADE;
ALTER TABLE kohteet.viheralueenosa ADD CONSTRAINT suunnitelmalinkkitieto_fk FOREIGN KEY (suunnitelmalinkkitieto_id)
REFERENCES abstraktit.suunnitelmalinkki (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: puhtaapitoluokka_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.viheralueenosa DROP CONSTRAINT IF EXISTS puhtaapitoluokka_fk CASCADE;
ALTER TABLE kohteet.viheralueenosa ADD CONSTRAINT puhtaapitoluokka_fk FOREIGN KEY (puhtaanapitoluokka_id)
REFERENCES koodistot.puhtaanapitoluokkatyyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: muutoshoitoluokka_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.viheralueenosa DROP CONSTRAINT IF EXISTS muutoshoitoluokka_fk CASCADE;
ALTER TABLE kohteet.viheralueenosa ADD CONSTRAINT muutoshoitoluokka_fk FOREIGN KEY (muutoshoitoluokka_id)
REFERENCES koodistot.muutoshoitoluokkatyyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kunnossapitoluokka_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.katualueenosa DROP CONSTRAINT IF EXISTS kunnossapitoluokka_fk CASCADE;
ALTER TABLE kohteet.katualueenosa ADD CONSTRAINT kunnossapitoluokka_fk FOREIGN KEY (kunnossapitoluokka_id)
REFERENCES koodistot.kunnossapitoluokka (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: katuosanlaji_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.katualueenosa DROP CONSTRAINT IF EXISTS katuosanlaji_fk CASCADE;
ALTER TABLE kohteet.katualueenosa ADD CONSTRAINT katuosanlaji_fk FOREIGN KEY (katuosanlaji_id)
REFERENCES koodistot.katuosanlaji (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: talvihoidonluokka_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.katualueenosa DROP CONSTRAINT IF EXISTS talvihoidonluokka_fk CASCADE;
ALTER TABLE kohteet.katualueenosa ADD CONSTRAINT talvihoidonluokka_fk FOREIGN KEY (talvihoidonluokka_id)
REFERENCES koodistot.talvihoidonluokka (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: pintamateriaali_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.katualueenosa DROP CONSTRAINT IF EXISTS pintamateriaali_fk CASCADE;
ALTER TABLE kohteet.katualueenosa ADD CONSTRAINT pintamateriaali_fk FOREIGN KEY (pintamateriaali_id)
REFERENCES koodistot.pintamateriaali (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: toiminnallinenluokka_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.katualueenosa DROP CONSTRAINT IF EXISTS toiminnallinenluokka_fk CASCADE;
ALTER TABLE kohteet.katualueenosa ADD CONSTRAINT toiminnallinenluokka_fk FOREIGN KEY (luokka_id)
REFERENCES koodistot.toiminnallinenluokka (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: viherosanlajityyppi_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.katualueenosa DROP CONSTRAINT IF EXISTS viherosanlajityyppi_fk CASCADE;
ALTER TABLE kohteet.katualueenosa ADD CONSTRAINT viherosanlajityyppi_fk FOREIGN KEY (viherosanlajityypi_id)
REFERENCES koodistot.viherosanlajityyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kuuluukatualueenosaan_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.keskilinja DROP CONSTRAINT IF EXISTS kuuluukatualueenosaan_fk CASCADE;
ALTER TABLE abstraktit.keskilinja ADD CONSTRAINT kuuluukatualueenosaan__katualueenosa_id_fk FOREIGN KEY (kuuluukatualueenosaan)
REFERENCES kohteet.katualueenosa (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;
-- ddl-end --

-- object: kuuluukatualueeseen_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.katualueenosa DROP CONSTRAINT IF EXISTS kuuluukatualueeseen_fk CASCADE;
ALTER TABLE kohteet.katualueenosa ADD CONSTRAINT kuuluukatualueeseen_fk FOREIGN KEY (kuuluukatualueeseen_id)
REFERENCES kohteet.katualue (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: paatostieto_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.katualueenosa DROP CONSTRAINT IF EXISTS paatostieto_fk CASCADE;
ALTER TABLE kohteet.katualueenosa ADD CONSTRAINT paatostieto_fk FOREIGN KEY (paatostieto_id)
REFERENCES abstraktit.paatos (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: materiaali_fk | type: CONSTRAINT --
-- ALTER TABLE abstraktit.abstractvaruste DROP CONSTRAINT IF EXISTS materiaali_fk CASCADE;
ALTER TABLE abstraktit.abstractvaruste ADD CONSTRAINT materiaali_fk FOREIGN KEY (materiaali_id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: melutyyppi_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.melu DROP CONSTRAINT IF EXISTS melutyyppi_fk CASCADE;
ALTER TABLE kohteet.melu ADD CONSTRAINT melutyyppi_fk FOREIGN KEY (melutyyppi_id)
REFERENCES koodistot.melutyyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: varustemateriaali_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.melu DROP CONSTRAINT IF EXISTS varustemateriaali_fk CASCADE;
ALTER TABLE kohteet.melu ADD CONSTRAINT varustemateriaali_fk FOREIGN KEY (materiaali_id)
REFERENCES koodistot.melutyyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: liikuntatyyppi_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.liikunta DROP CONSTRAINT IF EXISTS liikuntatyyppi_fk CASCADE;
ALTER TABLE kohteet.liikunta ADD CONSTRAINT liikuntatyyppi_fk FOREIGN KEY (liikuntatyyppi_id)
REFERENCES koodistot.liikuntatyyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: varustemateriaali_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.liikunta DROP CONSTRAINT IF EXISTS varustemateriaali_fk CASCADE;
ALTER TABLE kohteet.liikunta ADD CONSTRAINT varustemateriaali_fk FOREIGN KEY (materiaali_id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: opastetyyppi_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.opaste DROP CONSTRAINT IF EXISTS opastetyyppi_fk CASCADE;
ALTER TABLE kohteet.opaste ADD CONSTRAINT opastetyyppi_fk FOREIGN KEY (opastetyyppi_id)
REFERENCES koodistot.opastetyyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: varustemateriaali_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.opaste DROP CONSTRAINT IF EXISTS varustemateriaali_fk CASCADE;
ALTER TABLE kohteet.opaste ADD CONSTRAINT varustemateriaali_fk FOREIGN KEY (materiaali_id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: rakennetyyppi_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.rakenne DROP CONSTRAINT IF EXISTS rakennetyyppi_fk CASCADE;
ALTER TABLE kohteet.rakenne ADD CONSTRAINT rakennetyyppi_fk FOREIGN KEY (rakennetyyyppi_id)
REFERENCES koodistot.rakennetyyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: varustemateriaali_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.rakenne DROP CONSTRAINT IF EXISTS varustemateriaali_fk CASCADE;
ALTER TABLE kohteet.rakenne ADD CONSTRAINT varustemateriaali_fk FOREIGN KEY (materiaali_id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: liikennemerkkityyppi_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.liikennemerkki DROP CONSTRAINT IF EXISTS liikennemerkkityyppi_fk CASCADE;
ALTER TABLE kohteet.liikennemerkki ADD CONSTRAINT liikennemerkkityyppi_fk FOREIGN KEY (liikennemerkkityyppi_id)
REFERENCES koodistot.liikennemerkkityyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: liikennemerkkityyppi2020_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.liikennemerkki DROP CONSTRAINT IF EXISTS liikennemerkkityyppi2020_fk CASCADE;
ALTER TABLE kohteet.liikennemerkki ADD CONSTRAINT liikennemerkkityyppi2020_fk FOREIGN KEY (liikennemerkkityyppi2020_id)
REFERENCES koodistot.liikennemerkkityyppi2020 (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: vaustemateriaali_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.liikennemerkki DROP CONSTRAINT IF EXISTS vaustemateriaali_fk CASCADE;
ALTER TABLE kohteet.liikennemerkki ADD CONSTRAINT vaustemateriaali_fk FOREIGN KEY (materiaali_id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: leikkivalinetyyppi_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.leikkivaline DROP CONSTRAINT IF EXISTS leikkivalinetyyppi_fk CASCADE;
ALTER TABLE kohteet.leikkivaline ADD CONSTRAINT leikkivalinetyyppi_fk FOREIGN KEY (leikkivalinetyyppi_id)
REFERENCES koodistot.leikkivalinetyyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: muuvarustetyyppi_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.muuvaruste DROP CONSTRAINT IF EXISTS muuvarustetyyppi_fk CASCADE;
ALTER TABLE kohteet.muuvaruste ADD CONSTRAINT muuvarustetyyppi_fk FOREIGN KEY (muuvarustetyyppi_id)
REFERENCES koodistot.muuvarustetyyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: varustemateriaali_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.muuvaruste DROP CONSTRAINT IF EXISTS varustemateriaali_fk CASCADE;
ALTER TABLE kohteet.muuvaruste ADD CONSTRAINT varustemateriaali_fk FOREIGN KEY (materiaali_id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: varustemateriaali_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.liikennevalo DROP CONSTRAINT IF EXISTS varustemateriaali_fk CASCADE;
ALTER TABLE kohteet.liikennevalo ADD CONSTRAINT varustemateriaali_fk FOREIGN KEY (materiaali_id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE CASCADE ON UPDATE NO ACTION;
-- ddl-end --

-- object: jatetyyppi_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.jate DROP CONSTRAINT IF EXISTS jatetyyppi_fk CASCADE;
ALTER TABLE kohteet.jate ADD CONSTRAINT jatetyyppi_fk FOREIGN KEY (jatetyyppi_id)
REFERENCES koodistot.jatetyyppi (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: varustemateriaali_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.jate DROP CONSTRAINT IF EXISTS varustemateriaali_fk CASCADE;
ALTER TABLE kohteet.jate ADD CONSTRAINT varustemateriaali_fk FOREIGN KEY (id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kalustetyyppi_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.kaluste DROP CONSTRAINT IF EXISTS kalustetyyppi_fk CASCADE;
ALTER TABLE kohteet.kaluste ADD CONSTRAINT kalustetyyppi_fk FOREIGN KEY (kalustetyyppi_id)
REFERENCES koodistot.kalustetyyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: varustemateriaali_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.kaluste DROP CONSTRAINT IF EXISTS varustemateriaali_fk CASCADE;
ALTER TABLE kohteet.kaluste ADD CONSTRAINT varustemateriaali_fk FOREIGN KEY (materiaali_id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: hulevesityyppi_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.hulevesi DROP CONSTRAINT IF EXISTS hulevesityyppi_fk CASCADE;
ALTER TABLE kohteet.hulevesi ADD CONSTRAINT hulevesityyppi_fk FOREIGN KEY (hulevesityyppi_id)
REFERENCES koodistot.hulevesityyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: varustemateriaali_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.hulevesi DROP CONSTRAINT IF EXISTS varustemateriaali_fk CASCADE;
ALTER TABLE kohteet.hulevesi ADD CONSTRAINT varustemateriaali_fk FOREIGN KEY (materiaali_id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: ajoratamerkintatyyppi_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.ajoratamerkinta DROP CONSTRAINT IF EXISTS ajoratamerkintatyyppi_fk CASCADE;
ALTER TABLE kohteet.ajoratamerkinta ADD CONSTRAINT ajoratamerkintatyyppi_fk FOREIGN KEY (ajoratamerkintatyyppi_id)
REFERENCES koodistot.ajoratamerkintatyyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: ymparistotaidetyyppi_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.ymparistotaide DROP CONSTRAINT IF EXISTS ymparistotaidetyyppi_fk CASCADE;
ALTER TABLE kohteet.ymparistotaide ADD CONSTRAINT ymparistotaidetyyppi_fk FOREIGN KEY (ymparistotaidetyyppi_id)
REFERENCES koodistot.ymparistotaidetyyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: varustemateriaali_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.ymparistotaide DROP CONSTRAINT IF EXISTS varustemateriaali_fk CASCADE;
ALTER TABLE kohteet.ymparistotaide ADD CONSTRAINT varustemateriaali_fk FOREIGN KEY (materiaali_id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: infraokohteet_fk | type: CONSTRAINT --
-- ALTER TABLE meta.aineistotoimituksentiedot DROP CONSTRAINT IF EXISTS infraokohteet_fk CASCADE;
ALTER TABLE meta.aineistotoimituksentiedot ADD CONSTRAINT infraokohteet_fk FOREIGN KEY (toimitus_id)
REFERENCES meta.infraokohteet (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: nimi_fk | type: CONSTRAINT --
-- ALTER TABLE abstraktit.osoite DROP CONSTRAINT IF EXISTS nimi_fk CASCADE;
ALTER TABLE abstraktit.osoite ADD CONSTRAINT nimi_fk FOREIGN KEY (nimitieto_id)
REFERENCES abstraktit.nimi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: varustemateriaali_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.pysakointiruutu DROP CONSTRAINT IF EXISTS varustemateriaali_fk CASCADE;
ALTER TABLE kohteet.pysakointiruutu ADD CONSTRAINT varustemateriaali_fk FOREIGN KEY (materiaali_id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: sijaintiepavarmuustyyppi_fk | type: CONSTRAINT --
-- ALTER TABLE abstraktit.sijainti DROP CONSTRAINT IF EXISTS sijaintiepavarmuustyyppi_fk CASCADE;
ALTER TABLE abstraktit.sijainti ADD CONSTRAINT sijaintiepavarmuustyyppi_fk FOREIGN KEY (sijaintiepavarmuus_id)
REFERENCES koodistot.sijaintiepavarmuustyyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: osoitetieto_fk | type: CONSTRAINT --
-- ALTER TABLE abstraktit.sijainti DROP CONSTRAINT IF EXISTS osoitetieto_fk CASCADE;
ALTER TABLE abstraktit.sijainti ADD CONSTRAINT osoitetieto_fk FOREIGN KEY (osoitetieto_id)
REFERENCES abstraktit.osoite (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: erikoisrakennekerrosmateriaalityyppi_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.erikoisrakennekerros DROP CONSTRAINT IF EXISTS erikoisrakennekerrosmateriaalityyppi_fk CASCADE;
ALTER TABLE kohteet.erikoisrakennekerros ADD CONSTRAINT erikoisrakennekerrosmateriaalityyppi_fk FOREIGN KEY (erikoisrakennekerrosmateriaalityyppi_id)
REFERENCES koodistot.erikoisrakennekerrosmateriaalityyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kasviryhma_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.muukasvi DROP CONSTRAINT IF EXISTS kasviryhma_fk CASCADE;
ALTER TABLE kohteet.muukasvi ADD CONSTRAINT kasviryhma_fk FOREIGN KEY (kasviryhma)
REFERENCES koodistot.kasviryhmatyyppi (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: kasvilaji_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.muukasvi DROP CONSTRAINT IF EXISTS kasvilaji_fk CASCADE;
ALTER TABLE kohteet.muukasvi ADD CONSTRAINT kasvilaji_fk FOREIGN KEY (kasvilaji)
REFERENCES koodistot.kasvilaji (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: puutyyppi_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.puu DROP CONSTRAINT IF EXISTS puutyyppi_fk CASCADE;
ALTER TABLE kohteet.puu ADD CONSTRAINT puutyyppi_fk FOREIGN KEY (puutyyppi_id)
REFERENCES koodistot.puutyyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: puulaji_fk | type: CONSTRAINT --
-- ALTER TABLE kohteet.puu DROP CONSTRAINT IF EXISTS puulaji_fk CASCADE;
ALTER TABLE kohteet.puu ADD CONSTRAINT puulaji_fk FOREIGN KEY (puulaji_id)
REFERENCES koodistot.puulaji (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: liitetieto_fk | type: CONSTRAINT --
-- ALTER TABLE abstraktit.paatos DROP CONSTRAINT IF EXISTS liitetieto_fk CASCADE;
ALTER TABLE abstraktit.paatos ADD CONSTRAINT liitetieto_fk FOREIGN KEY (liitetieto_id)
REFERENCES abstraktit.liitetieto (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: suunnitelma_id | type: CONSTRAINT --
-- ALTER TABLE abstraktit.liitetieto DROP CONSTRAINT IF EXISTS suunnitelma_id CASCADE;
ALTER TABLE abstraktit.liitetieto ADD CONSTRAINT suunnitelma_id FOREIGN KEY (suunnitelma_id)
REFERENCES abstraktit.suunnitelma (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: liitetieto_fk | type: CONSTRAINT --
-- ALTER TABLE abstraktit.suunnitelmalinkki DROP CONSTRAINT IF EXISTS liitetieto_fk CASCADE;
ALTER TABLE abstraktit.suunnitelmalinkki ADD CONSTRAINT liitetieto_fk FOREIGN KEY (liitetieto_id)
REFERENCES abstraktit.liitetieto (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: "grant_CU_eb94f049ac" | type: PERMISSION --
GRANT CREATE,USAGE
   ON SCHEMA public
   TO postgres;
-- ddl-end --

-- object: "grant_CU_cd8e46e7b6" | type: PERMISSION --
GRANT CREATE,USAGE
   ON SCHEMA public
   TO PUBLIC;
-- ddl-end --

-- object: "grant_CcT_46eefe8046" | type: PERMISSION --
GRANT CREATE,CONNECT,TEMPORARY
   ON DATABASE infrao
   TO infrao_admin;
-- ddl-end --


