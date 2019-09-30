/**
 * npm packages import
 */
const Sequelize = require("sequelize")

/**
 * configuring mysql
 * this file will remain same for all mysql databases
 * change only first parameter of Sequelize constructor e.g. change "Testing1" to [your database name] to configure your local database
 * exporting this configuarion which is imported in main.js at line 13
 */
module.exports = new Sequelize("testing1", "root", "", {
    host: 'localhost',
    dialect: 'mysql',
    operatorsAliases: false,
    pool: {
        max: 5,
        min: 0,
        acquire: 30000,
        idle: 10000
    }
});
