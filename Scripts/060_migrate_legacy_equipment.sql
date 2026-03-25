-- ============================================================================
-- 060_migrate_legacy_equipment.sql
-- Migrates legacy per-type equipment data into the generic kohteet.equipment
-- table. For each legacy type, common columns are copied directly and
-- type-specific columns are extracted into JSONB properties.
-- Uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================================

DO $$
DECLARE
    v_migrated   integer;
    v_total      integer;
    v_table_name text;
BEGIN

-- ============================================================================
-- 1. HULEVESI (equipment_type_id = 1)
-- ============================================================================
v_table_name := 'hulevesi';

SELECT count(*) INTO v_total FROM kohteet.hulevesi;

INSERT INTO kohteet.equipment (
    equipment_type_id, properties,
    uuid, metadata, valid_from, valid_to,
    geom_polygon, geom_point, geom_line,
    municipality_id,
    created_at, modified_at, created_by, modified_by,
    is_deleted,
    model, manufacturer, manufacture_year, renovation_year,
    direction, owner, holder, maintainer, additional_info, surveyor,
    material_id, creation_method_id, location_uncertainty_id,
    lifecycle_id, status_id, condition_id,
    address_id, green_area_part_id, street_area_part_id
)
SELECT
    1,
    jsonb_build_object(
        'hulevesityyppiId', hulevesityyppi_id,
        'kannenHalkaisija', kannen_halkaisija,
        'kannenTyyppiId', kannen_tyyppi_id
    ),
    yksilointitieto::uuid, metatieto, alkuhetki, loppuhetki,
    geom_poly, geom_piste, geom_line,
    kunta_id,
    luonti_pvm, muokkaus_pvm, datan_luoja, muokkaaja,
    is_deleted,
    malli, valmistaja, valmistumisvuosi, perusparannusvuosi,
    suunta, omistaja, haltija, kunnossapitaja, lisatietoja, inventoija,
    materiaali_id, luontitapa_id, sijaintiepavarmuus_id,
    elinkaari_id, tila_id, kunto_id,
    osoite_id, kuuluuviheralueenosaan, kuuluukatualueenosaan
FROM kohteet.hulevesi
ON CONFLICT DO NOTHING;

GET DIAGNOSTICS v_migrated = ROW_COUNT;
RAISE NOTICE 'hulevesi: migrated % of % records', v_migrated, v_total;

-- Hulevesi junction tables
INSERT INTO kohteet.equipment_attachment (equipment_id, attachment_id)
SELECT e.id, hl.liite_id
FROM kohteet.hulevesi_liite hl
JOIN kohteet.hulevesi h ON h.id = hl.hulevesi_id
JOIN kohteet.equipment e ON e.uuid = h.yksilointitieto::uuid AND e.equipment_type_id = 1
ON CONFLICT DO NOTHING;

INSERT INTO kohteet.equipment_contract (equipment_id, contract_id)
SELECT e.id, hu.urakka_id
FROM kohteet.hulevesi_urakka hu
JOIN kohteet.hulevesi h ON h.id = hu.hulevesi_id
JOIN kohteet.equipment e ON e.uuid = h.yksilointitieto::uuid AND e.equipment_type_id = 1
ON CONFLICT DO NOTHING;

INSERT INTO kohteet.equipment_plan_link (equipment_id, plan_link_id)
SELECT e.id, hs.suunnitelmalinkki_id
FROM kohteet.hulevesi_suunnitelmalinkki hs
JOIN kohteet.hulevesi h ON h.id = hs.hulevesi_id
JOIN kohteet.equipment e ON e.uuid = h.yksilointitieto::uuid AND e.equipment_type_id = 1
ON CONFLICT DO NOTHING;

