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

INSERT INTO medicinas VALUES

(5,'Aspirina','GEN',1.20,100,'2026-03-15'),
(6,'Diclofenaco','GEN',2.80,90,'2026-08-20'),
(7,'Metformina','GEN',3.10,70,'2027-02-10'),
(8,'Losartán','GEN',2.95,85,'2026-11-30'),
(9,'Atorvastatina','GEN',4.50,65,'2027-04-05'),
(10,'Omeprazol','GEN',1.90,110,'2026-09-01'),

(11,'Enalapril','GEN',2.40,95,'2026-12-10'),
(12,'Clopidogrel','GEN',5.60,55,'2027-06-18'),
(13,'Azitromicina','GEN',4.20,60,'2025-10-25'),
(14,'Ciprofloxacino','GEN',3.85,75,'2026-07-07'),
(15,'Prednisona','GEN',2.70,90,'2026-04-14'),
(16,'Salbutamol','GEN',3.25,80,'2027-08-22'),
(17,'Warfarina','GEN',6.10,45,'2026-02-28'),
(18,'Levotiroxina','GEN',2.30,100,'2027-05-19'),
(19,'Furosemida','GEN',1.85,105,'2026-10-09'),
(20,'Ranitidina','GEN',2.15,88,'2025-09-30'),

(21,'Amlodipino','GEN',2.90,92,'2026-06-11'),
(22,'Clorfenamina','GEN',1.40,130,'2026-01-25'),
(23,'Ketorolaco','GEN',3.60,70,'2026-08-03'),
(24,'Hidroclorotiazida','GEN',2.20,98,'2027-03-12'),
(25,'Loratadina','GEN',1.75,115,'2026-05-06'),
(26,'Simvastatina','GEN',4.10,68,'2027-07-27'),
(27,'Fluconazol','GEN',3.95,74,'2026-09-18'),
(28,'Captopril','GEN',2.00,102,'2026-11-02'),
(29,'Tramadol','GEN',5.30,58,'2027-01-16'),
(30,'Albendazol','GEN',2.60,85,'2026-04-29'),

(31,'Metronidazol','GEN',3.20,90,'2026-12-07'),
(32,'Nitrofurantoína','GEN',3.75,66,'2026-02-21'),
(33,'Naproxeno','GEN',2.95,88,'2026-07-14'),
(34,'Clindamicina','GEN',4.40,62,'2027-06-01'),
(35,'Bromhexina','GEN',1.65,120,'2026-03-09'),
(36,'Cetirizina','GEN',1.85,110,'2026-05-23'),
(37,'Carvedilol','GEN',3.30,77,'2027-08-10'),
(38,'Dexametasona','GEN',2.50,99,'2026-10-28'),
(39,'Pantoprazol','GEN',2.75,105,'2027-02-04'),
(40,'Clonazepam','GEN',6.80,50,'2026-09-15'),

(41,'Sertralina','GEN',5.90,55,'2027-04-21'),
(42,'Fluoxetina','GEN',4.80,60,'2026-06-30'),
(43,'Risperidona','GEN',7.20,48,'2027-07-19'),
(44,'Haloperidol','GEN',3.40,70,'2026-01-11'),
(45,'Valproato','GEN',6.50,52,'2027-03-08'),
(46,'Topiramato','GEN',7.10,45,'2028-05-25'),
(47,'Levetiracetam','GEN',8.40,40,'2028-09-17'),
(48,'Gabapentina','GEN',5.60,58,'2027-11-03'),
(49,'Pregabalina','GEN',9.20,35,'2028-06-14'),
(50,'Carbamazepina','GEN',4.90,63,'2027-10-01'),

(51,'Insulina Glargina','COM',28.50,30,'2028-01-12'),
(52,'Insulina Aspart','COM',27.80,28,'2028-03-18'),
(53,'Humalog','COM',32.40,25,'2028-06-09'),
(54,'Lantus','COM',35.10,22,'2028-08-27'),
(55,'Augmentin','COM',18.90,40,'2026-12-15'),
(56,'Bactrim','COM',14.50,45,'2026-07-05'),
(57,'Voltaren','COM',9.80,60,'2026-05-19'),
(58,'Advil','COM',8.90,70,'2026-03-02'),
(59,'Tylenol','COM',7.60,85,'2026-04-11'),
(60,'Zithromax','COM',21.30,38,'2027-09-06'),

