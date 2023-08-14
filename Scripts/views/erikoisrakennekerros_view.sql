CREATE OR REPLACE VIEW kohteet.erikoisrakennekerros_view AS
SELECT
    id,
    erikoisrakennekerrosmateriaalityyppi_id,
    omistaja,
    haltija,
    kunnossapitaja,
    selite,
    materiaali,
    ST_SetSRID(ST_Collect(ARRAY[geom_poly, geom_piste, geom_viiva]), $Srid$)::geometry(Geometry, $Srid$) AS geom,
    metatieto,
    yksilointitieto,
    alkuhetki,
    loppuhetki,
    luontitapa_id,
    osoite_id,
    sijaintiepavarmuus_id,
    tyyppi_id,
    luonti_pvm,
    muokkaus_pvm,
    datan_luoja,
    muokkaaja
FROM kohteet.erikoisrakennekerros;
