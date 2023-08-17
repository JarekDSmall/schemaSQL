-- Create Teams table
CREATE TABLE Teams (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  city TEXT,
  country TEXT
);

-- Create Players table
CREATE TABLE Players (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  team_id INT REFERENCES Teams(id),
  date_of_birth DATE,
  nationality TEXT
);

-- Create Matches table
CREATE TABLE Matches (
  id SERIAL PRIMARY KEY,
  home_team_id INT REFERENCES Teams(id),
  away_team_id INT REFERENCES Teams(id),
  start_date TIMESTAMP NOT NULL,
  end_date TIMESTAMP
);

-- Create Goals table
CREATE TABLE Goals (
  id SERIAL PRIMARY KEY,
  match_id INT REFERENCES Matches(id),
  player_id INT REFERENCES Players(id),
  minute_scored INT,
  is_penalty BOOLEAN,
  is_own_goal BOOLEAN
);

-- Create Referees table
CREATE TABLE Referees (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

-- Create MatchReferees table
CREATE TABLE MatchReferees (
  match_id INT REFERENCES Matches(id),
  referee_id INT REFERENCES Referees(id),
  PRIMARY KEY (match_id, referee_id)
);

-- Create Seasons table
CREATE TABLE Seasons (
  id SERIAL PRIMARY KEY,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL
);