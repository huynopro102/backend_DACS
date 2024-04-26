const router = require("express").Router();
const passport = require("passport");
const { loginSuccess } = require("../controller/webClientController/passportController");

// localhost:8082/api/auth/google
router.get( "/google", passport.authenticate("google", { scope: ["profile" ,"email" ], session: false }) );

router.get("/google/callback" ,(req,res,next) => {
 
  passport.authenticate("google", async (err , profile) => {
    if(err){
      console.log(err)
      return err
    }
   req.user = profile
   next()
 }) (req, res, next) 
} 
// , (req,res,next)=>{
//   res.redirect(`http://localhost:8082/login-success/${req.user.id}`)
//   next()
// } 
,
loginSuccess );


module.exports = router;
