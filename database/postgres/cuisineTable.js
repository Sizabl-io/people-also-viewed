const db = require('../postgres/index.js')
const faker = require('faker/locale/en');
const path = require('path');
const createCsvWriter = require('csv-writer').createObjectCsvWriter;
// Cuisine Table Seed Script
// List cuisine categories
const categoryList = ['Hot Dogs', 'Korean', 'Gastropubs', 'Chicken Wings', 'Pizza', 'BBQ', 'Caterers', 'Soup', 'Vietnamese', 'Noodles', 'Seafood', 'Bubble Tea', 'Seafood', 'Taiwanese', 'Cajun', 'Thai', 'Cocktail Bar', 'Burgers', 'American', 'Sushi Bar', 'Asian Fusion', 'Juice Bar'];
// Generate array of cuisine objects
const cuisineDataGenerator = function () {
  const cuisines = [];
  for (var i = 0; i < categoryList.length; i++) {
    cuisines.push(
      {
        cuisine_id: i,
        name: categoryList[i]
      }
    );
  }
  return cuisines;
};
// Generate Data
const cuisineRecords = cuisineDataGenerator();
// Setup csv writer with proper path and headers
const cuisineTableWriter = createCsvWriter({
  path: path.join(__dirname, 'csv', 'cuisineTable.csv'),
  header: [
      {id: 'cuisine_id', title: 'cuisine_id'},
      {id: 'name', title: 'name'}
  ]
});
// Write the data in cuisineRecords to csv
cuisineTableWriter.writeRecords(cuisineRecords)
    .then(() => {
        console.log('...Done');
    });