INSERT INTO kohteet.equipment_maintenance_action (equipment_id, maintenance_action_id)
SELECT e.id, hvt.varuste_toimenpide_id
FROM kohteet.hulevesi_varuste_toimenpide_linkki hvt
JOIN kohteet.hulevesi h ON h.id = hvt.hulevesi_id
JOIN kohteet.equipment e ON e.uuid = h.yksilointitieto::uuid AND e.equipment_type_id = 1
ON CONFLICT DO NOTHING;

-- ============================================================================
-- 2. JATE (equipment_type_id = 2)
-- ============================================================================
v_table_name := 'jate';
SELECT count(*) INTO v_total FROM kohteet.jate;

INSERT INTO kohteet.equipment (
    equipment_type_id, properties,
    uuid, metadata, valid_from, valid_to,
    geom_polygon, geom_point, geom_line,
    municipality_id,
    created_at, modified_at, created_by, modified_by,
    is_deleted,
    model, manufacturer, manufacture_year, renovation_year,
    direction, owner, holder, maintainer, additional_info, surveyor,
    material_id, creation_method_id, location_uncertainty_id,
    lifecycle_id, status_id, condition_id,
    address_id, green_area_part_id, street_area_part_id
)
SELECT
    2,
    jsonb_build_object(
        'jatetyyppiId', jatetyyppi_id,
        'koko', koko,
        'putkikeraysjarjestelmaKytkin', putkikeraysjarjestelma_kytkin,
        'sijaintiMaanPinnallaKytkin', sijainti_maan_pinnalla_kytkin,
        'vaarallistenJateastiaKytkin', vaarallisten_jateastia_kytkin,
        'tyhjennysvaliViikkoinaKesa', tyhjennysvali_viikkoina_kesa,
        'tyhjennysvaliViikkoinaTalvi', tyhjennysvali_viikkoina_talvi,
        'tarkastusvaliId', tarkastusvali_id
    ),
    yksilointitieto::uuid, metatieto, alkuhetki, loppuhetki,
    geom_poly, geom_piste, geom_line,
    kunta_id,
    luonti_pvm, muokkaus_pvm, datan_luoja, muokkaaja,
    is_deleted,
    malli, valmistaja, valmistumisvuosi, perusparannusvuosi,
    suunta, omistaja, haltija, kunnossapitaja, lisatietoja, inventoija,
    materiaali_id, luontitapa_id, sijaintiepavarmuus_id,
    elinkaari_id, tila_id, kunto_id,
    osoite_id, kuuluuviheralueenosaan, kuuluukatualueenosaan
FROM kohteet.jate
ON CONFLICT DO NOTHING;

GET DIAGNOSTICS v_migrated = ROW_COUNT;
RAISE NOTICE 'jate: migrated % of % records', v_migrated, v_total;

-- Jate junction tables
INSERT INTO kohteet.equipment_attachment (equipment_id, attachment_id)
SELECT e.id, jl.liite_id
FROM kohteet.jate_liite jl
JOIN kohteet.jate j ON j.id = jl.jate_id
JOIN kohteet.equipment e ON e.uuid = j.yksilointitieto::uuid AND e.equipment_type_id = 2
ON CONFLICT DO NOTHING;

INSERT INTO kohteet.equipment_contract (equipment_id, contract_id)
SELECT e.id, ju.urakka_id
FROM kohteet.jate_urakka ju
JOIN kohteet.jate j ON j.id = ju.jate_id
JOIN kohteet.equipment e ON e.uuid = j.yksilointitieto::uuid AND e.equipment_type_id = 2
ON CONFLICT DO NOTHING;

INSERT INTO kohteet.equipment_plan_link (equipment_id, plan_link_id)
SELECT e.id, js.suunnitelmalinkki_id
FROM kohteet.jate_suunnitelmalinkki js
JOIN kohteet.jate j ON j.id = js.jate_id
JOIN kohteet.equipment e ON e.uuid = j.yksilointitieto::uuid AND e.equipment_type_id = 2
ON CONFLICT DO NOTHING;

