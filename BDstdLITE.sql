-- Base PostgreSQL lite para la API de Stardew Valley
-- Incluye las tablas necesarias para el alcance actual y la expansion prevista.

BEGIN;

DROP TABLE IF EXISTS cultivos, personajes, peces, edificios, materiales, usuarios CASCADE;

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

CREATE INDEX IF NOT EXISTS idx_cultivos_temporada ON cultivos(temporada);
CREATE INDEX IF NOT EXISTS idx_cultivos_nombre ON cultivos(nombre);
CREATE INDEX IF NOT EXISTS idx_personajes_nombre ON personajes(nombre);
CREATE INDEX IF NOT EXISTS idx_personajes_temporada ON personajes(temporada_cumpleanos);
CREATE INDEX IF NOT EXISTS idx_personajes_es_soltero ON personajes(es_soltero);
CREATE INDEX IF NOT EXISTS idx_peces_nombre ON peces(nombre);
CREATE INDEX IF NOT EXISTS idx_peces_temporada ON peces(temporada);
CREATE INDEX IF NOT EXISTS idx_peces_es_legendario ON peces(es_legendario);
CREATE INDEX IF NOT EXISTS idx_edificios_nombre ON edificios(nombre);
CREATE INDEX IF NOT EXISTS idx_materiales_nombre ON materiales(nombre);
CREATE INDEX IF NOT EXISTS idx_materiales_fuente ON materiales(fuente);
CREATE INDEX IF NOT EXISTS idx_usuarios_username ON usuarios(username);
CREATE INDEX IF NOT EXISTS idx_usuarios_rol ON usuarios(rol);

SELECT setval(pg_get_serial_sequence('cultivos', 'id'), COALESCE((SELECT MAX(id) FROM cultivos), 1), true);
SELECT setval(pg_get_serial_sequence('personajes', 'id'), COALESCE((SELECT MAX(id) FROM personajes), 1), true);
SELECT setval(pg_get_serial_sequence('peces', 'id'), COALESCE((SELECT MAX(id) FROM peces), 1), true);
SELECT setval(pg_get_serial_sequence('edificios', 'id'), COALESCE((SELECT MAX(id) FROM edificios), 1), true);
SELECT setval(pg_get_serial_sequence('materiales', 'id'), COALESCE((SELECT MAX(id) FROM materiales), 1), true);
SELECT setval(pg_get_serial_sequence('usuarios', 'id'), COALESCE((SELECT MAX(id) FROM usuarios), 1), true);

COMMIT;
