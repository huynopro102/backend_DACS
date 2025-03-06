const pool = require("../../models/connectDB");
const { hashPassword , comparePassword } = require("../../utils/helpers");
const {generateAccessToken } = require("../../utils/jwt_services")
const { promisify } = require("util");
const getConnection = promisify(pool.getConnection).bind(pool);
require("dotenv").config()

let loginSuccess = async (req, res) => {
  let conn; // Biến để lưu trữ kết nối

  try {
    console.log(req.user)
    const {email , family_name} = req.user._json
    const { id } = req.user;
    
    const connection = await pool.getConnection(); // Lấy kết nối từ pool

    const [existingUser] = await connection.query("SELECT * FROM User where email = ?",[email]);


    if(existingUser.length > 0 && existingUser[0].google_id === null){

      await connection.query("UPDATE User SET google_id = ? WHERE email = ?",[id,email]);
      
      console.log("user ton tai")
      const accessToken = await generateAccessToken(existingUser[0].Username , existingUser[0].Check);
      res.cookie('Token', accessToken ); 
      res.cookie('Username', existingUser[0].Username.toString() ); 
      return res.redirect("/home");
      
    }else if (existingUser.length > 0 && existingUser[0].google_id !== null){

      console.log("user ton tai")
      const accessToken = await generateAccessToken(existingUser[0].Username , existingUser[0].Check);
      res.cookie('Token', accessToken ); 
      res.cookie('Username', existingUser[0].Username.toString() ); 
      return res.redirect("/home");

    }

    try {

      const hashedPassword1 = await hashPassword(id);
      
      let random = Math.floor(Math.random() * 1000000);

      const newUserName = family_name+"_"+random;

      await connection.query(
        "INSERT INTO User (Username, Email, Password, `Check`, google_id) VALUES (?, ?, ?, ?, ?)", [newUserName, email , hashedPassword1, 1, id]
      );


      await connection.query(
        "INSERT INTO Images (NameImages, UrlImages) VALUES (?, ?)", [newUserName, req.user.photos[0].value] );


      const [imageResult] = await connection.query( "SELECT LAST_INSERT_ID() as lastId" );


      const imageId = imageResult[0].lastId;

      await connection.query(
        "INSERT INTO Customer (Username, IdImages) VALUES (?, ?)",
        [newUserName, imageId]
      );

      await connection.commit();

      const [newUser] = await connection.query("select * from User where Username =? && google_id = ? && email = ? ",[newUserName,id,email]);

      if(newUser.length === 0){
        await connection.rollback();
        console.error("Error inserting data:", error);
        res
          .status(500)
          .json({ message: "Internal Server Error - Transaction rollback" });
      }else{

      const accessToken = await generateAccessToken(newUser.Username , newUser.Check);
      res.cookie('Token', accessToken ); 
      res.cookie('Username', newUser.Username.toString() ); 
      return res.redirect("/home");
      }

    

    } catch (error) {
      await connection.rollback();
      console.error("Error inserting data:", error);
      res
        .status(500)
        .json({ message: "Internal Server Error - Transaction rollback" });
    } finally {
      if (connection) {
        connection.release();
      }
    }
  } catch (error) {
      await connection.rollback();
      console.error("Error inserting data:", error);
    res
      .status(500)
      .json({ message: "Internal Server Error - Transaction rollback" });
  }
};

module.exports = {
  loginSuccess,
};
