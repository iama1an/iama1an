-----------------
--TABLA PLANILLA--
-----------------

SELECT*FROM Personas1

SELECT * INTO Personas1 FROM Personas

--1.	Seleccionar a las personas Que  nacieron en el mes de mayo--


Select * from Personas  where month(FECHA_NACIMIENTO )= 5

SELECT*FROM Personas WHERE FECHA_NACIMIENTO LIKE '%05%'

--2.	Seleccionar a las personas que ingresaron en 1988 y son de sex o masculino	(1988 NO HAY EN LOS REGISTROS -> POR ESO PONDRE UN AÑO QUE SI EXITA) --

SELECT NOMBRES, APELLIDOS, FECHA_INGRESO FROM Personas WHERE YEAR(FECHA_INGRESO )= 1991 AND SEXO = 'M'

--3.	Seleccionar las persona s mujeres cuyas edades sean mayores de 49 años--
--Creamos un campo edad
ALTER TABLE Personas ADD EDAD INT 
--calculamos la diferencia
SELECT * ,
	DATEDIFF(YEAR, FECHA_NACIMIENTO, GETDATE()) AS EDAD
FROM Personas,
--aplicamos criterios
SELECT*FROM Personas WHERE EDAD > 49 AND SEXO = 'F'

--OTRA FORMA DE HACER(MAS FACIL *NO SE GUARDA )
SELECT NOMBRES, APELLIDOS, ID_CARGO, SEXO,
	DATEDIFF(YEAR, FECHA_NACIMIENTO, GETDATE()) AS EDAD
FROM Personas  WHERE DATEDIFF(YEAR, FECHA_NACIMIENTO, GETDATE()) > 49 AND SEXO = 'F'

--4.	Calcula el  porcentaje que representa las bonificaciones  con respecto al sueldo--

ALTER TABLE Personas ADD PORCENTAJE_BONI_DE_SUELDO AS (BONIFICACION*100/SUELDO)
SELECT*FROM Personas
--MAS FACIL
SELECT  NOMBRES, ID_CARGO, SUELDO, BONIFICACION, (BONIFICACION*100)/sueldo AS PORCIENTO_SUELDO FROM Personas 

--5.	Buscar a las personas cuyo nombre inicien con E--

SELECT*FROM Personas WHERE NOMBRES LIKE 'E%'

--6.	Calcular  el máximo sueldo de los trabajadores con Alias SueMax --

SELECT MAX(SUELDO) AS SUELDO_MAXIMO FROM Personas

--7.	Seleccionar a las personas cuyos cargos sean  gerentes femeninas y analistas masculinas--

SELECT*FROM Personas WHERE ID_CARGO = 'GERENTE' AND SEXO = 'F' OR ID_CARGO = 'ANALISTA' AND SEXO = 'M'

--8.	Elevar el sueldo de las personas en el 15 %  cuál será los nuevos sueldos--

SELECT NOMBRES, APELLIDOS, SUELDO FROM Personas
UPDATE Personas 
SET SUELDO = SUELDO + (0.15 * SUELDO);

--9.	Listar a las personas que tienen como sueldos entre 3000 0000,00 y 5300 000,00 Euros --

SELECT NOMBRES, APELLIDOS, ID_CARGO, SUELDO FROM Personas
WHERE SUELDO BETWEEN 30000.00 AND 53000.00

--otra manera de hacerlo
select * from Personas where SUELDO >= 30000.00 and Sueldo<=53000.00;

--10.	Contar el número de trabajadores ,  Calcular el promedio de las bonificaciones y el total de los sueldos--

SELECT COUNT(DISTINCT ID_PERSONA) AS NUMERO_TRABAJADORES_TOTAL FROM Personas
SELECT AVG(BONIFICACION) AS PROMEDIO_BONIFICACION FROM Personas
SELECT SUM(SUELDO) AS TOTAL_SUELDO FROM Personas

--11.	Listar a los empleados que tengan  más de 23 años  y  Ordenar en forma descendente por fecha  de ingreso --

SELECT  APELLIDOS, NOMBRES, ID_CARGO, EDAD, FECHA_INGRESO, DATEDIFF(YEAR, FECHA_NACIMIENTO, GETDATE()) AS EDAD 
FROM Personas
WHERE DATEDIFF(YEAR, FECHA_NACIMIENTO, GETDATE()) > 23
ORDER BY FECHA_INGRESO DESC

SELECT*FROM Personas
--12.	Calcular la bonificación de los analistas y diseñadores en un 25 % sobre su sueldo y poner su alias como nuevaBoni--

--Primero creamos un nuevo campo con los criterios 
ALTER TABLE Personas ADD NUEVA_BONI AS (SUELDO*0.25)
--Segundo: mostramos los registros solicitados
SELECT * FROM Personas
WHERE ID_CARGO = 'DISEÑADOR' OR  ID_CARGO = 'ANALISTA';

SELECT NOMBRES, APELLIDOS, ID_CARGO, SUELDO, BONIFICACION,
SUELDO*0.25  AS NEW_BOM
FROM Personas
WHERE ID_CARGO IN ('DISEÑADOR','ANALISTA')

--13.	Seleccionar a los digitadores, analistas y diseñadores--

SELECT * FROM Personas
WHERE ID_CARGO = 'DIGITADOR' OR  ID_CARGO = 'ANALISTA' OR  ID_CARGO = 'DISEÑADOR';

SELECT * FROM Personas
WHERE ID_CARGO IN ( 'DIGITADOR', 'ANALISTA','DISEÑADOR')

--14.	Calcular el total de las comisiones que tienen que pagar--

SELECT SUM(COMICION) AS TOTAL_COMICIONES FROM Personas

--15.	Hallar la diferencia entre el sueldo y la bonificación--

SELECT NOMBRES, APELLIDOS, ID_CARGO, SUELDO, BONIFICACION,
	SUELDO - BONIFICACION  AS DIFERENCIA
FROM Personas


----MESES HALLAR
Select * from Personas  where year(FECHA_INGRESO)=1983 and SEXO= 'F' 