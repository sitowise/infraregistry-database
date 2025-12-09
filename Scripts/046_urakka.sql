CREATE TABLE kohteet.urakka (
    id INTEGER CONSTRAINT urakka_pk PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
    nimi text,
    urakkanumero INTEGER,
    alkuhetki timestamptz NOT NULL,
    loppuhetki timestamptz NULL,
    geom_poly geometry(POLYGON, $Srid$)
);

ALTER TABLE kohteet.urakka OWNER TO $DatabaseOwner$;

CREATE TABLE kohteet.hulevesi_urakka (
    hulevesi_id INTEGER NOT NULL REFERENCES kohteet.hulevesi (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    urakka_id INTEGER NOT NULL REFERENCES kohteet.urakka (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT hulevesi_urakka_pk PRIMARY KEY (hulevesi_id, urakka_id)
);

CREATE TABLE kohteet.jate_urakka (
    jate_id INTEGER NOT NULL REFERENCES kohteet.jate (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    urakka_id INTEGER NOT NULL REFERENCES kohteet.urakka (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT jate_urakka_pk PRIMARY KEY (jate_id, urakka_id)
);

CREATE TABLE kohteet.liikennemerkki_urakka (
    liikennemerkki_id INTEGER NOT NULL REFERENCES kohteet.liikennemerkki (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    urakka_id INTEGER NOT NULL REFERENCES kohteet.urakka (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT liikennemerkki_urakka_pk PRIMARY KEY (liikennemerkki_id, urakka_id)
);
