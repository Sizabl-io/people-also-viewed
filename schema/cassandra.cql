DROP KEYSPACE IF EXISTS viewed;

CREATE KEYSPACE viewed WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };

USE viewed;

// one cuisine to many restaurants
CREATE TABLE restaurants_to_cuisine (
  restaurant_id int,
  name varchar,
  cuisine_name varchar,
  rating float,
  number_of_reviews smallint,
  how_pricey smallint,
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
  rating float,
  PRIMARY KEY (restaurant_id, review_id)
);

// one restaurant to many images
CREATE TABLE images_to_restaurants (
  restaurant_id int,
  image_id int,
  img_url text,
  PRIMARY KEY (restaurant_id, image_id)
);


COPY restaurants_to_cuisine (restaurant_id, name, cuisine_name, rating, number_of_reviews, how_pricey, display_img_url, heart, super_rated) FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/cassandra/csv/restaurantTable1.csv' WITH HEADER=true AND DELIMITER=',';

COPY restaurants_to_cuisine (restaurant_id, name, cuisine_name, rating, number_of_reviews, how_pricey, display_img_url, heart, super_rated)  FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/cassandra/csv/restaurantTable2.csv' WITH HEADER=true AND DELIMITER=',';

COPY restaurants_to_cuisine (restaurant_id, name, cuisine_name, rating, number_of_reviews, how_pricey, display_img_url, heart, super_rated)  FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/cassandra/csv/restaurantTable3.csv' WITH HEADER=true AND DELIMITER=',';

COPY restaurants_to_cuisine (restaurant_id, name, cuisine_name, rating, number_of_reviews, how_pricey, display_img_url, heart, super_rated)  FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/cassandra/csv/restaurantTable4.csv' WITH HEADER=true AND DELIMITER=',';

COPY restaurants_to_cuisine (restaurant_id, name, cuisine_name, rating, number_of_reviews, how_pricey, display_img_url, heart, super_rated)  FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/cassandra/csv/restaurantTable5.csv' WITH HEADER=true AND DELIMITER=',';

COPY restaurants_to_cuisine (restaurant_id, name, cuisine_name, rating, number_of_reviews, how_pricey, display_img_url, heart, super_rated)  FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/cassandra/csv/restaurantTable6.csv' WITH HEADER=true AND DELIMITER=',';

COPY restaurants_to_cuisine (restaurant_id, name, cuisine_name, rating, number_of_reviews, how_pricey, display_img_url, heart, super_rated)  FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/cassandra/csv/restaurantTable7.csv' WITH HEADER=true AND DELIMITER=',';

COPY restaurants_to_cuisine (restaurant_id, name, cuisine_name, rating, number_of_reviews, how_pricey, display_img_url, heart, super_rated)  FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/cassandra/csv/restaurantTable8.csv' WITH HEADER=true AND DELIMITER=',';

COPY restaurants_to_cuisine (restaurant_id, name, cuisine_name, rating, number_of_reviews, how_pricey, display_img_url, heart, super_rated)  FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/cassandra/csv/restaurantTable9.csv' WITH HEADER=true AND DELIMITER=',';

COPY restaurants_to_cuisine (restaurant_id, name, cuisine_name, rating, number_of_reviews, how_pricey, display_img_url, heart, super_rated)  FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/cassandra/csv/restaurantTable10.csv' WITH HEADER=true AND DELIMITER=',';

COPY reviews_to_restaurants (restaurant_id, review_id, avatar_url, name, date, review, rating) FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/cassandra/csv/reviewTable1.csv' WITH HEADER=true AND DELIMITER=',';

COPY reviews_to_restaurants (restaurant_id, review_id, avatar_url, name, date, review, rating) FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/cassandra/csv/reviewTable2.csv' WITH HEADER=true AND DELIMITER=',';

COPY reviews_to_restaurants (restaurant_id, review_id, avatar_url, name, date, review, rating) FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/cassandra/csv/reviewTable3.csv' WITH HEADER=true AND DELIMITER=',';

COPY reviews_to_restaurants (restaurant_id, review_id, avatar_url, name, date, review, rating) FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/cassandra/csv/reviewTable4.csv' WITH HEADER=true AND DELIMITER=',';

