DROP DATABASE IF EXISTS empresa;
CREATE DATABASE empresa;
USE empresa;


CREATE TABLE empleados (
    cedula INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    departamento VARCHAR(50) NOT NULL,
    cedula_jefe INT NULL,
    CONSTRAINT fk_jefe
        FOREIGN KEY (cedula_jefe) REFERENCES empleados(cedula)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);



-- EVITAR QUE ALGUIEN SEA SU PROPIO JEFE

INSERT INTO empleados VALUES
(2222222, 'Pedro', 'Almacenes', NULL),
(7777777, 'Ana', 'Dirección General', NULL);

INSERT INTO empleados VALUES
(5555555, 'Susana', 'Ventas', 7777777),
(4444444, 'Marco', 'Contabilidad', 7777777),
(1111111, 'Juan', 'Ventas', 5555555),
(6666666, 'Marcelo', 'Ventas', 5555555),
(3333333, 'María', 'Contabilidad', 4444444);

SELECT 
    e.cedula,
    e.nombre,
    e.departamento,
    IFNULL(j.nombre, 'Null') AS jefe
FROM empleados e
LEFT JOIN empleados j 
    ON e.cedula_jefe = j.cedula
ORDER BY e.cedula;