(61,'Crestor','COM',29.90,26,'2028-02-23'),
(62,'Lipitor','COM',31.50,24,'2028-07-01'),
(63,'Plavix','COM',34.20,20,'2028-10-10'),
(64,'Nexium','COM',19.80,42,'2027-05-28'),
(65,'Losec','COM',17.60,48,'2026-11-14'),
(66,'Norvasc','COM',22.40,36,'2027-08-03'),
(67,'Cozaar','COM',24.10,34,'2028-04-16'),
(68,'Zyrtec','COM',12.90,55,'2026-09-22'),
(69,'Claritin','COM',13.50,52,'2026-10-30'),
(70,'Ventolin','COM',15.20,50,'2027-01-07'),

(71,'Prozac','COM',18.70,45,'2027-06-18'),
(72,'Zoloft','COM',20.30,40,'2028-03-11'),
(73,'Xanax','COM',22.80,35,'2028-07-26'),
(74,'Valium','COM',19.40,38,'2027-12-02'),
(75,'Lexapro','COM',21.90,34,'2028-05-09'),
(76,'Celexa','COM',18.60,42,'2027-09-21'),
(77,'Abilify','COM',36.50,18,'2029-02-14'),
(78,'Seroquel','COM',33.80,20,'2028-11-19'),
(79,'Risperdal','COM',29.70,26,'2028-08-04'),
(80,'Depakote','COM',27.90,28,'2027-10-28'),

(81,'Keppra','COM',34.60,22,'2029-01-15'),
(82,'Neurontin','COM',26.40,30,'2028-06-02'),
(83,'Lyrica','COM',38.90,18,'2029-03-20'),
(84,'Tegretol','COM',24.80,32,'2027-04-07'),
(85,'Glucophage','COM',16.70,50,'2026-12-09'),
(86,'Januvia','COM',28.30,25,'2028-02-26'),
(87,'Actos','COM',23.60,34,'2027-07-13'),
(88,'Amaryl','COM',19.90,40,'2026-10-17'),
(89,'Micardis','COM',27.40,28,'2028-09-05'),
(90,'Diovan','COM',26.10,30,'2027-11-22'),

(91,'Benicar','COM',25.80,32,'2028-01-08'),
(92,'Avapro','COM',24.90,34,'2027-03-19'),
(93,'Coreg','COM',22.70,36,'2027-08-31'),
(94,'Tenormin','COM',21.40,38,'2026-06-24'),
(95,'Inderal','COM',20.60,40,'2026-09-12'),
(96,'Lasix','COM',18.90,45,'2026-05-03'),
(97,'Aldactone','COM',19.70,42,'2026-11-29'),
(98,'Coumadin','COM',23.80,34,'2027-04-18'),
(99,'Eliquis','COM',41.50,15,'2029-06-06'),
(100,'Xarelto','COM',39.20,18,'2029-09-27');


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

ALTER TABLE clientes
MODIFY email VARCHAR(100);


INSERT INTO clientes VALUES 
('135204851','Marquitoita','Duez','NAT',15,'margarita@mail.com','0952146130');

INSERT INTO clientes VALUES
('1352104851','Margarita','Dueñaz','NAT',65,'margarita@mail.com','0952146320'),
('1726367459','Pablo','Cortez','NAT',20,'pablo@mail.com','0991112233'),
('1710544337','Marco','Cortez','JUR',56,'marco@mail.com','0987766554');

INSERT INTO clientes
(cedula, nombre, apellido, tipo, edad, email, telefono)
VALUES
('0100000001','Juan','Pérez','NAT',25,'juan.perez1@mail.com','0990000001'),
('0100000002','María','Gómez','JUR',24,'maria.gomez2@mail.com','0990000002'),
('0100000003','Carlos','Rodríguez','NAT',23,'carlos.rodriguez3@mail.com','0990000003'),
('0100000004','Ana','Martínez','NAT',22,'ana.martinez4@mail.com','0990000004'),
('0100000005','Luis','Hernández','JUR',21,'luis.hernandez5@mail.com','0990000005'),
('0100000006','Sofía','López','NAT',20,'sofia.lopez6@mail.com','0990000006'),
('0100000007','Miguel','García','NAT',19,'miguel.garcia7@mail.com','0990000007'),
('0100000008','Valentina','Torres','JUR',18,'valentina.torres8@mail.com','0990000008'),
('0100000009','Diego','Flores','NAT',26,'diego.flores9@mail.com','0990000009'),
('0100000010','Camila','Rojas','NAT',24,'camila.rojas10@mail.com','0990000010'),

