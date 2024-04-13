const pool = require("../../models/connectDB");
const { promisify } = require('util');
const getConnection = promisify(pool.getConnection).bind(pool);


let postAdminV1ProductEdit = async (req,res) =>{
  console.log(req.body)
}

const postAdminV1ProductsCreate = async (req, res) => {
  console.log("This is the post create function.");
  try {
    const { ProductDescription, ProductName, Price, sale, productType, Supplier, radio } = req.body;
    const { filename, NameReal ,path } = req.file;
    console.log(req.file)
    console.log(req.body)

    const conn = await pool.getConnection();
    await conn.beginTransaction(); 
    try {
      // Thêm sản phẩm vào bảng product
      const productQuery = "INSERT INTO product (ProductName, ProductDescription, IDProductType, IDSupplier, Price, Sale, Status) VALUES (?, ?, ?, ?, ?, ?, ?)";
      await conn.query(productQuery, [ProductName, ProductDescription,
        parseInt(productType), parseInt(Supplier), parseFloat(Price), parseFloat(sale), parseInt(radio)]);

      // Lấy ID của sản phẩm vừa được thêm
      const productIdQuery = "SELECT LAST_INSERT_ID() as productId";
      const [productIdResult] = await conn.query(productIdQuery);
      const productId = productIdResult[0].productId;

      console.log("Inserting into the images table.");

      // Thêm hình ảnh vào bảng images
      const imageQuery = "INSERT INTO images (NameImages, UrlImages) VALUES (?, ?)";
      await conn.query(imageQuery, [NameReal, path]);

      // Lấy ID của hình ảnh vừa được thêm
      const imageIdQuery = "SELECT LAST_INSERT_ID() as imageId";
      const [imageIdResult] = await conn.query(imageIdQuery);
      const imageId = imageIdResult[0].imageId;

      console.log("Inserting into the productimagesdetails table.");

      // Thêm chi tiết hình ảnh sản phẩm vào bảng productimagesdetails
      const productImageQuery = "INSERT INTO productimagesdetails (IDImages, IDProduct) VALUES (?, ?)";
      await conn.query(productImageQuery, [imageId, productId]);

      console.log("Committing the transaction.");

      // Commit transaction nếu mọi thứ thành công
      await conn.commit();
      conn.release();
      res.status(200).json({ message: "Product created successfully" });
    } catch (error) {
      await conn.rollback();
      console.error("Error inserting data:", error);
      res.status(500).json({ message: "Internal Server Error - Transaction rollback" });
    }
  } catch (error) {
    console.error("Error connecting to database:", error);
    res.status(500).json({ message: "Internal Server Error - Database connection" });
  }
};


let getAdminV1ProductsCreate = async (req,res) =>{
    const [supplier,supplierFields] = await pool.execute('select * from supplier')
    const [categoryData,categoryDataFields] = await pool.execute("select * from producttype")
    const [rows, fields] = await pool.execute("SELECT * FROM `producttype`");
    if (rows.length <= 0) {
      res.render("./product/productCreate.ejs", {
        data: [],
        supplierData : supplier ,
        categoryData : categoryData
      });
    } else {
      res.render("./product/productCreate.ejs", {
        data: rows,
        supplierData : supplier ,
        categoryData : categoryData
      });
    }
}


let getAdminV1ProductsEdit = async (req,res) =>{
    const productId = req.params.id;
  const [productRows, productFields] = await pool.execute(
    "SELECT * FROM product WHERE IDProduct = ?",
    [productId]
  );

  const [categoryRows, categoryFields] = await pool.execute(
    "SELECT * FROM `producttype`"
  );

  const[supplier,supplierFields] = await pool.execute(
    "select * from supplier"
  )

  const[productimagesdetails,productimagesdetailsFields] = await pool.execute(`
    select * from productimagesdetails where IDProduct = ?
  `,[productId])


  const list_img = []

  await Promise.all(productimagesdetails.map(async (element, index) => {
    console.log(index);
    const [image, imageDetail] = await pool.execute(`SELECT * FROM images WHERE IDImages = ?`, [productimagesdetails[index].IDImages]);
    list_img.push(...image);
  }));

  console.log(list_img)

  if (productRows.length > 0) {
    res.render("./product/productEdit.ejs", {
      productData: productRows[0],
      categoryData: categoryRows,
      supplierData: supplier ,
      image : list_img
    });
  } else {
    // Handle case when product is not found
    res.redirect("/admin/v1/product");
  }
}


