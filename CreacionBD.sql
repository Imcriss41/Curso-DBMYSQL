-- Creación de la base de datos del sistema saludtotal
CREATE DATABASE saludtotal;

-- Mostrar bases de datos
SHOW DATABASES;

USE saludtotal;

# Creación de la tabla medicinas
CREATE TABLE medicinas (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    tipo CHAR(3),
    precio DECIMAL(15,2),
    stock INT,
    fechacaducidad DATETIME
);
CREATE TABLE Clientes (
    cedula char(10) PRIMARY KEY,
    nombre VARCHAR(100),
    tipodepersona CHAR(3),
    fechanacimiento DATE
);


CREATE TABLE Promociones (
    
    idmedicamento CHAR(10) PRIMARY KEY,
    enfermedad VARCHAR(100),
    medicacion CHAR(50),
    Nombre VARCHAR(10),
    descuento DECIMAL(5,2)   -- Ejemplo: 10.50 = 10.5% de descuento
);
-- Agregar en la tabla--
ALTER TABLE Promociones
MODIFY COLUMN cedula CHAR(10) FIRST;

ALTER TABLE Promociones
MODIFY COLUMN Tipo CHAR(5) AFTER medicacion;


-- Agregar tabla a una existente--
ALTER TABLE Promociones
ADD COLUMN Tipo CHAR(5)

ALTER TABLE Promociones
ADD CONSTRAINT ClienteCedula_fk
Foreign Key (cedula) REFERENCES Clientes(cedula);



SHOW TABLES;
DESC medicinas;
DESC Clientes;


-- Carga de datos iniciales--
INSERT INTO Promociones
VALUES(
    '1715057921'
    5|,
    'diabetes'
    'GEN'
    0,25
);
INSERT INTO Promociones
VALUES (5, 'Diabetes', 'Insulina',  'Maritza',10.2,);

INSERT INTO Promociones
VALUES (6, 'Hipotirodismo', 'Levotoxorina',  'Linda',7.20);

--EDITAR LAS TABLAS---
UPDATE Promociones
SET cedula = '1234567890'
WHERE idmedicamento = 5;

UPDATE Promociones
SET cedula = '1234567890'
WHERE idmedicamento = 4;

UPDATE Promociones
SET cedula = '12342130'
WHERE idmedicamento = 6;

UPDATE Promociones
SET Tipo= 'GEN'
WHERE idmedicamento = 6;

UPDATE Promociones
SET Tipo = 'GEN'
WHERE idmedicamento = 5;

UPDATE Promociones
SET Tipo = 'GEN'
WHERE idmedicamento = 4;

UPDATE medicinas
SET Tipo = 'GEN'
WHERE stock = 1;


INSERT INTO Clientes
VALUES (1723751267, 'Erick', 'NT',  '2006-06-17');
INSERT  INTO Clientes
VALUES (1741231241, 'Maritza', 'JRD',  '2002-04-1');

INSERT  INTO Clientes
VALUES (1715057981, 'Martha', 'NT',  '2001-03-1');

INSERT  INTO Clientes
VALUES (1715057921, 'Jose', 'NT',  '2001-03-1');

INSERT  INTO Clientes
VALUES (1715127981, 'Linda', 'NT',  '2001-03-1');


INSERT INTO medicinas
VALUES (1, 'Paracetamol', 'GEN', 1.50, 12, '2026-01-01 00:00:00');

INSERT INTO medicinas
VALUES (2, 'Ibuprofeno', 'GEN', 0.56, 4, '2027-01-01 00:00:00');

INSERT INTO medicinas
VALUES (3, 'Finalin', 'COM', 2.75, 53, '2028-01-01 00:00:00');
INSERT INTO medicinas
VALUES (4, 'lorsatan', 'COM', 2.75, 2, '2028-01-01 00:00:00');

INSERT INTO medicinas
VALUES (5, 'Insulina', 'COM', 5.12,  1, '2028-01-01 00:00:00');

INSERT INTO medicinas
VALUES (6, 'Levotiroxina', 'COM', 5.12,  1, '2028-01-01 00:00:00');





--EJECUTAR LAS BASE DE DATOS--

SELECT * FROM medicinas;
SELECT * FROM Clientes;

SELECT * FROM Promociones;

-- eliminar la tabla--
ALTER TABLE Promociones
DROP COLUMN Nombre;

SHOW TABLES;





