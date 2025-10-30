-- Uusi arvo hulevesityypille: 6 hulevesilinjasto

DELETE FROM kohteet.hulevesityyppi;
INSERT INTO kohteet.hulevesityyppi (id, selite) OVERRIDING SYSTEM VALUE VALUES (1, 'avo-oja');
INSERT INTO kohteet.hulevesityyppi (id, selite) OVERRIDING SYSTEM VALUE VALUES (2, 'avopainanne');
INSERT INTO kohteet.hulevesityyppi (id, selite) OVERRIDING SYSTEM VALUE VALUES (3, 'avouoma');
INSERT INTO kohteet.hulevesityyppi (id, selite) OVERRIDING SYSTEM VALUE VALUES (4, 'hulevesiallas');
INSERT INTO kohteet.hulevesityyppi (id, selite) OVERRIDING SYSTEM VALUE VALUES (5, 'hulevesikaivo');
INSERT INTO kohteet.hulevesityyppi (id, selite) OVERRIDING SYSTEM VALUE VALUES (6, 'hulevesilinjasto');
INSERT INTO kohteet.hulevesityyppi (id, selite) OVERRIDING SYSTEM VALUE VALUES (7, 'hulevesikosteikko');
INSERT INTO kohteet.hulevesityyppi (id, selite) OVERRIDING SYSTEM VALUE VALUES (8, 'imeytyskaivanto');
INSERT INTO kohteet.hulevesityyppi (id, selite) OVERRIDING SYSTEM VALUE VALUES (9, 'imeytyskenttä');
INSERT INTO kohteet.hulevesityyppi (id, selite) OVERRIDING SYSTEM VALUE VALUES (10, 'imeytyspainanne');
INSERT INTO kohteet.hulevesityyppi (id, selite) OVERRIDING SYSTEM VALUE VALUES (11, 'noro');
INSERT INTO kohteet.hulevesityyppi (id, selite) OVERRIDING SYSTEM VALUE VALUES (12, 'patorakenne');
INSERT INTO kohteet.hulevesityyppi (id, selite) OVERRIDING SYSTEM VALUE VALUES (13, 'pidätysallas');
INSERT INTO kohteet.hulevesityyppi (id, selite) OVERRIDING SYSTEM VALUE VALUES (14, 'puro');
INSERT INTO kohteet.hulevesityyppi (id, selite) OVERRIDING SYSTEM VALUE VALUES (15, 'purkukaivo');
INSERT INTO kohteet.hulevesityyppi (id, selite) OVERRIDING SYSTEM VALUE VALUES (16, 'rumpu');
INSERT INTO kohteet.hulevesityyppi (id, selite) OVERRIDING SYSTEM VALUE VALUES (17, 'sulkukaivo');
INSERT INTO kohteet.hulevesityyppi (id, selite) OVERRIDING SYSTEM VALUE VALUES (18, 'säätökaivo');
INSERT INTO kohteet.hulevesityyppi (id, selite) OVERRIDING SYSTEM VALUE VALUES (19, 'säätöpato');
INSERT INTO kohteet.hulevesityyppi (id, selite) OVERRIDING SYSTEM VALUE VALUES (20, 'tarkastuskaivo');
INSERT INTO kohteet.hulevesityyppi (id, selite) OVERRIDING SYSTEM VALUE VALUES (21, 'tarkastusputki');
INSERT INTO kohteet.hulevesityyppi (id, selite) OVERRIDING SYSTEM VALUE VALUES (22, 'tulvauoma');
INSERT INTO kohteet.hulevesityyppi (id, selite) OVERRIDING SYSTEM VALUE VALUES (23, 'vesikouru');
INSERT INTO kohteet.hulevesityyppi (id, selite) OVERRIDING SYSTEM VALUE VALUES (24, 'viivytysallas');
INSERT INTO kohteet.hulevesityyppi (id, selite) OVERRIDING SYSTEM VALUE VALUES (25, 'muu');
INSERT INTO kohteet.hulevesityyppi (id, selite) OVERRIDING SYSTEM VALUE VALUES (26, 'ei tiedossa');
SELECT setval(pg_get_serial_sequence('kohteet.hulevesityyppi', 'id'), (select max(id) from kohteet.hulevesityyppi));

-- Uusi kenttä: kannen halkaisija

ALTER TABLE kohteet.hulevesi ADD COLUMN kannen_halkaisija integer;
