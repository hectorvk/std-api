-- Version PostgreSQL de BDstdDEFINITIVA.SQL
-- Archivo preparado para cargar la base de datos en PostgreSQL.

BEGIN;

DROP TABLE IF EXISTS cultivos, edificios, ganado, materiales, personajes, peces, capturas_nasa, arboles_frutales, herramientas, productos_artesanales, recetas_cocina, recoleccion, paquetes_centro_comunitario, usuarios CASCADE;

CREATE TABLE cultivos (
  id SERIAL NOT NULL,
  nombre varchar(255) NOT NULL,
  precio_semilla INTEGER NOT NULL DEFAULT 0,
  precio_venta INTEGER NOT NULL DEFAULT 0,
  tiempo_crecimiento INTEGER NOT NULL,
  tiempo_regreso INTEGER NOT NULL DEFAULT 0,
  temporada VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (id)
);

INSERT INTO cultivos (id, nombre, precio_semilla, precio_venta, tiempo_crecimiento, tiempo_regreso, temporada) VALUES
-- Primavera
(1, 'Chirivía', 20, 35, 4, 0, 'Primavera'),
(2, 'Ajo', 40, 60, 4, 0, 'Primavera'),
(3, 'Patata', 50, 80, 6, 0, 'Primavera'),
(4, 'Tulipán', 20, 30, 6, 0, 'Primavera'),
(5, 'Col rizada', 70, 110, 6, 0, 'Primavera'),
(6, 'Jazz azul', 30, 50, 7, 0, 'Primavera'),
(7, 'Fresa', 100, 120, 8, 4, 'Primavera'),
(8, 'Judía verde', 60, 40, 10, 3, 'Primavera'),
(9, 'Coliflor', 80, 175, 12, 0, 'Primavera'),
(10, 'Ruibarbo', 100, 220, 13, 0, 'Primavera'),
(11, 'Arroz sin moler', 40, 30, 6, 0, 'Primavera'),
-- Varias temporadas
(12, 'Trigo', 10, 25, 4, 0, 'Varias'),
(22, 'Maíz', 150, 50, 14, 4, 'Varias'),
(24, 'Girasol', 200, 80, 8, 0, 'Varias'),
(35, 'Grano de café', 2500, 15, 10, 2, 'Varias'),
(36, 'Fruta milenaria', 0, 550, 28, 7, 'Varias'),
-- Verano
(13, 'Chile', 40, 40, 5, 3, 'Verano'),
(14, 'Rábano', 40, 90, 6, 0, 'Verano'),
(15, 'Amapola', 100, 140, 7, 0, 'Verano'),
(16, 'Lentejuela de verano', 50, 100, 8, 0, 'Verano'),
(17, 'Lúpulo', 60, 25, 11, 1, 'Verano'),
(18, 'Tomate', 50, 60, 11, 4, 'Verano'),
(19, 'Melón', 80, 250, 12, 0, 'Verano'),
(20, 'Arándano', 80, 50, 13, 4, 'Verano'),
(21, 'Carambola', 400, 750, 13, 0, 'Verano'),
(23, 'Lombarda', 100, 260, 9, 0, 'Verano'),
-- Otoño
(25, 'Col china', 50, 80, 4, 0, 'Otoño'),
(26, 'Berenjena', 20, 60, 5, 5, 'Otoño'),
(27, 'Remolacha', 20, 100, 6, 0, 'Otoño'),
(28, 'Arándano rojo', 240, 75, 7, 5, 'Otoño'),
(29, 'Amaranto', 70, 150, 7, 0, 'Otoño'),
(30, 'Alcachofa', 30, 160, 8, 0, 'Otoño'),
(31, 'Ñame', 60, 160, 10, 0, 'Otoño'),
(32, 'Uva', 60, 80, 10, 3, 'Otoño'),
(33, 'Rosa hada', 200, 290, 12, 0, 'Otoño'),
(34, 'Calabaza', 100, 320, 13, 0, 'Otoño'),
(37, 'Baya de gema dulce', 1000, 3000, 24, 0, 'Otoño'),
-- Invernadero
(38, 'Fruta de cactus', 0, 75, 12, 3, 'Invernadero'),
(39, 'Flor de té', 500, 50, 20, 0, 'Primavera');


CREATE TABLE edificios (
  id SERIAL NOT NULL,
  nombre text NOT NULL,
  tiempo_construccion INTEGER NOT NULL DEFAULT 2,
  coste_oro INTEGER NOT NULL DEFAULT 0,
  cant_madera INTEGER NOT NULL DEFAULT 0,
  cant_piedra INTEGER NOT NULL DEFAULT 0,
  cant_madera_noble INTEGER NOT NULL DEFAULT 0,
  cant_fibra INTEGER NOT NULL DEFAULT 0,
  cant_arcilla INTEGER NOT NULL DEFAULT 0,
  cant_lingote_cobre INTEGER NOT NULL DEFAULT 0,
  cant_lingote_hierro INTEGER NOT NULL DEFAULT 0,
  cant_lingote_iridio INTEGER NOT NULL DEFAULT 0,
  cant_cuarzo_refinado INTEGER NOT NULL DEFAULT 0,
  otros_materiales text DEFAULT NULL,
  PRIMARY KEY (id)
);

