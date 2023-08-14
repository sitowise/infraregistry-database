CREATE OR REPLACE FUNCTION kohteet.check_topology(p_yksilointitieto text, p_geometry geometry)
RETURNS boolean AS $$
BEGIN
    IF (p_geometry IS NULL) THEN
        RETURN TRUE;
    END IF;
    IF EXISTS (
        SELECT 1
        FROM kohteet.katualueenosa as ko
        WHERE
            ko.yksilointitieto != p_yksilointitieto
            AND ko.geom && p_geometry
            AND NOT ST_Relate(ST_Buffer(ko.geom, -0.1), ST_Buffer(p_geometry, -0.1), 'FF*******')
    ) THEN
        RETURN FALSE;
    END IF;
    IF EXISTS (
        SELECT 1
        FROM kohteet.viheralueenosa as vo
        WHERE
            vo.yksilointitieto != p_yksilointitieto
            AND vo.geom && p_geometry
            AND NOT ST_Relate(ST_Buffer(vo.geom, -0.1), ST_Buffer(p_geometry, -0.1), 'FF*******')
    ) THEN
        RETURN FALSE;
    END IF;
    RETURN TRUE;
END;
$$ LANGUAGE plpgsql;

ALTER TABLE kohteet.katualueenosa ADD CONSTRAINT check_topology CHECK (kohteet.check_topology(yksilointitieto, geom)) NOT VALID;
ALTER TABLE kohteet.viheralueenosa ADD CONSTRAINT check_topology CHECK (kohteet.check_topology(yksilointitieto, geom)) NOT VALID;

-- CONSTRAINTS CAN LATER BE VALIDATED WITH:
-- ALTER TABLE kohteet.katualueenosa VALIDATE CONSTRAINT check_topology;
-- ALTER TABLE kohteet.viheralueenosa VALIDATE CONSTRAINT check_topology;
