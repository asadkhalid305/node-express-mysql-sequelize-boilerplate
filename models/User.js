/**
 * Example schema (Model) creation to understand how sequelize with mysql works
 */

/**
 * import the sequelize package
 */
const Sequelize = require('sequelize')

/**
 * import database connection variable
 */
const db = require('../config/database')

/**
 * defining model for table, named "users"
 */
module.exports = db.define(
  'users',
  {
    UserID: {
      type: Sequelize.INTEGER,
      autoIncrement: true,
      primaryKey: true
    },
    NAME: {
      type: Sequelize.STRING
    },
    EMAIL: {
      type: Sequelize.STRING
    },
    PASSWORD: {
      type: Sequelize.STRING
    },
  },
  {
    timestamps: false
  },
)

/**
 * use this model to query into/from mysql
 * all logic for this model is written in ../controller/user.js 
 */