CREATE OR REPLACE VIEW kohteet.muukasvi_view AS
SELECT
    id,
    metatieto,
    yksilointitieto,
    alkuhetki,
    loppuhetki,
    omistaja,
    haltija,
    kunnossapitaja,
    kuuluuviheralueenosaan,
    kuuluukatualueenosaan,
    ST_SetSRID(ST_Collect(ARRAY[geom_poly, geom_piste, geom_line]), $Srid$)::geometry(Geometry, $Srid$) AS geom,
    kasviryhma,
    kasvilaji,
    luontitapa_id,
    osoite_id,
    sijaintiepavarmuus_id,
    luonti_pvm,
    muokkaus_pvm,
    datan_luoja,
    muokkaaja
FROM kohteet.muukasvi;