INSERT INTO kohteet.equipment_maintenance_action (equipment_id, maintenance_action_id)
SELECT e.id, jvt.varuste_toimenpide_id
FROM kohteet.jate_varuste_toimenpide_linkki jvt
JOIN kohteet.jate j ON j.id = jvt.jate_id
JOIN kohteet.equipment e ON e.uuid = j.yksilointitieto::uuid AND e.equipment_type_id = 2
ON CONFLICT DO NOTHING;

-- ============================================================================
-- 3. VALAISIN (equipment_type_id = 3)
-- ============================================================================
v_table_name := 'valaisin';
SELECT count(*) INTO v_total FROM kohteet.valaisin;

INSERT INTO kohteet.equipment (
    equipment_type_id, properties,
    uuid, metadata, valid_from, valid_to,
    geom_polygon, geom_point, geom_line,
    municipality_id,
    created_at, modified_at, created_by, modified_by,
    is_deleted,
    model, manufacturer, manufacture_year, renovation_year,
    direction, owner, holder, maintainer, additional_info, surveyor,
    material_id, creation_method_id, location_uncertainty_id,
    lifecycle_id, status_id, condition_id,
    address_id, green_area_part_id, street_area_part_id
)
SELECT
    3,
    jsonb_build_object(
        'valaisinkeskusId', valaisinkeskus_id,
        'valaisintyyppiId', valaisintyyppi_id,
        'pylvastyyppiId', pylvastyyppi_id,
        'polttimotyyppiId', polttimotyyppi_id,
        'kaapelityyppiId', kaapelityyppi_id,
        'pylvaskorkeus', pylvaskorkeus,
        'asennuskorkeus', asennuskorkeus,
        'valaisinvarrenPituus', valaisinvarren_pituus,
        'pylvaanTuentaId', pylvaan_tuenta_id,
        'varsityyppiId', varsityyppi_id,
        'yhteiskayttopylvas', yhteiskayttopylvas,
        'valaisinmaara', valaisinmaara,
        'lamppujenMaara', lamppujen_maara,
        'valaistusluokkaId', valaistusluokka_id,
        'valaisinAsennustapaId', valaisin_asennustapa_id,
        'valaisinTakuuperusteetId', valaisin_takuuperusteet_id,
        'valaisinTakuunPaattymispvm', valaisin_takuun_paattymispvm,
        'valaisinTakuunVastaaja', valaisin_takuun_vastaaja,
        'pylvaanMaadoitus', pylvaan_maadoitus,
        'maadoitusarvo', maadoitusarvo,
        'pylvasValmistaja', pylvas_valmistaja,
        'jalusta', jalusta,
        'valaisinValmistaja', valaisin_valmistaja,
        'valaisinMalli', valaisin_malli,
        'valaisinTeho', valaisin_teho,
        'valaisinOptiikka', valaisin_optiikka,
        'himmennysprofiili', himmennysprofiili,
        'lampunValmistaja', lampun_valmistaja,
        'tarkenne', tarkenne
    ),
    yksilointitieto::uuid, metatieto, alkuhetki, loppuhetki,
    geom_poly, geom_piste, geom_line,
    kunta_id,
    luonti_pvm, muokkaus_pvm, datan_luoja, muokkaaja,
    is_deleted,
    malli, valmistaja, valmistumisvuosi, perusparannusvuosi,
    suunta, omistaja, haltija, kunnossapitaja, lisatietoja, inventoija,
    materiaali_id, luontitapa_id, sijaintiepavarmuus_id,
    elinkaari_id, tila_id, kunto_id,
    osoite_id, kuuluuviheralueenosaan, kuuluukatualueenosaan
FROM kohteet.valaisin
ON CONFLICT DO NOTHING;

GET DIAGNOSTICS v_migrated = ROW_COUNT;
RAISE NOTICE 'valaisin: migrated % of % records', v_migrated, v_total;

