INSERT INTO koodistot.luontitapatyyppi (id, selite)
VALUES (1, 'digitointi'),
       (2, 'kiinteistötoimitus'),
       (3, 'kuvamittaus'),
       (4, 'laserkeilattu'),
       (5, 'maastomittaus'),
       (6, 'skannattu'),
       (7, 'tuntematon'),
       (8, 'muu');

UPDATE abstraktit.abstractvaruste
    SET suunta = (
        CASE
            WHEN suunta >= 360
                THEN ROUND((suunta::numeric % 360::numeric), 2)::double precision
            WHEN suunta < 0
                THEN 360 + ROUND((suunta::numeric % 360::numeric), 2)::double precision
        END
    )
    WHERE suunta < 0 OR suunta >= 360;
