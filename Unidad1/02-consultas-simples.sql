
-- Lenguaje SQL-LMD (insert, update, delete, select - CRUD)
-- Consultas Simples

use Northwind;

-- Mostrar todos los clientes, proveedores, categorias, productos, 
-- ordenes, detalle de la orden, empleados
-- con todas las columnas de datos 
-- de la empresa

Select * from Customers;
select * from Employees;
select * from Orders;
select * from Suppliers;
select * from Products;
select *from Shippers;
select * from categories;
select * from [Order Details]

-- Proyecci�n 
select ProductID, ProductName, UnitPrice, UnitsInStock 
from products;


-- selecionar el numero de empleado, su primer nombre, 
-- su cargo, ciudad y pais.
select EmployeeID, FirstName, Title, city, country 
from Employees; 

-- Alias de columna

-- En base a la consulta anterior, visualizar es employeeid
-- como numero empleado, firstname como primerNombre,
-- Title como cargo, city como ciudad, country con pa�s.

select EmployeeID as 'Numero Empleado', 
FirstName as primernombre, Title 'cargo', City as ciudad, 
Country as pa�s
from Employees;

select EmployeeID as [Numero Empleado], 
FirstName as primernombre, Title 'cargo', City as ciudad, 
Country as pa�s
from Employees;

-- Campos calculados 
-- Seleccionar el importe de cada uno de los productos
-- vendidos en una orden 

select *,(UnitPrice * Quantity) as importe 
from [Order Details];

-- Selecionar las fechas de orden,y a�o, mes y dia, el cliente
-- que las ordeno y el empleado que la realizo

select OrderDate as 'Fecha de Orden',
year(OrderDate) as 'A�o de la orden', 
month(OrderDate) as 'Mes de la Orden', 
day(OrderDate) as 'D�a de la orden',
CustomerID, EmployeeID 
from Orders;

-- Filas Duplicadas (Distinct)

-- Mostrar los paises en donde se tienen clientes, 
-- mostrando pais solamente
select distinct Country From Customers
order by country 

-- Clausula where 
-- Operadores relacionales o test de comparaci�n (<,>,=,<=,>=, != o <>)


-- Seleccionar el cliente BOLID

select CustomerID, CompanyName, city, country
from Customers
where CustomerID = 'BOLID';

-- selecionar los clientes, mostrando su identificdor, 
-- nombre de la empresa, contacto, ciudad y pais, 
-- de alemania

select customerid as Numero, CompanyName as Compa�ia, 
ContactName as [Nombre del Contacto], 
city as ciudad, 
country as pa�s 
from Customers
where country = 'germany'

-- seleccionar todos los clientes que no sean de Alemania
select customerid as Numero, CompanyName as Compa�ia, 
ContactName as [Nombre del Contacto], 
city as ciudad, 
country as pa�s 
from Customers
where country != 'germany'

select customerid as Numero, CompanyName as Compa�ia, 
ContactName as [Nombre del Contacto], 
city as ciudad, 
country as pa�s 
from Customers
where country <> 'germany'

--  seleccionar todos los productos, mostrando su nombre de producto
-- categoria a la que pertenece, existencia, precio, pero solamente
-- donde su precio sea mayor a 100, y mostrar su costo de inventario

select ProductName as [Nombre Producto],
CategoryID as 'Categoria', 
UnitsInStock as 'Existencia', 
UnitPrice as 'Precio', (UnitPrice * UnitsInStock) as [Costo inventario]
from Products
where UnitPrice > 100

-- Seleccionar las ordenes de compra 
-- Mostrando la fecha de orden, la fecha de entrega, la
-- fecha de envio, el cliente a quien se vendio
-- de 1996

select OrderDate as 'Fecha Orden', 
RequiredDate [Fecha de Entrega], 
ShippedDate as 'Fecha de Envio', 
CustomerID as 'Cliente'
from Orders
where year(OrderDate) = '1996'

-- Mostrar todas las ordenes de compra donde la cantidad 
-- de productos comprados sea mayor a 40

select * from [Order Details]
where Quantity >= 40

-- Mostra el nombre completo del empleado, su numero de empleado, 
-- fecha de nacimiento, la ciudad y fecha de conrtrataci�n y esta debe 
-- ser de aquellos que fueron contratados despues de 1993, 
-- Los resultados en sus encabezados deben ser mostrados en espa�ol

select EmployeeID as 'Numero', 
FirstName as 'Primer Nombre', 
LastName as 'Apellido', BirthDate as 'Fecha Nacimiento', 
city as 'Ciudad', HireDate as 'Fecha de Contrataci�n'  
from Employees
where year(HireDate) > 1993


select EmployeeID as 'Numero', 
(FirstName + '  ' + LastName) as 'Nombre Completo' , BirthDate as 'Fecha Nacimiento', 
city as 'Ciudad', HireDate as 'Fecha de Contrataci�n'  
from Employees
where year(HireDate) > 1993


