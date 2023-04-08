require('dotenv').config()
const express = require('express')
const bodyParser = require('body-parser')
const mongoose = require("mongoose");
const cors = require('cors')

const app = express()
app.use(cors())
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
    userId: String,
    orders: { type : Array, 'default' : [] }
})

const User = new mongoose.model('User', userSchema)
const Order = new mongoose.model('Order', orderSchema)

// var user1 = new User({
//     email: '2020ucs0077@iitjammu.ac.in',
//     password: 'AppleSauce'
// })

var user2 = new User({
    email: '2020ucs0100@iitjammu.ac.in',
    password: 'ImmaBitchImmaBoss'
})

user2.save()

app.get('/test', (req, res) => {
    console.log('hi')
    console.log(req)
    res.send('Hi Touseef Bitch!!!')
})

app.post('/place-order', (req, res) => {
    console.log(req)
})
app.listen(PORT, () => {
    console.log(`Server started at port ${PORT}`)
})