const pool = require("../../models/connectDB");
const {validateRegistration , hashPassword} = require("../../utils/helpers");
const { promisify } = require("util");
const getConnection = promisify(pool.getConnection).bind(pool);


let getRegister = (req, res) => {
  res.render("./Client/register.ejs");
};

let postRegister = async (req, res) => {
  try {
    const { firstName, lastName, email, password } = req.body;
    console.log(req.body)
    const result = validateRegistration(firstName, lastName, email, password);

    if (result.success) {
      const conn = await pool.getConnection();
      await conn.beginTransaction();

      try {
        // Kiểm tra trùng lặp dựa trên cả username và email
        const [doubleCheck, doubleCheckFields] = await pool.execute(
          "SELECT * FROM user WHERE Username = ? OR Email = ?",
          [(firstName + " " + lastName).trim(), email]
        );
        if (doubleCheck.length > 0) {
          console.log(doubleCheck[0]);
          return res.status(409).json({ message: "Tên người dùng hoặc email đã được sử dụng" });
        } else {
          let hash = null;
          await hashPassword(password)
            .then(data => {
              hash = data;
            })
            .catch(err => {
              throw err;
            });
        
          // Thêm người dùng vào bảng user
          const userQuery =
            "INSERT INTO user (Username, Email, Password, `Check`) VALUES (?, ?, ?, ?)";
          await conn.query(userQuery, [
            (firstName + " " + lastName).trim(),
            email,
            hash,
            1,
          ]);

          // Thêm thông tin khách hàng vào bảng customer
          const customerQuery =
            "INSERT INTO customer (Username, CustomerName, PhoneCustomer, CustomerAddress, CitizenIdentificationCode, DateOfBirth, Sex, IdImages) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?)";
          await conn.query(customerQuery, [
            (firstName + " " + lastName).trim(),
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
          ]);

          console.log("Committing the transaction.");

          // Commit transaction nếu mọi thứ thành công
          await conn.commit();
          conn.release();
          res.status(201).json({ message: "Đăng ký thành công" });
        }
      } catch (error) {
        await conn.rollback();
        console.error("Error inserting data:", error);
        res
          .status(500)
          .json({ message: "Internal Server Error - Transaction rollback" });
      }
    } else {
      // Nếu có lỗi, xác định lỗi và trả về status code và thông báo lỗi phù hợp
      let statusCode;
      switch (result.error.field) {
        case "all":
          statusCode = 400; // Bad Request
          break;
        case "password":
          statusCode = 422; // Unprocessable Entity
          break;
        case "email":
          statusCode = 409; // Conflict
          break;
        default:
          statusCode = 500; // Internal Server Error
      }
      res.status(statusCode).json({ message: result.error.message });
    }
  } catch (error) {
    console.error("Error connecting to database:", error);
    res
      .status(500)
      .json({ message: "Internal Server Error - Database connection" });
  }
};

module.exports = {
  getRegister,
  postRegister,
};
