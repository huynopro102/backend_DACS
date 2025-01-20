const pool = require("../../models/connectDB")

const getDetailProduct = async (req, res) => {
    try {
        const productId = req.params.productId; 
        const [productDetail, productDetailFields] = await pool.execute(`SELECT * FROM Product WHERE IDProduct = ${productId}`);
        if (productDetail.length === 0) {
            // Nếu không tìm thấy sản phẩm, trả về trang 404 hoặc thông báo không tìm thấy sản phẩm
            return res.status(404).send("Product not found");
        }

        // Lấy IDProductType từ chi tiết sản phẩm
        const productTypeId = productDetail[0].IDProductType;

        // Truy vấn để lấy thông tin loại sản phẩm dựa trên IDProductType
        const [producttype, productTypeFields] = await pool.execute(
            "SELECT * FROM ProductType WHERE IDProductType = ? LIMIT 1",
            [productTypeId]
        );

        // Truy vấn để lấy hình ảnh chi tiết của sản phẩm
        const [detailImage, detailImageFields] = await pool.execute(
            `SELECT pi.IDImages, i.NameImages, i.UrlImages 
             FROM ProductImagesDetails pi 
             JOIN Images i ON pi.IDImages = i.IDImages 
             WHERE pi.IDProduct = ?`,
            [productId]
        );

        // Truy vấn để lấy tên nhà cung cấp của sản phẩm
        const [supplierInfo, supplierInfoFields] = await pool.execute(
            "SELECT * FROM Supplier WHERE IDSupplier = ?",
            [productDetail[0].IDSupplier]
        );
        const [randomProducts, randomProductsFields] = await pool.execute(
            "SELECT p.*, s.SupplierName, i.UrlImages FROM Product p JOIN ProductImagesDetails pi ON p.IDProduct = pi.IDProduct JOIN Images i ON pi.IDImages = i.IDImages JOIN Supplier s ON p.IDSupplier = s.IDSupplier ORDER BY RAND() LIMIT 8"
        );
        // Render trang detail sản phẩm
        res.render("./Client/detailproduct.ejs", {
            product: productDetail,
            producttype: producttype,
            detailImage: detailImage,
            supplierInfo: supplierInfo,
            randomProducts: randomProducts,
        });
    } catch (error) {
        console.error("Error retrieving product detail:", error);
        res.status(500).send("Internal Server Error");
    }
};
  
module.exports = {
    getDetailProduct,
};