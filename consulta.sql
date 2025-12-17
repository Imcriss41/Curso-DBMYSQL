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
