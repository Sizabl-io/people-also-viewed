const db = require('../cassandra/index.js')
const faker = require('faker/locale/en');
const path = require('path');
const createCsvWriter = require('csv-writer').createObjectCsvWriter;
// Restaurant Table Seed Script
// List various variables for data generator
const restaurantList = ['Chungchun Hotdogs', 'Buncker21', 'Flying Pa-Dak', 'Koko BBQ', 'Tang 88', 'The SmoKING Ribs', 'Grams BBQ', 'Kaju Tofu', 'Pho 45', 'Dry Noodle 168', 'Hue Oi', 'Tam Bien', 'Lien Hue', 'Bien Hen', 'Twinkle Boba', 'Sharetea', '7 Leaves Cafe', 'Kung Fu Tea', 'Gong Cha', 'Taste Tea Cafe', 'Tasty Noodle House', 'Ramen Zuru', 'Umaya Ramen', 'Tampopo', 'Niko Niko', 'Kabuki', 'Gyu-Kaku', 'Dip Shabu Shabu', 'Pepper Lunch', 'Yuzu Shabu', 'Geko Tei', 'Nine Seafood', 'Claws', 'Stinkin Crawfish', 'The Cajun Crab', 'Louisiana Chicken', 'Mezcalero', 'The Grasshopper', 'The Bamboo Club', 'NextDoor', 'District Wine', 'The Carvery', '555 East', 'King Fish House', 'The Crab Shack', 'Pier 76', 'Restauration', 'Simmzy', 'Crooked Duck', 'The Local Spot'];

const categoryList = ['Hot Dogs', 'Korean', 'Gastropubs', 'Chicken Wings', 'Pizza', 'BBQ', 'Caterers', 'Soup', 'Vietnamese', 'Noodles', 'Seafood', 'Bubble Tea', 'Seafood', 'Taiwanese', 'Cajun', 'Thai', 'Cocktail Bar', 'Burgers', 'American', 'Sushi Bar', 'Asian Fusion', 'Juice Bar'];


// async function for batch indexing
const createBatchesOfData = async (index) => {
  console.log(`Starting CSV #${index + 1}...`);

  // Generate array of restaurant objects
  const restaurantDataGenerator = function (min, max) {
    const restaurants = [];
    for (var i = min; i <= max; i++) {
      const randomRestaurantName = restaurantList[Math.floor(Math.random() * restaurantList.length)];

      const halfOrWhole = [0, 0.5];
      const randomRating = Math.ceil(Math.random() * 5) + halfOrWhole[Math.floor(Math.random() * 2)];

      const randomNumberOfReviews = Math.ceil(Math.random() * 500);

      const pricey = Math.ceil(Math.random() * 3);

      const randomCuisineName = categoryList[Math.floor(Math.random() * (categoryList.length))];

      const paddedNumber = ('000' + Math.ceil(Math.random() * 999)).slice(-3);
      const randomImg = `https://mataeux.s3-us-west-1.amazonaws.com/restaurants/pic_${(paddedNumber)}.jpg`;

      const boolArray = ['true', 'false'];
      const randomHeart = boolArray[Math.floor(Math.random() * 2)];
      const randomSuperRated = boolArray[Math.floor(Math.random() * 2)];

      restaurants.push(
        {
          restaurant_id: i,
          name: randomRestaurantName,
          cuisine_name: randomCuisineName,
          rating: randomRating,
          number_of_reviews: randomNumberOfReviews,
          how_pricey: pricey,
          display_img_url: randomImg,
          heart: randomHeart,
          super_rated: randomSuperRated
        }
      );
    }
    return restaurants;
  };
  // Generate data
  const start = index * 1000000 + 1;
  const end = index * 1000000 + 1000000;
  const restaurantRecords = restaurantDataGenerator(start, end);
  // Setup csv writer with proper path and headers
  const restaurantTableWriter = createCsvWriter({
    path: path.join(__dirname, 'csv', `restaurantTable${index + 1}.csv`),
    header: [
        {id: 'restaurant_id', title: 'restaurant_id'},
        {id: 'name', title: 'name'},
        {id: 'cuisine_name', title: 'cuisine_name'},
        {id: 'rating', title: 'rating'},
        {id: 'number_of_reviews', title: 'number_of_reviews'},
        {id: 'how_pricey', title: 'how_pricey'},
        {id: 'display_img_url', title: 'display_img_url'},
        {id: 'heart', title: 'heart'},
        {id: 'super_rated', title: 'super_rated'}
    ]
  });
  // Write the data in cuisineRecords to csv
  await restaurantTableWriter.writeRecords(restaurantRecords)
      .then(() => {
          console.log(`...wrote records to restaurantTable${index + 1}.csv`);
      });
}

const allBatches = async () => {
  for (var i = 0; i < 10; i++) {
    await createBatchesOfData(i);
    console.log(`...batch ${i + 1} of 10 complete`);
  }
};

allBatches();