ALTER TABLE kohteet.viheralueenosa DROP CONSTRAINT talvihoidonluokka_fk;
ALTER TABLE kohteet.viheralueenosa ADD CONSTRAINT talvihoidonluokka_id__talvihoidonluokka_id_fk FOREIGN KEY (talvihoidonluokka_id)
REFERENCES koodistot.talvihoidonluokka (id) MATCH SIMPLE
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE kohteet.viheralueenosa DROP CONSTRAINT hoitoluokka_fk;
ALTER TABLE kohteet.viheralueenosa ADD CONSTRAINT hoitoluokka_id__hoitoluokkatyyppi_id_fk FOREIGN KEY (hoitoluokka_id)
REFERENCES koodistot.hoitoluokkatyyppi (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE kohteet.viheralueenosa DROP CONSTRAINT kuuluuviherlaueeseen_fk;
ALTER TABLE kohteet.viheralueenosa ADD CONSTRAINT kuuluuviheralueeseen_id__viheralue_id_fk FOREIGN KEY (kuuluuviheralueeseen_id)
REFERENCES kohteet.viheralue (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.viheralueenosa DROP CONSTRAINT kayttotarkoitus_fk;
ALTER TABLE kohteet.viheralueenosa ADD CONSTRAINT kayttotarkoitus_id__viheralueenkayttotarkoitus_id_fk FOREIGN KEY (kayttotarkoitus_id)
REFERENCES koodistot.viheralueenkayttotarkoitus (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE kohteet.viheralueenosa DROP CONSTRAINT laji_fk;
ALTER TABLE kohteet.viheralueenosa ADD CONSTRAINT laji_id__viherosanlajityyppi_id_fk FOREIGN KEY (laji_id)
REFERENCES koodistot.viherosanlajityyppi (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE kohteet.viheralueenosa DROP CONSTRAINT katualueenlaji_fk;
ALTER TABLE kohteet.viheralueenosa ADD CONSTRAINT katualueenlaji_id__katuosanlaji_id_fk FOREIGN KEY (katualueenlaji_id)
REFERENCES koodistot.katuosanlaji (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE kohteet.viheralueenosa DROP CONSTRAINT suunnitelmalinkkitieto_fk;
ALTER TABLE kohteet.viheralueenosa ADD CONSTRAINT suunnitelmalinkkitieto_id__suunnitelmalinkki_id_fk FOREIGN KEY (suunnitelmalinkkitieto_id)
REFERENCES abstraktit.suunnitelmalinkki (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.viheralueenosa DROP CONSTRAINT puhtaapitoluokka_fk;
ALTER TABLE kohteet.viheralueenosa ADD CONSTRAINT puhtaanapitoluokka_id__puhtaanapitoluokkatyyppi_id_fk FOREIGN KEY (puhtaanapitoluokka_id)
REFERENCES koodistot.puhtaanapitoluokkatyyppi (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE kohteet.viheralueenosa DROP CONSTRAINT muutoshoitoluokka_fk;
ALTER TABLE kohteet.viheralueenosa ADD CONSTRAINT muutoshoitoluokka_id__muutoshoitoluokkatyyppi_id_fk FOREIGN KEY (muutoshoitoluokka_id)
REFERENCES koodistot.muutoshoitoluokkatyyppi (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE kohteet.katualueenosa DROP CONSTRAINT kunnossapitoluokka_fk;
ALTER TABLE kohteet.katualueenosa ADD CONSTRAINT kunnossapitoluokka_id__kunnossapitoluokka_id_fk FOREIGN KEY (kunnossapitoluokka_id)
REFERENCES koodistot.kunnossapitoluokka (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE kohteet.katualueenosa DROP CONSTRAINT katuosanlaji_fk;
ALTER TABLE kohteet.katualueenosa ADD CONSTRAINT katuosanlaji_id__katuosanlaji_id_fk FOREIGN KEY (katuosanlaji_id)
REFERENCES koodistot.katuosanlaji (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE kohteet.katualueenosa DROP CONSTRAINT talvihoidonluokka_fk;
ALTER TABLE kohteet.katualueenosa ADD CONSTRAINT talvihoidonluokka_id__talvihoidonluokka_id_fk FOREIGN KEY (talvihoidonluokka_id)
REFERENCES koodistot.talvihoidonluokka (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE kohteet.katualueenosa DROP CONSTRAINT pintamateriaali_fk;
ALTER TABLE kohteet.katualueenosa ADD CONSTRAINT pintamateriaali_id__pintamateriaali_id_fk FOREIGN KEY (pintamateriaali_id)
REFERENCES koodistot.pintamateriaali (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE kohteet.katualueenosa DROP CONSTRAINT toiminnallinenluokka_fk;
ALTER TABLE kohteet.katualueenosa ADD CONSTRAINT luokka_id__toiminnallinenluokka_id_fk FOREIGN KEY (luokka_id)
REFERENCES koodistot.toiminnallinenluokka (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE kohteet.katualueenosa DROP CONSTRAINT viherosanlajityyppi_fk;
ALTER TABLE kohteet.katualueenosa ADD CONSTRAINT viherosanlajityypi_id__viherosanlajityyppi_id_fk FOREIGN KEY (viherosanlajityypi_id)
REFERENCES koodistot.viherosanlajityyppi (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE kohteet.katualueenosa DROP CONSTRAINT sisaltaakeskilinja_fk;
ALTER TABLE kohteet.katualueenosa ADD CONSTRAINT sisaltaakeskilinja_id__keskilinja_id_fk FOREIGN KEY (sisaltaakeskilinja_id)
REFERENCES abstraktit.keskilinja (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.katualueenosa DROP CONSTRAINT kuuluukatualueeseen_fk;
ALTER TABLE kohteet.katualueenosa ADD CONSTRAINT kuuluukatualueeseen_id__katualue_id_fk FOREIGN KEY (kuuluukatualueeseen_id)
REFERENCES kohteet.katualue (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.katualueenosa DROP CONSTRAINT paatostieto_fk;
ALTER TABLE kohteet.katualueenosa ADD CONSTRAINT paatostieto_id__paatos_id_fk FOREIGN KEY (paatostieto_id)
REFERENCES abstraktit.paatos (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE abstraktit.abstractvaruste DROP CONSTRAINT materiaali_fk;
ALTER TABLE abstraktit.abstractvaruste ADD CONSTRAINT materiaali_id__varustemateriaali_id_fk FOREIGN KEY (materiaali_id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE kohteet.melu DROP CONSTRAINT melutyyppi_fk;
ALTER TABLE kohteet.melu ADD CONSTRAINT melutyyppi_id__melutyyppi_id_fk FOREIGN KEY (melutyyppi_id)
REFERENCES koodistot.melutyyppi (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE kohteet.melu DROP CONSTRAINT varustemateriaali_fk;
ALTER TABLE kohteet.melu ADD CONSTRAINT materiaali_id__melutyyppi_id_fk FOREIGN KEY (materiaali_id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE kohteet.liikunta DROP CONSTRAINT liikuntatyyppi_fk;
ALTER TABLE kohteet.liikunta ADD CONSTRAINT liikuntatyyppi_id__liikuntatyyppi_id_fk FOREIGN KEY (liikuntatyyppi_id)
REFERENCES koodistot.liikuntatyyppi (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE kohteet.liikunta DROP CONSTRAINT varustemateriaali_fk;
ALTER TABLE kohteet.liikunta ADD CONSTRAINT materiaali_id__varustemateriaali_id_fk FOREIGN KEY (materiaali_id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE kohteet.opaste DROP CONSTRAINT opastetyyppi_fk;
ALTER TABLE kohteet.opaste ADD CONSTRAINT opastetyyppi_id__opastetyyppi_id_fk FOREIGN KEY (opastetyyppi_id)
REFERENCES koodistot.opastetyyppi (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE kohteet.opaste DROP CONSTRAINT varustemateriaali_fk;
ALTER TABLE kohteet.opaste ADD CONSTRAINT materiaali_id__varustemateriaali_id_fk FOREIGN KEY (materiaali_id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE kohteet.rakenne DROP CONSTRAINT rakennetyyppi_fk;
ALTER TABLE kohteet.rakenne ADD CONSTRAINT rakennetyyyppi_id__rakennetyyppi_id_fk FOREIGN KEY (rakennetyyyppi_id)
REFERENCES koodistot.rakennetyyppi (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE kohteet.rakenne DROP CONSTRAINT varustemateriaali_fk;
ALTER TABLE kohteet.rakenne ADD CONSTRAINT materiaali_id__varustemateriaali_id_fk FOREIGN KEY (materiaali_id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE kohteet.liikennemerkki DROP CONSTRAINT liikennemerkkityyppi_fk;
ALTER TABLE kohteet.liikennemerkki ADD CONSTRAINT liikennemerkkityyppi_id__liikennemerkkityyppi_id_fk FOREIGN KEY (liikennemerkkityyppi_id)
REFERENCES koodistot.liikennemerkkityyppi (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE kohteet.liikennemerkki DROP CONSTRAINT liikennemerkkityyppi2020_fk;
ALTER TABLE kohteet.liikennemerkki ADD CONSTRAINT liikennemerkkityyppi2020_id__liikennemerkkityyppi2020_id_fk FOREIGN KEY (liikennemerkkityyppi2020_id)
REFERENCES koodistot.liikennemerkkityyppi2020 (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE kohteet.liikennemerkki DROP CONSTRAINT vaustemateriaali_fk;
ALTER TABLE kohteet.liikennemerkki ADD CONSTRAINT materiaali_id__varustemateriaali_id_fk FOREIGN KEY (materiaali_id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE kohteet.leikkivaline DROP CONSTRAINT leikkivalinetyyppi_fk;
ALTER TABLE kohteet.leikkivaline ADD CONSTRAINT leikkivalinetyyppi_id__leikkivalinetyyppi_id_fk FOREIGN KEY (leikkivalinetyyppi_id)
REFERENCES koodistot.leikkivalinetyyppi (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE kohteet.muuvaruste DROP CONSTRAINT muuvarustetyyppi_fk;
ALTER TABLE kohteet.muuvaruste ADD CONSTRAINT muuvarustetyyppi_id__muuvarustetyyppi_id_fk FOREIGN KEY (muuvarustetyyppi_id)
REFERENCES koodistot.muuvarustetyyppi (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE kohteet.muuvaruste DROP CONSTRAINT varustemateriaali_fk;
ALTER TABLE kohteet.muuvaruste ADD CONSTRAINT materiaali_id__varustemateriaali_id_fk FOREIGN KEY (materiaali_id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE kohteet.liikennevalo DROP CONSTRAINT varustemateriaali_fk;
ALTER TABLE kohteet.liikennevalo ADD CONSTRAINT materiaali_id__varustemateriaali_id_fk FOREIGN KEY (materiaali_id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE kohteet.jate DROP CONSTRAINT jatetyyppi_fk;
ALTER TABLE kohteet.jate ADD CONSTRAINT jatetyyppi_id__jatetyyppi_id_fk FOREIGN KEY (jatetyyppi_id)
REFERENCES koodistot.jatetyyppi (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

-- Sitowise / TKu: Bugi? jate.id = varustemateriaali.id?
ALTER TABLE kohteet.jate DROP CONSTRAINT varustemateriaali_fk;
ALTER TABLE kohteet.jate ADD CONSTRAINT id__varustemateriaali_id_fk FOREIGN KEY (materiaali_id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE kohteet.kaluste DROP CONSTRAINT kalustetyyppi_fk;
ALTER TABLE kohteet.kaluste ADD CONSTRAINT kalustetyyppi_id__kalustetyyppi_id_fk FOREIGN KEY (kalustetyyppi_id)
REFERENCES koodistot.kalustetyyppi (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE kohteet.kaluste DROP CONSTRAINT varustemateriaali_fk;
ALTER TABLE kohteet.kaluste ADD CONSTRAINT materiaali_id__varustemateriaali_id_fk FOREIGN KEY (materiaali_id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE kohteet.hulevesi DROP CONSTRAINT hulevesityyppi_fk;
ALTER TABLE kohteet.hulevesi ADD CONSTRAINT hulevesityyppi_id__hulevesityyppi_id_fk FOREIGN KEY (hulevesityyppi_id)
REFERENCES koodistot.hulevesityyppi (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE kohteet.hulevesi DROP CONSTRAINT varustemateriaali_fk;
ALTER TABLE kohteet.hulevesi ADD CONSTRAINT materiaali_id__varustemateriaali_id_fk FOREIGN KEY (materiaali_id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE kohteet.ajoratamerkinta DROP CONSTRAINT ajoratamerkintatyyppi_fk;
ALTER TABLE kohteet.ajoratamerkinta ADD CONSTRAINT ajoratamerkintatyyppi_id__ajoratamerkintatyyppi_id_fk FOREIGN KEY (ajoratamerkintatyyppi_id)
REFERENCES koodistot.ajoratamerkintatyyppi (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE kohteet.ymparistotaide DROP CONSTRAINT ymparistotaidetyyppi_fk;
ALTER TABLE kohteet.ymparistotaide ADD CONSTRAINT ymparistotaidetyyppi_id__ymparistotaidetyyppi_id_fk FOREIGN KEY (ymparistotaidetyyppi_id)
REFERENCES koodistot.ymparistotaidetyyppi (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE kohteet.ymparistotaide DROP CONSTRAINT varustemateriaali_fk;
ALTER TABLE kohteet.ymparistotaide ADD CONSTRAINT materiaali_id__varustemateriaali_id_fk FOREIGN KEY (materiaali_id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE meta.aineistotoimituksentiedot DROP CONSTRAINT infraokohteet_fk;
ALTER TABLE meta.aineistotoimituksentiedot ADD CONSTRAINT toimitus_id__infraokohteet_id_fk FOREIGN KEY (toimitus_id)
REFERENCES meta.infraokohteet (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE abstraktit.osoite DROP CONSTRAINT nimi_fk;
ALTER TABLE abstraktit.osoite ADD CONSTRAINT nimitieto_id__nimi_id_fk FOREIGN KEY (nimitieto_id)
REFERENCES abstraktit.nimi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.pysakointiruutu DROP CONSTRAINT varustemateriaali_fk;
ALTER TABLE kohteet.pysakointiruutu ADD CONSTRAINT materiaali_id__varustemateriaali_id_fk FOREIGN KEY (materiaali_id)
REFERENCES koodistot.varustemateriaali (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE abstraktit.sijainti DROP CONSTRAINT sijaintiepavarmuustyyppi_fk;
ALTER TABLE abstraktit.sijainti ADD CONSTRAINT sijaintiepavarmuus_id__sijaintiepavarmuustyyppi_id_fk FOREIGN KEY (sijaintiepavarmuus_id)
REFERENCES koodistot.sijaintiepavarmuustyyppi (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE abstraktit.sijainti DROP CONSTRAINT osoitetieto_fk;
ALTER TABLE abstraktit.sijainti ADD CONSTRAINT osoitetieto_id__osoite_id_fk FOREIGN KEY (osoitetieto_id)
REFERENCES abstraktit.osoite (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE kohteet.erikoisrakennekerros DROP CONSTRAINT erikoisrakennekerrosmateriaalityyppi_fk;
ALTER TABLE kohteet.erikoisrakennekerros ADD CONSTRAINT erikoisrakkerrosmattyyppi_id__erikoiskrakkerrosmattyyppi_id_fk FOREIGN KEY (erikoisrakennekerrosmateriaalityyppi_id)
REFERENCES koodistot.erikoisrakennekerrosmateriaalityyppi (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

-- Sitowise / TKu Huomio: "_id" puuttuu kasviryhma-kentän nimestä
ALTER TABLE kohteet.muukasvi DROP CONSTRAINT kasviryhma_fk;
ALTER TABLE kohteet.muukasvi ADD CONSTRAINT kasviryhma__kasviryhmatyyppi_id FOREIGN KEY (kasviryhma)
REFERENCES koodistot.kasviryhmatyyppi (id) MATCH SIMPLE
ON DELETE RESTRICT ON UPDATE CASCADE;

-- Sitowise / TKu Huomio: "_id" puuttuu kasvilaji-kentän nimestä
ALTER TABLE kohteet.muukasvi DROP CONSTRAINT kasvilaji_fk;
ALTER TABLE kohteet.muukasvi ADD CONSTRAINT kasvilaji__kasvilaji_id_fk FOREIGN KEY (kasvilaji)
REFERENCES koodistot.kasvilaji (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE kohteet.puu DROP CONSTRAINT puutyyppi_fk;
ALTER TABLE kohteet.puu ADD CONSTRAINT puutyyppi_id__puutyyppi_id_fk FOREIGN KEY (puutyyppi_id)
REFERENCES koodistot.puutyyppi (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE kohteet.puu DROP CONSTRAINT puulaji_fk;
ALTER TABLE kohteet.puu ADD CONSTRAINT puulaji_id__puulaji_id_fk FOREIGN KEY (puulaji_id)
REFERENCES koodistot.puulaji (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE abstraktit.paatos DROP CONSTRAINT liitetieto_fk;
ALTER TABLE abstraktit.paatos ADD CONSTRAINT liitetieto_id__liitetieto_id_fk FOREIGN KEY (liitetieto_id)
REFERENCES abstraktit.liitetieto (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE abstraktit.liitetieto DROP CONSTRAINT suunnitelma_id;
ALTER TABLE abstraktit.liitetieto ADD CONSTRAINT suunnitelma_id__suunnitelma_id_fk FOREIGN KEY (suunnitelma_id)
REFERENCES abstraktit.suunnitelma (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE abstraktit.suunnitelmalinkki DROP CONSTRAINT liitetieto_fk;
ALTER TABLE abstraktit.suunnitelmalinkki ADD CONSTRAINT liitetieto_id__liitetieto_id_fk FOREIGN KEY (liitetieto_id)
REFERENCES abstraktit.liitetieto (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;
