CREATE OR REPLACE VIEW kohteet.ymparistotaide_view AS
SELECT
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
    ST_SetSRID(ST_Collect(ARRAY[geom_poly, geom_piste, geom_line]), $Srid$)::geometry(Geometry, $Srid$) AS geom,
    ymparistotaidetyyppi_id,
    luontitapa_id,
    osoite_id,
    sijaintiepavarmuus_id,
    omistaja,
    haltija,
    kunnossapitaja,
    luonti_pvm,
    muokkaus_pvm,
    datan_luoja,
    muokkaaja
FROM kohteet.ymparistotaide;
