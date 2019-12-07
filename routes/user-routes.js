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
  res.sendFile(path.join(__dirname, '../public/signup.html'));
  //res.render('index', { title: 'Express' });
});

router.get('/login', (req, res) => {
  if (req.user) {
    res.redirect('/members');
  }
  res.sendFile(path.join(__dirname, '../public/login.html'));
});

router.get('/members', isAuthenticated, (req, res) => {
  res.render('index');
});

module.exports = router;
