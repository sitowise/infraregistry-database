-- Redefine all equipment views to read from kohteet.equipment instead of legacy per-type tables.
-- This allows legacy tables to be dropped (INFRAREGISTRY-346) without breaking Louhi-web.
-- Each view preserves its original column names, types, and order.
--
-- Coverage: 13 views redefined (all that have existing view definitions).
-- Excluded equipment types (no legacy views exist for these — they were created directly
-- in the equipment table and never had per-type tables or Louhi-web views):
--   - valaisin (equipment_type_id = 3)
--   - kaapeli (equipment_type_id = 5)
--   - valaisinkeskus (equipment_type_id = 17)
--
-- JSONB property key dependency: Type-specific columns are extracted via
-- (e.properties->>'camelCaseKey')::type. Key names must match the JSON Schema
-- definitions in InfraRegistry.Core/Schemas/*.schema.json exactly (camelCase).

-- hulevesi_view (equipment_type_id = 1)
DROP VIEW IF EXISTS kohteet.hulevesi_view;
CREATE VIEW kohteet.hulevesi_view AS
SELECT
    e.id,
    e.metadata AS metatieto,
    e.uuid::text AS yksilointitieto,
    e.valid_from AS alkuhetki,
    e.valid_to AS loppuhetki,
    e.model AS malli,
    e.renovation_year AS perusparannusvuosi,
    e.direction AS suunta,
    e.manufacturer AS valmistaja,
    e.manufacture_year AS valmistumisvuosi,
    e.green_area_part_id AS kuuluuviheralueenosaan,
    e.street_area_part_id AS kuuluukatualueenosaan,
    e.material_id AS materiaali_id,
    ST_SetSRID(ST_Collect(ARRAY[e.geom_polygon::geometry, e.geom_point::geometry, e.geom_line::geometry]), $Srid$)::geometry(Geometry, $Srid$) AS geom,
    (e.properties->>'hulevesityyppiId')::integer AS hulevesityyppi_id,
    e.creation_method_id AS luontitapa_id,
    e.address_id AS osoite_id,
    e.location_uncertainty_id AS sijaintiepavarmuus_id,
    e.owner AS omistaja,
    e.holder AS haltija,
    e.maintainer AS kunnossapitaja,
    e.created_at AS luonti_pvm,
    e.modified_at AS muokkaus_pvm,
    e.created_by AS datan_luoja,
    e.modified_by AS muokkaaja
FROM kohteet.equipment e
WHERE e.equipment_type_id = 1 AND NOT e.is_deleted;

-- jate_view (equipment_type_id = 2)
DROP VIEW IF EXISTS kohteet.jate_view;
CREATE VIEW kohteet.jate_view AS
SELECT
    e.id,
    e.metadata AS metatieto,
    e.uuid::text AS yksilointitieto,
    e.valid_from AS alkuhetki,
    e.valid_to AS loppuhetki,
    e.model AS malli,
    e.renovation_year AS perusparannusvuosi,
    e.direction AS suunta,
    e.manufacturer AS valmistaja,
    e.manufacture_year AS valmistumisvuosi,
    e.green_area_part_id AS kuuluuviheralueenosaan,
    e.street_area_part_id AS kuuluukatualueenosaan,
    e.material_id AS materiaali_id,
    ST_SetSRID(ST_Collect(ARRAY[e.geom_polygon::geometry, e.geom_point::geometry, e.geom_line::geometry]), $Srid$)::geometry(Geometry, $Srid$) AS geom,
    (e.properties->>'jatetyyppiId')::integer AS jatetyyppi_id,
    e.creation_method_id AS luontitapa_id,
    e.address_id AS osoite_id,
    e.location_uncertainty_id AS sijaintiepavarmuus_id,
    (e.properties->>'koko')::integer AS koko,
    (e.properties->>'putkikeraysjarjestelmaKytkin')::boolean AS putkikeraysjarjestelma_kytkin,
    (e.properties->>'sijaintiMaanPinnallaKytkin')::boolean AS sijainti_maan_pinnalla_kytkin,
    (e.properties->>'vaarallistenJateastiaKytkin')::boolean AS vaarallisten_jateastia_kytkin,
    e.owner AS omistaja,
    e.holder AS haltija,
    e.maintainer AS kunnossapitaja,
    e.created_at AS luonti_pvm,
    e.modified_at AS muokkaus_pvm,
    e.created_by AS datan_luoja,
    e.modified_by AS muokkaaja
FROM kohteet.equipment e
WHERE e.equipment_type_id = 2 AND NOT e.is_deleted;

-- liikennemerkki_view (equipment_type_id = 4)
DROP VIEW IF EXISTS kohteet.liikennemerkki_view;
CREATE VIEW kohteet.liikennemerkki_view AS
SELECT
    e.id,
    e.metadata AS metatieto,
    e.uuid::text AS yksilointitieto,
    e.valid_from AS alkuhetki,
    e.valid_to AS loppuhetki,
    e.model AS malli,
    e.renovation_year AS perusparannusvuosi,
    e.direction AS suunta,
    e.manufacturer AS valmistaja,
    e.manufacture_year AS valmistumisvuosi,
    e.green_area_part_id AS kuuluuviheralueenosaan,
    e.street_area_part_id AS kuuluukatualueenosaan,
    e.material_id AS materiaali_id,
    ST_SetSRID(ST_Collect(ARRAY[e.geom_polygon::geometry, e.geom_point::geometry, e.geom_line::geometry]), $Srid$)::geometry(Geometry, $Srid$) AS geom,
    (e.properties->>'liikennemerkkityyppiId')::integer AS liikennemerkkityyppi_id,
    (e.properties->>'liikennemerkkityyppi2020Id')::integer AS liikennemerkkityyppi2020_id,
    e.creation_method_id AS luontitapa_id,
    e.address_id AS osoite_id,
    e.location_uncertainty_id AS sijaintiepavarmuus_id,
    (e.properties->>'teksti')::text AS teksti,
    e.owner AS omistaja,
    e.holder AS haltija,
    e.maintainer AS kunnossapitaja,
    e.created_at AS luonti_pvm,
    e.modified_at AS muokkaus_pvm,
    e.created_by AS datan_luoja,
    e.modified_by AS muokkaaja
FROM kohteet.equipment e
WHERE e.equipment_type_id = 4 AND NOT e.is_deleted;

-- kaluste_view (equipment_type_id = 7)
DROP VIEW IF EXISTS kohteet.kaluste_view;
CREATE VIEW kohteet.kaluste_view AS
SELECT
    e.id,
    e.metadata AS metatieto,
    e.uuid::text AS yksilointitieto,
    e.valid_from AS alkuhetki,
    e.valid_to AS loppuhetki,
    e.model AS malli,
    e.renovation_year AS perusparannusvuosi,
    e.direction AS suunta,
    e.manufacturer AS valmistaja,
    e.manufacture_year AS valmistumisvuosi,
    e.green_area_part_id AS kuuluuviheralueenosaan,
    e.street_area_part_id AS kuuluukatualueenosaan,
    e.material_id AS materiaali_id,
    ST_SetSRID(ST_Collect(ARRAY[e.geom_polygon::geometry, e.geom_point::geometry, e.geom_line::geometry]), $Srid$)::geometry(Geometry, $Srid$) AS geom,
    (e.properties->>'kalustetyyppiId')::integer AS kalustetyyppi_id,
    e.creation_method_id AS luontitapa_id,
    e.address_id AS osoite_id,
    e.location_uncertainty_id AS sijaintiepavarmuus_id,
    e.owner AS omistaja,
    e.holder AS haltija,
    e.maintainer AS kunnossapitaja,
    e.created_at AS luonti_pvm,
    e.modified_at AS muokkaus_pvm,
    e.created_by AS datan_luoja,
    e.modified_by AS muokkaaja
FROM kohteet.equipment e
WHERE e.equipment_type_id = 7 AND NOT e.is_deleted;

-- opaste_view (equipment_type_id = 8)
DROP VIEW IF EXISTS kohteet.opaste_view;
CREATE VIEW kohteet.opaste_view AS
SELECT
    e.id,
    e.metadata AS metatieto,
    e.uuid::text AS yksilointitieto,
    e.valid_from AS alkuhetki,
    e.valid_to AS loppuhetki,
    e.model AS malli,
    e.renovation_year AS perusparannusvuosi,
    e.direction AS suunta,
    e.manufacturer AS valmistaja,
    e.manufacture_year AS valmistumisvuosi,
    e.green_area_part_id AS kuuluuviheralueenosaan,
    e.street_area_part_id AS kuuluukatualueenosaan,
    e.material_id AS materiaali_id,
    ST_SetSRID(ST_Collect(ARRAY[e.geom_polygon::geometry, e.geom_point::geometry, e.geom_line::geometry]), $Srid$)::geometry(Geometry, $Srid$) AS geom,
    (e.properties->>'opastetyyppiId')::integer AS opastetyyppi_id,
    e.creation_method_id AS luontitapa_id,
    e.address_id AS osoite_id,
    e.location_uncertainty_id AS sijaintiepavarmuus_id,
    e.owner AS omistaja,
    e.holder AS haltija,
    e.maintainer AS kunnossapitaja,
    e.created_at AS luonti_pvm,
    e.modified_at AS muokkaus_pvm,
    e.created_by AS datan_luoja,
    e.modified_by AS muokkaaja
FROM kohteet.equipment e
WHERE e.equipment_type_id = 8 AND NOT e.is_deleted;

-- ymparistotaide_view (equipment_type_id = 9)
DROP VIEW IF EXISTS kohteet.ymparistotaide_view;
CREATE VIEW kohteet.ymparistotaide_view AS
SELECT
    e.id,
    e.metadata AS metatieto,
    e.uuid::text AS yksilointitieto,
    e.valid_from AS alkuhetki,
    e.valid_to AS loppuhetki,
    e.model AS malli,
    e.renovation_year AS perusparannusvuosi,
    e.direction AS suunta,
    e.manufacturer AS valmistaja,
    e.manufacture_year AS valmistumisvuosi,
    e.green_area_part_id AS kuuluuviheralueenosaan,
    e.street_area_part_id AS kuuluukatualueenosaan,
    e.material_id AS materiaali_id,
    ST_SetSRID(ST_Collect(ARRAY[e.geom_polygon::geometry, e.geom_point::geometry, e.geom_line::geometry]), $Srid$)::geometry(Geometry, $Srid$) AS geom,
    (e.properties->>'ymparistotaidetyyppiId')::integer AS ymparistotaidetyyppi_id,
    e.creation_method_id AS luontitapa_id,
    e.address_id AS osoite_id,
    e.location_uncertainty_id AS sijaintiepavarmuus_id,
    e.owner AS omistaja,
    e.holder AS haltija,
    e.maintainer AS kunnossapitaja,
    e.created_at AS luonti_pvm,
    e.modified_at AS muokkaus_pvm,
    e.created_by AS datan_luoja,
    e.modified_by AS muokkaaja
FROM kohteet.equipment e
WHERE e.equipment_type_id = 9 AND NOT e.is_deleted;

-- melu_view (equipment_type_id = 10)
DROP VIEW IF EXISTS kohteet.melu_view;
CREATE VIEW kohteet.melu_view AS
SELECT
    e.id,
    e.metadata AS metatieto,
    e.uuid::text AS yksilointitieto,
    e.valid_from AS alkuhetki,
    e.valid_to AS loppuhetki,
    e.model AS malli,
    e.renovation_year AS perusparannusvuosi,
    e.direction AS suunta,
    e.manufacturer AS valmistaja,
    e.manufacture_year AS valmistumisvuosi,
    e.green_area_part_id AS kuuluuviheralueenosaan,
    e.street_area_part_id AS kuuluukatualueenosaan,
    e.material_id AS materiaali_id,
    ST_SetSRID(ST_Collect(ARRAY[e.geom_polygon::geometry, e.geom_point::geometry, e.geom_line::geometry]), $Srid$)::geometry(Geometry, $Srid$) AS geom,
    (e.properties->>'melutyyppiId')::integer AS melutyyppi_id,
    e.creation_method_id AS luontitapa_id,
    e.address_id AS osoite_id,
    e.location_uncertainty_id AS sijaintiepavarmuus_id,
    e.owner AS omistaja,
    e.holder AS haltija,
    e.maintainer AS kunnossapitaja,
    e.created_at AS luonti_pvm,
    e.modified_at AS muokkaus_pvm,
    e.created_by AS datan_luoja,
    e.modified_by AS muokkaaja
FROM kohteet.equipment e
WHERE e.equipment_type_id = 10 AND NOT e.is_deleted;

-- leikkivaline_view (equipment_type_id = 11)
DROP VIEW IF EXISTS kohteet.leikkivaline_view;
CREATE VIEW kohteet.leikkivaline_view AS
SELECT
    e.id,
    e.metadata AS metatieto,
    e.uuid::text AS yksilointitieto,
    e.valid_from AS alkuhetki,
    e.valid_to AS loppuhetki,
    e.model AS malli,
    e.renovation_year AS perusparannusvuosi,
    e.direction AS suunta,
    e.manufacturer AS valmistaja,
    e.manufacture_year AS valmistumisvuosi,
    e.green_area_part_id AS kuuluuviheralueenosaan,
    e.street_area_part_id AS kuuluukatualueenosaan,
    e.material_id AS materiaali_id,
    ST_SetSRID(ST_Collect(ARRAY[e.geom_polygon::geometry, e.geom_point::geometry, e.geom_line::geometry]), $Srid$)::geometry(Geometry, $Srid$) AS geom,
    (e.properties->>'leikkivalinetyyppiId')::integer AS leikkivalinetyyppi_id,
    e.creation_method_id AS luontitapa_id,
    e.address_id AS osoite_id,
    e.location_uncertainty_id AS sijaintiepavarmuus_id,
    (e.properties->>'toiminnallinenTarkistusPvm')::date AS toiminnallinen_tarkistus_pvm,
    (e.properties->>'vuositarkastusPvm')::date AS vuositarkastus_pvm,
    e.owner AS omistaja,
    e.holder AS haltija,
    e.maintainer AS kunnossapitaja,
    e.created_at AS luonti_pvm,
    e.modified_at AS muokkaus_pvm,
    e.created_by AS datan_luoja,
    e.modified_by AS muokkaaja
FROM kohteet.equipment e
WHERE e.equipment_type_id = 11 AND NOT e.is_deleted;

-- liikunta_view (equipment_type_id = 12)
DROP VIEW IF EXISTS kohteet.liikunta_view;
CREATE VIEW kohteet.liikunta_view AS
SELECT
    e.id,
    e.metadata AS metatieto,
    e.uuid::text AS yksilointitieto,
    e.valid_from AS alkuhetki,
    e.valid_to AS loppuhetki,
    e.model AS malli,
    e.renovation_year AS perusparannusvuosi,
    e.direction AS suunta,
    e.manufacturer AS valmistaja,
    e.manufacture_year AS valmistumisvuosi,
    e.green_area_part_id AS kuuluuviheralueenosaan,
    e.street_area_part_id AS kuuluukatualueenosaan,
    e.material_id AS materiaali_id,
    ST_SetSRID(ST_Collect(ARRAY[e.geom_polygon::geometry, e.geom_point::geometry, e.geom_line::geometry]), $Srid$)::geometry(Geometry, $Srid$) AS geom,
    (e.properties->>'liikuntatyyppiId')::integer AS liikuntatyyppi_id,
    e.creation_method_id AS luontitapa_id,
    e.address_id AS osoite_id,
    e.location_uncertainty_id AS sijaintiepavarmuus_id,
    e.owner AS omistaja,
    e.holder AS haltija,
    e.maintainer AS kunnossapitaja,
    e.created_at AS luonti_pvm,
    e.modified_at AS muokkaus_pvm,
    e.created_by AS datan_luoja,
    e.modified_by AS muokkaaja
FROM kohteet.equipment e
WHERE e.equipment_type_id = 12 AND NOT e.is_deleted;

-- pysakointiruutu_view (equipment_type_id = 13)
DROP VIEW IF EXISTS kohteet.pysakointiruutu_view;
CREATE VIEW kohteet.pysakointiruutu_view AS
SELECT
    e.id,
    e.metadata AS metatieto,
    e.uuid::text AS yksilointitieto,
    e.valid_from AS alkuhetki,
    e.valid_to AS loppuhetki,
    e.model AS malli,
    e.renovation_year AS perusparannusvuosi,
    e.direction AS suunta,
    e.manufacturer AS valmistaja,
    e.manufacture_year AS valmistumisvuosi,
    e.green_area_part_id AS kuuluuviheralueenosaan,
    e.street_area_part_id AS kuuluukatualueenosaan,
    e.material_id AS materiaali_id,
    ST_SetSRID(ST_Collect(ARRAY[e.geom_polygon::geometry, e.geom_point::geometry, e.geom_line::geometry]), $Srid$)::geometry(Geometry, $Srid$) AS geom,
    (e.properties->>'latauspistekytkin')::boolean AS latauspistekytkin,
    e.creation_method_id AS luontitapa_id,
    e.address_id AS osoite_id,
    e.location_uncertainty_id AS sijaintiepavarmuus_id,
    e.owner AS omistaja,
    e.holder AS haltija,
    e.maintainer AS kunnossapitaja,
    e.created_at AS luonti_pvm,
    e.modified_at AS muokkaus_pvm,
    e.created_by AS datan_luoja,
    e.modified_by AS muokkaaja
FROM kohteet.equipment e
WHERE e.equipment_type_id = 13 AND NOT e.is_deleted;

-- rakenne_view (equipment_type_id = 14)
DROP VIEW IF EXISTS kohteet.rakenne_view;
CREATE VIEW kohteet.rakenne_view AS
SELECT
    e.id,
    e.metadata AS metatieto,
    e.uuid::text AS yksilointitieto,
    e.valid_from AS alkuhetki,
    e.valid_to AS loppuhetki,
    e.model AS malli,
    e.renovation_year AS perusparannusvuosi,
    e.direction AS suunta,
    e.manufacturer AS valmistaja,
    e.manufacture_year AS valmistumisvuosi,
    e.green_area_part_id AS kuuluuviheralueenosaan,
    e.street_area_part_id AS kuuluukatualueenosaan,
    e.material_id AS materiaali_id,
    ST_SetSRID(ST_Collect(ARRAY[e.geom_polygon::geometry, e.geom_point::geometry, e.geom_line::geometry]), $Srid$)::geometry(Geometry, $Srid$) AS geom,
    (e.properties->>'rakennetyyyppiId')::integer AS rakennetyyyppi_id,
    e.creation_method_id AS luontitapa_id,
    e.address_id AS osoite_id,
    e.location_uncertainty_id AS sijaintiepavarmuus_id,
    e.owner AS omistaja,
    e.holder AS haltija,
    e.maintainer AS kunnossapitaja,
    e.created_at AS luonti_pvm,
    e.modified_at AS muokkaus_pvm,
    e.created_by AS datan_luoja,
    e.modified_by AS muokkaaja
FROM kohteet.equipment e
WHERE e.equipment_type_id = 14 AND NOT e.is_deleted;

-- ajoratamerkinta_view (equipment_type_id = 15)
DROP VIEW IF EXISTS kohteet.ajoratamerkinta_view;
CREATE VIEW kohteet.ajoratamerkinta_view AS
SELECT
    e.id,
    e.metadata AS metatieto,
    e.uuid::text AS yksilointitieto,
    e.valid_from AS alkuhetki,
    e.valid_to AS loppuhetki,
    e.model AS malli,
    e.renovation_year AS perusparannusvuosi,
    e.direction AS suunta,
    e.manufacturer AS valmistaja,
    e.manufacture_year AS valmistumisvuosi,
    e.green_area_part_id AS kuuluuviheralueenosaan,
    e.street_area_part_id AS kuuluukatualueenosaan,
    e.material_id AS materiaali_id,
    ST_SetSRID(ST_Collect(ARRAY[e.geom_polygon::geometry, e.geom_point::geometry, e.geom_line::geometry]), $Srid$)::geometry(Geometry, $Srid$) AS geom,
    (e.properties->>'ajoratamerkintatyyppiId')::integer AS ajoratamerkintatyyppi_id,
    (e.properties->>'jyrsittypintakytkin')::boolean AS jyrsittypintakytkin,
    e.creation_method_id AS luontitapa_id,
    e.address_id AS osoite_id,
    e.location_uncertainty_id AS sijaintiepavarmuus_id,
    e.owner AS omistaja,
    e.holder AS haltija,
    e.maintainer AS kunnossapitaja,
    e.created_at AS luonti_pvm,
    e.modified_at AS muokkaus_pvm,
    e.created_by AS datan_luoja,
    e.modified_by AS muokkaaja
FROM kohteet.equipment e
WHERE e.equipment_type_id = 15 AND NOT e.is_deleted;

-- muuvaruste_view (equipment_type_id = 16)
DROP VIEW IF EXISTS kohteet.muuvaruste_view;
CREATE VIEW kohteet.muuvaruste_view AS
SELECT
    e.id,
    e.metadata AS metatieto,
    e.uuid::text AS yksilointitieto,
    e.valid_from AS alkuhetki,
    e.valid_to AS loppuhetki,
    e.model AS malli,
    e.renovation_year AS perusparannusvuosi,
    e.direction AS suunta,
    e.manufacturer AS valmistaja,
    e.manufacture_year AS valmistumisvuosi,
    e.green_area_part_id AS kuuluuviheralueenosaan,
    e.street_area_part_id AS kuuluukatualueenosaan,
    e.material_id AS materiaali_id,
    ST_SetSRID(ST_Collect(ARRAY[e.geom_polygon::geometry, e.geom_point::geometry, e.geom_line::geometry]), $Srid$)::geometry(Geometry, $Srid$) AS geom,
    (e.properties->>'muuvarustetyyppiId')::integer AS muuvarustetyyppi_id,
    e.creation_method_id AS luontitapa_id,
    e.address_id AS osoite_id,
    e.location_uncertainty_id AS sijaintiepavarmuus_id,
    e.owner AS omistaja,
    e.holder AS haltija,
    e.maintainer AS kunnossapitaja,
    e.created_at AS luonti_pvm,
    e.modified_at AS muokkaus_pvm,
    e.created_by AS datan_luoja,
    e.modified_by AS muokkaaja
FROM kohteet.equipment e
WHERE e.equipment_type_id = 16 AND NOT e.is_deleted;
