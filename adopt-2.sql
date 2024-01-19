--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9 (Ubuntu 14.9-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.9 (Ubuntu 14.9-0ubuntu0.22.04.1)

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
-- Name: pets; Type: TABLE; Schema: public; Owner: kushnier
--

CREATE TABLE public.pets (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    species character varying(50) NOT NULL,
    photo_url character varying(100),
    age integer,
    notes text,
    available boolean
);


ALTER TABLE public.pets OWNER TO kushnier;

--
-- Name: pets_id_seq; Type: SEQUENCE; Schema: public; Owner: kushnier
--

CREATE SEQUENCE public.pets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pets_id_seq OWNER TO kushnier;

--
-- Name: pets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kushnier
--

ALTER SEQUENCE public.pets_id_seq OWNED BY public.pets.id;


--
-- Name: pets id; Type: DEFAULT; Schema: public; Owner: kushnier
--

ALTER TABLE ONLY public.pets ALTER COLUMN id SET DEFAULT nextval('public.pets_id_seq'::regclass);


--
-- Data for Name: pets; Type: TABLE DATA; Schema: public; Owner: kushnier
--

COPY public.pets (id, name, species, photo_url, age, notes, available) FROM stdin;
4	Frisky	cat	images\\cat.jpg	5	\N	t
5	Growl	dog	images\\dog.jpg	2	\N	t
6	Kitty	wolf	images\\wolf.jpg	3	\N	t
7	Meow	cat	images/cat.jpg	6	\N	f
9	Alice	chicken	images/pet.png	2	has one bruised wing	t
12	Tweety	dog	images/pet.png	4	actually is a bird	t
13	Clueless	cat	images/pet.png	3	the dumbest cat Ive ever seen	f
14	Rover	dog	https://www.cdc.gov/healthypets/images/pets/cute-dog-headshot.jpg?_=42445	3	answer to "Hey Stupid!"	t
\.


--
-- Name: pets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kushnier
--

SELECT pg_catalog.setval('public.pets_id_seq', 14, true);


--
-- Name: pets pets_pkey; Type: CONSTRAINT; Schema: public; Owner: kushnier
--

ALTER TABLE ONLY public.pets
    ADD CONSTRAINT pets_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

