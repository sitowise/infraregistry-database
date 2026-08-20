-- 069_drop_legacy_equipment_tables.sql
--
-- Drops all legacy per-type equipment tables, their junction tables,
-- per-type code list tables, and the abstract base table.
-- These tables are no longer in use after data migration to the generic
-- equipment model (scripts 060, 062, 066, 067, 068).
--
-- Total: 102 tables removed in 4 phases.
-- Idempotent: uses DROP TABLE IF EXISTS ... CASCADE throughout.

DO $$
BEGIN

  -- ============================================================
  -- Phase 1: Dropping junction tables (45)
  -- ============================================================
  RAISE NOTICE 'Vaihe 1: Dropping junction tables (45)...';

  -- Urakka junction tables (6)
  DROP TABLE IF EXISTS kohteet.hulevesi_urakka CASCADE;
  DROP TABLE IF EXISTS kohteet.jate_urakka CASCADE;
  DROP TABLE IF EXISTS kohteet.kaapeli_urakka CASCADE;
  DROP TABLE IF EXISTS kohteet.valaisin_urakka CASCADE;
  DROP TABLE IF EXISTS kohteet.valaisinkeskus_urakka CASCADE;
  DROP TABLE IF EXISTS kohteet.liikennemerkki_urakka CASCADE;

  -- Varuste_toimenpide junction tables (6)
  DROP TABLE IF EXISTS kohteet.hulevesi_varuste_toimenpide_linkki CASCADE;
  DROP TABLE IF EXISTS kohteet.jate_varuste_toimenpide_linkki CASCADE;
  DROP TABLE IF EXISTS kohteet.kaapeli_varuste_toimenpide_linkki CASCADE;
  DROP TABLE IF EXISTS kohteet.valaisin_varuste_toimenpide_linkki CASCADE;
  DROP TABLE IF EXISTS kohteet.valaisinkeskus_varuste_toimenpide_linkki CASCADE;
  DROP TABLE IF EXISTS kohteet.liikennemerkki_varuste_toimenpide_linkki CASCADE;

  -- Suunnitelmalinkki junction tables (16)
  DROP TABLE IF EXISTS kohteet.ajoratamerkinta_suunnitelmalinkki CASCADE;
  DROP TABLE IF EXISTS kohteet.hulevesi_suunnitelmalinkki CASCADE;
  DROP TABLE IF EXISTS kohteet.jate_suunnitelmalinkki CASCADE;
  DROP TABLE IF EXISTS kohteet.kaluste_suunnitelmalinkki CASCADE;
  DROP TABLE IF EXISTS kohteet.leikkivaline_suunnitelmalinkki CASCADE;
  DROP TABLE IF EXISTS kohteet.liikennemerkki_suunnitelmalinkki CASCADE;
  DROP TABLE IF EXISTS kohteet.liikunta_suunnitelmalinkki CASCADE;
  DROP TABLE IF EXISTS kohteet.melu_suunnitelmalinkki CASCADE;
  DROP TABLE IF EXISTS kohteet.muuvaruste_suunnitelmalinkki CASCADE;
  DROP TABLE IF EXISTS kohteet.opaste_suunnitelmalinkki CASCADE;
  DROP TABLE IF EXISTS kohteet.pysakointiruutu_suunnitelmalinkki CASCADE;
  DROP TABLE IF EXISTS kohteet.rakenne_suunnitelmalinkki CASCADE;
  DROP TABLE IF EXISTS kohteet.ymparistotaide_suunnitelmalinkki CASCADE;
  DROP TABLE IF EXISTS kohteet.valaisin_suunnitelmalinkki CASCADE;
  DROP TABLE IF EXISTS kohteet.valaisinkeskus_suunnitelmalinkki CASCADE;
  DROP TABLE IF EXISTS kohteet.kaapeli_suunnitelmalinkki CASCADE;

  -- Liite junction tables (16)
  DROP TABLE IF EXISTS kohteet.ajoratamerkinta_liite CASCADE;
  DROP TABLE IF EXISTS kohteet.hulevesi_liite CASCADE;
  DROP TABLE IF EXISTS kohteet.jate_liite CASCADE;
  DROP TABLE IF EXISTS kohteet.kaapeli_liite CASCADE;
  DROP TABLE IF EXISTS kohteet.kaluste_liite CASCADE;
  DROP TABLE IF EXISTS kohteet.leikkivaline_liite CASCADE;
  DROP TABLE IF EXISTS kohteet.liikennemerkki_liite CASCADE;
  DROP TABLE IF EXISTS kohteet.liikunta_liite CASCADE;
  DROP TABLE IF EXISTS kohteet.melu_liite CASCADE;
  DROP TABLE IF EXISTS kohteet.muuvaruste_liite CASCADE;
  DROP TABLE IF EXISTS kohteet.opaste_liite CASCADE;
  DROP TABLE IF EXISTS kohteet.pysakointiruutu_liite CASCADE;
  DROP TABLE IF EXISTS kohteet.rakenne_liite CASCADE;
  DROP TABLE IF EXISTS kohteet.valaisin_liite CASCADE;
  DROP TABLE IF EXISTS kohteet.valaisinkeskus_liite CASCADE;
  DROP TABLE IF EXISTS kohteet.ymparistotaide_liite CASCADE;

  -- Self-referencing junction table (1)
  DROP TABLE IF EXISTS kohteet.liikennemerkki_liikennemerkki_linkki CASCADE;

  -- ============================================================
  -- Phase 2: Dropping equipment tables (16)
  -- ============================================================
  RAISE NOTICE 'Vaihe 2: Dropping equipment tables (16)...';

  DROP TABLE IF EXISTS kohteet.hulevesi CASCADE;
  DROP TABLE IF EXISTS kohteet.jate CASCADE;
  DROP TABLE IF EXISTS kohteet.kaapeli CASCADE;
  DROP TABLE IF EXISTS kohteet.valaisin CASCADE;
  DROP TABLE IF EXISTS kohteet.valaisinkeskus CASCADE;
  DROP TABLE IF EXISTS kohteet.liikennemerkki CASCADE;
  DROP TABLE IF EXISTS kohteet.kaluste CASCADE;
  DROP TABLE IF EXISTS kohteet.opaste CASCADE;
  DROP TABLE IF EXISTS kohteet.ymparistotaide CASCADE;
  DROP TABLE IF EXISTS kohteet.melu CASCADE;
  DROP TABLE IF EXISTS kohteet.leikkivaline CASCADE;
  DROP TABLE IF EXISTS kohteet.liikunta CASCADE;
  DROP TABLE IF EXISTS kohteet.pysakointiruutu CASCADE;
  DROP TABLE IF EXISTS kohteet.rakenne CASCADE;
  DROP TABLE IF EXISTS kohteet.ajoratamerkinta CASCADE;
  DROP TABLE IF EXISTS kohteet.muuvaruste CASCADE;

  -- ============================================================
  -- Phase 3: Dropping per-type code list tables (40)
  -- ============================================================
  RAISE NOTICE 'Vaihe 3: Dropping per-type code list tables (40)...';

  -- koodistot schema (14)
  -- Note: pysakointiruututyyppi may not exist in all environments (planned but
  -- potentially never created). IF EXISTS makes this a safe no-op in that case.
  DROP TABLE IF EXISTS koodistot.hulevesityyppi CASCADE;
  DROP TABLE IF EXISTS koodistot.jatetyyppi CASCADE;
  DROP TABLE IF EXISTS koodistot.kalustetyyppi CASCADE;
  DROP TABLE IF EXISTS koodistot.opastetyyppi CASCADE;
  DROP TABLE IF EXISTS koodistot.ymparistotaidetyyppi CASCADE;
  DROP TABLE IF EXISTS koodistot.melutyyppi CASCADE;
  DROP TABLE IF EXISTS koodistot.leikkivalinetyyppi CASCADE;
  DROP TABLE IF EXISTS koodistot.liikuntatyyppi CASCADE;
  DROP TABLE IF EXISTS koodistot.rakennetyyppi CASCADE;
  DROP TABLE IF EXISTS koodistot.ajoratamerkintatyyppi CASCADE;
  DROP TABLE IF EXISTS koodistot.muuvarustetyyppi CASCADE;
  DROP TABLE IF EXISTS koodistot.liikennemerkkityyppi CASCADE;
  DROP TABLE IF EXISTS koodistot.liikennemerkkityyppi2020 CASCADE;
  DROP TABLE IF EXISTS koodistot.pysakointiruututyyppi CASCADE;

  -- kohteet schema (26)
  DROP TABLE IF EXISTS kohteet.koodisto_hulevesi_kannen_tyyppi CASCADE;
  DROP TABLE IF EXISTS kohteet.koodisto_jate_tarkastusvali CASCADE;
  DROP TABLE IF EXISTS kohteet.koodisto_liikennemerkki_rakenne CASCADE;
  DROP TABLE IF EXISTS kohteet.koodisto_liikennemerkki_koko CASCADE;
  DROP TABLE IF EXISTS kohteet.koodisto_kalvon_tyyppi CASCADE;
  DROP TABLE IF EXISTS kohteet.koodisto_sijaintitarkenne CASCADE;
  DROP TABLE IF EXISTS kohteet.koodisto_kaistan_tyyppi CASCADE;
  DROP TABLE IF EXISTS kohteet.koodisto_kaistan_numero CASCADE;
  DROP TABLE IF EXISTS kohteet.koodisto_lisakilven_vari CASCADE;
  DROP TABLE IF EXISTS kohteet.koodisto_valaisinkeskus_tyyppi CASCADE;
  DROP TABLE IF EXISTS kohteet.koodisto_valaisinkeskus_lukitus CASCADE;
  DROP TABLE IF EXISTS kohteet.koodisto_valaisinkeskus_paasulake CASCADE;
  DROP TABLE IF EXISTS kohteet.koodisto_valaisinkeskus_paasulake_tyyppi CASCADE;
  DROP TABLE IF EXISTS kohteet.koodisto_valaisinkeskus_mittarointi CASCADE;
  DROP TABLE IF EXISTS kohteet.koodisto_valaisinkeskus_ohjaustapa CASCADE;
  DROP TABLE IF EXISTS kohteet.koodisto_valaisin_pylvastyyppi CASCADE;
  DROP TABLE IF EXISTS kohteet.koodisto_valaisin_polttimotyyppi CASCADE;
  DROP TABLE IF EXISTS kohteet.koodisto_valaisin_kaapelityyppi CASCADE;
  DROP TABLE IF EXISTS kohteet.koodisto_valaisin_valaistusluokka CASCADE;
  DROP TABLE IF EXISTS kohteet.koodisto_valaisintyyppi CASCADE;
  DROP TABLE IF EXISTS kohteet.koodisto_valaisin_asennustapa CASCADE;
  DROP TABLE IF EXISTS kohteet.koodisto_valaisin_pylvaan_tuenta CASCADE;
  DROP TABLE IF EXISTS kohteet.koodisto_valaisin_varsityyppi CASCADE;
  DROP TABLE IF EXISTS kohteet.koodisto_valaisin_takuuperusteet CASCADE;
  DROP TABLE IF EXISTS kohteet.koodisto_kaapeli_tarkoitus CASCADE;
  DROP TABLE IF EXISTS kohteet.koodisto_kaapelityyppi CASCADE;

  -- ============================================================
  -- Phase 4: Dropping abstract base table (1)
  -- ============================================================
  RAISE NOTICE 'Vaihe 4: Dropping abstract base table...';

  DROP TABLE IF EXISTS abstraktit.abstractvaruste CASCADE;

END $$;
