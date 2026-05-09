const express = require('express');
require('dotenv').config();
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


app.get('/api/cultivos', (req, res) => {
    res.json({
        mensaje: "Cultivos de STD"
    });
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
