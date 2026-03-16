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
-- Name: atmosphere; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.atmosphere (
    atmosphere_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    composition text,
    pressure_pa numeric(12,2),
    surface_temp_min integer,
    surface_temp_max integer
);


ALTER TABLE public.atmosphere OWNER TO freecodecamp;

--
-- Name: atmosphere_atmosphere_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.atmosphere_atmosphere_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.atmosphere_atmosphere_id_seq OWNER TO freecodecamp;

--
-- Name: atmosphere_atmosphere_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.atmosphere_atmosphere_id_seq OWNED BY public.atmosphere.atmosphere_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    distance_from_earth numeric(15,2),
    age_in_millions_of_years integer NOT NULL
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
    name character varying(100) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    planet_id integer NOT NULL,
    age_in_millions_of_years integer NOT NULL
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
    name character varying(100) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    star_id integer NOT NULL,
    diameter_km numeric(12,2) NOT NULL,
    age_in_millions_of_years integer NOT NULL
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
    description text,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    temperature_kelvin integer NOT NULL,
    age_in_millions_of_years integer NOT NULL
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
-- Name: atmosphere atmosphere_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.atmosphere ALTER COLUMN atmosphere_id SET DEFAULT nextval('public.atmosphere_atmosphere_id_seq'::regclass);


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
-- Data for Name: atmosphere; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.atmosphere VALUES (1, 'Atmosphère terrestre', 3, '78% N2, 21% O2, 1% autres gaz', 101325.00, -88, 58);
INSERT INTO public.atmosphere VALUES (2, 'Atmosphère martienne', 4, '95% CO2, 2% N2, 2% Ar', 636.00, -140, 30);
INSERT INTO public.atmosphere VALUES (3, 'Atmosphère vénusienne', 2, '96% CO2, 3% N2, traces de SO2', 9200000.00, 462, 462);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Voie Lactée', 'Galaxie spirale contenant notre système solaire', 0.00, 13600);
INSERT INTO public.galaxy VALUES (2, 'Andromède', 'Galaxie spirale la plus proche de la Voie Lactée', 2537000.00, 10000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Petite galaxie spirale du Groupe Local', 3000000.00, 7000);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 'Galaxie elliptique avec un noyau actif', 13000000.00, 12000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Galaxie spirale vue par la tranche', 29000000.00, 9000);
INSERT INTO public.galaxy VALUES (6, 'Grand Défi', 'Galaxie irrégulière du Groupe Local', 1600000.00, 8000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Lune', 'Satellite naturel de la Terre', false, 3, 4500);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Plus grand des deux satellites de Mars', false, 4, 4500);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Plus petit satellite de Mars', false, 4, 4500);
INSERT INTO public.moon VALUES (4, 'Io', 'Satellite volcaniquement actif de Jupiter', false, 5, 4500);
INSERT INTO public.moon VALUES (5, 'Europe', 'Satellite de Jupiter avec océan souterrain', false, 5, 4500);
INSERT INTO public.moon VALUES (6, 'Ganymède', 'Plus grand satellite du système solaire', false, 5, 4500);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Satellite de Jupiter très cratérisé', false, 5, 4500);
INSERT INTO public.moon VALUES (8, 'Titan', 'Satellite de Saturne avec atmosphère épaisse', false, 6, 4500);
INSERT INTO public.moon VALUES (9, 'Encelade', 'Satellite de Saturne avec geysers de glace', false, 6, 4500);
INSERT INTO public.moon VALUES (10, 'Mimas', 'Satellite de Saturne avec grand cratère', false, 6, 4500);
INSERT INTO public.moon VALUES (11, 'Téthys', 'Satellite de Saturne glacé', false, 6, 4500);
INSERT INTO public.moon VALUES (12, 'Dioné', 'Satellite de Saturne avec fractures', false, 6, 4500);
INSERT INTO public.moon VALUES (13, 'Rhéa', 'Second plus grand satellite de Saturne', false, 6, 4500);
INSERT INTO public.moon VALUES (14, 'Titania', 'Plus grand satellite d''Uranus', false, 7, 4500);
INSERT INTO public.moon VALUES (15, 'Ombriel', 'Satellite sombre d''Uranus', false, 7, 4500);
INSERT INTO public.moon VALUES (16, 'Ariel', 'Satellite d''Uranus avec canyons', false, 7, 4500);
INSERT INTO public.moon VALUES (17, 'Umbriel', 'Satellite d''Uranus très sombre', false, 7, 4500);
INSERT INTO public.moon VALUES (18, 'Miranda', 'Satellite d''Uranus aux formations géologiques uniques', false, 7, 4500);
INSERT INTO public.moon VALUES (19, 'Triton', 'Grand satellite de Neptune avec cryovolcans', false, 8, 4500);
INSERT INTO public.moon VALUES (20, 'Néréide', 'Satellite irrégulier de Neptune', false, 8, 4500);
INSERT INTO public.moon VALUES (21, 'Charon', 'Grand satellite de Pluton', false, 1, 4500);
INSERT INTO public.moon VALUES (22, 'Hydra', 'Petit satellite de Pluton', false, 1, 4500);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercure', 'Plus petite planète du système solaire', false, 1, 4879.40, 4500);
INSERT INTO public.planet VALUES (2, 'Vénus', 'Planète la plus chaude du système solaire', false, 1, 12104.00, 4500);
INSERT INTO public.planet VALUES (3, 'Terre', 'Notre planète, seule connue abritant la vie', true, 1, 12742.00, 4543);
INSERT INTO public.planet VALUES (4, 'Mars', 'Planète rouge avec des traces d''eau passée', false, 1, 6779.00, 4500);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Plus grande planète du système solaire', false, 1, 139820.00, 4500);
INSERT INTO public.planet VALUES (6, 'Saturne', 'Planète connue pour ses anneaux spectaculaires', false, 1, 116460.00, 4500);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Géante de glace avec rotation sur le côté', false, 1, 50724.00, 4500);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Planète la plus éloignée du Soleil', false, 1, 49244.00, 4500);
INSERT INTO public.planet VALUES (9, 'Kepler-186f', 'Exoplanète dans la zone habitable', false, 2, 12800.00, 4000);
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1e', 'Exoplanète rocheuse prometteuse', false, 3, 10500.00, 7600);
INSERT INTO public.planet VALUES (11, 'Proxima b', 'Exoplanète orbitant Proxima Centauri', false, 2, 12700.00, 4850);
INSERT INTO public.planet VALUES (12, '51 Pegasi b', 'Première exoplanète découverte autour d''une étoile similaire au Soleil', false, 3, 142000.00, 6000);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Étoile naine jaune de type spectral G2V', 'Soleil', 1, 5778, 4600);
INSERT INTO public.star VALUES (2, 'Naine rouge la plus proche du système solaire', 'Proxima Centauri', 1, 3042, 4850);
INSERT INTO public.star VALUES (3, 'Étoile la plus brillante du ciel nocturne', 'Sirius A', 1, 9940, 242);
INSERT INTO public.star VALUES (4, 'Supergéante rouge variable dans Orion', 'Bételgeuse', 1, 3500, 10);
INSERT INTO public.star VALUES (5, 'Étoile blanche de la constellation de la Lyre', 'Vega', 1, 9602, 455);
INSERT INTO public.star VALUES (6, 'Supergéante bleue dans la constellation d''Orion', 'Rigel', 1, 12100, 8);


--
-- Name: atmosphere_atmosphere_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.atmosphere_atmosphere_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: atmosphere atmosphere_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.atmosphere
    ADD CONSTRAINT atmosphere_name_key UNIQUE (name);


--
-- Name: atmosphere atmosphere_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.atmosphere
    ADD CONSTRAINT atmosphere_pkey PRIMARY KEY (atmosphere_id);


--
-- Name: atmosphere atmosphere_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.atmosphere
    ADD CONSTRAINT atmosphere_planet_id_key UNIQUE (planet_id);


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
-- Name: atmosphere fk_atmosphere_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.atmosphere
    ADD CONSTRAINT fk_atmosphere_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--
