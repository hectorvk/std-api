const express = require('express');
require('dotenv').config();
const getPool = require('../db');
const app = express();


app.use(express.json());
/*
express.json() hace que la api entienda los archivos JSON. Elemento esencial para las rutas
*/



app.get('/api', (req, res) => {
    res.json({
        mensaje: "La api funciona correctamente"
    });
});
/*
Ruta de pruebas para comprobar que la API esta operativa
*/


app.get('/api/cultivos', async (req, res) => {
    try {
        /*
        Consultamos la tabla cultivos y ordenamos por id.
        resultado.rows contiene las filas devueltas por PostgreSQL.
        */
        const pool = getPool();
        const resultado = await pool.query('SELECT * FROM cultivos ORDER BY id');

        res.json(resultado.rows);
    } catch (error) {
        /*
        Si la consulta falla, registramos el error en consola
        y enviamos una respuesta 500 al cliente.
        */
        console.error('Error al consultar cultivos:', error);

        res.status(500).json({
            mensaje: 'Error al consultar los cultivos'
        });
    }
});


/*
Ruta de cultivos
*/
module.exports = app;

/*
Este bloque se ejecuta al arrrancar el archivo con node en nuestro equipo.
No necesitamos app.listen en Vercel, el mismo ejecuta la API.

*/

if (require.main === module) {
    const PORT = process.env.PORT || 3000;

  app.listen(PORT, () => {
    console.log(`Servidor escuchando en http://localhost:${PORT}`);
  });
}
