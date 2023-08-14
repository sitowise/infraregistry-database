CREATE OR REPLACE FUNCTION kohteet.upsert_metadata_to_table()
    RETURNS TRIGGER AS $$
BEGIN
    NEW.muokkaaja := current_user;
    NEW.muokkaus_pvm := now();

    IF TG_OP = 'INSERT' THEN
        NEW.luonti_pvm := now();
        NEW.datan_luoja := current_user;
    ELSIF TG_OP = 'UPDATE' THEN
        NEW.luonti_pvm := OLD.luonti_pvm;
        NEW.datan_luoja := OLD.datan_luoja;
    END IF;

    NEW.metatieto := json_build_object(
        'luonti_pvm', NEW.luonti_pvm,
        'muokkaus_pvm', NEW.muokkaus_pvm,
        'datan_luoja', NEW.datan_luoja,
        'muokkaaja', NEW.muokkaaja
    )::text;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

ALTER TABLE kohteet.abstractpaikkatietopalvelukohde
    ADD COLUMN luonti_pvm timestamptz,
    ADD COLUMN muokkaus_pvm timestamptz,
    ADD COLUMN datan_luoja text,
    ADD COLUMN muokkaaja text;

UPDATE kohteet.abstractpaikkatietopalvelukohde
    SET luonti_pvm = now(),
        muokkaus_pvm = now(),
        datan_luoja = current_user,
        muokkaaja = current_user;

DO $$
DECLARE
    _table regclass;
    cur CURSOR FOR
        WITH RECURSIVE child_tables AS (
            SELECT oid
            FROM pg_class
            WHERE relnamespace = 'kohteet'::regnamespace AND relname = 'abstractpaikkatietopalvelukohde'
            UNION ALL
            SELECT c.oid
            FROM pg_class c
            JOIN pg_inherits i ON c.oid = i.inhrelid
            JOIN child_tables ct ON (i.inhparent = ct.oid)
        )
        SELECT oid::regclass FROM child_tables;
BEGIN
    OPEN cur;
    LOOP
        FETCH NEXT FROM cur INTO _table;
        EXIT WHEN NOT FOUND;
        EXECUTE format('CREATE TRIGGER upsert_metadata_trg
                BEFORE INSERT OR UPDATE ON %s
                FOR EACH ROW EXECUTE PROCEDURE kohteet.upsert_metadata_to_table();', _table);
    END LOOP;
    CLOSE cur;
END $$;

ALTER TABLE kohteet.abstractpaikkatietopalvelukohde
    ALTER COLUMN luonti_pvm SET NOT NULL,
    ALTER COLUMN muokkaus_pvm SET NOT NULL,
    ALTER COLUMN datan_luoja SET NOT NULL,
    ALTER COLUMN muokkaaja SET NOT NULL;
