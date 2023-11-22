-- Queries XL Primera Parte ACTIVIDAD 9 NOVIEMBRE 2023

-- CLIENTES

SELECT COUNT( * ) from Clientes; -- Punto 1

SELECT Ciudad, count( ClienteID ) as cantidadClientes from Clientes
GROUP by Ciudad; -- Punto 2

-- FACTURAS

SELECT SUM( Transporte ) from Facturas; -- Punto 1

select sum(transporte) as "Total", EnvioVia from facturas
group by EnvioVia; -- Punto 2

SELECT ClienteID, COUNT( FacturaID ) as cantidadFacturas from Facturas
GROUP by ClienteID
order by cantidadFacturas DESC; -- Punto 3

SELECT ClienteID, COUNT( FacturaID ) as cantidadFacturas from Facturas
GROUP by ClienteID
order by cantidadFacturas DESC LIMIT 5; -- Punto 4

SELECT PaisEnvio, COUNT( FacturaID ) AS Cantidad FROM Facturas
GROUP BY PaisEnvio ORDER BY Cantidad ASC LIMIT 1; -- Punto 5

SELECT EmpleadoID, COUNT( FacturaID ) as CantidadOperaciones from Facturas
group by EmpleadoID order by CantidadOperaciones DESC LIMIT 1; -- Punto 6

-- FACTURA DETALLE

SELECT ProductoID, COUNT( * ) as cantidad from FacturaDetalle
group by ProductoID order by cantidad DESC limit 1; -- Punto 1

SELECT sum(Cantidad * PrecioUnitario) from FacturaDetalle; -- Punto 2

SELECT sum(Cantidad * PrecioUnitario) from FacturaDetalle where ProductoID BETWEEN 30 and 50; -- Punto 3

SELECT ProductoID, AVG(PrecioUnitario) from FacturaDetalle
group by ProductoID; -- Punto 4

SELECT max(PrecioUnitario) from FacturaDetalle; -- Punto 5

-- Consultas queries XL parte II - JOIN

SELECT Facturas.FacturaID, Empleados.Apellido from Facturas
JOIN Empleados ON Facturas.EmpleadoID = Empleados.EmpleadoID
where Empleados.Apellido = 'Buchanan'; -- Punto 1

SELECT * from Facturas
join Correos ON Facturas.EnvioVia = Correos.CorreoID
where Correos.Compania = 'Speedy Express'; -- Punto 2

SELECT Empleados.Nombre, Empleados.Apellido, Facturas.FacturaID from Empleados
join Facturas ON Empleados.EmpleadoID = Facturas.EmpleadoID; -- Punto 3

select * from facturas f 
join clientes c on f.ClienteID = c.ClienteID 
where f.PaisEnvio = 'USA' and c.Titulo = 'Owner'; -- Punto 4

SELECT * from Facturas
join Empleados ON Facturas.EmpleadoID = Empleados.EmpleadoID
join FacturaDetalle on FacturaDetalle.FacturaID = Facturas.FacturaID
where Empleados.Apellido = 'Leverling' or FacturaDetalle.ProductoID = 42; -- Punto 5

SELECT * from Facturas
join Empleados ON Facturas.EmpleadoID = Empleados.EmpleadoID
join FacturaDetalle on FacturaDetalle.FacturaID = Facturas.FacturaID
where Empleados.Apellido = 'Leverling' and (FacturaDetalle.ProductoID = 42 or FacturaDetalle.ProductoID = 80); -- Punto 6

select f.FacturaID, f.ClienteID, f.EmpleadoID, f.FechaFactura, f.FechaRegistro,
f.FechaEnvio, f.EnvioVia, f.Transporte, f.NombreEnvio, f.DireccionEnvio,
f.CiudadEnvio, f.RegionEnvio, f.CodigoPostalEnvio, f.PaisEnvio
from facturas f 
join empleados e on f.EmpleadoId = e.EmpleadoID 
join facturadetalle fd on f.FacturaID = fd.FacturaID
where e.Apellido = 'Leverling' and (fd.ProductoID=80 or fd.ProductoID=42); -- Punto 6


SELECT Clientes.ClienteID, sum(FacturaDetalle.Cantidad * FacturaDetalle.PrecioUnitario) as importe from Clientes
join Facturas ON Clientes.ClienteID = Facturas.ClienteID
join FacturaDetalle ON Facturas.FacturaID = FacturaDetalle.FacturaID
group by Clientes.ClienteID order by importe DESC; -- Punto 7

SELECT Facturas.FacturaID, Clientes.ClienteID, Clientes.Contacto, Facturas.FechaFactura, Facturas.PaisEnvio, sum(FacturaDetalle.Cantidad * FacturaDetalle.PrecioUnitario) as total from Facturas
join Clientes ON Facturas.ClienteID = Clientes.ClienteID
join FacturaDetalle ON Facturas.FacturaID = FacturaDetalle.FacturaID
group by Facturas.FacturaID order by Facturas.FechaFactura DESC limit 10; -- Punto 8