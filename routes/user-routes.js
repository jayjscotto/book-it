const express = require('express');
const router = express.Router();
const path = require('path');
// Requiring our models for syncing
const db = require('.././models');

//Require middleware for checking if a user is logged in
const isAuthenticated = require('../config/isAuthenticated');

/* GET home page. */
router.get('/', (req, res) => {
  if (req.user) {
    res.redirect('/members');
  }
  res.render('index');
});

router.get('/sign-up', (req, res) => {
  res.render('userauth', { signup: true });
});

router.get('/login', (req, res) => {
  res.render('userauth', { signup: false });
});

router.get('/members', isAuthenticated, (req, res) => {
  const user = req.user.email.split('@');
  const username = user[0];

  const userObj = {
    email: username
  };

  res.render('index', { username: userObj });
});

  router.get('/location-search/:searchTerm', isAuthenticated, (req, res) => {
    const searchTerm = req.params.searchTerm;
    console.log(searchTerm)
    db.Business.findAll({
      where: {
        state: searchTerm
      }
    })
      .then(function(results) {
        const searchRes = {
          gym: results
        }
        res.render('usersearch', searchRes);
      })
      .catch(err => {
        if (err) throw err;
      });
  });

  router.get('/class-search/:searchTerm', isAuthenticated, (req, res) => {
    const searchTerm = req.params.searchTerm;
    console.log(searchTerm);
    db.Services.findAll({
      where: {
        className: {
          [Op.like]: `%${searchTerm}`
        }
      }
    }).then(function(results) {
      const searchRes = {
        class: results
      }
      res.render('usersearch', searchRes);
    })
    .catch(err => {
      if (err) throw err;
    });
  })

module.exports = router;
