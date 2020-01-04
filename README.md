# BookFit
BookFit is an appointment scheduling application where you can secure appointments for services at businesses in your area

## Using the Project
* Create a user on sign up page
* Search facilities by Name, City, State, or Zip Code
* Click on specific day of the week for appointments on that day
* Click `Book It` to book and confirm
* Either in the menu or on the homepage click `View Appointments` to view your scheduled and past appointments

## Using the deployed version
* Navigate to: https://bookfit.herokuapp.com
* Test user:
    * Login: jay@jay.com
    * Password: test1234


## Local Usage
* Clone this repository onto your local machine
* In the project directory, run `$npm install`
* Open MySQL workbench
* Ensure SQL Server is runnning
* Run the following commands:
    * `CREATE DATABASE bookfit` (or whatever name you choose) to create the local database
    * Ensure the Name, Host, User and Password fields in the `./config/config.json` file are correct in the Development Object
    *  `$npm start` to spin up the server
    * If the server starts, move on to the next steps
* In the `./db` directory, run `$mysql -u [USERNAME] -p` and enter your password when prompted
* Once in the MySQL CLI, run `source seed.sql`
* This will seed the database with dummy data.
* Proceed to create users in the application and use freely.


## Built With
* [Heroku](https://www.heroku.com/)- Cloud platform which builds databases and websites deployed online. 
* [Javascript](https://www.javascript.com/) - The scripting language used to manipulate the DOM.  
* [jQuery](http://jquery.com/) - Javascript library for DOM and CSS manipulation.
* [Moment.js](https://momentjs.com/) - Javascipt library for time calculations.
* [Node](https://nodejs.org/en) - Javascript run-time environment that exectues server side code.
* [Express](https://www.npmjs.com/package/express) - Node package used as middleware to create routes.
* [Express-Handlebars](https://www.npmjs.com/package/express-handlebars) - Node package used as middleware to create templates for rendering pages. 
* [Sequelize](http://docs.sequelizejs.com/) - Promise based ORM for Node that supports MySQL interactivity.
* [MySQL](https://dev.mysql.com/doc/) - The world's most popular open source database.
* [Passport](https://www.npmjs.com/package/passport) - Node package used as middleware for user authentication by hashing passwords. 
* [Bcrypt](https://www.npmjs.com/package/bcrypt) - Node package used as middleware with Node and passport package for user authentication and password decryption. 
* [MySql](https://www.mysql.com/) - Structured Query Language is a relational database management system used for storing data.
* [HTML5](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/HTML5) - Mark up language used for structuring pages. 
* [CSS](https://developer.mozilla.org/en-US/docs/Web/CSS) - Stylesheet language used to describe presentation of pages. 
* [Sass](https://sass-lang.com/) -  (short for Syntactically Awesome Style Sheets) CSS pre-processor to make writing CSS easier with use of variables and mixins.
* [BootstrapCDN](https://getbootstrap.com/docs/4.1/getting-started/introduction/) - The web framework used for styling.

## Contributors
Jason Scotto - [jayjscotto](https://github.com/jayjscotto)
