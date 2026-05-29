● const express = require('express');
  require('dotenv').config();
  const getPool = require('../db');
  const jwt = require('jsonwebtoken');
  const app = express();

  app.use(express.json());
  //Clave para firmar el JWT
  const JWT_SECRET = process.env.JWT_SECRET || 'clave_desarrollo_local';
  // Medidor de salud de la API
  app.get('/api', (req, res) => {
      res.json({ mensaje: 'La api funciona correctamente' });
  });

  //Este bloque se encarga de verificar el JWT
  function verificarToken(req, res, next) {
      const cabecera = req.headers['authorization'];

      if (!cabecera || !cabecera.startsWith('Bearer ')) {
          return res.status(401).json({ mensaje: 'Token no proporcionado' });
      }

      const token = cabecera.split(' ')[1];

      try {
          const datos = jwt.verify(token, JWT_SECRET);
          req.usuario = datos;
          next();
      } catch (error) {
          return res.status(401).json({ mensaje: 'Token invalido o expirado' });
      }
  }
  /*
    GET /api/cultivos
    Soporta filtros por temporada y nombre, y ordenacion por cualquier columna valida
  */
  app.get('/api/cultivos', verificarToken, async (req, res) => {
      try {
          const { temporada, nombre, orden, direccion } = req.query;
          const pool = getPool();

          const temporadasPermitidas = ['Primavera', 'Verano', 'Otoño', 'Invierno',
  'Varias', 'Invernadero'];
          const columnasPermitidas = ['id', 'nombre', 'precio_semilla',
  'precio_venta', 'tiempo_crecimiento', 'tiempo_regreso', 'temporada'];

          if (temporada && !temporadasPermitidas.includes(temporada)) {
              return res.status(400).json({ mensaje: 'Temporada no valida',
  temporadasPermitidas });
          }
          if (orden && !columnasPermitidas.includes(orden)) {
              return res.status(400).json({ mensaje: 'Campo de ordenacion no valido',
   columnasPermitidas });
          }
          if (direccion && !['asc', 'desc'].includes(direccion)) {
              return res.status(400).json({ mensaje: 'Direccion de ordenacion no
  valida', direccionesPermitidas: ['asc', 'desc'] });
          }

          let consulta = 'SELECT * FROM cultivos WHERE 1 = 1';
          const valores = [];

          if (temporada) {
              valores.push(temporada);
              consulta += ' AND temporada = $' + valores.length;
          }
          if (nombre) {
              valores.push('%' + nombre + '%');
              consulta += ' AND nombre ILIKE $' + valores.length;
          }

          // ordenacion por defecto id ASC
          const columnaOrden = orden || 'id';
          const direccionOrden = direccion === 'desc' ? 'DESC' : 'ASC';
          consulta += ' ORDER BY ' + columnaOrden + ' ' + direccionOrden;

          const resultado = await pool.query(consulta, valores);

          res.json({
              total: resultado.rowCount,
              filtros: { temporada: temporada || null, nombre: nombre || null, orden:
   columnaOrden, direccion: direccionOrden.toLowerCase() },
              datos: resultado.rows
          });
      } catch (error) {
          console.error('Error al consultar cultivos:', error);
          res.status(500).json({ mensaje: 'Error al consultar los cultivos' });
      }
  });


  // personajes con filtros de nombre, temporada cumple y si es soltero
  app.get('/api/personajes', verificarToken, async (req, res) => {
      try {
          const { nombre, temporada, es_soltero, orden, direccion } = req.query;
          const pool = getPool();

          const temporadasPermitidas = ['Primavera', 'Verano', 'Otoño', 'Invierno'];
          const columnasPermitidas = ['id', 'nombre', 'temporada_cumpleanos',
  'dia_cumpleanos', 'es_soltero'];

          if (temporada && !temporadasPermitidas.includes(temporada)) {
              return res.status(400).json({ mensaje: 'Temporada no valida',
  temporadasPermitidas });
          }
          if (es_soltero && !['0', '1'].includes(es_soltero)) {
              return res.status(400).json({ mensaje: 'El filtro es_soltero debe ser 0
   o 1' });
          }
          if (orden && !columnasPermitidas.includes(orden)) {
              return res.status(400).json({ mensaje: 'Campo de ordenacion no valido',
   columnasPermitidas });
          }
          if (direccion && !['asc', 'desc'].includes(direccion)) {
              return res.status(400).json({ mensaje: 'Direccion de ordenacion no
  valida', direccionesPermitidas: ['asc', 'desc'] });
          }

          let consulta = 'SELECT * FROM personajes WHERE 1 = 1';
          const valores = [];

          if (nombre) {
              valores.push('%' + nombre + '%');
              consulta += ' AND nombre ILIKE $' + valores.length;
          }
          if (temporada) {
              valores.push(temporada);
              consulta += ' AND temporada_cumpleanos = $' + valores.length;
          }
          if (es_soltero) {
              valores.push(Number(es_soltero));
              consulta += ' AND es_soltero = $' + valores.length;
          }

          const columnaOrden = orden || 'id';
          const direccionOrden = direccion === 'desc' ? 'DESC' : 'ASC';
          consulta += ' ORDER BY ' + columnaOrden + ' ' + direccionOrden;

          const resultado = await pool.query(consulta, valores);

          res.json({
              total: resultado.rowCount,
              filtros: { nombre: nombre || null, temporada: temporada || null,
  es_soltero: es_soltero || null, orden: columnaOrden, direccion:
  direccionOrden.toLowerCase() },
              datos: resultado.rows
          });
      } catch (error) {
          console.error('Error al consultar el personaje', error);
          res.status(500).json({ mensaje: 'Error al consultar los NPCs' });
      }
  });


  /* materiales - filtros por nombre y fuente */
  app.get('/api/materiales', verificarToken, async (req, res) => {
      try {
          const { nombre, fuente, orden, direccion } = req.query;
          const pool = getPool();

          const columnasPermitidas = ['id', 'nombre', 'fuente', 'precio_venta'];

          if (orden && !columnasPermitidas.includes(orden)) {
              return res.status(400).json({ mensaje: 'Campo de ordenacion no valido',
   columnasPermitidas });
          }
          if (direccion && !['asc', 'desc'].includes(direccion)) {
              return res.status(400).json({ mensaje: 'Direccion de ordenacion no
  valida', direccionesPermitidas: ['asc', 'desc'] });
          }

          let consulta = 'SELECT * FROM materiales WHERE 1 = 1';
          const valores = [];

          if (nombre) {
              valores.push('%' + nombre + '%');
              consulta += ' AND nombre ILIKE $' + valores.length;
          }
          if (fuente) {
              valores.push('%' + fuente + '%');
              consulta += ' AND fuente ILIKE $' + valores.length;
          }

          const columnaOrden = orden || 'id';
          const direccionOrden = direccion === 'desc' ? 'DESC' : 'ASC';
          consulta += ' ORDER BY ' + columnaOrden + ' ' + direccionOrden;

          const resultado = await pool.query(consulta, valores);

          res.json({
              total: resultado.rowCount,
              filtros: { nombre: nombre || null, fuente: fuente || null, orden:
  columnaOrden, direccion: direccionOrden.toLowerCase() },
              datos: resultado.rows
          });
      } catch (error) {
          console.error('Error al consultar materiales:', error);
          res.status(500).json({ mensaje: 'Error al consultar los materiales' });
      }
  });


  // edificios, mismo patron que los demas
  app.get('/api/edificios', verificarToken, async (req, res) => {
      try {
          const { nombre, orden, direccion } = req.query;
          const pool = getPool();

          const columnasPermitidas = ['id', 'nombre', 'tiempo_construccion',
  'coste_oro', 'cant_madera', 'cant_piedra'];

          if (orden && !columnasPermitidas.includes(orden)) {
              return res.status(400).json({ mensaje: 'Campo de ordenacion no valido',
   columnasPermitidas });
          }
          if (direccion && !['asc', 'desc'].includes(direccion)) {
              return res.status(400).json({ mensaje: 'Direccion de ordenacion no
  valida', direccionesPermitidas: ['asc', 'desc'] });
          }

          let consulta = 'SELECT * FROM edificios WHERE 1 = 1';
          const valores = [];

          if (nombre) {
              valores.push('%' + nombre + '%');
              consulta += ' AND nombre ILIKE $' + valores.length;
          }

          const columnaOrden = orden || 'id';
          const direccionOrden = direccion === 'desc' ? 'DESC' : 'ASC';
          consulta += ' ORDER BY ' + columnaOrden + ' ' + direccionOrden;

          const resultado = await pool.query(consulta, valores);

          res.json({
              total: resultado.rowCount,
              filtros: { nombre: nombre || null, orden: columnaOrden, direccion:
  direccionOrden.toLowerCase() },
              datos: resultado.rows
          });
      } catch (error) {
          console.error('Error al consultar edificios:', error);
          res.status(500).json({ mensaje: 'Error al consultar los edificios' });
      }
  });


  /*
    Login - busca en usuarios por username (que guarda el email)
    y compara password. Devuelve token + datos del usuario
  */
  app.post('/auth/login', async (req, res) => {
      try {
          const { email, password } = req.body;
          const pool = getPool();

          if (!email || !password) {
              return res.status(400).json({ mensaje: 'Faltan campos' });
          }

          // buscamos por username que en nuestra BD es el email
          const sql = 'SELECT * FROM usuarios WHERE username = $1 AND password = $2';
          const resultado = await pool.query(sql, [email, password]);

          if (resultado.rowCount === 0) {
              return res.status(401).json({ mensaje: 'No se encontro al usuario' });
          }

          const usuario = resultado.rows[0];
          // sacamos el nombre de la parte antes de la @
          const nombre = usuario.username.includes('@') ?
  usuario.username.split('@')[0] : usuario.username;
          const token = jwt.sign(
              { id: usuario.id, username: usuario.username, nombre: nombre },
              JWT_SECRET,
              { expiresIn: '7d' }
          );

          // mismo formato que espera AuthDto.kt
          res.json({
              token: token,
              usuario: { id: usuario.id, nombre: nombre, email: usuario.username }
          });
      } catch (error) {
          console.error('Error en login:', error);
          res.status(500).json({ mensaje: 'Error en el servidor' });
      }
  });


  // registro - crea usuario nuevo, comprueba que no exista antes
  app.post('/auth/register', async (req, res) => {
      try {
          const { email, password, nombre } = req.body;
          const pool = getPool();

          if (!email || !password) {
              return res.status(400).json({ mensaje: 'Faltan campos obligatorios
  (email y password)' });
          }

          /* miramos si ya hay alguien con ese email */
          const existe = await pool.query('SELECT id FROM usuarios WHERE username =
  $1', [email]);

          if (existe.rowCount > 0) {
              return res.status(409).json({ mensaje: 'El usuario ya existe' });
          }

          const resultado = await pool.query('INSERT INTO usuarios (username,
  password) VALUES ($1, $2) RETURNING id, username, fecha_registro', [email,
  password]);
          const nuevoUsuario = resultado.rows[0];
          const nombreUsuario = nombre || (email.includes('@') ? email.split('@')[0]
  : email);
          const token = jwt.sign(
              { id: nuevoUsuario.id, username: nuevoUsuario.username, nombre:
  nombreUsuario },
              JWT_SECRET,
              { expiresIn: '7d' }
          );

          // 201 = creado correctamente
          res.status(201).json({
              token: token,
              usuario: { id: nuevoUsuario.id, nombre: nombreUsuario, email:
  nuevoUsuario.username }
          });
      } catch (error) {
          console.error('Error en registro:', error);
          res.status(500).json({ mensaje: 'Error en el servidor' });
      }
  });


  /*
    Calculadora de cultivos
    recibe array de { id, cantidad } y calcula coste/ingreso/beneficio
  */
  app.post('/api/calcular/cultivos', verificarToken, async (req, res) => {
      try {
          const { cultivos } = req.body;
          const pool = getPool();

          if (!cultivos || !Array.isArray(cultivos) || cultivos.length === 0) {
              return res.status(400).json({ mensaje: 'Debes enviar un array de
  cultivos con id y cantidad' });
          }

          const resultados = [];
          let beneficioTotal = 0;
          let costeTotal = 0;
          let ingresoTotal = 0;

          for (const item of cultivos) {
              const { id, cantidad } = item;
              if (!id || !cantidad || cantidad <= 0) continue;

              const resultado = await pool.query('SELECT * FROM cultivos WHERE id =
  $1', [id]);
              if (resultado.rowCount === 0) continue;

              const cultivo = resultado.rows[0];

              // precio * cantidad para sacar totales
              const coste = cultivo.precio_semilla * cantidad;
              const ingreso = cultivo.precio_venta * cantidad;
              const beneficio = ingreso - coste;

              costeTotal += coste;
              ingresoTotal += ingreso;
              beneficioTotal += beneficio;

              resultados.push({
                  id: cultivo.id,
                  nombre: cultivo.nombre,
                  cantidad: cantidad,
                  precio_semilla: cultivo.precio_semilla,
                  precio_venta: cultivo.precio_venta,
                  coste_total: coste,
                  ingreso_total: ingreso,
                  beneficio: beneficio,
                  temporada: cultivo.temporada,
                  tiempo_crecimiento: cultivo.tiempo_crecimiento
              });
          }

          res.json({
              cultivos: resultados,
              resumen: { coste_total: costeTotal, ingreso_total: ingresoTotal,
  beneficio_total: beneficioTotal }
          });
      } catch (error) {
          console.error('Error al calcular cultivos:', error);
          res.status(500).json({ mensaje: 'Error al calcular cultivos' });
      }
  });


  /*
    Calculadora de edificios
    recibe array de { id, cantidad }, busca materiales en BD y suma todo
  */
  app.post('/api/calcular/edificios', verificarToken, async (req, res) => {
      try {
          const { edificios } = req.body;
          const pool = getPool();

          if (!edificios || !Array.isArray(edificios) || edificios.length === 0) {
              return res.status(400).json({ mensaje: 'Debes enviar un array de
  edificios con id y cantidad' });
          }

          const resultados = [];
          // acumuladores
          let totalOro = 0;
          let totalMadera = 0;
          let totalPiedra = 0;
          let totalMaderaNoble = 0;
          let totalFibra = 0;
          let totalArcilla = 0;
          let totalCobre = 0;
          let totalHierro = 0;
          let totalIridio = 0;
          let totalCuarzo = 0;

          for (const item of edificios) {
              const { id, cantidad } = item;
              if (!id || !cantidad || cantidad <= 0) continue;

              const resultado = await pool.query('SELECT * FROM edificios WHERE id =
  $1', [id]);
              if (resultado.rowCount === 0) continue;

              const edificio = resultado.rows[0];

              totalOro += (edificio.coste_oro || 0) * cantidad;
              totalMadera += (edificio.cant_madera || 0) * cantidad;
              totalPiedra += (edificio.cant_piedra || 0) * cantidad;
              totalMaderaNoble += (edificio.cant_madera_noble || 0) * cantidad;
              totalFibra += (edificio.cant_fibra || 0) * cantidad;
              totalArcilla += (edificio.cant_arcilla || 0) * cantidad;
              totalCobre += (edificio.cant_lingote_cobre || 0) * cantidad;
              totalHierro += (edificio.cant_lingote_hierro || 0) * cantidad;
              totalIridio += (edificio.cant_lingote_iridio || 0) * cantidad;
              totalCuarzo += (edificio.cant_cuarzo_refinado || 0) * cantidad;

              resultados.push({
                  id: edificio.id,
                  nombre: edificio.nombre,
                  cantidad: cantidad,
                  coste_oro: edificio.coste_oro * cantidad,
                  cant_madera: edificio.cant_madera * cantidad,
                  cant_piedra: edificio.cant_piedra * cantidad,
                  tiempo_construccion: edificio.tiempo_construccion
              });
          }

          res.json({
              edificios: resultados,
              totales: {
                  oro: totalOro, madera: totalMadera, piedra: totalPiedra,
                  madera_noble: totalMaderaNoble, fibra: totalFibra, arcilla:
  totalArcilla,
                  lingote_cobre: totalCobre, lingote_hierro: totalHierro,
                  lingote_iridio: totalIridio, cuarzo_refinado: totalCuarzo
              }
          });
      } catch (error) {
          console.error('Error al calcular edificios:', error);
          res.status(500).json({ mensaje: 'Error al calcular edificios' });
      }
  });


  module.exports = app;

  // para desarrollo local, en vercel no hace falta el listen
  if (require.main === module) {
      const PORT = process.env.PORT || 3000;
      app.listen(PORT, () => {
          console.log('Servidor escuchando en http://localhost:' + PORT);
      });
  }