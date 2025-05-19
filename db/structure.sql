SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL
);


--
-- Name: maintenance_tasks_runs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.maintenance_tasks_runs (
    id bigint NOT NULL,
    task_name character varying NOT NULL,
    started_at timestamp(6) with time zone,
    ended_at timestamp(6) with time zone,
    time_running double precision DEFAULT 0.0 NOT NULL,
    tick_count bigint DEFAULT 0 NOT NULL,
    tick_total bigint,
    job_id character varying,
    cursor character varying,
    status character varying DEFAULT 'enqueued'::character varying NOT NULL,
    error_class character varying,
    error_message character varying,
    backtrace text,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    arguments text,
    lock_version integer DEFAULT 0 NOT NULL,
    metadata text
);


--
-- Name: maintenance_tasks_runs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.maintenance_tasks_runs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: maintenance_tasks_runs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.maintenance_tasks_runs_id_seq OWNED BY public.maintenance_tasks_runs.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: maintenance_tasks_runs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.maintenance_tasks_runs ALTER COLUMN id SET DEFAULT nextval('public.maintenance_tasks_runs_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: maintenance_tasks_runs maintenance_tasks_runs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.maintenance_tasks_runs
    ADD CONSTRAINT maintenance_tasks_runs_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: index_maintenance_tasks_runs; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_maintenance_tasks_runs ON public.maintenance_tasks_runs USING btree (task_name, status, created_at DESC);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20250519051216'),
('20250519051215'),
('20250519051214'),
('20250519051213'),
('20250519051212'),
('20250519051211'),
('20250519051210'),
('20250519051209');

