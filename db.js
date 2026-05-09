const { create pool } = require('@vercel/postgres');
require('dotenv').config();
const pool = createPool({connectionString: process.env.POSTGRES_URL});
module.exports = pool; 