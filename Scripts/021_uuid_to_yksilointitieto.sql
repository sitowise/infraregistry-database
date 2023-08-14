CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

ALTER TABLE kohteet.abstractpaikkatietopalvelukohde
    ALTER COLUMN yksilointitieto SET DEFAULT uuid_generate_v4()::text;

UPDATE kohteet.abstractpaikkatietopalvelukohde
    SET yksilointitieto = uuid_generate_v4()::text
    WHERE yksilointitieto IS NULL OR
        yksilointitieto !~ '^[0-9A-Fa-f]{8}-[0-9A-Fa-f]{4}-[1-5][0-9A-Fa-f]{3}-[89ABab][0-9A-Fa-f]{3}-[0-9A-Fa-f]{12}$';

ALTER TABLE kohteet.abstractpaikkatietopalvelukohde
    ALTER COLUMN yksilointitieto SET NOT NULL,
    ADD CONSTRAINT yksilointitieto_uuid_check
        CHECK (yksilointitieto ~ '^[0-9A-Fa-f]{8}-[0-9A-Fa-f]{4}-[1-5][0-9A-Fa-f]{3}-[89ABab][0-9A-Fa-f]{3}-[0-9A-Fa-f]{12}$');
