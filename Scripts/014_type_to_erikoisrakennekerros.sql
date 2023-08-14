ALTER TABLE koodistot.erikoisrakennekerrosmateriaalityyppi
    RENAME TO erikoisrakennekerrostyyppi;

ALTER TABLE kohteet.erikoisrakennekerros
    ADD COLUMN tyyppi_id int;

ALTER TABLE kohteet.erikoisrakennekerros
    ADD CONSTRAINT erikoisrakennekerros_tyyppi_id__erikoisrakennekerros_id_fk
        FOREIGN KEY (tyyppi_id)
        REFERENCES koodistot.erikoisrakennekerrostyyppi(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE;
