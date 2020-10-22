\c template1
DROP DATABASE IF EXISTS viewed;
CREATE DATABASE viewed;

\c viewed;

CREATE TABLE IF NOT EXISTS cuisines (
  cuisine_id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS restaurants (
  restaurant_id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  rating REAL NOT NULL,
  number_of_reviews SMALLINT NOT NULL,
  how_pricey SMALLINT NOT NULL,
  cuisine_id INTEGER NOT NULL,
  display_img_url varchar(70) NOT NULL,
  heart boolean NOT NULL,
  super_rated boolean NOT NULL,
  FOREIGN KEY (cuisine_id) REFERENCES cuisines(cuisine_id)
);

CREATE TABLE IF NOT EXISTS reviews (
  review_id SERIAL PRIMARY KEY,
  avatar_url varchar(70) NOT NULL,
  name varchar(50) NOT NULL,
  date varchar(20) NOT NULL,
  review varchar(600) NOT NULL,
  rating REAL NOT NULL,
  restaurant_id INTEGER NOT NULL,
  FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);

CREATE TABLE IF NOT EXISTS images (
  image_id SERIAL PRIMARY KEY,
  img_url varchar(70) NOT NULL,
  restaurant_id INTEGER NOT NULL,
  FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);

\copy cuisines FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/postgres/csv/cuisineTable.csv' DELIMITER ',' CSV HEADER;

\copy restaurants FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/postgres/csv/restaurantTable1.csv' DELIMITER ',' CSV HEADER;

\copy restaurants FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/postgres/csv/restaurantTable2.csv' DELIMITER ',' CSV HEADER;

\copy restaurants FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/postgres/csv/restaurantTable3.csv' DELIMITER ',' CSV HEADER;

\copy restaurants FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/postgres/csv/restaurantTable4.csv' DELIMITER ',' CSV HEADER;

\copy restaurants FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/postgres/csv/restaurantTable5.csv' DELIMITER ',' CSV HEADER;

\copy restaurants FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/postgres/csv/restaurantTable6.csv' DELIMITER ',' CSV HEADER;

\copy restaurants FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/postgres/csv/restaurantTable7.csv' DELIMITER ',' CSV HEADER;

\copy restaurants FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/postgres/csv/restaurantTable8.csv' DELIMITER ',' CSV HEADER;

\copy restaurants FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/postgres/csv/restaurantTable9.csv' DELIMITER ',' CSV HEADER;

\copy restaurants FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/postgres/csv/restaurantTable10.csv' DELIMITER ',' CSV HEADER;

\copy reviews FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/postgres/csv/reviewTable1.csv' DELIMITER ',' CSV HEADER;

\copy reviews FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/postgres/csv/reviewTable2.csv' DELIMITER ',' CSV HEADER;

\copy reviews FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/postgres/csv/reviewTable3.csv' DELIMITER ',' CSV HEADER;

\copy reviews FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/postgres/csv/reviewTable4.csv' DELIMITER ',' CSV HEADER;

\copy reviews FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/postgres/csv/reviewTable5.csv' DELIMITER ',' CSV HEADER;

\copy reviews FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/postgres/csv/reviewTable6.csv' DELIMITER ',' CSV HEADER;

\copy reviews FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/postgres/csv/reviewTable7.csv' DELIMITER ',' CSV HEADER;

\copy reviews FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/postgres/csv/reviewTable8.csv' DELIMITER ',' CSV HEADER;

\copy reviews FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/postgres/csv/reviewTable9.csv' DELIMITER ',' CSV HEADER;

\copy reviews FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/postgres/csv/reviewTable10.csv' DELIMITER ',' CSV HEADER;

\copy reviews FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/postgres/csv/reviewTable11.csv' DELIMITER ',' CSV HEADER;

\copy reviews FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/postgres/csv/reviewTable12.csv' DELIMITER ',' CSV HEADER;

\copy reviews FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/postgres/csv/reviewTable13.csv' DELIMITER ',' CSV HEADER;

\copy reviews FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/postgres/csv/reviewTable14.csv' DELIMITER ',' CSV HEADER;

\copy reviews FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/postgres/csv/reviewTable15.csv' DELIMITER ',' CSV HEADER;

\copy images FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/postgres/csv/imageTable1.csv' DELIMITER ',' CSV HEADER;

\copy images FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/postgres/csv/imageTable2.csv' DELIMITER ',' CSV HEADER;

\copy images FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/postgres/csv/imageTable3.csv' DELIMITER ',' CSV HEADER;

\copy images FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/postgres/csv/imageTable4.csv' DELIMITER ',' CSV HEADER;

\copy images FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/postgres/csv/imageTable5.csv' DELIMITER ',' CSV HEADER;

\copy images FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/postgres/csv/imageTable6.csv' DELIMITER ',' CSV HEADER;

\copy images FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/postgres/csv/imageTable7.csv' DELIMITER ',' CSV HEADER;

\copy images FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/postgres/csv/imageTable8.csv' DELIMITER ',' CSV HEADER;

\copy images FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/postgres/csv/imageTable9.csv' DELIMITER ',' CSV HEADER;

\copy images FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/postgres/csv/imageTable10.csv' DELIMITER ',' CSV HEADER;