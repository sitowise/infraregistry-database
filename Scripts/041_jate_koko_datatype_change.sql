DROP VIEW kohteet.jate_view;

ALTER TABLE kohteet.jate
ALTER COLUMN koko TYPE integer USING koko::integer;

CREATE OR REPLACE VIEW kohteet.jate_view
AS SELECT
    id,
    metatieto,
    yksilointitieto,
    alkuhetki,
    loppuhetki,
    malli,
    perusparannusvuosi,
    suunta,
    valmistaja,
    valmistumisvuosi,
    kuuluuviheralueenosaan,
    kuuluukatualueenosaan,
    materiaali_id,
    st_setsrid(st_collect(ARRAY[geom_poly, geom_piste, geom_line]), 3067)::geometry(Geometry,3067) AS geom,
    jatetyyppi_id,
    luontitapa_id,
    osoite_id,
    sijaintiepavarmuus_id,
    koko,
    putkikeraysjarjestelma_kytkin,
    sijainti_maan_pinnalla_kytkin,
    vaarallisten_jateastia_kytkin,
    omistaja,
    haltija,
    kunnossapitaja,
    tyhjennysvali_viikkoina_kesa,
    tyhjennysvali_viikkoina_talvi,
    tarkastusvali_id,
    luonti_pvm,
    muokkaus_pvm,
    datan_luoja,
    muokkaaja
FROM kohteet.jate;
