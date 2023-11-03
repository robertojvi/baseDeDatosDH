-- CATEGORIAS Y PRODUCTOS

SELECT * FROM Categorias; -- Punto 1. Listado de todas las categorías

SELECT CategoriaNombre, Descripcion FROM Categorias; -- Punto 2

SELECT * FROM Productos; -- Punto 3, listado de productos

SELECT * FROM Productos 
WHERE Discontinuado = 1; -- Punto 4, productos discontinuados
-- no existen productos discontinuados

SELECT ProductoNombre FROM Productos
WHERE ProveedorID = 8; -- Punto 5

SELECT * FROM Productos
WHERE PrecioUnitario BETWEEN 10 AND 22; -- PUNTO 6

SELECT * FROM Productos
WHERE UnidadesStock < NivelReorden; -- Punto 7

SELECT * FROM Productos
WHERE UnidadesStock < NivelReorden AND UnidadesPedidas = 0; -- Punto 8

-- CLIENTES

SELECT Contacto, Compania, Titulo, Pais FROM Clientes
ORDER BY Pais; -- Punto 1

SELECT Contacto, Compania, Titulo, Pais FROM Clientes
WHERE Titulo = 'Owner'
ORDER BY Pais; -- Punto 2

SELECT * FROM Clientes
WHERE Contacto LIKE 'C%'; -- Punto 3

-- FACTURAS

SELECT * FROM Facturas
ORDER BY FechaFactura ASC; -- Punto 1

SELECT * FROM Facturas 
WHERE PaisEnvio = 'USA' AND EnvioVia != 3; -- Punto 2

SELECT * FROM Facturas
WHERE ClienteID = 'GOURL'; -- Punto 3

SELECT * FROM Facturas
WHERE EmpleadoID IN (2,3,5,8,9); -- Punto 4

-- SEGUNDA PARTE

-- PORDUCTOS

SELECT * FROM Productos
ORDER BY PrecioUnitario DESC; -- Punto 1

SELECT * FROM Productos
ORDER BY PrecioUnitario DESC
LIMIT 5; -- Punto 2

SELECT * FROM Productos
ORDER BY UnidadesStock DESC 
LIMIT 10; -- Punto 3

-- FACTURA DETALLE

SELECT FacturaID, ProductoID, Cantidad FROM FacturaDetalle; -- Punto 1

SELECT FacturaID, ProductoID, Cantidad FROM FacturaDetalle
ORDER BY Cantidad DESC; -- Punto 2

SELECT FacturaID, ProductoID, Cantidad FROM FacturaDetalle
WHERE Cantidad BETWEEN 50 AND 100
ORDER BY Cantidad DESC; -- Punto 3

SELECT FacturaID AS NroFactura, ProductoID AS Producto, (PrecioUnitario * Cantidad) AS Total
FROM FacturaDetalle; -- Punto 4

-- EXTRAS

SELECT  * FROM Clientes
WHERE Pais = 'Brazil' OR Pais = 'Mexico' OR Titulo LIKE 'Sales%'; -- Punto 1

SELECT * FROM Clientes
WHERE Compania LIKE 'A%'; -- Punto 2

SELECT Ciudad, Contacto AS 'Apellido y Nombre', Titulo AS Puesto FROM Clientes
WHERE Ciudad = 'Madrid'; -- PUnto 3

SELECT * FROM Facturas
WHERE FacturaID BETWEEN 10000 AND 10500; -- Punto 4

SELECT * FROM Facturas
WHERE FacturaID BETWEEN 10000 AND 10500 OR ClienteID LIKE 'B%'; -- Punto 5

SELECT * FROM Facturas
WHERE CiudadEnvio = 'Vancouver' OR EnvioVia = 3; -- Punto 6

SELECT * FROM Empleados 
WHERE Apellido = 'Buchanan'; -- Punto 7

SELECT * FROM Facturas
WHERE EmpleadoID = 5; -- Punto 8