
Create Database sistemafactu

use sistemafactu

Create table Cliente(
id_cliente			varchar(3)	not null,
nombre				varChar(30) not null,
apellido			varChar(30) not null,
direccion			varChar(30) not null,
fecha_nacimiento	date		not null,
telefono			varChar(9)	not null,
email				varChar(30)				Default('Desconocido'),

Primary key (id_cliente),

--CON RESTRICCIONES EN LA CLAVE PRIMARIA--
CHECK (id_cliente LIKE 'C[0-9][0-9]')
);

drop table Cliente

Create table Modo_Pago(
num_pago		varchar(3)	not null,
nombre			varchar(30) not null,
otros_detalles	varchar(50),

Primary key (num_pago),

CHECK (num_pago LIKE 'M[0-9][0-9]')
);

Create table Factura(
num_factura		int			not null, 
id_cliente		varchar(3)	not null,
fecha			date		not null,
num_pago		varchar(3)	not null,

--DEFINICION DE LA CLAVE PRIMARIA
Primary key (num_factura),

--DEFINICION DE LA CLAE PRIMARIA
Foreign key (id_cliente) References Cliente(id_cliente),
Foreign key (num_pago) References Modo_Pago(num_pago)
);

Create table Categoria(
id_categoria	varchar(3)	not null ,
nombre			varchar(30) not null,
descripción		varchar(50),

--DEFINICION DE LA CLAVE PRIMARIA
Primary key (id_categoria),

--CON RESTRICCIONES EN LA CLAVE PRIMARIA--
CHECK (id_categoria LIKE 'C[0-9][0-9]')
);



Create table Producto(
id_producto		varchar(3)		not null,
id_categoria	varchar(3)		not null,
nombre			varchar(40)		not null,
precio			decimal(10,2)	not null,
stock			int check ( stock > 0 ),

--CON RESTRICCIONES EN LA CLAVE PRIMARIA--
CHECK (id_producto LIKE '[A-Z][A-Z][A-Z]'),
CHECK(precio >= 0.00),

--DEFINICION DE LA CLAVE PRIMARIA
Primary key (id_producto),

--DEFINICION DE LA CLAVE FORANEA
Foreign key (id_categoria) references Categoria(id_categoria)
);


Create table Detalle(
num_detalle		int				not null,
num_factura		int				not null,
id_producto		varchar(3)		not null,
cantidad		int				not null,
precio			decimal(10,2)	not null,

check(cantidad > 0),
check(precio >= 0.00),

Primary Key (num_detalle),
foreign key (num_factura) references Factura(num_factura),
foreign key (id_producto) references Producto(id_producto)
);

INSERT INTO Categoria VALUES 
('C01','TECNOLOGIA','ELCTRONICA'),
('C02','ALIMENTOS','PARA EL CONSUMO'),
('C03','BEBIDA','PARA EL CONSUMO')

INSERT INTO Producto VALUES 
('SDA','C01','X-box 360',500,100),
('SDB','C02','Caja de huevos',5,256),
('SDC','C03','Coca-cola 200ml',2,358),
('SDD','C02','Aceite de girasol',6,99)

INSERT INTO Modo_Pago VALUES
('M01','TARGETA','Targeta de debito o credito'),
('M02','EFECTIVO','Al contaado en caja')

INSERT INTO Cliente VALUES 
('C01','juan','gonzales','Av Colombia','05/09/2000','957584355','Juan@gmail.com'),
('C02','alanin','segobia','Av Venezuela','07/12/1995','937583575','alanin@gmail.com'),
('C03','atilio','arapa','Av Fransisco','2003/05/15','975843585','atilio@gmail.com'),
('C04','Camilo','Sodrimar','Av Brasil','1985-12-14','964785632','')

INSERT INTO Factura VALUES 
(1,'C01','02-05-2022','M01'),
(2,'C02','02-05-2022','M02'),
(3,'C03','02-05-2022','M02'),
(4,'C01','02-05-2022','M01')


INSERT INTO Detalle VALUES 
(1,1,'SDA',2,3.6),
(2,2,'SDB',3,5.5),
(3,3,'SDA',1,3.8),
(4,4,'SDC',4,7.8)


								--CONSULTAS SIMPLES

select * from Factura
select * from Modo_Pago
select * from Cliente
select * from Producto
select * from Detalle
select * from Categoria



SELECT SUM(stock) AS TOTAL_STOCK FROM Producto

Select * from Cliente  where month(fecha_nacimiento )= 5

SELECT*FROM Cliente WHERE fecha_nacimiento LIKE '%05%'

SELECT * INTO RespaldoProductos FROM Producto
select * from RespaldoProductos

select * from Producto where precio > 100

SELECT*FROM Cliente WHERE nombre LIKE 'A%'

SELECT MAX(precio) AS SUELDO_MAXIMO FROM Detalle

SELECT NOMBRE, APELLIDO, ID_CLIENTE,
	DATEDIFF(YEAR, FECHA_NACIMIENTO, GETDATE()) AS EDAD
FROM Cliente  WHERE DATEDIFF(YEAR, FECHA_NACIMIENTO, GETDATE()) > 25 

							--ACTUALISACIONES UPDATE---


--calculamos la diferencia
SELECT * ,
	DATEDIFF(YEAR, fecha_nacimiento, GETDATE()) AS EDAD
FROM Cliente,
--aplicamos criterios
SELECT*FROM Cliente WHERE EDAD > 49 

--eliminamos el campo creado anteriormente

--actualisacion de predio de un solo campo buscando por su codigo
UPDATE RespaldoProductos
SET precio = 150
WHERE id_producto = 'SDA'
--UPDATE para todos los datos de un campo
UPDATE RespaldoProductos 
SET precio = precio + (0.086 * precio);

SELECT * FROM RespaldoProductos

SELECT * FROM Cliente
UPDATE Cliente 
SET SUELDO = SUELDO + (0.15 * SUELDO);

	
								--ALTER--

ALTER TABLE Cliente ADD EDAD INT

ALTER TABLE Cliente DROP COLUMN EDAD;

ALTER TABLE Cliente ALTER COLUMN direccion Varchar(60);

ALTER TABLE Producto ALTER COLUMN Precio decimal(20,5);

									--ELIMINACION---

delete from RespaldoProductos

truncate table respaldoProductos

drop table RespaldoProductos

--CONSULATAS MULTITABLA

SELECT * FROM Cliente JOIN Factura ON id_cliente = id_cliente

SELECT 
nombre AS Cliente
fecha AS Numero_de_factura
FROM Cliente LEFT JOIN Factura
ON id_cliete = id_cliete