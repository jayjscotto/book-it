require("dotenv").config();
const createError = require("http-errors");
const express = require("express");
const exphbs = require("hbs");
const path = require("path");
const cookieParser = require("cookie-parser");
const cookieSession = require("cookie-session");
const logger = require("morgan");
const session = require("express-session");
const passport = require("./config/passport");
const isAuthenticated = require("./config/isAuthenticated");
const moment = require("moment");

const userRouter = require("./routes/user-routes");
const apiRouter = require("./routes/api");
const facilityRouter = require("./routes/facility-routes");

const app = express();

// view engine setup
app.set("views", path.join(__dirname, "views"));
//register moment helper
exphbs.registerHelper("moment", require("helper-moment"));
exphbs.registerHelper("formatDateTime", function(date, format) {
  var date = moment(date, "H").format("h:mm a");
  return date;
});
app.set("view engine", "hbs");
app.set("view options", { layout: "layout" });

// app.engine('hbs', engines.hbs);
//middleware
app.use(logger("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser(process.env.SECRET));
app.use(
  cookieSession({
    key: "bookfit.sid.uid",
    signed: false,
    secret: process.env.SECRET,
    cookie: {
      maxAge: 2678400000 // 31 days
    }
  })
);
//session to keep track of user state
app.use(
  session({ secret: process.env.SECRET, resave: true, saveUninitialized: true })
);
app.use(passport.initialize());
app.use(passport.session());

app.use(express.static(path.join(__dirname, "/public")));

app.use("/", userRouter);
app.use("/api", apiRouter);
app.use("/facility", facilityRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get("env") === "development" ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render("error");
});

module.exports = app;
