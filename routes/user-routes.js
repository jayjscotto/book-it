const express = require("express");
const router = express.Router();
const path = require("path");
// Requiring our models for syncing
const db = require(".././models");
const Sequelize = require("sequelize");
const Op = db.Sequelize.Op;
const moment = require("moment");


//Require middleware for checking if a user is logged in
const isAuthenticated = require("../config/isAuthenticated");

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
  const searchTerm = req.params.searchTerm;
  const searchParam = req.params.searchParam;
  console.log(searchParam);

  db.Business.findAll({
    where: {
      [Op.or]: {
        name: {
          [Op.like]: `%${searchTerm}%`
        },
        city: {
          [Op.like]: `%${searchTerm}%`
        },
        state: {
          [Op.like]: `%${searchTerm}%`
        },
        zipcode: {
          [Op.like]: `%${searchTerm}%`
        }
      }
    }
  })
    .then(function(results) {
      console.log(results);

      if (results.length === 0) {
        return res.render("search-error", {username: true});
      }
      const searchRes = {
        gym: results,
        username: true
      };
      res.render("usersearch", searchRes);
    })
    .catch(err => {
      if (err) {
        res.render("error", {username: true});
      }
    });
});


//view my appointments route
router.get("/my-bookfit-appts", isAuthenticated, (req, res) => {
  console.log(req.user);
  db.Appointments.findAll({
    where: {
      user_id: req.user.id
    },
    include: [
      {
        model: db.Business,
        where: { id: Sequelize.col('business_id')}
      },
      {
        model: db.Services,
        where: { id: Sequelize.col('service_id')}
      }
    ],
    order: [["date"]]
  }).then((data) => {
    console.log(data);
    //define handlebars object
    const myAppointments = {
      appointment: [],
      pastAppointment: [],
      username: true
    };

    //iterate over response object from db
    for(let appt in data) {
      //get the difference in days between today 
      let num = moment().diff(data[appt].date, "days")
      console.log(num)
      //if the difference is a negative number
      //ie. has the day not yet already passed
      if (num <= 0) {
        console.log(`appt ${data[appt]} ${appt}`);
        //then, push the appointment object to the appointments array
        myAppointments.appointment.push(data[appt]);
      } else {
        //otherwise, push the appointment object to the past appointments array
        myAppointments.pastAppointment.push(data[appt]);
      }
    }

    console.log(myAppointments);

    res.render("myappointments", myAppointments)
  }).catch(err => {
    if (err) {
      res.render("error", {username: true});
    }
  });
});

module.exports = router;
