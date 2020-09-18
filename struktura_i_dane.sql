--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4 (Debian 12.4-1.pgdg100+1)
-- Dumped by pg_dump version 12.4 (Debian 12.4-1.pgdg100+1)

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
-- Name: produkt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produkt (
    id integer NOT NULL,
    nazwa character varying(255),
    ilosc character varying(11),
    lokalizacja character varying(255),
    sklep_id character varying(11)
);


ALTER TABLE public.produkt OWNER TO postgres;

--
-- Name: produkt_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produkt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.produkt_id_seq OWNER TO postgres;

--
-- Name: produkt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produkt_id_seq OWNED BY public.produkt.id;


--
-- Name: sklepy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sklepy (
    id integer NOT NULL,
    nazwa character varying(255),
    godzina_otwarcia character varying(15),
    godzina_zamkniecia character varying(15),
    adres character varying(255)
);


ALTER TABLE public.sklepy OWNER TO postgres;

--
-- Name: sklepy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sklepy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sklepy_id_seq OWNER TO postgres;

--
-- Name: sklepy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sklepy_id_seq OWNED BY public.sklepy.id;


--
-- Name: produkt id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produkt ALTER COLUMN id SET DEFAULT nextval('public.produkt_id_seq'::regclass);


--
-- Name: sklepy id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sklepy ALTER COLUMN id SET DEFAULT nextval('public.sklepy_id_seq'::regclass);


--
-- Data for Name: produkt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produkt (id, nazwa, ilosc, lokalizacja, sklep_id) FROM stdin;
1	Chleb	10	magazyn	1
2	Mleko	1000	alejka 23/8	1
3	Chleb	7	Wejscie do sklepu	4
4	Woda	124	magazyn	6
5	Kabanosy	13	Chlodnia	7
\.


--
-- Data for Name: sklepy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sklepy (id, nazwa, godzina_otwarcia, godzina_zamkniecia, adres) FROM stdin;
1	Żabka	06:00	23:00	Radwańska 22
4	Biedronka	07:00	22:00	Politechniki 44
5	Lidl	07:00	21:00	Kopernika 20
6	Auchan	05:00	22:00	Jana Karskiego 5
7	Tesco	06:00	22:00	Wojska Polskiego 24
\.


--
-- Name: produkt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produkt_id_seq', 5, true);


--
-- Name: sklepy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sklepy_id_seq', 7, true);


--
-- Name: produkt produkt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produkt
    ADD CONSTRAINT produkt_pkey PRIMARY KEY (id);


--
-- Name: sklepy sklepy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sklepy
    ADD CONSTRAINT sklepy_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

