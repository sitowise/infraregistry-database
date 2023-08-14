ALTER TABLE abstraktit.abstractvaruste
    ADD CONSTRAINT suunta_check CHECK ((suunta >= 0 AND suunta < 360) OR suunta IS NULL);
