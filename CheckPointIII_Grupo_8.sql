use el_descubierto;
/*
1
*/
SELECT

    concat(cliente.id, " ", cliente.apellido, " ", cliente.nombre) as Cliente, COUNT(cliente.id) AS CantidadCuentas

FROM

    cliente

inner join

cliente_x_cuenta 

    ON cliente.id = cliente_x_cuenta.cliente_id

inner JOIN

    cuenta  

    ON cuenta.numero = cliente_x_cuenta.cuenta_numero

GROUP BY

    cliente.id

HAVING

    COUNT(cliente.id) >= 3; -- 6 registros
/*
2
*/
select CONCAT(cl.id, ': ', UPPER(cl.nombre), ' ', UPPER(cl.apellido)) AS 'Cliente sin cuenta bancaria'
from cliente cl
left join cliente_x_cuenta cc
on cl.id = cc.cliente_id
left join cuenta cu
on cu.numero = cc.cuenta_numero
where cu.numero is null;-- 8 registros
/*
3 
*/
select cliente.id, cliente.nombre, cliente.apellido, prestamo.id, sucursal.numero, ciudad.nombre, pais.nombre

from cliente

join cliente_x_prestamo ON cliente.id = cliente_x_prestamo.cliente_id

join prestamo ON cliente_x_prestamo.prestamo_id = prestamo.id

join sucursal ON prestamo.sucursal_numero = sucursal.numero

join ciudad ON cliente.ciudad_id = ciudad.id

join pais ON ciudad.pais_id = pais.id

where ciudad.nombre = 'Pilar - Buenos Aires'; -- 3 registros
/*
4
*/
SELECT c.id, c.nombre, c.apellido
FROM cliente c
JOIN cliente_x_cuenta cc ON c.id = cc.cliente_id
WHERE cc.cuenta_numero IS NOT NULL AND SUBSTRING(c.apellido, 2, 1) = 'e'; -- 8 registros
/*
5
*/
SELECT pais.nombre as Pais, count(cliente.id) as "Cantidad de clientes"
FROM pais
LEFT JOIN ciudad
ON pais.id = ciudad.pais_id
LEFT JOIN cliente
ON ciudad.id = cliente.ciudad_id
GROUP BY pais.nombre; -- 20 registros
/*6*/
SELECT cxp.cliente_id AS Numero_Cliente,

       COUNT(p.id) AS Cantidad_Prestamos,

       SUM(p.importe) AS Importe_Total

FROM cliente_x_prestamo cxp

JOIN prestamo p ON cxp.prestamo_id = p.id

WHERE MONTH(p.fecha_otorgado) = 8

GROUP BY cxp.cliente_id;

-- 9 filas
/*7*/
SELECT prestamo.id, COUNT( pago.id) as CantidadCuotasPagadas, SUM( pago.importe ) as importeTotal from prestamo

join pago ON prestamo.id = pago.prestamo_id

where prestamo.id = 40;

-- 1 registro
/*8*/
SELECT sum(pago.importe) as totalPago, prestamo.importe-sum(pago.importe) as FataPorPagar from prestamo

join pago ON prestamo.id = pago.prestamo_id

where prestamo.id = 45;

-- 1 registro
/*9*/
select cliente.id as numeroCliente, cliente.apellido, cliente.nombre, prestamo.id as numeroPrestamo from cliente

join cliente_x_prestamo ON cliente.id = cliente_x_prestamo.cliente_id

join prestamo ON cliente_x_prestamo.prestamo_id = prestamo.id

where prestamo.sucursal_numero = 4; -- 6 registros
/*10*/
SELECT p.id AS numero_prestamo, CASE
        WHEN COUNT(pg.id) = 1 THEN '1 cuota pagada'
        WHEN COUNT(pg.id) > 1 THEN CONCAT(COUNT(pg.id), ' cuotas pagadas')
        ELSE 'Ninguna cuota pagada'
    END AS estado_cuotas
FROM prestamo p
LEFT JOIN pago pg ON p.id = pg.prestamo_id
GROUP BY p.id; -- 47 registro
/*11*/
SELECT 

    CONCAT(empleado.apellido,' ', left(empleado.nombre, 1),'.') as nombreEmpleado, 

    COALESCE(CONCAT(cuenta.numero, '-', cuenta_tipo.tipo), '-Sin asignación') as detalleCuenta

FROM 

    empleado

LEFT JOIN cuenta ON empleado.legajo = cuenta.ejecutivo_cuenta

LEFT JOIN cuenta_tipo ON cuenta.cuenta_tipo_id = cuenta_tipo.id;

-- 60 registros
/*12*/

select cliente.*, cuenta.numero from cliente

join cliente_x_cuenta ON cliente.id = cliente_x_cuenta.cliente_id

join cuenta ON cliente_x_cuenta.cuenta_numero = cuenta.numero;

-- 64 registros


/*13*/
SELECT cl.apellido as "Apellido del cliente", cl.nombre "Nombre del cliente", ciudad.*
FROM cliente cl
LEFT JOIN ciudad
ON ciudad.id = cl.ciudad_id
WHERE ciudad.nombre = "Las Heras - Mendoza" || ciudad.nombre = "Viña del Mar - Valparaíso" || ciudad.nombre = "Córdoba - Córdoba" || ciudad.nombre = "Monroe - Buenos Aires";
-- 6 registros

/*14*/

