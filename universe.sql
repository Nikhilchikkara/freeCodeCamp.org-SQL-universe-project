--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance integer NOT NULL,
    diameter numeric(5,2),
    age integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter numeric(5,2) NOT NULL,
    color character varying(30),
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter numeric(5,2) NOT NULL,
    age integer,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_description; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_description (
    planet_description_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean,
    has_moon boolean NOT NULL,
    revolution_time integer,
    color character varying(30),
    anything_specific text
);


ALTER TABLE public.planet_description OWNER TO freecodecamp;

--
-- Name: planet_description_planet_description_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_description_planet_description_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_description_planet_description_id_seq OWNER TO freecodecamp;

--
-- Name: planet_description_planet_description_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_description_planet_description_id_seq OWNED BY public.planet_description.planet_description_id;


--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age integer,
    diameter numeric(5,2) NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_description planet_description_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_description ALTER COLUMN planet_description_id SET DEFAULT nextval('public.planet_description_planet_description_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 2500, 220.00, 25000);
INSERT INTO public.galaxy VALUES (2, 'Cigar', 11500, 37.00, 12000);
INSERT INTO public.galaxy VALUES (3, 'Pinwheel', 20870, 170.00, 13400);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 29350, 500.00, 12340);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 30000, 600.00, 34201);
INSERT INTO public.galaxy VALUES (6, 'Milky Way', 0, 100.00, 23471);
INSERT INTO public.galaxy VALUES (7, 'LMC', 158, 140.00, 23194);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 384.00, 'White', 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 940.00, 'Red', 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 235.00, 'White', 4);
INSERT INTO public.moon VALUES (4, 'Amalthea', 181.00, 'Greywhite', 4);
INSERT INTO public.moon VALUES (5, 'Thebe', 222.00, 'Light Orange', 4);
INSERT INTO public.moon VALUES (6, 'lo', 422.00, 'Green', 4);
INSERT INTO public.moon VALUES (7, 'Europa', 671.00, 'Light Red', 5);
INSERT INTO public.moon VALUES (8, 'Ganymede', 107.00, 'Light Green', 5);
INSERT INTO public.moon VALUES (9, 'Callisto', 188.30, 'Light orange', 5);
INSERT INTO public.moon VALUES (10, 'Himalia', 114.60, 'Dark Pink', 5);
INSERT INTO public.moon VALUES (11, 'Pan', 133.60, 'Yellow', 5);
INSERT INTO public.moon VALUES (12, 'Atlas', 137.70, 'Red', 5);
INSERT INTO public.moon VALUES (13, 'Prometheus', 139.40, 'White', 5);
INSERT INTO public.moon VALUES (14, 'Pandora', 141.70, 'Blue', 5);
INSERT INTO public.moon VALUES (15, 'Janus', 151.40, 'Pink', 5);
INSERT INTO public.moon VALUES (16, 'Epimetheus', 151.40, 'Pink', 5);
INSERT INTO public.moon VALUES (17, 'Mimas', 186.00, 'Dark Blue', 5);
INSERT INTO public.moon VALUES (18, 'Enceladus', 238.00, 'Grey', 6);
INSERT INTO public.moon VALUES (19, 'Tethys', 295.44, 'Dark Yellow', 6);
INSERT INTO public.moon VALUES (20, 'Dione', 377.92, 'Light Red', 6);
INSERT INTO public.moon VALUES (21, 'Rhea', 527.09, 'Ghost White', 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 213.23, 13, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 241.21, 14, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 650.00, 15, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 700.23, 15, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 750.35, 23, 1);
INSERT INTO public.planet VALUES (6, 'Sirius', 810.23, 20, 2);
INSERT INTO public.planet VALUES (7, 'Pollus', 823.45, 22, 3);
INSERT INTO public.planet VALUES (8, 'Arcturus', 824.00, 14, 3);
INSERT INTO public.planet VALUES (9, 'Aldebaran', 830.45, 10, 2);
INSERT INTO public.planet VALUES (10, 'Rigel', 834.24, 25, 4);
INSERT INTO public.planet VALUES (11, 'Antares', 734.12, 20, 3);
INSERT INTO public.planet VALUES (12, 'Betelgeuse', 872.12, 23, 2);
INSERT INTO public.planet VALUES (13, 'NML Cygni', 700.23, 25, 3);
INSERT INTO public.planet VALUES (14, 'VY Canis Majoris', 900.34, 24, 2);


--
-- Data for Name: planet_description; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_description VALUES (1, 'Mercury', false, false, 1, 'Orange', 'Nothing');
INSERT INTO public.planet_description VALUES (2, 'Venus', false, false, 1, 'Red', 'Rotate Clockwise');
INSERT INTO public.planet_description VALUES (3, 'Earth', true, true, 1, 'Blue', 'Nothing');
INSERT INTO public.planet_description VALUES (4, 'Mars', false, true, 2, 'Red', 'Nothing');
INSERT INTO public.planet_description VALUES (5, 'Jupiter', false, true, 3, 'Grey', 'Has rings around it');
INSERT INTO public.planet_description VALUES (6, 'Sirius', false, true, 4, 'Dark Pink', 'outermost edges');
INSERT INTO public.planet_description VALUES (7, 'Pollus', false, true, 3, 'Dark Blue', 'Nothing');
INSERT INTO public.planet_description VALUES (8, 'Arcturus', false, true, 5, 'Dark Green', 'Nothing');
INSERT INTO public.planet_description VALUES (9, 'Aldebaran', false, true, 10, 'Light red', 'Rotate Clockwise');
INSERT INTO public.planet_description VALUES (10, 'Rigel', false, true, 15, 'White', 'Nothing');
INSERT INTO public.planet_description VALUES (11, 'Antares', false, false, 23, 'Grey', 'Nothing');
INSERT INTO public.planet_description VALUES (12, 'Betelgeuse', false, true, 12, 'Red', 'Nothing');
INSERT INTO public.planet_description VALUES (13, 'NML Cygni', false, false, 34, 'Blue', 'Rotate Clockwise');
INSERT INTO public.planet_description VALUES (14, 'VY Canis Majoris', false, true, 32, 'Green', 'Nothing');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'UY Scuti', 125, 142.00, 6);
INSERT INTO public.star VALUES (2, 'VY Canis Majoris', 342, 170.00, 6);
INSERT INTO public.star VALUES (3, 'RW Cephei', 412, 153.50, 6);
INSERT INTO public.star VALUES (4, 'V354 Cephei', 342, 152.00, 6);
INSERT INTO public.star VALUES (5, 'KY Cygni', 298, 285.00, 6);
INSERT INTO public.star VALUES (6, 'Mu Cephei', 762, 126.00, 6);
INSERT INTO public.star VALUES (7, 'Antares', 542, 883.00, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_description_planet_description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_description_planet_description_id_seq', 14, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet_description planet_description_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_description
    ADD CONSTRAINT planet_description_name_key UNIQUE (name);


--
-- Name: planet_description planet_description_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_description
    ADD CONSTRAINT planet_description_pkey PRIMARY KEY (planet_description_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

