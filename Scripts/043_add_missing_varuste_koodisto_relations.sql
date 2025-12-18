-- For each table inheriting abstractvaruste
-- add relations to koodisto_varuste_elinkaari, koodisto_varuste_kunto and koodisto_varuste_tila

-- kohteet.ajoratamerkinta
ALTER TABLE kohteet.ajoratamerkinta ADD CONSTRAINT ajoratamerkinta_elinkaari_id_fkey FOREIGN KEY (elinkaari_id)
REFERENCES kohteet.koodisto_varuste_elinkaari (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE kohteet.ajoratamerkinta ADD CONSTRAINT ajoratamerkinta_kunto_id_fkey FOREIGN KEY (kunto_id)
REFERENCES kohteet.koodisto_varuste_kunto (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE kohteet.ajoratamerkinta ADD CONSTRAINT ajoratamerkinta_tila_id_fkey FOREIGN KEY (tila_id)
REFERENCES kohteet.koodisto_varuste_tila (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

-- kohteet.hulevesi
ALTER TABLE kohteet.hulevesi ADD CONSTRAINT hulevesi_elinkaari_id_fkey FOREIGN KEY (elinkaari_id)
REFERENCES kohteet.koodisto_varuste_elinkaari (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE kohteet.hulevesi ADD CONSTRAINT hulevesi_kunto_id_fkey FOREIGN KEY (kunto_id)
REFERENCES kohteet.koodisto_varuste_kunto (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE kohteet.hulevesi ADD CONSTRAINT hulevesi_tila_id_fkey FOREIGN KEY (tila_id)
REFERENCES kohteet.koodisto_varuste_tila (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

-- kohteet.jate
ALTER TABLE kohteet.jate ADD CONSTRAINT jate_elinkaari_id_fkey FOREIGN KEY (elinkaari_id)
REFERENCES kohteet.koodisto_varuste_elinkaari (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE kohteet.jate ADD CONSTRAINT jate_kunto_id_fkey FOREIGN KEY (kunto_id)
REFERENCES kohteet.koodisto_varuste_kunto (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE kohteet.jate ADD CONSTRAINT jate_tila_id_fkey FOREIGN KEY (tila_id)
REFERENCES kohteet.koodisto_varuste_tila (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

-- kohteet.kaluste
ALTER TABLE kohteet.kaluste ADD CONSTRAINT kaluste_elinkaari_id_fkey FOREIGN KEY (elinkaari_id)
REFERENCES kohteet.koodisto_varuste_elinkaari (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE kohteet.kaluste ADD CONSTRAINT kaluste_kunto_id_fkey FOREIGN KEY (kunto_id)
REFERENCES kohteet.koodisto_varuste_kunto (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE kohteet.kaluste ADD CONSTRAINT kaluste_tila_id_fkey FOREIGN KEY (tila_id)
REFERENCES kohteet.koodisto_varuste_tila (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

-- kohteet.leikkivaline
ALTER TABLE kohteet.leikkivaline ADD CONSTRAINT leikkivaline_elinkaari_id_fkey FOREIGN KEY (elinkaari_id)
REFERENCES kohteet.koodisto_varuste_elinkaari (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE kohteet.leikkivaline ADD CONSTRAINT leikkivaline_kunto_id_fkey FOREIGN KEY (kunto_id)
REFERENCES kohteet.koodisto_varuste_kunto (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE kohteet.leikkivaline ADD CONSTRAINT leikkivaline_tila_id_fkey FOREIGN KEY (tila_id)
REFERENCES kohteet.koodisto_varuste_tila (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

-- kohteet.liikennemerkki
ALTER TABLE kohteet.liikennemerkki ADD CONSTRAINT liikennemerkki_elinkaari_id_fkey FOREIGN KEY (elinkaari_id)
REFERENCES kohteet.koodisto_varuste_elinkaari (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE kohteet.liikennemerkki ADD CONSTRAINT liikennemerkki_kunto_id_fkey FOREIGN KEY (kunto_id)
REFERENCES kohteet.koodisto_varuste_kunto (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE kohteet.liikennemerkki ADD CONSTRAINT liikennemerkki_tila_id_fkey FOREIGN KEY (tila_id)
REFERENCES kohteet.koodisto_varuste_tila (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

-- kohteet.liikunta
ALTER TABLE kohteet.liikunta ADD CONSTRAINT liikunta_elinkaari_id_fkey FOREIGN KEY (elinkaari_id)
REFERENCES kohteet.koodisto_varuste_elinkaari (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE kohteet.liikunta ADD CONSTRAINT liikunta_kunto_id_fkey FOREIGN KEY (kunto_id)
REFERENCES kohteet.koodisto_varuste_kunto (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE kohteet.liikunta ADD CONSTRAINT liikunta_tila_id_fkey FOREIGN KEY (tila_id)
REFERENCES kohteet.koodisto_varuste_tila (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

-- kohteet.melu
ALTER TABLE kohteet.melu ADD CONSTRAINT melu_elinkaari_id_fkey FOREIGN KEY (elinkaari_id)
REFERENCES kohteet.koodisto_varuste_elinkaari (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE kohteet.melu ADD CONSTRAINT melu_kunto_id_fkey FOREIGN KEY (kunto_id)
REFERENCES kohteet.koodisto_varuste_kunto (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE kohteet.melu ADD CONSTRAINT melu_tila_id_fkey FOREIGN KEY (tila_id)
REFERENCES kohteet.koodisto_varuste_tila (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

-- kohteet.muuvaruste
ALTER TABLE kohteet.muuvaruste ADD CONSTRAINT muuvaruste_elinkaari_id_fkey FOREIGN KEY (elinkaari_id)
REFERENCES kohteet.koodisto_varuste_elinkaari (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE kohteet.muuvaruste ADD CONSTRAINT muuvaruste_kunto_id_fkey FOREIGN KEY (kunto_id)
REFERENCES kohteet.koodisto_varuste_kunto (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE kohteet.muuvaruste ADD CONSTRAINT muuvaruste_tila_id_fkey FOREIGN KEY (tila_id)
REFERENCES kohteet.koodisto_varuste_tila (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

-- kohteet.opaste
ALTER TABLE kohteet.opaste ADD CONSTRAINT opaste_elinkaari_id_fkey FOREIGN KEY (elinkaari_id)
REFERENCES kohteet.koodisto_varuste_elinkaari (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE kohteet.opaste ADD CONSTRAINT opaste_kunto_id_fkey FOREIGN KEY (kunto_id)
REFERENCES kohteet.koodisto_varuste_kunto (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE kohteet.opaste ADD CONSTRAINT opaste_tila_id_fkey FOREIGN KEY (tila_id)
REFERENCES kohteet.koodisto_varuste_tila (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

-- kohteet.pysakointiruutu
ALTER TABLE kohteet.pysakointiruutu ADD CONSTRAINT pysakointiruutu_elinkaari_id_fkey FOREIGN KEY (elinkaari_id)
REFERENCES kohteet.koodisto_varuste_elinkaari (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE kohteet.pysakointiruutu ADD CONSTRAINT pysakointiruutu_kunto_id_fkey FOREIGN KEY (kunto_id)
REFERENCES kohteet.koodisto_varuste_kunto (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE kohteet.pysakointiruutu ADD CONSTRAINT pysakointiruutu_tila_id_fkey FOREIGN KEY (tila_id)
REFERENCES kohteet.koodisto_varuste_tila (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

-- kohteet.rakenne
ALTER TABLE kohteet.rakenne ADD CONSTRAINT rakenne_elinkaari_id_fkey FOREIGN KEY (elinkaari_id)
REFERENCES kohteet.koodisto_varuste_elinkaari (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE kohteet.rakenne ADD CONSTRAINT rakenne_kunto_id_fkey FOREIGN KEY (kunto_id)
REFERENCES kohteet.koodisto_varuste_kunto (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE kohteet.rakenne ADD CONSTRAINT rakenne_tila_id_fkey FOREIGN KEY (tila_id)
REFERENCES kohteet.koodisto_varuste_tila (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

-- kohteet.ymparistotaide
ALTER TABLE kohteet.ymparistotaide ADD CONSTRAINT ymparistotaide_elinkaari_id_fkey FOREIGN KEY (elinkaari_id)
REFERENCES kohteet.koodisto_varuste_elinkaari (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE kohteet.ymparistotaide ADD CONSTRAINT ymparistotaide_kunto_id_fkey FOREIGN KEY (kunto_id)
REFERENCES kohteet.koodisto_varuste_kunto (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE kohteet.ymparistotaide ADD CONSTRAINT ymparistotaide_tila_id_fkey FOREIGN KEY (tila_id)
REFERENCES kohteet.koodisto_varuste_tila (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
