
USE Minimarket;
-- CONDICION DE IGUALIDAD O ATRIBUTO ENTERO
SELECT * 
FROM Productos
WHERE id_producto = 5;

-- Condición de igualdad en atributo cadena
SELECT * 
FROM Cliente
WHERE direccion = 'Centro';

-- Condición mayor o igual (>=) en atributo decimal
SELECT nombre_producto, precio_venta
FROM Productos
WHERE precio_venta >= 2.00;

-- Condición distinto (!=) en atributo cadena
SELECT nombre_producto, categoria
FROM Productos
WHERE categoria <> 'Granos';


-- Condición IN aplicada a atributo cadena
SELECT nombre_producto, categoria
FROM Productos
WHERE categoria IN ('Higiene', 'Bebidas', 'Lácteos');

-- Dos condiciones con AND
SELECT nombre_producto, precio_venta, stock_disponible
FROM Productos
WHERE precio_venta > 1.50
AND stock_disponible >= 50;

-- Dos condiciones con AND, proyección en 3 columnas y VISTA


CREATE VIEW Vista_Productos_Caros_Stock AS
SELECT nombre_producto, precio_venta, stock_disponible
FROM Productos
WHERE precio_venta > 1.50
AND stock_disponible >= 50;

SELECT * FROM Vista_Productos_Caros_Stock;

-- Dos condiciones con OR
SELECT nombre_producto, categoria
FROM Productos
WHERE categoria = 'Higiene'
OR categoria = 'Bebidas';

-- Condición con operador NOT
SELECT nombre_producto, categoria
FROM Productos
WHERE NOT categoria = 'Granos';

-- JOIN entre dos tablas con clave foránea
SELECT p.nombre_producto, pr.nombre AS proveedor
FROM Productos p
JOIN Proveedor pr ON p.id_proveedor = pr.id_proveedor;


-- JOIN, 3 columnas y VISTA
CREATE VIEW Vista_Productos_Proveedor AS
SELECT p.nombre_producto, p.precio_venta, pr.nombre AS proveedor
FROM Productos p
JOIN Proveedor pr ON p.id_proveedor = pr.id_proveedor;


-- LEFT JOIN
SELECT c.nombre, v.id_venta, v.total_final
FROM Cliente c
LEFT JOIN Ventas v ON c.id_cliente = v.id_cliente;


-- RIGHT JOIN
SELECT c.nombre, v.id_venta, v.total_final
FROM Cliente c
RIGHT JOIN Ventas v ON c.id_cliente = v.id_cliente;


-- Ordenamiento DESC
SELECT nombre_producto, precio_venta
FROM Productos
ORDER BY precio_venta DESC;


-- Ordenamiento ASC + DESC
SELECT nombre_producto, categoria, precio_venta
FROM Productos
ORDER BY categoria ASC, precio_venta DESC;
 

 -- Agrupamiento + COUNT
 SELECT categoria, COUNT(*) AS total_productos
FROM Productos
GROUP BY categoria;


-- PROYECCIONES CALCULADAS
SELECT nombre_producto,
       precio_venta,
       (precio_venta - costo_compra) AS ganancia
FROM Productos;


-- 3 columnas, una calculada con CONCAT
SELECT nombre,
       telefono,
       CONCAT(nombre, ' - ', telefono) AS contacto
FROM Proveedor;

-- Proyección similar + VISTA
CREATE VIEW Vista_Contacto_Proveedor AS
SELECT nombre,
       correo,
       CONCAT(nombre, ' <', correo, '>') AS contacto_email
FROM Proveedor;


-- Subconsulta que retorna un valor (con clave foránea)

SELECT nombre_producto
FROM Productos
WHERE id_proveedor = (
    SELECT id_proveedor
    FROM Proveedor
    WHERE nombre = 'Nestlé'
);

