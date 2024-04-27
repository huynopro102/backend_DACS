require('dotenv').config()
const mysql = require("mysql2/promise");
const pool = mysql.createPool({
    
    
    // host: 'localhost',
    // database: 'dacs',
    // user: 'root'

    port : process.env.dbPort ,
    host: process.env.dbHost ,
    database: process.env.dbName ,
    user: process.env.dbUser ,
    password: process.env.dbPassword ,

});


module.exports = pool;
