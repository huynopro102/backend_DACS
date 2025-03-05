require('dotenv').config()
const c = require('config');
const mysql = require("mysql2/promise");
const pool = mysql.createPool({
    port : process.env.dbPort ,
    host: process.env.dbHost ,
    database: process.env.dbName ,
    user: process.env.dbUser ,
    password: process.env.dbPassword ,
});

pool.getConnection()
.then(()=>{
    console.log("Connect to database successfully")
    console.log(process.env.dbPort)
    console.log(process.env.dbHost)
    console.log(process.env.dbName)
    console.log(process.env.dbUser)
    console.log(process.env.dbPassword)
})
.catch((err)=>{
    console.log("Connect to database failure")
    console.log(err)
})


module.exports = pool;
