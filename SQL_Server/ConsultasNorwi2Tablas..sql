select * from Employees

SELECT *       FROM Customers WHERE Country='USA'

--8.  Mostrar las ordenes hechas en el año 1996           
SELECT *      FROM Orders      WHERE YEAR(OrderDate)='1996'  
--9.  Mostrar las ordenes hechas en el año 1997 ,del mes de abril        
SELECT *       FROM Orders WHERE YEAR(OrderDate)='1997' AND MONTH( OrderDate)='4'  
--10. Mostrar las ordenes hechas el primero de todos los meses, del año 1998        
SELECT *       FROM Orders WHERE DAY(OrderDate)= '1' AND YEAR(OrderDate)='1998'  
--11. Mostrar todos los clientes que no tienen fax        
SELECT *       FROM Customers WHERE Fax IS NULL  
--12. Mostrar todos los clientes que tienen fax        
SELECT *       FROM Customers WHERE Fax IS NOT NULL  
--13. Mostrar el nombre del producto, el precio, el stock y el nombre de la categoría a la que pertenece.        
SELECT ProductName,UnitPrice,UnitsInStock,CategoryName       
FROM Products       INNER JOIN Categories 
ON Categories.CategoryID=Products.CategoryID  
--14. Mostrar el nombre del producto, el precio producto, el código del proveedor y el 
--nombre de la compañía proveedora.        
SELECT ProductName,UnitPrice,P.SupplierID,CompanyName       
FROM Products AS P       
INNER JOIN Suppliers AS S ON S.SupplierID=P.SupplierID  
--15. Mostrar el número de orden, el código del producto, el precio, la cantidad y el total pagado por producto.        
SELECT OrderID,ProductID,UnitPrice,Quantity,       
(UnitPrice*Quantity) AS TOTAL  
FROM [Order Details]
--16. Mostrar el número de la orden, fecha, código del producto, precio, código del empleado y su nombre completo.       
SELECT O.OrderID,OrderDate,ProductID,UnitPrice,      
O.EmployeeID,(lastname+' '+FirstName)      
FROM Orders AS O         
INNER JOIN [Order Details] AS D           
ON O.OrderID=D.OrderID         
INNER JOIN Employees AS E     
ON E.EmployeeID=O.EmployeeID  
--17. Mostrar los 10 productos con menor stock        
SELECT TOP 10 *       
FROM Products ORDER BY UnitsInStock  
--18. Mostrar los 10 productos con mayor stock        
SELECT TOP 10 *       
FROM Products  
ORDER BY UnitsInStock Desc  
--19. Mostrar los 10 productos con menor precio        
SELECT TOP 10 *       
FROM Products ORDER BY UnitPrice  
--20. Mostrar los 10 productos con mayor precio        
SELECT TOP 10 *       
FROM Products  ORDER BY UnitPrice Desc  
--21. Mostrar los 10 productos más baratos        
SELECT TOP 10 *       
FROM Products ORDER BY UnitPrice  
--22. Mostrar los 10 productos más caros        
SELECT TOP 10 *       FROM Products  ORDER BY UnitPrice Desc 



--1.  Seleccionar todos los campos de la tabla clientes,ordenar por compania          
SELECT *         FROM Customers         ORDER BY CompanyName  
--2.  Seleccionar todos los campos de clientes,cuya compania empiece con la letra B y pertenezcan a UK ,ordenar por nombre de la compania          
SELECT *         
FROM Customers         
WHERE CompanyName like 'B%' AND Country='UK'         
ORDER BY CompanyName   
--3.  Seleccionar todos los campos de productos de las categorias 1,3 y 5 ,ordenar por categoria           
SELECT *          
FROM Products          
WHERE CategoryID IN(1,3,5) ORDER BY CategoryID  
--4.  Seleccionar los productos cuyos precios unitarios estan entre 50 y 200           
SELECT *          FROM Products WHERE UnitPrice BETWEEN 50 AND 200  
--5.  Visualizar el nombre y el id de la compania del cliente,fecha,precio unitario y producto de la orden           
SELECT  O.OrderID,CompanyName,O.CustomerID,O.OrderDate,          
OD.UnitPrice,P.ProductName          
FROM Customers AS C             
INNER JOIN Orders AS O                
ON C.CustomerID=O.CustomerID             
INNER JOIN [Order Details] AS OD                
ON O.OrderID=OD.OrderID             
INNER JOIN Products AS P       
ON P.ProductID=OD.ProductID  
--6.  Visualizar el nombre de la categoria y el numero de productos que hay por cada categoria.           
SELECT CategoryName ,COUNT(*)  AS 'TOTAL RODUCTOS'          
FROM Categories AS C              
INNER JOIN Products AS P                
ON C.CategoryID=P.CategoryID     
GROUP BY CategoryName