('0100000011','Andrés','Vargas','JUR',23,'andres.vargas11@mail.com','0990000011'),
('0100000012','Lucía','Mendoza','NAT',22,'lucia.mendoza12@mail.com','0990000012'),
('0100000013','Fernando','Castro','NAT',21,'fernando.castro13@mail.com','0990000013'),
('0100000014','Daniela','Ortega','JUR',20,'daniela.ortega14@mail.com','0990000014'),
('0100000015','Jorge','Ramírez','NAT',19,'jorge.ramirez15@mail.com','0990000015'),
('0100000016','Paula','Navarro','NAT',18,'paula.navarro16@mail.com','0990000016'),
('0100000017','Ricardo','Cabrera','JUR',26,'ricardo.cabrera17@mail.com','0990000017'),
('0100000018','Elena','Paredes','NAT',24,'elena.paredes18@mail.com','0990000018'),
('0100000019','Sebastián','Morales','NAT',23,'sebastian.morales19@mail.com','0990000019'),
('0100000020','Natalia','Suárez','JUR',22,'natalia.suarez20@mail.com','0990000020'),

('0100000021','Hugo','Reyes','NAT',21,'hugo.reyes21@mail.com','0990000021'),
('0100000022','Carolina','León','NAT',20,'carolina.leon22@mail.com','0990000022'),
('0100000023','Iván','Molina','JUR',19,'ivan.molina23@mail.com','0990000023'),
('0100000024','Gabriela','Herrera','NAT',18,'gabriela.herrera24@mail.com','0990000024'),
('0100000025','Óscar','Peña','NAT',26,'oscar.pena25@mail.com','0990000025'),
('0100000026','Patricia','Silva','JUR',24,'patricia.silva26@mail.com','0990000026'),
('0100000027','Alberto','Cruz','NAT',23,'alberto.cruz27@mail.com','0990000027'),
('0100000028','Rocío','Delgado','NAT',22,'rocio.delgado28@mail.com','0990000028'),
('0100000029','Esteban','Guerrero','JUR',21,'esteban.guerrero29@mail.com','0990000029'),
('0100000030','Verónica','Campos','NAT',20,'veronica.campos30@mail.com','0990000030'),

('0100000031','Mauricio','Rivas','NAT',19,'mauricio.rivas31@mail.com','0990000031'),
('0100000032','Lorena','Salinas','JUR',18,'lorena.salinas32@mail.com','0990000032'),
('0100000033','Felipe','Aguilar','NAT',26,'felipe.aguilar33@mail.com','0990000033'),
('0100000034','Mónica','Espinoza','NAT',24,'monica.espinoza34@mail.com','0990000034'),
('0100000035','Raúl','Valdez','JUR',23,'raul.valdez35@mail.com','0990000035'),
('0100000036','Isabel','Cifuentes','NAT',22,'isabel.cifuentes36@mail.com','0990000036'),
('0100000037','Gonzalo','Arce','NAT',21,'gonzalo.arce37@mail.com','0990000037'),
('0100000038','Adriana','Mejía','JUR',20,'adriana.mejia38@mail.com','0990000038'),
('0100000039','Víctor','Lara','NAT',19,'victor.lara39@mail.com','0990000039'),
('0100000040','Claudia','Ibarra','NAT',18,'claudia.ibarra40@mail.com','0990000040'),

('0100000041','Rodrigo','Figueroa','JUR',26,'rodrigo.figueroa41@mail.com','0990000041'),
('0100000042','Marisol','Bustos','NAT',24,'marisol.bustos42@mail.com','0990000042'),
('0100000043','Eduardo','Soto','NAT',23,'eduardo.soto43@mail.com','0990000043'),
('0100000044','Paola','Cortés','JUR',22,'paola.cortes44@mail.com','0990000044'),
('0100000045','Nelson','Paz','NAT',21,'nelson.paz45@mail.com','0990000045'),
('0100000046','Juliana','Vega','NAT',20,'juliana.vega46@mail.com','0990000046'),
('0100000047','Sergio','López','JUR',19,'sergio.lopez47@mail.com','0990000047'),
('0100000048','Daniel','Mora','NAT',18,'daniel.mora48@mail.com','0990000048'),
('0100000049','Andrea','Acosta','NAT',26,'andrea.acosta49@mail.com','0990000049'),
('0100000050','Tomás','Benítez','JUR',24,'tomas.benitez50@mail.com','0990000050');



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
