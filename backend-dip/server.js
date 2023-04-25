require('dotenv').config()
const express = require('express')
const bodyParser = require('body-parser')
const mongoose = require("mongoose");
const cors = require('cors')

const app = express()
app.use(cors())
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: true }))
const PORT = process.env.PORT
mongoose.connect(process.env.MONGO_URI, { useNewUrlParser: true, useUnifiedTopology: true }).then(() => {
    console.info("Connected to DB");
}).catch((e) => {
    console.log("Error: ", e);
});

const userSchema = new mongoose.Schema({
    email: String,
    password: String,
})

const orderSchema = new mongoose.Schema({
    orders: { type : Array, 'default' : [] },
    amount: Number,
    time: String
})

const User = new mongoose.model('User', userSchema)
const Order = new mongoose.model('Order', orderSchema)

// var user1 = new User({
//     email: '2020ucs0077@iitjammu.ac.in',
//     password: 'AppleSauce'
// })

// var user2 = new User({
//     email: '2020ucs0100@iitjammu.ac.in',
//     password: 'ImmaBitchImmaBoss'
// })

// user2.save()

app.post('/test', (req, res) => {
    console.log(req)
    res.send(req.body)
})

app.post('/register', async (req, res) => {
    try {
        var user = new User({
            email: req.body.email
        })
        var result = await user.save()
        console.log('User Registered Successfully')
        res.send('Successfully registered.')
    } catch(error) {
        console.error(error)
        res.send('Failed to register, please try again.')
    }
})
app.post('/place-order', async (req, res) => {
    try {
        var order = new Order({
            orders: req.body.cartitems,
            amount: req.body.amount,
            time: req.body.dateTime
        })
        var result = await order.save()
        console.log('Order Placed Successfully.')
        res.send(result._id)
    } catch (error) {
        console.error(error)
        res.send('Failed to place order, please retry.')
    }
})

app.get('/get-orders', async (req, res) => {
    console.log(req.body)
    var currentOrders = await Order.find({})
    var deletedItems = await Order.deleteMany({})
    res.send(currentOrders)
})
app.listen(PORT, () => {
    console.log(`Server started at port ${PORT}`)
})