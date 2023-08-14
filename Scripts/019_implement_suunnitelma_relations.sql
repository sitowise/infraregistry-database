CREATE TABLE kohteet.ajoratamerkinta_suunnitelmalinkki (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    ajoratamerkinta_id INTEGER NOT NULL REFERENCES kohteet.ajoratamerkinta (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    suunnitelmalinkki_id INTEGER NOT NULL REFERENCES kohteet.suunnitelmalinkki (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    UNIQUE (ajoratamerkinta_id, suunnitelmalinkki_id)
);

CREATE TABLE kohteet.hulevesi_suunnitelmalinkki (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    hulevesi_id INTEGER NOT NULL REFERENCES kohteet.hulevesi (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    suunnitelmalinkki_id INTEGER NOT NULL REFERENCES kohteet.suunnitelmalinkki (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    UNIQUE (hulevesi_id, suunnitelmalinkki_id)
);

CREATE TABLE kohteet.jate_suunnitelmalinkki (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    jate_id INTEGER NOT NULL REFERENCES kohteet.jate (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    suunnitelmalinkki_id INTEGER NOT NULL REFERENCES kohteet.suunnitelmalinkki (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    UNIQUE (jate_id, suunnitelmalinkki_id)
);

CREATE TABLE kohteet.kaluste_suunnitelmalinkki (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    kaluste_id INTEGER NOT NULL REFERENCES kohteet.kaluste (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    suunnitelmalinkki_id INTEGER NOT NULL REFERENCES kohteet.suunnitelmalinkki (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    UNIQUE (kaluste_id, suunnitelmalinkki_id)
);

CREATE TABLE kohteet.leikkivaline_suunnitelmalinkki (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    leikkivaline_id INTEGER NOT NULL REFERENCES kohteet.leikkivaline (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    suunnitelmalinkki_id INTEGER NOT NULL REFERENCES kohteet.suunnitelmalinkki (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    UNIQUE (leikkivaline_id, suunnitelmalinkki_id)
);

CREATE TABLE kohteet.liikennemerkki_suunnitelmalinkki (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    liikennemerkki_id INTEGER NOT NULL REFERENCES kohteet.liikennemerkki (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    suunnitelmalinkki_id INTEGER NOT NULL REFERENCES kohteet.suunnitelmalinkki (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    UNIQUE (liikennemerkki_id, suunnitelmalinkki_id)
);

CREATE TABLE kohteet.liikunta_suunnitelmalinkki (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    liikunta_id INTEGER NOT NULL REFERENCES kohteet.liikunta (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    suunnitelmalinkki_id INTEGER NOT NULL REFERENCES kohteet.suunnitelmalinkki (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    UNIQUE (liikunta_id, suunnitelmalinkki_id)
);

CREATE TABLE kohteet.melu_suunnitelmalinkki (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    melu_id INTEGER NOT NULL REFERENCES kohteet.melu (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    suunnitelmalinkki_id INTEGER NOT NULL REFERENCES kohteet.suunnitelmalinkki (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    UNIQUE (melu_id, suunnitelmalinkki_id)
);

CREATE TABLE kohteet.muuvaruste_suunnitelmalinkki (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    muuvaruste_id INTEGER NOT NULL REFERENCES kohteet.muuvaruste (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    suunnitelmalinkki_id INTEGER NOT NULL REFERENCES kohteet.suunnitelmalinkki (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    UNIQUE (muuvaruste_id, suunnitelmalinkki_id)
);

CREATE TABLE kohteet.opaste_suunnitelmalinkki (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    opaste_id INTEGER NOT NULL REFERENCES kohteet.opaste (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    suunnitelmalinkki_id INTEGER NOT NULL REFERENCES kohteet.suunnitelmalinkki (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    UNIQUE (opaste_id, suunnitelmalinkki_id)
);

CREATE TABLE kohteet.pysakointiruutu_suunnitelmalinkki (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    pysakointiruutu_id INTEGER NOT NULL REFERENCES kohteet.pysakointiruutu (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    suunnitelmalinkki_id INTEGER NOT NULL REFERENCES kohteet.suunnitelmalinkki (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    UNIQUE (pysakointiruutu_id, suunnitelmalinkki_id)
);

CREATE TABLE kohteet.rakenne_suunnitelmalinkki (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    rakenne_id INTEGER NOT NULL REFERENCES kohteet.rakenne (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    suunnitelmalinkki_id INTEGER NOT NULL REFERENCES kohteet.suunnitelmalinkki (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    UNIQUE (rakenne_id, suunnitelmalinkki_id)
);

CREATE TABLE kohteet.ymparistotaide_suunnitelmalinkki (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    ymparistotaide_id INTEGER NOT NULL REFERENCES kohteet.ymparistotaide (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    suunnitelmalinkki_id INTEGER NOT NULL REFERENCES kohteet.suunnitelmalinkki (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    UNIQUE (ymparistotaide_id, suunnitelmalinkki_id)
);

CREATE TABLE kohteet.katualueenosa_suunnitelmalinkki (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    katualueenosa_id INTEGER NOT NULL REFERENCES kohteet.katualueenosa (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    suunnitelmalinkki_id INTEGER NOT NULL REFERENCES kohteet.suunnitelmalinkki (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    UNIQUE (katualueenosa_id, suunnitelmalinkki_id)
);

CREATE TABLE kohteet.viheralueenosa_suunnitelmalinkki (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    viheralueenosa_id INTEGER NOT NULL REFERENCES kohteet.viheralueenosa (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    suunnitelmalinkki_id INTEGER NOT NULL REFERENCES kohteet.suunnitelmalinkki (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    UNIQUE (viheralueenosa_id, suunnitelmalinkki_id)
);

ALTER TABLE kohteet.abstractvaruste
    DROP COLUMN suunnitelmalinkkitieto;

ALTER TABLE kohteet.katualueenosa
    DROP COLUMN suunnitelmalinkkitieto_id;

ALTER TABLE kohteet.viheralueenosa
    DROP COLUMN suunnitelmalinkkitieto_id;

ALTER TABLE kohteet.suunnitelmalinkki
    DROP CONSTRAINT liitetieto_id__liitetieto_id_fk;

ALTER TABLE kohteet.suunnitelmalinkki
    ADD CONSTRAINT suunnitelmalinkki_liite_id_fk FOREIGN KEY (liitetieto_id)
    REFERENCES kohteet.liite(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
    DEFERRABLE INITIALLY DEFERRED;
