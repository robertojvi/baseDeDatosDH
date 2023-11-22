SELECT pais, COUNT(pais) FROM clientes
GROUP BY pais;

SELECT  id_genero, COUNT( id_genero ) FROM canciones
GROUP BY id_genero;

SELECT SUM( total ) FROM facturas;

SELECT id_album, AVG (milisegundos) FROM canciones
GROUP BY id_album;

SELECT MIN(bytes) FROM canciones;

SELECT id_cliente, SUM( total ) FROM facturas
GROUP BY id_cliente;

SELECT canciones.nombre, generos.nombre FROM canciones, generos
WHERE canciones.id_genero = generos.id
AND generos.nombre = 'Blues' AND canciones.compositor = 'Willie Dixon'; 


SELECT canciones.nombre, generos.nombre
FROM canciones
INNER JOIN generos ON canciones.id_genero = generos.id
WHERE generos.nombre = 'Blues' AND canciones.compositor = 'Willie Dixon'; 


-- DML Queries XXL Parte II
