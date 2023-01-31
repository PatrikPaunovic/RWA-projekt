--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

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
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    gender character varying(10) NOT NULL,
    email character varying(50),
    date_of_birth character varying(50)
);


ALTER TABLE public.person OWNER TO postgres;

--
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_id_seq OWNER TO postgres;

--
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;


--
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- Name: person id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);


--
-- Data for Name: coordinates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coordinates (id, name, dms_e, dms_n) FROM stdin;
3	Japan	139.6917	35.6895
1	Sjedinjene Americke Drzave	-77.0369	38.9072
2	Njemacka	13.4050	52.5200
5	Indija	77.2250	28.6353
4	Kina	116.4074	39.9042
6	Brazil	-47.9218	-15.7835
8	Juzna Afrika	18.4241	-33.9249
7	Australija	149.13	-35.2809
9	Francuska	2.3522	48.8566
11	Italija	12.4964	41.9028
12	Spanjolska	-3.7038	40.4168
10	Velika Britanija	-0.1278	51.5074
13	Nizozemska	4.8945	52.3667
14	Poljska	21.017532	52.237049
15	Srbija	20.457273	44.787197
16	Bosna i Hercegovina	18.413029	43.856430
17	Portugal	-9.142685	38.736946
18	Urugvaj	-56.164532	-34.901112
19	Turska	32.866287	39.925533
20	Indonezija	106.758850	-6.168329
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (id, name, hint_1, hint_2, hint_3, hint_4, hint_5) FROM stdin;
13	Grcka	Vise od 6.000 otoka	Plaze i turisticke destinacije poput Mykonosa i Santorinija	Arheoloska nalazista poput Delfa i Olimpije	Hrana: souvlaki i tzatziki sos-a	Vina i rakije: ouzo i tsipouro
1	Austrija	Kultura i povijest	Arhitektura i umjetnost poput Klimtovih slika i Hundertwasserovih gradevina	Planine i skijalista poput Alpa i Arlberga	Hrana poput wiener schnitzela i apfelstrudela	Glazba i znamenitosti poput Schonbrunna i Opernringa u Becu
2	Belgija	Vise od 800 vrsta piva	Sjediste EU-a je u glavnom gradu te drzave	Cokolade i slatkisi	Karnevali i lokalni festivali	Atomium i Manneken Pis
3	Ceska	Vise od 2.000 pivovara	Povijest i arhitektura u Pragu	Kristali i porculan	Vise od 10.000 jezera	Kultura pivske pivnice
4	Italija	Muzicki festivali poput Sanremo i Milano Summer Festival	Poznata po sportovima poput nogometa i formule 1	Umjetnici poput Leonarda da Vincija, Michelangela i Raffaella su rodeni tamo	Dizajnerski brendovi poput Guccija, Prada i Armani dolaze iz te drzave	Arhitektura i umjetnost: Pompejev i Uffizijev muzej
5	Finska	Vise od 188.000 jezera	Moderna arhitektura i design u Helsinki	Lignje i borovnice	Saun e i wellness centri	Uspjesni sportski timovi, poput hokejaskog tima
6	Francuska	Kuhinja i vino	Ljepote poput Eiffelovog tornja i Louvre muzeja u Parizu	Plaze i turisticke destinacije poput Normandije i Provanse	Modne kuce poput Chanela i Louisa Vuittona	Znamenitosti poput Versailles dvorca i Notre Dame katedrale
7	Danska	Vise od 400 otoka	Znamenitosti: kraljevski dvorac i Little Mermaid statue	Hrana: smorrebrod i stangle	Lokalni festivali poput Roskilde Festival-a	Obala i plaze: Bornholm i Romoj
8	Hrvatska	Vise od 1.000 otoka	Arhitektura i muzeji u Zagrebu	Obala i turisticke destinacije poput Dubrovnika i Split	Vina i vinske regije poput Istre i Dalmacije	Trenutno se nalazis u toj drzavi
9	Estonija	Arhitektura i znamenitosti poput katedrale Alexandra Nevskog i Old Town-a u glavnom gradu	Hrana: black bread i pirukas	Obala i plaze: P„rnu i Haapsalu	Nacionalni park Lahemaa	Balticka drzava
10	Spanjolska	Kuhinja i tapasi	Znamenitosti poput Prado muzeja i Santiago Bernab‚u stadiona u Madridu	Plaze i turisticke destinacije poput Ibize i Majorke	Glazba i ples poput flamenka i sardane	Arhitektura i umjetnost poput Gaudijevih gradevina i Picassovih slika
11	Grcka	Vise od 6.000 otoka	Plaze i turisticke destinacije poput Mykonosa i Santorinija	Arheoloska nalazista poput Delfa i Olimpije	Hrana: souvlaki i tzatziki sos-a	Vina i rakije: ouzo i tsipouro
14	Poljska	U toj se drzavi nalazi najveci dvorac na svijetu	Vodka potice iz te drzave	9. najveca drzava u Europi	Napad na tu drzavu je zapoceo 2. svjetski rat	Marie Curie je rodena u njoj
15	Srbija	Poznata po svojim planinama i termalnim izvorima, ukljucujući Kopaonik, Zlatibor i Vrnjacku Banju.	Ima dugu i bogatu povijest, koja seze unazad vise od 7 000 godina.	Glavni grad je poznat po svojim zivopisnim nocnim klubovima, restoranima i kaficima.	Poznata je po svom kulturnom naslijedu, ukljucujući tradicionalne narodne nosnje, muziku i plesove.	U njoj se nalazi jedan od najstarijih balkanskih manastira, Manastir Hilandar, koji datira iz 12. vijeka.
16	Bosna i Hercegovina	Ova zemlja je poznata po svojim sumovitim planinama i rijekama, kao i po brojnim termalnim izvorima.	Srednjevjekovne dvorovi i gradovi ovdje su cesto sagradeni na brdima i brezuljcima, sto ih cini jedinstvenim i nevjerojatnim.	Ova zemlja ima izuzetno bogatu historiju i kulturu, sto se moze vidjeti u brojnim muzejima i znamenitostima.	Ova zemlja je poznata po svom jelu, ukljucujuci tradicionalne jela kao sto su cevapi i burek.	Muzej u glavnom gradu ovog zemlje smjesten je u zgradi koja je nekada bila zatvor, a danas se moze posjetiti i saznati vise o povijesti ovog mjesta.
17	Portugal	Ova zemlja je poznata po svojim prekrasnim plazama, ukljucujuci jednu od najljepših plaza na svijetu.	Ima dugu povijest, a mnogi srednjevjekovni gradovi su dobro ocuvani.	Postoji tradicionalna glazba koja se smatra zastitnim znakom zemlje.	Poznata je po proizvodnji vina, ukljucujuci jedno od najpopularnijih vrsta.	U toj zemlji se nalaze mnogo kulturnih i historijskih znamenitosti, ukljucujuci jedan od najljepših samostana i katedrale.
18	Urugvaj	Ova zemlja ima jedan od najvecih i najbogatijih arheoloskih naslijeda u svijetu, ukljucujuci ruinirana mjesta Maja i Azteka.	 Glavni grad je poznat po svojoj arhitekturi i umjetnosti, uključujući katedralu i muzej u sredistu grada.	 Tamosnji narod poznat je po svojim veselim i bojama proslava, uključujući Dan mrtvih i nacionalne proslave.	Smatra se jednom od najvecih proizvodaca nafte u svijetu.	Postoji jedinstvena kuhinja koja koristi razlicite okuse i namirnice, ukljucujući koristenje chili papricica i kakaa.
19	Turska	 U toj zemlji se nalazi nekoliko svjetski poznatih povijesnih i kulturnih znamenitosti, uključujući jedan od 7 svjetskih cuda.	Poznata je po svojoj tradiciji tkalacke umjetnosti i razlicitih vrsta tkanina, ukljucujuci čuvene tepihe.	Ima jedinstvenu kuhinju koja se temelji na mediteranskim i orijentalnim okusima, ukljucujuci korištenje zacina poput papra i paparke.	Glavni grad poznat je po svojoj arhitekturi i kulturi, ukljucujuci drevne dzamije, trznice i muzeje.	Postoje brojne termalne vode i banjska mjesta, ukljucujuci jedno od najvećih termalnih banja u svijetu.
20	Indonezija	 Ova zemlja se nalazi na otocima, što joj omogucava raznoliku geografiju, od tropske dzungle do planinskih podrucja.	Poznata je po svom bogatom kulturnom naslijedu i razlicitim etnickim skupinama, sto čini jedinstvenu mijesavinu kulture i tradicija.	U njoj se nalazi nekoliko svjetski poznatih povijesnih i kulturnih znamenitosti, uključujuci drevna hramova i rusevine.	 Ima jedinstvenu kuhinju koja koristi razlicite vrste začina, ukljucujuci cili papricice i limunovo drvo.	  Poznata je po svom turizmu, ukljucujuci prekrasne plaze i znamenitosti poput podvodnog svijeta.
\.


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.person (id, first_name, last_name, gender, email, date_of_birth) FROM stdin;
1	ivo	ivic	MALE	\N	\N
\.


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.countries_id_seq', 1, false);


--
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 1, true);


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
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO admin;


--
-- PostgreSQL database dump complete
--

