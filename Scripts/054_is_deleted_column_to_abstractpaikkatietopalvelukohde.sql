ALTER TABLE kohteet.abstractpaikkatietopalvelukohde
    ADD COLUMN is_deleted boolean DEFAULT false NOT NULL;

ALTER TABLE kohteet.liite
    ADD COLUMN is_deleted boolean DEFAULT false NOT NULL;
