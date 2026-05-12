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
        Leemos los filtros opcionales enviados en la URL.
        Por ejemplo: /api/cultivos?temporada=Primavera&orden=precio_venta
        */
        const { temporada, nombre, orden, direccion } = req.query;
        const pool = getPool();

        const temporadasPermitidas = [
            'Primavera',
            'Verano',
            'Otoño',
            'Invierno',
            'Varias',
            'Invernadero'
        ];

        const columnasPermitidas = [
            'id',
            'nombre',
            'precio_semilla',
            'precio_venta',
            'tiempo_crecimiento',
            'tiempo_regreso',
            'temporada'
        ];

        if (temporada && !temporadasPermitidas.includes(temporada)) {
            return res.status(400).json({
                mensaje: 'Temporada no valida',
                temporadasPermitidas
            });
        }

        if (orden && !columnasPermitidas.includes(orden)) {
            return res.status(400).json({
                mensaje: 'Campo de ordenacion no valido',
                columnasPermitidas
            });
        }

        if (direccion && !['asc', 'desc'].includes(direccion)) {
            return res.status(400).json({
                mensaje: 'Direccion de ordenacion no valida',
                direccionesPermitidas: ['asc', 'desc']
            });
        }

        let consulta = 'SELECT * FROM cultivos WHERE 1 = 1';
        const valores = [];

        if (temporada) {
            valores.push(temporada);
            consulta += ` AND temporada = $${valores.length}`;
        }

        if (nombre) {
            valores.push(`%${nombre}%`);
            consulta += ` AND nombre ILIKE $${valores.length}`;
        }

        const columnaOrden = orden || 'id';
        const direccionOrden = direccion === 'desc' ? 'DESC' : 'ASC';
        consulta += ` ORDER BY ${columnaOrden} ${direccionOrden}`;

        const resultado = await pool.query(consulta, valores);

        res.json({
            total: resultado.rowCount,
            filtros: {
                temporada: temporada || null,
                nombre: nombre || null,
                orden: columnaOrden,
                direccion: direccionOrden.toLowerCase()
            },
            datos: resultado.rows
        });
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

app.get('/api/personajes', async (req, res) => {
    try {
        const { nombre, temporada, es_soltero, orden, direccion } = req.query;
        const pool = getPool();

        const temporadasPermitidas = [
            'Primavera',
            'Verano',
            'Otoño',
            'Invierno'
        ];

        const columnasPermitidas = [
            'id',
            'nombre',
            'temporada_cumpleanos',
            'dia_cumpleanos',
            'es_soltero'
        ];

        if (temporada && !temporadasPermitidas.includes(temporada)) {
            return res.status(400).json({
                mensaje: 'Temporada no valida',
                temporadasPermitidas
            });
        }

        if (es_soltero && !['0', '1'].includes(es_soltero)) {
            return res.status(400).json({
                mensaje: 'El filtro es_soltero debe ser 0 o 1'
            });
        }

        if (orden && !columnasPermitidas.includes(orden)) {
            return res.status(400).json({
                mensaje: 'Campo de ordenacion no valido',
                columnasPermitidas
            });
        }

        if (direccion && !['asc', 'desc'].includes(direccion)) {
            return res.status(400).json({
                mensaje: 'Direccion de ordenacion no valida',
                direccionesPermitidas: ['asc', 'desc']
            });
        }

        let consulta = 'SELECT * FROM personajes WHERE 1 = 1';
        const valores = [];

        if (nombre) {
            valores.push(`%${nombre}%`);
            consulta += ` AND nombre ILIKE $${valores.length}`;
        }

        if (temporada) {
            valores.push(temporada);
            consulta += ` AND temporada_cumpleanos = $${valores.length}`;
        }

        if (es_soltero) {
            valores.push(Number(es_soltero));
            consulta += ` AND es_soltero = $${valores.length}`;
        }

        const columnaOrden = orden || 'id';
        const direccionOrden = direccion === 'desc' ? 'DESC' : 'ASC';
        consulta += ` ORDER BY ${columnaOrden} ${direccionOrden}`;

        const resultado = await pool.query(consulta, valores);

        res.json({
            total: resultado.rowCount,
            filtros: {
                nombre: nombre || null,
                temporada: temporada || null,
                es_soltero: es_soltero || null,
                orden: columnaOrden,
                direccion: direccionOrden.toLowerCase()
            },
            datos: resultado.rows
        });
    } catch (error) {
        console.error('Error al consultar el personaje', error);

        res.status(500).json({
            mensaje: 'Error al consultar los NPCs'
        });
    }
});

