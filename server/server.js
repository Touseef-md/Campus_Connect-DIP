require('dotenv').config();
const express = require("express");
const bodyParser = require("body-parser");
const mongoose = require("mongoose");
const session = require("express-session");
const passport = require("passport");
const passportLocalMongooose = require("passport-local-mongoose");
const findOrCreate = require("mongoose-findorcreate");
const validator = require('validator');
const GoogleStrategy = require('passport-google-oauth20').Strategy;

var cors = require('cors');

mongoose.set('strictQuery', true);
const app = express();
app.use(cors());

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(session({
  secret: process.env.SECRET,
  resave: false,
  saveUninitialized: false
}));

app.use(passport.initialize());
app.use(passport.session());

mongoose.connect(process.env.MONGO_URI, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => {
    console.log('Connected to Mongo DB');
  })
  .catch((err) => {
    console.log("Error: ", err);
  });

const userSchema = new mongoose.Schema({
  firstname: String,
  lastname: String,
  studentid: String,
  username: {
    type: String,
    validate: [validator.isEmail, 'invalid email'],
    unique: true,
    required: 'Email address is required'
  },
  password: String,
  googleId: String,
  secret: String
});

userSchema.plugin(passportLocalMongooose);
userSchema.plugin(findOrCreate);


const User = new mongoose.model('User', userSchema);
passport.use(User.createStrategy());

passport.serializeUser(function (user, done) {
  done(null, user.id);
});

passport.deserializeUser(function (id, done) {
  User.findById(id, function (err, user) {
      done(err, user);
  });
});

passport.use(new GoogleStrategy({
  clientID: process.env.CLIENT_ID,
  clientSecret: process.env.CLIENT_SECRET,
  callbackURL: "http://localhost:3001/auth/google",
  userProfileURL: "https://www.googleapis.com/oauth2/v3/userinfo"
},
  function (accessToken, refreshToken, profile, cb) {
      console.log(profile);
      User.findOrCreate({ googleId: profile.id }, function (err, user) {
          return cb(err, user);
      });
  }
));

app.post("/register", (req, res) => {
  const newUser = new User({
    firstname: req.body.firstname,
    lastname: req.body.lastname,
    username: req.body.username,
    studentid: req.body.studentid
  });
  User.register(newUser, req.body.password, (err, user) => {
    if(err) {
      console.log(err);
      res.status(400);
      res.send("Please Enter Valid email address");
    } else {
      passport.authenticate("local")(req, res, () => {
        res.send("SUCCESSFULLY REGISTERED.")
      });
    }
  });
});

app.post("/login", function (req, res) {

  const user = new User({
      username: req.body.username,
      password: req.body.password
  });

  req.login(user, function (err) {
    console.log("login: ", user);
      if (err) {
          console.log(err);
      } else {
          passport.authenticate("local")(req, res, function () {
            res.status(200);
            res.send("success");
              // res.redirect("http://localhost:3001/account");
          });
      }
  });
});

app.listen(3000, function (req, res) {
  console.log("Server started at port 3000.");
});