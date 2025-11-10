DROP VIEW IF EXISTS kohteet.jate_view;

ALTER TABLE kohteet.jate
ALTER COLUMN koko TYPE integer USING koko::integer;
