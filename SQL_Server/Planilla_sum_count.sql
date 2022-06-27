create database planilla

use planilla

create table Empleado(
IDE varchar(3) not null,
CODEMP varchar(5) not null primary key,
NOMEMP varchar(50) not null,
SUEBAS money not null,
AREA varchar(1) CHECK (AREA LIKE '[A-Z]')
);

INSERT INTO Empleado VALUES
('NS','1201','Carlos Arrieta',788,'P'),
('NS','1202','Miguel Vásquez',898,'F'),
('NS','1203','Raúl Mendoza',859,'P'),
('NS','1204','Raquel García',879,'P'),
('NS','1205','Carlos Vidal',735,'A'),
('NS','1206','Virginia Márquez',935,'F'),
('NS','1207','Rigoberto Mamani',780,'A'),
('NS','1208','Rosa Torres',670,'A')
--('EOF','1209','Alesandra Montoy',1500,'F')
--vemos que datos 
select * from empleado
--Creamos una copia de la tabla empleado para poder trabajar
select * into EmpleadoN from Empleado;
--creamos 2 nuevos campos en la tabla Empleado
ALTER TABLE EmpleadoN
ADD INCRE MONEY,
NEW_SUEL MONEY;
--calculamos el % de incremento segun al area
UPDATE EmpleadoN
SET INCRE = 0.23 * SUEBAS
WHERE AREA = 'A' AND IDE = 'NS';

UPDATE EmpleadoN
SET INCRE = 0.18 * SUEBAS
WHERE AREA = 'P' AND IDE = 'NS';

UPDATE EmpleadoN
SET INCRE = 0.25 * SUEBAS
WHERE AREA = 'F' AND IDE = 'NS';
--sumanos el sueldo basico y el incremento en un nuevo campo nuevo sueldo
UPDATE EmpleadoN
SET NEW_SUEL = SUEBAS + INCRE
WHERE IDE = 'NS';
--seleccionamos la tabla copia con todos sus datos y campos ya canculados
SELECT * FROM EmpleadoN
--seleccionamos campos especificos y le asignamos un alias para que sea mas entendible
SELECT 
CODEMP AS 'CODIGO DE EMPLEADO',
NOMEMP AS 'NOMBRE DE EMPLEADO',
SUEBAS AS 'SUELDO BASICO',
INCRE AS 'INCREMENTO',
NEW_SUEL AS 'NUEVO SUELDO'
FROM EmpleadoN;
--SUMAMOS EL TOTAL DE CADA CAMPO EN DINERO ESPESIFICAMENTE
SELECT SUM(SUEBAS) AS 'TOTAL GENERAL DE SUEDO BASICO' FROM EmpleadoN;
SELECT SUM(INCRE) AS 'TOTAL GENERAL DE INCREMENTO' FROM EmpleadoN;
SELECT SUM(NEW_SUEL) AS 'TOTAL GENERAL DE NUEVO SUEDO' FROM EmpleadoN;
--CONTAMOS EL NUMEOR DE EMPLEADOS EXISTEN EN CADA AREA
SELECT COUNT(AREA) AS 'NUMERO DE EMPLEADOS EN EL AREA FINANZAS' FROM EmpleadoN WHERE AREA = 'F';
SELECT COUNT(AREA) AS 'NUMERO DE EMPLEADOS EN EL AREA ADMINISTRACION' FROM EmpleadoN WHERE AREA = 'A';
SELECT COUNT(AREA) AS 'NUMERO DE EMPLEADOS EN EL AREA PRODUCCION' FROM EmpleadoN WHERE AREA = 'P';

