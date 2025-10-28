-- DATABASE: universe

-- Table: galaxy
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    galaxy_type TEXT NOT NULL,
    distance_from_earth NUMERIC NOT NULL,
    description TEXT
);

-- Table: star
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    galaxy_id INT REFERENCES galaxy(galaxy_id),
    star_type TEXT NOT NULL,
    age_in_millions_of_years INT NOT NULL
);

-- Table: planet
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    star_id INT REFERENCES star(star_id),
    has_life BOOLEAN NOT NULL,
    planet_type TEXT NOT NULL,
    number_of_moons INT NOT NULL
);

-- Table: moon
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    planet_id INT REFERENCES planet(planet_id),
    radius INT NOT NULL,
    distance_from_planet NUMERIC NOT NULL,
    has_water BOOLEAN NOT NULL
);

-- Table: comet
CREATE TABLE comet (
    comet_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    mass NUMERIC NOT NULL,
    radius NUMERIC NOT NULL,
    is_visible BOOLEAN NOT NULL,
    orbital_period INT NOT NULL,
    comet_code VARCHAR(10) UNIQUE NOT NULL
);

-- INSERT sample data

-- Galaxies
INSERT INTO galaxy (name, galaxy_type, distance_from_earth, description)
VALUES
('Milky Way', 'Spiral', 0, 'Our home galaxy'),
('Andromeda', 'Spiral', 2537000, 'Nearest spiral galaxy'),
('Triangulum', 'Spiral', 3000000, 'Small spiral galaxy'),
('Messier 81', 'Spiral', 12000000, 'Bode''s Galaxy'),
('Sombrero', 'Elliptical', 29000000, 'Sombrero Galaxy'),
('Whirlpool', 'Spiral', 23000000, 'Whirlpool Galaxy');

-- Stars
INSERT INTO star (name, galaxy_id, star_type, age_in_millions_of_years)
VALUES
('Sun', 1, 'G-type', 4600),
('Proxima Centauri', 1, 'M-type', 4500),
('Sirius', 1, 'A-type', 242),
('Betelgeuse', 1, 'M-type', 10000),
('Rigel', 1, 'B-type', 8000),
('Vega', 1, 'A-type', 455);

-- Planets
INSERT INTO planet (name, star_id, has_life, planet_type, number_of_moons)
VALUES
('Earth', 1, TRUE, 'Terrestrial', 1),
('Mars', 1, FALSE, 'Terrestrial', 2),
('Venus', 1, FALSE, 'Terrestrial', 0),
('Mercury', 1, FALSE, 'Terrestrial', 0),
('Jupiter', 1, FALSE, 'Gas Giant', 79),
('Saturn', 1, FALSE, 'Gas Giant', 82),
('Uranus', 1, FALSE, 'Ice Giant', 27),
('Neptune', 1, FALSE, 'Ice Giant', 14),
('Kepler-22b', 2, FALSE, 'Exoplanet', 0),
('Proxima b', 2, FALSE, 'Exoplanet', 0),
('HD 209458 b', 3, FALSE, 'Exoplanet', 0),
('51 Pegasi b', 3, FALSE, 'Exoplanet', 0);

-- Moons
INSERT INTO moon (name, planet_id, radius, distance_from_planet, has_water)
VALUES
('Moon', 1, 1737, 384400, TRUE),
('Phobos', 2, 11, 9377, FALSE),
('Deimos', 2, 6, 23460, FALSE),
('Io', 5, 1821, 421700, FALSE),
('Europa', 5, 1560, 671000, TRUE),
('Ganymede', 5, 2634, 1070000, TRUE),
('Callisto', 5, 2410, 1882700, TRUE),
('Titan', 6, 2575, 1221870, TRUE),
('Rhea', 6, 763, 527040, FALSE),
('Iapetus', 6, 734, 3560800, FALSE),
('Oberon', 7, 761, 583520, FALSE),
('Titania', 7, 788, 436000, FALSE),
('Umbriel', 7, 584, 266000, FALSE),
('Miranda', 7, 235, 129900, FALSE),
('Triton', 8, 1353, 354800, FALSE),
('Nereid', 8, 170, 5514000, FALSE),
('Charon', 9, 606, 19571, FALSE),
('Hydra', 9, 50, 64738, FALSE),
('Nix', 9, 49, 48694, FALSE),
('Kerberos', 9, 12, 57906, FALSE);

-- Comets
INSERT INTO comet (name, mass, radius, is_visible, orbital_period, comet_code)
VALUES
('Halley', 2.2e14, 11, TRUE, 75, 'CM001'),
('Encke', 3.0e13, 5, TRUE, 3, 'CM002'),
('Hale-Bopp', 4.2e14, 30, TRUE, 253, 'CM003');
