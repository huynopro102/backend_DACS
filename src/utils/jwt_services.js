const jwt = require("jsonwebtoken");
require("dotenv").config();


const generateAccessToken = async (userID,role) => {
  try {
    return new Promise((resolve, reject) => {
      const payload = {
        userID,
        role,
      };
      const secret = process.env.ACCESS_TOKEN_SECRET;
      const options = {
        expiresIn: "2m",
      };
      jwt.sign(payload, secret, options, (err, token) => {
        if (err) reject(err);
        resolve(token);
      });
    });
  } catch (error) {
    throw error;
  }
};


const verifyAccessToken = (req, res, next) => {
    if (!req.cookies.Token) return next(new Error("Token Invalid"));
    const token = req.cookies.Token;
    jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, (err, payload) => {
        console.log(err)
        if (err) return next(err);
        req.payload = payload;
        next();
    });
};

module.exports = {
  generateAccessToken ,
  verifyAccessToken 
};
