CREATE EXTENSION IF NOT EXISTS postgis;

CREATE TABLE public.qgis_projects (
    name text NOT NULL,
    metadata jsonb,
    content bytea
);

ALTER TABLE ONLY public.qgis_projects
    ADD CONSTRAINT qgis_projects_pkey PRIMARY KEY (name);
