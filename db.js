const { createPool } = require('@vercel/postgres');
require('dotenv').config();

let pool;

/*
  Esta función devuelve el pool de conexiones a PostgreSQL.
  Se crea la primera vez que una ruta necesita consultar la base de datos.
*/
function getPool() {
  if (!pool) {
    pool = createPool({
      connectionString: process.env.POSTGRES_URL
    });
  }

  return pool;
}

/*
  Exportamos la función para usar la conexión desde las rutas de la API.
*/
module.exports = getPool;
