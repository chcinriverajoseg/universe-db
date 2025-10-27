--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: celestial_bodies; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestial_bodies (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    type character varying(50) NOT NULL,
    mass real,
    radius real,
    distance real
);


ALTER TABLE public.celestial_bodies OWNER TO freecodecamp;

--
-- Name: celestial_bodies_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.celestial_bodies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestial_bodies_id_seq OWNER TO freecodecamp;

--
-- Name: celestial_bodies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.celestial_bodies_id_seq OWNED BY public.celestial_bodies.id;


--
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    mass numeric,
    radius numeric,
    is_visible boolean,
    orbital_period integer
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_type character varying(50),
    age_in_millions numeric NOT NULL,
    has_black_hole boolean NOT NULL,
    description text
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
    name character varying(50) NOT NULL,
    planet_id integer,
    radius numeric NOT NULL,
    orbital_distance integer NOT NULL,
    rotation_period integer NOT NULL,
    has_water boolean NOT NULL,
    is_habitable boolean NOT NULL,
    description text
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
    name character varying(50) NOT NULL,
    star_id integer,
    mass numeric NOT NULL,
    radius numeric NOT NULL,
    orbital_period integer NOT NULL,
    moons_count integer NOT NULL,
    has_rings boolean NOT NULL,
    description text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

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
    name character varying(50) NOT NULL,
    galaxy_id integer,
    mass numeric NOT NULL,
    radius numeric NOT NULL,
    is_supernova boolean NOT NULL,
    description text
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
-- Name: celestial_bodies id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_bodies ALTER COLUMN id SET DEFAULT nextval('public.celestial_bodies_id_seq'::regclass);


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: celestial_bodies; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestial_bodies VALUES (1, 'Mercury', 'Planet', 0.33, 2439.7, 57.9);
INSERT INTO public.celestial_bodies VALUES (2, 'Venus', 'Planet', 4.87, 6051.8, 108.2);
INSERT INTO public.celestial_bodies VALUES (3, 'Earth', 'Planet', 5.97, 6371, 149.6);
INSERT INTO public.celestial_bodies VALUES (4, 'Mars', 'Planet', 0.642, 3389.5, 227.9);
INSERT INTO public.celestial_bodies VALUES (5, 'Jupiter', 'Planet', 1898, 69911, 778.6);
INSERT INTO public.celestial_bodies VALUES (6, 'Saturn', 'Planet', 568, 58232, 1433.5);
INSERT INTO public.celestial_bodies VALUES (7, 'Uranus', 'Planet', 86.8, 25362, 2872.5);
INSERT INTO public.celestial_bodies VALUES (8, 'Neptune', 'Planet', 102, 24622, 4495.1);
INSERT INTO public.celestial_bodies VALUES (9, 'Sun', 'Star', 1.989e+06, 696340, 0);
INSERT INTO public.celestial_bodies VALUES (10, 'Mercury', 'Planet', 0.33, 2439.7, 57.9);
INSERT INTO public.celestial_bodies VALUES (11, 'Venus', 'Planet', 4.87, 6051.8, 108.2);
INSERT INTO public.celestial_bodies VALUES (12, 'Earth', 'Planet', 5.97, 6371, 149.6);
INSERT INTO public.celestial_bodies VALUES (13, 'Mars', 'Planet', 0.642, 3389.5, 227.9);
INSERT INTO public.celestial_bodies VALUES (14, 'Jupiter', 'Planet', 1898, 69911, 778.6);
INSERT INTO public.celestial_bodies VALUES (15, 'Saturn', 'Planet', 568, 58232, 1433.5);
INSERT INTO public.celestial_bodies VALUES (16, 'Uranus', 'Planet', 86.8, 25362, 2872.5);
INSERT INTO public.celestial_bodies VALUES (17, 'Neptune', 'Planet', 102, 24622, 4495.1);
INSERT INTO public.celestial_bodies VALUES (18, 'Pluto', 'Dwarf Planet', 0.0146, 1188.3, 5906.4);
INSERT INTO public.celestial_bodies VALUES (19, 'Sun', 'Star', 1.989e+06, 696340, 0);
INSERT INTO public.celestial_bodies VALUES (20, 'Alpha Centauri A', 'Star', 1.1e+06, 834840, 4.37);
INSERT INTO public.celestial_bodies VALUES (21, 'Alpha Centauri B', 'Star', 907000, 602680, 4.37);
INSERT INTO public.celestial_bodies VALUES (22, 'Proxima Centauri', 'Star', 123000, 96300, 4.24);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 220000000000000, 11, true, 75);
INSERT INTO public.comet VALUES (2, 'Encke', 30000000000000, 5, true, 3);
INSERT INTO public.comet VALUES (3, 'Hale-Bopp', 420000000000000, 30, true, 253);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13600, true, 'Our galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10000, true, 'Closest large galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 12000, false, 'Small galaxy');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 8000, true, 'Famous spiral galaxy');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', 9000, true, 'Bright bulge galaxy');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Spiral', 13000, false, 'Large spiral galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 1737.1, 384400, 27, true, false, 'Earth satellite');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11.1, 9376, 0, false, false, 'Mars moon');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6.2, 23458, 1, false, false, 'Mars moon');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 0.330, 2439.7, 88, 0, false, 'Closest to Sun');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 4.87, 6051.8, 225, 0, false, 'Second planet');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 5.97, 6371, 365, 1, false, 'Our planet');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 0.642, 3389.5, 687, 2, false, 'Red planet');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 1898, 69911, 4333, 79, true, 'Gas giant');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 568, 58232, 10759, 82, true, 'Has rings');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 86.8, 25362, 30687, 27, true, 'Ice giant');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 102, 24622, 60190, 14, true, 'Farthest planet');
INSERT INTO public.planet VALUES (9, 'Alpha b', 2, 1.2, 5000, 400, 0, false, 'Exoplanet');
INSERT INTO public.planet VALUES (10, 'Beta b', 2, 2.4, 6000, 500, 1, false, 'Exoplanet');
INSERT INTO public.planet VALUES (11, 'Gamma b', 2, 0.8, 4000, 300, 1, false, 'Exoplanet');
INSERT INTO public.planet VALUES (12, 'Delta b', 2, 1.5, 4500, 350, 0, false, 'Exoplanet');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.0, 696340, false, 'Our star');
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 2, 1.1, 834840, false, 'Closest star system');
INSERT INTO public.star VALUES (3, 'Alpha Centauri B', 2, 0.91, 600000, false, 'Closest star system');
INSERT INTO public.star VALUES (4, 'Sirius', 3, 2.02, 1189640, false, 'Brightest star');
INSERT INTO public.star VALUES (5, 'Betelgeuse', 4, 11.6, 6171000, false, 'Red supergiant');
INSERT INTO public.star VALUES (6, 'Rigel', 4, 18.0, 7810000, false, 'Blue supergiant');