let getAdminV1ProductsTypeEdit = async (req, res) => {
  const itemId = req.params.id;
  console.log("Đây là id: ", req.params.id);

  try {
    const [rows, fields] = await pool.execute(
      "SELECT * FROM `producttype` WHERE IDProductType = ?",
      [itemId]
    );

    // Kiểm tra xem truy vấn có lỗi không
    if (!rows || rows.length === 0) {
      console.log("Không tìm thấy dữ liệu hoặc lỗi truy vấn.");
      return res.json("Lỗi server hoặc không tìm thấy dữ liệu.");
    }

    // Dữ liệu tồn tại, render trang chỉnh sửa
    res.render("./product/productTypeEdit.ejs", {
      row: rows,
    });
  } catch (error) {
    console.error("Lỗi truy vấn SQL:", error);
    return res.json("Lỗi server.");
  }
};


let getAdminV1ProductsTypeCreate = async (req,res) =>{
      res.render("./product/productTypeCreate.ejs")
}


const postAdminV1ProductsTypeEdit = async (req, res) => {
  try {
    const itemId = req.params.id;
    const { name, radio } = req.body;

    console.log("Đây là params id: ", itemId);
    console.log("Đây là body name: ", name);
    console.log("Đây là body radio ", radio);

    if (!name || !radio== undefined || !itemId) {
      console.log("Thông tin không đủ hoặc không hợp lệ.");
      return res.status(400).json({ message: "Thông tin không đủ hoặc không hợp lệ." });
    }
    const [rows, fields] = await pool.execute(
      "SELECT * FROM `producttype` WHERE IDProductType = ?",
      [itemId]
    );

    if (!rows || rows.length === 0) {
      console.log("Loại sản phẩm không tồn tại.");
      return res.status(404).json({ message: "Loại sản phẩm không tồn tại." });
    }

    const [existingRows, existingFields] = await pool.execute(
      "SELECT * FROM `producttype` WHERE ProductTypeName = ?",
      [name]
    );

    if (existingRows && existingRows.length > 0 && existingRows[0].start == radio) {

      console.log("Tên loại sản phẩm đã tồn tại.");
      return res.status(400).json({ message: "Tên loại sản phẩm đã tồn tại." });
    }
    if (existingRows && existingRows.length > 0 && existingRows[0].start == radio) {
      const [updateRows, updateFields] = await pool.execute(
        "UPDATE `producttype` SET ProductTypeName = ?, Status = ? WHERE IDProductType = ?",
        [name, radio, itemId]
      );
      console.log("Đã cập nhật tên loại sản phẩm thành công.");
      return res.status(200).json({ message: "Đã cập nhật tên loại sản phẩm thành công." });
    }

    const [updateRows, updateFields] = await pool.execute(
      "UPDATE `producttype` SET ProductTypeName = ?, Status = ? WHERE IDProductType = ?",
      [name, radio, itemId]
    );

    if (updateRows.affectedRows > 0) {
      console.log("Đã cập nhật tên loại sản phẩm thành công.");
      return res.status(200).json({ message: "Đã cập nhật tên loại sản phẩm thành công." });
    } else {
      console.log("Không có bản ghi nào được cập nhật.");
      return res.status(500).json({ message: "Không có bản ghi nào được cập nhật." });
    }
  } catch (error) {
    console.error("Lỗi xử lý yêu cầu POST:", error);
    res.status(500).json({ message: "Đã xảy ra lỗi server." });
  }
};



