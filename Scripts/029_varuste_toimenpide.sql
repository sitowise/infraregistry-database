-- object: kohteet.varuste_toimenpidetyyppi | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.varuste_toimenpidetyyppi CASCADE;
CREATE TABLE kohteet.koodisto_varuste_toimenpidetyyppi (
	id integer PRIMARY KEY,
	selite text
);
ALTER TABLE kohteet.koodisto_varuste_toimenpidetyyppi OWNER TO $DatabaseOwner$;

INSERT INTO kohteet.koodisto_varuste_toimenpidetyyppi (id, selite) VALUES (1, 'tarkastus');
INSERT INTO kohteet.koodisto_varuste_toimenpidetyyppi (id, selite) VALUES (2, 'korjaus');
INSERT INTO kohteet.koodisto_varuste_toimenpidetyyppi (id, selite) VALUES (3, 'puhdistus');
INSERT INTO kohteet.koodisto_varuste_toimenpidetyyppi (id, selite) VALUES (4, 'korvaus');

-- object: kohteet.tietolahde | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.tietolahde CASCADE;
CREATE TABLE kohteet.koodisto_tietolahde (
	id integer PRIMARY KEY,
	selite text
);
ALTER TABLE kohteet.koodisto_tietolahde OWNER TO $DatabaseOwner$;

INSERT INTO kohteet.koodisto_tietolahde (id, selite) VALUES (1, 'Routa');
INSERT INTO kohteet.koodisto_tietolahde (id, selite) VALUES (2, 'Louhi');

-- object: kohteet.varuste_toimenpide | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.varuste_toimenpide CASCADE;
CREATE TABLE kohteet.varuste_toimenpide (
	id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    yksilointitieto text DEFAULT uuid_generate_v4()::text NOT NULL,
    toimenpiteen_ajankohta timestamptz NOT NULL,
    toimenpidetyyppi_id integer NOT NULL,
    tietolahde_id integer,
	luonti_pvm timestamptz NOT NULL,
    muokkaus_pvm timestamptz NOT NULL,
    CONSTRAINT varuste_toimenpide_yksilointitieto_key UNIQUE (yksilointitieto),
    CONSTRAINT varuste_toimenpide_toimenpidetyyppi_id_fk FOREIGN KEY (toimenpidetyyppi_id)
        REFERENCES kohteet.koodisto_varuste_toimenpidetyyppi (id) MATCH FULL
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT varuste_toimenpide_tietolahde_id_fk FOREIGN KEY (tietolahde_id)
        REFERENCES kohteet.koodisto_tietolahde (id) MATCH FULL
        ON DELETE RESTRICT ON UPDATE CASCADE
);
ALTER TABLE kohteet.varuste_toimenpide OWNER TO $DatabaseOwner$;

CREATE OR REPLACE FUNCTION kohteet.upsert_date_metadata_to_table()
    RETURNS TRIGGER AS $$
BEGIN
    NEW.muokkaus_pvm := now();

    IF TG_OP = 'INSERT' THEN
        NEW.luonti_pvm := now();
    ELSIF TG_OP = 'UPDATE' THEN
        NEW.luonti_pvm := OLD.luonti_pvm;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

create trigger upsert_date_metadata_trg before
insert or update on kohteet.varuste_toimenpide for each row execute function kohteet.upsert_date_metadata_to_table();

-- object: kohteet.hulevesi_varuste_toimenpide_linkki | type: TABLE --
-- DROP TABLE IF EXISTS kohteet.hulevesi_varuste_toimenpide_linkki CASCADE;
CREATE TABLE kohteet.hulevesi_varuste_toimenpide_linkki (
    id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    hulevesi_id integer NOT NULL REFERENCES kohteet.hulevesi (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    varuste_toimenpide_id integer NOT NULL REFERENCES kohteet.varuste_toimenpide (id) ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED,
    UNIQUE (hulevesi_id, varuste_toimenpide_id)
);
ALTER TABLE kohteet.hulevesi_varuste_toimenpide_linkki OWNER TO $DatabaseOwner$;
