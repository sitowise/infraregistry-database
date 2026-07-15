-- Add missing valaisinkeskus equipment type and migrate legacy data
-- valaisinkeskus was omitted from the initial equipment_type seed in 059

-- 1. Add equipment type
INSERT INTO kohteet.equipment_type (id, name, sort_order) VALUES (17, 'valaisinkeskus', 17)
ON CONFLICT DO NOTHING;

-- 2. Migrate legacy valaisinkeskus data to equipment table
DO $$
DECLARE
    v_total integer;
    v_migrated integer;
BEGIN

SELECT count(*) INTO v_total FROM kohteet.valaisinkeskus;

INSERT INTO kohteet.equipment (
    equipment_type_id, properties,
    geom_point, geom_line, geom_polygon,
    uuid, metadata, valid_from, valid_to,
    model, manufacture_year, renovation_year,
    manufacturer, owner, holder, maintainer,
    location_uncertainty_id, creation_method_id,
    address_id, material_id,
    lifecycle_id, condition_id, status_id,
    municipality_id,
    additional_info, surveyor,
    street_area_part_id, green_area_part_id,
    created_at, modified_at, created_by, modified_by,
    is_deleted
)
SELECT
    17,
    jsonb_build_object(
        'nimi', nimi,
        'kayttopaikanNumero', kayttopaikan_numero,
        'valaisinkeskusTyyppiId', valaisinkeskus_tyyppi_id,
        'valaisinkeskusLukitusId', lukitus_id,
        'kilpiarvo', kilpiarvo,
        'valaisinkeskusPaasulakeId', paasulake_id,
        'valaisinkeskusPaasulakeTyyppiId', paasulake_tyyppi_id,
        'mittarinumero', mittarinumero,
        'yosammutus', yosammutus,
        'energiayhtio', energiayhtio,
        'energiayhtionNumero', energiayhtion_numero,
        'valaisinkeskusMittarointiId', mittarointi_id,
        'syottokaapelienLkm', syottokaapelien_lkm,
        'valaisinkeskusOhjaustapaId', ohjaustapa_id,
        'ohjaustunnus', ohjaustunnus,
        'maxLahtoja', max_lahtoja,
        'mitattuOikosulkuvirta', mitattu_oikosulkuvirta,
        'mittauspaiva', mittauspaiva
    ),
    geom_piste, geom_line, geom_poly,
    yksilointitieto::uuid, metatieto, alkuhetki, loppuhetki,
    malli, valmistumisvuosi, perusparannusvuosi,
    valmistaja, omistaja, haltija, kunnossapitaja,
    sijaintiepavarmuus_id, luontitapa_id,
    osoite_id, materiaali_id,
    elinkaari_id, kunto_id, tila_id,
    kunta_id,
    lisatietoja, inventoija,
    kuuluukatualueenosaan, kuuluuviheralueenosaan,
    luonti_pvm, muokkaus_pvm, datan_luoja, muokkaaja,
    is_deleted
FROM kohteet.valaisinkeskus
ON CONFLICT DO NOTHING;

GET DIAGNOSTICS v_migrated = ROW_COUNT;
RAISE NOTICE 'valaisinkeskus: migrated % of % records', v_migrated, v_total;

END $$;

-- 3. Migrate junction table relationships
INSERT INTO kohteet.equipment_attachment (equipment_id, attachment_id)
SELECT e.id, vl.liite_id
FROM kohteet.valaisinkeskus_liite vl
JOIN kohteet.valaisinkeskus v ON v.id = vl.valaisinkeskus_id
JOIN kohteet.equipment e ON e.uuid = v.yksilointitieto::uuid AND e.equipment_type_id = 17
ON CONFLICT DO NOTHING;

INSERT INTO kohteet.equipment_contract (equipment_id, contract_id)
SELECT e.id, vu.urakka_id
FROM kohteet.valaisinkeskus_urakka vu
JOIN kohteet.valaisinkeskus v ON v.id = vu.valaisinkeskus_id
JOIN kohteet.equipment e ON e.uuid = v.yksilointitieto::uuid AND e.equipment_type_id = 17
ON CONFLICT DO NOTHING;

INSERT INTO kohteet.equipment_plan_link (equipment_id, plan_link_id)
SELECT e.id, vs.suunnitelmalinkki_id
FROM kohteet.valaisinkeskus_suunnitelmalinkki vs
JOIN kohteet.valaisinkeskus v ON v.id = vs.valaisinkeskus_id
JOIN kohteet.equipment e ON e.uuid = v.yksilointitieto::uuid AND e.equipment_type_id = 17
ON CONFLICT DO NOTHING;

INSERT INTO kohteet.equipment_maintenance_action (equipment_id, maintenance_action_id)
SELECT e.id, vvt.varuste_toimenpide_id
FROM kohteet.valaisinkeskus_varuste_toimenpide_linkki vvt
JOIN kohteet.valaisinkeskus v ON v.id = vvt.valaisinkeskus_id
JOIN kohteet.equipment e ON e.uuid = v.yksilointitieto::uuid AND e.equipment_type_id = 17
ON CONFLICT DO NOTHING;
