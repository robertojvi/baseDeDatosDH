SELECT artista.id AS artista, COUNT( pelicula.id ) FROM artista
JOIN artista_x_pelicula ON artista.id = artista_x_pelicula.artista_id
JOIN pelicula ON artista_x_pelicula.pelicula_id = pelicula.id
GROUP BY artista; -- Punto 1

SELECT pelicula.titulo, COUNT( artista.id ) FROM pelicula
JOIN artista_x_pelicula ON pelicula.id = artista_x_pelicula.pelicula_id
JOIN artista ON artista_x_pelicula.artista_id = artista.id
GROUP BY pelicula.titulo
HAVING COUNT( artista.id ) > 1; -- Punto 2

SELECT artista.id, pelicula.titulo FROM artista
LEFT JOIN artista_x_pelicula ON artista.id = artista_x_pelicula.artista_id
LEFT JOIN pelicula ON artista_x_pelicula.pelicula_id = pelicula.id; -- Punto 3

SELECT pelicula.titulo, artista.id FROM pelicula
LEFT JOIN artista_x_pelicula ON pelicula.id = artista_x_pelicula.pelicula_id
LEFT JOIN artista ON artista_x_pelicula.artista_id = artista.id
WHERE artista.id IS NULL; -- Punto 4

SELECT artista.id, pelicula.titulo FROM artista
LEFT JOIN artista_x_pelicula ON artista.id = artista_x_pelicula.artista_id
LEFT JOIN pelicula ON artista_x_pelicula.pelicula_id = pelicula.id
WHERE pelicula.titulo IS NULL; -- Punto 5

SELECT pelicula.titulo, artista.id FROM pelicula
RIGHT JOIN artista_x_pelicula ON pelicula.id = artista_x_pelicula.pelicula_id
RIGHT JOIN artista ON artista_x_pelicula.artista_id = artista.id
WHERE pelicula.id IS NULL; -- Punto 5 con right excluding join 

SELECT artista.id, COUNT( pelicula.id ) FROM artista
JOIN artista_x_pelicula ON artista.id = artista_x_pelicula.artista_id
JOIN pelicula ON artista_x_pelicula.pelicula_id = pelicula.id
GROUP BY artista.id
HAVING COUNT( pelicula.id ) > 1; -- Punto 6

SELECT pelicula.titulo, COUNT( artista.id ) FROM pelicula
LEFT JOIN artista_x_pelicula ON pelicula.id = artista_x_pelicula.pelicula_id
LEFT JOIN artista ON artista_x_pelicula.artista_id = artista.id
GROUP BY pelicula.titulo
ORDER BY COUNT( artista.id ) DESC; -- Punto 7