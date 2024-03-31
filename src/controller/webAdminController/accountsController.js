const pool = require("../../models/connectDB");


let getAdminV1Accounts = async (req, res) => {
    try {
        let _page = req.query.page ? req.query.page : 1;
        let limit = 5;
        let start = (_page - 1) * limit;
        // let totalRow = 20;
        let name = req.query.name;
      
        // total tổng các item trong database
        const [total, fields] = await pool.execute(
          "select count(*) as total from user"
        );
        let totalRow = total[0].total;
      
        // tong so trang
        let totalPage = Math.ceil(totalRow / limit);
      
        //
        if (name) {
          const [rows, fields] = await pool.execute(
            "SELECT * FROM `user` where `username` like ? limit ? , ? ",
            [`%${name}%`, start, limit]
          );
          res.render("accounts.ejs", {
            dataUser: rows ? rows : [],
            totalPage: totalPage,
            page: parseInt(_page),
          });
        } else {
          const [rows, fields] = await pool.execute(
            "SELECT * FROM `user` limit ? , ? ",
            [start, limit]
          );
          res.render("accounts/accounts.ejs", {
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





let postAdminV1Accounts = async (req, res) => {
    try {
        console.log("day la body delete ",req.body.Username)
        if (req.body.id) {
            // Kiểm tra xem người dùng có tồn tại không
            const user = await pool.query('SELECT * FROM user WHERE Username = $1', [req.body.Username]);
            if (user.rows.length > 0) {
                console.log(user)
                // Nếu người dùng tồn tại, thực hiện xóa
                const result = await pool.query('DELETE FROM user WHERE Username = $1', [req.body.Username]);
                if (result.rowCount > 0) {
                    // Xóa thành công
                    res.status(200).json({ message: 'User deleted successfully' });
                } else {
                    // Người dùng không tồn tại
                    res.status(404).json({ message: 'User not found' });
                }
            } else {
                // Người dùng không tồn tại
                res.status(404).json({ message: 'User not found' });
            }
        } else {
            // Không có id được cung cấp
            res.status(400).json({ message: 'Bad Request: Missing user id' });
        }
    } catch (err) {
        // Xử lý lỗi nếu có
        console.error('Error executing query', err);
        res.status(500).json({ message: 'Internal Server Error' });
    }
}


let getAdminV1AccountsEdit = async (req,res)=>{
    const id = req.params.id
    console.log("id ",id)
    return await res.render("./accounts/accountsEdit.ejs")
}


let getAdminV1AccountsCreate = (req,res) =>{
    res.render("./accounts/accountsCreate.ejs")
}



let getAdminV1Dashboard = (req, res) => {
    res.render('Dashboard.ejs');
}


module.exports = {
    getAdminV1Dashboard,
    getAdminV1Accounts,
    postAdminV1Accounts,
    getAdminV1AccountsEdit,
    getAdminV1AccountsCreate
}
