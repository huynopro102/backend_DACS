const pool = require("../../models/connectDB");
let postCheckout = async (req, res, next) => {
  try {
    const {
      tenKhachHang,
      soDienThoai,
      diaChi,
      totalPrice,
      cartItems,
      tongsoluong,
    } = req.body;

    let totalPriceDb = 0;
    const [user, userFields] = await pool.execute(
      "select * from user where Username = ? ",
      [req.payload.userID.trim()]
    );

    if (user.length > 0) {
      if (cartItems) {
        Promise.all(
          cartItems.map((item) => {
            return new Promise(async (resolve, reject) => {
              try {
                const [products, FieldProducts] = await pool.execute(
                  "select * from product where IDProduct = ?",
                  [item.IDProduct]
                );
                totalPriceDb += item.soluong * products[0].Price;
                resolve(products[0]);
              } catch (error) {
                reject(error);
              }
            });
          })
        )
          .then((list_product) => {
            if (parseFloat(totalPriceDb) === parseFloat(totalPrice)) {
              req.user = user[0];
              next();
            } else {
              return res.status(403).json({
                message:
                  "vui lòng ko thay đổi thông tin giá sản phẩm khi thanh toán",
              });
            }
          })
          .catch((error) => {});
      }
    }
  } catch (error) {
    if (error.status && error.message) {
      res.status(error.status).json({ message: error.message });
    } else {
      next(error);
    }
  }
};

let getCheckout = (req, res) => {
  res.render("./Client/checkout.ejs");
};


let postCheckout2 = async (req, res) => {
  let connection;
  try {
    // Lấy kết nối từ pool
    connection = await pool.getConnection();
    await connection.beginTransaction();

    const {
      tenKhachHang,
      soDienThoai,
      diaChi,
      totalPrice,
      cartItems,
      tongsoluong,
    } = req.body;
    const { Username, Email, Password, Check, id } = req.user;

    const [customer, customerFields] = await connection.execute(
      "SELECT * FROM customer WHERE Username = ?",
      [Username]
    );

    if (customer.length > 0) {
      const currentDate = new Date().toISOString().slice(0, 10);

      // Thêm thông tin hóa đơn vào bảng invoice
      const [invoiceResult] = await connection.execute(
        "INSERT INTO invoice (IDCustomer, IDStaff , DateCreated, Status) VALUES (?, ?, ?, ?)",
        [customer[0].IDCustomer , null, currentDate, 1]
      );
      const invoiceId = invoiceResult.insertId;

      // Thêm thông tin chi tiết hóa đơn vào bảng invoiceDetail
      for (const item of cartItems) {
        await connection.execute(
          "INSERT INTO invoicedetails (IDInvoice , IDProduct, TotalQuantity, Price) VALUES (?, ?, ?, ?)",
          [invoiceId, item.IDProduct, ( parseInt(item.soluong) * parseInt(item.Price) ), item.Price]
        );
      }

      // Thêm thông tin vận chuyển vào bảng deliveryNotes
      await connection.execute(
        "INSERT INTO deliverynotes (IDInvoice,DateCreated,DeliveryAddress,RecipientPhone,Status,IDStaff) VALUES (?,?,?,?,?,?)",
        [invoiceId,currentDate,diaChi,soDienThoai,1,null]
      );

      // Commit giao dịch
      await connection.commit();

      return res.status(200).json({ message: "thanh toán thành công" });
    } else {
      return res
        .status(500)
        .json({ message: "Đã xảy ra lỗi trong quá trình thanh toán" });
    }
  } catch (error) {
    // Nếu có lỗi xảy ra, rollback giao dịch
    if (connection) {
      await connection.rollback();
    }
    console.error("Error during transaction:", error);
    return res
      .status(500)
      .json({ message: "Đã xảy ra lỗi trong quá trình thanh toán" });
  } finally {
    // Đảm bảo trả kết nối về pool sau khi sử dụng
    if (connection) {
      connection.release();
    }
  }
};





module.exports = {
  getCheckout,
  postCheckout,
  postCheckout2,
};
