require('dotenv').config()
const mysql = require("mysql2/promise");
const pool = mysql.createPool({
    port : process.env.dbPort ,
    host: process.env.dbHost ,
    database: process.env.dbName ,
    user: process.env.dbUser ,
    password: process.env.dbPassword ,
});
module.exports = pool;
