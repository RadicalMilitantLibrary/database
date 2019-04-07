
SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

CREATE TABLE public."ISO639" (
    language_name text NOT NULL,
    id integer NOT NULL,
    native_name text NOT NULL,
    "639-2B" character(3) NOT NULL,
    "639-3" character(3) NOT NULL,
    "639-1" character(2) NOT NULL,
    "639-2T" character(3) NOT NULL,
    note text
);

ALTER TABLE public."ISO639" OWNER TO webuser;

CREATE SEQUENCE public."ISO639_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public."ISO639_id_seq" OWNER TO webuser;

ALTER SEQUENCE public."ISO639_id_seq" OWNED BY public."ISO639".id;

CREATE TABLE public.author (
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

ALTER TABLE public.author OWNER TO webuser;

CREATE SEQUENCE public.author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.author_id_seq OWNER TO webuser;

ALTER SEQUENCE public.author_id_seq OWNED BY public.author.id;

CREATE TABLE public.document (
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
    id integer NOT NULL,
    language_id integer DEFAULT 1 NOT NULL
);

ALTER TABLE public.document OWNER TO webuser;

CREATE SEQUENCE public.document_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.document_id_seq OWNER TO webuser;

ALTER SEQUENCE public.document_id_seq OWNED BY public.document.id;

CREATE TABLE public.footnote (
    docid integer NOT NULL,
    body text NOT NULL,
    section integer NOT NULL,
    id integer NOT NULL
);

ALTER TABLE public.footnote OWNER TO webuser;

CREATE SEQUENCE public.footnote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.footnote_id_seq OWNER TO webuser;

ALTER SEQUENCE public.footnote_id_seq OWNED BY public.footnote.id;

CREATE TABLE public.forum (
    posted_on timestamp without time zone NOT NULL,
    author text,
    body text,
    thread_id integer NOT NULL,
    parent_id integer NOT NULL,
    level integer NOT NULL,
    id integer NOT NULL,
    sticky_id integer,
    misc_id integer,
    book_id integer,
    author_id integer
);

ALTER TABLE public.forum OWNER TO webuser;

CREATE SEQUENCE public.forum_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.forum_id_seq OWNER TO webuser;

ALTER SEQUENCE public.forum_id_seq OWNED BY public.forum.id;

CREATE TABLE public.korrektur (
    doc_id integer,
    type integer,
    sequence integer,
    body text,
    user_id integer
);

ALTER TABLE public.korrektur OWNER TO webuser;

CREATE TABLE public.listitems (
    list_id integer NOT NULL,
    doc_id integer NOT NULL
);

ALTER TABLE public.listitems OWNER TO webuser;

CREATE TABLE public.lists (
    id integer NOT NULL,
    name text NOT NULL,
    description text,
    owner text NOT NULL
);

ALTER TABLE public.lists OWNER TO webuser;

CREATE SEQUENCE public.lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.lists_id_seq OWNER TO webuser;

ALTER SEQUENCE public.lists_id_seq OWNED BY public.lists.id;

CREATE TABLE public.message (
    posted_on timestamp without time zone[],
    handle text,
    subject text,
    body text,
    sender_handle text,
    id integer NOT NULL
);

ALTER TABLE public.message OWNER TO webuser;

CREATE SEQUENCE public.message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.message_id_seq OWNER TO webuser;

ALTER SEQUENCE public.message_id_seq OWNED BY public.message.id;

CREATE TABLE public.metadata (
    document_id integer NOT NULL,
    key text NOT NULL,
    value text NOT NULL,
    id integer NOT NULL
);

ALTER TABLE public.metadata OWNER TO webuser;

CREATE SEQUENCE public.metadata_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.metadata_id_seq OWNER TO webuser;

ALTER SEQUENCE public.metadata_id_seq OWNED BY public.metadata.id;

CREATE TABLE public.sandbox (
    doc_id integer NOT NULL,
    paragraphtype integer NOT NULL,
    body text,
    id integer NOT NULL,
    parent_id integer NOT NULL
);

ALTER TABLE public.sandbox OWNER TO webuser;

CREATE TABLE public.stylesheet (
    owner text NOT NULL,
    style text NOT NULL,
    name text NOT NULL,
    id integer NOT NULL
);

ALTER TABLE public.stylesheet OWNER TO webuser;

CREATE SEQUENCE public.stylesheet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.stylesheet_id_seq OWNER TO webuser;

ALTER SEQUENCE public.stylesheet_id_seq OWNED BY public.stylesheet.id;

CREATE TABLE public.subject (
    owner text,
    subject_name text NOT NULL,
    subject_description text,
    picture text,
    id integer NOT NULL
);

ALTER TABLE public.subject OWNER TO webuser;

CREATE SEQUENCE public.subject_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.subject_id_seq OWNER TO webuser;

ALTER SEQUENCE public.subject_id_seq OWNED BY public.subject.id;

CREATE TABLE public."user" (
    handle text NOT NULL,
    id integer NOT NULL,
    karma integer DEFAULT 1 NOT NULL,
    xmpp text,
    diaspora text,
    mastodon text,
    irc text,
    native_language_id integer,
    user_name text DEFAULT 'Anonymous'::text NOT NULL,
    ricochet text
);

ALTER TABLE public."user" OWNER TO webuser;

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.user_id_seq OWNER TO webuser;

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;

ALTER TABLE ONLY public."ISO639" ALTER COLUMN id SET DEFAULT nextval('public."ISO639_id_seq"'::regclass);

ALTER TABLE ONLY public.author ALTER COLUMN id SET DEFAULT nextval('public.author_id_seq'::regclass);

ALTER TABLE ONLY public.document ALTER COLUMN id SET DEFAULT nextval('public.document_id_seq'::regclass);

ALTER TABLE ONLY public.footnote ALTER COLUMN id SET DEFAULT nextval('public.footnote_id_seq'::regclass);

ALTER TABLE ONLY public.forum ALTER COLUMN id SET DEFAULT nextval('public.forum_id_seq'::regclass);

ALTER TABLE ONLY public.lists ALTER COLUMN id SET DEFAULT nextval('public.lists_id_seq'::regclass);

ALTER TABLE ONLY public.message ALTER COLUMN id SET DEFAULT nextval('public.message_id_seq'::regclass);

ALTER TABLE ONLY public.metadata ALTER COLUMN id SET DEFAULT nextval('public.metadata_id_seq'::regclass);

ALTER TABLE ONLY public.stylesheet ALTER COLUMN id SET DEFAULT nextval('public.stylesheet_id_seq'::regclass);

ALTER TABLE ONLY public.subject ALTER COLUMN id SET DEFAULT nextval('public.subject_id_seq'::regclass);

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);

ALTER TABLE ONLY public.document
    ADD CONSTRAINT document_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.footnote
    ADD CONSTRAINT footnote_pkey PRIMARY KEY (docid, id);

ALTER TABLE ONLY public.forum
    ADD CONSTRAINT forum_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public."ISO639"
    ADD CONSTRAINT iso639_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.lists
    ADD CONSTRAINT lists_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.message
    ADD CONSTRAINT messagekey PRIMARY KEY (id);

ALTER TABLE ONLY public.metadata
    ADD CONSTRAINT metadata_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.stylesheet
    ADD CONSTRAINT stylesheet_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.subject
    ADD CONSTRAINT subject_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.subject
    ADD CONSTRAINT subject_subject_name_key UNIQUE (subject_name);

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);

