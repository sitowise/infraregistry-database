CREATE TABLE public.qgis_projects_history (
    id int generated always as identity,
    name text,
    metadata jsonb,
    content bytea,
    archive_timestamp timestamp with time zone default CURRENT_TIMESTAMP,
    archive_user name default CURRENT_USER,
    archive_triggered_by text CHECK (archive_triggered_by IN ('UPDATE', 'DELETE'))
);

CREATE OR REPLACE FUNCTION public.qgis_projects_history()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
DECLARE
    table_name TEXT;
    updated_count int;
BEGIN
    IF TG_OP IN ('DELETE', 'UPDATE') THEN
        INSERT INTO qgis_projects_history (name, metadata, content, archive_triggered_by) VALUES (OLD.name, OLD.metadata, OLD.content, TG_OP);
    END IF;

    RETURN NULL;
END;
$function$;

drop trigger if exists qgis_projects_history ON public.qgis_projects;
create trigger qgis_projects_history after
delete
    or
update
     on
    public.qgis_projects for each row execute function public.qgis_projects_history();

--
-- Test code for development
--
-- BEGIN;
--
-- UPDATE qgis_projects SET name = name;
-- SELECT * from qgis_projects_history;
-- UPDATE qgis_projects SET name = name;
-- SELECT * from qgis_projects_history;

-- DELETE FROM qgis_projects;

-- SELECT * FROM qgis_projects;
-- SELECT * from qgis_projects_history;
--
-- ROLLBACK;
