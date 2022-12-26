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
5	Austrija	 Ovo je drzava u Europi koja je poznata po svojim koncertima uzorka Straussa.	Poznata je po svojim planinama, kao çto su Alpe i planina Grossglockner	Zemlja je poznata po svojoj kuhinji, u kojoj su popularni Wiener Schnitzel, Tafelspitz i Apfelstrudel.	Skladatelj Mozart je roden u njoj	Jezik je njemacki
6	Ceska	Ovo je dr§ava u Europi s 10.7 milijuna stanovnika	 Poznata je po svojoj povijesti, kulturi i umjetnosti, kao çto su Praçka tvrdjava i Karlov most.	Jedan grad iz te drzave je Karlowy Wary	Granici s Poljskom, Slovackom, Austrijom i Njemackom	Poznati nogometas Petr Czech je iz te drzave
7	Andora	Ima oko 77.000 stanovnika i jedna je od najmanjih drzava u Europi po povrçini.	Ima vlastitu valutu, pezetu.	Ovo je drzava u Europi koja se nalazi u Pyrenejima izmeĐu ćpanjolske i Francuske.	Jezik kojim se prica u toj drzavi je katalonski	9% te drzave je u UNESCO World Heritage statusu
8	Malta	Ima oko 515.000 stanovnika.	Dva od njezina tri otocja su: Goze i Comina.	Ima vlastitu valutu, malteçku liru.	Poznata je po svojoj kulturi i tradicijama, kao çto su povorke i karneval u Maltozi.	Otocna drzava juzno od Sicilije
9	Moldavija	Ovo je drzava u Europi koja se nalazi u istoźnom dijelu kontinenta i ima oko 2,7 milijuna stanovnika.	Glavni grad je Kishinev	Poznata je po svojim vinogradima i proizvodnji vina.	Ima vlastitu valutu, leu	Granici izmedu Rumunjske i Ukrajine
10	Kosovo	Ovo je dr§ava u Europi koja se nalazi u jugoistoźnom dijelu kontinenta i ima oko 1,8 milijuna stanovnika.	Valuta je euro	Poznata je po svojim planinama i rijekama, kao çto su planina Accursed i rijeka Ib‰r.	Glavni grad je priçtina	Granici izmedu Srbije i Albanije
11	Monako	Ovo je dr§ava u Europi koja se nalazi na Sredozemlju i poznata je po svojoj luksuznoj arhitekturi	Dr§ava ima oko 39.000 stanovnika i jedna je od najmanjih dr§ava na svijetu po povrçini	Glavni grad je Monako i poznat je po Katedrali Svetog Nikole i Kraljevskom dvorcu u Monaku	Valuta je euro	Poznata je po svojoj povijesti i kulturi, kao çto su Muzej Oceanografije i Monte Carlo Casino
12	Slovenija	Ovo je dr§ava u Europi koja se nalazi u jugoistoźnoj Europi i poznata je po svojoj prirodnoj ljepoti	Dr§ava ima oko 2,1 milijuna stanovnika i poznata je po svojim jezerima, planinama i vodopadima	Valuta koju koristi je euro	Glavni grad je Ljubljana i poznat je po svojoj arhitekturi, kao çto su Tromostovje i Ljubljanski grad	Poznata je po svojoj povijesti i kulturi, kao çto su Muzej likovnih umjetnosti i Narodni muzej Slovenije
13	Hrvatska	Ovo je dr§ava u Europi koja se nalazi na Jadranu i poznata je po svojoj prirodnoj ljepoti	Dr§ava ima oko 4 milijuna stanovnika i poznata je po svojim pla§ama, jezerima i planinama	Glavni grad je Zagreb i poznat je po svojoj arhitekturi, kao çto su Katedrala Svetog Stjepana i Zagrebaźki grad	Valuta se nedavno promijenila iz kune u euro	Poznata je po svojoj povijesti i kulturi, kao çto su Muzej Mimara i Muzej za umjetnost i obrt
14	Litva	Ovo je dr§ava u Europi koja se nalazi u sjeveroistoźnoj Europi i poznata je po svojoj povijesti	Dr§ava ima oko 2,8 milijuna stanovnika i poznata je po svojoj prirodnoj ljepoti, kao çto su jezera i çume	Glavni grad je Vilnius i poznat je po svojoj arhitekturi, kao çto su Gediminasova tvrĐava i Katedrala Svetog Petra i Pavla	Ima vlastitu valutu, litu	Poznata je po svojoj povijesti i kulturi, kao çto su Muzej Litavske povijesti i Muzej Gruto Parkas
15	Portugal	Ovo je dr§ava u Europi koja se nalazi na Iberijskom poluotoku i poznata je po svojoj povijesti i kulturi	Dr§ava ima oko 10 milijuna stanovnika i poznata je po svojim pla§ama, vinima i kuhinji	Bivça valuta je eskuda	Glavni grad je Lisbon i poznat je po svojoj arhitekturi, kao çto su Torre de Belem i Katedrala Svetog Jeronima	Poznata je po svojoj povijesti i kulturi, kao çto su Most Vasco da Gama i Muzej Azulejos
\.


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.countries_id_seq', 15, true);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

