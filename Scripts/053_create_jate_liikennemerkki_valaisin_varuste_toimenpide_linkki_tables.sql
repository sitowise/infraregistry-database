
CREATE TABLE kohteet.jate_varuste_toimenpide_linkki (
    jate_id integer NOT NULL REFERENCES kohteet.jate (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    varuste_toimenpide_id integer NOT NULL REFERENCES kohteet.varuste_toimenpide (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT jate_varuste_toimenpide_linkki_pk PRIMARY KEY (jate_id, varuste_toimenpide_id)
);
ALTER TABLE kohteet.jate_varuste_toimenpide_linkki OWNER TO $DatabaseOwner$;

CREATE TABLE kohteet.liikennemerkki_varuste_toimenpide_linkki (
    liikennemerkki_id integer NOT NULL REFERENCES kohteet.liikennemerkki (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    varuste_toimenpide_id integer NOT NULL REFERENCES kohteet.varuste_toimenpide (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT liikennemerkki_varuste_toimenpide_linkki_pk PRIMARY KEY (liikennemerkki_id, varuste_toimenpide_id)
);
ALTER TABLE kohteet.liikennemerkki_varuste_toimenpide_linkki OWNER TO $DatabaseOwner$;

CREATE TABLE kohteet.valaisin_varuste_toimenpide_linkki (
    valaisin_id integer NOT NULL REFERENCES kohteet.valaisin (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    varuste_toimenpide_id integer NOT NULL REFERENCES kohteet.varuste_toimenpide (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT valaisin_varuste_toimenpide_linkki_pk PRIMARY KEY (valaisin_id, varuste_toimenpide_id)
);
ALTER TABLE kohteet.valaisin_varuste_toimenpide_linkki OWNER TO $DatabaseOwner$;