const express = require('express');
const router = express.Router();
const path = require('path');
// Requiring our models for syncing
const db = require('.././models');

const Op = db.Sequelize.Op;

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
    db.Business.findAll({
      where: {
        state: searchTerm
      }
    })
      .then(function(results) {
        const searchRes = {
          gym: results,
          username: true
        }
        res.render('usersearch', searchRes);
      })
      .catch(err => {
        if (err) throw err;
      });
  });


  router.get('/facility/facilityId=:id', isAuthenticated, (req, res) => {
    const facilityId = req.params.id;
    db.Services.findAll({
      where: {
        business_id: facilityId,
      },
      group: ['day_of_week']
    }).then(function(results) {
      console.log(results)
      // const facilitySched = {
        
      // }
    })
  })

  router.get('/class-search/:searchTerm', isAuthenticated, (req, res) => {
    const searchTerm = req.params.searchTerm;

    console.log(searchTerm);
    
    db.Services.findAll({
      where: {
        class_name: 'Small Group Weight Traning'
        // class_name: {
        //   [Op.like]: `%${searchTerm}`
        // }
      }
    }).then(function(results) {

      const searchRes = {
        class: results,
        username: true
      }

      console.log(searchRes);

      res.render('usersearch', searchRes);
    })
    .catch(err => {
      if (err) throw err;
    });
  })

module.exports = router;
