API REST educativa de Stardew Valley desarrollada en Node.js, Express y PostgreSQL.

El proyecto actualmente esta en fase de desarrollo pero la API ya es funcional y se encuentra alojada en Vercel.

--Tecnologías utilizadas:
Node.js
Express
PostgreSQL
Dotenv
@vercel/postgres
Vercel

El proyecto incluye 3 archivos de bases de datos, dos hechos con IA y uno hecho a mano.
Con IA hemos preparado las bases completas tanto en mySQL como en postgreSQL. En estos archivos hay cientos de lineas de codigo que recogen en distintas bases de datos relacionales toda la infromacion relevante relativa al juego.
Por otro lado tenemos una base de datos ligera en postgreSQL en la que esto solo recogida la informacion que le proyecto necesita para funcionar en su versión estandar y en una futura amplicación.

En el hemos integrado para dar seguridad al proyecto las tecnologías de JWT y de Bcrypt
