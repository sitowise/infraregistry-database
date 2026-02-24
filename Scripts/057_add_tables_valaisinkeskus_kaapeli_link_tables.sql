--create link table for valaisinkeskus with varuste toimenpide
CREATE TABLE kohteet.valaisinkeskus_varuste_toimenpide_linkki (
    valaisinkeskus_id integer NOT NULL REFERENCES kohteet.valaisinkeskus (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    varuste_toimenpide_id integer NOT NULL REFERENCES kohteet.varuste_toimenpide (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT valaisinkeskus_varuste_toimenpide_linkki_pk PRIMARY KEY (valaisinkeskus_id, varuste_toimenpide_id)
);
ALTER TABLE kohteet.valaisinkeskus_varuste_toimenpide_linkki OWNER TO $DatabaseOwner$;

--create link table for kaapeli with varuste toimenpide
CREATE TABLE kohteet.kaapeli_varuste_toimenpide_linkki (
    kaapeli_id integer NOT NULL REFERENCES kohteet.kaapeli (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    varuste_toimenpide_id integer NOT NULL REFERENCES kohteet.varuste_toimenpide (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT kaapeli_varuste_toimenpide_linkki_pk PRIMARY KEY (kaapeli_id, varuste_toimenpide_id)
);
ALTER TABLE kohteet.kaapeli_varuste_toimenpide_linkki OWNER TO $DatabaseOwner$;