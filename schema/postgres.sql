DROP DATABASE IF EXISTS viewed;
DROP TABLE IF EXISTS cuisines;
DROP TABLE IF EXISTS restaurants;
DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS images;

CREATE DATABASE viewed;

\c viewed;

CREATE TABLE IF NOT EXISTS cuisines (
  cuisine_id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS restaurants (
  restaurant_id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  rating SMALLINT NOT NULL,
  number_of_reviews SMALLINT NOT NULL,
  how_pricey SMALLINT NOT NULL,
  cuisine_id INTEGER NOT NULL,
  display_img_url TEXT NOT NULL,
  heart boolean NOT NULL,
  super_rated boolean NOT NULL,
  FOREIGN KEY (cuisine_id) REFERENCES cuisines(id)
);

CREATE TABLE IF NOT EXISTS reviews (
  review_id SERIAL PRIMARY KEY,
  avatar_url TEXT NOT NULL,
  name varchar(50) NOT NULL,
  date varchar(20) NOT NULL,
  review varchar(250) NOT NULL,
  rating SMALLINT NOT NULL,
  restaurant_id INTEGER NOT NULL,
  FOREIGN KEY (restaurant_id) REFERENCES restaurants(id)
);

CREATE TABLE IF NOT EXISTS images (
  image_id SERIAL PRIMARY KEY,
  img_url TEXT NOT NULL,
  restaurant_id INTEGER NOT NULL,
  FOREIGN KEY (restaurant_id) REFERENCES restaurants(id)
);