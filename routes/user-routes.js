var express = require("express");
var router = express.Router();
var path = require("path");
// Requiring our models for syncing
var db = require(".././models");

//Require middleware for checking if a user is logged in
var isAuthenticated = require("../config/isAuthenticated");

/* GET home page. */
router.get("/", (req, res) => {
  if (req.user) {
    res.redirect("/members");
  }
  res.render("index");
});

router.get("/sign-up", (req, res) => {
  res.render("userauth", { signup: true });
});

router.get("/login", (req, res) => {
  res.render("userauth", { signup: false });
});

router.get("/members", isAuthenticated, (req, res) => {
  const user = req.user.email.split("@");
  const username = user[0];

  const userObj = {
    email: username
  };

  res.render("index", { username: userObj });
});

router.get("/location-search/:searchTerm", isAuthenticated, (req, res) => {
  const searchTerm = req.body.searchTerm;

  db.ServicefindAll({
    where: {
      state: searchTerm
    }
  })
    .then(function(results) {
      const searchRes = {
        class: results
      }
      res.render('usersearch', searchRes);
    })
    .catch(err => {
      if (err) throw err;
    });
});

module.exports = router;
