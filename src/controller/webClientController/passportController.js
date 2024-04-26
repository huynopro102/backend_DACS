const pool = require("../../models/connectDB");
const { hashedPassword } = require("../../utils/helpers")
const { promisify } = require("util");
const getConnection = promisify(pool.getConnection).bind(pool);

let loginSuccess = async (req, res) => {
  let conn; // Biến để lưu trữ kết nối

  try {
    const userEmail = req.user._json.email;
    const [existingUser] = await pool.execute("SELECT * FROM user WHERE Email = ?",[userEmail]);
    console.log("so 1")
    if (existingUser.length > 0) {
      console.log("so 2")

      // Đã tồn tại người dùng, thực hiện đăng nhập vào hệ thống
      // Trả về thông tin người dùng hoặc token JWT
      res.status(200).json({ message: "Đăng nhập thành công", user: existingUser });
    } else {
      // Nếu chưa tồn tại người dùng, tạo mới tài khoản và đăng nhập
      conn = await getConnection(); // Lấy kết nối từ pool
      await conn.beginTransaction(); // Bắt đầu transaction
      
      console.log("so 3")
      try {
        // Hash password
        const hashedPassword1 = await hashedPassword(req.user.id);
        // Thêm người dùng vào bảng user
        await conn.query("INSERT INTO user (Username, Email, Password, `Check`) VALUES (?, ?, ?, ?)", [req.user.displayName, userEmail, hashedPassword1 , 1] );
        // Thêm thông tin khách hàng vào bảng customer
        await conn.query("INSERT INTO customer (Username,IdImages) VALUES (?,?)", [req.user.displayName,req.user.photos[0].value]);

        // Commit transaction nếu mọi thứ thành công
        await conn.commit();
        res.status(201).json({ message: "Tạo tài khoản và đăng nhập thành công" });
      } catch (error) {
        await conn.rollback();
        console.error("Error inserting data:", error);
        res.status(500).json({ message: "Internal Server Error - Transaction rollback" });
      } finally {
        // Luôn phải giải phóng kết nối sau khi sử dụng
        if (conn) {
          conn.release();
        }
      }
    }
  } catch (error) {
    console.error("Error connecting to database:", error);
    res.status(500).json({ message: "Internal Server Error - Database connection" });
  }
};


module.exports = {
  loginSuccess,
};
