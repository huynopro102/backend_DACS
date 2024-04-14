const pool = require("../../models/connectDB");

let getSign = (req, res) => {
    res.render('./Client/signin.ejs');
}
module.exports = {
    getSign,
}