--
-- Name: celestial_bodies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.celestial_bodies_id_seq', 22, true);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: celestial_bodies celestial_bodies_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_bodies
    ADD CONSTRAINT celestial_bodies_pkey PRIMARY KEY (id);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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

    -- Table: galaxy
CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  galaxy_type TEXT,
  distance_from_earth NUMERIC,
  description TEXT
);

-- Table: star
CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  galaxy_id INT REFERENCES galaxy(galaxy_id),
  star_type TEXT,
  age_in_millions_of_years INT
);

-- Table: planet
CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  star_id INT REFERENCES star(star_id),
  has_life BOOLEAN,
  planet_type TEXT,
  number_of_moons INT
);

-- Table: moon
CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  planet_id INT REFERENCES planet(planet_id),
  radius INT,
  is_spherical BOOLEAN
);

-- Datos de ejemplo
INSERT INTO galaxy (name, galaxy_type, distance_from_earth, description)
VALUES
('Milky Way', 'Spiral', 0, 'Our home galaxy'),
('Andromeda', 'Spiral', 2537000, 'Nearest spiral galaxy');

INSERT INTO star (name, galaxy_id, star_type, age_in_millions_of_years)
VALUES
('Sun', 1, 'G-type', 4600),
('Proxima Centauri', 1, 'M-type', 4500);

INSERT INTO planet (name, star_id, has_life, planet_type, number_of_moons)
VALUES
('Earth', 1, TRUE, 'Terrestrial', 1),
('Mars', 1, FALSE, 'Terrestrial', 2);

INSERT INTO moon (name, planet_id, radius, is_spherical)
VALUES
('Moon', 1, 1737, TRUE),
('Phobos', 2, 11, FALSE),
('Deimos', 2, 6, FALSE);

