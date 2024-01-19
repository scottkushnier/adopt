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
    photo_url text,
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
2	Kitty	dog	images/wolf.jpg	4	friendly!!	t
3	Rover	dog	images/dog.jpg	3	answers to "Hey Stupid!"	t
5	Clueless	cat	images/cat.jpg	1	about the dumbest cat I've ever seen	f
4	Piney	porcupine	https://www.shutterstock.com/image-vector/porcupine-illustration-drawing-engraving-ink-260nw-1522584383.jpg	8	loves to snuggle!	f
1	Tweety	dog	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQV3WNSxxbIPzM2bVgcuIhrzulXoENVN2oVDg&usqp=CAU	2	tastes like chicken!	t
6	Lucky	dog	images/pet.png	9	missing right front foot and one ear	t
\.


--
-- Name: pets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kushnier
--

SELECT pg_catalog.setval('public.pets_id_seq', 6, true);


--
-- Name: pets pets_pkey; Type: CONSTRAINT; Schema: public; Owner: kushnier
--

ALTER TABLE ONLY public.pets
    ADD CONSTRAINT pets_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

