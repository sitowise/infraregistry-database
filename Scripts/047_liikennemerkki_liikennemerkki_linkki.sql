CREATE TABLE kohteet.liikennemerkki_liikennemerkki_linkki (
    liikennemerkki_id1 INTEGER NOT NULL REFERENCES kohteet.liikennemerkki (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    liikennemerkki_id2 INTEGER NOT NULL REFERENCES kohteet.liikennemerkki (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT liikennemerkki_liikennemerkki_linkki_pk PRIMARY KEY (liikennemerkki_id1, liikennemerkki_id2)
);
ALTER TABLE kohteet.liikennemerkki_liikennemerkki_linkki OWNER TO $DatabaseOwner$;
