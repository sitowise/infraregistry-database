-- Drop legacy equipment views that reference per-type tables.
-- This removes the pg_depend relationship so that INFRAREGISTRY-346 can drop
-- the legacy tables without CASCADE.
-- The views will be immediately re-created by the NullJournal view upgrader
-- (Scripts/views/*.sql) which now reads from kohteet.equipment instead.

DROP VIEW IF EXISTS kohteet.hulevesi_view;
DROP VIEW IF EXISTS kohteet.jate_view;
DROP VIEW IF EXISTS kohteet.liikennemerkki_view;
DROP VIEW IF EXISTS kohteet.kaluste_view;
DROP VIEW IF EXISTS kohteet.opaste_view;
DROP VIEW IF EXISTS kohteet.ymparistotaide_view;
DROP VIEW IF EXISTS kohteet.melu_view;
DROP VIEW IF EXISTS kohteet.leikkivaline_view;
DROP VIEW IF EXISTS kohteet.liikunta_view;
DROP VIEW IF EXISTS kohteet.pysakointiruutu_view;
DROP VIEW IF EXISTS kohteet.rakenne_view;
DROP VIEW IF EXISTS kohteet.ajoratamerkinta_view;
DROP VIEW IF EXISTS kohteet.muuvaruste_view;
