const mongoose = require('mongoose');

mongoose.connect('mongodb://localhost/people-also-viewed');

const db = mongoose.connection
db.on('error', console.error.bind(console, 'connection error:'));
db.once('open', function () {
  console.log('mongoDB is now connected')
});

const restaurantSchema = new mongoose.Schema({

  id: Number,
  name: String,
  reviews: Number,
  reviewsNum: Number,
  price: Number,
  category: Array,
  displayImgURL: String,
  heart: Boolean,
  super_rated: Boolean,
  inner_img: Array,
  unique_id: Number,
  reviewModal: Array,
  individual_rating: Number
});


const Restaurant = mongoose.model('Restaurant', restaurantSchema);

const getRestaurants = (callback) => {
  Restaurant.aggregate([
    { $sample: { size: 10 } }
  ])
    .then((response) => {
      callback(null, response);
    })
    .catch(console.log)
};

const getRestaurants = (callback) => {
  Restaurant.aggregate([
    { $sample: { size: 10 } }
  ])
    .then((response) => {
      callback(null, response);
    })
    .catch(console.log)
};

module.exports = {
  getRestaurants,
  Restaurant
};