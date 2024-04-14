const pool = require("../../models/connectDB");

let getHome = (req, res) => {
    res.render('./Client/home.ejs');
}
module.exports = {
    getHome,
}
