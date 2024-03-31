const mysql = require("mysql2/promise");

const pool = mysql.createPool({
    
    
    host: 'localhost',
    database: 'csdlweb',
    user: 'root'

    // port : 3306 ,
    // host: '14.225.218.25',
    // database: 'CSDLWeb',
    // user:'huynguyen1',
    // password:'123',
});


module.exports = pool;
