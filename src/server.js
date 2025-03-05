const express = require('express')
const app = express()
const path = require("path")
const webAdmin = require("./router/webAdmin")
const webClient = require("./router/webClient")
const authGoogle = require("./router/authGoolge.js")
const configeViewEngine = require("../config/viewEngine")
const configeFileStatic = require("../config/staticFile")
const configeBodyParser = require("../config/bodyParser.js")
const cors = require("cors")
const vnPay = require("./router/vnPay.js")
require("../config/cookieParser")(app,express)
require('../config/cookieParser')(app, express);
require('./services/passport')
const {errorHandlerNotFound , errorHandler} = require("./utils/errorHandler")

  configeViewEngine(app, path, __dirname)
  configeFileStatic(app,path,__dirname)
  configeBodyParser(app)
  
app.use(cors({
  origin : ""
}));
// Handle preflight requests
app.options('*', (req, res) => {
  res.header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');
  res.header('Access-Control-Allow-Headers', 'Content-Type, Authorization');
  res.status(200).send();
});

app.locals.BASE_URL  = "https://dungchinh.onrender.com" || process.env.HOST_URL

// configure dotenv
require('dotenv').config()

const port = process.env.PORT_LOCAL || 3000

  app.use('/api/auth',authGoogle)
  // app.use('/api/zalo',zaloPay)
  app.use('/api/vnpay',vnPay)
  app.use('/',webAdmin)
  app.use('/',webClient)

  app.use(errorHandlerNotFound , errorHandler)
  app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
  })