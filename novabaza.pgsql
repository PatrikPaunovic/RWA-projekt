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
-- Name: coordinates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coordinates (
    id integer NOT NULL,
    name text NOT NULL,
    dms_e numeric NOT NULL,
    dms_n numeric NOT NULL
);


ALTER TABLE public.coordinates OWNER TO postgres;

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
-- Data for Name: coordinates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coordinates (id, name, dms_e, dms_n) FROM stdin;
3	Japan	36	138
1	Sjedinjene Americke Drzave	40	-100
2	Njemacka	51	9
4	Kina	35	105
7	Australija	-27	133
6	Brazil	-10	-55
5	Indija	20	77
8	Juzna Afrika	-30	24
9	Francuska	46	2
10	Velika Britanija	54	-2
11	Italija	42	12
12	Spanjolska	40	-4
13	Nizozemska	52	5
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (id, name, hint_1, hint_2, hint_3, hint_4, hint_5) FROM stdin;
13	Grcka	Vise od 6.000 otoka	Plaze i turisticke destinacije poput Mykonosa i Santorinija	Arheoloska nalazista poput Delfa i Olimpije	Hrana: souvlaki i tzatziki sos-a	Vina i rakije: ouzo i tsipouro
1	Austrija	Kultura i povijest	Arhitektura i umjetnost poput Klimtovih slika i Hundertwasserovih gra??evina	Planine i skijalista poput Alpa i Arlberga	Hrana poput wiener schnitzela i apfelstrudela	Glazba i znamenitosti poput Schonbrunna i Opernringa u Becu
2	Belgija	Vise od 800 vrsta piva	Sjediste EU-a je u glavnom gradu te drzave	Cokolade i slatkisi	Karnevali i lokalni festivali	Atomium i Manneken Pis
3	Ceska	Vise od 2.000 pivovara	Povijest i arhitektura u Pragu	Kristali i porculan	Vise od 10.000 jezera	Kultura pivske pivnice
4	Italija	Muzicki festivali poput Sanremo i Milano Summer Festival	Poznata po sportovima poput nogometa i formule 1	Umjetnici poput Leonarda da Vincija, Michelangela i Raffaella su rodeni tamo	Dizajnerski brendovi poput Guccija, Prada i Armani dolaze iz te drzave	Arhitektura i umjetnost: Pompejev i Uffizijev muzej
5	Finska	Vise od 188.000 jezera	Moderna arhitektura i design u Helsinki	Lignje i borovnice	Saun e i wellness centri	Uspjesni sportski timovi, poput hokejaskog tima
6	Francuska	Kuhinja i vino	Ljepote poput Eiffelovog tornja i Louvre muzeja u Parizu	Plaze i turisticke destinacije poput Normandije i Provanse	Modne kuce poput Chanela i Louisa Vuittona	Znamenitosti poput Versailles dvorca i Notre Dame katedrale
7	Danska	Vise od 400 otoka	Znamenitosti: kraljevski dvorac i Little Mermaid statue	Hrana: smorrebrod i stangle	Lokalni festivali poput Roskilde Festival-a	Obala i plaze: Bornholm i Romoj
8	Hrvatska	Vise od 1.000 otoka	Arhitektura i muzeji u Zagrebu	Obala i turisticke destinacije poput Dubrovnika i Split	Vina i vinske regije poput Istre i Dalmacije	Trenutno se nalazis u toj drzavi
9	Estonija	Arhitektura i znamenitosti poput katedrale Alexandra Nevskog i Old Town-a u glavnom gradu	Hrana: black bread i pirukas	Obala i plaze: P???rnu i Haapsalu	Nacionalni park Lahemaa	Balticka drzava
10	Spanjolska	Kuhinja i tapasi	Znamenitosti poput Prado muzeja i Santiago Bernab???u stadiona u Madridu	Plaze i turisticke destinacije poput Ibize i Majorke	Glazba i ples poput flamenka i sardane	Arhitektura i umjetnost poput Gaudijevih gradevina i Picassovih slika
11	Grcka	Vise od 6.000 otoka	Plaze i turisticke destinacije poput Mykonosa i Santorinija	Arheoloska nalazista poput Delfa i Olimpije	Hrana: souvlaki i tzatziki sos-a	Vina i rakije: ouzo i tsipouro
\.


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.countries_id_seq', 1, false);


--
-- Name: coordinates coordinates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coordinates
    ADD CONSTRAINT coordinates_pkey PRIMARY KEY (id);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

