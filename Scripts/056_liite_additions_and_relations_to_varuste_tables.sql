ALTER TABLE kohteet.liite
    ADD COLUMN yksilointitieto text DEFAULT uuid_generate_v4()::text NOT NULL,
        ADD COLUMN luontihetki timestamptz DEFAULT now() NOT NULL,
        ADD COLUMN nimi text;

CREATE TABLE kohteet.ajoratamerkinta_liite (
    ajoratamerkinta_id int NOT NULL REFERENCES kohteet.ajoratamerkinta (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    liite_id int NOT NULL REFERENCES kohteet.liite (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT ajoratamerkinta_liite_pk PRIMARY KEY (ajoratamerkinta_id, liite_id)
);
ALTER TABLE kohteet.ajoratamerkinta_liite OWNER TO $DatabaseOwner$;

CREATE TABLE kohteet.hulevesi_liite (
    hulevesi_id int NOT NULL REFERENCES kohteet.hulevesi (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    liite_id int NOT NULL REFERENCES kohteet.liite (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT hulevesi_liite_pk PRIMARY KEY (hulevesi_id, liite_id)
);
ALTER TABLE kohteet.hulevesi_liite OWNER TO $DatabaseOwner$;

CREATE TABLE kohteet.jate_liite (
    jate_id int NOT NULL REFERENCES kohteet.jate (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    liite_id int NOT NULL REFERENCES kohteet.liite (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT jate_liite_pk PRIMARY KEY (jate_id, liite_id)
);
ALTER TABLE kohteet.jate_liite OWNER TO $DatabaseOwner$;

CREATE TABLE kohteet.kaapeli_liite (
    kaapeli_id int NOT NULL REFERENCES kohteet.kaapeli (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    liite_id int NOT NULL REFERENCES kohteet.liite (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT kaapeli_liite_pk PRIMARY KEY (kaapeli_id, liite_id)
);
ALTER TABLE kohteet.kaapeli_liite OWNER TO $DatabaseOwner$;

CREATE TABLE kohteet.kaluste_liite (
    kaluste_id int NOT NULL REFERENCES kohteet.kaluste (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    liite_id int NOT NULL REFERENCES kohteet.liite (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT kaluste_liite_pk PRIMARY KEY (kaluste_id, liite_id)
);
ALTER TABLE kohteet.kaluste_liite OWNER TO $DatabaseOwner$;

CREATE TABLE kohteet.leikkivaline_liite (
    leikkivaline_id int NOT NULL REFERENCES kohteet.leikkivaline (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    liite_id int NOT NULL REFERENCES kohteet.liite (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT leikkivaline_liite_pk PRIMARY KEY (leikkivaline_id, liite_id)
);
ALTER TABLE kohteet.leikkivaline_liite OWNER TO $DatabaseOwner$;

CREATE TABLE kohteet.liikennemerkki_liite (
    liikennemerkki_id int NOT NULL REFERENCES kohteet.liikennemerkki (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    liite_id int NOT NULL REFERENCES kohteet.liite (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT liikennemerkki_liite_pk PRIMARY KEY (liikennemerkki_id, liite_id)
);
ALTER TABLE kohteet.liikennemerkki_liite OWNER TO $DatabaseOwner$;

CREATE TABLE kohteet.liikunta_liite (
    liikunta_id int NOT NULL REFERENCES kohteet.liikunta (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    liite_id int NOT NULL REFERENCES kohteet.liite (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT liikunta_liite_pk PRIMARY KEY (liikunta_id, liite_id)
);
ALTER TABLE kohteet.liikunta_liite OWNER TO $DatabaseOwner$;

CREATE TABLE kohteet.melu_liite (
    melu_id int NOT NULL REFERENCES kohteet.melu (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    liite_id int NOT NULL REFERENCES kohteet.liite (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT melu_liite_pk PRIMARY KEY (melu_id, liite_id)
);
ALTER TABLE kohteet.melu_liite OWNER TO $DatabaseOwner$;

CREATE TABLE kohteet.muuvaruste_liite (
    muuvaruste_id int NOT NULL REFERENCES kohteet.muuvaruste (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    liite_id int NOT NULL REFERENCES kohteet.liite (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT muuvaruste_liite_pk PRIMARY KEY (muuvaruste_id, liite_id)
);
ALTER TABLE kohteet.muuvaruste_liite OWNER TO $DatabaseOwner$;

CREATE TABLE kohteet.opaste_liite (
    opaste_id int NOT NULL REFERENCES kohteet.opaste (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    liite_id int NOT NULL REFERENCES kohteet.liite (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT opaste_liite_pk PRIMARY KEY (opaste_id, liite_id)
);
ALTER TABLE kohteet.opaste_liite OWNER TO $DatabaseOwner$;

CREATE TABLE kohteet.pysakointiruutu_liite (
    pysakointiruutu_id int NOT NULL REFERENCES kohteet.pysakointiruutu (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    liite_id int NOT NULL REFERENCES kohteet.liite (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT pysakointiruutu_liite_pk PRIMARY KEY (pysakointiruutu_id, liite_id)
);
ALTER TABLE kohteet.pysakointiruutu_liite OWNER TO $DatabaseOwner$;

CREATE TABLE kohteet.rakenne_liite (
    rakenne_id int NOT NULL REFERENCES kohteet.rakenne (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    liite_id int NOT NULL REFERENCES kohteet.liite (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT rakenne_liite_pk PRIMARY KEY (rakenne_id, liite_id)
);
ALTER TABLE kohteet.rakenne_liite OWNER TO $DatabaseOwner$;

CREATE TABLE kohteet.valaisin_liite (
    valaisin_id int NOT NULL REFERENCES kohteet.valaisin (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    liite_id int NOT NULL REFERENCES kohteet.liite (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT valaisin_liite_pk PRIMARY KEY (valaisin_id, liite_id)
);
ALTER TABLE kohteet.valaisin_liite OWNER TO $DatabaseOwner$;

CREATE TABLE kohteet.valaisinkeskus_liite (
    valaisinkeskus_id int NOT NULL REFERENCES kohteet.valaisinkeskus (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    liite_id int NOT NULL REFERENCES kohteet.liite (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT valaisinkeskus_liite_pk PRIMARY KEY (valaisinkeskus_id, liite_id)
);
ALTER TABLE kohteet.valaisinkeskus_liite OWNER TO $DatabaseOwner$;

CREATE TABLE kohteet.ymparistotaide_liite (
    ymparistotaide_id int NOT NULL REFERENCES kohteet.ymparistotaide (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    liite_id int NOT NULL REFERENCES kohteet.liite (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT ymparistotaide_liite_pk PRIMARY KEY (ymparistotaide_id, liite_id)
);
ALTER TABLE kohteet.ymparistotaide_liite OWNER TO $DatabaseOwner$;
