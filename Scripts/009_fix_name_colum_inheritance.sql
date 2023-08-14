ALTER TABLE kohteet.katualue
    INHERIT abstraktit.abstractinfraomaisuuskohde;
ALTER TABLE kohteet.viheralue
    INHERIT abstraktit.abstractinfraomaisuuskohde;
ALTER TABLE kohteet.erikoisrakennekerros
    INHERIT abstraktit.abstractinfraomaisuuskohde;

ALTER TABLE kohteet.katualue
    ADD COLUMN "nimi" TEXT;
ALTER TABLE kohteet.viheralue
    ADD COLUMN "nimi" TEXT;

UPDATE kohteet.katualue k
    SET "nimi" = (
        SELECT array_to_string(array_agg(DISTINCT ko."name"), ',')
        FROM kohteet.katualueenosa ko
        WHERE k.id = ko.kuuluukatualueeseen_id
        );

UPDATE kohteet.viheralue v
    SET "nimi" = (
        SELECT array_to_string(array_agg(DISTINCT vo."name"), ',')
        FROM kohteet.viheralueenosa vo
        WHERE v.id = vo.kuuluuviheralueeseen_id
        );

ALTER TABLE abstraktit.abstractpaikkatietopalvelukohde
    DROP COLUMN "name";

ALTER TABLE abstraktit.abstractinfraomaisuuskohde
    ADD COLUMN "metatieto" TEXT,
    ADD COLUMN "yksilointitieto" TEXT,
    ADD COLUMN "alkuhetki" DATE,
    ADD COLUMN "loppuhetki" DATE;

ALTER TABLE abstraktit.abstractinfraomaisuuskohde
    INHERIT abstraktit.abstractpaikkatietopalvelukohde;
