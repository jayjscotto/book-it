const express = require("express");
const router = express.Router();
const path = require("path");
// Requiring our models for syncing
const db = require(".././models");
const moment = require("helper-moment");
const momentTime = require("moment");

//Require middleware for checking if a user is logged in
const isAuthenticated = require("../config/isAuthenticated");

const classDateGen = (goalDay, todayDate) => {
  // if we haven't yet passed the day of the week
  if (todayDate <= goalDay) {
    // then just give me this week's instance of that day
    return momentTime()
      .isoWeekday(goalDay)
      .format("dddd, MMMM Do YYYY");
  } else {
    // otherwise, give me *next week's* instance of that same day
    return momentTime()
      .add(1, "weeks")
      .isoWeekday(goalDay)
      .format("dddd, MMMM Do, YYYY");
  }
};

router.get("/facilityId=:id/classes/:day", isAuthenticated, (req, res) => {
  //query the db for the facilities classes on the specific day
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
    order: [["start_time"]]
  }).then((results, err) => {
    if (results.length === 0) {
      res.render("error", { username: true });
    }

    const business = results[0].Business.dataValues;

    const today = momentTime().isoWeekday();


    let day = req.params.day;
    day++;

    // console.log(today)
    // console.log(day)

    const dayClass = classDateGen(day, today);

    const classDay = {
      class: results,
      facility: business,
      username: true,
      viewDate: dayClass
    };
    res.render("facility", classDay);
  });
});


router.get("/facilityId=:id/initial-view", isAuthenticated, (req, res) => {
  // get today's date and query the db for classes on that date
  const todayWeekday = momentTime().isoWeekday() - 1;

  console.log(`requested day is ${todayWeekday}`);

  db.Services.findAll({
    where: {
      business_id: req.params.id,
      day_of_week: todayWeekday
    },
    include: [
      {
        model: db.Business,
        where: { id: req.params.id }
      }
    ],
    order: [["start_time"]]
  }).then((results, err) => {
    if (results.length === 0) {
      res.render("error", { username: true });
    }

    validClasses = [];

    //for loop that iterates through results
    //get first two numbers of start time by results[i].dataValues.start_time.split(":")
    //compare against momentTime().hour();
    //if classTime[0] >= momentTime().hour(), push to the variable that will be in the hbs object
    for(let classObj in results) {
      let classTime = results[classObj].dataValues.start_time.split(":");
      let currentTime = momentTime().hour();
      if (classTime[0] >= currentTime) {
        validClasses.push(results[classObj]);
      }
    }

    console.log(`current hour: ${momentTime().hour()}`);
    console.log(`results: ${results.length}`);
    console.log(`valid: ${validClasses.length}`);

    let classTime = results[0].dataValues.start_time.split(':');
    console.log(classTime[0]); 

    const business = results[0].Business.dataValues;

    const dayClass = momentTime().format("dddd, MMMM DD, YYYY");

    const classDay = {
      class: validClasses,
      facility: business,
      username: true,
      viewDate: dayClass
    };
    res.render("facility", classDay);
  });
});

module.exports = router;