SELECT c.email, c.telefono_movil, p.*
FROM
    cliente_x_prestamo cp
JOIN
    cliente c ON cp.cliente_id = c.id
JOIN
    prestamo p ON cp.prestamo_id = p.id
WHERE
    p.fecha_otorgado BETWEEN '2021-08-15' AND '2021-09-05'
ORDER BY
    p.fecha_otorgado;-- 4 registros

/*15*/
select empleado.email, sucursal.numero as numeroSucursal, ciudad.nombre as ciudad from empleado

join sucursal ON empleado.sucursal_numero = sucursal.numero

join ciudad ON empleado.ciudad_id = ciudad.id

where ciudad.nombre <> 'Monroe - Buenos Aires' and YEAR( empleado.alta_contrato_laboral )  BETWEEN 2016 and 2018;

-- 21 registros

/*16*/
SELECT cuenta.numero as numeroCuenta, COUNT( cliente.id ) as cantidadTitulares from cuenta

join cliente_x_cuenta ON cuenta.numero = cliente_x_cuenta.cuenta_numero

join cliente ON cliente_x_cuenta.cliente_id = cliente.id

GROUP by cuenta.numero

having COUNT( cliente.id ) = 2;

-- 3 registros
    
/*17*/
    
SELECT p.id AS numero_pago, p.fecha AS hora_pago, p.importe AS importe_pagado, pa.nombre AS nombre_pais
 FROM pago p
 JOIN prestamo pr ON p.prestamo_id = pr.id JOIN sucursal s ON pr.sucursal_numero = s.numero
 JOIN ciudad c ON s.ciudad_id = c.id
 JOIN pais pa ON c.pais_id = pa.id WHERE pa.nombre = 'Chile'  ORDER BY p.importe DESC LIMIT 1 OFFSET 1;-- 1 registros
 
 /*18*/
select cl.apellido, cl.nombre, cl.email
from cliente cl
left join cliente_x_prestamo cp
on cl.id = cp.cliente_id
left join prestamo p
on cp.prestamo_id = p.id
where p.id is null; -- 20 registros

/*19*/

SELECT

    cliente.email,

    prestamo.id as numeroPrestamo,

    prestamo.fecha_otorgado,

    prestamo.importe as importePrestado,

    CONCAT(

        DATE_FORMAT(DATE_ADD(prestamo.fecha_otorgado, INTERVAL prestamo.cantidad_cuota MONTH), '%M'),

        ' - ',

        YEAR(DATE_ADD(prestamo.fecha_otorgado, INTERVAL prestamo.cantidad_cuota MONTH))

    ) as ultimoMesAnio

FROM

    prestamo

JOIN cliente_x_prestamo ON prestamo.id = cliente_x_prestamo.prestamo_id

JOIN cliente ON cliente_x_prestamo.cliente_id = cliente.id

WHERE

    prestamo.id = 30;

    -- 1 registro
    
/*20*/

SELECT p.nombre AS pais, c.nombre AS ciudad, COUNT(*) AS cantidad_cuentas

FROM ciudad c

JOIN pais p ON c.pais_id = p.id

JOIN cliente_x_cuenta cxc ON cxc.cliente_id = c.id

GROUP BY c.id

HAVING COUNT(*) BETWEEN 2 AND 4

ORDER BY p.nombre, c.nombre;

-- 15 filas

/*21*/

SELECT c.nombre as Nombre, c.apellido as Apellido, cuenta.numero as "Número de cuenta", ct.tipo as "Tipo de cuenta", cuenta.saldo as "Saldo"
FROM cliente c
LEFT JOIN cliente_x_cuenta cxc ON cxc.cliente_id = c.id
LEFT JOIN cuenta ON cuenta.numero = cxc.cuenta_numero
LEFT JOIN cuenta_tipo ct ON ct.id = cuenta.cuenta_tipo_id
WHERE ct.tipo = "CAJA DE AHORRO" AND cuenta.saldo > 15000; -- 9 registros

/*22*/

select sucursal.numero as numeroSucursal, COUNT( cliente.id ) as CantidadCliente, AVG( cuenta.saldo ) as saldoPromedio from sucursal

join cuenta ON sucursal.numero = cuenta.sucursal_numero

join cliente_x_cuenta ON cuenta.numero = cliente_x_cuenta.cuenta_numero

join cliente ON cliente_x_cuenta.cliente_id = cliente.id

group by sucursal.numero

order by sucursal.numero;

-- 21 registros

/*23*/

select cliente.nombre, cliente.apellido , cuenta.saldo, cuenta.descubierto_otorgado
from cliente
inner join cliente_x_cuenta
on cliente.id = cliente_x_cuenta.cliente_id
inner join cuenta
on cuenta.numero = cliente_x_cuenta.cuenta_numero
where cuenta.saldo < 0 AND cuenta.descubierto_otorgado > 0;  -- 7 registro

/*24*/

SELECT cliente.nombre, cliente.apellido, max(historial_acceso.id) as ultimoAcceso from cliente

join historial_acceso ON cliente.id = historial_acceso.cliente_id

group by cliente.nombre, cliente.apellido;

-- 37 registros

/*25*/

select e.apellido, e.nombre, COUNT(c.numero) as cantidad_de_cuentas

from empleado e

join cuenta c

on e.legajo = c.ejecutivo_cuenta

group by e.apellido, e.nombre

order by e.apellido, e.nombre;

-- 24 registros
