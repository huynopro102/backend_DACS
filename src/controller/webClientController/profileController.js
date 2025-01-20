const pool = require("../../models/connectDB");
const { comparePassword, hashPassword } = require("../../utils/helpers");
const moment = require('moment');

let getProfile = async  (req, res) => {
  try {
    // Lấy thông tin của người dùng hiện tại
    const username = req.cookies.Username;

    // Truy vấn thông tin khách hàng từ bảng customer
    const [customerRows, customerFields] = await pool.execute(
      "SELECT * FROM Customer WHERE Username = ?",
      [username]
    );

    // Xử lý kết quả truy vấn để trích xuất thông tin khách hàng
    const currentUser = {
      username: customerRows[0].Username,
      customerName: customerRows[0].CustomerName,
      phoneNumber: customerRows[0].PhoneCustomer,
      address: customerRows[0].CustomerAddress,
      citizenID: customerRows[0].CitizenIdentificationCode,
      dob: moment(customerRows[0].DateOfBirth).format('DD-MM-YYYY'),
      gender: customerRows[0].Sex
    };

    // Render view và truyền biến currentUser vào
    res.render("./Client/profile.ejs", { currentUser: currentUser });
  } catch (error) {
    console.error("Error fetching customer information:", error);
    return res.status(500).json({ message: "Internal Server Error" });
  }
};

const updateAccountInfo = async (req, res) => {
  try {
    // Lấy thông tin cập nhật từ body của yêu cầu
    const { customerName, phoneNumber, address, citizenID, dob, gender } = req.body;
    
    // Lấy tên đăng nhập từ cookie
    const username = req.cookies.Username;

    // Kiểm tra xem có thông tin cập nhật nào được cung cấp không
    if (!username || (!customerName && !phoneNumber && !address && !citizenID && !gender)) {
      return res.status(400).json({ message: "Không có thông tin cập nhật hoặc tên đăng nhập không hợp lệ" });
    }

    // Xử lý ngày tháng nếu được cung cấp và hợp lệ
    let formattedDOB = null;
    if (dob) {
      if (moment(dob, 'YYYY-MM-DD', true).isValid()) {
        formattedDOB = moment(dob).format('YYYY-MM-DD');
      } else {
        formattedDOB = null; // hoặc có thể gán giá trị mặc định khác nếu cần thiết
      }
    }

    // Thực hiện cập nhật thông tin tài khoản trong bảng customer
    const updateQuery = "UPDATE Customer SET CustomerName = ?, PhoneCustomer = ?, CustomerAddress = ?, CitizenIdentificationCode = ?, DateOfBirth = ?, Sex = ? WHERE Username = ?";
    await pool.query(updateQuery, [customerName, phoneNumber, address, citizenID, formattedDOB, gender, username]);

    return res.status(200).json({ message: "Thông tin tài khoản đã được cập nhật thành công" });
  } catch (error) {
    console.error("Lỗi khi cập nhật thông tin tài khoản:", error);
    return res.status(500).json({ message: "Lỗi máy chủ nội bộ" });
  }
};


const changePassword = async (req, res) => {
  try {
    const { currentPassword, newPassword, confirmPassword } = req.body;
    const username = req.cookies.Username; // Lấy username từ cookie

    // Kiểm tra xem có dữ liệu bắt buộc được cung cấp không
    if (!username || !currentPassword || !newPassword || !confirmPassword) {
      return res.status(400).json({ message: "Missing required fields" });
    }
    // Kiểm tra xác nhận mật khẩu mới
    if (newPassword !== confirmPassword) {
      return res.status(400).json({ message: "New password and confirm password do not match" });
    }

    // Lấy thông tin người dùng từ database
    const [user, userFields] = await pool.execute("SELECT * FROM user WHERE Username = ?", [username]);

    if (user.length === 0) {
      return res.status(404).json({ message: "User not found" });
    }

    // So sánh mật khẩu hiện tại với mật khẩu trong database
    const isPasswordMatch = await comparePassword(currentPassword, user[0].Password);
    if (!isPasswordMatch) {
      return res.status(401).json({ message: "Current password is incorrect" });
    }

    // Hash mật khẩu mới
    const hashedNewPassword = await hashPassword(newPassword);

    // Update mật khẩu mới vào database
    const updateQuery = "UPDATE user SET Password = ? WHERE Username = ?";
    await pool.query(updateQuery, [hashedNewPassword, username]);

    return res.status(200).json({ message: "Password updated successfully" });
  } catch (error) {
    console.error("Error changing password:", error);
    return res.status(500).json({ message: "Internal Server Error" });
  }
};


const getOrders = async (req, res) => {
  const page = parseInt(req.query.page) || 1;
  const limit = 10;
  const offset = (page - 1) * limit;
  const token = req.cookies.Token;
  
  let customerID;
  

  const connection = await pool.getConnection(); // Lấy connection từ pool

  try {
      await connection.beginTransaction(); // Bắt đầu transaction
      

      const Username = req.cookies.Username
      const [customer] = await connection.execute("SELECT * FROM Customer WHERE Username = ?", [Username]);
      console.log(customer)
      if (customer.length === 0) {
          await connection.rollback();
          return res.status(404).json({ message: "Customer not found" });
      }

      const [rows] = await connection.execute(`
          SELECT 
              i.IDInvoice,
              i.IDCustomer,
              i.IDStaff,
              i.DateCreated,
              i.Status as InvoiceStatus,
              id.IDProduct,
              id.TotalQuantity,
              id.Price,
              d.DateCreated as DeliveryDate,
              d.DeliveryAddress,
              d.RecipientPhone,
              d.Name as RecipientName,
              d.Status as DeliveryStatus,
              d.IDStaff as DeliveryStaff
          FROM 
              invoice i
          JOIN 
              invoicedetails id ON i.IDInvoice = id.IDInvoice
          JOIN 
              deliverynotes d ON i.IDInvoice = d.IDInvoice
          WHERE 
              i.IDCustomer = ?
          ORDER BY 
              i.DateCreated DESC
          LIMIT ?, ?;
      `, [customer[0].IDCustomer, offset, limit]);

      const [countRows] = await connection.execute(`
SELECT COUNT(*) as total FROM invoice  WHERE IDCustomer = ? `, [customer[0].IDCustomer]);
      const total = countRows[0].total;
      const totalPages = Math.ceil(total / limit);

      await connection.commit(); // Commit transaction

      res.render('./Client/don_da_dat.ejs', { 
          orders: rows,
          currentPage: page,
          totalPages: totalPages 
      });

  } catch (error) {
      await connection.rollback(); // Hủy bỏ transaction nếu có lỗi
      console.error('Error fetching orders:', error);
      res.status(500).json({ message: "Internal Server Error" });
  } finally {
      connection.release(); // Trả lại connection cho pool
  }
};


module.exports = {
  getProfile,
  updateAccountInfo,
  changePassword,
  getOrders
};