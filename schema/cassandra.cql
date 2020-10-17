DROP KEYSPACE IF EXISTS viewed;

CREATE KEYSPACE viewed WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };

USE viewed;

// one cuisine to many restaurants
CREATE TABLE restaurants_to_cuisine (
  restaurant_id int,
  name varchar,
  cuisine varchar,
  rating smallint,
  number_of_reviews smallint,
  how_pricey smallint,
  cuisine_name text,
  display_img_url text,
  heart boolean,
  super_rated boolean,
  PRIMARY KEY (cuisine_name, restaurant_id)
);

// one restaurant to many reviews
CREATE TABLE reviews_to_restaurants (
  restaurant_id int,
  review_id int,
  avatar_url text,
  name varchar,
  date varchar,
  review text,
  rating smallint,
  restaurant_id int,
  PRIMARY KEY (restaurant_id, review_id)
);

// one restaurant to many images
CREATE TABLE images_to_restaurants (
  restaurant_id int,
  image_id int,
  img_url text,
  PRIMARY KEY (restaurant_id, image_id)
);