-- from the terminal run:
-- psql < air_traffic.sql

-- Drop the existing database and recreate it
DROP DATABASE IF EXISTS air_traffic;
CREATE DATABASE air_traffic;
\c air_traffic

-- Create tables for countries, cities, airlines, passengers, and tickets
CREATE TABLE Countries (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE Cities (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country_id INT REFERENCES Countries(id)
);

CREATE TABLE Airlines (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE Passengers (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE Tickets (
  id SERIAL PRIMARY KEY,
  passenger_id INT REFERENCES Passengers(id),
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INT REFERENCES Airlines(id),
  departure_city_id INT REFERENCES Cities(id),
  arrival_city_id INT REFERENCES Cities(id)
);

-- Insert data into Countries table
INSERT INTO Countries (name)
VALUES
  ('United States'),
  ('Japan'),
  ('United Kingdom'),
  ('France'),
  ('UAE'),
  ('China'),
  ('Brazil'),
  ('Chile');

-- Insert data into Cities table
INSERT INTO Cities (name, country_id)
VALUES
  ('Washington DC', 1),
  ('Tokyo', 2),
  ('London', 3),
  ('Los Angeles', 1),
  ('Seattle', 1),
  ('Paris', 4),
  ('Dubai', 5),
  ('New York', 1),
  ('Cedar Rapids', 1),
  ('Charlotte', 1),
  ('Sao Paolo', 7),
  ('Santiago', 8);

-- Insert data into Airlines table
INSERT INTO Airlines (name)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('Avianca Brasil'),
  ('American Airlines');

-- Insert data into Passengers table
INSERT INTO Passengers (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes');

-- Insert data into Tickets table
INSERT INTO Tickets (passenger_id, seat, departure, arrival, airline_id, departure_city_id, arrival_city_id)
VALUES
  (1, '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 5),
  (2, '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 2, 3),
  -- ... (Insert data for other tickets)
  (7, '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 8, 10),
  (8, '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 7, 9, 11),
  -- ... (Insert data for other tickets)
  (13, '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 6, 12, 13);
