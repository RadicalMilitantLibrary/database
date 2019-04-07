
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

ALTER TABLE ONLY public.lists
    ADD CONSTRAINT lists_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.message
    ADD CONSTRAINT messagekey PRIMARY KEY (id);

ALTER TABLE ONLY public.metadata
    ADD CONSTRAINT metadata_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.subject
    ADD CONSTRAINT subject_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.subject
    ADD CONSTRAINT subject_subject_name_key UNIQUE (subject_name);

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);

INSERT INTO public.stylesheet VALUES ('', '/* Version 5 */

@font-face {
  font-family : HeaderFont;
  font-weight : normal;
  font-style: normal;
  src : url(Amazon-Ember-Bold.ttf);
}

@font-face {
  font-family : HeaderFont-bd;
  font-weight : bold;
  font-style: normal;
  src : url(Amazon-Ember-Bold.ttf);
}

@font-face {
  font-family : HeaderFont-it;
  font-weight : normal;
  font-style: italic;
  src : url(Amazon-Ember-Bold.ttf);
}

@font-face {
  font-family : TextFont;
  font-weight : normal;
  font-style: normal;
  src : url(Bookerly-Regular.ttf);
}

@font-face {
  font-family : TextFont-it;
  font-weight : normal;
  font-style: italic;
  src : url(Bookerly-Italic.ttf);
}

@font-face {
  font-family : TextFont-bd;
  font-weight : bold;
  font-style: normal;
  src : url(Bookerly-Bold.ttf);
}

@font-face {
  font-family : MonoFont;
  font-weight : normal;
  font-style: normal;
  src : url(DejaVuSansMono.ttf);
}

@font-face {
  font-family : MonoFont-bd;
  font-weight : bold;
  font-style: normal;
  src : url(DejaVuSansMono.ttf);
}

@font-face {
  font-family : MonoFont-it;
  font-weight : normal;
  font-style: italic;
  src : url(DejaVuSansMono.ttf);
}

@page {
  margin-top : 1.5em;
  margin-bottom : 1.25em;
  margin-left : 1.5em;
  margin-right : 1.5em;
  line-height : 1.25em
}

/* For the titlepage */
.author {
  text-align : center;
  margin-top : 25% !important;
  font-family : "TextFont", serif}

.title {
  font-size : 150%;
  text-align : center;
  margin-top : 15% !important;
  padding-bottom : 2mm;
  font-family : "TextFont-bd", serif}

.subtitle {
  padding-top : 2mm;
  border-style : solid;
  border-width : 0px;
  border-top-width : 1px;
  border-color : black;
  text-align : center}

.publisher {
  font-size : 80%;
  text-align : center;
  font-family : "TextFont", serif;
  margin-top : 45%}

/* Section headers (always at the top of the page) */
.part {
  font-size : 150%;
  text-align : center;
  margin-top : 5em !important;
  padding-top : 0.5em;
  margin-bottom : 1.5em;
  padding-bottom : 0.5em;
  border-style : solid;
  border-width : 0px;
  border-bottom-width : 1px;
  border-top-width : 1px;
  border-color : black;
  font-family : "HeaderFont", sans-serif}

.book {
  text-align : center;
  margin-top : 3em !important;
  margin-bottom : 3em;
  padding-bottom : 0.5em;
  font-size : 135%;
  border-style : solid;
  border-width : 0px;
  border-bottom-width : 1px;
  border-color : black;
  font-family : "HeaderFont", sans-serif }

.chapter {
  text-align : center;
  margin-top : 2.4em !important;
  margin-bottom : 1.5em;
  font-size : 125%;
  font-family : "HeaderFont", sans-serif}

/* Headlines in the running text. */
.head1 {
  text-align : left;
  font-size : 115%;
  margin-top : 1.2em !important;
  margin-bottom : 0.65em;
  padding-bottom : 0.2em; 
  page-break-after : avoid;
  border-style : solid;
  border-width : 0px;
  border-bottom-width : 1px;
  border-color : black;
  font-family : "HeaderFont", sans-serif}

.head2 {
  text-align : left;
  font-size : 110%;
  margin-top : 0.9em !important;
  margin-bottom : 0.35em;
  font-family : "HeaderFont", sans-serif;
  page-break-after : avoid}

.head3 {
  text-align : left;
  font-family : "HeaderFont", sans-serif;
  font-size : 105%;
  margin-top : 1.25em !important;
  page-break-after : avoid}

/* For the table of content */
.toc1 {
  text-align : left;
  margin-top : 1.25em;
  page-break-after : avoid;
  font-family : "HeaderFont", serif}

.toc2 {
  text-align : left;
  font-size : 90%;
  page-break-after : avoid;
  font-family : "HeaderFont", serif}

.toc3 {
  text-align : left;
  font-size : 90%;
  text-indent : 1.25em}

/* Colophon page */
.copyright {
  text-align : center;
  font-size : small;
  margin-top : 2.5em !important}

.teaser{
  font-size : 95%;
  text-align : left;
  page-break-before : always}

/* RUNNING TEXT */

/* a normal paragraph with a small indent */
.indent {
  text-indent : 1.25em;
  text-align : justify}

/* a normal paragraph with a blank line over */
.blankover {
  margin-top : 1.25em;
  text-align : justify}

/* A normal paragraph with NO indent (used after the section head) */
.noindent {
  text-align : justify}

/* Quote WITH indent */
.quoteindent {
  margin-left : 1.25em;
  text-align : left;
  text-indent : 1.25em;
  font-size : 95%}

/* Quote without indent */
.quotenoindent {
  margin-left : 1.25em;
  text-align : left;
  font-size : 95%}

/* quote with blank line over */
.quoteblankover {
  margin-left : 1.25em;
  text-align : left;
  margin-top : 1.25em;
  font-size : 95%}

/* Preformatted with blank over */
.preblankover {
  font-family : "MonoFont", monospace;
  font-size : 95%;
  white-space : pre-wrap;
  margin-top : 1.25em;
  text-align : left}

/* Preformatted (there is NO preindent, becase then it wouldnt be pre would it.  */
.prenoindent {
  font-family : "MonoFont", monospace;
  font-size : 95%;
  white-space : pre-wrap;
  text-align : left}

.paravignet {
  margin-top : 0.625em;
  text-align : justify}

.vignet {
  margin-top : 0.625em;
  text-align : center}

.boxstart {
  background-color : #dddddd;
  margin : 1.25em auto;
  padding : 0.6em;
  padding-top : 0.3em;
  border-width : 2px;
  border-style : solid;
  border-color : black
}

.boxhead {
  font-family : "HeaderFont", sans-serif;
  font-size : 115%;
  margin : 0;
  padding : 0;
  margin-bottom : 0.3em
}

/* a footnote (doh) */
.footnote {
  text-align : left}

.picture {
  display : block;
  float : center;
  text-align : center;
  margin-top : 0.6em;
  margin-bottom : 0.6em }

.picture img {
  max-width : 98%;
  max-height : 98% }

table {
  border-spacing : 0;
  margin-top : 0.63em;
  margin-bottom : 0.63em;
  font-size : 95%;
  border-width : 1px;
  border-style : solid}

td {
  border-width : 1px;
  border-style : solid;
  padding : 0.2em;
  padding-bottom : 0.1em;
  text-align : left}

ul {
  margin : 0;
  margin-top : 1.25em !important; 
  margin-left : 1.25em;
  text-align : left}

ul ul /* Nested lists */{
  margin : 0;
  margin-left : 2.5em; 
  margin-top : 0;
  text-align : left}

ol {
  margin : 0;
  margin-top : 1.25em !important; 
  margin-left : 1.25em;
  text-align : left}

ol ol /* Nested lists */{
  margin : 0;
  margin-left : 2.5em; 
  margin-top : 0;
  text-align : left}

ol ul /* Nested lists */{
  margin : 0;
  margin-left : 2.5em; 
  margin-top : 0;
  text-align : left}

ul ol /* Nested lists */{
  margin : 0;
  margin-left : 2.5em; 
  margin-top : 0;
  text-align : left}

.hangingindent {
  margin : 0;
  margin-left : 1.25em;
  text-align : left;
  text-indent : -1.25em}

.hangingblankover {
  margin : 0;
  margin-top : 1.25em !important;
  margin-left : 1.25em;
  text-align : left;
  text-indent : -1.25em}

sup{
  font-size : 0.66em !important}

sub{
  font-size : 0.66em !important}

em, i {
  font-family: "TextFont-it", serif;
}

b,strong {
  font-family : "TextFont-bd", serif;
}

body {
  orphans : 0 !important;
  widows : 0 !important;
  font-family : "TextFont", serif
}', 'Global Default', 1);


SELECT pg_catalog.setval('public.stylesheet_id_seq', 1, true);

ALTER TABLE ONLY public.stylesheet
    ADD CONSTRAINT stylesheet_pkey PRIMARY KEY (id);

INSERT INTO public."ISO639" VALUES ('English', 1, 'English', 'eng', 'eng', 'en', '   ', NULL);
INSERT INTO public."ISO639" VALUES ('Old-English', 2, 'Anglosaxon', 'ang', 'ang', '  ', '   ', NULL);
INSERT INTO public."ISO639" VALUES ('Danish', 3, 'Dansk', 'dan', 'dan', 'da', '   ', NULL);
INSERT INTO public."ISO639" VALUES ('German', 4, 'Deutsch', 'deu', 'deu', 'de', 'ger', NULL);
INSERT INTO public."ISO639" VALUES ('French', 5, 'Français', 'fra', 'fra', 'fr', 'fre', NULL);
INSERT INTO public."ISO639" VALUES ('Italian', 6, 'italiano', 'ita', 'ita', 'it', '   ', NULL);
INSERT INTO public."ISO639" VALUES ('Dutch', 7, 'Nederlands', 'dut', 'nld', 'nl', 'nld', NULL);
INSERT INTO public."ISO639" VALUES ('Norwegian', 8, 'Norsk', 'nor', 'nor', 'no', '   ', NULL);
INSERT INTO public."ISO639" VALUES ('Norwegian Nynorsk', 9, 'Nynorsk', 'nno', 'nno', 'nn', '   ', NULL);
INSERT INTO public."ISO639" VALUES ('Norwegian Bokmål', 10, 'Bokmål', 'nob', 'nob', 'nb', '   ', NULL);
INSERT INTO public."ISO639" VALUES ('Polish', 11, 'Polski', 'pol', 'pol', 'pl', '   ', NULL);
INSERT INTO public."ISO639" VALUES ('Swedish', 12, 'Svenska', 'swe', 'swe', 'SV', '   ', NULL);
INSERT INTO public."ISO639" VALUES ('Spanish', 13, 'Español', 'spa', 'spa', 'es', '   ', NULL);

SELECT pg_catalog.setval('public."ISO639_id_seq"', 13, true);

ALTER TABLE ONLY public."ISO639"
    ADD CONSTRAINT iso639_pkey PRIMARY KEY (id);


