-- =====================================
-- CREACIÓN BASE DE DATOS
-- =====================================
DROP DATABASE IF EXISTS SaludTotal;
CREATE DATABASE SaludTotal;
USE SaludTotal;

-- =====================================
-- TABLA MEDICINAS
-- (Primero GEN, luego COM)
-- =====================================
CREATE TABLE medicinas (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    tipo CHAR(3) CHECK (tipo IN ('GEN','COM')),
    precio DECIMAL(15,2),
    stock INT,
    fechaCaducidad DATE
);

-- ===== MEDICINAS GENÉRICAS =====
INSERT INTO medicinas VALUES
(1,'Paracetamol','GEN',1.50,120,'2026-01-01'),
(2,'Ibuprofeno','GEN',2.10,80,'2026-06-01'),
(3,'Amoxicilina','GEN',3.75,60,'2025-12-01'),
(4,'Aspirina','GEN',1.20,100,'2026-03-15'),
(5,'Diclofenaco','GEN',2.80,90,'2026-08-20'),
(6,'Metformina','GEN',3.10,70,'2027-02-10'),
(7,'Losartán','GEN',2.95,85,'2026-11-30'),
(8,'Atorvastatina','GEN',4.50,65,'2027-04-05'),
(9,'Omeprazol','GEN',1.90,110,'2026-09-01'),
(10,'Enalapril','GEN',2.40,95,'2026-12-10');

-- ===== MEDICINAS COMERCIALES =====
INSERT INTO medicinas VALUES
(11,'Advil','COM',8.90,70,'2026-03-02'),
(12,'Tylenol','COM',7.60,85,'2026-04-11'),
(13,'Augmentin','COM',18.90,40,'2026-12-15'),
(14,'Voltaren','COM',9.80,60,'2026-05-19'),
(15,'Glucophage','COM',16.70,50,'2026-12-09'),
(16,'Lipitor','COM',31.50,24,'2028-07-01'),
(17,'Zithromax','COM',21.30,38,'2027-09-06'),
(18,'Norvasc','COM',22.40,36,'2027-08-03'),
(19,'Losec','COM',17.60,48,'2026-11-14'),
(20,'Lantus','COM',35.10,22,'2028-08-27');

-- =====================================
-- CLASIFICACIÓN MEDICINAS (GEN → COM)
-- =====================================
CREATE TABLE clasificacion_medicinas (
    medicina_gen INT,
    medicina_com INT,
    PRIMARY KEY (medicina_gen, medicina_com),
    FOREIGN KEY (medicina_gen) REFERENCES medicinas(id),
    FOREIGN KEY (medicina_com) REFERENCES medicinas(id)
);

INSERT INTO clasificacion_medicinas VALUES
(1,12),
(2,11),
(3,13),
(4,11),
(5,14),
(6,15),
(8,16),
(9,19),
(10,18);


-- =====================================
-- EMPRESA
-- =====================================

CREATE TABLE empresa (
    ruc CHAR(13) PRIMARY KEY,
    razonsocial VARCHAR(100),
    direccion VARCHAR(100),
    telefono VARCHAR(14),
    email VARCHAR(100)
);

INSERT INTO empresa VALUES
('1799999999001','Salud Total S.A.','Av. 10 de Agosto','0998887776','contacto@saludtotal.com');

-- =====================================
-- TABLA CLIENTES
-- =====================================
CREATE TABLE clientes (
    cedula CHAR(10) PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    tipo CHAR(3) CHECK (tipo IN ('NAT','JUR')),
    edad INT,
    email VARCHAR(100) UNIQUE,
    telefono VARCHAR(20)
);

INSERT INTO clientes VALUES
('0100000001','Juan','Pérez','NAT',25,'juan@mail.com','0990000001'),
('0100000002','María','Gómez','JUR',24,'maria@mail.com','0990000002'),
('0100000003','Carlos','Rodríguez','NAT',23,'carlos@mail.com','0990000003'),
('0100000004','Ana','Martínez','NAT',22,'ana@mail.com','0990000004'),
('0100000005','Luis','Hernández','JUR',21,'luis@mail.com','0990000005');

-- =====================================
-- PACIENTES PERMANENTES
-- =====================================
CREATE TABLE pacientes_permanentes (
    cedula_cliente CHAR(10),
    id_medicamento INT,
    padecimiento VARCHAR(50),
    frecuencia CHAR(3),
    paquete CHAR(2),
    via_administracion VARCHAR(15),
    cantidad INT,
    descuento DECIMAL(5,2),
    PRIMARY KEY (cedula_cliente, id_medicamento),
    FOREIGN KEY (cedula_cliente) REFERENCES clientes(cedula),
    FOREIGN KEY (id_medicamento) REFERENCES medicinas(id)
);

INSERT INTO pacientes_permanentes VALUES
('0100000001',1,'Dolor','DIA','NO','Oral',1,3.00),
('0100000001',9,'Gastritis','DIA','NO','Oral',1,4.00),
('0100000001',11,'Dolor','SEM','NO','Oral',1,5.00),

('0100000002',6,'Diabetes','DIA','NO','Oral',2,6.00),
('0100000002',15,'Diabetes','DIA','NO','Oral',1,5.00),

('0100000003',3,'Infección','SEM','NO','Oral',1,4.00),
('0100000003',13,'Infección','SEM','NO','Oral',1,6.00),

('0100000004',4,'Dolor leve','SEM','NO','Oral',1,2.00),
('0100000004',14,'Dolor','SEM','NO','Oral',1,3.50),

('0100000005',7,'Hipertensión','DIA','NO','Oral',1,6.00),
('0100000005',18,'Hipertensión','DIA','NO','Oral',1,7.00);

-- =====================================
-- TABLA MÉTODOS DE PAGO
-- =====================================
CREATE TABLE metodo_pago (
    id INT PRIMARY KEY,
    descripcion VARCHAR(50)
);

INSERT INTO metodo_pago VALUES
(1,'Efectivo'),
(2,'Tarjeta'),
(3,'Transferencia');

-- =====================================
-- TABLA FACTURAS (CABECERA)
-- =====================================
CREATE TABLE facturas (
    facturanumero CHAR(10) PRIMARY KEY,
    fecha DATE,
    cedula_cliente CHAR(10),
    metodo_pago_id INT,
    total DECIMAL(15,2),
    FOREIGN KEY (cedula_cliente) REFERENCES clientes(cedula),
    FOREIGN KEY (metodo_pago_id) REFERENCES metodo_pago(id)
);

INSERT INTO facturas VALUES
('F0001','2025-01-10','0100000001',1,12.50),
('F0002','2025-01-12','0100000002',2,22.10);

-- =====================================
-- TABLA FACTURA DETALLE
-- =====================================
CREATE TABLE facturadetalle (
    facturanumero CHAR(10),
    medicamento_id INT,
    cantidad INT,
    precio_unitario DECIMAL(15,2),
    subtotal DECIMAL(15,2),
    PRIMARY KEY (facturanumero, medicamento_id),
    FOREIGN KEY (facturanumero) REFERENCES facturas(facturanumero),
    FOREIGN KEY (medicamento_id) REFERENCES medicinas(id)
);

INSERT INTO facturadetalle VALUES
('F0001',1,2,1.50,3.00),
('F0001',9,1,1.90,1.90),
('F0002',15,1,16.70,16.70),
('F0002',6,2,3.10,6.20);


Select * from facturadetalle;