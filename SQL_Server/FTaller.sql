Create Database Taller

use Taller

Create table TALLER(
ID_TALL		int				not null Primary key,
NOMBRE		varchar(20)		not null,
UBICACION	varchar(20)		not null,
);

Create table MECANICOS(
CODIGO_MEC		int			not null Primary key,
NOMBRES			varchar(30) not null,
APELLIDOS		varchar(30) not null,
CELULAR			varChar(9)	not null,
SUELDO			varchar(30) not null,
PROFESION		varchar(30) not null,
ID_TALL_PER		int			not null,
SUPERVISOR		int			not null,

Foreign key (ID_TALL_PER) References TALLER(ID_TALL),
);

Create table REPARACIONES(
NUM_REPARACION		int				not null Primary key,
FECHA_REPARACION	DATE			not null,
TIPO				varchar(30)		not null,
COSTE				decimal(10,2)	not null check(COSTE >= 00.00),
CODIGO_MEC_REP		int				not null,
PLACA_AUT			varchar(7)		not null,

Foreign key (CODIGO_MEC_REP) References MECANICOS(CODIGO_MEC),
Foreign key (PLACA_AUT) References AUTOSS(PLACA_AUT),
);

Create table AUTOSS(
PLACA_AUT	varchar(7) not null Primary key,
MARCA		varchar(30) not null,
MODELO		varchar(30) not null,
AÑO			int not null,
ID_CONC		varchar(5) FOREIGN KEY REFERENCES DEALERSHIP(ID_CONC),
COLOR varchar(15) not null,
--Foreign key (ID_CONC) References DEALERSHIP(ID_CONC),--
--CONSTRAINT ID_CONC FOREIGN KEY (P_Id)--
--REFERENCES Persons(P_Id)--
);

Create table DEALERSHIP(
ID_CONC			varchar(5)		not null primary key,
NOMBRE			varchar(30)		not null,
DIRECCION		varchar(20)		not null,
TELEFONO		varchar(9)		not null,
EMAIL			varChar(30) Default('Desconocido'),
);

