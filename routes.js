/**
* npm packages and custom files import
*/
const User = require('./controller/user');

/**
 * routes object defined 
 */
var routes = (application) => {
    /**
     * express application will now go through routes to entertain client's request
     */
    application.use((req, res, next) => {
        /**
         * add your middleware here, if needed
         */
        console.log('Routes activated!');
        console.log('Authenticating Developer');
        /**
         * here next() tells application to look forward for the routes, if not found then return 
         * but in our case it will not happen because at line no 55, 56 and 57 we added route that will always be used if no route matches prior to it
         */
        return next();
    });

    /**
     * now I will define routes user will send request on to get/post data into or from database 
     * express give us method to define these routes e.g. get, post, delete, put etc
     * each method takes two arguments i.e. first defines endpoint & second returns callback 
     * callback also takes two arguments i.e. first bring the data in form of request from the client & second returns response to the client  
     * -
     * -
     * there are two way of defining them
     */

    /**
     * First way of defining routes
     * You can write your logic directly in the callback as follow
     *  */
    application.get('/hello1', function (req, res) {
        //do your logic here

        //send response
        res.status(200).send({
            message: 'success',
            data: "Hello World!"
        });
    })

    /**
     * Second way of defining routes
     * I recommend using this method
     * You can import object/function from anywhere to call in callback
     *  */
    application.get('/hello2',
        /**your function or object that is imported from another file */
    )


    /**
     * Example of routes for a user
     * I have created two roures to show pattern which you can follow in your application 
     * here User is an object which has funcitons init which I imported at line 4
     * when user will hit either localhost:3010/signup or localhost:3010/login end point one of these routes will invoke
     * */
    application.post('/signup', User.signup);
    application.post('/login', User.login);

    /**
     * Following route will be invoked when user will hit the endpoint which is not defined before this route 
     * route-not-found error must come after all routes declaration
     */
    application.use((req, res, next) => {
        res.status(404).send('Route not found!');
    });
}

module.exports = routes