-- Valaisin junction tables
INSERT INTO kohteet.equipment_attachment (equipment_id, attachment_id)
SELECT e.id, vl.liite_id
FROM kohteet.valaisin_liite vl
JOIN kohteet.valaisin v ON v.id = vl.valaisin_id
JOIN kohteet.equipment e ON e.uuid = v.yksilointitieto::uuid AND e.equipment_type_id = 3
ON CONFLICT DO NOTHING;

INSERT INTO kohteet.equipment_contract (equipment_id, contract_id)
SELECT e.id, vu.urakka_id
FROM kohteet.valaisin_urakka vu
JOIN kohteet.valaisin v ON v.id = vu.valaisin_id
JOIN kohteet.equipment e ON e.uuid = v.yksilointitieto::uuid AND e.equipment_type_id = 3
ON CONFLICT DO NOTHING;

INSERT INTO kohteet.equipment_plan_link (equipment_id, plan_link_id)
SELECT e.id, vs.suunnitelmalinkki_id
FROM kohteet.valaisin_suunnitelmalinkki vs
JOIN kohteet.valaisin v ON v.id = vs.valaisin_id
JOIN kohteet.equipment e ON e.uuid = v.yksilointitieto::uuid AND e.equipment_type_id = 3
ON CONFLICT DO NOTHING;

INSERT INTO kohteet.equipment_maintenance_action (equipment_id, maintenance_action_id)
SELECT e.id, vvt.varuste_toimenpide_id
FROM kohteet.valaisin_varuste_toimenpide_linkki vvt
JOIN kohteet.valaisin v ON v.id = vvt.valaisin_id
JOIN kohteet.equipment e ON e.uuid = v.yksilointitieto::uuid AND e.equipment_type_id = 3
ON CONFLICT DO NOTHING;

-- ============================================================================
-- 4. LIIKENNEMERKKI (equipment_type_id = 4)
-- ============================================================================
v_table_name := 'liikennemerkki';
SELECT count(*) INTO v_total FROM kohteet.liikennemerkki;

INSERT INTO kohteet.equipment (
    equipment_type_id, properties,
    uuid, metadata, valid_from, valid_to,
    geom_polygon, geom_point, geom_line,
    municipality_id,
    created_at, modified_at, created_by, modified_by,
    is_deleted,
    model, manufacturer, manufacture_year, renovation_year,
    direction, owner, holder, maintainer, additional_info, surveyor,
    material_id, creation_method_id, location_uncertainty_id,
    lifecycle_id, status_id, condition_id,
    address_id, green_area_part_id, street_area_part_id
)
SELECT
    4,
    jsonb_build_object(
        'liikennemerkkityyppiId', liikennemerkkityyppi_id,
        'liikennemerkkityyppi2020Id', liikennemerkkityyppi2020_id,
        'teksti', teksti,
        'arvo', arvo,
        'rakenneId', rakenne_id,
        'kokoId', koko_id,
        'korkeus', korkeus,
        'kalvonTyyppiId', kalvon_tyyppi_id,
        'sijaintitarkenneId', sijaintitarkenne_id,
        'kaistanTyyppiId', kaistan_tyyppi_id,
        'kaistanNumeroId', kaistan_numero_id,
        'kaksipuoleinenKytkin', kaksipuoleinen_kytkin,
        'suuntima', suuntima,
        'lisakilvenVariId', lisakilven_vari_id
    ),
    yksilointitieto::uuid, metatieto, alkuhetki, loppuhetki,
    geom_poly, geom_piste, geom_line,
    kunta_id,
    luonti_pvm, muokkaus_pvm, datan_luoja, muokkaaja,
    is_deleted,
    malli, valmistaja, valmistumisvuosi, perusparannusvuosi,
    suunta, omistaja, haltija, kunnossapitaja, lisatietoja, inventoija,
    materiaali_id, luontitapa_id, sijaintiepavarmuus_id,
    elinkaari_id, tila_id, kunto_id,
    osoite_id, kuuluuviheralueenosaan, kuuluukatualueenosaan
