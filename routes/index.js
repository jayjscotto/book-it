var express = require('express');
var router = express.Router();

//Require middleware for checking if a user is logged in
var isAuthenticated = require("../config/middleware/isAuthenticated");

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

module.exports = router;