INSERT INTO edificios (id, nombre, tiempo_construccion, coste_oro, cant_madera, cant_piedra, cant_madera_noble, cant_fibra, cant_arcilla, cant_lingote_cobre, cant_lingote_hierro, cant_lingote_iridio, cant_cuarzo_refinado, otros_materiales) VALUES
(1, 'Corral', 3, 4000, 300, 100, 0, 0, 0, 0, 0, 0, 0, NULL),
(2, 'Corral grande', 2, 10000, 400, 150, 0, 0, 0, 0, 0, 0, 0, NULL),
(3, 'Corral de lujo', 2, 20000, 500, 200, 0, 0, 0, 0, 0, 0, 0, NULL),
(4, 'Establo', 3, 6000, 350, 150, 0, 0, 0, 0, 0, 0, 0, NULL),
(5, 'Establo grande', 2, 12000, 450, 200, 0, 0, 0, 0, 0, 0, 0, NULL),
(6, 'Establo de lujo', 2, 25000, 550, 300, 0, 0, 0, 0, 0, 0, 0, NULL),
(7, 'Silo', 2, 100, 0, 100, 0, 0, 10, 5, 0, 0, 0, NULL),
(8, 'Molino', 2, 2500, 150, 50, 0, 0, 0, 0, 0, 0, 0, 'Tela: 4'),
(9, 'Cobertizo', 2, 15000, 300, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(10, 'Cobertizo grande', 2, 20000, 550, 300, 0, 0, 0, 0, 0, 0, 0, NULL),
(11, 'Criadero de babosas', 2, 10000, 0, 500, 0, 0, 0, 0, 0, 1, 10, NULL),
(12, 'Estanque de peces', 2, 5000, 0, 200, 0, 0, 0, 0, 0, 0, 0, 'Alga verde: 5, Algas: 5'),
(13, 'Caja de envíos', 0, 250, 150, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(14, 'Pozo', 2, 1000, 0, 75, 0, 0, 0, 0, 0, 0, 0, NULL),
(15, 'Cuadra', 2, 10000, 0, 0, 100, 0, 0, 0, 5, 0, 0, NULL),
(16, 'Cabaña de tablones', 0, 100, 10, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(17, 'Cabaña de troncos', 0, 100, 10, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(18, 'Cabaña de piedra', 0, 100, 0, 10, 0, 0, 0, 0, 0, 0, 0, NULL),
(19, 'Choza de junimos', 0, 20000, 0, 200, 0, 100, 0, 0, 0, 0, 0, 'Carambola: 9'),
(20, 'Obelisco terrestre', 0, 500000, 0, 0, 0, 0, 0, 0, 0, 10, 0, 'Cristal terrestre: 10'),
(21, 'Obelisco acuático', 0, 500000, 0, 0, 0, 0, 0, 0, 0, 5, 0, 'Almeja: 10, Coral: 10'),
(22, 'Obelisco del desierto', 0, 1000000, 0, 0, 0, 0, 0, 0, 0, 20, 0, 'Coco: 10, Fruta de cactus: 10'),
(23, 'Obelisco de la isla', 0, 1000000, 0, 0, 0, 0, 0, 0, 0, 10, 0, 'Diente de dragón: 10, Plátano: 10'),
(24, 'Reloj dorado', 0, 10000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);

CREATE TABLE ganado (
  id SERIAL NOT NULL,
  nombre varchar(255) NOT NULL,
  edificio_requerido varchar(255) DEFAULT NULL,
  precio_compra INTEGER NOT NULL DEFAULT 0,
  producto_nombre varchar(255) DEFAULT NULL,
  precio_producto INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (id)
);

INSERT INTO ganado (id, nombre, edificio_requerido, precio_compra, producto_nombre, precio_producto) VALUES
(1, 'Gallina', 'Corral', 800, 'Huevo', 50),
(2, 'Gallina del vacío', 'Corral grande', 0, 'Huevo sombrío', 65),
(3, 'Gallina azul', 'Corral', 0, 'Huevo', 50),
(4, 'Gallina dorada', 'Corral', 0, 'Huevo dorado', 500),
(5, 'Pato', 'Corral grande', 1200, 'Huevo de pato', 95),
(6, 'Conejo', 'Corral de lujo', 8000, 'Lana', 340),
(7, 'Dinosaurio', 'Corral grande', 0, 'Huevo de dinosaurio', 350),
(8, 'Vaca', 'Establo', 1500, 'Leche', 125),
(9, 'Cabra', 'Establo grande', 4000, 'Leche de cabra', 225),
(10, 'Oveja', 'Establo de lujo', 8000, 'Lana', 340),
(11, 'Cerdo', 'Establo de lujo', 16000, 'Trufa', 625),
(12, 'Avestruz', 'Establo grande', 0, 'Huevo de avestruz', 600);

CREATE TABLE materiales (
  id SERIAL NOT NULL,
  nombre varchar(255) NOT NULL,
  fuente varchar(255) DEFAULT NULL,
  precio_venta INTEGER NOT NULL DEFAULT 0,
  descripcion text DEFAULT NULL,
  PRIMARY KEY (id)
);

INSERT INTO materiales (id, nombre, fuente, precio_venta, descripcion) VALUES
(1, 'Madera', 'Tala', 2, 'Un recurso de construcción resistente.'),
(2, 'Piedra', 'Minería', 2, 'Un material de construcción común.'),
(3, 'Fibra', 'Recolección', 1, 'Materia vegetal cruda procedente de malas hierbas.'),
(4, 'Arcilla', 'Excavación', 20, 'Se encuentra cavando en la tierra o la arena.'),
(5, 'Madera noble', 'Tala (Hacha mejorada)', 15, 'Una madera especial muy resistente y bella.'),
(6, 'Savia', 'Tala', 2, 'Un fluido que se obtiene de los árboles.'),
(7, 'Carbón', 'Minería / Horno', 15, 'Un combustible esencial para la fundición y la artesanía.'),
(8, 'Mena de cobre', 'Minería (Niveles 1-39)', 5, 'Un mineral común que se puede fundir en lingotes.'),
(9, 'Lingote de cobre', 'Horno', 60, 'Un lingote de cobre puro.'),
(10, 'Mena de hierro', 'Minería (Niveles 40-79)', 10, 'Un metal bastante común que se puede fundir en lingotes.'),
(11, 'Lingote de hierro', 'Horno', 120, 'Un lingote de hierro puro.'),
(12, 'Mena de oro', 'Minería (Niveles 80+)', 25, 'Un metal precioso que se puede fundir en lingotes.'),
(13, 'Lingote de oro', 'Horno', 250, 'Un lingote de oro puro.'),
(14, 'Mena de iridio', 'Caverna Calavera', 100, 'Un metal exótico con propiedades curiosas.'),
(15, 'Lingote de iridio', 'Horno', 1000, 'Un lingote de iridio puro. Extremadamente duro.'),
(16, 'Mena radiactiva', 'Santuario del Desafío', 300, 'Brilla con una luz peligrosa. Puede fundirse.'),
(17, 'Lingote radiactivo', 'Horno', 3000, 'Peligroso al tacto y muy valioso.'),
(18, 'Cuarzo', 'Minería', 25, 'Un cristal transparente que se encuentra en las minas.'),
(19, 'Cristal terrestre', 'Minería (Niveles 1-39)', 50, 'Una sustancia resinosa encontrada cerca de la superficie.'),
(21, 'Cuarzo de fuego', 'Minería (Niveles 80+)', 100, 'Un cristal rojo brillante que se encuentra cerca de la lava.'),
(22, 'Cuarzo refinado', 'Horno', 50, 'Una forma más pura de cuarzo creada fundiéndolo.'),
(23, 'Fragmento prismático', 'Minería (Raro)', 2000, 'Una gema muy rara y poderosa con todos los colores.'),
(24, 'Baba', 'Monstruos (Babosas)', 5, 'Un pegote reluciente y gelatinoso sin olor.'),
(25, 'Ala de murciélago', 'Monstruos (Murciélagos)', 15, 'El material de las alas de un murciélago.'),
(26, 'Esencia solar', 'Monstruos (Fantasmas/Momias)', 40, 'Una sustancia brillante y cálida al tacto.'),
(27, 'Esencia sombría', 'Monstruos (Serpientes/Brutos)', 50, 'Una sustancia oscura que absorbe la luz.'),
(28, 'Fragmento de hueso', 'Monstruos (Esqueletos)', 50, 'Un trozo de hueso duro.'),
(29, 'Resina de roble', 'Resinera (Roble)', 150, 'Sustancia pegajosa derivada de la savia de roble.'),
(30, 'Jarabe de arce', 'Resinera (Arce)', 200, 'Un jarabe dulce con un sabor único.'),
(31, 'Brea de pino', 'Resinera (Pino)', 100, 'Sustancia picante derivada de la savia de pino.'),
(32, 'Diente de dragón', 'Volcán', 500, 'Se dice que estos dientes pertenecieron a antiguos dragones.'),
(33, 'Ceni-fragmento', 'Volcán', 50, 'Un trozo de piedra volcánica caliente.'),
(34, 'Pila', 'Pararrayos', 500, 'Está cargada de energía generada por una tormenta.');

CREATE TABLE personajes (
  id SERIAL NOT NULL,
  nombre varchar(255) NOT NULL,
  temporada_cumpleanos VARCHAR(50) DEFAULT NULL,
  dia_cumpleanos INTEGER DEFAULT NULL CHECK (dia_cumpleanos BETWEEN 1 AND 28),
  es_soltero SMALLINT NOT NULL DEFAULT 0,
  regalos_amados text DEFAULT NULL,
  regalos_odiados text DEFAULT NULL,
  imagen_url text DEFAULT NULL,
  PRIMARY KEY (id)
);

INSERT INTO personajes (id, nombre, temporada_cumpleanos, dia_cumpleanos, es_soltero, regalos_amados, regalos_odiados, imagen_url) VALUES
(1, 'Abigail', 'Otoño', 13, 1, 'Amatista, Tarta de calabaza, Anguila picante', 'Arcilla, Acebo', 'imagenes/abigail.png'),
(2, 'Alex', 'Verano', 13, 1, 'Desayuno completo, Cena de salmón', 'Cuarzo, Acebo', 'imagenes/alex.png'),
(3, 'Elliott', 'Otoño', 5, 1, 'Pastel de cangrejo, Pluma de pato, Granada, Langosta', 'Amaranto, Cuarzo, Pepino de mar', 'imagenes/elliott.png'),
(4, 'Emily', 'Primavera', 27, 1, 'Amatista, Aguamarina, Jade, Rubí, Lana, Tela', 'Sashimi, Taco de pescado, Maki', 'imagenes/emily.png'),
(5, 'Haley', 'Primavera', 14, 1, 'Coco, Ensalada de frutas, Tarta rosa, Girasol', 'Arcilla, Rábano silvestre, Fragmento prismático', 'imagenes/haley.png'),
(6, 'Harvey', 'Invierno', 14, 1, 'Café, Vino, Aceite de trufa, Encurtidos', 'Coral, Concha de nautilo, Pastel de especias', 'imagenes/harvey.png'),
(7, 'Leah', 'Invierno', 23, 1, 'Ensalada, Queso de cabra, Trufa, Vino, Muffin de amapola', 'Pan, Pizza, Tortitas', 'imagenes/leah.png'),
(8, 'Maru', 'Verano', 10, 1, 'Batería, Diamante, Lingote de oro, Fresas, Coliflor', 'Miel, Encurtidos, Nieve', 'imagenes/maru.png'),
(9, 'Penny', 'Otoño', 2, 1, 'Esmeralda, Amapola, Melón, Plato de raíces, Diamante', 'Cerveza, Vino, Hidromiel, Lúpulo', 'imagenes/penny.png'),
(10, 'Sam', 'Verano', 17, 1, 'Pizza, Fruto de cactus, Ojo de tigre, Pan de arce', 'Mayonesa, Encurtidos, Carbón, Minerales', 'imagenes/sam.png'),
(11, 'Sebastian', 'Invierno', 10, 1, 'Lágrima helada, Sashimi, Sopa de calabaza, Huevo sombrío', 'Tortilla, Almuerzo de granjero, Arcilla', 'imagenes/sebastian.png'),
(12, 'Shane', 'Primavera', 20, 1, 'Cerveza, Pizza, Poppers de pimienta, Chile', 'Encurtidos, Cuarzo', 'imagenes/shane.png'),
(13, 'Caroline', 'Invierno', 7, 0, 'Taco de pescado, Té verde, Narciso de verano', 'Cuarzo, Mayonesa de pato', 'imagenes/caroline.png'),
(14, 'Clint', 'Invierno', 26, 0, 'Amatista, Aguamarina, Esmeralda, Lingote de oro, Omni geoda', 'Flores, Acebo', 'imagenes/clint.png'),
(15, 'Demetrius', 'Verano', 19, 0, 'Helado, Fresa, Plato de judías, Arroz con leche', 'Acebo', 'imagenes/demetrius.png'),
(16, 'Dwarf', 'Verano', 22, 0, 'Amatista, Aguamarina, Esmeralda, Jade, Rubí, Topacio, Omni geoda', 'Leche, Huevos', 'imagenes/dwarf.png'),
(17, 'Evelyn', 'Invierno', 20, 0, 'Remolacha, Chocolate, Diamante, Tulipán', 'Coral, Concha de nautilo, Almeja', 'imagenes/evelyn.png'),
(18, 'George', 'Verano', 24, 0, 'Puerros, Setas salteadas', 'Arcilla, Diente de león', 'imagenes/george.png'),
(19, 'Gus', 'Verano', 8, 0, 'Diamante, Escargot, Taco de pescado, Naranja', 'Coleslaw', 'imagenes/gus.png'),
(20, 'Jas', 'Verano', 4, 0, 'Pudin de ciruela, Tarta rosa, Rosa hada', 'Arcilla, Miel, Café', 'imagenes/jas.png'),
(21, 'Jodi', 'Otoño', 11, 0, 'Pastel de chocolate, Lubina crujiente, Tortitas, Ruibarbo', 'Narciso, Diente de león', 'imagenes/jodi.png'),
(22, 'Kent', 'Primavera', 4, 0, 'Avellanas tostadas, Risotto de helecho', 'Acebo, Sashimi, Tortilla, Leche', 'imagenes/kent.png'),
(23, 'Krobus', 'Invierno', 1, 0, 'Diamante, Iridio, Calabaza, Mayonesa sombría, Rábano silvestre', 'Sashimi, Sushi, Maki', 'imagenes/krobus.png'),
(24, 'Leo', 'Verano', 26, 0, 'Pluma de pato, Mango, Huevo de avestruz, Poi', 'Cerveza, Acebo, Lúpulo, Vino', 'imagenes/leo.png'),
(25, 'Lewis', 'Primavera', 7, 0, 'Chile, Té verde, Ñame glaseado, Pimiento', 'Acebo, Cuarzo', 'imagenes/lewis.png'),
(26, 'Linus', 'Invierno', 3, 0, 'Tarta de arándanos, Fruto de cactus, Coco, Ñame', 'Carpa, Algas', 'imagenes/linus.png'),
(27, 'Marnie', 'Otoño', 18, 0, 'Diamante, Almuerzo de granjero, Tarta rosa, Calabaza', 'Arcilla', 'imagenes/marnie.png'),
(28, 'Pam', 'Primavera', 18, 0, 'Cerveza, Fruto de cactus, Hidromiel, Cerveza pálida, Chirivía', 'Octopus, Calamar', 'imagenes/pam.png'),
(29, 'Pierre', 'Primavera', 26, 0, 'Calamares fritos', 'Tortilla, Chirivía, Maíz, Ajo', 'imagenes/pierre.png'),
(30, 'Robin', 'Otoño', 21, 0, 'Queso de cabra, Melocotón, Espagueti', 'Acebo', 'imagenes/robin.png'),
(31, 'Sandy', 'Otoño', 15, 0, 'Crocus, Narciso, Guisante dulce', 'Acebo', 'imagenes/sandy.png'),
(32, 'Vincent', 'Primavera', 10, 0, 'Pastel de arándanos, Caracoles, Uvas', 'Arcilla, Miel', 'imagenes/vincent.png'),
(33, 'Willy', 'Verano', 24, 0, 'Bagre, Diamante, Iridio, Hidromiel, Pulpo, Calabaza', 'Sashimi, Pizza', 'imagenes/willy.png'),
(34, 'Wizard', 'Invierno', 17, 0, 'Seta morada, Esencia solar, Esencia vacía, Tela', 'Limo, Leche', 'imagenes/wizard.png');

CREATE TABLE peces (
  id SERIAL NOT NULL,
  nombre varchar(255) NOT NULL,
  nombre_en varchar(255) NOT NULL,
  ubicacion varchar(255) NOT NULL,
  temporada varchar(255) NOT NULL,
  horario varchar(50) DEFAULT 'Todo el día',
  clima varchar(50) DEFAULT 'Cualquiera',
  precio_venta INTEGER NOT NULL DEFAULT 0,
  dificultad INTEGER NOT NULL DEFAULT 0,
  es_legendario SMALLINT NOT NULL DEFAULT 0,
  PRIMARY KEY (id)
);

INSERT INTO peces (id, nombre, nombre_en, ubicacion, temporada, horario, clima, precio_venta, dificultad, es_legendario) VALUES
-- Río
(1, 'Brema', 'Bream', 'Río', 'Todas', '6pm-2am', 'Cualquiera', 45, 35, 0),
(2, 'Bagre', 'Catfish', 'Río', 'Primavera, Otoño', '6am-12am', 'Lluvia', 200, 75, 0),
(3, 'Cacho', 'Chub', 'Lago montaña, Río bosque', 'Todas', 'Todo el día', 'Cualquiera', 50, 35, 0),
(4, 'Dorado', 'Dorado', 'Río bosque', 'Verano', '6am-7pm', 'Cualquiera', 100, 78, 0),
(5, 'Mero', 'Lingcod', 'Río, Lago montaña', 'Invierno', '6am-2am', 'Cualquiera', 120, 85, 0),
(6, 'Lucio', 'Pike', 'Río, Estanque bosque', 'Verano, Invierno', '6am-7pm', 'Cualquiera', 100, 60, 0),
(7, 'Trucha arcoíris', 'Rainbow Trout', 'Río', 'Verano', '6am-7pm', 'Sol', 65, 45, 0),
(8, 'Salmón', 'Salmon', 'Río', 'Otoño', '6am-7pm', 'Cualquiera', 75, 50, 0),
(9, 'Sábalo', 'Shad', 'Río', 'Primavera, Verano, Otoño', '9am-2am', 'Lluvia', 60, 45, 0),
(10, 'Perca negra', 'Smallmouth Bass', 'Río (pueblo)', 'Primavera, Otoño', '6am-7pm', 'Cualquiera', 50, 28, 0),
(11, 'Pez sol', 'Sunfish', 'Río', 'Primavera, Verano', '6am-7pm', 'Sol', 30, 30, 0),
(12, 'Trucha tigre', 'Tiger Trout', 'Río', 'Otoño, Invierno', '6am-7pm', 'Cualquiera', 150, 60, 0),
(13, 'Lucioperca', 'Walleye', 'Río, Estanque, Lago', 'Otoño', '12pm-2am', 'Lluvia', 105, 45, 0),
-- Océano
(14, 'Albacora', 'Albacore', 'Océano', 'Otoño, Invierno', '6am-11am / 6pm-2am', 'Cualquiera', 75, 60, 0),
(15, 'Anchoa', 'Anchovy', 'Océano', 'Primavera, Otoño', 'Todo el día', 'Cualquiera', 30, 30, 0),
(16, 'Anguila', 'Eel', 'Océano', 'Primavera, Otoño', '4pm-2am', 'Lluvia', 85, 70, 0),
(17, 'Platija', 'Flounder', 'Océano', 'Primavera, Verano', '6am-8pm', 'Cualquiera', 100, 50, 0),
(18, 'Halibut', 'Halibut', 'Océano', 'Verano, Invierno', '6am-11am / 7pm-11pm', 'Cualquiera', 80, 50, 0),
(19, 'Arenque', 'Herring', 'Océano', 'Primavera, Invierno', 'Todo el día', 'Cualquiera', 30, 25, 0),
(20, 'Pulpo', 'Octopus', 'Océano', 'Verano', '6am-1pm', 'Cualquiera', 150, 95, 0),
(21, 'Pez globo', 'Pufferfish', 'Océano', 'Verano', '12pm-4pm', 'Sol', 200, 80, 0),
(22, 'Salmonete', 'Red Mullet', 'Océano', 'Verano, Invierno', '6am-7pm', 'Cualquiera', 75, 55, 0),
(23, 'Pargo rojo', 'Red Snapper', 'Océano', 'Verano, Otoño', '6am-7pm', 'Lluvia', 50, 40, 0),
(24, 'Sardina', 'Sardine', 'Océano', 'Primavera, Otoño, Invierno', '6am-7pm', 'Cualquiera', 40, 30, 0),
(25, 'Pepino de mar', 'Sea Cucumber', 'Océano', 'Otoño, Invierno', '6am-7pm', 'Cualquiera', 75, 40, 0),
(26, 'Calamar', 'Squid', 'Océano', 'Invierno', '6pm-2am', 'Cualquiera', 80, 75, 0),
(27, 'Super pepino de mar', 'Super Cucumber', 'Océano', 'Verano, Otoño', '6pm-2am', 'Cualquiera', 250, 60, 0),
(28, 'Tilapia', 'Tilapia', 'Océano', 'Verano, Otoño', '6am-2pm', 'Cualquiera', 75, 50, 0),
(29, 'Atún', 'Tuna', 'Océano', 'Verano, Invierno', '6am-7pm', 'Cualquiera', 100, 70, 0),
-- Lago de montaña
(30, 'Pez toro', 'Bullhead', 'Lago montaña', 'Todas', 'Todo el día', 'Cualquiera', 75, 46, 0),
(31, 'Carpa', 'Carp', 'Lago montaña, Bosque secreto', 'Todas', 'Todo el día', 'Cualquiera', 30, 15, 0),
(32, 'Lubina', 'Largemouth Bass', 'Lago montaña', 'Todas', '6am-7pm', 'Cualquiera', 100, 50, 0),
(33, 'Carpa nocturna', 'Midnight Carp', 'Lago montaña, Estanque bosque', 'Otoño, Invierno', '10pm-2am', 'Cualquiera', 150, 55, 0),
(34, 'Perca', 'Perch', 'Río, Lago montaña', 'Invierno', 'Todo el día', 'Cualquiera', 55, 35, 0),
(35, 'Esturión', 'Sturgeon', 'Lago montaña', 'Verano, Invierno', '6am-7pm', 'Cualquiera', 200, 78, 0),
-- Bosque secreto
(36, 'Pez bosque', 'Woodskip', 'Estanque Bosque secreto', 'Todas', '6am-2am', 'Cualquiera', 75, 50, 0),
(37, 'Gobio', 'Goby', 'Cascadas Bosque Cindersap', 'Todas', '6am-2am', 'Cualquiera', 150, 50, 0),
-- Minas
(38, 'Pez fantasma', 'Ghostfish', 'Minas (nivel 20/60)', 'Todas', 'Todo el día', 'Cualquiera', 45, 50, 0),
(39, 'Pez piedra', 'Stonefish', 'Minas (nivel 20)', 'Todas', 'Todo el día', 'Cualquiera', 300, 65, 0),
(40, 'Pez hielo', 'Ice Pip', 'Minas (nivel 60)', 'Todas', 'Todo el día', 'Cualquiera', 500, 85, 0),
(41, 'Anguila de lava', 'Lava Eel', 'Minas (nivel 100), Volcán', 'Todas', 'Todo el día', 'Cualquiera', 700, 90, 0),
-- Desierto
(42, 'Pez arena', 'Sandfish', 'Estanque Desierto Calico', 'Todas', '6am-10pm', 'Cualquiera', 75, 65, 0),
(43, 'Carpa escorpión', 'Scorpion Carp', 'Estanque Desierto Calico', 'Todas', '6am-8pm', 'Cualquiera', 150, 90, 0),
-- Especiales
(44, 'Salmón vacío', 'Void Salmon', 'Pantano de la Bruja', 'Todas', 'Todo el día', 'Cualquiera', 150, 80, 0),
(45, 'Babosa Jack', 'Slimejack', 'Guarida Insectos Mutantes', 'Todas', '6am-2am', 'Cualquiera', 80, 55, 0),
-- Isla Ginger
(46, 'Disco azul', 'Blue Discus', 'Ríos Isla Ginger', 'Todas', '6am-7pm', 'Cualquiera', 80, 60, 0),
(47, 'Pez león', 'Lionfish', 'Océano Isla Ginger', 'Todas', 'Todo el día', 'Cualquiera', 100, 50, 0),
(48, 'Raya', 'Stingray', 'Cueva Pirata, Isla Ginger', 'Todas', 'Todo el día', 'Cualquiera', 180, 80, 0),
-- Mercado Nocturno (Invierno 15-17)
(49, 'Calamar nocturno', 'Midnight Squid', 'Submarino (Mercado Nocturno)', 'Invierno 15-17', '5pm-2am', 'Cualquiera', 80, 55, 0),
(50, 'Pez fantasmal', 'Spook Fish', 'Submarino (Mercado Nocturno)', 'Invierno 15-17', '5pm-2am', 'Cualquiera', 220, 60, 0),
(51, 'Pez gota', 'Blobfish', 'Submarino (Mercado Nocturno)', 'Invierno 15-17', '5pm-2am', 'Cualquiera', 500, 75, 0),
-- Legendarios
(52, 'Leyenda', 'Legend', 'Lago montaña', 'Primavera', 'Todo el día', 'Lluvia', 5000, 110, 1),
(53, 'Pez carmesí', 'Crimsonfish', 'Muelle este (Playa)', 'Verano', '6am-2am', 'Cualquiera', 1500, 95, 1),
(54, 'Pez glacial', 'Glacierfish', 'Isla Punta Flecha (Bosque)', 'Invierno', '6am-2am', 'Cualquiera', 1000, 100, 1),
(55, 'Pez ángel', 'Angler', 'Río norte (puente Joja)', 'Otoño', '6am-8pm', 'Cualquiera', 900, 85, 1),
(56, 'Carpa mutante', 'Mutant Carp', 'Alcantarillado', 'Todas', 'Todo el día', 'Cualquiera', 1000, 80, 1),
-- Legendarios II (Misión Mr. Qi)
(57, 'Leyenda II', 'Legend II', 'Lago montaña', 'Todas', 'Todo el día', 'Lluvia', 5000, 110, 1),
(58, 'Hijo de Carmesí', 'Son of Crimsonfish', 'Muelle este (Playa)', 'Todas', '6am-2am', 'Cualquiera', 1500, 95, 1),
(59, 'Glacial Jr.', 'Glacierfish Jr.', 'Isla Punta Flecha (Bosque)', 'Todas', '6am-2am', 'Cualquiera', 1000, 100, 1),
(60, 'Sra. Ángel', 'Ms. Angler', 'Río norte (puente Joja)', 'Todas', '6am-8pm', 'Cualquiera', 900, 85, 1),
(61, 'Carpa radiactiva', 'Radioactive Carp', 'Alcantarillado', 'Todas', 'Todo el día', 'Cualquiera', 1000, 80, 1);

CREATE TABLE capturas_nasa (
  id SERIAL NOT NULL,
  nombre varchar(255) NOT NULL,
  nombre_en varchar(255) NOT NULL,
  tipo_agua VARCHAR(50) NOT NULL,
  precio_venta INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (id)
);

INSERT INTO capturas_nasa (id, nombre, nombre_en, tipo_agua, precio_venta) VALUES
-- Agua salada (océano)
(1, 'Langosta', 'Lobster', 'Salada', 120),
(2, 'Cangrejo', 'Crab', 'Salada', 100),
(3, 'Gamba', 'Shrimp', 'Salada', 60),
(4, 'Berberecho', 'Cockle', 'Salada', 50),
(5, 'Mejillón', 'Mussel', 'Salada', 30),
(6, 'Ostra', 'Oyster', 'Salada', 40),
-- Agua dulce (río / lago)
(7, 'Cangrejo de río', 'Crayfish', 'Dulce', 75),
(8, 'Caracol', 'Snail', 'Dulce', 65),
(9, 'Bígaro', 'Periwinkle', 'Dulce', 20);

CREATE TABLE arboles_frutales (
  id SERIAL NOT NULL,
  nombre varchar(255) NOT NULL,
  nombre_en varchar(255) NOT NULL,
  coste_plantula varchar(100) NOT NULL,
  fruta varchar(255) NOT NULL,
  precio_fruta INTEGER NOT NULL,
  temporada_produccion varchar(50) NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO arboles_frutales (id, nombre, nombre_en, coste_plantula, fruta, precio_fruta, temporada_produccion) VALUES
(1, 'Albaricoquero', 'Apricot Tree', '2000g', 'Albaricoque', 50, 'Primavera'),
(2, 'Cerezo', 'Cherry Tree', '3400g', 'Cereza', 80, 'Primavera'),
(3, 'Naranjo', 'Orange Tree', '4000g', 'Naranja', 100, 'Verano'),
(4, 'Melocotonero', 'Peach Tree', '6000g', 'Melocotón', 140, 'Verano'),
(5, 'Manzano', 'Apple Tree', '4000g', 'Manzana', 100, 'Otoño'),
(6, 'Granado', 'Pomegranate Tree', '6000g', 'Granada', 140, 'Otoño'),
(7, 'Bananero', 'Banana Tree', '5 Dientes de dragón', 'Plátano', 150, 'Verano'),
(8, 'Manguero', 'Mango Tree', '75 Mejillones', 'Mango', 130, 'Verano');

CREATE TABLE herramientas (
  id SERIAL NOT NULL,
  nombre_herramienta varchar(100) NOT NULL,
  nivel varchar(50) NOT NULL,
  coste_oro INTEGER NOT NULL,
  lingotes_necesarios INTEGER NOT NULL DEFAULT 5,
  tipo_lingote varchar(50) NOT NULL,
  dias_mejora INTEGER NOT NULL DEFAULT 2,
  PRIMARY KEY (id)
);

INSERT INTO herramientas (id, nombre_herramienta, nivel, coste_oro, lingotes_necesarios, tipo_lingote, dias_mejora) VALUES
-- Azada
(1, 'Azada', 'Cobre', 2000, 5, 'Lingote de cobre', 2),
(2, 'Azada', 'Acero', 5000, 5, 'Lingote de hierro', 2),
(3, 'Azada', 'Oro', 10000, 5, 'Lingote de oro', 2),
(4, 'Azada', 'Iridio', 25000, 5, 'Lingote de iridio', 2),
-- Pico
(5, 'Pico', 'Cobre', 2000, 5, 'Lingote de cobre', 2),
(6, 'Pico', 'Acero', 5000, 5, 'Lingote de hierro', 2),
(7, 'Pico', 'Oro', 10000, 5, 'Lingote de oro', 2),
(8, 'Pico', 'Iridio', 25000, 5, 'Lingote de iridio', 2),
-- Hacha
(9, 'Hacha', 'Cobre', 2000, 5, 'Lingote de cobre', 2),
(10, 'Hacha', 'Acero', 5000, 5, 'Lingote de hierro', 2),
(11, 'Hacha', 'Oro', 10000, 5, 'Lingote de oro', 2),
(12, 'Hacha', 'Iridio', 25000, 5, 'Lingote de iridio', 2),
-- Regadera
(13, 'Regadera', 'Cobre', 2000, 5, 'Lingote de cobre', 2),
(14, 'Regadera', 'Acero', 5000, 5, 'Lingote de hierro', 2),
(15, 'Regadera', 'Oro', 10000, 5, 'Lingote de oro', 2),
(16, 'Regadera', 'Iridio', 25000, 5, 'Lingote de iridio', 2),
-- Cubo de basura (costes diferentes)
(17, 'Cubo de basura', 'Cobre', 1000, 5, 'Lingote de cobre', 0),
(18, 'Cubo de basura', 'Acero', 2500, 5, 'Lingote de hierro', 0),
(19, 'Cubo de basura', 'Oro', 5000, 5, 'Lingote de oro', 0),
(20, 'Cubo de basura', 'Iridio', 12500, 5, 'Lingote de iridio', 0);

CREATE TABLE productos_artesanales (
  id SERIAL NOT NULL,
  maquina varchar(100) NOT NULL,
  item_entrada varchar(255) NOT NULL,
  item_salida varchar(255) NOT NULL,
  tiempo_proceso varchar(100) DEFAULT NULL,
  formula_precio varchar(255) DEFAULT NULL,
  precio_fijo INTEGER DEFAULT NULL,
  PRIMARY KEY (id)
);

INSERT INTO productos_artesanales (id, maquina, item_entrada, item_salida, tiempo_proceso, formula_precio, precio_fijo) VALUES
-- Barril (Keg)
(1, 'Barril', 'Cualquier fruta', 'Vino', '7 días (10000 min)', '3 × precio base fruta', NULL),
(2, 'Barril', 'Cualquier verdura', 'Zumo', '4 días (6000 min)', '2.25 × precio base verdura', NULL),
(3, 'Barril', 'Trigo', 'Cerveza', '1 día 16h (1750 min)', NULL, 200),
(4, 'Barril', 'Lúpulo', 'Cerveza pálida', '1 día 16h (2250 min)', NULL, 300),
(5, 'Barril', 'Miel', 'Hidromiel', '10 horas', NULL, 200),
(6, 'Barril', 'Grano de café ×5', 'Café', '2 horas', NULL, 150),
(7, 'Barril', 'Hojas de té', 'Té verde', '3 horas', NULL, 100),
-- Tarro de conservas (Preserves Jar)
(8, 'Tarro de conservas', 'Cualquier fruta', 'Mermelada', '2-3 días (4000 min)', '2 × precio base fruta + 50', NULL),
(9, 'Tarro de conservas', 'Cualquier verdura', 'Encurtidos', '2-3 días (4000 min)', '2 × precio base verdura + 50', NULL),
-- Prensa de queso (Cheese Press)
(10, 'Prensa de queso', 'Leche', 'Queso', '3.3 horas (200 min)', NULL, 230),
(11, 'Prensa de queso', 'Leche grande', 'Queso (oro)', '3.3 horas (200 min)', NULL, 345),
(12, 'Prensa de queso', 'Leche de cabra', 'Queso de cabra', '3.3 horas (200 min)', NULL, 400),
(13, 'Prensa de queso', 'Leche cabra grande', 'Queso de cabra (oro)', '3.3 horas (200 min)', NULL, 600),
-- Máquina de mayonesa
(14, 'Máquina de mayonesa', 'Huevo', 'Mayonesa', '3.3 horas (200 min)', NULL, 190),
(15, 'Máquina de mayonesa', 'Huevo grande', 'Mayonesa (oro)', '3.3 horas (200 min)', NULL, 285),
(16, 'Máquina de mayonesa', 'Huevo de pato', 'Mayonesa de pato', '3.3 horas (200 min)', NULL, 375),
(17, 'Máquina de mayonesa', 'Huevo sombrío', 'Mayonesa sombría', '3.3 horas (200 min)', NULL, 275),
(18, 'Máquina de mayonesa', 'Huevo de dinosaurio', 'Mayonesa dinosaurio', '3.3 horas (200 min)', NULL, 800),
(19, 'Máquina de mayonesa', 'Huevo de avestruz', 'Mayonesa ×10', '3.3 horas (200 min)', NULL, 1900),
-- Telar (Loom)
(20, 'Telar', 'Lana', 'Tela', '4 horas (240 min)', NULL, 470),
-- Prensa de aceite (Oil Maker)
(21, 'Prensa de aceite', 'Trufa', 'Aceite de trufa', '6 horas (360 min)', NULL, 1065),
(22, 'Prensa de aceite', 'Girasol', 'Aceite', '1 hora (60 min)', NULL, 100),
(23, 'Prensa de aceite', 'Maíz', 'Aceite', '1 hora (60 min)', NULL, 100),
-- Molino (Mill)
(24, 'Molino', 'Trigo', 'Harina de trigo', 'Toda la noche', NULL, 50),
(25, 'Molino', 'Arroz sin moler', 'Arroz', 'Toda la noche', NULL, 100),
(26, 'Molino', 'Remolacha', 'Azúcar', 'Toda la noche', NULL, 50),
-- Colmena (Bee House)
(27, 'Colmena', 'Sin flor', 'Miel silvestre', '~4 días', NULL, 100),
(28, 'Colmena', 'Tulipán cercano', 'Miel de tulipán', '~4 días', NULL, 160),
(29, 'Colmena', 'Jazz azul cercano', 'Miel de jazz azul', '~4 días', NULL, 200),
(30, 'Colmena', 'Girasol cercano', 'Miel de girasol', '~4 días', NULL, 260),
(31, 'Colmena', 'Lentejuela verano cerca', 'Miel de lentejuela', '~4 días', NULL, 280),
(32, 'Colmena', 'Amapola cercana', 'Miel de amapola', '~4 días', NULL, 380),
(33, 'Colmena', 'Rosa hada cercana', 'Miel de rosa hada', '~4 días', NULL, 680);


CREATE TABLE recetas_cocina (
  id SERIAL NOT NULL,
  nombre varchar(255) NOT NULL,
  nombre_en varchar(255) NOT NULL,
  ingredientes text NOT NULL,
  precio_venta INTEGER NOT NULL DEFAULT 0,
  energia INTEGER NOT NULL DEFAULT 0,
  salud INTEGER NOT NULL DEFAULT 0,
  fuente varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
);

INSERT INTO recetas_cocina (id, nombre, nombre_en, ingredientes, precio_venta, energia, salud, fuente) VALUES
(1, 'Sopa de algas', 'Algae Soup', 'Alga verde×4', 100, 175, 78, 'Clint (corazón 3)'),
(2, 'Crema de alcachofa', 'Artichoke Dip', 'Alcachofa×1, Leche×1', 210, 125, 56, 'Queen of Sauce (Otoño 28, Año 1)'),
(3, 'Guiso de otoño', 'Autumn''s Bounty', 'Ñame×1, Calabaza×1', 350, 220, 99, 'Demetrius (corazón 7)'),
(4, 'Pescado al horno', 'Baked Fish', 'Pez sol×1, Brema×1, Harina de trigo×1', 100, 100, 45, 'Queen of Sauce (Verano 7, Año 1)'),
(5, 'Pudín de plátano', 'Banana Pudding', 'Plátano×1, Leche×1, Azúcar×1', 260, 113, 50, 'Isla Ginger (compra)'),
(6, 'Plato de judías', 'Bean Hotpot', 'Judía verde×2', 100, 125, 56, 'Clint (corazón 7)'),
(7, 'Pastel de moras', 'Blackberry Cobbler', 'Mora×2, Azúcar×1, Harina de trigo×1', 260, 175, 78, 'Queen of Sauce (Otoño 14, Año 2)'),
(8, 'Tarta de arándanos', 'Blueberry Tart', 'Arándano×1, Harina de trigo×1, Azúcar×1, Huevo×1', 150, 125, 56, 'Pierre (compra)'),
(9, 'Pan', 'Bread', 'Harina de trigo×1', 60, 50, 22, 'Queen of Sauce (Primavera 28, Año 1)'),
(10, 'Bruschetta', 'Bruschetta', 'Pan×1, Aceite×1, Tomate×1', 210, 113, 50, 'Queen of Sauce (Invierno 21, Año 2)'),
(11, 'Sorpresa de carpa', 'Carp Surprise', 'Carpa×4', 150, 175, 78, 'Queen of Sauce (Verano 7, Año 2)'),
(12, 'Coliflor con queso', 'Cheese Cauliflower', 'Coliflor×1, Queso×1', 300, 175, 78, 'Pam (corazón 3)'),
(13, 'Pastel de chocolate', 'Chocolate Cake', 'Harina de trigo×1, Azúcar×1, Huevo×1', 200, 200, 90, 'Queen of Sauce (Invierno 14, Año 1)'),
(14, 'Sopa de almejas', 'Chowder', 'Almeja×1, Leche×1', 135, 225, 101, 'Willy (corazón 3)'),
(15, 'Coleslaw', 'Coleslaw', 'Lombarda×1, Vinagre×1, Mayonesa×1', 345, 175, 78, 'Queen of Sauce (Primavera 14, Año 2)'),
(16, 'Desayuno completo', 'Complete Breakfast', 'Huevo frito×1, Leche×1, Hashbrowns×1, Tortitas×1', 350, 200, 90, 'Queen of Sauce (Primavera 21, Año 2)'),
(17, 'Galleta', 'Cookie', 'Harina de trigo×1, Azúcar×1, Huevo×1', 140, 90, 40, 'Evelyn (corazón 4)'),
(18, 'Pastel de cangrejo', 'Crab Cakes', 'Cangrejo×1, Harina de trigo×1, Huevo×1, Aceite×1', 275, 225, 101, 'Queen of Sauce (Otoño 21, Año 2)'),
(19, 'Dulce de arándano rojo', 'Cranberry Candy', 'Arándano rojo×1, Manzana×1, Azúcar×1', 175, 175, 78, 'Queen of Sauce (Invierno 28, Año 1)'),
(20, 'Salsa de arándano rojo', 'Cranberry Sauce', 'Arándano rojo×1, Azúcar×1', 120, 125, 56, 'Gus (corazón 7)'),
(21, 'Lubina crujiente', 'Crispy Bass', 'Lubina×1, Harina de trigo×1, Aceite×1', 150, 125, 56, 'Kent (corazón 3)'),
(22, 'Plato del mar', 'Dish O'' The Sea', 'Sardina×2, Hashbrowns×1', 220, 150, 67, 'Nivel Pesca 3'),
(23, 'Berenjenas a la parmesana', 'Eggplant Parmesan', 'Berenjena×1, Tomate×1', 200, 175, 78, 'Lewis (corazón 7)'),
(24, 'Escargot', 'Escargot', 'Caracol×1, Ajo×1', 125, 225, 101, 'Willy (corazón 5)'),
(25, 'Almuerzo de granjero', 'Farmer''s Lunch', 'Tortilla×1, Chirivía×1', 150, 200, 90, 'Nivel Cultivo 3'),
(26, 'Risotto de helecho', 'Fiddlehead Risotto', 'Aceite×1, Helecho violeta×1, Ajo×1', 350, 225, 101, 'Queen of Sauce (Otoño 28, Año 2)'),
(27, 'Guiso de pescado', 'Fish Stew', 'Cangrejo de río×1, Mejillón×1, Bígaro×1, Tomate×1', 175, 225, 101, 'Willy (corazón 7)'),
(28, 'Taco de pescado', 'Fish Taco', 'Atún×1, Tortilla de maíz×1, Lombarda×1, Mayonesa×1', 500, 165, 74, 'Linus (corazón 7)'),
(29, 'Calamares fritos', 'Fried Calamari', 'Calamar×1, Harina de trigo×1, Aceite×1', 150, 125, 56, 'Jodi (corazón 3)'),
(30, 'Anguila frita', 'Fried Eel', 'Anguila×1, Aceite×1', 120, 100, 45, 'George (corazón 7)'),
(31, 'Huevo frito', 'Fried Egg', 'Huevo×1', 35, 50, 22, 'Inicial (conocida desde el inicio)'),
(32, 'Setas fritas', 'Fried Mushroom', 'Seta común×1, Colmenilla×1, Aceite×1', 200, 135, 60, 'Demetrius (corazón 3)'),
(33, 'Ensalada de frutas', 'Fruit Salad', 'Arándano×1, Melón×1, Albaricoque×1', 450, 263, 118, 'Queen of Sauce (Otoño 7, Año 2)'),
(34, 'Ginger ale', 'Ginger Ale', 'Jengibre×3, Azúcar×1', 200, 63, 28, 'Dwarf Isla Ginger'),
(35, 'Ñame glaseado', 'Glazed Yams', 'Ñame×1, Azúcar×1', 200, 200, 90, 'Queen of Sauce (Otoño 21, Año 1)'),
(36, 'Hashbrowns', 'Hashbrowns', 'Patata×1, Aceite×1', 120, 90, 40, 'Queen of Sauce (Primavera 14, Año 2)'),
(37, 'Helado', 'Ice Cream', 'Leche×1, Azúcar×1', 120, 100, 45, 'Jodi (corazón 7)'),
(38, 'Sopa de langosta', 'Lobster Bisque', 'Langosta×1, Leche×1', 205, 225, 101, 'Willy (corazón 9) / Q.o.S.'),
(39, 'Almuerzo de la suerte', 'Lucky Lunch', 'Pepino de mar×1, Tortilla de maíz×1, Jazz azul×1', 250, 100, 45, 'Queen of Sauce (Primavera 28, Año 2)'),
(40, 'Maki', 'Maki Roll', 'Cualquier pez×1, Alga marina×1, Arroz×1', 220, 100, 45, 'Queen of Sauce (Verano 21, Año 1)'),
(41, 'Arroz con mango', 'Mango Sticky Rice', 'Mango×1, Coco×1, Arroz×1', 250, 113, 50, 'Leo (corazón 7)'),
(42, 'Bizcocho de arce', 'Maple Bar', 'Jarabe de arce×1, Azúcar×1, Harina de trigo×1', 300, 225, 101, 'Queen of Sauce (Verano 14, Año 2)'),
(43, 'Trato del minero', 'Miner''s Treat', 'Zanahoria de cueva×2, Azúcar×1, Leche×1', 200, 200, 90, 'Nivel Minería 7'),
(44, 'Tortilla', 'Omelet', 'Huevo×1, Leche×1', 125, 100, 45, 'Queen of Sauce (Primavera 28, Año 1)'),
(45, 'Caldo pálido', 'Pale Broth', 'Alga blanca×2', 150, 175, 78, 'Queen of Sauce (Otoño 7, Año 1)'),
(46, 'Tortitas', 'Pancakes', 'Harina de trigo×1, Huevo×1', 80, 90, 40, 'Queen of Sauce (Verano 14, Año 1)'),
(47, 'Sopa de chirivía', 'Parsnip Soup', 'Chirivía×1, Leche×1, Vinagre×1', 120, 100, 45, 'Caroline (corazón 3)'),
(48, 'Poppers de pimienta', 'Pepper Poppers', 'Chile×1, Queso×1', 200, 125, 56, 'Shane (corazón 3)'),
(49, 'Tarta rosa', 'Pink Cake', 'Melón×1, Harina de trigo×1, Azúcar×1, Huevo×1', 480, 250, 112, 'Gus (compra) / Q.o.S.'),
(50, 'Pizza', 'Pizza', 'Harina de trigo×1, Tomate×1, Queso×1', 300, 150, 67, 'Queen of Sauce (Primavera 7, Año 2)'),
(51, 'Pudín de ciruela', 'Plum Pudding', 'Ciruela silvestre×2, Harina de trigo×1, Azúcar×1', 260, 225, 101, 'Queen of Sauce (Invierno 7, Año 1)'),
(52, 'Poi', 'Poi', 'Raíz de taro×4', 400, 100, 45, 'Leo (corazón 3)'),
(53, 'Muffin de amapola', 'Poppyseed Muffin', 'Amapola×1, Harina de trigo×1, Azúcar×1', 250, 200, 90, 'Queen of Sauce (Invierno 7, Año 2)'),
(54, 'Sopa de calabaza', 'Pumpkin Soup', 'Calabaza×1, Leche×1', 300, 200, 90, 'Robin (corazón 7)'),
(55, 'Ensalada de rábano', 'Radish Salad', 'Aceite×1, Vinagre×1, Rábano×1', 300, 175, 78, 'Queen of Sauce (Primavera 21, Año 1)'),
(56, 'Plato rojo', 'Red Plate', 'Lombarda×1, Rábano×1', 400, 240, 108, 'Emily (corazón 7)'),
(57, 'Tarta de ruibarbo', 'Rhubarb Pie', 'Ruibarbo×1, Harina de trigo×1, Azúcar×1', 400, 225, 101, 'Marnie (corazón 7)'),
(58, 'Arroz con leche', 'Rice Pudding', 'Leche×1, Azúcar×1, Arroz×1', 260, 115, 51, 'Evelyn (corazón 7)'),
(59, 'Avellanas tostadas', 'Roasted Hazelnuts', 'Avellana×3', 270, 113, 50, 'Queen of Sauce (Verano 28, Año 2)'),
(60, 'Plato de raíces', 'Roots Platter', 'Zanahoria de cueva×1, Raíz de invierno×1', 100, 125, 56, 'Nivel Combate 3'),
(61, 'Ensalada', 'Salad', 'Puerro×1, Diente de león×1, Vinagre×1', 110, 113, 50, 'Emily (corazón 3)'),
(62, 'Cena de salmón', 'Salmon Dinner', 'Salmón×1, Amaranto×1, Col rizada×1', 300, 225, 101, 'Gus (compra 1000g)'),
(63, 'Sashimi', 'Sashimi', 'Cualquier pez×1', 75, 75, 33, 'Linus (corazón 3)'),
(64, 'Pudín de espuma marina', 'Seafoam Pudding', 'Platija×1, Carpa nocturna×1, Tinta de calamar×1', 300, 175, 78, 'Nivel Pesca 9'),
(65, 'Cóctel de gambas', 'Shrimp Cocktail', 'Tomate×1, Gamba×1, Rábano silvestre×1', 160, 150, 67, 'Queen of Sauce (Invierno 28, Año 2)'),
(66, 'Espaguetis', 'Spaghetti', 'Harina de trigo×1, Tomate×1', 120, 75, 33, 'Lewis (corazón 3)'),
(67, 'Anguila picante', 'Spicy Eel', 'Anguila×1, Chile×1', 175, 115, 51, 'George (corazón 7)'),
(68, 'Ravioli de tinta', 'Squid Ink Ravioli', 'Tinta de calamar×1, Harina de trigo×1, Tomate×1', 150, 125, 56, 'Nivel Combate 9'),
(69, 'Salteado', 'Stir Fry', 'Zanahoria de cueva×1, Seta común×1, Col rizada×1, Aceite×1', 335, 200, 90, 'Queen of Sauce (Primavera 7, Año 1)'),
(70, 'Bollo extraño', 'Strange Bun', 'Harina de trigo×1, Bígaro×1, Mayonesa sombría×1', 225, 100, 45, 'Shane (corazón 7)'),
(71, 'Relleno', 'Stuffing', 'Pan×1, Arándano rojo×1, Avellana×1', 165, 170, 76, 'Pam (corazón 7)'),
(72, 'Hamburguesa supervivencia', 'Survival Burger', 'Pan×1, Zanahoria de cueva×1, Berenjena×1', 180, 125, 56, 'Nivel Combate 2'),
(73, 'Sopa Tom Kha', 'Tom Kha Soup', 'Coco×1, Gamba×1, Seta común×1', 250, 175, 78, 'Sandy (corazón 7)'),
(74, 'Tortilla de maíz', 'Tortilla', 'Maíz×1', 50, 50, 22, 'Queen of Sauce (Otoño 7, Año 1)'),
(75, 'Espresso triple', 'Triple Shot Espresso', 'Café×3', 450, 4, 1, 'Receta automática (Gus — tienda del Saloon)'),
(76, 'Curry tropical', 'Tropical Curry', 'Coco×1, Piña×1, Chile×1', 500, 175, 78, 'Isla Ginger (Gus del resort)'),
(77, 'Sopa de trucha', 'Trout Soup', 'Trucha arcoíris×1, Alga verde×1', 100, 175, 78, 'Queen of Sauce (Otoño 14, Año 1)'),
(78, 'Mezcla de verduras', 'Vegetable Medley', 'Tomate×1, Remolacha×1', 120, 165, 74, 'Caroline (corazón 7)'),
-- Elixir vital: efecto especial (cura toda la salud)
(79, 'Elixir vital', 'Life Elixir', 'Seta roja×1, Seta morada×1, Colmenilla×1, Rebozuelo×1', 500, 0, 0, 'Nivel Combate 2'),
(80, 'Tarta de calabaza', 'Pumpkin Pie', 'Calabaza×1, Harina de trigo×1, Leche×1, Azúcar×1', 385, 225, 101, 'Queen of Sauce (Invierno 21, Año 1)');


CREATE TABLE recoleccion (
  id SERIAL NOT NULL,
  nombre VARCHAR(255) NOT NULL,
  nombre_en VARCHAR(255) NOT NULL,
  temporada VARCHAR(50) NOT NULL,
  ubicacion VARCHAR(255) DEFAULT NULL,
  precio_venta INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (id)
);

INSERT INTO recoleccion (id, nombre, nombre_en, temporada, ubicacion, precio_venta) VALUES
(1, 'Rábano silvestre', 'Wild Horseradish', 'Primavera', 'Pueblo, Bosque, Montaña', 50),
(2, 'Narciso', 'Daffodil', 'Primavera', 'Pueblo, Bosque', 30),
(3, 'Puerro', 'Leek', 'Primavera', 'Pueblo, Bosque', 60),
(4, 'Diente de león', 'Dandelion', 'Primavera', 'Pueblo, Bosque', 40),
(5, 'Cebolleta de primavera', 'Spring Onion', 'Primavera', 'Bosque (sur del río)', 8),
(6, 'Colmenilla', 'Morel', 'Primavera', 'Bosque secreto, Granja', 150),
(7, 'Uva de especias', 'Spice Berry', 'Verano', 'Pueblo, Bosque, Montaña', 80),
(8, 'Uva silvestre', 'Grape', 'Verano', 'Montaña, Bosque', 80),
(9, 'Guisante de olor', 'Sweet Pea', 'Verano', 'Pueblo, Bosque', 50),
(10, 'Helecho violeta', 'Fiddlehead Fern', 'Verano', 'Bosque secreto', 90),
(11, 'Seta común', 'Common Mushroom', 'Otoño', 'Bosque, Montaña, Minas', 40),
(12, 'Mora', 'Blackberry', 'Otoño', 'Montaña, Bosque (arbustos)', 20),
(13, 'Avellana', 'Hazelnut', 'Otoño', 'Pueblo, Bosque', 90),
(14, 'Ciruela silvestre', 'Wild Plum', 'Otoño', 'Pueblo, Bosque', 80),
(15, 'Rebozuelo', 'Chanterelle', 'Otoño', 'Bosque secreto', 160),
(16, 'Seta roja', 'Red Mushroom', 'Otoño', 'Bosque secreto, Minas', 75),
(17, 'Seta morada', 'Purple Mushroom', 'Otoño', 'Minas (pisos profundos)', 250),
(18, 'Raíz de invierno', 'Winter Root', 'Invierno', 'Excavando tierra/nieve', 70),
(19, 'Fruta de cristal', 'Crystal Fruit', 'Invierno', 'Excavando tierra/nieve', 150),
(20, 'Ñame de nieve', 'Snow Yam', 'Invierno', 'Excavando en la nieve', 100),
(21, 'Azafrán de invierno', 'Crocus', 'Invierno', 'Pueblo, Bosque', 60),
(22, 'Acebo', 'Holly', 'Invierno', 'Pueblo, Bosque', 80),
(23, 'Concha de nautilo', 'Nautilus Shell', 'Invierno', 'Playa', 120),
(24, 'Coral', 'Coral', 'Todas', 'Playa', 80),
(25, 'Erizo de mar', 'Sea Urchin', 'Todas', 'Playa', 160),
(26, 'Almeja', 'Clam', 'Todas', 'Playa (excavar en arena)', 50),
(27, 'Concha arcoíris', 'Rainbow Shell', 'Verano', 'Playa', 300);


CREATE TABLE paquetes_centro_comunitario (
  id SERIAL NOT NULL,
  sala VARCHAR(100) NOT NULL,
  nombre_paquete VARCHAR(255) NOT NULL,
  items_requeridos TEXT NOT NULL,
  recompensa VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (id)
);

INSERT INTO paquetes_centro_comunitario (id, sala, nombre_paquete, items_requeridos, recompensa) VALUES
(1, 'Sala de manualidades', 'Forraje de primavera', 'Rábano silvestre, Narciso, Puerro, Diente de león', 'Semillas de primavera ×30'),
(2, 'Sala de manualidades', 'Forraje de verano', 'Uva, Uva de especias, Guisante de olor', 'Semillas de verano ×30'),
(3, 'Sala de manualidades', 'Forraje de otoño', 'Seta común, Ciruela silvestre, Avellana, Mora', 'Semillas de otoño ×30'),
(4, 'Sala de manualidades', 'Forraje de invierno', 'Raíz de invierno, Fruta de cristal, Ñame de nieve, Azafrán de invierno', 'Semillas de invierno ×30'),
(5, 'Sala de manualidades', 'Construcción', 'Madera ×99, Madera ×99, Piedra ×99, Madera noble ×10', 'Carbonera'),
(6, 'Sala de manualidades', 'Forraje exótico', 'Coco, Fruta de cactus, Zanahoria de cueva, Seta roja, Seta morada, Jarabe de arce, Resina de roble, Brea de pino', 'Guiso de otoño ×5'),
(7, 'Despensa', 'Cultivos de primavera', 'Chirivía, Judía verde, Coliflor, Patata', 'Abono rápido ×20'),
(8, 'Despensa', 'Cultivos de verano', 'Tomate, Chile, Arándano, Melón', 'Rociador de calidad'),
(9, 'Despensa', 'Cultivos de otoño', 'Maíz, Berenjena, Calabaza, Ñame', 'Colmena'),
(10, 'Despensa', 'Cultivos de calidad', 'Chirivía oro ×5, Melón oro ×5, Calabaza oro ×5, Maíz oro ×5', 'Tarro de conservas'),
(11, 'Despensa', 'Productos animales', 'Leche grande, Huevo marrón grande, Huevo blanco grande, Leche cabra grande, Lana, Huevo de pato', 'Prensa de queso'),
(12, 'Despensa', 'Productos artesanos', 'Aceite de trufa, Tela, Queso de cabra, Queso, Miel, Mermelada, Manzana, Albaricoque, Naranja, Melocotón, Granada, Cereza', 'Barril'),
(13, 'Pecera', 'Peces de río', 'Pez sol, Bagre, Sábalo, Trucha tigre', 'Cebo ×30'),
(14, 'Pecera', 'Peces de lago', 'Lubina, Carpa, Pez toro, Esturión', 'Señuelo vestido'),
(15, 'Pecera', 'Peces de océano', 'Sardina, Atún, Pargo rojo, Tilapia', 'Tótem playa ×5'),
(16, 'Pecera', 'Peces nocturnos', 'Lucioperca, Brema, Anguila', 'Anillo brillante pequeño'),
(17, 'Pecera', 'Trampa de cangrejo', 'Langosta, Cangrejo de río, Cangrejo, Berberecho, Mejillón, Gamba, Caracol, Almeja, Ostra, Bígaro', 'Nasa ×3'),
(18, 'Pecera', 'Pesca especializada', 'Pez globo, Pez fantasma, Pez arena, Pez bosque', 'Plato del mar ×5'),
(19, 'Sala de calderas', 'Herrería', 'Lingote de cobre, Lingote de hierro, Lingote de oro', 'Horno'),
(20, 'Sala de calderas', 'Geólogo', 'Cuarzo, Cristal terrestre, Lágrima helada, Cuarzo de fuego', 'Omni geoda ×5'),
(21, 'Sala de calderas', 'Aventurero', 'Baba ×99, Ala de murciélago ×10, Esencia solar, Esencia sombría', 'Anillo de imán pequeño'),
(22, 'Tablón de anuncios', 'Paquete del chef', 'Jarabe de arce, Helecho violeta, Trufa, Amapola, Maki, Huevo frito', 'Tarta rosa ×3'),
(23, 'Tablón de anuncios', 'Paquete de tintes', 'Seta roja, Erizo de mar, Girasol, Pluma de pato, Aguamarina, Lombarda', 'Fabricante de semillas'),
(24, 'Tablón de anuncios', 'Investigación de campo', 'Seta morada, Concha de nautilo, Cacho, Geoda helada', 'Máquina recicladora'),
(25, 'Tablón de anuncios', 'Paquete de forraje', 'Trigo ×10, Heno ×10, Manzana ×3', 'Calentador'),
(26, 'Tablón de anuncios', 'Paquete del encantador', 'Resina de roble, Vino, Pata de rabbit, Granada', 'Lingote de oro ×5'),
(27, 'Cámara acorazada', '2.500g', '2500 oro', 'Pastel de chocolate ×3'),
(28, 'Cámara acorazada', '5.000g', '5000 oro', 'Fertilizante de calidad ×30'),
(29, 'Cámara acorazada', '10.000g', '10000 oro', 'Pararrayos'),
(30, 'Cámara acorazada', '25.000g', '25000 oro', 'Cristalario');



CREATE TABLE usuarios (
  id SERIAL NOT NULL,
  username VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  rol VARCHAR(50) NOT NULL DEFAULT 'normal',
  fecha_registro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

INSERT INTO usuarios (id, username, password, rol, fecha_registro) VALUES
(1, 'hector', '1234567890', 'admin', '2026-01-01 00:00:00'),
(2, 'gonzalo', '123456789', 'admin', '2026-01-01 00:00:00');

SELECT setval(pg_get_serial_sequence('cultivos', 'id'), COALESCE((SELECT MAX(id) FROM cultivos), 1), true);
SELECT setval(pg_get_serial_sequence('edificios', 'id'), COALESCE((SELECT MAX(id) FROM edificios), 1), true);
SELECT setval(pg_get_serial_sequence('ganado', 'id'), COALESCE((SELECT MAX(id) FROM ganado), 1), true);
SELECT setval(pg_get_serial_sequence('materiales', 'id'), COALESCE((SELECT MAX(id) FROM materiales), 1), true);
SELECT setval(pg_get_serial_sequence('personajes', 'id'), COALESCE((SELECT MAX(id) FROM personajes), 1), true);
SELECT setval(pg_get_serial_sequence('peces', 'id'), COALESCE((SELECT MAX(id) FROM peces), 1), true);
SELECT setval(pg_get_serial_sequence('capturas_nasa', 'id'), COALESCE((SELECT MAX(id) FROM capturas_nasa), 1), true);
SELECT setval(pg_get_serial_sequence('arboles_frutales', 'id'), COALESCE((SELECT MAX(id) FROM arboles_frutales), 1), true);
SELECT setval(pg_get_serial_sequence('herramientas', 'id'), COALESCE((SELECT MAX(id) FROM herramientas), 1), true);
SELECT setval(pg_get_serial_sequence('productos_artesanales', 'id'), COALESCE((SELECT MAX(id) FROM productos_artesanales), 1), true);
SELECT setval(pg_get_serial_sequence('recetas_cocina', 'id'), COALESCE((SELECT MAX(id) FROM recetas_cocina), 1), true);
SELECT setval(pg_get_serial_sequence('recoleccion', 'id'), COALESCE((SELECT MAX(id) FROM recoleccion), 1), true);
SELECT setval(pg_get_serial_sequence('paquetes_centro_comunitario', 'id'), COALESCE((SELECT MAX(id) FROM paquetes_centro_comunitario), 1), true);
SELECT setval(pg_get_serial_sequence('usuarios', 'id'), COALESCE((SELECT MAX(id) FROM usuarios), 1), true);

COMMIT;
