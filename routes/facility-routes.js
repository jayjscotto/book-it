const express = require('express');
const router = express.Router();
const path = require('path');
// Requiring our models for syncing
const db = require('.././models');

//Require middleware for checking if a user is logged in
const isAuthenticated = require('../config/isAuthenticated');

router.get('/facilityId=:id/classDay=:day', isAuthenticated, (req, res) => {
    let classDay;
    if(req.params.day) {
        classDay = req.params.day
    } else {
        classDay = 0
    }
  db.Services.findAll({
    where: {
      business_id: req.params.id,
      day_of_week: classDay
    },
    include: [
      {
        model: db.Business,
        where: { id: req.params.id }
      }
    ]
  }).then(results => {
    console.log(results);
    let classDay = {
      class: results,
      username: true
    };
    res.render('facility', classDay);
  });
  // const facilitySched = {

  // }
});


module.exports = router;