--7.  Seleccionar los 5 productos mas vendidos          
SELECT TOP 5 ProductName,SUM(Quantity)         
FROM [Order Details] AS D            
INNER JOIN Products AS P              
ON D.ProductID=P.ProductID            
GROUP BY ProductName   
ORDER BY SUM(Quantity)  
--8.  Seleccionar los jefes de los empleados           
SELECT ReportsTo,LastName+''+FirstName AS NOMBRE          
FROM Employees WHERE ReportsTo IS NOT NULL  
--9.  Obtener todos los productos cuyo nombre comienzan con M y tienen un precio comprendido entre 28 y 129            
SELECT *           
FROM Products           
WHERE ProductName LIKE 'M%' AND UnitPrice BETWEEN 28 AND 129  
--10. Obtener todos los clientes del  Pais de USA,Francia y UK           
SELECT *          FROM Customers WHERE Country IN('USA','France','UK')  
--11. Obtener todos los productos descontinuados o con stock cero.           
SELECT *          
FROM Products  
WHERE Discontinued =1 OR UnitsInStock=0  
--12. Obtener todas las ordenes hechas por el empleado King Robert           
SELECT O.OrderID,O.EmployeeID,          
(lastname+' '+FirstName)AS NOMBRE_Y_APELLIDO_DEL_EMPLEADO          
FROM Orders AS O               INNER JOIN Employees AS E                   
ON  O.EmployeeID=E.EmployeeID      
WHERE (E.lastname+' '+E.FirstName)='King Robert'  
--13. Obtener todas las ordenes por el cliente cuya compania es "Que delicia"          
SELECT O.OrderID,O.CustomerID ,CompanyName         
FROM Orders AS O            
INNER JOIN Customers AS C              
ON  O.CustomerID=C.CustomerID   
WHERE O.CustomerID='QUEDE'
--14. Obtener todas las ordenes hechas por el empleado King Robert,Davolio Nancy y Fuller Andrew            
SELECT O.OrderID,O.EmployeeID,           
(lastname+' '+FirstName)AS  NOMBRE_Y_APELLIDO_DEL_EMPLEADO           
FROM Orders AS O               INNER JOIN Employees AS E                  
ON  O.EmployeeID=E.EmployeeID      
WHERE (E.lastname+' '+E.FirstName)IN('King Robert','Davolio Nancy','Fuller Andrew')  
--15. Obtener todos los productos(codigo,nombre,precio,stock) de la orden 10257           
SELECT O.OrderID,OD.ProductID,ProductName,          OD.UnitPrice,UnitsInStock          
FROM Products AS P               INNER JOIN [Order Details] AS OD                 
ON P.ProductID=OD.ProductID              INNER JOIN Orders AS O                 
ON O.OrderID=OD.OrderID     WHERE O.OrderID=10257  
--16. Obtener todos los productos(codigo,nombre,precio,stock) de las ordenes hechas desde 1997 hasta la fecha de hoy.          
SELECT O.OrderDate,OD.ProductID,ProductName,         OD.UnitPrice,UnitsInStock         FROM Products AS P              
INNER JOIN [Order Details] AS OD                ON P.ProductID=OD.ProductID             INNER JOIN Orders AS O                
ON O.OrderID=OD.OrderID       WHERE YEAR(O.OrderDate) BETWEEN 1997 AND 2013  
--17. Calcular los 15 productos mas caros           
SELECT TOP 15 *          FROM Products  ORDER BY UnitPrice Desc    
--18. Calcular los 5 productos mas baratos           
SELECT TOP 5 *          FROM Products  
ORDER BY UnitPrice  
--19. Obtener el nombre de todas las categorias y los nombres de sus productos,precio y stock.           
SELECT CategoryName,ProductName,UnitPrice,UnitsInStock          
FROM Categories AS C             INNER JOIN Products AS P      
ON C.CategoryID=P.CategoryID 
--20. Obtener el nombre de todas las categorias y los nombres de sus productos,solo los productos que su nombre no comience con la letra P  
--21. Calcular el stock de productos por cada categoria.Mostrar el nombre de la categoria y el stock por categoria.           
SELECT C.CategoryName,P.UnitsInStock          
FROM Products AS P             
INNER JOIN Categories AS C         
ON P.CategoryID=C.CategoryID 
--22. Obtener el Nombre del cliente,Nombre del Proveedor,Nombre del empleado y el nombre de los productos que estan en la orden 10794      
SELECT O.OrderID,C.CompanyName,S.CompanyName,FirstName,ProductName     
FROM Customers AS C          INNER JOIN Orders AS O              
ON C.CustomerID=O.CustomerID          INNER JOIN Employees AS E              
ON O.EmployeeID=E.EmployeeID     INNER JOIN [Order Details] AS OD      
ON O.OrderID=OD.OrderID     INNER JOIN Products AS P      
ON P.ProductID=OD.ProductID     INNER JOIN  Suppliers AS S      
ON S.SupplierID=P.SupplierID WHERE O.OrderID=10794  
--23. Mostrar el numero de ordenes de cada uno de los clientes por año,luego ordenar codigo del cliente y el año.          
SELECT CustomerID,YEAR(OrderDate),COUNT(*)         
FROM Orders         
GROUP BY CustomerID,YEAR(OrderDate)         
ORDER BY CustomerID,YEAR(OrderDate)  
--24. Contar el numero de ordenes que se han realizado por años y meses ,luego debe ser ordenado por año y por mes.          
SELECT YEAR(OrderDate) ,COUNT(*)         
FROM Orders         
GROUP BY YEAR(OrderDate),MONTH(OrderDate)         
ORDER BY YEAR(OrderDate),MONTH(OrderDate)  
--25. Seleccionar el nombre de la compañía del cliente,él código de la orden de compra,la fecha de la orden de compra, 
--código del producto, cantidad pedida del producto,nombre del producto, el nombre de la compañía proveedora y la 
--ciudad del proveedor ,usar Join 
SELECT  C.CompanyName,O.OrderID,Orderdate,            
P.ProductID,Quantity,ProductName,S.CompanyName,S.City            
FROM Customers AS C                  
	INNER JOIN Orders AS O                     
	ON C.CustomerID = O.CustomerID                  
	INNER JOIN [Order Details] AS OD                     
	ON O.OrderID = OD.OrderID                  
	INNER JOIN Products AS P                     
	ON od.ProductID = P.ProductID                  
	INNER JOIN Suppliers AS S            
	ON S.SupplierID = P.SupplierID
	--26. Seleccionar el nombre de la compañía del cliente, nombre del contacto, el código de la orden de compra, 
	--la fecha de la orden de compra, el código del producto,cantidad pedida del producto, nombre del producto y 
	--el nombre de la compañía proveedora, usas JOIN.Solamente las compañías proveedoras que comienzan con la letra 
	--de la A hasta la letra G,además la cantidad pedida del producto debe estar entre 23 y 187.           
	SELECT C.CompanyName,C.ContactName,O.OrderID,          
	OrderDate,P.ProductID,Quantity,ProductName,S.CompanyName         
	FROM Customers AS C       
		INNER JOIN Orders AS O       
		ON C.CustomerID=O.CustomerID       
		INNER JOIN [Order Details] AS OD       
		ON OD.OrderID=O.OrderID       
		INNER JOIN Products AS P       
		ON P.ProductID=OD.ProductID       
		INNER JOIN Suppliers AS S       
		ON S.SupplierID=P.SupplierID  
	WHERE (S.CompanyName like '[A-G]%') AND (Quantity BETWEEN 23 AND 187)

/*
Importante sólo se debe seleccionar las columnas que piden los clientes.
Listar los productos con sus categorías y el nombre de la compañía que los provee y al
precio unitario ponerle como precio.
*/

select ProductID, ProductName, CategoryName,CompanyName,
UnitPrice as precio
from Products P, Categories C, Suppliers S
where P.CategoryID=C.CategoryID And
P.SupplierID=S.SupplierID;/*Listar los productos con sus categorías y el nombre de la compañía y el precio unitario ponerle
como precio anteponiendo el prefijo soles (S/)
*/

Select ProductID, ProductName, CategoryName,CompanyName,
'S/	'+ convert(varchar(8), UnitPrice) as precio
from Products P, Categories C, Suppliers S
where P.CategoryID = C.CategoryID And P.SupplierID = S.SupplierID;