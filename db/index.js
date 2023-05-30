require('dotenv').config();
const Sequelize = require('sequelize');

module.exports = new Sequelize({
  database: process.env.DB_NAME || 'roomsEtalon',
  username: process.env.DB_USER || 'postgres',
  password: process.env.DB_PASSWORD || 'postgres',
  host: process.env.DB_HOST || 'localhost',
  port: process.env.DB_PORT || 5432,
  dialect: 'postgres',
});
