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
const controllerLogout = require("../controller/webClientController/logoutController")
const controllerDetailProduct = require("../controller/webClientController/detailproductController")
const detailforgotpassword = require("../controller/webClientController/detailforgotpassword")

const {verifyAccessToken ,verifyAccessTokenCheckout  } = require("../utils/jwt_services")

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
router.post("/forgotpassword" , controllerForgotPassword.postForgotPassword);
  
// detail forgot password
router.get("/detaiforgotpassword" , detailforgotpassword.getdetailforgotpassword)
router.post("/detaiforgotpassword" , detailforgotpassword.postdetailforgotpassword)

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
router.post("/checkout" , verifyAccessTokenCheckout , controllerCheckout.postCheckout , controllerCheckout.postCheckout2 , controllerCheckout.thanhtoanonline ) 

// checkout successfully

router.get("/api/vnpay/vnpay_return" , controllerCheckout.getCheckoutSuccess)

// get guild
router.get("/guild" ,controllerGuild.getGuild)


// get profile
router.get("/profile" , verifyAccessToken , controllerProfile.getProfile)
router.post("/editprofile" , verifyAccessToken , controllerProfile.updateAccountInfo)
router.post("/changepassword" , verifyAccessToken , controllerProfile.changePassword)



// post logout
router.post("/logout", verifyAccessToken , controllerLogout.postLogout  )

// detailproduct
router.get("/detailproduct/:productId" , controllerDetailProduct.getDetailProduct)



// đơn hàng đã đặt
router.get("/dondadat", verifyAccessToken ,controllerProfile.getOrders )


module.exports = router;