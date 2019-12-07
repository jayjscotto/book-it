var express = require('express');
var router = express.Router();
var path = require('path');

//Require middleware for checking if a user is logged in
var isAuthenticated = require("../config/isAuthenticated");

/* GET home page. */
router.get('/', (req, res) => {
  // if (req.user) {
  //   res.redirect('/members');
  // }
  res.render('index');
});

router.get('/sign-up', (req, res) => {
  res.render('userauth', {signup: true});
});

router.get('/login', (req, res) => {
  res.render('userauth', {signup: false});
})


router.get('/members', isAuthenticated, (req, res) => {
  console.log(`Hello ${req.user.email}`);

  let user = {
    email: req.user.email
  }

  res.render('index', {username: user});
});

module.exports = router;
