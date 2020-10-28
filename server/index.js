require('newrelic');
const express = require('express')
const app = express()
const port = 3000
// const db = require('../database')
const path = require('path')
const db = require('../database/postgres/index.js')

app.use('/', express.static(path.join(__dirname, '../client/dist')));

app.get('/', (req, res) => {
  res.send('Hello World!');
});

// app.get('/getRestaurants', (req, res) => {
//   db.getRestaurants((error, result) => {
//     error ? res.status(400).send() : res.status(201).send(result);
//   });
// });

app.get('/api/restaurants/:id', (req, res1) => {
  db.getRestaurantById(req.params.id, (err, data) => {
    if (err) {
      // console.log('error in server get request');
      res1.status(400).send(err);
    } else {
      // console.log('successful server get request');
      res1.status(200).send(data);
    }
  });
});

app.get('/api/restaurants/cuisines/:id', (req, res2) => {
  db.getRestaurantsByCuisineId(req.params.id, (err, data) => {
    if (err) {
      // console.log('error in server get request');
      res2.status(400).send(err);
    } else {
      // console.log('successful server get request');
      res2.status(200).send(data);
    }
  });
});

app.get('/api/restaurants/cuisines/:name', (req, res3) => {
  db.getRestaurantsByCuisineName(req.params.name, (err, data) => {
    if (err) {
      // console.log('error in server get request');
      res3.status(400).send(err);
    } else {
      // console.log('successful server get request');
      res3.status(200).send(data);
    }
  });
});

app.get('/api/photos/restaurants:id', (req, res4) => {
  db.getPhotosByRestaurantId(req.params.id, (err, data) => {
    if (err) {
      // console.log('error in server get request');
      res4.status(400).send(err);
    } else {
      // console.log('successful server get request');
      res4.status(200).send(data);
    }
  });
});

app.get('/api/reviews/restaurants:id', (req, res4) => {
  db.getReviewsByRestaurantId(req.params.id, (err, data) => {
    if (err) {
      // console.log('error in server get request');
      res4.status(400).send(err);
    } else {
      // console.log('successful server get request');
      res4.status(200).send(data);
    }
  });
});

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});