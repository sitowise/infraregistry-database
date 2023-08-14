create index katualueenosa_geom_index on kohteet.katualueenosa using gist (geom);
create index viheralueenosa_geom_index on kohteet.viheralueenosa using gist (geom);

-- ---
-- --- Use this to generate SQL for trigger if needed.
-- ---
-- WITH
-- tables AS (
--     SELECT * FROM (
--         VALUES (('ajoratamerkinta')), (('hulevesi')), (('jate')), (('kaluste')), (('leikkivaline')), (('liikennemerkki')), (('liikennevalo')), (('liikunta')), (('melu')), (('muuvaruste')), (('opaste')), (('pysakointiruutu')), (('rakenne')), (('ymparistotaide'))
--     ) AS tables (tablename)
-- ),
-- columns AS (
--     SELECT 'geom_piste' AS colname UNION ALL SELECT 'geom_line' AS colname UNION ALL SELECT 'geom_poly' AS colname
-- ),
-- template AS (
--     SELECT 'CREATE INDEX {TABLE}_{COLUMN}_index ON kohteet.{TABLE} USING GIST ({COLUMN});' AS cmd
-- )
-- SELECT replace(replace(template.cmd, '{TABLE}', tables.tablename), '{COLUMN}', columns.colname) FROM tables CROSS JOIN columns CROSS JOIN template;

CREATE INDEX ajoratamerkinta_geom_piste_index ON kohteet.ajoratamerkinta USING GIST (geom_piste);
CREATE INDEX ajoratamerkinta_geom_line_index ON kohteet.ajoratamerkinta USING GIST (geom_line);
CREATE INDEX ajoratamerkinta_geom_poly_index ON kohteet.ajoratamerkinta USING GIST (geom_poly);
CREATE INDEX hulevesi_geom_piste_index ON kohteet.hulevesi USING GIST (geom_piste);
CREATE INDEX hulevesi_geom_line_index ON kohteet.hulevesi USING GIST (geom_line);
CREATE INDEX hulevesi_geom_poly_index ON kohteet.hulevesi USING GIST (geom_poly);
CREATE INDEX jate_geom_piste_index ON kohteet.jate USING GIST (geom_piste);
CREATE INDEX jate_geom_line_index ON kohteet.jate USING GIST (geom_line);
CREATE INDEX jate_geom_poly_index ON kohteet.jate USING GIST (geom_poly);
CREATE INDEX kaluste_geom_piste_index ON kohteet.kaluste USING GIST (geom_piste);
CREATE INDEX kaluste_geom_line_index ON kohteet.kaluste USING GIST (geom_line);
CREATE INDEX kaluste_geom_poly_index ON kohteet.kaluste USING GIST (geom_poly);
CREATE INDEX leikkivaline_geom_piste_index ON kohteet.leikkivaline USING GIST (geom_piste);
CREATE INDEX leikkivaline_geom_line_index ON kohteet.leikkivaline USING GIST (geom_line);
CREATE INDEX leikkivaline_geom_poly_index ON kohteet.leikkivaline USING GIST (geom_poly);
CREATE INDEX liikennemerkki_geom_piste_index ON kohteet.liikennemerkki USING GIST (geom_piste);
CREATE INDEX liikennemerkki_geom_line_index ON kohteet.liikennemerkki USING GIST (geom_line);
CREATE INDEX liikennemerkki_geom_poly_index ON kohteet.liikennemerkki USING GIST (geom_poly);
CREATE INDEX liikennevalo_geom_piste_index ON kohteet.liikennevalo USING GIST (geom_piste);
CREATE INDEX liikennevalo_geom_line_index ON kohteet.liikennevalo USING GIST (geom_line);
CREATE INDEX liikennevalo_geom_poly_index ON kohteet.liikennevalo USING GIST (geom_poly);
CREATE INDEX liikunta_geom_piste_index ON kohteet.liikunta USING GIST (geom_piste);
CREATE INDEX liikunta_geom_line_index ON kohteet.liikunta USING GIST (geom_line);
CREATE INDEX liikunta_geom_poly_index ON kohteet.liikunta USING GIST (geom_poly);
CREATE INDEX melu_geom_piste_index ON kohteet.melu USING GIST (geom_piste);
CREATE INDEX melu_geom_line_index ON kohteet.melu USING GIST (geom_line);
CREATE INDEX melu_geom_poly_index ON kohteet.melu USING GIST (geom_poly);
CREATE INDEX muuvaruste_geom_piste_index ON kohteet.muuvaruste USING GIST (geom_piste);
CREATE INDEX muuvaruste_geom_line_index ON kohteet.muuvaruste USING GIST (geom_line);
CREATE INDEX muuvaruste_geom_poly_index ON kohteet.muuvaruste USING GIST (geom_poly);
CREATE INDEX opaste_geom_piste_index ON kohteet.opaste USING GIST (geom_piste);
CREATE INDEX opaste_geom_line_index ON kohteet.opaste USING GIST (geom_line);
CREATE INDEX opaste_geom_poly_index ON kohteet.opaste USING GIST (geom_poly);
CREATE INDEX pysakointiruutu_geom_piste_index ON kohteet.pysakointiruutu USING GIST (geom_piste);
CREATE INDEX pysakointiruutu_geom_line_index ON kohteet.pysakointiruutu USING GIST (geom_line);
CREATE INDEX pysakointiruutu_geom_poly_index ON kohteet.pysakointiruutu USING GIST (geom_poly);
CREATE INDEX rakenne_geom_piste_index ON kohteet.rakenne USING GIST (geom_piste);
CREATE INDEX rakenne_geom_line_index ON kohteet.rakenne USING GIST (geom_line);
CREATE INDEX rakenne_geom_poly_index ON kohteet.rakenne USING GIST (geom_poly);
CREATE INDEX ymparistotaide_geom_piste_index ON kohteet.ymparistotaide USING GIST (geom_piste);
CREATE INDEX ymparistotaide_geom_line_index ON kohteet.ymparistotaide USING GIST (geom_line);
CREATE INDEX ymparistotaide_geom_poly_index ON kohteet.ymparistotaide USING GIST (geom_poly);
