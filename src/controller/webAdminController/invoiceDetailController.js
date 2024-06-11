const pool = require("../../models/connectDB")

let getAdminV1InvoiceDetailID = async (req,res)=>{
    try {
        
        return res.render("./Admin/invoice/invoicedetailID.ejs")
    } catch (error) {
        throe
    }
}



module.exports ={
    getAdminV1InvoiceDetailID
}