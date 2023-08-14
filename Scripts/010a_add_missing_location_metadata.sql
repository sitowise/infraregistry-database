CREATE TABLE koodistot.luontitapatyyppi (
    id int PRIMARY KEY,
    selite TEXT NOT NULL
);

ALTER TABLE kohteet.erikoisrakennekerros
    RENAME COLUMN geom TO geom_poly;

ALTER TABLE kohteet.erikoisrakennekerros
    ADD COLUMN geom_piste geometry(Point, $Srid$),
    ADD COLUMN geom_viiva geometry(LineString, $Srid$),
    ADD COLUMN luontitapa_id int,
    ADD COLUMN osoite_id int,
    ADD COLUMN sijaintiepavarmuus_id int;

ALTER TABLE abstraktit.abstractvaruste
    ALTER COLUMN suunta TYPE double precision USING (CASE
        WHEN REPLACE(REPLACE(suunta, ',', '.'), ' ', '') ~ '^[0-9]+(\.[0-9]*)?$'
            THEN REPLACE(REPLACE(suunta, ',', '.'), ' ', '')::double precision
        ELSE NULL
    END);

ALTER TABLE abstraktit.abstractvaruste
    ADD COLUMN luontitapa_id int,
    ADD COLUMN osoite_id int,
    ADD COLUMN sijaintiepavarmuus_id int;

ALTER TABLE abstraktit.abstractkasvillisuus
    ADD COLUMN luontitapa_id int,
    ADD COLUMN osoite_id int,
    ADD COLUMN sijaintiepavarmuus_id int;

DO $$
DECLARE
    table_name text;
    tables text[] := ARRAY['ajoratamerkinta', 'hulevesi', 'jate', 'kaluste', 'leikkivaline',
        'liikennemerkki', 'liikennevalo', 'liikunta', 'melu', 'muuvaruste', 'opaste',
        'pysakointiruutu', 'rakenne', 'ymparistotaide', 'puu', 'muukasvi'];
BEGIN
    FOREACH table_name IN ARRAY tables
    LOOP
        EXECUTE format('ALTER TABLE kohteet.%I ADD CONSTRAINT %s FOREIGN KEY (luontitapa_id) REFERENCES koodistot.luontitapatyyppi(id) ON DELETE RESTRICT ON UPDATE CASCADE',
            table_name, table_name || '_luonti_tapa_id__luontitapatype_id_fk');
        EXECUTE format('ALTER TABLE kohteet.%I ADD CONSTRAINT %s FOREIGN KEY (osoite_id) REFERENCES abstraktit.osoite(id) ON DELETE RESTRICT ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED',
            table_name, table_name || '_osoite_id__osoite_id_fk');
        EXECUTE format('ALTER TABLE kohteet.%I ADD CONSTRAINT %s FOREIGN KEY (sijaintiepavarmuus_id) REFERENCES koodistot.sijaintiepavarmuustyyppi(id) ON DELETE RESTRICT ON UPDATE CASCADE',
            table_name, table_name || '_sijaintiepavarmuus_id__sijaintiepavarmuustyyppi_id_fk');
    END LOOP;
END;
$$ LANGUAGE plpgsql;

DROP TABLE abstraktit.sijainti;
