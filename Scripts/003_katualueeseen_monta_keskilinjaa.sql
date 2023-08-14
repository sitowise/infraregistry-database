-- Backup data
CREATE TEMPORARY TABLE temp_katualueenosan_keskilinja AS
SELECT id, sisaltaakeskilinja_id from kohteet.katualueenosa;

-- Drop old referencing column and foreign key.
ALTER TABLE kohteet.katualueenosa DROP CONSTRAINT IF EXISTS sisaltaakeskilinja_fk CASCADE;
ALTER TABLE kohteet.katualueenosa DROP COLUMN sisaltaakeskilinja_id;

-- Create new referencing column and update data
ALTER TABLE abstraktit.keskilinja ADD COLUMN kuuluukatualueenosaan int;
UPDATE abstraktit.keskilinja SET kuuluukatualueenosaan = temp.id
    FROM temp_katualueenosan_keskilinja temp WHERE temp.sisaltaakeskilinja_id = keskilinja.id;

-- Create new foreign key
ALTER TABLE abstraktit.keskilinja ADD CONSTRAINT kuuluukatualueenosaan__katualueenosa_id_fk FOREIGN KEY (kuuluukatualueenosaan)
REFERENCES kohteet.katualueenosa (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;