FROM kohteet.liikennemerkki
ON CONFLICT DO NOTHING;

GET DIAGNOSTICS v_migrated = ROW_COUNT;
RAISE NOTICE 'liikennemerkki: migrated % of % records', v_migrated, v_total;

-- Liikennemerkki junction tables
INSERT INTO kohteet.equipment_attachment (equipment_id, attachment_id)
SELECT e.id, ll.liite_id
FROM kohteet.liikennemerkki_liite ll
JOIN kohteet.liikennemerkki lm ON lm.id = ll.liikennemerkki_id
JOIN kohteet.equipment e ON e.uuid = lm.yksilointitieto::uuid AND e.equipment_type_id = 4
ON CONFLICT DO NOTHING;

INSERT INTO kohteet.equipment_contract (equipment_id, contract_id)
SELECT e.id, lu.urakka_id
FROM kohteet.liikennemerkki_urakka lu
JOIN kohteet.liikennemerkki lm ON lm.id = lu.liikennemerkki_id
JOIN kohteet.equipment e ON e.uuid = lm.yksilointitieto::uuid AND e.equipment_type_id = 4
ON CONFLICT DO NOTHING;

INSERT INTO kohteet.equipment_plan_link (equipment_id, plan_link_id)
SELECT e.id, ls.suunnitelmalinkki_id
FROM kohteet.liikennemerkki_suunnitelmalinkki ls
JOIN kohteet.liikennemerkki lm ON lm.id = ls.liikennemerkki_id
JOIN kohteet.equipment e ON e.uuid = lm.yksilointitieto::uuid AND e.equipment_type_id = 4
ON CONFLICT DO NOTHING;

INSERT INTO kohteet.equipment_maintenance_action (equipment_id, maintenance_action_id)
SELECT e.id, lvt.varuste_toimenpide_id
FROM kohteet.liikennemerkki_varuste_toimenpide_linkki lvt
JOIN kohteet.liikennemerkki lm ON lm.id = lvt.liikennemerkki_id
JOIN kohteet.equipment e ON e.uuid = lm.yksilointitieto::uuid AND e.equipment_type_id = 4
ON CONFLICT DO NOTHING;

-- ============================================================================
-- 5. KAAPELI (equipment_type_id = 5)
-- ============================================================================
v_table_name := 'kaapeli';
SELECT count(*) INTO v_total FROM kohteet.kaapeli;

INSERT INTO kohteet.equipment (
    equipment_type_id, properties,
    uuid, metadata, valid_from, valid_to,
    geom_polygon, geom_point, geom_line,
    municipality_id,
    created_at, modified_at, created_by, modified_by,
    is_deleted,
    model, manufacturer, manufacture_year, renovation_year,
    direction, owner, holder, maintainer, additional_info, surveyor,
    material_id, creation_method_id, location_uncertainty_id,
    lifecycle_id, status_id, condition_id,
    address_id, green_area_part_id, street_area_part_id
)
SELECT
    5,
    jsonb_build_object(
        'valaisinkeskusId', valaisinkeskus_id,
        'kaapelinTarkoitusId', kaapelin_tarkoitus_id,
        'kaapelityyppiId', kaapelityyppi_id
    ),
    yksilointitieto::uuid, metatieto, alkuhetki, loppuhetki,
    geom_poly, geom_piste, geom_line,
    kunta_id,
    luonti_pvm, muokkaus_pvm, datan_luoja, muokkaaja,
    is_deleted,
    malli, valmistaja, valmistumisvuosi, perusparannusvuosi,
    suunta, omistaja, haltija, kunnossapitaja, lisatietoja, inventoija,
    materiaali_id, luontitapa_id, sijaintiepavarmuus_id,
    elinkaari_id, tila_id, kunto_id,
    osoite_id, kuuluuviheralueenosaan, kuuluukatualueenosaan
FROM kohteet.kaapeli
ON CONFLICT DO NOTHING;

