Create Database Store

use Store

Create table Cliente(
NumCli int not null primary Key,
Nombre varChar(30) not null,
Direccion varChar(30) not null,
Fax int,
e_mail varChar(30) Default('Desconocido'),
saldo_0_30 Decimal(10,2),
Saldo2 Decimal(10,2)
);

Create table Vendedor(
CodVend int not null primary Key,
NomVend varChar(30) not null,
ApellVend varChar(30) not null,
DirVen varChar(30), 
TelVend int,
e_mail varChar(30) Default('Desconocido'),
Cuota decimal(10,2),
Ventas decimal(10,2)
);


Create table Articulo(
NumArt varchar(4) not null primary Key,
Descripción varChar(30) not null,
precio decimal(10,2) not null check(precio>=0.00),
Existencia int,
Categoria_Art char(15)
);


Create table Pedido(
NumPed int not null Primary  Key,
NumCli int not null,
CodVend int not null,
Fecha_ped Datetime,
Tot_Desc decimal(10,2),
Foreign key (Numcli) References Cliente(Numcli),
Foreign key (CodVend) References Vendedor(CodVend)
);

Create table Detalle_Ped(
NumPed int,                
NumArt varchar(4),
Cantidad  int check(Cantidad=0),
Primary Key (Numped,NumArt),
Foreign key (NumPed) References Pedido(Numped),
Foreign key (NumArt) References Articulo(NumArt)
);