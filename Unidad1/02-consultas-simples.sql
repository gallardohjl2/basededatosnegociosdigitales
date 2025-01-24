
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

-- Proyección 
select ProductID, ProductName, UnitPrice, UnitsInStock 
from products;


-- selecionar el numero de empleado, su primer nombre, 
-- su cargo, ciudad y pais.
select EmployeeID, FirstName, Title, city, country 
from Employees; 

-- Alias de columna

-- En base a la consulta anterior, visualizar es employeeid
-- como numero empleado, firstname como primerNombre,
-- Title como cargo, city como ciudad, country con país.

select EmployeeID as 'Numero Empleado', 
FirstName as primernombre, Title 'cargo', City as ciudad, 
Country as país
from Employees;

select EmployeeID as [Numero Empleado], 
FirstName as primernombre, Title 'cargo', City as ciudad, 
Country as país
from Employees;

-- Campos calculados 
-- Seleccionar el importe de cada uno de los productos
-- vendidos en una orden 

select *,(UnitPrice * Quantity) as importe 
from [Order Details];

-- Selecionar las fechas de orden,y año, mes y dia, el cliente
-- que las ordeno y el empleado que la realizo

select OrderDate as 'Fecha de Orden',
year(OrderDate) as 'Año de la orden', 
month(OrderDate) as 'Mes de la Orden', 
day(OrderDate) as 'Día de la orden',
CustomerID, EmployeeID 
from Orders;

-- Clausula where 
-- Operadores relacionales (<,>,=,<=,>=, != o <>)
select * from Customers;

-- Seleccionar el cliente BOLID

select CustomerID, CompanyName, city, country
from Customers
where CustomerID = 'BOLID';

-- selecionar los clientes, mostrando su identificdor, 
-- nombre de la empresa, contacto, ciudad y pais, 
-- de alemania

select customerid as Numero, CompanyName as Compañia, 
ContactName as [Nombre del Contacto], 
city as ciudad, 
country as país 
from Customers
where country = 'germany'

-- seleccionar todos los clientes que no sean de Alemania
select customerid as Numero, CompanyName as Compañia, 
ContactName as [Nombre del Contacto], 
city as ciudad, 
country as país 
from Customers
where country != 'germany'

select customerid as Numero, CompanyName as Compañia, 
ContactName as [Nombre del Contacto], 
city as ciudad, 
country as país 
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










