const pool = require("../../models/connectDB")

const getShop = async (req, res) => {
  let _page = req.query.page ? parseInt(req.query.page) : 1;
  let limit = 12;
  let start = (_page - 1) * limit;
  const [totalProduct, totalFields] = await pool.execute(`SELECT count(*) as total FROM Product`);
  const totalPage = Math.ceil(totalProduct[0].total / limit);

  // Tìm kiếm
  let searchQuery = "";
  let searchParams = [];
  if (req.query.search) {
      searchQuery = " WHERE ProductName LIKE ?";
      searchParams.push('%' + req.query.search + '%');
  }

  // Lọc theo giá
  let priceOrder = "";
  if (req.query.orderby === "price") {
      priceOrder = " ORDER BY Price ASC";
  } else if (req.query.orderby === "price-desc") {
      priceOrder = " ORDER BY Price DESC";
  }

  // Lọc theo ngày
  let idOrder = "";
  if (req.query.orderby === "date") {
      idOrder = " ORDER BY IDProduct DESC";
  }      
  try {
      let query = `SELECT * FROM Product ${searchQuery} ${priceOrder} ${idOrder} LIMIT ${start}, ${limit}`;
      if (searchQuery && totalProduct[0].total === 1) {
        console.log("day la query 1")
          query = `SELECT * FROM Product ${searchQuery}`;
          const [rows, fields] = await pool.execute(query, searchParams);
          res.render("./Client/shop.ejs", { 
              products: rows ? rows : [],
              totalPage: totalPage,
              page: _page,
              orderby: req.query.orderby 
          });
      } else {
          const [rows, fields] = await pool.execute(query, [...searchParams, start, limit]);
          console.log(rows[0])

          // filter image for product
          await Promise.all(rows.map(async (element, index) => {
            //   const [detailiImage, detailImageFields] = await pool.execute(`select * from ImportedProductsDetail where IDProduct = ${element.IDProduct} limit 1 `)
            //   const [image, imageFields] = await pool.execute(`select * from Images where IDImages = ${detailiImage[0].IDImages}  limit 1 `);
            //   const [nameSupplier, nameSupplierFields] = await pool.execute(`select * from Supplier where IDSupplier = ${element.IDSupplier}`);
            const [ProductImagesDetails,ProductImagesDetailsFields] = await pool.execute(`SELECT * FROM ProductImagesDetails  WHERE IDProduct = `+rows[index].IDProduct);
            const [Images,ImagesFields] = await pool.execute(`SELECT * FROM Images  WHERE IDImages = `+ProductImagesDetails[0].IDImages);
            rows[index].url = Images[0].UrlImages;
          }));
          console.log(rows)
          console.log("done ")
          res.render("./Client/shop.ejs", { 
              products: rows ? rows : [],
              totalPage: totalPage,
              page: _page > totalPage ? totalPage : _page,
              orderby: req.query.orderby 
          });
      }
  } catch (error) {
      console.error("Error retrieving products:", error);
      res.status(500).send("Internal Server Error");
  }
};
module.exports ={
    getShop
}