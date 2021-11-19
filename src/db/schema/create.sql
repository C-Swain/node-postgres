DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS recipes CASCADE;
DROP TABLE IF EXISTS comments CASCADE;
DROP TABLE IF EXISTS favourites CASCADE;

CREATE TABLE users(
  id SERIAL PRIMARY KEY NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
);

CREATE TABLE categories (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  edible BOOLEAN 
);

CREATE TABLE recipes (
  id SERIAL PRIMARY KEY NOT NULL,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  name VARCHAR(255) NOT NULL,
  category INTEGER REFERENCES categories(id) ON DELETE CASCADE,
  description VARCHAR(255),
  ingregients TEXT,
  steps TEXT,
  servings VARCHAR(255),
  time INTEGER,
  likes INTEGER,
);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY NOT NULL,
  recipe_id INTEGER REFERENCES recipe(id) ON DELETE CASCADE,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  description VARCHAR(255)
);

CREATE TABLE favourites (
  id SERIAL PRIMARY KEY NOT NULL,
  recipe_id INTEGER REFERENCES recipe(id) ON DELETE CASCADE,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
);
