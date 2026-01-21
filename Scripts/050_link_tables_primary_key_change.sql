-- Remove id columns from link tables and create new primary keys from foreign key references

ALTER TABLE kohteet.ajoratamerkinta_suunnitelmalinkki DROP CONSTRAINT IF EXISTS ajoratamerkinta_suunnitelmalinkki_pkey;
ALTER TABLE kohteet.ajoratamerkinta_suunnitelmalinkki DROP COLUMN IF EXISTS id;
ALTER TABLE kohteet.ajoratamerkinta_suunnitelmalinkki ADD CONSTRAINT ajoratamerkinta_suunnitelmalinkki_pk PRIMARY KEY (ajoratamerkinta_id, suunnitelmalinkki_id);

ALTER TABLE kohteet.hulevesi_suunnitelmalinkki DROP CONSTRAINT IF EXISTS hulevesi_suunnitelmalinkki_pkey;
ALTER TABLE kohteet.hulevesi_suunnitelmalinkki DROP COLUMN IF EXISTS id;
ALTER TABLE kohteet.hulevesi_suunnitelmalinkki ADD CONSTRAINT hulevesi_suunnitelmalinkki_pk PRIMARY KEY (hulevesi_id, suunnitelmalinkki_id);

ALTER TABLE kohteet.hulevesi_varuste_toimenpide_linkki DROP CONSTRAINT IF EXISTS hulevesi_varuste_toimenpide_linkki_pkey;
ALTER TABLE kohteet.hulevesi_varuste_toimenpide_linkki DROP COLUMN IF EXISTS id;
ALTER TABLE kohteet.hulevesi_varuste_toimenpide_linkki ADD CONSTRAINT hulevesi_varuste_toimenpide_linkki_pk PRIMARY KEY (hulevesi_id, varuste_toimenpide_id);

ALTER TABLE kohteet.jate_suunnitelmalinkki DROP CONSTRAINT IF EXISTS jate_suunnitelmalinkki_pkey;
ALTER TABLE kohteet.jate_suunnitelmalinkki DROP COLUMN IF EXISTS id;
ALTER TABLE kohteet.jate_suunnitelmalinkki ADD CONSTRAINT jate_suunnitelmalinkki_pk PRIMARY KEY (jate_id, suunnitelmalinkki_id);

ALTER TABLE kohteet.kaluste_suunnitelmalinkki DROP CONSTRAINT IF EXISTS kaluste_suunnitelmalinkki_pkey;
ALTER TABLE kohteet.kaluste_suunnitelmalinkki DROP COLUMN IF EXISTS id;
ALTER TABLE kohteet.kaluste_suunnitelmalinkki ADD CONSTRAINT kaluste_suunnitelmalinkki_pk PRIMARY KEY (kaluste_id, suunnitelmalinkki_id);

ALTER TABLE kohteet.katualueenosa_paatos DROP CONSTRAINT IF EXISTS katualueenosa_paatoslinkki_pkey;
ALTER TABLE kohteet.katualueenosa_paatos DROP COLUMN IF EXISTS id;
ALTER TABLE kohteet.katualueenosa_paatos ADD CONSTRAINT katualueenosa_paatoslinkki_pk PRIMARY KEY (katualueenosa_id, paatos_id);

ALTER TABLE kohteet.katualueenosa_suunnitelmalinkki DROP CONSTRAINT IF EXISTS katualueenosa_suunnitelmalinkki_pkey;
ALTER TABLE kohteet.katualueenosa_suunnitelmalinkki DROP COLUMN IF EXISTS id;
ALTER TABLE kohteet.katualueenosa_suunnitelmalinkki ADD CONSTRAINT katualueenosa_suunnitelmalinkki_pk PRIMARY KEY (katualueenosa_id, suunnitelmalinkki_id);

ALTER TABLE kohteet.katualueenosa_viheralueenlaji DROP CONSTRAINT IF EXISTS katualueenosa_viheralueenlaji_pkey;
ALTER TABLE kohteet.katualueenosa_viheralueenlaji DROP COLUMN IF EXISTS id;
ALTER TABLE kohteet.katualueenosa_viheralueenlaji ADD CONSTRAINT katualueenosa_viheralueenlaji_pk PRIMARY KEY (katualueenosa_id, viheralueenlaji_id);

ALTER TABLE kohteet.leikkivaline_suunnitelmalinkki DROP CONSTRAINT IF EXISTS leikkivaline_suunnitelmalinkki_pkey;
ALTER TABLE kohteet.leikkivaline_suunnitelmalinkki DROP COLUMN IF EXISTS id;
ALTER TABLE kohteet.leikkivaline_suunnitelmalinkki ADD CONSTRAINT leikkivaline_suunnitelmalinkki_pk PRIMARY KEY (leikkivaline_id, suunnitelmalinkki_id);

