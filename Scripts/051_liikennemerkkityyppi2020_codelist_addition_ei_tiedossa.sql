-- LIIKENNEMERKKITYYPPI2020 - new code: ei tiedossa

-- add column for sort order
ALTER TABLE kohteet.liikennemerkkityyppi2020
	ADD COLUMN jarjestys double precision NOT NULL DEFAULT 0;

-- add 'ei tiedossa' as the first item
INSERT INTO kohteet.liikennemerkkityyppi2020 (id, selite, jarjestys) OVERRIDING SYSTEM VALUE VALUES (999, 'ei tiedossa', -1);
