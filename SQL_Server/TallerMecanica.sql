Create Database Taller_Mecanica

use Taller_Mecanica

Create table TALLER(
ID_TALL		varchar(3)		not null,
NOMBRE		varchar(20)		not null,
UBICACION	varchar(20)		not null,

--DEFINICION DE LA CLAVE PRIMARIA
Constraint PK_TALLER Primary key (ID_TALL),

--CON RESTRICCIONES EN LA CLAVE PRIMARIA--
CHECK (ID_TALL LIKE 'T[0-9][0-9]')
);

Create table CONCESIONARIA(
ID_CONC			varchar(3)		not null,
NOMBRE			varchar(30)		not null,
DIRECCION		varchar(20)		not null,
TELEFONO		varchar(9)		not null,
EMAIL			varChar(30),

Constraint PK_CONCESIONARIA Primary Key (ID_CONC),

CHECK (ID_CONC LIKE 'C[0-9][0-9]')
);

Create table MECANICOS(
CODIGO_MEC		varchar(3)	not null,
NOMBRES			varchar(30) not null,
APELLIDOS		varchar(30) not null,
CELULAR			varChar(9)	not null,
SUELDO			money		not null,
PROFESION		varchar(30) not null,
ID_TALL_PER		varchar(3)	not null,
SUPERVISOR		varchar(3),

Constraint PK_MECANICOS Primary key (CODIGO_MEC),
foreign key (ID_TALL_PER) References TALLER(ID_TALL),

CHECK (CODIGO_MEC LIKE 'M[0-9][0-9]')
);

Create table AUTOMOVILES(
PLACA_AUT	varchar(7)		not null,
MARCA		varchar(30)		not null,
MODELO		varchar(30)		not null,
AÑO			int				not null,
COLOR		varchar(15)		not null,
ID_CONC		varchar(3)		not null,


Constraint PK_AUTOMOVILES Primary key (PLACA_AUT),
foreign key (ID_CONC) References CONCESIONARIA(ID_CONC),

CHECK (PLACA_AUT LIKE '[A-Z][A-Z][A-Z]-[1-9][1-9][1-9]')
);

Create table REPARACIONES(
NUM_REPARACION		varchar(3)		not null,
FECHA_REPARACION	DATE			not null,
TIPO				varchar(30)		not null,
COSTE				MONEY			not null,
CODIGO_MEC_REP		varchar(3)		not null,
PLACA_AUT_REP		varchar(7),

Constraint PK_REPARACIONES Primary key (NUM_REPARACION),
foreign key (CODIGO_MEC_REP) References MECANICOS(CODIGO_MEC),
foreign key (PLACA_AUT_REP) references AUTOMOVILES(PLACA_AUT),

CHECK (NUM_REPARACION LIKE 'R[0-9][0-9]')
);


INSERT INTO TALLER VALUES 
('T01','EL ROBOT',' AV-CHAVES-342'),
('T02','REPARACIONES ','JN-VERMEJO-896'),
('T03','REPARACIONES ','JN-AQP-966')

INSERT INTO CONCESIONARIA VALUES 
('C01','SPORT','AREQUIPA','975843575','AQP@GMAIL.COM'),
('C02','CONXT','CUSCO','975843575','CSC@GMAIL.COM'),
('C03','SELLCOL','LIMMA','932756972','LMA@GMAIL.COM')

INSERT INTO MECANICOS VALUES 
('M01','juan','gonzales','975843575',2500,'operario','T02','M03'),
('M02','alanin','segobia','975379575',1900,'tecnico','T01','M01'),
('M03','atilio','arapa','976354125',3000,'ING','T03','M02')

INSERT INTO AUTOMOVILES VALUES 
('ADR-798','KIA','SPORTAGE',2021,'PLOMO','C02'),
('TYO-239','TOYOTA','YARIZ',2021,'VERDE','C01'),
('CHT-328','CHEVROLET','C8',2021,'ROJO','C03')

INSERT INTO REPARACIONES VALUES
('R01','01-04-2022','CAMBIO DE ACEITE',100,'M02','ADR-798'),
('R02','02-04-2022','PLANCHADO',550,'M03','TYO-239'),
('R03','03-04-2022','REEMPLAZO DE LLANTA',75,'M01','CHT-328')


Select*from TALLER;
Select*from MECANICOS;
Select*from CONCESIONARIA;
Select*from AUTOMOVILES;
Select*from REPARACIONES;

SELECT * FROM AUTOMOVILES WHERE MARCA = 'KIA'

SELECT * FROM MECANICOS WHERE PROFESION = 'ING'

SELECT SUM(COSTE) AS TOTAL_INGRESOS FROM REPARACIONES




select * into REPARACIONES2 from REPARACIONES

UPDATE REPARACIONES2 
SET COSTE = COSTE + (0.086 * COSTE);

select * FROM REPARACIONES
select * FROM REPARACIONES2

-- buscar datos de dos tablas diferentes donde uno de sus campos es igual
SELECT 
NOMBRES AS MECANICOS,
NOMBRE AS TALLER
FROM MECANICOS LEFT JOIN TALLER 
ON ID_TALL = ID_TALL_PER



SELECT COUNT(*) FROM AUTOMOVILES, CONCESIONARIA

/*CONSULATAS MULTITABLA DE 2 TABLAS ESPESIFICAMENTE**/

select M.NOMBRES, M.apellidos, M.sueldo,T.nombre as 'Nombre del taller donde trabaja',ubicacion 
from MECANICOS M inner JOIN TALLER T
ON M.ID_TALL_PER = T.ID_TALL
WHERE M.SUELDO < 2600
go

--consultas basicas de 3 tablas

select M.NOMBRES, M.apellidos, M.sueldo,T.nombre as 'Nombre del taller donde trabaja', R.TIPO AS 'Tipo de reparacion'
from MECANICOS M , TALLER T , REPARACIONES R
WHERE M.ID_TALL_PER = T.ID_TALL AND M.CODIGO_MEC = R.CODIGO_MEC_REP
go