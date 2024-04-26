const pool = require("../../models/connectDB");
let postCheckout = async (err, req, res, next) => {
  try {
    const {
      tenKhachHang,
      soDienThoai,
      diaChi,
      totalPrice,
      cartItems,
      tongsoluong,
    } = req.body;
    console.log(req.body);
    let totalPriceDb = 0;
    const [user, userFields] = await pool.execute(
      "select * from user where Username = ? ",
      [req.payload.userID.trim()]
    );
    if (user.length > 0) {
      if (cartItems) {
        Promise.all( cartItems.map((item) => { return new Promise(async (resolve, reject) => {
              try {
                const [products, FieldProducts] = await pool.execute("select * from product where IDProduct = ?",[item.IDProduct]);
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
              
              return res.status(200).json({ message: "thanh toán thành công" });
            } else {
              console.log("2");
              return res
                .status(403)
                .json({ message: "vui lòng ko thay đổi thông tin giá sản phẩm khi thanh toán" });
            }
          })
          .catch((error) => {
            console.log(error); // Xử lý lỗi nếu có
          });
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

module.exports = {
  getCheckout,
  postCheckout,
};