COPY reviews_to_restaurants (restaurant_id, review_id, avatar_url, name, date, review, rating) FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/cassandra/csv/reviewTable5.csv' WITH HEADER=true AND DELIMITER=',';

COPY reviews_to_restaurants (restaurant_id, review_id, avatar_url, name, date, review, rating) FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/cassandra/csv/reviewTable6.csv' WITH HEADER=true AND DELIMITER=',';

COPY reviews_to_restaurants (restaurant_id, review_id, avatar_url, name, date, review, rating) FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/cassandra/csv/reviewTable7.csv' WITH HEADER=true AND DELIMITER=',';

COPY reviews_to_restaurants (restaurant_id, review_id, avatar_url, name, date, review, rating) FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/cassandra/csv/reviewTable8.csv' WITH HEADER=true AND DELIMITER=',';

COPY reviews_to_restaurants (restaurant_id, review_id, avatar_url, name, date, review, rating) FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/cassandra/csv/reviewTable9.csv' WITH HEADER=true AND DELIMITER=',';

COPY reviews_to_restaurants (restaurant_id, review_id, avatar_url, name, date, review, rating) FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/cassandra/csv/reviewTable10.csv' WITH HEADER=true AND DELIMITER=',';

COPY reviews_to_restaurants (restaurant_id, review_id, avatar_url, name, date, review, rating) FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/cassandra/csv/reviewTable11.csv' WITH HEADER=true AND DELIMITER=',';

COPY reviews_to_restaurants (restaurant_id, review_id, avatar_url, name, date, review, rating) FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/cassandra/csv/reviewTable12.csv' WITH HEADER=true AND DELIMITER=',';

COPY reviews_to_restaurants (restaurant_id, review_id, avatar_url, name, date, review, rating) FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/cassandra/csv/reviewTable13.csv' WITH HEADER=true AND DELIMITER=',';

COPY reviews_to_restaurants (restaurant_id, review_id, avatar_url, name, date, review, rating) FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/cassandra/csv/reviewTable14.csv' WITH HEADER=true AND DELIMITER=',';

COPY reviews_to_restaurants (restaurant_id, review_id, avatar_url, name, date, review, rating) FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/cassandra/csv/reviewTable15.csv' WITH HEADER=true AND DELIMITER=',';

COPY images_to_restaurants (restaurant_id, image_id, img_url) FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/cassandra/csv/imageTable1.csv' WITH HEADER=true AND DELIMITER=',';

COPY images_to_restaurants (restaurant_id, image_id, img_url) FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/cassandra/csv/imageTable2.csv' WITH HEADER=true AND DELIMITER=',';

COPY images_to_restaurants (restaurant_id, image_id, img_url) FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/cassandra/csv/imageTable3.csv' WITH HEADER=true AND DELIMITER=',';

COPY images_to_restaurants (restaurant_id, image_id, img_url) FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/cassandra/csv/imageTable4.csv' WITH HEADER=true AND DELIMITER=',';

COPY images_to_restaurants (restaurant_id, image_id, img_url) FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/cassandra/csv/imageTable5.csv' WITH HEADER=true AND DELIMITER=',';

COPY images_to_restaurants (restaurant_id, image_id, img_url) FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/cassandra/csv/imageTable6.csv' WITH HEADER=true AND DELIMITER=',';

COPY images_to_restaurants (restaurant_id, image_id, img_url) FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/cassandra/csv/imageTable7.csv' WITH HEADER=true AND DELIMITER=',';

COPY images_to_restaurants (restaurant_id, image_id, img_url) FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/cassandra/csv/imageTable8.csv' WITH HEADER=true AND DELIMITER=',';

COPY images_to_restaurants (restaurant_id, image_id, img_url) FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/cassandra/csv/imageTable9.csv' WITH HEADER=true AND DELIMITER=',';

COPY images_to_restaurants (restaurant_id, image_id, img_url) FROM '/Users/mataeux/Documents/HRSF/people-also-viewed/database/cassandra/csv/imageTable10.csv' WITH HEADER=true AND DELIMITER=',';