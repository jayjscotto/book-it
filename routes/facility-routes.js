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

    console.log(today)
    console.log(day)

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

    const business = results[0].Business.dataValues;

    const dayClass = momentTime().format("dddd, MMMM DD, YYYY")
    console.log(`function results:${dayClass}`);

    const classDay = {
      class: results,
      facility: business,
      username: true,
      viewDate: dayClass
    };
    res.render("facility", classDay);
  });
});

module.exports = router;
