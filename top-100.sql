-- pregunta 1 
CREATE DATABASE peliculas;

-- pregunta 2
CREATE TABLE peliculas(id INT, pelicula VARCHAR(300), año_estreno INT, director VARCHAR(50), PRIMARY KEY(id));
CREATE TABLE reparto(id INT, nombre_actor VARCHAR(50), FOREIGN KEY(id) REFERENCES peliculas(id));

--pregunta 3
\copy peliculas FROM './Desktop/peliculas.csv' CSV header;
\copy reparto FROM './Desktop/reparto.csv' CSV;

-- pregunta 4
SELECT pelicula,año_estreno,director,reparto.nombre_actor FROM peliculas JOIN reparto ON peliculas.id = reparto.id WHERE peliculas.pelicula = 'Titanic'; -- opcion 1= buscando por el nombre de la pelicula

SELECT pelicula,año_estreno,director,reparto.nombre_actor FROM peliculas JOIN reparto ON peliculas.id = reparto.id WHERE peliculas.id = 2; -- opcion 2 =buscando por el id de la pelicula

-- pregunta 5
SELECT nombre_actor,pelicula FROM peliculas JOIN reparto ON peliculas.id = reparto.id WHERE reparto.nombre_actor = 'Harrison Ford';

-- pregunta 6 
SELECT director, COUNT (pelicula) AS peliculas FROM peliculas GROUP BY director ORDER BY peliculas DESC LIMIT 10;

-- pregunta 7
  SELECT COUNT(DISTINCT nombre_actor) AS actores FROM reparto;

-- pregunta 8 
SELECT pelicula,año_estreno FROM peliculas WHERE año_estreno >= 1990 AND año_estreno<=1999 ORDER BY pelicula ASC;

-- pregunta 9 
SELECT pelicula,año_estreno FROM peliculas WHERE año_estreno= 2001;

-- pregunta 10
SELECT nombre_actor AS pelicula_mas_nueva FROM reparto WHERE id IN (SELECT id FROM peliculas WHERE año_estreno =(SELECT MAX(año_estreno) FROM peliculas));




