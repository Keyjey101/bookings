--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-05-30 14:56:14

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

--
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

-- outcomment if not CREATED
--CREATE SCHEMA public;


--
-- TOC entry 3351 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 16418)
-- Name: bookings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bookings (
    id integer NOT NULL,
    "isVip" boolean DEFAULT false,
    "isActive" boolean DEFAULT true,
    "dateAt" timestamp with time zone,
    "dateTo" timestamp with time zone,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "clientId" integer,
    "roomId" integer
);


--
-- TOC entry 219 (class 1259 OID 16417)
-- Name: bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bookings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3352 (class 0 OID 0)
-- Dependencies: 219
-- Name: bookings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bookings_id_seq OWNED BY public.bookings.id;


--
-- TOC entry 218 (class 1259 OID 16411)
-- Name: clients; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.clients (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 16410)
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.clients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3353 (class 0 OID 0)
-- Dependencies: 217
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;


--
-- TOC entry 216 (class 1259 OID 16403)
-- Name: rooms; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rooms (
    id integer NOT NULL,
    description character varying(255) DEFAULT 'Прекрасный номер с шикарным видом на забор'::character varying,
    level integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 16402)
-- Name: rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.rooms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3354 (class 0 OID 0)
-- Dependencies: 215
-- Name: rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.rooms_id_seq OWNED BY public.rooms.id;


--
-- TOC entry 3187 (class 2604 OID 16421)
-- Name: bookings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bookings ALTER COLUMN id SET DEFAULT nextval('public.bookings_id_seq'::regclass);


--
-- TOC entry 3186 (class 2604 OID 16414)
-- Name: clients id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);


--
-- TOC entry 3184 (class 2604 OID 16406)
-- Name: rooms id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rooms ALTER COLUMN id SET DEFAULT nextval('public.rooms_id_seq'::regclass);


--
-- TOC entry 3345 (class 0 OID 16418)
-- Dependencies: 220
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bookings (id, "isVip", "isActive", "dateAt", "dateTo", "createdAt", "updatedAt", "clientId", "roomId") FROM stdin;
1	t	t	2023-05-01 14:31:31.472+05	2023-05-30 14:31:31.472+05	2023-05-30 14:33:11.062+05	2023-05-30 14:33:11.062+05	1	1
2	t	t	2023-05-01 14:31:31.472+05	2023-05-30 14:31:31.472+05	2023-05-30 14:33:32.387+05	2023-05-30 14:33:32.387+05	2	2
3	t	t	2023-05-10 14:31:31.472+05	2023-05-30 14:31:31.472+05	2023-05-30 14:33:44.253+05	2023-05-30 14:33:44.253+05	2	3
4	f	t	2023-05-10 14:31:31.472+05	2023-05-30 14:31:31.472+05	2023-05-30 14:34:13.349+05	2023-05-30 14:34:13.349+05	1	4
5	f	t	2023-05-12 14:31:31.472+05	2023-05-30 14:31:31.472+05	2023-05-30 14:34:52.752+05	2023-05-30 14:34:52.752+05	2	5
6	t	t	2023-05-01 14:31:31.472+05	2023-05-10 14:31:31.472+05	2023-05-30 14:35:30.201+05	2023-05-30 14:35:30.201+05	3	6
8	f	t	2023-05-16 14:31:31.472+05	2023-05-30 14:31:31.472+05	2023-05-30 14:35:53.185+05	2023-05-30 14:35:53.185+05	3	6
7	t	f	2023-05-11 14:31:31.472+05	2023-05-15 14:31:31.472+05	2023-05-30 14:35:42.449+05	2023-05-30 14:36:22.911+05	2	6
\.


--
-- TOC entry 3343 (class 0 OID 16411)
-- Dependencies: 218
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.clients (id, name, "createdAt", "updatedAt") FROM stdin;
1	John Doe	2023-05-30 14:30:20.585+05	2023-05-30 14:30:20.585+05
2	John Dillinger	2023-05-30 14:30:30.075+05	2023-05-30 14:30:30.075+05
3	John Smith	2023-05-30 14:30:38.035+05	2023-05-30 14:30:38.035+05
\.


--
-- TOC entry 3341 (class 0 OID 16403)
-- Dependencies: 216
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.rooms (id, description, level, "createdAt", "updatedAt") FROM stdin;
1	Прекрасный номер с шикарным видом на забор	1	2023-05-30 14:30:50.239+05	2023-05-30 14:30:50.239+05
2	Прекрасный номер с шикарным видом на забор	1	2023-05-30 14:30:52.656+05	2023-05-30 14:30:52.656+05
3	Прекрасный номер с шикарным видом на забор	1	2023-05-30 14:30:53.646+05	2023-05-30 14:30:53.646+05
4	Прекрасный номер с шикарным видом на забор	2	2023-05-30 14:31:12.06+05	2023-05-30 14:31:12.06+05
5	great view	2	2023-05-30 14:31:22.342+05	2023-05-30 14:31:22.342+05
6	super great view	2	2023-05-30 14:31:31.472+05	2023-05-30 14:31:31.472+05
\.


--
-- TOC entry 3355 (class 0 OID 0)
-- Dependencies: 219
-- Name: bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bookings_id_seq', 8, true);


--
-- TOC entry 3356 (class 0 OID 0)
-- Dependencies: 217
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.clients_id_seq', 3, true);


--
-- TOC entry 3357 (class 0 OID 0)
-- Dependencies: 215
-- Name: rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.rooms_id_seq', 6, true);


--
-- TOC entry 3195 (class 2606 OID 16425)
-- Name: bookings bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (id);


--
-- TOC entry 3193 (class 2606 OID 16416)
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- TOC entry 3191 (class 2606 OID 16409)
-- Name: rooms rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- TOC entry 3196 (class 2606 OID 16426)
-- Name: bookings bookings_clientId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT "bookings_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES public.clients(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3197 (class 2606 OID 16431)
-- Name: bookings bookings_roomId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT "bookings_roomId_fkey" FOREIGN KEY ("roomId") REFERENCES public.rooms(id) ON UPDATE CASCADE ON DELETE SET NULL;


-- Completed on 2023-05-30 14:56:14

--
-- PostgreSQL database dump complete
--

