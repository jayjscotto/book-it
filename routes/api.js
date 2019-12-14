const express = require("express");
const router = express.Router();
const db = require("../models");
const passport = require("../config/passport");
const moment = require("moment");
const Sequelize = require("sequelize");
const Op = Sequelize.Op;
//Require middleware for checking if a user is logged in
const isAuthenticated = require("../config/isAuthenticated");

//Using passport.authenticate middleware & local strategy
//if user has valid login credentials, send them to user homepage
//otherwise send an error
router.post("/login", passport.authenticate("local"), (req, res) => {
  //console.log(req.user);
  //redirection will happen on the front-end
  //front-end receives this route if the user is authenticated
  res.sendStatus(200);
});

//route for user signing up
router.post("/signup", (req, res) => {
  db.User.create({
    email: req.body.email,
    password: req.body.password
  })
    .then(function(user) {
      res.redirect(307, "/api/login");
      //console.log(user);
      //res.redirect('/members');
    })
    .catch(err => {
      console.log(err);
      res.json(err);
    });
});

//route to log out
router.get("/logout", (req, res) => {
  req.logOut();
  res.redirect("/");
});

//route to get user data to use client side
router.get("/user_data", isAuthenticated, (req, res) => {
  //console.log(req.user);
  if (!req.user) {
    //if the user is not logged in, respond with an empty object
    res.json({});
  } else {
    //send back users email and id
    res.json({
      email: req.user.email,
      id: req.user.id
    });
  }
});

router.get("/class-info/:id", isAuthenticated, (req, res) => {
  db.Services.findAll({
    where: {
      id: req.params.id
    }
  }).then(data => {
    res.json(data);
  });
});

router.post("/book-appointment", isAuthenticated, (req, res) => {
  //info needed for appointment row
  const classId = req.body.service_id;
  const apptDate = moment(req.body.appt_date, "dddd, MMMM Do, YYYY").format(
    "MM/DD/YYYY"
  );
  const userId = req.user.id;

  //query appointments model to find possible conflicting appointments at that time
  db.Appointments.findAll({
    where: {
      user_id: userId,
      date: {
        [Op.like]: `%${apptDate}`
      }
    },
    attributes: ["date", "service_id"],
    include:[{
      model: db.Services,
      where: {
        id: classId
      }
    }]
  }).then(function(response) {
    console.log(response);
    console.log("---------------------");
    if (response.length === 0) {
      db.Services.findAll({
        attributes: ["business_id"],
        where: {
          id: classId
        }
      }).then(function(data) {
        const businessId = data[0].dataValues.business_id;

        //Create query for the appointment
        db.Appointments.create({
          date: apptDate,
          business_id: businessId,
          user_id: userId,
          service_id: classId
        }).then(function(data) {
          console.log(data);
          res.status(200);
        });
      });
    } else {
      //show modal that says appointment at that date and time is already created
      res.status(500).send("Appointment already exists at that time");
    }
  });
});
//check if appoint is booked at current date.
//if no, book
//then run findbusiness id query and promise query to book
//if yes, error modal pops up

//getting the business id for appointment

module.exports = router;
