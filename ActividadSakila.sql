-- Actividad Base de Datos Sakila

-- Reportes parte 1

SELECT first_name AS Nombre, last_name AS Apellido FROM actor
LIMIT 5; -- Punto 1

SELECT first_name AS Nombre, last_name AS Apellido, email FROM customer
WHERE active = 0; -- Punto 2

SELECT title AS Titulo, release_year AS Año, `description` AS Descripcion FROM film
WHERE rental_duration > 5
ORDER BY rental_duration DESC; -- Punto 3

SELECT * FROM rental
WHERE rental_date BETWEEN '2005-05-01' AND '2005-05-31'; -- Punto 4

-- Reportes parte 2

SELECT COUNT( * ) AS cantidad FROM rental; -- Punto 1

SELECT SUM( amount ) AS Total, COUNT( * ) AS cantidad, AVG( amount ) AS Importe_Promedio FROM payment; -- Punto 2

SELECT customer_id AS cliente, SUM( amount ) AS monto, COUNT( * ) AS cantidadAlquileres FROM payment
GROUP BY customer_id
ORDER BY monto DESC LIMIT 10; -- Punto 3

SELECT customer_id AS 'Id de Cliente', SUM(amount) AS 'monto total', COUNT(*) AS 'cantidad de Alquileres'
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 150; -- Punto 4

SELECT MONTH(rental.rental_id) AS MesAlquiler, COUNT( rental.rental_id ) AS CantidadAlquileres, SUM( payment.amount ) FROM rental
JOIN payment ON rental.rental_id = payment.rental_id
WHERE YEAR( rental.rental_date ) = 2005
GROUP BY MesAlquiler
ORDER BY MesAlquiler; -- Punto 5

SELECT rental.inventory_id AS Inventario, COUNT( * ) AS cantidad FROM rental
GROUP BY rental.inventory_id
ORDER BY cantidad DESC LIMIT 5;