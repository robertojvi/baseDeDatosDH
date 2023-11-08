SELECT id AS "Numero de Cliente", apellido, nombre  FROM cliente
WHERE nombre LIKE "A%"; -- Punto 1 

SELECT numero FROM sucursal
WHERE domicilio = "Ramón Freire Serrano 7410"; -- punto 2

SELECT MAX( importe ) AS maximo FROM prestamo; -- punto 3

SELECT * FROM pago
WHERE id IN (10,14,27,45); -- punto 4

SELECT prestamo_id AS "Numero de prestamo", SUM(importe) AS "Total Pagado" FROM pago
WHERE prestamo_id = 40
GROUP BY prestamo_id DESC;



SELECT * FROM empleado
WHERE sucursal_numero != 2 AND (alta_contrato_laboral > 05-09-2021 OR alta_contrato_laboral = 25-06-2021)
ORDER BY alta_contrato_laboral;

SELECT * FROM pago ORDER BY importe LIMIT 1 OFFSET 5;

SELECT id, fecha_otorgado, MAX(importe) AS maximo FROM prestamo GROUP BY id ORDER BY maximo DESC LIMIT 1;


SELECT numero, saldo, cuenta_tipo_id FROM cuenta
ORDER BY saldo ASC LIMIT 10;

SELECT * FROM cuenta WHERE descubierto_otorgado >= 8999.80
ORDER BY descubierto_otorgado;


SELECT legajo, apellido, nombre, email FROM empleado WHERE apellido LIKE "%do";

SELECT AVG(saldo) FROM cuenta WHERE cuenta_tipo_id = 2;

SELECT * FROM prestamo ORDER BY importe DESC LIMIT 1 OFFSET 2;

SELECT sucursal_numero, COUNT(*) AS cantidadCuentas FROM cuenta
WHERE sucursal_numero = 5
GROUP BY sucursal_numero;

SELECT * FROM ciudad
WHERE nombre LIKE "__n__";



SELECT SUM(importe) FROM prestamo;


SELECT COUNT(*) FROM cuenta WHERE activa = 1;

SELECT apellido, COUNT(apellido) FROM cliente
GROUP BY apellido; 


SELECT sucursal_numero, fecha_otorgado, COUNT(*) FROM prestamo
GROUP BY sucursal_numero, fecha_otorgado;