GET DIAGNOSTICS v_migrated = ROW_COUNT;
RAISE NOTICE 'kaapeli: migrated % of % records', v_migrated, v_total;

-- Kaapeli junction tables
INSERT INTO kohteet.equipment_attachment (equipment_id, attachment_id)
SELECT e.id, kl.liite_id
FROM kohteet.kaapeli_liite kl
JOIN kohteet.kaapeli k ON k.id = kl.kaapeli_id
JOIN kohteet.equipment e ON e.uuid = k.yksilointitieto::uuid AND e.equipment_type_id = 5
ON CONFLICT DO NOTHING;

INSERT INTO kohteet.equipment_contract (equipment_id, contract_id)
SELECT e.id, ku.urakka_id
FROM kohteet.kaapeli_urakka ku
JOIN kohteet.kaapeli k ON k.id = ku.kaapeli_id
JOIN kohteet.equipment e ON e.uuid = k.yksilointitieto::uuid AND e.equipment_type_id = 5
ON CONFLICT DO NOTHING;

INSERT INTO kohteet.equipment_plan_link (equipment_id, plan_link_id)
SELECT e.id, ks.suunnitelmalinkki_id
FROM kohteet.kaapeli_suunnitelmalinkki ks
JOIN kohteet.kaapeli k ON k.id = ks.kaapeli_id
JOIN kohteet.equipment e ON e.uuid = k.yksilointitieto::uuid AND e.equipment_type_id = 5
ON CONFLICT DO NOTHING;

INSERT INTO kohteet.equipment_maintenance_action (equipment_id, maintenance_action_id)
SELECT e.id, kvt.varuste_toimenpide_id
FROM kohteet.kaapeli_varuste_toimenpide_linkki kvt
JOIN kohteet.kaapeli k ON k.id = kvt.kaapeli_id
JOIN kohteet.equipment e ON e.uuid = k.yksilointitieto::uuid AND e.equipment_type_id = 5
ON CONFLICT DO NOTHING;

-- ============================================================================
-- 6. RYHMASULAKE (equipment_type_id = 6)
-- Note: ryhmasulake inherits from abstractinfraomaisuuskohde, NOT
-- abstractvaruste. It has no geometry, material, or standard varuste
-- common columns. Only metadata/audit columns and type-specific fields.
-- ============================================================================
v_table_name := 'ryhmasulake';
SELECT count(*) INTO v_total FROM kohteet.ryhmasulake;

INSERT INTO kohteet.equipment (
    equipment_type_id, properties,
    uuid, metadata, valid_from, valid_to,
    municipality_id,
    created_at, modified_at, created_by, modified_by,
    is_deleted
)
SELECT
    6,
    jsonb_build_object(
        'valaisinkeskusId', valaisinkeskus_id,
        'tyyppiId', tyyppi_id,
        'laukaisukayraId', laukaisukayra_id,
        'virtaArvoId', virta_arvo_id,
        'johdonsuojaAutomaatti', johdonsuoja_automaatti,
        'ryhmakaapelityyppi', ryhmakaapelityyppi
    ),
    yksilointitieto::uuid, metatieto, alkuhetki, loppuhetki,
    kunta_id,
    luonti_pvm, muokkaus_pvm, datan_luoja, muokkaaja,
    is_deleted
FROM kohteet.ryhmasulake
ON CONFLICT DO NOTHING;

GET DIAGNOSTICS v_migrated = ROW_COUNT;
RAISE NOTICE 'ryhmasulake: migrated % of % records', v_migrated, v_total;

-- Note: ryhmasulake has no junction tables for attachments, contracts,
-- plan links, or maintenance actions in the legacy schema.

-- ============================================================================
-- MIGRATION SUMMARY
-- ============================================================================
RAISE NOTICE '========================================';
RAISE NOTICE 'Legacy equipment migration complete.';
RAISE NOTICE '========================================';

END $$;
