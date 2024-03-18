const express = require('express')
const app = express()
const path = require("path")
const configeViewEngine = require("../config/viewEngine")
const configeFileStatic = require("../config/staticFile")
configeViewEngine(app, path, __dirname)
configeFileStatic(app,path,__dirname)
// configure dotenv
require('dotenv').config()

const port = process.env.PORT || 3000


app.get('/', (req, res) => {
  res.render("hello.ejs")
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})