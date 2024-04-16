const pool = require("../../models/connectDB")

const getShop = async (req, res) => {
    let _page = req.query.page ? req.query.page : 1;
    let limit = 12;
    let start = (_page - 1) * limit;
    const [totalProduct,totalFiedls] = await pool.execute(`select count(*) as total from product`)
    const totalPage = Math.ceil(totalProduct[0].total/limit)
 
    try {
      const [rows, fields] = await pool.execute("SELECT * FROM product LIMIT ?, ?",[start, limit] );
      await Promise.all( rows.map(async ( element,index ) =>{
        const [detailiImage, detailImageFields] = await pool.execute('select * from productimagesdetails where IDProduct = ? limit 1 ', [element.IDProduct]);
    
        const [image, imageFields] = await pool.execute("select * from images where IDImages = ? limit 1 ", [detailiImage[0].IDImages]);
        
        const [nameSupplier , nameSupplierFields] = await pool.execute("select * from supplier where IDSupplier = ?",[element.IDSupplier])

        rows[index].url = image[0].UrlImages
        rows[index].SupplierName = nameSupplier[0].SupplierName
      
      }) )    
      res.render("./Client/shop.ejs", { 
        products: rows ? rows : [] ,
        totalPage : totalPage ,
        page : _page > totalPage ? totalPage : _page ,
       
      });
    } catch (error) {
      console.error("Error retrieving products:", error);
      res.status(500).send("Internal Server Error");
    }
  };

module.exports ={
    getShop
}