ALTER TABLE kohteet.nimi
    ADD COLUMN is_deleted boolean DEFAULT false NOT NULL;

ALTER TABLE kohteet.osoite
    ADD COLUMN is_deleted boolean DEFAULT false NOT NULL;

ALTER TABLE kohteet.paatos
    ADD COLUMN is_deleted boolean DEFAULT false NOT NULL;

ALTER TABLE kohteet.suunnitelmalinkki
    ADD COLUMN is_deleted boolean DEFAULT false NOT NULL;

ALTER TABLE kohteet.varuste_toimenpide
    ADD COLUMN is_deleted boolean DEFAULT false NOT NULL;
