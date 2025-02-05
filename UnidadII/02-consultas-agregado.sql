-- Consultas de agregado 
-- Nota: solo devuelven un solo registro
-- sum, avg, count, count(*), max y min 

-- cuantos clientes tengo
select count(*) as 'Numero de clientes' 
from Customers

-- cuantas regiones hay
select count(*) 
from Customers
where region is null


select count(distinct region)
from Customers
where region is not null
