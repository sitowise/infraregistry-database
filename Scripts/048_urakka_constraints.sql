ALTER TABLE kohteet.urakka
    ADD COLUMN yksilointitieto text DEFAULT uuid_generate_v4()::text NOT NULL
    CONSTRAINT urakka_yksilointitieto_key UNIQUE;

ALTER TABLE kohteet.urakka ADD CONSTRAINT alkuhetkiloppuhetki_check CHECK (
    (alkuhetki IS NULL) OR (loppuhetki IS NULL) OR (loppuhetki >= alkuhetki)
)
