const pool = require("../../models/connectDB");


let getAdminV1Supplier = async (req,res) =>{
    try {
        let _page = req.query.page ? req.query.page : 1;
        let limit = 5;
        let start = (_page - 1) * limit;
        // let totalRow = 20;
        let name = req.query.name;
      
        // total tổng các item trong database
        const [total, fields] = await pool.execute("select count(*) as total from supplier");
        let totalRow = total[0].total;
      
        // tong so trang
        let totalPage = Math.ceil(totalRow / limit);
      
        //
        if (name) {
          const [rows, fields] = await pool.execute(
            "SELECT * FROM `supplier` where `SupplierName` like ? limit ? , ? ",
            [`%${name}%`, start, limit]
          );
          res.render("./Admin/supplier/supplier.ejs", {
            dataUser: rows ? rows : [],
            totalPage: totalPage,
            page: parseInt(_page),
          });
        } else {
          const [rows, fields] = await pool.execute(
            "SELECT * FROM `supplier` limit " + start +" , " + limit );
          res.render("./Admin/supplier/supplier.ejs", {
            dataUser: rows ? rows : [],
            totalPage: totalPage,   
            page: parseInt(_page),
          });
        }
    } catch (err) {
        console.error('Error executing query', err);
        res.status(500).json({ message: 'Internal Server Error' });
    }
}

let getAdminV1SupplierCreate = async (req,res) =>{
    res.render("./Admin/supplier/supplierCreate.ejs")
}

let getAdminV1SupplierEdit = async (req,res) =>{
    const itemId = req.params.id;
    const [rows, fields] = await pool.execute(
      "SELECT * FROM `supplier` where IDSupplier = ? ",
      [itemId]
    );
  
    res.render("./Admin/supplier/supplierEdit.ejs",{
        row: rows,
    })
}

let postAdminV1SupplierCreate = async (req, res) => {
  try {
      const { SupplierName, SupplierAddress, PhoneSupplier, EmailSupplier } = req.body;
      // Chỉ kiểm tra trùng lặp đối với tên nhà cung cấp và email
      const sqlCheckDuplicate = "SELECT * FROM supplier WHERE SupplierName = ? OR EmailSupplier = ?";
      const [duplicateRows] = await pool.execute(sqlCheckDuplicate, [SupplierName, EmailSupplier]);
      if (duplicateRows.length > 0) {
          return res.status(409).json({ message: "Duplicate data found for Supplier Name or Email" });
      }

      const sqlInsert = "INSERT INTO supplier (SupplierName, SupplierAddress, PhoneSupplier, EmailSupplier) VALUES (?, ?, ?, ?)";
      await pool.execute(sqlInsert, [SupplierName, SupplierAddress, PhoneSupplier, EmailSupplier]);
      return res.status(201).json({ message: "Created Successfully" });
  } catch (error) {
      console.error('Error creating supplier:', error);
      res.status(500).json({ message: "Internal Server Error" });
  }
};

let postAdminV1SupplierEdit = async (req, res) => {
  try {
    const itemId = req.params.id;
    const { UserName, Phone, Address, Email } = req.body;

    if (!UserName || !Phone || !Address || !Email || !itemId) {
      console.log("Thông tin không đủ hoặc không hợp lệ.");
      return res
        .status(400)
        .json({ message: "Thông tin không đủ hoặc không hợp lệ." });
    }
    const [rows, fields] = await pool.execute(
      "SELECT * FROM `supplier` WHERE IDSupplier = ?",
      [itemId]
    );

    if (!rows || rows.length === 0) {
      console.log("Nhà cung cấp không tồn tại.");
      return res.status(404).json({ message: "Nhà cung cấp không tồn tại." });
    }

    const [existingRows, existingFields] = await pool.execute(
      "SELECT * FROM `supplier` WHERE SupplierName = ?",
      [UserName]
    );

    if (existingRows && existingRows.length > 0 && existingRows[0].IDSupplier !== itemId) {
      console.log("Tên nhà cung cấp đã tồn tại.");
      return res.status(400).json({ message: "Tên nhà cung cấp đã tồn tại." });
    }

    const [updateRows, updateFields] = await pool.execute(
      "UPDATE `supplier` SET SupplierName = ?, PhoneSupplier = ?, SupplierAddress = ?, EmailSupplier = ? WHERE IDSupplier = ?",
      [UserName, Phone, Address, Email, itemId]
    );

    if (updateRows.affectedRows > 0) {
      console.log("Đã cập nhật thông tin nhà cung cấp thành công.");
      return res
        .status(200)
        .json({ message: "Đã cập nhật thông tin nhà cung cấp thành công." });
    } else {
      console.log("Không có bản ghi nào được cập nhật.");
      return res
        .status(500)
        .json({ message: "Không có bản ghi nào được cập nhật." });
    }
  } catch (error) {
    console.error("Lỗi xử lý yêu cầu POST:", error);
    res.status(500).json({ message: "Đã xảy ra lỗi server." });
  }
};


let postAdminV1SupplierDelete = async (req, res) => {
  const itemId = req.params.id;

  try {
    const connection = await pool.getConnection();
    await connection.beginTransaction();

    try {
      // Kiểm tra xem loại sản phẩm có tồn tại không
      const [existingRows, existingFields] = await connection.execute(
        "SELECT * FROM `supplier` WHERE IDSupplier = ?",
        [itemId]
      );

      if (!existingRows || existingRows.length === 0) {
        console.log("Nhà cung cấp không tồn tại.");
        await connection.rollback();
        return res.status(404).json({ message: "Nhà cung cấp không tồn tại." });
      }

      // Thực hiện xóa loại sản phẩm
      const [deleteRows, deleteFields] = await connection.execute(
        "DELETE FROM `supplier` WHERE IDSupplier = ?",
        [itemId]
      );

      if (deleteRows.affectedRows > 0) {
        console.log("Nhà cung cấp đã được xóa thành công.");
        await connection.commit();
        return res
          .status(200)
          .json({ message: "Nhà cung cấpđã được xóa thành công." });
      } else {
        console.log("Không có bản ghi nào được xóa.");
        await connection.rollback();
        return res
          .status(500)
          .json({ message: "Không có bản ghi nào được xóa." });
      }
    } catch (error) {
      console.error("Lỗi xử lý yêu cầu DELETE:", error);
      await connection.rollback();
      res.status(500).json({ message: "Đã xảy ra lỗi server." });
    } finally {
      connection.release();
    }
  } catch (error) {
    console.error("Lỗi kết nối cơ sở dữ liệu:", error);
    res.status(500).json({ message: "Internal Server Error - Database connection" });
  }
};




module.exports ={
    getAdminV1Supplier ,
    getAdminV1SupplierCreate ,
    getAdminV1SupplierEdit ,
    postAdminV1SupplierCreate,
    postAdminV1SupplierEdit,
    postAdminV1SupplierDelete
    
}