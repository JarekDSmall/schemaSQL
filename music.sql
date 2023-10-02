-- from the terminal run:
-- psql < music.sql

-- Drop the existing database and recreate it
DROP DATABASE IF EXISTS music;
CREATE DATABASE music;
\c music

-- Create tables for songs, artists, producers, and their relationships
CREATE TABLE Songs (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL
);

CREATE TABLE Artists (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE Producers (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE Albums (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL

)

CREATE TABLE SongArtists (
  song_id INT REFERENCES Songs(id),
  artist_id INT REFERENCES Artists(id),
  PRIMARY KEY (song_id, artist_id)
);

CREATE TABLE SongProducers (
  song_id INT REFERENCES Songs(id),
  producer_id INT REFERENCES Producers(id),
  PRIMARY KEY (song_id, producer_id)
);

CREATE TABLE SongAlbums (
  song_id INT REFERENCES Songs(id),
  album_id INT REFERENCES Albums(id),
  PRIMARY KEY (song_id, album_id)
);

-- Insert data into Songs table
INSERT INTO Songs (title, duration_in_seconds, release_date, album)
VALUES
  ('MMMBop', 238, '1997-04-15', 'Middle of Nowhere'),
  ('Bohemian Rhapsody', 355, '1975-10-31', 'A Night at the Opera'),
  ('One Sweet Day', 282, '1995-11-14', 'Daydream'),
  ('Shallow', 216, '2018-09-27', 'A Star Is Born'),
  ('How You Remind Me', 223, '2001-08-21', 'Silver Side Up'),
  ('New York State of Mind', 276, '2009-10-20', 'The Blueprint 3'),
  ('Dark Horse', 215, '2013-12-17', 'Prism'),
  ('Moves Like Jagger', 201, '2011-06-21', 'Hands All Over'),
  ('Complicated', 244, '2002-05-14', 'Let Go'),
  ('Say My Name', 240, '1999-11-07', 'The Writing''s on the Wall');

-- Insert data into Artists table
INSERT INTO Artists (name)
VALUES
  ('Hanson'),
  ('Queen'),
  ('Mariah Carey'),
  ('Boyz II Men'),
  ('Lady Gaga'),
  ('Bradley Cooper'),
  ('Nickelback'),
  ('Jay Z'),
  ('Alicia Keys'),
  ('Katy Perry'),
  ('Juicy J'),
  ('Maroon 5'),
  ('Christina Aguilera'),
  ('Avril Lavigne'),
  ('Destiny''s Child');

-- Insert data into Producers table
INSERT INTO Producers (name)
VALUES
  ('Dust Brothers'),
  ('Stephen Lironi'),
  ('Roy Thomas Baker'),
  ('Walter Afanasieff'),
  ('Benjamin Rice'),
  ('Rick Parashar'),
  ('Al Shux'),
  ('Max Martin'),
  ('Cirkut'),
  ('Shellback'),
  ('Benny Blanco'),
  ('The Matrix'),
  ('Darkchild');

-- Insert data into SongArtists table
INSERT INTO SongArtists (song_id, artist_id)
VALUES
  (1, 1), (2, 2), (3, 3), (3, 4), (4, 5),
  (4, 6), (5, 7), (6, 8), (6, 9), (7, 10),
  (7, 11), (8, 12), (8, 13), (9, 14), (10, 15);

-- Insert data into SongProducers table
INSERT INTO SongProducers (song_id, producer_id)
VALUES
  (1, 1), (1, 2), (2, 3), (3, 4), (3, 5),
  (4, 6), (5, 7), (6, 8), (7, 9), (8, 10),
  (9, 11), (10, 12), (10, 13), (10, 14), (10, 15);
