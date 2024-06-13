const { content_v2_1 } = require("googleapis");
const pool = require("../../models/connectDB");
const {hashPassword} = require("../../utils/helpers")


let postAdminV1AccountDelete = async (req,res) =>{
  
  const {Username} = req.body
  console.log(Username)
  const connection = await pool.getConnection()
  try {
    await connection.beginTransaction()

    if (!Username) {
      throw new Error("Missing userId or ConfirmPassWord");
    }
    const [user1, fields1] = await connection.execute("SELECT * FROM `user` WHERE `Username` = ?",[Username]);

    if(user1[0].Check ===1){
      const[user,fields] = await connection.execute("UPDATE user set `Check` = ? where `Username` = ?",[0,Username])

      if (user.affectedRows === 0) {
        throw new Error("User not found or password not updated");
      }
  
      await connection.commit(); // Commit transaction
      return res.status(200).json({ message: "check successfully" });
    }

    const[user,fields] = await connection.execute("UPDATE user set `Check` = ? where `Username` = ?",[1,Username])

    if (user.affectedRows === 0) {
      throw new Error("User not found or password not updated");
    }

    await connection.commit(); // Commit transaction
    return res.status(200).json({ message: "check successfully" });

  } catch (error) {
      await connection.rollback(); // Rollback transaction nếu có lỗi
      console.error('Error during transaction', error);
      res.status(500).json({ error: error.message });
  }finally{
    connection.release()
  }

}

let postAdminV1AccountsEdit = async (req, res) => {
    const connection = await pool.getConnection();
    try {
      await connection.beginTransaction();
      const { userId, ConfirmPassWord } = req.body;
      console.log(userId , ConfirmPassWord)
  
      if (!userId || !ConfirmPassWord) {
        throw new Error("Missing userId or ConfirmPassWord");
      }
  
      // Mã hóa mật khẩu
      const hashedPassword = await hashPassword(ConfirmPassWord);
  
      // Cập nhật mật khẩu cho người dùng
      const [result] = await connection.execute("UPDATE user SET Password = ? WHERE Username = ?",[hashedPassword, userId]);
  
      if (result.affectedRows === 0) {
        throw new Error("User not found or password not updated");
      }
  
      await connection.commit(); // Commit transaction
      res.status(200).json({ message: "Password updated successfully" });
    } catch (error) {
      await connection.rollback(); // Rollback transaction nếu có lỗi
      console.error('Error during transaction', error);
      res.status(500).json({ error: error.message });
    } finally {
      connection.release(); // Giải phóng kết nối
    }
  };

let getAdminV1Accounts = async (req, res) => {
  try {
    let _page = req.query.page ? req.query.page : 1;
    let limit = 5;
    let start = (_page - 1) * limit;
    // let totalRow = 20;
    let name = req.query.name;

    // total tổng các item trong database
    const [total, fields] = await pool.execute(
      "select count(*) as total from user"
    );
    let totalRow = total[0].total;

    // tong so trang
    let totalPage = Math.ceil(totalRow / limit);

    const [customer, CustomerField] = await pool.execute(
      "select * from customer"
    );

    //
    if (name) {
      const [rows, fields] = await pool.execute(
        "SELECT * FROM `user` where `username` like ? limit ? , ? ",
        [`%${name}%`, start, limit]
      );
      res.render("accounts.ejs", {
        dataUser: rows ? rows : [],
        totalPage: totalPage,
        page: parseInt(_page),
        totalCustomer: customer,
      });
    } else {
      const [rows, fields] = await pool.execute(
        "SELECT * FROM `user` limit " + start + "," + limit
      );
      res.render("./Admin/accounts/accounts.ejs", {
        dataUser: rows ? rows : [],
        totalPage: totalPage,
        page: parseInt(_page),
        totalCustomer: customer,
      });
    }
  } catch (err) {
    console.error("Error executing query", err);
    res.status(500).json({ message: "Internal Server Error" });
  }
};

let postAdminV1Accounts = async (req, res) => {
  try {
    console.log("day la body delete ", req.body.Username);
    if (req.body.id) {
      // Kiểm tra xem người dùng có tồn tại không
      const user = await pool.query("SELECT * FROM user WHERE Username = $1", [
        req.body.Username,
      ]);
      if (user.rows.length > 0) {
        console.log(user);
        // Nếu người dùng tồn tại, thực hiện xóa
        const result = await pool.query(
          "DELETE FROM user WHERE Username = $1",
          [req.body.Username]
        );
        if (result.rowCount > 0) {
          // Xóa thành công
          res.status(200).json({ message: "User deleted successfully" });
        } else {
          // Người dùng không tồn tại
          res.status(404).json({ message: "User not found" });
        }
      } else {
        // Người dùng không tồn tại
        res.status(404).json({ message: "User not found" });
      }
    } else {
      // Không có id được cung cấp
      res.status(400).json({ message: "Bad Request: Missing user id" });
    }
  } catch (err) {
    // Xử lý lỗi nếu có
    console.error("Error executing query", err);
    res.status(500).json({ message: "Internal Server Error" });
  }
};

let getAdminV1AccountsEdit = async (req, res) => {
  const id = req.params.id;
  console.log("id ", id);
  return await res.render("./Admin/accounts/accountsEdit.ejs");
};

let getAdminV1AccountsCreate = (req, res) => {
  res.render("./Admin/accounts/accountsCreate.ejs");
};

module.exports = {
  getAdminV1Accounts,
  postAdminV1Accounts,
  getAdminV1AccountsEdit,
  getAdminV1AccountsCreate,
  postAdminV1AccountsEdit,
  postAdminV1AccountDelete
};