ALTER TABLE kohteet.liikennemerkki_suunnitelmalinkki DROP CONSTRAINT IF EXISTS liikennemerkki_suunnitelmalinkki_pkey;
ALTER TABLE kohteet.liikennemerkki_suunnitelmalinkki DROP COLUMN IF EXISTS id;
ALTER TABLE kohteet.liikennemerkki_suunnitelmalinkki ADD CONSTRAINT liikennemerkki_suunnitelmalinkki_pk PRIMARY KEY (liikennemerkki_id, suunnitelmalinkki_id);

ALTER TABLE kohteet.liikunta_suunnitelmalinkki DROP CONSTRAINT IF EXISTS liikunta_suunnitelmalinkki_pkey;
ALTER TABLE kohteet.liikunta_suunnitelmalinkki DROP COLUMN IF EXISTS id;
ALTER TABLE kohteet.liikunta_suunnitelmalinkki ADD CONSTRAINT liikunta_suunnitelmalinkki_pk PRIMARY KEY (liikunta_id, suunnitelmalinkki_id);

ALTER TABLE kohteet.melu_suunnitelmalinkki DROP CONSTRAINT IF EXISTS melu_suunnitelmalinkki_pkey;
ALTER TABLE kohteet.melu_suunnitelmalinkki DROP COLUMN IF EXISTS id;
ALTER TABLE kohteet.melu_suunnitelmalinkki ADD CONSTRAINT melu_suunnitelmalinkki_pk PRIMARY KEY (melu_id, suunnitelmalinkki_id);

ALTER TABLE kohteet.muuvaruste_suunnitelmalinkki DROP CONSTRAINT IF EXISTS muuvaruste_suunnitelmalinkki_pkey;
ALTER TABLE kohteet.muuvaruste_suunnitelmalinkki DROP COLUMN IF EXISTS id;
ALTER TABLE kohteet.muuvaruste_suunnitelmalinkki ADD CONSTRAINT muuvaruste_suunnitelmalinkki_pk PRIMARY KEY (muuvaruste_id, suunnitelmalinkki_id);

ALTER TABLE kohteet.opaste_suunnitelmalinkki DROP CONSTRAINT IF EXISTS opaste_suunnitelmalinkki_pkey;
ALTER TABLE kohteet.opaste_suunnitelmalinkki DROP COLUMN IF EXISTS id;
ALTER TABLE kohteet.opaste_suunnitelmalinkki ADD CONSTRAINT opaste_suunnitelmalinkki_pk PRIMARY KEY (opaste_id, suunnitelmalinkki_id);

ALTER TABLE kohteet.paatos_liite DROP CONSTRAINT IF EXISTS paatos_liite_pkey;
ALTER TABLE kohteet.paatos_liite DROP COLUMN IF EXISTS id;
ALTER TABLE kohteet.paatos_liite ADD CONSTRAINT paatos_liite_pk PRIMARY KEY (paatos_id, liite_id);

ALTER TABLE kohteet.pysakointiruutu_suunnitelmalinkki DROP CONSTRAINT IF EXISTS pysakointiruutu_suunnitelmalinkki_pkey;
ALTER TABLE kohteet.pysakointiruutu_suunnitelmalinkki DROP COLUMN IF EXISTS id;
ALTER TABLE kohteet.pysakointiruutu_suunnitelmalinkki ADD CONSTRAINT pysakointiruutu_suunnitelmalinkki_pk PRIMARY KEY (pysakointiruutu_id, suunnitelmalinkki_id);

ALTER TABLE kohteet.rakenne_suunnitelmalinkki DROP CONSTRAINT IF EXISTS rakenne_suunnitelmalinkki_pkey;
ALTER TABLE kohteet.rakenne_suunnitelmalinkki DROP COLUMN IF EXISTS id;
ALTER TABLE kohteet.rakenne_suunnitelmalinkki ADD CONSTRAINT rakenne_suunnitelmalinkki_pk PRIMARY KEY (rakenne_id, suunnitelmalinkki_id);

ALTER TABLE kohteet.viheralueenosa_suunnitelmalinkki DROP CONSTRAINT IF EXISTS viheralueenosa_suunnitelmalinkki_pkey;
ALTER TABLE kohteet.viheralueenosa_suunnitelmalinkki DROP COLUMN IF EXISTS id;
ALTER TABLE kohteet.viheralueenosa_suunnitelmalinkki ADD CONSTRAINT viheralueenosa_suunnitelmalinkki_pk PRIMARY KEY (viheralueenosa_id, suunnitelmalinkki_id);

ALTER TABLE kohteet.ymparistotaide_suunnitelmalinkki DROP CONSTRAINT IF EXISTS ymparistotaide_suunnitelmalinkki_pkey;
ALTER TABLE kohteet.ymparistotaide_suunnitelmalinkki DROP COLUMN IF EXISTS id;
ALTER TABLE kohteet.ymparistotaide_suunnitelmalinkki ADD CONSTRAINT ymparistotaide_suunnitelmalinkki_pk PRIMARY KEY (ymparistotaide_id, suunnitelmalinkki_id);
