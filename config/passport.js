//import passport packages
var passport = require('passport');
var LocalStrategy = require('passport-local').Strategy;

//database
var db = require('.././models');

//Letting passport know we want to use a Local Strategy
//(log in with username/email and password)

passport.serializeUser(new LocalStrategy(
    //user signs in with email
    {
        usernameField: 'email'
    },
    function(email, password, done) {
        //when user attempts to sign in
        db.User.findOne({
            where: {
                email: email
            }
        }).then(function(dbUser) {
            //if the username doesn't exist
            if (!dbUser) {
                return done(null, false, {
                    message: `We can't seem to find that username!`
                });
            }

            //if the username does exist, but the password is incorrect
            else if (!dbUser.validPassword(password)) {
                return done(null, false, {
                    message: `Looks like you have the wrong password!`
                });
            }

            //if neither, return user

            return done(null, dbUser);
        })
    }
));

//To keep auth state across HTTP requests,
//Sequelize needs to serialize and deserialize the user
//--boilerplate to serialize and deserialize:

passport.serializeUser((user, cb) => {
    cb(null, user);
});

passport.deserializeUser((obj, cb) => {
    cb(null, obj);
});

//export configured passport
module.exports = passport;