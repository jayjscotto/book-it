var express = require("express");
var router = express.Router();
var db = require("../models");
var passport = require("../config/passport");

//Require middleware for checking if a user is logged in
var isAuthenticated = require("../config/isAuthenticated");

//Using passport.authenticate middleware & local strategy
//if user has valid login credentials, send them to user homepage
//otherwise send an error
router.post("/login", passport.authenticate("local"), (req, res) => {
  //console.log(req.user);
  //redirection will happen on the front-end
  //front-end receives this route if the user is authenticated
  res.sendStatus(200);
});

//route for user signing up
router.post("/signup", (req, res) => {
  db.User.create({
    email: req.body.email,
    password: req.body.password
  })
    .then(function(user) {
      res.redirect(307, "/api/login");
      //console.log(user);
      //res.redirect('/members');
    })
    .catch(err => {
      console.log(err);
      res.json(err);
    });
});

//route to log out
router.get("/logout", (req, res) => {
  req.logOut();
  res.redirect("/");
});

//route to get user data to use client side
router.get("/user_data", isAuthenticated, (req, res) => {
  //console.log(req.user);
  if (!req.user) {
    //if the user is not logged in, respond with an empty object
    res.json({});
  } else {
    //send back users email and id
    res.json({
      email: req.user.email,
      id: req.user.id
    });
  }
});

module.exports = router;
