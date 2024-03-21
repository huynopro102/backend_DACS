const { Pool } = require("pg");

const pool = new Pool({
    user: 'postgres',
    password: '123',
    host: 'localhost',
    port: 5432,
    database: 'nodejsbasic1',
});

async function connectToDatabase() {
    try {
        await pool.connect();
        console.log('Connected to PostgreSQL database');
    } catch (err) {
        console.error('Error connecting to PostgreSQL database', err);
    }
}

connectToDatabase();

module.exports = pool;
