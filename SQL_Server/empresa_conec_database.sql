CREATE DATABASE EMPRESA;
GO
USE EMPRESA;
GO
CREATE TABLE ResumenVentas(
Id integer PRIMARY KEY IDENTITY(1,1),
Año varchar(4),
Mes varchar(20),
Ventas money)
GO

INSERT INTO ResumenVentas VALUES 
('2018','Enero',50000.00),
('2018','Febrero',75000.00),
('2018','Marzo',95000.00),
('2018','Abril',70000.00),
('2018','Mayo',115000.00),
('2018','Junio',95000.00)
GO
select * from ResumenVentas;
GO