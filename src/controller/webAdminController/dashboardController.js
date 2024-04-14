const pool = require("../../models/connectDB");

let getAdminV1Dashboard = (req, res) => {
    res.render('./Admin/dashboard/Dashboard.ejs');
}
module.exports = {
    getAdminV1Dashboard,
   
}
