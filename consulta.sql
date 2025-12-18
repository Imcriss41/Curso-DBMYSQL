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
And tipo like '%Gen%'

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

-- Caso: Listado de pacientes del plan medicina frecuentepresente el precio final de la medicina junto el precio sin descuento



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
    clasificacion_medicinas.id_medicina AS id_comercial,

    (SELECT nombre
     FROM medicinas
     WHERE id = clasificacion_medicinas.id_medicina) AS medicina_comercial,

    (SELECT precio
     FROM medicinas
     WHERE id = clasificacion_medicinas.id_medicina) AS precio_comercial,

    clasificacion_medicinas.alternativa AS id_generica,

    (SELECT nombre
     FROM medicinas
     WHERE id = clasificacion_medicinas.alternativa) AS medicina_generica,

    (SELECT precio
     FROM medicinas
     WHERE id = clasificacion_medicinas.alternativa) AS precio_generico
FROM clasificacion_medicina

Select * FROM clasificacion_medicinas;

Select * from medicinas;