app.get('/api/materiales', async (req, res) => {
    try {
        const { nombre, fuente, orden, direccion } = req.query;
        const pool = getPool();

        const columnasPermitidas = [
            'id',
            'nombre',
            'fuente',
            'precio_venta'
        ];

        if (orden && !columnasPermitidas.includes(orden)) {
            return res.status(400).json({
                mensaje: 'Campo de ordenacion no valido',
                columnasPermitidas
            });
        }

        if (direccion && !['asc', 'desc'].includes(direccion)) {
            return res.status(400).json({
                mensaje: 'Direccion de ordenacion no valida',
                direccionesPermitidas: ['asc', 'desc']
            });
        }

        let consulta = 'SELECT * FROM materiales WHERE 1 = 1';
        const valores = [];

        if (nombre) {
            valores.push(`%${nombre}%`);
            consulta += ` AND nombre ILIKE $${valores.length}`;
        }

        if (fuente) {
            valores.push(`%${fuente}%`);
            consulta += ` AND fuente ILIKE $${valores.length}`;
        }

        const columnaOrden = orden || 'id';
        const direccionOrden = direccion === 'desc' ? 'DESC' : 'ASC';
        consulta += ` ORDER BY ${columnaOrden} ${direccionOrden}`;

        const resultado = await pool.query(consulta, valores);

        res.json({
            total: resultado.rowCount,
            filtros: {
                nombre: nombre || null,
                fuente: fuente || null,
                orden: columnaOrden,
                direccion: direccionOrden.toLowerCase()
            },
            datos: resultado.rows
        });
    } catch (error) {
        console.error('Error al consultar materiales:', error);

        res.status(500).json({
            mensaje: 'Error al consultar los materiales'
        });
    }
});

app.get('/api/edificios', async (req, res) => {
    try {
        const { nombre, orden, direccion } = req.query;
        const pool = getPool();

        const columnasPermitidas = [
            'id',
            'nombre',
            'tiempo_construccion',
            'coste_oro',
            'cant_madera',
            'cant_piedra'
        ];

        if (orden && !columnasPermitidas.includes(orden)) {
            return res.status(400).json({
                mensaje: 'Campo de ordenacion no valido',
                columnasPermitidas
            });
        }

        if (direccion && !['asc', 'desc'].includes(direccion)) {
            return res.status(400).json({
                mensaje: 'Direccion de ordenacion no valida',
                direccionesPermitidas: ['asc', 'desc']
            });
        }

        let consulta = 'SELECT * FROM edificios WHERE 1 = 1';
        const valores = [];

        if (nombre) {
            valores.push(`%${nombre}%`);
            consulta += ` AND nombre ILIKE $${valores.length}`;
        }

        const columnaOrden = orden || 'id';
        const direccionOrden = direccion === 'desc' ? 'DESC' : 'ASC';
        consulta += ` ORDER BY ${columnaOrden} ${direccionOrden}`;

        const resultado = await pool.query(consulta, valores);

        res.json({
            total: resultado.rowCount,
            filtros: {
                nombre: nombre || null,
                orden: columnaOrden,
                direccion: direccionOrden.toLowerCase()
            },
            datos: resultado.rows
        });
    } catch (error) {
        console.error('Error al consultar edificios:', error);

        res.status(500).json({
            mensaje: 'Error al consultar los edificios'
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
