const express = require('express')
const app = express()
const path = require("path")
const webAdmin = require("./router/webAdmin")
const configeViewEngine = require("../config/viewEngine")
const configeFileStatic = require("../config/staticFile")
const configeBodyParser = require("../config/bodyParser")
configeViewEngine(app, path, __dirname)
configeFileStatic(app,path,__dirname)
configeBodyParser(app)
// configure dotenv
require('dotenv').config()


const port = process.env.PORT || 3000

app.use('/',webAdmin)


app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})