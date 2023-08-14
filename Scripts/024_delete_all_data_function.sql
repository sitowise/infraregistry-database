CREATE OR REPLACE FUNCTION kohteet.delete_all_data()
 RETURNS void
 LANGUAGE plpgsql
AS $function$
DECLARE
    sql_clause text;
    target record;
BEGIN
    -- FOR target IN
    --     SELECT schemaname, tablename FROM pg_tables WHERE schemaname = 'kohteet' ORDER BY schemaname, tablename
    -- LOOP
    --     sql_clause := 'DELETE FROM ' || quote_ident(target.schemaname) || '.' || quote_ident(target.tablename) || ';';
    --     RAISE NOTICE '%', sql_clause;

    --     EXECUTE sql_clause;
    -- END LOOP;

    DELETE FROM kohteet.abstractpaikkatietopalvelukohde;
    DELETE FROM kohteet.aineistotoimituksentiedot CASCADE;
    DELETE FROM kohteet.liite CASCADE;
    DELETE FROM kohteet.nimi CASCADE;
    DELETE FROM kohteet.osoite CASCADE;
    DELETE FROM kohteet.paatos CASCADE;
    DELETE FROM kohteet.suunnitelma CASCADE;
END;
$function$;

revoke execute on function kohteet.delete_all_data() from infrao_editor_$MunicipalityCode$;

-- BEGIN;
-- SELECT kohteet.delete_all_data();
-- ROLLBACK;
