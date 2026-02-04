-- VALAISIN - add missing relations

ALTER TABLE kohteet.valaisin
    ADD CONSTRAINT valaisin_kuuluukatualueenosaan_katualueenosa_id_fk FOREIGN KEY (kuuluukatualueenosaan) REFERENCES kohteet.katualueenosa(id) MATCH FULL ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    ADD CONSTRAINT valaisin_kuuluuviheralueenosaan_viheralueenosa_id_fk FOREIGN KEY (kuuluuviheralueenosaan) REFERENCES kohteet.viheralueenosa(id) MATCH FULL ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    ADD CONSTRAINT valaisin_luontitapa_id_luontitapatype_id_fk FOREIGN KEY (luontitapa_id) REFERENCES kohteet.luontitapatyyppi(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    ADD CONSTRAINT valaisin_osoite_id_osoite_id_fk FOREIGN KEY (osoite_id) REFERENCES kohteet.osoite(id) ON DELETE RESTRICT ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    ADD CONSTRAINT valaisin_sijaintiepavarmuus_id_sijaintiepavarmuustyyppi_ FOREIGN KEY (sijaintiepavarmuus_id) REFERENCES kohteet.sijaintiepavarmuustyyppi(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    ADD CONSTRAINT valaisin_materiaali_id_varustemateriaali_id_fk FOREIGN KEY (materiaali_id) REFERENCES kohteet.varustemateriaali(id) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE;

-- VALASISIN - add sunnitelmalinkki table

CREATE TABLE kohteet.valaisin_suunnitelmalinkki (
    valaisin_id int NOT NULL REFERENCES kohteet.valaisin (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    suunnitelmalinkki_id int NOT NULL REFERENCES kohteet.suunnitelmalinkki (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT valaisin_suunnitelmalinkki_pk PRIMARY KEY (valaisin_id, suunnitelmalinkki_id)
);
ALTER TABLE kohteet.valaisin_suunnitelmalinkki OWNER TO $DatabaseOwner$;

-- VALAISINKESKUS - add missing relations

ALTER TABLE kohteet.valaisinkeskus
    ADD CONSTRAINT valaisinkeskus_kuuluukatualueenosaan_katualueenosa_id_fk FOREIGN KEY (kuuluukatualueenosaan) REFERENCES kohteet.katualueenosa(id) MATCH FULL ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    ADD CONSTRAINT valaisinkeskus_kuuluuviheralueenosaan_viheralueenosa_id_fk FOREIGN KEY (kuuluuviheralueenosaan) REFERENCES kohteet.viheralueenosa(id) MATCH FULL ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    ADD CONSTRAINT valaisinkeskus_luontitapa_id_luontitapatype_id_fk FOREIGN KEY (luontitapa_id) REFERENCES kohteet.luontitapatyyppi(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    ADD CONSTRAINT valaisinkeskus_osoite_id_osoite_id_fk FOREIGN KEY (osoite_id) REFERENCES kohteet.osoite(id) ON DELETE RESTRICT ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    ADD CONSTRAINT valaisinkeskus_sijaintiepavarmuus_id_sijaintiepavarmuustyyppi_ FOREIGN KEY (sijaintiepavarmuus_id) REFERENCES kohteet.sijaintiepavarmuustyyppi(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    ADD CONSTRAINT valaisinkeskus_materiaali_id_varustemateriaali_id_fk FOREIGN KEY (materiaali_id) REFERENCES kohteet.varustemateriaali(id) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE;

-- VALAISINKESKUS - add sunnitelmalinkki table

CREATE TABLE kohteet.valaisinkeskus_suunnitelmalinkki (
    valaisinkeskus_id int NOT NULL REFERENCES kohteet.valaisinkeskus (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    suunnitelmalinkki_id int NOT NULL REFERENCES kohteet.suunnitelmalinkki (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT valaisinkeskus_suunnitelmalinkki_pk PRIMARY KEY (valaisinkeskus_id, suunnitelmalinkki_id)
);
ALTER TABLE kohteet.valaisinkeskus_suunnitelmalinkki OWNER TO $DatabaseOwner$;

-- KAAPELI - add missing relations

ALTER TABLE kohteet.kaapeli
    ADD CONSTRAINT kaapeli_kuuluukatualueenosaan_katualueenosa_id_fk FOREIGN KEY (kuuluukatualueenosaan) REFERENCES kohteet.katualueenosa(id) MATCH FULL ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    ADD CONSTRAINT kaapeli_kuuluuviheralueenosaan_viheralueenosa_id_fk FOREIGN KEY (kuuluuviheralueenosaan) REFERENCES kohteet.viheralueenosa(id) MATCH FULL ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    ADD CONSTRAINT kaapeli_luontitapa_id_luontitapatype_id_fk FOREIGN KEY (luontitapa_id) REFERENCES kohteet.luontitapatyyppi(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    ADD CONSTRAINT kaapeli_osoite_id_osoite_id_fk FOREIGN KEY (osoite_id) REFERENCES kohteet.osoite(id) ON DELETE RESTRICT ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    ADD CONSTRAINT kaapeli_sijaintiepavarmuus_id_sijaintiepavarmuustyyppi_ FOREIGN KEY (sijaintiepavarmuus_id) REFERENCES kohteet.sijaintiepavarmuustyyppi(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    ADD CONSTRAINT kaapeli_materiaali_id_varustemateriaali_id_fk FOREIGN KEY (materiaali_id) REFERENCES kohteet.varustemateriaali(id) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE;

-- KAAPELI - add sunnitelmalinkki table

CREATE TABLE kohteet.kaapeli_suunnitelmalinkki (
    kaapeli_id int NOT NULL REFERENCES kohteet.kaapeli (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    suunnitelmalinkki_id int NOT NULL REFERENCES kohteet.suunnitelmalinkki (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT kaapeli_suunnitelmalinkki_pk PRIMARY KEY (kaapeli_id, suunnitelmalinkki_id)
);
ALTER TABLE kohteet.kaapeli_suunnitelmalinkki OWNER TO $DatabaseOwner$;
