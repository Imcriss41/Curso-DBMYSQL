<<<<<<< HEAD
-- Consulta de la base de datos


USE SaludTotal;


SELECT * from clientes;
Select * from medicinas;

Select count (*)  From clientes;
Select count (*)From medicinas;
-- Consultar por cedula de un cliente
-- Ejemplo 0100000049
-- Da la consulta del id que busquemos o la informacion
select * from clientes
where cedula = '0100000049';


-- Caso Proyeccion

SELECT email from clientes
where cedula = '0100000049'

SELECT nombre, email from clientes
Where cedula = '0100000049'

-- CASO CON MEDICINA

select * from medicinas
Where tipo = 'GEN';

Select tipo, nombre from medicinas
Where precio = '9.20';


Select nombre, id  from medicinas where nombre like 'f%';

-- CASO: CONOCER TODOS LOS CLIENTES QUE EMPIECEN CON LETRA A el a sera que despues del A se pondra cualquiero dato

Select nombre, cedula from clientes where nombre like 'A%';
Select nombre, cedula from clientes where nombre like 'Juan%';

--- CASO BUSCAR A JUAN SI ES JURIDICO Y UNION
SELECT cedula, nombre, apellido, email, telefono
FROM clientes
WHERE tipo = 'NAT'
  AND nombre LIKE '%JUAN%';


-- DOMINIO GMAIL Y UNION
SELECT cedula, nombre, apellido, tipo, email, telefono
FROM clientes
WHERE tipo = 'JUR'
  AND email LIKE '%@mail.com';


-- MEDICINAS

SELECT id, nombre, precio, tipo
from medicinas
Where stock = '80'
And tipo like '%Gen%'

SELECT id, nombre, tipo, precio, stock
FROM medicinas
WHERE nombre LIKE 'A%'
  AND tipo = 'COM';
--- BETWEEN
SELECT id, nombre, precio
FROM medicinas
WHERE precio BETWEEN 5 AND 20;
=======
-- Consulta de la base de datos
USE SaludTotal;

SELECT * from clientes;
Select * from medicinas;

Select count (*)  From clientes;
Select count (*)From medicinas;
-- Consultar por cedula de un cliente
-- Ejemplo 0100000049
-- Da la consulta del id que busquemos o la informacion
select * from clientes
where cedula = '0100000049';


-- Caso Proyeccion

SELECT email from clientes
where cedula = '0100000049'

SELECT nombre, email from clientes
Where cedula = '0100000049'

-- CASO CON MEDICINA

select * from medicinas
Where tipo = 'GEN';

Select tipo, nombre from medicinas
Where precio = '9.20';


Select nombre, id  from medicinas where nombre like 'f%';

-- CASO: CONOCER TODOS LOS CLIENTES QUE EMPIECEN CON LETRA A el a sera que despues del A se pondra cualquiero dato

Select nombre, cedula from clientes where nombre like 'A%';
Select nombre, cedula from clientes where nombre like 'Juan%';

--- CASO BUSCAR A JUAN SI ES JURIDICO Y UNION
SELECT cedula, nombre, apellido, email, telefono
FROM clientes
WHERE tipo = 'NAT'
  AND nombre LIKE '%JUAN%';


-- DOMINIO GMAIL Y UNION
SELECT cedula, nombre, apellido, tipo, email, telefono
FROM clientes
WHERE tipo = 'JUR'
  AND email LIKE '%@mail.com';


-- MEDICINAS

SELECT id, nombre, precio, tipo
from medicinas
Where stock = '80'
And tipo like '%Gen%' -- VERIFICAR LAS MEDICINAS

SELECT id, nombre, tipo, precio, stock
FROM medicinas
WHERE nombre LIKE 'A%'
  AND tipo = 'COM';

-- CONSULTA PARA PODER VERIFICAR EL NOMBRE DEL CLIENTE Y LA MEDICINA
-- APARECERA NOMBRE, CEDULA, ID Y NOMBRE Y DESCUENTO DEL CLIENTE

Select cedula_cliente as cedula,
(select nombre from clientes where cedula = cedula_cliente) as clientes,
id_medicamento as id,
(select nombre from medicinas  where id = id_medicamento) as medicina,
descuento
From pacientes_permanentes

-- DISEÑAR UNA CONSULTA PARA TABLA DE MEDICINA FRECUENTE

Select cedula_cliente as cedula,
(select nombre from clientes where cedula = cedula_cliente) as clientes,
id_medicamento as id,
(select nombre from medicinas  where id = id_medicamento) as medicina,
descuento
From pacientes_permanentes

-- MEDICINA MENOR A 0100000001
Select cedula_cliente as cedula,
(select nombre from clientes where cedula = cedula_cliente) as clientes,
id_medicamento as id,
(select nombre from medicinas  where id = id_medicamento) as medicina,
descuento
From pacientes_permanentes
WHERE descuento < ANY (
  select descuento 
  from pacientes_permanentes
  where cedula_cliente = '0100000010'
);