select EmployeeID as 'Numero', 
Concat(FirstName, ' ', LastName, ' - ', Title) as [Nombre Completo]
,BirthDate as 'Fecha Nacimiento', 
city as 'Ciudad', HireDate as 'Fecha de Contrataci�n'  
from Employees
where year(HireDate) > 1993

-- Mostrar los empleados que no son dirigidos por el jefe Fuller Andrew

select EmployeeID as 'Numero', 
Concat(FirstName, ' ', LastName, ' - ', Title) as [Nombre Completo]
,BirthDate as 'Fecha Nacimiento', 
city as 'Ciudad', HireDate as 'Fecha de Contrataci�n', ReportsTo as 'Jefe' 
from Employees
where ReportsTo != 2

-- Seleccionar los empleados que no tengan jefe
select * from Employees
where ReportsTo is null

-- Operadores l�gicos (or, and y not)
-- Seleccionar los productos que tegan un precio de entre 10 y 50

select ProductName as 'Nombre', UnitPrice as 'Precio', 
UnitsInStock as 'Existencia' 
from Products
where UnitPrice>=10 
and UnitPrice<=50;

-- Mostrar todos los pedidos realizados por clientes que NO 
-- son enviados a Alemania

select * from Orders
where ShipCountry <> 'Germany'

 select * from Orders
 where NOT ShipCountry = 'Germany'

 -- seleccionar Clientes de 'Mexico' o 'USA'

 select * from Customers;

 -- Seleccionar Empleados que nacieron entre 1955 y 1958 y 
 -- que viven en Londres

 select * from Employees
 where year(BirthDate)>=1955 and year(BirthDate)<=1958
 and City = 'London' 

 -- Seleccionar los Pedidos con un viaje de peso (Freight) mayor a 100 
 -- y enviados a Francia o Espa�a

 select OrderID,OrderDate,ShipCountry, Freight 
 from Orders
 where Freight>100 and (ShipCountry='France' or ShipCountry='Spain')

 -- Seleccionar ordenes de compra top cinco

 select top 10 * from Orders

 -- Seleccionar los Productos con precio entre $10 y $50, 
 -- que NO est�n descontinuados y 
 -- tengan m�s de 20 unidades en stock
 select ProductName, UnitPrice, UnitsInStock, Discontinued 
 from Products
 where UnitPrice>=10 and UnitPrice<=50
	   and Discontinued = 0 
	   and UnitsInStock>20

 -- Pedidos enviados a Francia o Alemania, 
 -- pero con un flete menor a 50
 select OrderID, ShipCountry, Freight
 from Orders
 where (ShipCountry = 'France' or ShipCountry = 'Germany')
       and Freight < 50


 -- Clientes que NO sean de M�xico o USA y 
 -- que tengan fax registrado

 select companyname, country, City, fax 
 from Customers
 where not (Country='Mexico' or Country='USA')
 and fax is not null

 select companyname, country, City, fax 
 from Customers
 where (Country<>'Mexico' and Country<>'USA')
 and fax is not null

 -- Seleccionar Pedidos con un flete mayor a 100, 
 -- enviados a Brasil o Argentina, 
 -- pero NO enviados por el transportista 1

 select * from Shippers

 -- seleccionar Empleados que NO viven en Londres o Seattle 
 -- y que fueron contratados despu�s de 1992

 select concat(FirstName , ' ' , LastName) as [Nombre Completo], 
        hiredate, city, country
 from Employees
 where NOT( city = 'London' or city = 'Seattle')
       and year(HireDate) >= 1992

 select concat(FirstName , ' ' , LastName) as [Nombre Completo], 
        hiredate, city, country
 from Employees
 where city <> 'London' and city <> 'Seattle'
       and year(HireDate) >= 1992
 
 -- Clausula IN (or)
 -- seleccionar los Productos con categor�a 1, 3 o 5
 select ProductName, CategoryID, UnitPrice
 from Products
 where CategoryID = 1 or CategoryID = 3 or CategoryID = 5

 select ProductName, CategoryID, UnitPrice
 from Products
 where CategoryID in (1,3,5);

 -- seleccionar todas las ordenes de la region RJ, Tachira y que
 -- no tengan region asignada
 select OrderID, OrderDate,shipregion 
 from Orders
 where ShipRegion in ('RJ', 'T�chira') 
 or ShipRegion is null

 select * from [Order Details]

 -- Seleccionar las ordenes que tengan cantidades de 12, 9, o 40
 -- y descuento de 0.15 o 0.05

 select OrderID, Quantity, Discount 
 from [Order Details]
 where Quantity in (12, 9, 40) 
       and Discount in(0.15, 0.05)

-- Clausula Between 


 -- Clausula Between 


 









