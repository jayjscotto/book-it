var express = require('express');
var router = express.Router();
var db = require(".././models");

//Using passport.authenticate middleware & local strategy 
//if user has valid login credentials, send them to user homepage
//otherwise send an error
router.post('/api/login', passport.authenticate('local'), (req, res) => {

  //redirection will happen on the front-end
  //front-end receives this route if the user is authenticated
  res.json('/user-home');
});

//route for user signing up
router.post('/api/signup', (req, res) => {
  console.log(req.body);

  db.User.create({
    email: req.body.email,
    password: req.body.password
  }).then(() => {
    res.redirect(307, '/api/login');
  }).catch((err) => {
    console.log(err);
    res.json(err);
  })
});

//route to log out
router.get('/logout', (req, res) => {
  req.logout();
  res.redirect('/')
});

//route to get user data to use client side
router.get('/api/user_data', (req, res) => {
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
