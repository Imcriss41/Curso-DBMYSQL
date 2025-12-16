-- ===============================
-- CREACIÓN DE BASE DE DATOS
-- ===============================
DROP DATABASE IF EXISTS Minimarket;
CREATE DATABASE Minimarket;
USE Minimarket;
CREATE TABLE Proveedor (
    id_proveedor INT PRIMARY KEY,
    nombre VARCHAR(150),
    telefono VARCHAR(20),
    correo VARCHAR(100)
);

INSERT INTO Proveedor VALUES
(1,'La Favorita','0991111111','favorita@mail.com'),
(2,'Nestlé','0992222222','nestle@mail.com'),
(3,'Pronaca','0993333333','pronaca@mail.com'),
(4,'Colgate','0994444444','colgate@mail.com'),
(5,'Unilever','0995555555','unilever@mail.com'),
(6,'Arca Continental','0996666666','arca@mail.com'),
(7,'PepsiCo','0997777777','pepsi@mail.com'),
(8,'Bimbo','0998888888','bimbo@mail.com'),
(9,'Toni','0999999999','toni@mail.com'),
(10,'Santa María','0980000000','santamaria@mail.com');


CREATE TABLE Productos (
    id_producto INT PRIMARY KEY,
    codigo_barra VARCHAR(30),
    nombre_producto VARCHAR(150),
    marca VARCHAR(50),
    categoria VARCHAR(50),
    precio_venta DECIMAL(10,2),
    costo_compra DECIMAL(10,2),
    stock_disponible INT,
    stock_minimo INT,
    id_proveedor INT,

    CONSTRAINT producto_proveedor_fk
        FOREIGN KEY (id_proveedor)
        REFERENCES Proveedor(id_proveedor)
);

INSERT INTO Productos VALUES
(1,'7501','Arroz 1kg','Supermaxi','Granos',1.50,1.10,100,20,1),
(2,'7502','Leche Entera','Toni','Lácteos',1.10,0.80,80,15,9),
(3,'7503','Pan Blanco','Bimbo','Panadería',1.25,0.90,60,10,8),
(4,'7504','Gaseosa Cola','CocaCola','Bebidas',1.75,1.20,90,20,6),
(5,'7505','Atún','Real','Enlatados',1.60,1.10,70,15,10),
(6,'7506','Aceite','La Favorita','Granos',3.20,2.50,50,10,1),
(7,'7507','Azúcar','Valdez','Granos',1.30,0.95,60,10,10),
(8,'7508','Jabón','Dove','Higiene',1.40,1.00,40,10,5),
(9,'7509','Pasta Dental','Colgate','Higiene',2.20,1.70,35,8,4),
(10,'7510','Cereal','Nestlé','Cereales',3.50,2.80,45,10,2);


CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY,
    cedula CHAR(10),
    nombre VARCHAR(200),
    telefono VARCHAR(20),
    correo VARCHAR(100),
    direccion VARCHAR(255)
);

INSERT INTO Cliente VALUES
(1,'0101010101','Ana Pérez','0991110001','ana@mail.com','Centro'),
(2,'0202020202','Luis Gómez','0991110002','luis@mail.com','Norte'),
(3,'0303030303','María Ruiz','0991110003','maria@mail.com','Sur'),
(4,'0404040404','Carlos León','0991110004','carlos@mail.com','Este'),
(5,'0505050505','Lucía Torres','0991110005','lucia@mail.com','Oeste'),
(6,'0606060606','Pedro Mora','0991110006','pedro@mail.com','Centro'),
(7,'0707070707','Sofía Díaz','0991110007','sofia@mail.com','Norte'),
(8,'0808080808','Andrés Vega','0991110008','andres@mail.com','Sur'),
(9,'0909090909','Paola Cruz','0991110009','paola@mail.com','Este'),
(10,'1010101010','Diego Ríos','0991110010','diego@mail.com','Oeste');


CREATE TABLE Ventas (
    id_venta INT PRIMARY KEY,
    id_cliente INT NULL,
    fecha_venta DATETIME,
    forma_pago VARCHAR(20),
    subtotal DECIMAL(12,2),
    impuestos DECIMAL(12,2),
    total_final DECIMAL(12,2),

    CONSTRAINT venta_cliente_fk
        FOREIGN KEY (id_cliente)
        REFERENCES Cliente(id_cliente)
);

INSERT INTO Ventas VALUES
(1,1,'2025-01-01 10:00','Efectivo',3.75,0.45,4.20),
(2,2,'2025-01-02 11:00','Tarjeta',1.10,0.13,1.23),
(3,3,'2025-01-03 12:00','Efectivo',2.50,0.30,2.80),
(4,4,'2025-01-04 13:00','Transferencia',3.20,0.38,3.58),
(5,5,'2025-01-05 14:00','Efectivo',1.60,0.19,1.79),
(6,6,'2025-01-06 15:00','Tarjeta',2.20,0.26,2.46),
(7,7,'2025-01-07 16:00','Efectivo',1.40,0.17,1.57),
(8,8,'2025-01-08 17:00','Tarjeta',3.50,0.42,3.92),
(9,9,'2025-01-09 18:00','Efectivo',1.30,0.16,1.46),
(10,10,'2025-01-10 19:00','Transferencia',1.25,0.15,1.40);
CREATE TABLE DetalleVenta (
    id_venta INT,
    id_producto INT,
    cantidad_vendida INT,
    precio_unitario DECIMAL(10,2),
    subtotal_detalle DECIMAL(12,2),

    PRIMARY KEY (id_venta, id_producto),

    CONSTRAINT detalle_venta_fk
        FOREIGN KEY (id_venta)
        REFERENCES Ventas(id_venta),

    CONSTRAINT detalle_producto_fk
        FOREIGN KEY (id_producto)
        REFERENCES Productos(id_producto)
);

INSERT INTO DetalleVenta VALUES
(1,1,1,1.50,1.50),
(1,3,1,1.25,1.25),
(2,2,1,1.10,1.10),
(3,7,2,1.30,2.60),
(4,6,1,3.20,3.20),
(5,5,1,1.60,1.60),
(6,9,1,2.20,2.20),
(7,8,1,1.40,1.40),
(8,10,1,3.50,3.50),
(9,7,1,1.30,1.30);

SELECT * From DetalleVenta;
SELECT * From Ventas;

