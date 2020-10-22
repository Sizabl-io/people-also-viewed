const { Pool } = require('pg');
const config = require('./config.js');

const pool = new Pool(config);

pool.on('error', (err, client) => {
  console.error('Unexpected error on idle client', err)
  process.exit(-1)
});

let client;

// async/await - check out a client from the pool
const connectToPool = async () => {
  client = await pool.connect();
  console.log('Connected to pool!');
  // set the default schema
  const res = await client.query('SET search_path to public');
  return client;
};

const releasePool = async () => {
  // Make sure to release the client before any error handling,
  // just in case the error handling itself throws an error.
  client.release();
  console.log('Released the client');
};

module.exports = {
  connectToPool,
  releasePool,
};