-- Caso: Listado de pacientes del plan medicina frecuente presente el precio final de la medicina junto el precio sin descuento



 Select * From medicinas;


SELECT
    cedula_cliente AS cedula,

    (SELECT nombre
     FROM clientes
     WHERE cedula = cedula_cliente) AS cliente,

    (SELECT nombre
     FROM medicinas
     WHERE id = id_medicamento) AS medicamento,
    (SELECT precio
     FROM medicinas
     WHERE id = id_medicamento) AS precio_original,

    descuento,
    ((SELECT precio
      FROM medicinas
      WHERE id = id_medicamento) * descuento / 100) AS valor_descuento,
    ((SELECT precio
      FROM medicinas
      WHERE id = id_medicamento)
     -
     ((SELECT precio
       FROM medicinas
       WHERE id = id_medicamento) * descuento )
    ) AS precio_final

FROM pacientes_permanentes;



-- CASO: LAS MEDICINAS COMERCIALES PUEDEN SER REEMPLAZADAS POR SUS CORRESPONDIENTES EN MEDICINAS GENERICAS
-- ELABORAR UN LISTADO QUE COMPARE EL PRECIO DE LA MEDICINA COMERCIAL CON SU EQUIVALENTE GENERICO


SELECT
    clasificacion_medicinas.medicina_com AS id_comercial,

    (SELECT nombre
     FROM medicinas
     WHERE id = clasificacion_medicinas.medicina_com) AS medicina_comercial,

    (SELECT precio
     FROM medicinas
     WHERE id = clasificacion_medicinas.medicina_com) AS precio_comercial,

    clasificacion_medicinas.medicina_gen AS id_generica,

    (SELECT nombre
     FROM medicinas
     WHERE id = clasificacion_medicinas.medicina_gen) AS medicina_generica,

    (SELECT precio
     FROM medicinas
     WHERE id = clasificacion_medicinas.medicina_gen) AS precio_generico

FROM clasificacion_medicinas;


Select * FROM clasificacion_medicinas;

-- USANDO JOIN EL PRIMER CASO DE DESCUENTO
SELECT
    pp.cedula_cliente AS cedula,
    c.nombre AS cliente,
    m.nombre AS medicamento,
    m.precio AS precio_original,
    pp.descuento,

    (m.precio * pp.descuento / 100) AS valor_descuento,

    (m.precio - (m.precio * pp.descuento / 100)) AS precio_final

FROM pacientes_permanentes pp
JOIN clientes c
    ON pp.cedula_cliente = c.cedula
JOIN medicinas m
    ON pp.id_medicamento = m.id;


-- USANDO JOIN EL SEGUNDO CASO GENERICAMENTE
SELECT
    cm.medicina_com AS id_comercial,
    mc.nombre       AS medicina_comercial,
    mc.precio       AS precio_comercial,

    cm.medicina_gen AS id_generica,
    mg.nombre       AS medicina_generica,
    mg.precio       AS precio_generico
FROM clasificacion_medicinas cm
JOIN medicinas mc
    ON mc.id = cm.medicina_com
JOIN medicinas mg
    ON mg.id = cm.medicina_gen;



Select * from medicinas;



--- CREAR TODAS LAS COMBINACIONES POSIBLES ENTRE TABLA DE CLIENTES Y MEDICINA

SELECT *
from 
clientes,   --- NO HACER ESTO
clasificacion_medicinas;

SELECT *
from     --- PRUEBA 2 DE NO HACERLO
medicinas,  
clasificacion_medicinas;

----- EJEMPLO CORRECTO

SELECT *
from 
clientes,  
clasificacion_medicinas;
WHERE
cliente.cedula = medicinafrecuente.cliente_cedula;


---  CASO DE MEDICINA

SELECT *
from 
medicinas,  
clasificacion_medicinas;
WHERE
medicinas.id = medicinafrecuente.medicina_id;

---- AGREGANDO CLIENTES
SELECT
    c.cedula,
    c.nombre,
    m.nombre,
    pp.descuento,
    m.tipo
FROM
    clientes c,
    medicinas m,
    pacientes_permanentes pp
WHERE
    m.id = pp.id_medicamento
    AND c.cedula = pp.cedula_cliente
    and m.tipo = "COM";

-- EJEMPLOS USANDO JOINN

    SELECT
    c.cedula,
    c.nombre,
    m.nombre,
    pp.descuento,
    m.tipo
FROM
    pacientes_permanentes pp
JOIN clientes c
    ON c.cedula = pp.cedula_cliente
JOIN medicinas m
    ON m.id = pp.id_medicamento
WHERE
    m.tipo = 'COM';

