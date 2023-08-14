ALTER TABLE koodistot.rakennetyyppi
    ADD COLUMN selite TEXT;

UPDATE koodistot.rakennetyyppi
    SET selite = (
        CASE id
            WHEN 1 THEN 'aita'
            WHEN 2 THEN 'esteettömyysramppi'
            WHEN 3 THEN 'istutuslaatikko'
            WHEN 4 THEN 'kaide'
            WHEN 5 THEN 'katos'
            WHEN 6 THEN 'kahluuallas'
            WHEN 7 THEN 'katsomo ja lava'
            WHEN 8 THEN 'kesäkukkalaatikko'
            WHEN 9 THEN 'kivijalka'
            WHEN 10 THEN 'koristeallas'
            WHEN 11 THEN 'koristemuuri'
            WHEN 12 THEN 'kulkuesteet (pollarit, puomit)'
            WHEN 13 THEN 'laituri, aallonmurtaja'
            WHEN 14 THEN 'lintu- ja näköalatorni'
            WHEN 15 THEN 'lipputanko'
            WHEN 16 THEN 'luistinkoppi'
            WHEN 17 THEN 'mankeli'
            WHEN 18 THEN 'matonpesuallas'
            WHEN 19 THEN 'muovireunus'
            WHEN 20 THEN 'muuri'
            WHEN 21 THEN 'pergola, huvimaja'
            WHEN 22 THEN 'pitkospuut'
            WHEN 23 THEN 'pollari'
            WHEN 24 THEN 'portti'
            WHEN 25 THEN 'puureunukset'
            WHEN 26 THEN 'pysäkki ilman katosta'
            WHEN 27 THEN 'pysäkkikatos'
            WHEN 28 THEN 'pysäköintilippuautomaatti'
            WHEN 29 THEN 'pyöräteline'
            WHEN 30 THEN 'rantamuuri'
            WHEN 31 THEN 'reunatuki'
            WHEN 32 THEN 'silta'
            WHEN 33 THEN 'skeittiramppi'
            WHEN 34 THEN 'sosiaalitila'
            WHEN 35 THEN 'suihkulähde'
            WHEN 36 THEN 'terassi'
            WHEN 37 THEN 'tukimuuri'
            WHEN 38 THEN 'uima-allas'
            WHEN 39 THEN 'muu'
            WHEN 40 THEN 'ei tiedossa'
        END
    );

ALTER TABLE koodistot.rakennetyyppi
    ALTER COLUMN selite SET NOT NULL;
