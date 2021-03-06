/**
 * npm packages import
 */
const Http = require('http');
const express = require("express");
const cors = require("cors");
const bodyparser = require('body-parser')

/**
 * custom files import
 */
const Routes = require('./routes')
const db = require('./config/database')

/**
 * initializing ExpressJS
 */
const application = express()

/**
 * converting data and request path, that will come from client side, into JSON format
 */
application.use(bodyparser.json())
application.use(bodyparser.urlencoded({
    extended: false
}))

/**
 * adding cors middleware to allow client to make requests without getting blocked by browser security service
 */
application.use(cors())

/**
 * inititalizing HTTP server with ExpressJS
 */
const server = Http.createServer(application);

/**
 * 3010 port will be assigned to localhost (you can change port according to your wish)
 * process.env.PORT will be used in production only
 */
const port = 3010 || process.env.PORT


/**
 * establishing connection with mysql
 * here db came from config/database.js file
 * db has all configuraition set up already
*/
db.authenticate()
    .then(() => {
        /**
        * connection has been established
        * server is running perfectly
        * you can start working
        */
        console.log('Connection has been established successfully.');

        /**
         * all routing is set up in routes.js
         * we are passing express application object to routes.js
         */
        Routes(application);
        /**
         * server is listening to port
         */
        server.listen(port, () => {
            console.log(`Server is up and running @${port}`);
        });
    })
    .catch(err => {
        /**
        * error occured during connection
        */
        console.error('Unable to connect to the database:', err);
    });

/**
 * NOTES
 * import testing1.dll file in phpMyAdmin in order to connect with database or create your own database in phpMyAdmin and see the database.js file in config folder
 * to start server, write "npm start" in console/terminal
*/

/**
 * TIPS
 * You can use mongodb and other databases with same configuration
 * you must have to replace mysql/sequelize native commands to connect with other database e.g. in order to connect with mongodb, use Mongoose instead of sequelize
 * sequelize is very handy tool to work with mysql. Do read its documentation because this application has been configured with sequelize
*/