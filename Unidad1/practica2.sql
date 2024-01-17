--Practica #2

create database Practica2
go
use Practica2
go

create table cliente(
	clienteid int not null,
	nombre varchar(100) not null, 
	direccion varchar(100) not null, 
	tel varchar(20),
	constraint pk_cliente
	primary key(clienteid),
	constraint unico_nombre
	unique(nombre)
)
go

create table empleado(
  empleadoid int not null,
  nombre varchar(100) not null,
  apellidos varchar(100) not null, 
  sexo char(1) not null,
  salario decimal(10,2) not null, 
  constraint pk_empleado
  primary key(empleadoid),
  constraint chk_sexo 
  check(sexo='h' or sexo = 'm'),
  constraint chk_salario
  check(salario>=400 and salario<=40000)
)
go