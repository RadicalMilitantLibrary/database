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

--
-- TOC entry 1 (class 3079 OID 11863)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3800 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 173 (class 1259 OID 40241)
-- Name: author; Type: TABLE; Schema: public; Owner: webuser; Tablespace: 
--

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


--
-- TOC entry 511 (class 1259 OID 42269)
-- Name: author_id_seq; Type: SEQUENCE; Schema: public; Owner: webuser
--

CREATE SEQUENCE author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE author_id_seq OWNER TO webuser;

--
-- TOC entry 3801 (class 0 OID 0)
-- Dependencies: 511
-- Name: author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webuser
--

ALTER SEQUENCE author_id_seq OWNED BY author.id;


--
-- TOC entry 512 (class 1259 OID 42271)
-- Name: document; Type: TABLE; Schema: public; Owner: webuser; Tablespace: 
--

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

--
-- TOC entry 513 (class 1259 OID 42280)
-- Name: document_id_seq; Type: SEQUENCE; Schema: public; Owner: webuser
--

CREATE SEQUENCE document_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE document_id_seq OWNER TO webuser;

--
-- TOC entry 3802 (class 0 OID 0)
-- Dependencies: 513
-- Name: document_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webuser
--

ALTER SEQUENCE document_id_seq OWNED BY document.id;


--
-- TOC entry 514 (class 1259 OID 42282)
-- Name: footnote; Type: TABLE; Schema: public; Owner: webuser; Tablespace: 
--

