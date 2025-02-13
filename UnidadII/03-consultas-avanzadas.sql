
use Northwind
-- Seleccinar todos las categorias y productos 

select * from 
categories 
inner join 
products 
on categories.categoryid = products.categoryid;


select categories.categoryid, CategoryName, ProductName, 
UnitsInStock, UnitPrice 
from 
categories 
inner join 
products 
on categories.categoryid = products.categoryid;


select c.categoryid as [Número de Categoria], 
CategoryName as 'Nombre Categoria', ProductName as 'Nombre de Producto', 
UnitsInStock as 'Existencia', UnitPrice as Precio
from 
categories as c
inner join 
products as p
on c.categoryid = p.categoryid;


-- Seleccionar los productos de la categorias beverages y condiments donde
-- la existencia este entre 18 y 30 

select * 
from Products as p
join Categories as ca
on p.CategoryID = ca.CategoryID
where (ca.CategoryName = 'beverages' or ca.CategoryName = 'condiments')
and (p.UnitsInStock>=18 and p.UnitsInStock<=30)

select * 
from Products as p
join Categories as ca
on p.CategoryID = ca.CategoryID
where ca.CategoryName in ('beverages', 'condiments')
and p.UnitsInStock between 18 and 30;

-- Seleccionar los productos y sus importes realizados de marzo a junio de
-- de 1996, mostrando la fecha de la orden, el id del producto y el importe

select o.OrderID, o.OrderDate, od.ProductID, 
(od.UnitPrice * od.Quantity) as importe  
from Orders as o
inner join [Order Details] as od 
on od.OrderID = o.OrderID
where o.OrderDate between '1996-07-01' and '1996-10-31'

-- Mostrar el importe total de ventas de la consulta anterior 

select concat('$',' ',sum(od.Quantity * od.UnitPrice)) as importe 
from Orders as o
inner join [Order Details] as od 
on od.OrderID = o.OrderID
where o.OrderDate between '1996-07-01' and '1996-10-31'

-- Consultas Básicas con inner join 

-- 1.  Obtener los nombres de los clientes y los paises a los que se 
-- enviaron sus pedidos

select c.CompanyName as 'Nombre del Cliente', 
o.ShipCountry as 'País de Envio'
from Orders as o
inner join Customers as c
on c.CustomerID = o.CustomerID
order by 2 desc

select c.CompanyName, o.ShipCountry
from Orders as o
inner join Customers as c
on c.CustomerID = o.CustomerID
order by o.ShipCountry desc



-- 2. obtener los productos y sus respectivos proveedores
select p.ProductName as 'Nombre Producto', 
s.CompanyName as [Nombre del Proveedor]
from 
Suppliers as s
inner join 
products as p
on p.SupplierID = s.SupplierID

-- 3. Obtener los pedidos y los empleados que los gestionaron
select o.OrderID, concat (e.Title, ' - ', e.FirstName, '  ', e.LastName) as 'Nombre'
from 
Orders as o
inner join Employees as e
on o.EmployeeID = e.EmployeeID

-- 4. Listar los productos juntos con sus precios y la categoria a la que pertencen
      select p.ProductName as 'Nombre del Producto', 
	  p.UnitPrice as [Precio], c.CategoryName as 'Nombre Categoria'
	  from Categories as c
	  inner join 
	  Products as p
	  on c.CategoryID = p.CategoryID

-- 5. Obtener el nombre del cliente, el numero de orden y la fecha de orden
   Select c.CompanyName as [Cliente], 
   o.OrderID as [Número de Orden], o.OrderDate as [Fecha de Orden]
   from Customers as c
   inner join Orders as o
   on c.CustomerID = o.CustomerID
-- 6. Listar las ordenes mostrando el numero de orden, el nombre del producto y 
 --   la cantidad que se vendio
 select od.OrderID as [Numero de Orden], 
 p.ProductName as [Nombre del Producto], 
 od.Quantity as [Cantidad Vendida]
 from [Order Details] as od
 inner join Products as p
 on od.ProductID = p.ProductID
 order by od.Quantity desc

 select od.OrderID as [Numero de Orden], 
 p.ProductName as [Nombre del Producto], 
 od.Quantity as [Cantidad Vendida]
 from [Order Details] as od
 inner join Products as p
 on od.ProductID = p.ProductID
 where od.OrderID = 11031
 order by od.Quantity desc
 


 select top 5 od.OrderID as [Numero de Orden], 
 p.ProductName as [Nombre del Producto], 
 od.Quantity as [Cantidad Vendida]
 from [Order Details] as od
 inner join Products as p
 on od.ProductID = p.ProductID
 order by od.Quantity desc


 select od.OrderID as [Numero de Orden], 
 count(*) as 'cantidad de Productos vendidos'
 from [Order Details] as od
 inner join Products as p
 on od.ProductID = p.ProductID
 group by od.OrderID
 order by od.OrderID desc

 select * from 
 [Order Details] as od
 where od.OrderID = 11077


 -- 7. obtener los empleados y sus respectivos jefes
 select concat(e1.FirstName, ' ', e1.LastName) as [Empleado], 
 concat(j1.FirstName, ' ', j1.LastName) as [Jefe]
 from Employees as e1
 inner join Employees as j1
 on e1.ReportsTo = j1.EmployeeID

 select FirstName, ReportsTo
 from Employees

 -- 8 Listar los pedidos y el nombre de la empresa de transporte utilizada
 select o.OrderID, s.CompanyName as [Transportista] from
 Orders as o
 inner join 

 Shippers as s
 on o.ShipVia = s.ShipperID

 -- Consultas inner join intermedias

 -- 9. Obtener la cantidad total de productos vendidos por categoria

  select c.CategoryName as 'Nombre Categoria', 
 sum(Quantity) as 'Productos Vendidos'
 from Categories as c
 INNER JOIN Products as p
 on c.CategoryID = p.CategoryID
 INNER JOIN [Order Details] as od
 on od.ProductID = p.ProductID
 group by c.CategoryName
 order by c.CategoryName

 -- 10. Obtener el total de ventas por empleado

 select concat( e.FirstName, ' ', e.LastName) as Nombre ,
 sum((od.Quantity * od.UnitPrice) - 
 (od.Quantity * od.UnitPrice) * od.Discount)  
 as Total
 from Orders as o
 inner join Employees as e
 on o.EmployeeID = e.EmployeeID
 inner join [Order Details] as od
 on od.OrderID = o.OrderID
 group by e.FirstName, e.LastName
 





 select count(*)
 from Orders as o
 where EmployeeID = 1

 select * from 
 Orders as o
 where EmployeeID = 1

 select e.FirstName ,count(o.OrderID)
 from Orders as o
 inner join Employees as e
 on o.EmployeeID = e.EmployeeID
 inner join [Order Details] as od
 on od.OrderID = o.OrderID
 where e.EmployeeID =1
 group by e.FirstName
 


 select *
 from Orders as o
 inner join [Order Details] as od
 on o.OrderID = od.OrderID
 inner join Employees as e
 on e.EmployeeID = o.EmployeeID





 select sum(Quantity) from [Order Details]

