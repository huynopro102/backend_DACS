const mysql = require('mysql2/promise');
require("dotenv").config();

// For debugging
console.log('Attempting to connect with:');
console.log('Host:', process.env.HOST);
console.log('Port:', process.env.PORT_DB);
console.log('User:', process.env.USER);
console.log('Database:', process.env.DATABASE);
console.log('SSL Enabled:', !!process.env.CA);

const pool = mysql.createPool({
  host: process.env.HOST,
  port: parseInt(process.env.PORT_DB, 10),
  user: process.env.USER,
  password: process.env.PASSWORD,
  database: process.env.DATABASE,
  ssl: {
    ca: process.env.CA,
    rejectUnauthorized: true
  },
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

const testConnection = async () => {
  try {
    // Try to get a connection from the pool
    const connection = await pool.getConnection();
    console.log('Connected to MySQL successfully!');
    // Release the connection back to the pool
    connection.release();
    return true;
  } catch (err) {
    console.error('MySQL connection error: ', err);
    return false;
  }
};

// Test connection immediately
testConnection();

module.exports = pool;