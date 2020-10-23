const db = require('../postgres/index.js')
const faker = require('faker/locale/en');
const path = require('path');
const createCsvWriter = require('csv-writer').createObjectCsvWriter;
// Review Table Seed Script
// List various variables for data generator

// async function for batch indexing
const createBatchesOfData = async (index) => {
  console.log(`Starting CSV #${index + 1}...`);

const month = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

  // Generate array of restaurant objects
  const reviewDataGenerator = function (min, max) {
    const reviews = [];
    for (var i = min; i <= max; i++) {
      const randomAvatarUrl = `https://mataeux.s3-us-west-1.amazonaws.com/avatars/pic_${Math.ceil(Math.random() * 100)}.jpg`;

      const randomUserName = faker.name.firstName() + ' ' + faker.name.lastName();

      const randomDate = month[Math.floor(Math.random() * 12)] + ' ' + (Math.floor(Math.random() * (2020 - 2018) + 2018)).toString();

      const randomReview = faker.lorem.sentences(Math.ceil(Math.random() * 3));

      const halfOrWhole = [0, 0.5];
      const randomRating = Math.ceil(Math.random() * 5) + halfOrWhole[Math.floor(Math.random() * 2)];

      const randomRestaurantId = Math.ceil(Math.random() * 10000000);

      reviews.push(
        {
          review_id: i,
          avatar_url: randomAvatarUrl,
          name: randomUserName,
          date: randomDate,
          review: randomReview,
          rating: randomRating,
          restaurant_id: randomRestaurantId
        }
      );
    }
    return reviews;
  };
  // Generate data
  const start = index * 2000000 + 1;
  const end = index * 2000000 + 2000000;
  const reviewRecords = reviewDataGenerator(start, end);
  // Setup csv writer with proper path and headers
  const reviewTableWriter = createCsvWriter({
    path: path.join(__dirname, 'csv', `reviewTable${index + 1}.csv`),
    header: [
        {id: 'review_id', title: 'review_id'},
        {id: 'avatar_url', title: 'avatar_url'},
        {id: 'name', title: 'name'},
        {id: 'date', title: 'date'},
        {id: 'review', title: 'review'},
        {id: 'rating', title: 'rating'},
        {id: 'restaurant_id', title: 'restaurant_id'}
    ]
  });
  // Write the data in cuisineRecords to csv
  await reviewTableWriter.writeRecords(reviewRecords)
      .then(() => {
          console.log(`...wrote records to reviewTable${index + 1}.csv`);
      });
}

const allBatches = async () => {
  for (var i = 0; i < 15; i++) {
    await createBatchesOfData(i);
    console.log(`...batch ${i + 1} of 15 complete`);
  }
};

allBatches();