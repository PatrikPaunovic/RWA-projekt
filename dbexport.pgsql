--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    hint_1 character varying(255) NOT NULL,
    hint_2 character varying(255) NOT NULL,
    hint_3 character varying(255) NOT NULL,
    hint_4 character varying(255) NOT NULL,
    hint_5 character varying(255) NOT NULL
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.countries_id_seq OWNER TO postgres;

--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (id, name, hint_1, hint_2, hint_3, hint_4, hint_5) FROM stdin;
1	Njemaźka	Ovo je dr§ava u Europi koja ima viçe od 80 milijuna stanovnika	Glavni grad je Berlin	Jezik je njemaźki	Graniźi s Danskom, Poljskom, ¬eçkom, Austrijom, ćvicarskom, Francuskom, Luksemburgom i Holandijom	Poznata je po Njemaźkoj autocesti i pivu
2	Italija	Ovo je dr§ava u Europi s preko 60 milijuna stanovnika	Glavni grad je Rim	Jezik je talijanski	Graniźi s Austrijom, ćvicarskom, Francuskom, Slovenijom i Hrvatskom	Poznata je po kulturnim i povijesnim spomenicima, umjetnosti, kuhinji i modi
3	ćpanjolska	Ovo je dr§ava u Europi s preko 47 milijuna stanovnika	Glavni grad je Madrid	Jezik je çpanjolski	Graniźi s Portugalom, Francuskom i Andorom	Poznata je po Flamenku, paelli i San Ferminu
4	Velika Britanija	Ovo je dr§ava sastavljena od Engleske, ćkotske, Walesa i Sjeverne Irske	Glavni grad je London	Jezik je engleski	Graniźi s Irskom i Atlantskim oceaonom	Poznata je po Big Benu, Buckinghamskoj palaźi i Tower Bridgeu
\.


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.countries_id_seq', 4, true);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

