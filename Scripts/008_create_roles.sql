DO $$
DECLARE
    role_name TEXT;
    schema_name TEXT;
BEGIN
    FOREACH role_name IN ARRAY ARRAY['infrao_admin_$MunicipalityCode$', 'infrao_editor_$MunicipalityCode$', 'infrao_viewer_$MunicipalityCode$']
    LOOP
        BEGIN
            EXECUTE format('CREATE ROLE %I WITH
                            NOLOGIN
                            NOSUPERUSER
                            INHERIT
                            NOCREATEDB
                            NOCREATEROLE
                            NOREPLICATION', role_name);
            EXCEPTION WHEN DUPLICATE_OBJECT THEN
                RAISE NOTICE 'not creating role %I -- it already exists', role_name;
        END;

        EXECUTE format('GRANT CONNECT ON DATABASE %I to %I', current_database(), role_name);
        EXECUTE format('GRANT USAGE ON SCHEMA public, koodistot, abstraktit, kohteet, meta TO %I', role_name);
        EXECUTE format('GRANT SELECT ON TABLE public.qgis_projects, public.spatial_ref_sys TO %I', role_name);
        EXECUTE format('GRANT SELECT ON ALL TABLES IN SCHEMA koodistot TO %I', role_name);

        FOREACH schema_name IN ARRAY ARRAY['abstraktit', 'kohteet', 'meta']
        LOOP
            IF position('viewer' in role_name) = 0 THEN
                EXECUTE format('GRANT INSERT, SELECT, UPDATE, DELETE ON ALL TABLES IN SCHEMA %I TO %I;
                                GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA %I TO %I;
                                GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA %I TO %I',
                                schema_name, role_name, schema_name, role_name, schema_name, role_name);
                EXECUTE format('ALTER DEFAULT PRIVILEGES IN SCHEMA %I
                                    GRANT INSERT, SELECT, UPDATE, DELETE ON TABLES TO %I;
                                ALTER DEFAULT PRIVILEGES IN SCHEMA %I
                                    GRANT USAGE, SELECT ON SEQUENCES TO %I;
                                ALTER DEFAULT PRIVILEGES IN SCHEMA %I
                                    GRANT EXECUTE ON FUNCTIONS TO %I', schema_name, role_name, schema_name, role_name, schema_name, role_name);
            ELSE
                EXECUTE format('GRANT SELECT ON ALL TABLES IN SCHEMA %I TO %I', schema_name, role_name);
                EXECUTE format('ALTER DEFAULT PRIVILEGES IN SCHEMA %I
                                    GRANT SELECT ON TABLES TO %I', schema_name, role_name);
            END IF;
        END LOOP;
    END LOOP;


    EXECUTE format('GRANT infrao_viewer_$MunicipalityCode$ TO infrao_admin_$MunicipalityCode$ WITH ADMIN OPTION');
    EXECUTE format('GRANT infrao_editor_$MunicipalityCode$ TO infrao_admin_$MunicipalityCode$ WITH ADMIN OPTION');
    EXECUTE format('GRANT UPDATE ON TABLE public.qgis_projects TO infrao_admin_$MunicipalityCode$');
END
$$;
