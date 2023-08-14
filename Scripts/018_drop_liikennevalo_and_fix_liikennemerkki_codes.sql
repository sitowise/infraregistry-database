DROP TABLE kohteet.liikennevalo;

DELETE FROM kohteet.liikennemerkkityyppi2020
WHERE selite !~ '^[A-I][0-9]';
