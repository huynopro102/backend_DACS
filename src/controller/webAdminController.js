const pool = require("../models/connectDB");

let getAdminV1Accounts = async (req, res) => {
    try {
        let _page = req.query.page ? req.query.page : 1;
        let limit = 10;
        let start = (_page - 1) * limit;
        console.log(_page)
        // Tính tổng số lượng dòng trong bảng datausers
        const totalQuery = await pool.query("SELECT COUNT(*) AS total FROM datausers");
        const totalRow = parseInt(totalQuery.rows[0].total);

        // Tính tổng số trang
        const totalPage = Math.ceil(totalRow / limit);

        let name = req.query.name;
        console.log(name)
        // Lấy dữ liệu từ database
        let queryString = "SELECT * FROM datausers";
        let queryParams = [];
        if (name) {
            queryString += " WHERE username ILIKE $1";
            queryParams.push(`%${name}%`);
            queryString += " OFFSET $2 LIMIT $3";
        }else{
            queryString += " OFFSET $1 LIMIT $2";
            queryParams.push(start, limit);
        }
        const { rows: dataUser } = await pool.query(queryString, queryParams);

        res.render("accounts.ejs", {
            dataUser: dataUser ? dataUser : [],
            totalPage: totalPage,
            page: parseInt(_page),
        });
    }  catch (err) {
        const error = new Error('Internal Server Error');
        error.statusCode
        throw error;
    }
}

let postAdminV1Accounts = async (req, res) => {
    try {
        console.log("day la body",req.body.id)
        if (req.body.id) {
            // Kiểm tra xem người dùng có tồn tại không
            const user = await pool.query('SELECT * FROM datausers WHERE id = $1', [req.body.id]);
            if (user.rows.length > 0) {
                // Nếu người dùng tồn tại, thực hiện xóa
                const result = await pool.query('DELETE FROM datausers WHERE id = $1', [req.body.id]);
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
    return await res.render("accountsEdit.ejs")
}

let getAdminV1Dashboard = (req, res) => {
    res.render('Dashboard.ejs');
}

let getAdminV1AccountsCreate = (req,res) =>{
    res.render("accountsCreate.ejs")
}

module.exports = {
    getAdminV1Accounts,
    getAdminV1Dashboard,
    postAdminV1Accounts,
    getAdminV1AccountsEdit,
    getAdminV1AccountsCreate
}
