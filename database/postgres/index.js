const { Pool, Client } = require('pg');
const config = require('./config.js');

const pool = new Pool(config);

// pool.on('error', (err, client) => {
//   console.error('Unexpected error on idle client', err)
//   process.exit(-1)
// });

// // async/await - check out a client from the pool
// const connectToPool = async () => {
//   client = await pool.connect();
//   console.log('Connected to pool!');
//   // set the default schema
//   // const res = await client.query('SET search_path to public');
//   return client;
// };

// const releasePool = async () => {
//   // Make sure to release the client before any error handling,
//   // just in case the error handling itself throws an error.
//   client.release();
//   console.log('Released the client');
// };

const getRestaurantById = (id, callback) => {
  const q = 'SELECT * FROM restaurants where restaurant_id = $1';
  const idInt = parseInt(id);
  pool.query(q, [idInt], (err, data) => {
    if (err) {
      // console.log('error in Postgres select * from restaurants by id query');
      callback(err);
    } else {
      // console.log('successful Postgres select * from restaurants by id query');
      callback(null, data.rows[0]);
    }
  });
};

// const getRestaurantsByCuisineId = (id, callback) => {
//   const q = `SELECT * FROM restaurants where cuisine_id = ${id};`;
//   connectToPool.query(q, (err, data) => {
//     if (err) {
//       // console.log('error in Postgres select * from restaurants by cuisine id query');
//       callback(err);
//     } else {
//       // console.log('successful Postgres select * from restaurants by cuisine id query');
//       callback(null, data);
//     }
//   });
// };

// const getRestaurantsByCuisineName = (name, callback) => {
//   const q = `SELECT * FROM restaurants inner join cuisines on cuisine_id where cuisine_name = ${name};`;
//   connectToPool.query(q, (err, data) => {
//     if (err) {
//       // console.log('error in Postgres select * from restaurants by cuisine name query');
//       callback(err);
//     } else {
//       // console.log('successful Postgres select * from restaurants by cuisine name query');
//       callback(null, data);
//     }
//   });
// };

// const getPhotosByRestaurantId = (id, callback) => {
//   const q = `SELECT * FROM photos where restaurant_id = ${id};`;
//   connectToPool.query(q, (err, data) => {
//     if (err) {
//       // console.log('error in Postgres select * from photos by restaurant id query');
//       callback(err);
//     } else {
//       // console.log('successful Postgres select * from photos by restaurant id query');
//       callback(null, data);
//     }
//   });
// };

// const getReviewsByRestaurantId = (id, callback) => {
//   const q = `SELECT * FROM reviews where restaurant_id = ${id};`;
//   connectToPool.query(q, (err, data) => {
//     if (err) {
//       // console.log('error in Postgres select * from reviews by restaurant id query');
//       callback(err);
//     } else {
//       // console.log('successful Postgres select * from reviews by restaurant id query');
//       callback(null, data);
//     }
//   });
// };

module.exports = {
  // connectToPool,
  // releasePool,
  getRestaurantById
  // getRestaurantsByCuisineId,
  // getRestaurantsByCuisineName,
  // getPhotosByRestaurantId,
  // getReviewsByRestaurantId
};
