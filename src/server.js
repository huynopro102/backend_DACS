const express = require('express')
const app = express()
const path = require("path")
const webAdmin = require("./router/webAdmin")
const webClient = require("./router/webClient")
const configeViewEngine = require("../config/viewEngine")
const configeFileStatic = require("../config/staticFile")
require("../config/cookieParser")(app,express)
require('../config/cookieParser')(app, express);
const {errorHandlerNotFound , errorHandler} = require("./utils/errorHandler")

configeViewEngine(app, path, __dirname)
configeFileStatic(app,path,__dirname)


// configure dotenv
require('dotenv').config()

const port = process.env.PORT || 3000

app.use('/',webAdmin)
app.use('/',webClient)
app.use(errorHandlerNotFound , errorHandler)

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})