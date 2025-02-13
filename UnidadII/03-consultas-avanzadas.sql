
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


select getdate()
