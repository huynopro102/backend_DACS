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
        console.log(req.body);
        const { SupplierName, SupplierAddress, PhoneSupplier, EmailSupplier } = req.body;
        const sqlCheckDuplicate = "SELECT * FROM supplier WHERE SupplierName = ? OR SupplierAddress = ? OR PhoneSupplier = ? OR EmailSupplier = ?";
        const [duplicateRows] = await pool.execute(sqlCheckDuplicate, [SupplierName, SupplierAddress, PhoneSupplier, EmailSupplier]);
        if (duplicateRows.length > 0) {
            return res.status(409).json({ message: "Duplicate data found" });
        }

        const sqlInsert = "INSERT INTO supplier (SupplierName, SupplierAddress, PhoneSupplier, EmailSupplier) VALUES (?, ?, ?, ?)";
        await pool.execute(sqlInsert, [SupplierName, SupplierAddress, PhoneSupplier, EmailSupplier]);
        return res.status(201).json({ message: "Created Successfully" });
    } catch (error) {
        console.error('Error creating supplier:', error);
        return res.status(500).json({ message: "Internal Server Error" });
    }
}






module.exports ={
    getAdminV1Supplier ,
    getAdminV1SupplierCreate ,
    getAdminV1SupplierEdit ,
    postAdminV1SupplierCreate
    
}