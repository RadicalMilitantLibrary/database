--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.9
-- Dumped by pg_dump version 9.4.9
-- Started on 2016-11-24 12:48:04 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

CREATE TABLE author (
    name text NOT NULL,
    sort_name text NOT NULL,
    bio text,
    maintainer text NOT NULL,
    born integer NOT NULL,
    dead integer NOT NULL,
    picture text,
    source text,
    letter text,
    id integer NOT NULL
);

ALTER TABLE author OWNER TO webuser;

CREATE SEQUENCE author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE author_id_seq OWNER TO webuser;

ALTER SEQUENCE author_id_seq OWNED BY author.id;

CREATE TABLE document (
    status integer DEFAULT 0 NOT NULL,
    posted_on timestamp without time zone DEFAULT now() NOT NULL,
    handle text NOT NULL,
    subject_id integer NOT NULL,
    author_id integer NOT NULL,
    title text NOT NULL,
    subtitle text,
    year integer,
    "unique" text,
    teaser text,
    keywords text,
    copyright text,
    downloads integer DEFAULT 0,
    id integer NOT NULL
);

ALTER TABLE document OWNER TO webuser;

CREATE SEQUENCE document_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE document_id_seq OWNER TO webuser;

ALTER SEQUENCE document_id_seq OWNED BY document.id;

CREATE TABLE footnote (
    docid integer NOT NULL,
    body text NOT NULL,
    section integer NOT NULL,
    id integer NOT NULL
);

ALTER TABLE footnote OWNER TO webuser;

CREATE SEQUENCE footnote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE footnote_id_seq OWNER TO webuser;

ALTER SEQUENCE footnote_id_seq OWNED BY footnote.id;

CREATE TABLE forum (
    posted_on timestamp without time zone NOT NULL,
    author text,
    body text,
    thread_id integer NOT NULL,
    parent_id integer NOT NULL,
    level integer NOT NULL,
    id integer NOT NULL
);

ALTER TABLE forum OWNER TO webuser;

CREATE SEQUENCE forum_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE forum_id_seq OWNER TO webuser;

ALTER SEQUENCE forum_id_seq OWNED BY forum.id;

CREATE TABLE message (
    posted_on timestamp without time zone NOT NULL,
    handle text NOT NULL,
    subject text,
    body text,
    sender_handle text,
    id integer NOT NULL
);

ALTER TABLE message OWNER TO webuser;

CREATE SEQUENCE message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE message_id_seq OWNER TO webuser;

ALTER SEQUENCE message_id_seq OWNED BY message.id;

CREATE TABLE metadata (
    document_id integer NOT NULL,
    key text NOT NULL,
    value text NOT NULL,
    id integer NOT NULL
);

ALTER TABLE metadata OWNER TO webuser;

CREATE SEQUENCE metadata_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE metadata_id_seq OWNER TO webuser;

ALTER SEQUENCE metadata_id_seq OWNED BY metadata.id;

CREATE TABLE news (
    headline text NOT NULL,
    body text NOT NULL,
    author text NOT NULL,
    posted timestamp without time zone NOT NULL,
    id integer NOT NULL
);

ALTER TABLE news OWNER TO webuser;

CREATE SEQUENCE news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE news_id_seq OWNER TO webuser;

ALTER SEQUENCE news_id_seq OWNED BY news.id;

CREATE TABLE sandbox (
    doc_id integer NOT NULL,
    paragraphtype integer NOT NULL,
    body text,
    id integer NOT NULL,
    parent_id integer NOT NULL
);

ALTER TABLE sandbox OWNER TO webuser;

CREATE TABLE stylesheet (
    owner text NOT NULL,
    style text NOT NULL,
    name text NOT NULL,
    id integer NOT NULL
);

ALTER TABLE stylesheet OWNER TO webuser;

CREATE SEQUENCE stylesheet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE stylesheet_id_seq OWNER TO webuser;

ALTER SEQUENCE stylesheet_id_seq OWNED BY stylesheet.id;

CREATE TABLE subject (
    owner text,
    subject_name text NOT NULL,
    subject_description text,
    picture text,
    id integer NOT NULL
);

ALTER TABLE subject OWNER TO webuser;

CREATE SEQUENCE subject_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE subject_id_seq OWNER TO webuser;

ALTER SEQUENCE subject_id_seq OWNED BY subject.id;

CREATE TABLE "user" (
    handle text NOT NULL,
    email text,
    pass text NOT NULL,
    id integer NOT NULL
);

ALTER TABLE "user" OWNER TO webuser;

CREATE SEQUENCE user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE user_id_seq OWNER TO webuser;

ALTER SEQUENCE user_id_seq OWNED BY "user".id;

ALTER TABLE ONLY author ALTER COLUMN id SET DEFAULT nextval('author_id_seq'::regclass);

ALTER TABLE ONLY document ALTER COLUMN id SET DEFAULT nextval('document_id_seq'::regclass);

ALTER TABLE ONLY footnote ALTER COLUMN id SET DEFAULT nextval('footnote_id_seq'::regclass);

ALTER TABLE ONLY forum ALTER COLUMN id SET DEFAULT nextval('forum_id_seq'::regclass);

ALTER TABLE ONLY message ALTER COLUMN id SET DEFAULT nextval('message_id_seq'::regclass);

ALTER TABLE ONLY metadata ALTER COLUMN id SET DEFAULT nextval('metadata_id_seq'::regclass);

ALTER TABLE ONLY news ALTER COLUMN id SET DEFAULT nextval('news_id_seq'::regclass);

ALTER TABLE ONLY stylesheet ALTER COLUMN id SET DEFAULT nextval('stylesheet_id_seq'::regclass);

ALTER TABLE ONLY subject ALTER COLUMN id SET DEFAULT nextval('subject_id_seq'::regclass);

ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('user_id_seq'::regclass);

ALTER TABLE ONLY document
    ADD CONSTRAINT document_pkey PRIMARY KEY (id);

ALTER TABLE ONLY footnote
    ADD CONSTRAINT footnote_pkey PRIMARY KEY (docid, id);

ALTER TABLE ONLY forum
    ADD CONSTRAINT forum_pkey PRIMARY KEY (id);

ALTER TABLE ONLY message
    ADD CONSTRAINT message_pkey PRIMARY KEY (id);

ALTER TABLE ONLY metadata
    ADD CONSTRAINT metadata_pkey PRIMARY KEY (id);

ALTER TABLE ONLY news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);

ALTER TABLE ONLY stylesheet
    ADD CONSTRAINT stylesheet_pkey PRIMARY KEY (id);

ALTER TABLE ONLY subject
    ADD CONSTRAINT subject_pkey PRIMARY KEY (id);

ALTER TABLE ONLY subject
    ADD CONSTRAINT subject_subject_name_key UNIQUE (subject_name);

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-11-24 12:48:04 CET

--
-- PostgreSQL database dump complete
--

