-- from the terminal run:
-- psql < outer_space.sql

-- Drop the existing database and recreate it
DROP DATABASE IF EXISTS outer_space;
CREATE DATABASE outer_space;
\c outer_space

-- Create tables for galaxies, objects, moons, and planets
CREATE TABLE Galaxies (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE Objects (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  galaxy_id INT REFERENCES Galaxies(id)
);

CREATE TABLE Moons (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
  planet_id INT REFERENCES Planets(id) 
);

CREATE TABLE Planets (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  object_id INT REFERENCES Objects(id),
  galaxy_id INT REFERENCES Galaxies(id)
);

-- Insert data into Galaxies table
INSERT INTO Galaxies (name)
VALUES
  ('Milky Way');

-- Insert data into Objects table
INSERT INTO Objects (name, galaxy_id)
VALUES
  ('The Sun', 1),
  ('Proxima Centauri', 1),
  ('Gliese 876', 1);

-- Insert data into Moons table
INSERT INTO Moons (name)
VALUES
  ('The Moon'),
  ('Phobos'),
  ('Deimos'),
  ('Naiad'),
  ('Thalassa'),
  ('Despina'),
  ('Galatea'),
  ('Larissa'),
  ('S/2004 N 1'),
  ('Proteus'),
  ('Triton'),
  ('Nereid'),
  ('Halimede'),
  ('Sao'),
  ('Laomedeia'),
  ('Psamathe'),
  ('Neso');

-- Insert data into Planets table
INSERT INTO Planets (name, orbital_period_in_years, object_id, galaxy_id)
VALUES
  ('Earth', 1.00, 1, 1),
  ('Mars', 1.88, 1, 1),
  ('Venus', 0.62, 1, 1),
  ('Neptune', 164.8, 1, 1),
  ('Proxima Centauri b', 0.03, 2, 1),
  ('Gliese 876 b', 0.23, 3, 1);