let postAdminV1ProductsTypeCreate = async (req, res) => {
  console.log(req.body);
  const { name, radio } = req.body;

  try {
    const [existingRows, existingFields] = await pool.execute(
      `SELECT * FROM producttype WHERE ProductTypeName = ?`,
      [name]
    );

    if (existingRows.length > 0) {
      return res.status(400).json({ success: false, message: 'Product type with the same name already exists.' });
    }

    const [rows, fields] = await pool.execute(
      `INSERT INTO producttype (ProductTypeName, Status) VALUES (?, ?)`,
      [name, radio]
    );

    res.status(200).json({ success: true, message: 'Product type created successfully.' });
  } catch (error) {
    console.error('Error creating product type:', error);
    res.status(500).json({ success: false, message: 'Failed to create product type.' });
  }

};





let getAdminV1ProductsType = async (req,res)=>{
    let _page = req.query.page ? req.query.page : 1;
    let limit = 5;
    let start = (_page - 1) * limit;
    // let totalRow = 20;
    let name = req.query.name;
    // total tổng các item trong database
    const [total, fields] = await pool.execute(
      "select count(*) as total from producttype"
    );
    let totalRow = total[0].total;
    // tong so trang
    let totalPage = Math.ceil(totalRow / limit);
    //
    if (name) {
      const [rows, fields] = await pool.execute(
        "SELECT * FROM `producttype` where `ProductTypeName` like ? limit ? , ? ",
        [`%${ProductTypeName}%`, start, limit]
      );
      res.render("./product/productType.ejs", {
        dataUser: rows ? rows : [],
        totalPage: totalPage,
        page: parseInt(_page),
      });
    } else {
      const [rows, fields] = await pool.execute(
        "SELECT * FROM `producttype` limit ? , ? ",
        [start, limit]
      );
      res.render("./product/productType.ejs", {
        dataUser: rows ? rows : [],
        totalPage: totalPage,
        page: parseInt(_page),
      });
    }
}
let getAdminV1Products = async (req,res) =>{
    try {
        let _page = req.query.page ? req.query.page : 1;
        let limit = 5;
        let start = (_page - 1) * limit;
        // let totalRow = 20;
        let name = req.query.name;
    
        // total tổng các item trong database
        const [total, fields] = await pool.execute(
          "select count(*) as total from product"
        );
        let totalRow = total[0].total;
    
        // tong so trang
        let totalPage = Math.ceil(totalRow / limit);
    
        if (name) {
          const [rows, fields] = await pool.execute(
            "SELECT * FROM `product` p JOIN category c ON p.IDProductType = c.IDProductType WHERE p.`ProductTypeName` LIKE ? LIMIT ? , ?",
            [`%${name}%`, start, limit]
          );
    
          res.render("ProductsAdmin.ejs", {
            dataProduct: rows ? rows : [],
            totalPage: totalPage,
            page: parseInt(_page),
          });
        } else {
          const [rows, fields] = await pool.execute(
            "SELECT p.*, c.* FROM `product` p JOIN producttype c ON p.IDProductType = c.IDProductType LIMIT ? , ?",
            [start, limit]
          );
          res.render("./product/product.ejs", {
            dataProduct: rows ? rows : [],
            totalPage: totalPage,
            page: parseInt(_page),
          });
        }
      } catch (error) {
        console.error("Error in gethomeControllerProduct:", error);
      }
}

module.exports ={
    getAdminV1Products ,
    getAdminV1ProductsType ,
    getAdminV1ProductsEdit ,
    getAdminV1ProductsCreate ,
    getAdminV1ProductsTypeEdit ,
    getAdminV1ProductsTypeCreate ,
    postAdminV1ProductsTypeCreate ,
    postAdminV1ProductsTypeEdit ,

    postAdminV1ProductEdit ,
    postAdminV1ProductsCreate
    


}