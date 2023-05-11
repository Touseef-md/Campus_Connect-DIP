// if(process.env.ENV==='dev')
require("dotenv").config();
const mongoose = require("mongoose");
const express = require("express");
const bodyParser = require("body-parser");
const { ObjectId } = require("mongodb");

const app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

//--------------MONGOOSE CONNECT------------

mongoose.set("strictQuery", true);

const connectionParams = {
  useNewUrlParser: true,
  useUnifiedTopology: true,
};

mongoose
  .connect(process.env.MONGOOSE_URI, connectionParams)
  .then(() => {
    console.log("Connected to Mongo DB...");
  })
  .catch((err) => {
    console.log(`Error connecting to the database. n${err}`);
  });

//---------------------SCHEMA-----------------------
const authSchema = new mongoose.Schema({
  email: String,
});
const userOrders = new mongoose.Schema({
  // _id: mongoose.Schema._id,
  userId: String,

  orders: [Object],
});
const orderSchema = new mongoose.Schema({
  userId: String,
  order: [Object],
});
const Auth = mongoose.model("Auth", authSchema);
const Orders = mongoose.model("Orders", orderSchema);
//-----------------------------------------------------
app.get("/", (req, res) => {
  Auth.find({}, (err, found) => {
    if (!err) {
      res.send(found);
    } else {
      console.log(err);
      res.send("Some error occured");
    }
  })
    .clone()
    .catch((err) => console.log("Error occured, " + err));
});

app.post("/", async (req, res) => {
  console.log(`Input userId is`);
  console.log(req.body);
  console.log(req.body["userId"]);
  try {
    let orderList = await Orders.find({ userId: req.body["userId"] });
    console.log(orderList);
    res.send(orderList);
  } catch (err) {
    console.log(err);
    res.send("Oops something went wrong while fetching the orders");
  }
});

// const user1 = new Auth({ email: "touseef.iitjmu@gmail.com" });
// user1.save().then(
//   () => {
//     console.log("User1 added successfully");
//   },
//   (err) => {
//     console.log(err);
//   }
// );
// console.log(process.env.PORT);
// console.log(process.env.MONGOOSE_URI);

app.post("/register", (req, res) => {
  console.log(req.body.email);
  if (req.body.email == "") {
    console.log("Email is empty");
    res.send("Email reached is empty");
  }

  Auth.find({ email: req.body.email }, (err, found) => {
    if (!err) {
      console.log(`This is the body ${found}`);
      if (found == "") {
        var user = new Auth({ email: req.body.email });
        user.save().then(
          (item) => {
            console.log(`User added successfully ${item}`);
            res.send(item);
          },
          (err) => {
            console.log(err);
            res.send(found);
          }
        );
        // console.log("Body is empty ");
      }
      res.send(found);
    } else {
      console.log(err);
      res.send("Some error occured");
    }
  });
});

app.post("/place-order", async (req, res) => {
  // console.log(`This is the body of place order`);
  // (_id = Schema._id),
  // console.log(req.body);
  var orderObject = {
    cart: req.body.cartitems,
    amount: req.body.amount,
    orderId: new ObjectId().toString(),
    dateTime: req.body.dateTime,
  };

  var order = new Orders({ userId: req.body.userId, order: orderObject });

  let checkUser = await Orders.findOne({ userId: req.body.userId });
  // console.log("THis is the checked user");
  // console.log(checkUser);
  if (!checkUser) {
    try {
      let response = await order.save();
      // console.log("This is the response for creating new object");
      // console.log(response);
      res.send(response);
    } catch (err) {
      console.log(err);
      console.log("OOps something went wrong");
      res.send(err);
    }
  } else {
    checkUser.order.push(orderObject);
    try {
      let response = await checkUser.save();
      // console.log("This is response for updating list");
      // console.log(response);
      res.send(response);
    } catch (err) {
      res.send(err);
      console.log("Opps, something went wrong while updating");
    }
  }
  // order
  //   .updateOne({ userId: req.body.userId }, { $push: { order: order } })
  //   .then((item) => {
  //     console.log(`Response after updating`);
  //     console.log(item);
  //     res.send(item);
  //   });
  // order.save().then((item) => {
  //   // console.log(`Response placing order ${item}`);
  //   res.send(item);
  // });
});

app.listen(3000, () => {
  console.log("Server is running");
});
