const pool = require("../../models/connectDB");
const { hashPassword } = require("../../utils/helpers");
const {generateAccessToken} = require("../../utils/jwt_services")
const { promisify } = require("util");
const getConnection = promisify(pool.getConnection).bind(pool);
require("dotenv").config()

let loginSuccess = async (req, res) => {
  let conn; // Biến để lưu trữ kết nối

  try {
    console.log(req.user)
    const userEmail = req.user._json.email;
    const { id } = req.user;
    const family_name = req.user._json.family_name;
    const connection = await pool.getConnection(); // Lấy kết nối từ pool


    const [existingUser] = await connection.query("SELECT * FROM user ");

    
    if (existingUser.length > 0) {
      const accessToken = await generateAccessToken(existingUser[0].Username , existingUser[0].Check);
      res.cookie('Token', accessToken ); 
      res.cookie('Username', existingUser[0].Username.toString() ); 
      return res.redirect("/home");
    }
    

    try {

      // Hash password
      const hashedPassword1 = await hashPassword(id);
   
      // Thêm người dùng vào bảng user
      await connection.query(
        "INSERT INTO user (Username, Email, Password, `Check`, id) VALUES (?, ?, ?, ?, ?)",
        [family_name, userEmail, hashedPassword1, 1, id]
      );

      // Thêm tạo bảng images
      await connection.query(
        "INSERT INTO images (NameImages, UrlImages) VALUES (?, ?)",
        [family_name, req.user.photos[0].value]
      );

      // Lấy id của bản ghi vừa được thêm vào bảng images
      const [imageResult] = await connection.query(
        "SELECT LAST_INSERT_ID() as lastId"
      );

      // Lấy id của bản ghi images vừa thêm
      const imageId = imageResult[0].lastId;

      // Thêm thông tin khách hàng vào bảng customer và gán id của bản ghi images vào cột IdImages
      await connection.query(
        "INSERT INTO customer (Username, IdImages) VALUES (?, ?)",
        [family_name, imageId]
      );

      // Commit transaction nếu mọi thứ thành công
      await connection.commit();
      res
        .status(201)
        .json({ message: "Tạo tài khoản và đăng nhập thành công" });
    } catch (error) {
      await connection.rollback();
      console.error("Error inserting data:", error);
      res
        .status(500)
        .json({ message: "Internal Server Error - Transaction rollback" });
    } finally {
      // Luôn phải giải phóng kết nối sau khi sử dụng
      if (connection) {
        connection.release();
      }
    }
  } catch (error) {
    console.error("Error connecting to database:", error);
    res
      .status(500)
      .json({ message: "Internal Server Error - Database connection" });
  }
};

module.exports = {
  loginSuccess,
};
