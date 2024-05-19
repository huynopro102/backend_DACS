const express = require('express');
const router = express.Router();
const controllerSgin = require("../controller/webClientController/signController")
const controllerHome = require("../controller/webClientController/homeController")
const controllerRegister = require("../controller/webClientController/registerController")
const controllerForgotPassword = require("../controller/webClientController/ForgotPasswordController")
const controllerShop = require("../controller/webClientController/shopController")
const controllerContact = require("../controller/webClientController/contactController")
const controllerBlog = require("../controller/webClientController/blogController")
const controllerCart = require("../controller/webClientController/cartController")
const controllerCheckout = require("../controller/webClientController/checkoutController")
const controllerGuild = require("../controller/webClientController/guildController")
const controllerProfile = require("../controller/webClientController/profileController")
const {verifyAccessToken ,verifyAccessTokenCheckout} = require("../utils/jwt_services")

// get sign 
router.get("/signin" , controllerSgin.getSign)
router.post("/signin"  ,controllerSgin.postSign)

// get home 
router.get("/home" ,controllerHome.getHome)

// post get register 
router.get("/register",controllerRegister.getRegister)
router.post("/register",controllerRegister.postRegister)

// get forgotpassword
router.get("/forgotpassword" , controllerForgotPassword.getForgotPassword)

// get blog
router.get("/blog" , controllerBlog.getBlog)

// get contact
router.get("/contact" , controllerContact.getContact)
router.post("/sendmail", controllerContact.sendEmail);

// get shop
router.get("/shop" , controllerShop.getShop)

// get cart
router.get("/cart", controllerCart.getCart) 

// get checkout 
router.get("/checkout" ,controllerCheckout.getCheckout ) 
router.post("/checkout" , verifyAccessTokenCheckout ,controllerCheckout.postCheckout ) 

// get guild
router.get("/guild" ,controllerGuild.getGuild)

// get profile
router.get("/profile" , verifyAccessToken , controllerProfile.getProfile)
router.post("/editprofile" , verifyAccessToken , controllerProfile.updateAccountInfo)
router.post("/changepassword" , verifyAccessToken , controllerProfile.changePassword)
module.exports = router;