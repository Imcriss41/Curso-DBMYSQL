-- ===============================
-- CREACIÓN DE BASE DE DATOS
-- ===============================
DROP DATABASE IF EXISTS SaludTotal;
CREATE DATABASE SaludTotal;
USE SaludTotal;

-- ===============================
-- TABLA MEDICINAS
-- ===============================
CREATE TABLE medicinas (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    tipo CHAR(3), 
    precio DECIMAL(15,2),
    stock INT,
    fechaCaducidad DATETIME
);
-- DELIMITAR Y QUE NO HAYA ERRORES 
SELECT * From medicinas;
Alter table medicinas
Add constraint medicias_tipo_val
check(
tipo in ('GEN','COM')
);



alter table medicinas
MODIFY column nombre VARCHAR(100) NOT NULL;

Alter TABLE medicinas
MODIFY COLUMN tipo char (3) DEFAULT 'GEN';

Alter Table medicinas
Add constraint medicinas_nombre_uq
unique(nombre);


INSERT INTO medicinas VALUES
(1,'Paracetamol','GEN',1.50,120,'2026-01-01'),
(2,'Ibuprofeno','GEN',2.10,80,'2026-06-01'),
(3,'Amoxicilina','GEN',3.75,60,'2025-12-01'),
(4,'Insulina','COM',25.40,40,'2027-01-01');

-- ===============================
-- TABLA CLIENTES
-- ===============================
CREATE TABLE clientes (
    cedula CHAR(10) PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    tipo CHAR(3),
    edad INT,
    email VARCHAR(20),
    telefono VARCHAR(20)
);
-- MAIL UNICO
Alter Table Clientes
Add constraint cliente_email_uq
unique(email);

INSERT INTO clientes VALUES 
('135204851','Marquitoita','Duez','NAT',15,'margarita@mail.com','0952146130');

INSERT INTO clientes VALUES
('1352104851','Margarita','Dueñaz','NAT',65,'margarita@mail.com','0952146320'),
('1726367459','Pablo','Cortez','NAT',20,'pablo@mail.com','0991112233'),
('1710544337','Marco','Cortez','JUR',56,'marco@mail.com','0987766554');


-- ===============================
-- TABLA EMPRESA (INDEPENDIENTE)
-- ===============================
CREATE TABLE empresa (
    ruc CHAR(13) PRIMARY KEY,
    razonsocial VARCHAR(100),
    direccion VARCHAR(100),
    telefono VARCHAR(14),
    email VARCHAR(25)
);

INSERT INTO empresa VALUES
('1799999999001','Salud Total S.A.','Av. 10 de Agosto','0998887776','contacto@saludtotal.com');

-- ===============================
-- TABLA FACTURAS
-- ===============================
CREATE TABLE facturas (
    facturanumero CHAR(10) PRIMARY KEY,
    fecha DATE,
    cedula CHAR(10),
    total DECIMAL(15,2),

    CONSTRAINT facturas_cliente_fk
        FOREIGN KEY (cedula)
        REFERENCES clientes(cedula)
);

INSERT INTO facturas VALUES
('0000000001','2025-01-10','1352104851',6.75),
('0000000002','2025-01-12','1726367459',3.60);

-- ===============================
-- TABLA FACTURA DETALLE
-- ===============================
CREATE TABLE facturadetalle (
    facturanumero CHAR(10),
    medicamento_id INT,
    cantidad INT,
    precio DECIMAL(15,2),

    PRIMARY KEY (facturanumero, medicamento_id),

    CONSTRAINT fd_factura_fk
        FOREIGN KEY (facturanumero)
        REFERENCES facturas(facturanumero),

    CONSTRAINT fd_medicina_fk
        FOREIGN KEY (medicamento_id)
        REFERENCES medicinas(id),

    CONSTRAINT fd_cantidad_ck CHECK (cantidad > 0),
    CONSTRAINT fd_precio_ck CHECK (precio > 0)
);

INSERT INTO facturadetalle VALUES
('0000000001',1,2,1.50),
('0000000001',2,1,2.10),
('0000000002',3,1,3.60);

-- ===============================
-- PACIENTES PERMANENTES
-- ===============================
CREATE TABLE pacientes_permanentes (
    cedula_cliente CHAR(10),
    id_medicamento INT,
    padecimiento VARCHAR(50),
    frecuencia CHAR(3),
    paquete CHAR(2),
    via_administracion VARCHAR(10),
    cantidad INT,
    descuento DECIMAL(5,2),

    PRIMARY KEY (cedula_cliente, id_medicamento),

    CONSTRAINT pp_cliente_fk
        FOREIGN KEY (cedula_cliente)
        REFERENCES clientes(cedula),

    CONSTRAINT pp_medicina_fk
        FOREIGN KEY (id_medicamento)
        REFERENCES medicinas(id)
);

Alter TABLE pacientes_permanentes
MODIFY COLUMN frecuencia char (3) DEFAULT 'OCS';

SELECT * From pacientes_permanentes

INSERT INTO pacientes_permanentes VALUES
('1352104851',4,'Diabetes','MEN','NO','Subcutanea',2,10.00),
('1726367459',1,'Dolor cronico','SEM','NO','Oral',4,5.00);

-- ===============================
-- CLASIFICACIÓN DE MEDICINAS
-- ===============================
CREATE TABLE clasificacion_medicinas (
    id_medicina INT,
    alternativa INT,

    PRIMARY KEY (id_medicina, alternativa),

    CONSTRAINT cm_medicina_fk
        FOREIGN KEY (id_medicina)
        REFERENCES medicinas(id),

    CONSTRAINT cm_alternativa_fk
        FOREIGN KEY (alternativa)
        REFERENCES medicinas(id)
);

INSERT INTO clasificacion_medicinas VALUES
(1,2),
(3,1);

-- ===============================
-- PROVEEDORES
-- ===============================
CREATE TABLE proveedor (
    ruc CHAR(13) PRIMARY KEY,
    nombre VARCHAR(100),
    contacto VARCHAR(100),
    email VARCHAR(100)
);

INSERT INTO proveedor VALUES
('1700000000001','Bayer Ecuador','Luis Mayorga','lmayorga@bayer.com'),
('1700000000002','HealthCom','Andrea Ruiz','aruiz@healthcom.com');

-- ===============================
-- PROVEEDOR_MEDICINAS
-- ===============================
CREATE TABLE proveedor_medicinas (
    proveedor_ruc CHAR(13),
    medicina_id INT,
    proveedor_precio DECIMAL(10,2),
    lote INT,
    plazo INT,

    PRIMARY KEY (proveedor_ruc, medicina_id),

    CONSTRAINT proveedor_fk
        FOREIGN KEY (proveedor_ruc)
        REFERENCES proveedor(ruc),

    CONSTRAINT medicina_proveedor_fk
        FOREIGN KEY (medicina_id)
        REFERENCES medicinas(id)
);

INSERT INTO proveedor_medicinas VALUES
('1700000000001',1,0.25,100,15),
('1700000000001',2,0.30,200,30),
('1700000000002',3,1.20,150,20),
('1700000000002',4,18.50,50,10);


SELECT * FROM Clientes
