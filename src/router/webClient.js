const express = require('express');
const router = express.Router();
const controllerGetSgin = require("../controller/webClientController/signController")
const controllerGetHome = require("../controller/webClientController/homeController")
const controllerGetRegister = require("../controller/webClientController/registerController")
const controllerGetForgotPassword = require("../controller/webClientController/ForgotPasswordController")
const controllerGetShop = require("../controller/webClientController/shopController")
const controllerGetContact = require("../controller/webClientController/contactController")
const controllerGetBlog = require("../controller/webClientController/blogController")

// get sign 
router.get("/signin", controllerGetSgin.getSign)

// get home 
router.get("/home",controllerGetHome.getHome)

// get register 
router.get("/register",controllerGetRegister.getRegister)

// get forgotpassword
router.get("/forgotpassword" , controllerGetForgotPassword.getForgotPassword)

// get blog
router.get("/blog" , controllerGetBlog.getBlog)

// get contact
router.get("/contact" , controllerGetContact.getContact)

// get shop
router.get("/shop" , controllerGetShop.getShop)


module.exports = router;