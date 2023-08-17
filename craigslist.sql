-- Create Regions table
CREATE TABLE Regions (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

-- Create Users table
CREATE TABLE Users (
  id SERIAL PRIMARY KEY,
  username TEXT NOT NULL,
  email TEXT NOT NULL,
  preferred_region_id INT REFERENCES Regions(id)
);

-- Create Categories table
CREATE TABLE Categories (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

-- Create Posts table
CREATE TABLE Posts (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  text TEXT NOT NULL,
  user_id INT REFERENCES Users(id),
  location TEXT NOT NULL,
  region_id INT REFERENCES Regions(id),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create PostCategories table
CREATE TABLE PostCategories (
  post_id INT REFERENCES Posts(id),
  category_id INT REFERENCES Categories(id),
  PRIMARY KEY (post_id, category_id)
);