const jwt = require("jsonwebtoken");
require("dotenv").config();

const generateAccessToken = async (userID, role) => {
  try {
    return new Promise((resolve, reject) => {
      const payload = {
        userID,
        role,
      };
      const secret = process.env.ACCESS_TOKEN_SECRET;
      const options = {
        expiresIn: "1h",
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
  if (!req.cookies.Token) res.status(409).json({message:"bạn phải đăng nhập"});
  jwt.verify( req.cookies.Token , process.env.ACCESS_TOKEN_SECRET , (err, payload) => {
    if (err && err.name === 'TokenExpiredError') return res.status(400).json({message:"token hết hạn bạn phải đăng nhập"});
    if (err && err.name === 'JsonWebTokenError') return res.status(410).json({message:"invalid signature token ko hợp lệ"});
      req.payload = payload;
      next();
    }
  );
};


const verifyAccessTokenCheckout = (req, res, next) => {
  if (!req.cookies.Token) res.status(409).json({message:"bạn phải đăng nhập trước khi đặt hàng"});
  jwt.verify( req.cookies.Token , process.env.ACCESS_TOKEN_SECRET , (err, payload) => {
    if (err && err.name === 'TokenExpiredError') return res.status(400).json({message:"token hết hạn bạn phải đăng nhập"});
    if (err && err.name === 'JsonWebTokenError') return res.status(410).json({message:"invalid signature token ko hợp lệ"});
      req.payload = payload;
      next(payload);
    }
  );
};



module.exports = {
  generateAccessToken,
  verifyAccessToken, 
  verifyAccessTokenCheckout
  
};
