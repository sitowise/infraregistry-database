CREATE OR REPLACE VIEW kohteet.osoite_view AS
SELECT
    id,
    kunta,
    osoitenumero,
    osoitenumero2,
    jakokirjain,
    jakokirjain2,
    porras,
    huoneisto,
    huoneistojakokirjain,
    postinmero,
    postitoimipaikannimi,
    ST_SetSRID(ST_Collect(ARRAY[geom_point, geom_poly, geom_line]), $Srid$)::geometry(Geometry, $Srid$) AS geom,
    viitesijaintialue,
    nimitieto_id
FROM
    kohteet.osoite;