CREATE TABLE footnote (
    docid integer NOT NULL,
    body text NOT NULL,
    section integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE footnote OWNER TO webuser;

--
-- TOC entry 515 (class 1259 OID 42288)
-- Name: footnote_id_seq; Type: SEQUENCE; Schema: public; Owner: webuser
--

CREATE SEQUENCE footnote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE footnote_id_seq OWNER TO webuser;

--
-- TOC entry 3803 (class 0 OID 0)
-- Dependencies: 515
-- Name: footnote_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webuser
--

ALTER SEQUENCE footnote_id_seq OWNED BY footnote.id;


--
-- TOC entry 516 (class 1259 OID 42290)
-- Name: forum; Type: TABLE; Schema: public; Owner: webuser; Tablespace: 
--

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

--
-- TOC entry 517 (class 1259 OID 42296)
-- Name: forum_id_seq; Type: SEQUENCE; Schema: public; Owner: webuser
--

CREATE SEQUENCE forum_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE forum_id_seq OWNER TO webuser;

--
-- TOC entry 3804 (class 0 OID 0)
-- Dependencies: 517
-- Name: forum_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webuser
--

ALTER SEQUENCE forum_id_seq OWNED BY forum.id;


--
-- TOC entry 518 (class 1259 OID 42298)
-- Name: message; Type: TABLE; Schema: public; Owner: webuser; Tablespace: 
--

CREATE TABLE message (
    posted_on timestamp without time zone NOT NULL,
    handle text NOT NULL,
    subject text,
    body text,
    sender_handle text,
    id integer NOT NULL
);


ALTER TABLE message OWNER TO webuser;

--
-- TOC entry 519 (class 1259 OID 42304)
-- Name: message_id_seq; Type: SEQUENCE; Schema: public; Owner: webuser
--

CREATE SEQUENCE message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE message_id_seq OWNER TO webuser;

--
-- TOC entry 3805 (class 0 OID 0)
-- Dependencies: 519
-- Name: message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webuser
--

ALTER SEQUENCE message_id_seq OWNED BY message.id;


--
-- TOC entry 520 (class 1259 OID 42306)
-- Name: metadata; Type: TABLE; Schema: public; Owner: webuser; Tablespace: 
--

CREATE TABLE metadata (
    document_id integer NOT NULL,
    key text NOT NULL,
    value text NOT NULL,
    id integer NOT NULL
);


ALTER TABLE metadata OWNER TO webuser;

--
-- TOC entry 521 (class 1259 OID 42312)
-- Name: metadata_id_seq; Type: SEQUENCE; Schema: public; Owner: webuser
--

CREATE SEQUENCE metadata_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE metadata_id_seq OWNER TO webuser;

--
-- TOC entry 3806 (class 0 OID 0)
-- Dependencies: 521
-- Name: metadata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webuser
--

ALTER SEQUENCE metadata_id_seq OWNED BY metadata.id;


--
-- TOC entry 522 (class 1259 OID 42314)
-- Name: news; Type: TABLE; Schema: public; Owner: webuser; Tablespace: 
--

CREATE TABLE news (
    headline text NOT NULL,
    body text NOT NULL,
    author text NOT NULL,
    posted timestamp without time zone NOT NULL,
    id integer NOT NULL
);


ALTER TABLE news OWNER TO webuser;

--
-- TOC entry 523 (class 1259 OID 42320)
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: webuser
--

CREATE SEQUENCE news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE news_id_seq OWNER TO webuser;

--
-- TOC entry 3807 (class 0 OID 0)
-- Dependencies: 523
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webuser
--

ALTER SEQUENCE news_id_seq OWNED BY news.id;


--
-- TOC entry 524 (class 1259 OID 42322)
-- Name: sandbox; Type: TABLE; Schema: public; Owner: webuser; Tablespace: 
--

CREATE TABLE sandbox (
    doc_id integer NOT NULL,
    paragraphtype integer NOT NULL,
    body text,
    id integer NOT NULL,
    parent_id integer NOT NULL
);


ALTER TABLE sandbox OWNER TO webuser;

--
-- TOC entry 525 (class 1259 OID 42328)
-- Name: stylesheet; Type: TABLE; Schema: public; Owner: webuser; Tablespace: 
--

CREATE TABLE stylesheet (
    owner text NOT NULL,
    style text NOT NULL,
    name text NOT NULL,
    id integer NOT NULL
);


ALTER TABLE stylesheet OWNER TO webuser;

--
-- TOC entry 526 (class 1259 OID 42334)
-- Name: stylesheet_id_seq; Type: SEQUENCE; Schema: public; Owner: webuser
--

CREATE SEQUENCE stylesheet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE stylesheet_id_seq OWNER TO webuser;

--
-- TOC entry 3808 (class 0 OID 0)
-- Dependencies: 526
-- Name: stylesheet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webuser
--

ALTER SEQUENCE stylesheet_id_seq OWNED BY stylesheet.id;


--
-- TOC entry 527 (class 1259 OID 42336)
-- Name: subject; Type: TABLE; Schema: public; Owner: webuser; Tablespace: 
--

CREATE TABLE subject (
    owner text,
    subject_name text NOT NULL,
    subject_description text,
    picture text,
    id integer NOT NULL
);


ALTER TABLE subject OWNER TO webuser;

--
-- TOC entry 528 (class 1259 OID 42342)
-- Name: subject_id_seq; Type: SEQUENCE; Schema: public; Owner: webuser
--

CREATE SEQUENCE subject_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE subject_id_seq OWNER TO webuser;

--
-- TOC entry 3809 (class 0 OID 0)
-- Dependencies: 528
-- Name: subject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webuser
--

ALTER SEQUENCE subject_id_seq OWNED BY subject.id;


--
-- TOC entry 529 (class 1259 OID 42344)
-- Name: user; Type: TABLE; Schema: public; Owner: webuser; Tablespace: 
--

CREATE TABLE "user" (
    handle text NOT NULL,
    email text,
    pass text NOT NULL,
    id integer NOT NULL
);


ALTER TABLE "user" OWNER TO webuser;

--
-- TOC entry 530 (class 1259 OID 42350)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: webuser
--

CREATE SEQUENCE user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_id_seq OWNER TO webuser;

--
-- TOC entry 3810 (class 0 OID 0)
-- Dependencies: 530
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webuser
--

ALTER SEQUENCE user_id_seq OWNED BY "user".id;


--
-- TOC entry 3651 (class 2604 OID 42352)
-- Name: id; Type: DEFAULT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY author ALTER COLUMN id SET DEFAULT nextval('author_id_seq'::regclass);


--
-- TOC entry 3655 (class 2604 OID 42353)
-- Name: id; Type: DEFAULT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY document ALTER COLUMN id SET DEFAULT nextval('document_id_seq'::regclass);


--
-- TOC entry 3656 (class 2604 OID 42354)
-- Name: id; Type: DEFAULT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY footnote ALTER COLUMN id SET DEFAULT nextval('footnote_id_seq'::regclass);


--
-- TOC entry 3657 (class 2604 OID 42355)
-- Name: id; Type: DEFAULT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY forum ALTER COLUMN id SET DEFAULT nextval('forum_id_seq'::regclass);


--
-- TOC entry 3658 (class 2604 OID 42356)
-- Name: id; Type: DEFAULT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY message ALTER COLUMN id SET DEFAULT nextval('message_id_seq'::regclass);


--
-- TOC entry 3659 (class 2604 OID 42357)
-- Name: id; Type: DEFAULT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY metadata ALTER COLUMN id SET DEFAULT nextval('metadata_id_seq'::regclass);


--
-- TOC entry 3660 (class 2604 OID 42358)
-- Name: id; Type: DEFAULT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY news ALTER COLUMN id SET DEFAULT nextval('news_id_seq'::regclass);


--
-- TOC entry 3661 (class 2604 OID 42359)
-- Name: id; Type: DEFAULT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY stylesheet ALTER COLUMN id SET DEFAULT nextval('stylesheet_id_seq'::regclass);


--
-- TOC entry 3662 (class 2604 OID 42360)
-- Name: id; Type: DEFAULT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY subject ALTER COLUMN id SET DEFAULT nextval('subject_id_seq'::regclass);


--
-- TOC entry 3663 (class 2604 OID 42361)
-- Name: id; Type: DEFAULT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('user_id_seq'::regclass);


--
-- TOC entry 3665 (class 2606 OID 44855)
-- Name: document_pkey; Type: CONSTRAINT; Schema: public; Owner: webuser; Tablespace: 
--

ALTER TABLE ONLY document
    ADD CONSTRAINT document_pkey PRIMARY KEY (id);


--
-- TOC entry 3667 (class 2606 OID 44857)
-- Name: footnote_pkey; Type: CONSTRAINT; Schema: public; Owner: webuser; Tablespace: 
--

ALTER TABLE ONLY footnote
    ADD CONSTRAINT footnote_pkey PRIMARY KEY (docid, id);


--
-- TOC entry 3669 (class 2606 OID 44859)
-- Name: forum_pkey; Type: CONSTRAINT; Schema: public; Owner: webuser; Tablespace: 
--

ALTER TABLE ONLY forum
    ADD CONSTRAINT forum_pkey PRIMARY KEY (id);


--
-- TOC entry 3671 (class 2606 OID 44861)
-- Name: message_pkey; Type: CONSTRAINT; Schema: public; Owner: webuser; Tablespace: 
--

ALTER TABLE ONLY message
    ADD CONSTRAINT message_pkey PRIMARY KEY (id);


--
-- TOC entry 3673 (class 2606 OID 44863)
-- Name: metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: webuser; Tablespace: 
--

ALTER TABLE ONLY metadata
    ADD CONSTRAINT metadata_pkey PRIMARY KEY (id);


--
-- TOC entry 3675 (class 2606 OID 44865)
-- Name: news_pkey; Type: CONSTRAINT; Schema: public; Owner: webuser; Tablespace: 
--

ALTER TABLE ONLY news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- TOC entry 3677 (class 2606 OID 44867)
-- Name: stylesheet_pkey; Type: CONSTRAINT; Schema: public; Owner: webuser; Tablespace: 
--

ALTER TABLE ONLY stylesheet
    ADD CONSTRAINT stylesheet_pkey PRIMARY KEY (id);


--
-- TOC entry 3679 (class 2606 OID 44869)
-- Name: subject_pkey; Type: CONSTRAINT; Schema: public; Owner: webuser; Tablespace: 
--

ALTER TABLE ONLY subject
    ADD CONSTRAINT subject_pkey PRIMARY KEY (id);


--
-- TOC entry 3681 (class 2606 OID 44871)
-- Name: subject_subject_name_key; Type: CONSTRAINT; Schema: public; Owner: webuser; Tablespace: 
--

ALTER TABLE ONLY subject
    ADD CONSTRAINT subject_subject_name_key UNIQUE (subject_name);


--
-- TOC entry 3683 (class 2606 OID 44873)
-- Name: user_pkey; Type: CONSTRAINT; Schema: public; Owner: webuser; Tablespace: 
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 3799 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-11-24 12:48:04 CET

--
-- PostgreSQL database dump complete
--

