var express = require('express');
var router = express.Router();
var path = require('path');

//Require middleware for checking if a user is logged in
var isAuthenticated = require("../config/isAuthenticated");

/* GET home page. */
router.get('/', (req, res) => {
  if (req.user) {
    res.redirect('/members');
  }
  res.render('index');
});

router.get('/sign-up', (req, res) => {
  res.render('userauth', {signup: true});
});

router.get('/login', (req, res) => {
  res.render('userauth', {signup: false});
})


router.get('/members', isAuthenticated, (req, res) => {
  //console.log(req.user);
  if (req.user) {
    const user = req.user.email.split('@');
    const username = user[0];
  
    const userObj = {
      email: username
    }
  
    res.render('index', {username: userObj});
  } else {
    res.render('userauth', {signup: false});
  }
});

module.exports = router;
