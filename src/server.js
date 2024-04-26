const express = require('express')
const app = express()
const path = require("path")
const webAdmin = require("./router/webAdmin")
const webClient = require("./router/webClient")
const authGoogle = require("./router/authGoolge.js")
const configeViewEngine = require("../config/viewEngine")
const configeFileStatic = require("../config/staticFile")
require("../config/cookieParser")(app,express)
require('../config/cookieParser')(app, express);
require('./services/passport')
const {errorHandlerNotFound , errorHandler} = require("./utils/errorHandler")

configeViewEngine(app, path, __dirname)
configeFileStatic(app,path,__dirname)


// configure dotenv
require('dotenv').config()

const port = process.env.PORT || 3000

app.use('/api/auth',authGoogle)
app.use('/',webAdmin)
app.use('/',webClient)
app.use(errorHandlerNotFound , errorHandler)

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})