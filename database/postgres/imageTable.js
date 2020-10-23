const db = require('../postgres/index.js')
const faker = require('faker/locale/en');
const path = require('path');
const createCsvWriter = require('csv-writer').createObjectCsvWriter;
// Review Table Seed Script
// List various variables for data generator

// async function for batch indexing
const createBatchesOfData = async (index) => {
  console.log(`Starting CSV #${index + 1}...`);

  // Generate array of restaurant objects
  const imageDataGenerator = function (min, max) {
    const images = [];
    for (var i = min; i <= max; i++) {
      const paddedNumber = ('000' + Math.ceil(Math.random() * 999)).slice(-3);
      const randomImg = `https://mataeux.s3-us-west-1.amazonaws.com/restaurants/pic_${(paddedNumber)}.jpg`;

      const randomRestaurantId = Math.ceil(Math.random() * 10000000);

      images.push(
        {
          image_id: i,
          img_url: randomImg,
          restaurant_id: randomRestaurantId,
        }
      );
    }
    return images;
  };
  // Generate data
  const start = index * 3000000 + 1;
  const end = index * 3000000 + 3000000;
  const imageRecords = imageDataGenerator(start, end);
  // Setup csv writer with proper path and headers
  const imageTableWriter = createCsvWriter({
    path: path.join(__dirname, 'csv', `imageTable${index + 1}.csv`),
    header: [
        {id: 'image_id', title: 'image_id'},
        {id: 'img_url', title: 'img_url'},
        {id: 'restaurant_id', title: 'restaurant_id'},
    ]
  });
  // Write the data in cuisineRecords to csv
  await imageTableWriter.writeRecords(imageRecords)
      .then(() => {
          console.log(`...wrote records to imageTable${index + 1}.csv`);
      });
}

const allBatches = async () => {
  for (var i = 0; i < 10; i++) {
    await createBatchesOfData(i);
    console.log(`...batch ${i + 1} of 10 complete`);
  }
};

allBatches();