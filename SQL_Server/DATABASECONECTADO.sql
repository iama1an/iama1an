create database bd1
go
use bd1
go
create table cliente (
id integer primary key,
nombre varchar(100) UNIQUE,
correo varchar(100) UNIQUE)
go
INSERT INTO cliente VALUES 
(1,'Juan Perez','jperez@hot.com'),
(2,'Maria Contreras','mcontreras@hot.com')
GO
select * from cliente
GO
create table productos(
id integer PRIMARY KEY,
nombre VARCHAR(100),
precio MONEY,
stock INTEGER)
GO
INSERT INTO productos VALUES
(1,'Leche Gloria tarro 250ml',2.5,150),
(2,'Leche Ideal tarro 250ml',2.2,150),
(3,'Cocacola 1L',2.5,50)
GO
SELECT * FROM productos
GO
