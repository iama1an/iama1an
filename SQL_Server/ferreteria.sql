CREATE DATABASE FERRETERIA
USE FERRETERIA

CREATE TABLE Productos(
	idfab varchar(15) not null,
	idproducto varchar(15) not null primary key,
	descripcion varchar(55),
	precio money not null,
	existencias int not null
);

INSERT INTO Productos VALUES
('aci','41001','arandela',58,277),
('bic','41003','manivela',652,3),
('fea','112','cubo',243,15),
('imm','773c','reostato',975,28),
('rei','2a45c','junta',79,210);

SELECT * INTO Productos1 FROM Productos
SELECT * INTO Productos2 FROM Productos

ALTER TABLE Productos1
ADD proveedor VARCHAR(30);

DROP TABLE Productos2

Select * FROM Productos1