const express = require('express');
const router = express.Router();
const path = require('path');
// Requiring our models for syncing
const db = require('.././models');
const moment = require('helper-moment');

//Require middleware for checking if a user is logged in
const isAuthenticated = require('../config/isAuthenticated');

router.get('/facilityId=:id/classes/:day', isAuthenticated, (req, res) => {
    // let day = moment().weekday() - 1;
    console.log(req.params)
    //console.log(`weekday: ${moment().weekday()}`)
    console.log(`busines: ${req.params.id}`)
    //need to conditionally update route to IF day param exists
    //query day
    //if not, use moment.weekday

  db.Services.findAll({
    where: {
      business_id: req.params.id,
      day_of_week: req.params.day
    },
    include: [
      {
        model: db.Business,
        where: { id: req.params.id }
      }
    ],
    order: [
      ['start_time']
    ],
  }).then((results, err) => {

    if(err) {
      //RENDER ERROR PAGE
    }
   
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
