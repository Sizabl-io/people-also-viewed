const { Pool } = require('pg');
const config = require('./config.js');

const pool = new Pool(config);

pool.query('SELECT NOW()', (err, res) => {
  console.log(err, res)
  pool.end()
});