-- MEDICINA GENERICA Y COMERCIAL USANDO DOS VECES LA TABLA DE MEDICINA

SELECT
    mcom.id     AS id_comercial,
    mcom.nombre AS medicina_comercial,
    mcom.precio AS precio_comercial,

    mgen.id     AS id_generica,
    mgen.nombre AS medicina_generica,
    mgen.precio AS precio_generico
FROM clasificacion_medicinas cm
JOIN medicinas mcom ON mcom.id = cm.medicina_com
JOIN medicinas mgen ON mgen.id = cm.medicina_gen;


-- === FACTURA ====================-- ======================================
-- CABECERA DE LA FACTURA
-- ======================================
SELECT
    e.razonsocial AS farmacia,
    e.ruc         AS ruc_farmacia,
    e.direccion,
    e.telefono,
    e.email       AS email_farmacia,

    f.facturanumero,
    f.fecha,

    c.cedula      AS cedula_cliente,
    c.nombre,
    c.apellido,
    c.email       AS email_cliente,

    f.total
FROM facturas f
JOIN clientes c 
    ON c.cedula = f.cedula_cliente
JOIN empresa e 
    ON e.ruc = '1799999999001'
WHERE f.facturanumero = 'F0001';


-- ======================================
-- DETALLE DE LA FACTURA
-- ======================================
SELECT
    fd.facturanumero,
    m.id           AS id_medicamento,
    m.nombre       AS medicamento,
    fd.cantidad,
    m.precio,
    (fd.cantidad * m.precio) AS subtotal
FROM facturadetalle fd
JOIN medicinas m
    ON m.id = fd.medicamento_id
WHERE fd.facturanumero = 'F0001';


-- ======================================
-- PIE DE FACTURA
-- ======================================
SELECT
    f.facturanumero,
    f.total,
    mp.descripcion AS metodo_pago
FROM facturas f
JOIN metodo_pago mp
    ON mp.id = f.metodo_pago_id
WHERE f.facturanumero = 'F0001';


-- ======================================
-- UTILIDADES / VERIFICACIONES
-- ======================================

-- Mostrar tablas
SHOW TABLES;

-- Estructura de la tabla facturas
DESCRIBE facturas;

-- Ver factura específica
SELECT * 
FROM facturas 
WHERE facturanumero = 'F0001';

-- Verificación de relación factura - cliente
SELECT 
    f.facturanumero,
    f.cedula_cliente,
    c.cedula
FROM facturas f
LEFT JOIN clientes c 
    ON c.cedula = f.cedula_cliente;

-- PRECIO NO MAS DE 5 DOLARES
select
  id,
  nombre,
  precio
from medicinas
where not precio > 5;




-- CASO:LISTA ORDENANDA DE CLIENTES POR NOMBRE ALFABETICOS

Select * From Clientes

Select *
from clientes
ORDER BY
  apellido DESC limit 1;

  -- CASO : CONONCER LAS 5 MEDICINAS MAS CARAS DE LA FARMACIA

  SELECT
    id,
    nombre,
    precio
FROM medicinas
WHERE precio IS NOT NULL
ORDER BY precio DESC -- mas cara
LIMIT 5;


-- CASO: CONOCER LAS 5 MEDICINAS MAS BARATAS DE LA FARMACIASELECT
SELECT
 id,
    nombre,
    precio
FROM medicinas
WHERE precio IS NOT NULL
ORDER BY precio ASC -- mas barata
LIMIT 5;


-- CASO: MEDICINA COMERCIAL MAS BARATA

SELECT
    id,
    nombre,
    precio
FROM medicinas
WHERE tipo = 'COM'
  AND precio IS NOT NULL
ORDER BY precio ASC
LIMIT 1;

-- CASO: MEDICINA GENERICA MAS CARA
SELECT
    id,
    nombre,
    precio
FROM medicinas
WHERE tipo = 'GEN'
  AND precio IS NOT NULL
ORDER BY precio DESC
LIMIT 1;
-- CASO: MEDICINAS CON EL MENOR DESCUENTO 5
SELECT
    m.id,
    m.nombre,
    m.precio,
    pp.descuento
FROM pacientes_permanentes pp
INNER JOIN medicinas m
    ON m.id = pp.id_medicamento
WHERE m.tipo = 'COM'
  AND pp.descuento IS NOT NULL
ORDER BY pp.descuento ASC
LIMIT 5;

SELECT
    m.id,
    m.nombre,
    m.precio,
    MIN(pp.descuento) AS menor_descuento
FROM pacientes_permanentes pp
INNER JOIN medicinas m
    ON m.id = pp.id_medicamento
WHERE m.tipo = 'COM'
  AND pp.descuento IS NOT NULL
GROUP BY
    m.id,
    m.nombre,
    m.precio
ORDER BY menor_descuento ASC


