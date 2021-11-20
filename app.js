require('dotenv').config()
const express = require('express');
const bodyParser = require("body-parser");
const app = express();
const port = process.env.PORT;

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

const api = require('./api');

// 1. Recipes paths

// Get all recipes
app.get('/Recipes/', api.getAllRecipes);

// Get all recipes when searching for something
app.get('/Recipes/SearchResults', api.getAllRecipesFromSearch)

// Get one specific recipe with author information
app.get('/Recipes/:id', api.getRecipeById);

// app.post('/Recipes/', api.addRecipe);
// app.put('/Recipes/:id', api.updateRecipe);
app.delete('/Recipes/:id', api.deleteRecipe);

//users paths
app.get('/Users/', api.getAllUsers);
app.get('/Users/:id', api.getUserById);
app.post('/Users/', api.addUser);

// Get favourites for a specific user (ex. user 1)
app.get('/users/:id/favourites', api.getFavouritesByUser);

// Get recipes from a specific user (ex. user 1)
app.get('/users/:id/recipes', api.getRecipesByUser);

// Add recipe (only users add recipes)
app.post('/users/:id/recipes', api.addRecipe);


app.listen(port, () => {
  console.log(` Recipe-Mate Api is at your service ${port}.`);
});
