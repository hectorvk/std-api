const express = require('express') //
const app = express();
require('dotenv').config();
app.use(express.json());
app.get('/api', (req , res) => {
    res.send('La api esta funcionando');
});
app.get('/api/cultivos', (req, res) => {
    res.json({mensaje: "Se muestran los cultivos de la bdd"})
});
module.exports = app
//La primera linea carga la libreria de express.
//El app.use express.json es el middleware que permite a express entender 
//En los app.get (/api ...) definimos los endpoints