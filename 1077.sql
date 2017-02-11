
SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;


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


ALTER TABLE ONLY forum ALTER COLUMN id SET DEFAULT nextval('forum_id_seq'::regclass);


ALTER TABLE ONLY news ALTER COLUMN id SET DEFAULT nextval('news_id_seq'::regclass);


ALTER TABLE ONLY stylesheet ALTER COLUMN id SET DEFAULT nextval('stylesheet_id_seq'::regclass);


ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('user_id_seq'::regclass);


ALTER TABLE ONLY forum
    ADD CONSTRAINT forum_pkey PRIMARY KEY (id);


ALTER TABLE ONLY news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


ALTER TABLE ONLY stylesheet
    ADD CONSTRAINT stylesheet_pkey PRIMARY KEY (id);


ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


