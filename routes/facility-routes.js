const express = require('express');
const router = express.Router();
const path = require('path');
// Requiring our models for syncing
const db = require('.././models');
const moment = require('moment');

//Require middleware for checking if a user is logged in
const isAuthenticated = require('../config/isAuthenticated');

router.get('/facilityId=:id/classes', isAuthenticated, (req, res) => {
    let day = moment().weekday();
    console.log(`weekday: ${moment().weekday()}`)

  db.Services.findAll({
    where: {
      business_id: req.params.id,
      day_of_week: day
    },
    include: [
      {
        model: db.Business,
        where: { id: req.params.id }
      }
    ] 
  }).then(results => {
   
    const business = results[0].Business.dataValues;

    let classDay = {
      class: results,
      facility: business,
      username: true,
    };
    res.render('facility', classDay);
  });
});


module.exports = router;
