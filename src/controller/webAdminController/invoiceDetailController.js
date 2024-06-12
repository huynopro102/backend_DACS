const pool = require("../../models/connectDB");

let getAdminV1InvoiceDetailID = async (req, res) => {
  const { id } = req.params;
  try {
    const connection = await pool.getConnection(); // Lấy kết nối từ pool
    const query = `
        SELECT 
            i.IDInvoice, 
            i.IDCustomer, 
            i.IDStaff, 
            i.DateCreated, 
            i.Status, 
            i.paymentMethods, 
            id.IDProduct, 
            id.TotalQuantity, 
            id.Price,
            p.ProductName,
            p.Price as ProductPrice,
            p.IDProductType,
            image.IDImages,
            image.UrlImages,
            p.Sale,
            splir.SupplierName,
            deli.DeliveryAddress,
            deli.RecipientPhone,
            deli.Name
        FROM 
            invoice i
        JOIN 
            invoicedetails id ON i.IDInvoice = id.IDInvoice
        JOIN 
            product p ON id.IDProduct = p.IDProduct
        LEFT JOIN
            productimagesdetails pid ON p.IDProduct = pid.IDProduct
        LEFT JOIN 
            images image ON pid.IDImages = image.IDImages
        LEFT JOIN
            supplier splir ON p.IDSupplier = splir.IDSupplier
        LEFT JOIN
            deliverynotes deli ON i.IDInvoice = deli.IDInvoice
        WHERE 
            i.IDInvoice = ?
    `;

    const [invoiceDetails] = await connection.execute(query, [id]);

    console.log(invoiceDetails);
    connection.release(); // Trả lại kết nối vào pool

    return res.render("./Admin/invoice/invoicedetailID.ejs", {
      invoiceDetails: invoiceDetails,
    });
  } catch (error) {
    console.error("Error in getAdminV1InvoiceDetailID:", error);
    return res.status(500).json({ message: "Server error" });
  }
};

module.exports = {
  getAdminV1InvoiceDetailID,
};
