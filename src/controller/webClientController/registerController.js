const pool = require("../../models/connectDB");

let getRegister = (req, res) => {
    res.render('./Client/register.ejs');
}
module.exports = {
    getRegister,
}
