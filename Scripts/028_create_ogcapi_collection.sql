DROP FUNCTION IF EXISTS remove_view_suffix(text);
CREATE OR REPLACE FUNCTION remove_view_suffix(text) RETURNS text AS $$
BEGIN
  IF RIGHT($1, 5) = '_view' THEN
    RETURN LEFT($1, length($1) - 5);
  ELSE
    RETURN $1;
  END IF;
END; $$ LANGUAGE plpgsql;

DROP FUNCTION IF EXISTS create_ogc_api_collection_item(p_schemaname name, p_tablename name, p_geometry_column name, p_crs_list text[], p_connection_string text);
CREATE OR REPLACE FUNCTION create_ogc_api_collection_item(
    p_schemaname name,
    p_tablename name,
    p_geometry_column name,
    p_crs_list text[],
    p_connection_string text
)
RETURNS jsonb
AS
$function$
DECLARE
    v_coll_json jsonb;
    v_columns name[];
    v_srid int;
BEGIN

    -- Initialize a base JSON object for the collection
    v_coll_json := '{
          "Features": {
            "Storage": {
              "Type": "PostGis",
              "GeometryDataType": "geometry",
              "GeometryGeoJsonType": "GeometryCollection",
              "DateTimeColumn": "luonti_pvm",
              "IdentifierColumn": "id",
              "AllowCreate": false,
              "AllowReplace": false,
              "AllowUpdate": false,
              "AllowDelete": false
            }
          }
        }'::jsonb;

    -- Collect column names
    SELECT array_agg(c.column_name ORDER BY c.ordinal_position) INTO v_columns
    FROM INFORMATION_SCHEMA.COLUMNS c
    WHERE
        table_schema = p_schemaname
        AND table_name = p_tablename
        AND data_type NOT IN ('USER-DEFINED')
    GROUP BY table_name
    ORDER BY table_name;

    -- Get the SRID for the geometry column
    SELECT srid INTO v_srid
    FROM geometry_columns gc
    WHERE gc.f_table_schema = p_schemaname
        AND gc.f_table_name = p_tablename
        AND f_geometry_column = p_geometry_column;

    -- Update the base JSON object with specific parameters
    v_coll_json := jsonb_set(v_coll_json, '{Id}', to_jsonb(remove_view_suffix(p_tablename)), true);
    v_coll_json := jsonb_set(v_coll_json, '{Title}', to_jsonb(remove_view_suffix(p_tablename)), true);
    v_coll_json := jsonb_set(v_coll_json, '{Features,Storage,Properties}', to_jsonb(v_columns), true);
    v_coll_json := jsonb_set(v_coll_json, '{Features,Crs}', to_jsonb(p_crs_list), true);
    v_coll_json := jsonb_set(v_coll_json, '{Features,Storage,Schema}', to_jsonb(p_schemaname), true);
    v_coll_json := jsonb_set(v_coll_json, '{Features,Storage,Table}', to_jsonb(p_tablename), true);
    v_coll_json := jsonb_set(v_coll_json, '{Features,Storage,GeometryColumn}', to_jsonb(p_geometry_column), true);
    v_coll_json := jsonb_set(v_coll_json, '{Features,Storage,ConnectionString}', to_jsonb(p_connection_string), true);
    v_coll_json := jsonb_set(v_coll_json, '{Features,Storage,GeometrySrid}', to_jsonb(v_srid), true);
    v_coll_json := jsonb_set(v_coll_json, '{Features,StorageCrs}', to_jsonb('http://www.opengis.net/def/crs/EPSG/0/' || v_srid::text), true);

    RETURN v_coll_json;
END;
$function$
LANGUAGE plpgsql;

DROP FUNCTION IF EXISTS create_ogc_api_collection(text, text[]);
CREATE OR REPLACE FUNCTION create_ogc_api_collection(
    p_connection_string text,
    p_crs_list text[]
) RETURNS TEXT AS $$
DECLARE
    v_collection jsonb;
BEGIN
    WITH table_info AS (
        -- Fetch the specified tables
        SELECT t.tablename as table_name
        FROM pg_tables t
        WHERE t.schemaname = 'kohteet'
        AND t.tablename IN (
            'katualueenosa',
            'keskilinja',
            'viheralueenosa'
        )
    ),
    view_info AS (
        -- Fetch the specified views
        SELECT v.viewname as table_name
        FROM pg_views v
        WHERE v.schemaname = 'kohteet'
        AND v.viewname IN (
            'ajoratamerkinta_view',
            'erikoisrakennekerros_view',
            'hulevesi_view',
            'jate_view',
            'kaluste_view',
            'leikkivaline_view',
            'liikennemerkki_view',
            'liikunta_view',
            'melu_view',
            'muukasvi_view',
            'muuvaruste_view',
            'opaste_view',
            'osoite_view',
            'puu_view',
            'pysakointiruutu_view',
            'rakenne_view',
            'ymparistotaide_view'
        )
    ),
    combined_info AS (
        -- Combine table and view info
        SELECT * FROM table_info
        UNION
        SELECT * FROM view_info
        ORDER BY table_name
    )
    -- Generate the collection
    SELECT jsonb_agg(
        create_ogc_api_collection_item(
            'kohteet',
            table_name,
            'geom',
            p_crs_list,
            p_connection_string
        )
    ) INTO v_collection
    FROM combined_info;

    RETURN jsonb_pretty(v_collection);
END;
$$ LANGUAGE plpgsql;

SELECT create_ogc_api_collection('Host=ora2pg.smart.sito.local;User Id=infrao_admin;Database=infrao_test_dev;Port=5432;SSL Mode=Require;Trust Server Certificate=true;Timeout=50;', ARRAY['http://www.opengis.net/def/crs/OGC/1.3/CRS84', 'http://www.opengis.net/def/crs/EPSG/0/3067']);