-- ORDEN REALIZADA

SELECT DISTINCT
    m.id,
    m.nombre,
    pp.descuento
FROM pacientes_permanentes pp
JOIN medicinas m 
    ON m.id = pp.id_medicamento
WHERE m.id IN (
    SELECT
        m2.id
    FROM pacientes_permanentes pp2
    JOIN medicinas m2 
        ON m2.id = pp2.id_medicamento
    WHERE m2.tipo = 'COM'
)
ORDER BY pp.descuento ASC
LIMIT 5;
-- CASO : AGRUPAMIENTOS

Select  
tipo,
count (*) as Numero
from clientes
GROUP BY 
tipo;

desc medicinas;

SELECT
nombre,
precio,
stock,
precio * stock
from medicinas;


SELECT
tipo,
SUM (precio * stock)
from medicinas
GROUP BY
tipo;
-- FACTURA DETALLES, VALOR monetario por medicina vendida


SELECT
    medicamento_id,
    cantidad,
    precio_unitario,
    cantidad * precio_unitario AS subtotal_calculado
FROM facturadetalle
ORDER BY medicamento_id;

SELECT
    m.id AS medicamento_id,
    m.nombre AS medicamento,
    SUM(fd.cantidad * fd.precio_unitario) AS total_por_medicamento
FROM facturadetalle fd
JOIN medicinas m
    ON m.id = fd.medicamento_id
GROUP BY
    m.id,
    m.nombre
ORDER BY
    m.id;

-- EL MEJOR CLIENTE



SELECT
    fd.facturanumero,
    f.cedula_cliente,
    SUM(fd.cantidad * fd.precio_unitario) AS total_factura
FROM facturadetalle fd
JOIN facturas f
    ON f.facturanumero = fd.facturanumero
GROUP BY
    fd.facturanumero,
    f.cedula_cliente
ORDER BY
    fd.facturanumero;

SELECT
    c.cedula,
    c.nombre,
    c.apellido,
    SUM(f.total) AS total_comprado
FROM facturas f
JOIN clientes c
    ON c.cedula = f.cedula_cliente
GROUP BY c.cedula, c.nombre, c.apellido
ORDER BY total_comprado DESC
LIMIT 1;


-- CASO: PROYECCION

SELECT
    m.id,
    m.nombre,
    m.stock,
    m.precio,
    COALESCE(MIN(pp.descuento), 0) AS descuento,
    (m.stock * m.precio) 
      - (m.stock * COALESCE(MIN(pp.descuento), 0)) AS venta_proyectada
FROM medicinas m
LEFT JOIN pacientes_permanentes pp
    ON pp.id_medicamento = m.id
GROUP BY
    m.id,
    m.nombre,
    m.stock,
    m.precio
ORDER BY
    venta_proyectada DESC;

--  =======================
-- SOLUCION CON EL ING
-- =======================

create view v_ventas_proyeccion
as
SELECT
    pp.id_medicamento,
    m.nombre,
    m.precio,
    m.stock,
    pp.descuento,
    (m.precio - pp.descuento) AS nuevo_precio
FROM pacientes_permanentes pp
JOIN medicinas m
    ON m.id = pp.id_medicamento
UNION

SELECT
    m.id AS id_medicamento,
    m.nombre,
    m.precio,
    m.stock,
    0.00 AS descuento,  -- sin descuento es descuento 0
    m.precio AS nuevo_precio
FROM medicinas m
LEFT JOIN pacientes_permanentes pp
    ON pp.id_medicamento = m.id
WHERE pp.id_medicamento IS NULL;


-- PROYECCION DE VENTAS

SELECT
    SUM(nuevo_precio * stock) AS venta_total_proyectada
FROM v_ventas_proyeccion;



-- CASO DE FECHA

SELECT
    id,
    nombre,
    fechaCaducidad
FROM medicinas
WHERE fechaCaducidad >= DATE_ADD(LAST_DAY(CURDATE()), INTERVAL 1 DAY)
  AND fechaCaducidad <= LAST_DAY(DATE_ADD(CURDATE(), INTERVAL 1 MONTH))
ORDER BY fechaCaducidad;






-- CRONOGRAMA PARA 3 MESES DE LAS MEDICINAS
CREATE OR REPLACE VIEW v_cronograma_vencimiento_3m AS
SELECT
    DATE_FORMAT(fechaCaducidad, '%Y-%m') AS mes_vencimiento,
    id,
    nombre,
    fechaCaducidad,
    stock,
    tipo
FROM medicinas
WHERE fechaCaducidad >= CURDATE()
  AND fechaCaducidad <= LAST_DAY(DATE_ADD(CURDATE(), INTERVAL 3 MONTH));


SELECT *
FROM v_cronograma_vencimiento_3m
ORDER BY
    mes_vencimiento,
    fechaCaducidad;






















