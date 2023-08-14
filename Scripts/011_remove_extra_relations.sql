ALTER TABLE kohteet.katualueenosa drop column sisaltaakasvillisuus_id;

ALTER TABLE kohteet.viheralueenosa drop column sisaltaakasvillisuus_id;
ALTER TABLE kohteet.viheralueenosa drop column sisaltaavaruste;

ALTER TABLE kohteet.melu DROP CONSTRAINT materiaali_id__melutyyppi_id_fk;

ALTER TABLE kohteet.jate DROP CONSTRAINT id__varustemateriaali_id_fk;
