const express = require('express')
const app = express()
const randToken = require("rand-token")

// configure dotenv
require('dotenv').config()

const port = process.env.PORT || 3000


app.get('/', (req, res) => {
  res.send('Hello World!')
})
var uid = require('rand-token').uid;
var token = uid(16);
console.log(randToken.generate(32))
console.log(token)
app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})