create database AplicadaEjerciciosPropuestos
use AplicadaEjerciciosPropuestos

--2 - Crear una tabla (create table - sp_tables - sp_columns - drop table) (PROBLEMAS)

--Primer Problema 
if object_id('agenda') is not null
  drop table agenda;

create table /agenda(
apellido varchar(30),
nombre varchar(20),
domicilio varchar(30),
telefono varchar(11)
);

create table agenda(
apellido varchar(30),
nombre varchar(20),
domicilio varchar(30),
telefono varchar(11)
);
/*Si intentamos crearla de nuevo nos aparece el siguiente error
"There is already an object named 'agenda' in the database".*/

--Para ver las tablas existentes usamos:
exec sp_tables @table_owner='dbo';

--Para ver la estructura de la tabla usamos:
exec sp_columns agenda;

--Usamos drop table[nombre de la tabla] para borrar la tabla deseada
drop table AplicadaEjerciciosPropuestos

-- para borrar la BD deseada no podemos estar en ella, utilizamos use master, para ir a la BD Principal
use master

--Eliminamos la BD
drop database AplicadaEjerciciosPropuestos;

/*Si intentamos borrarla de nuevo nos aparecera el siguiente error
Cannot drop the database 'AplicadaEjerciciosPropuestos', because it does not exist or you do not have permission.*/

--Segundo Problema

-- 1- Elimine la tabla "libros", si existe
if object_id('libros') is not null
drop table libros;

-- 2- Verifique que la tabla "libros" no existe en la base de datos activa
exec sp_tables @table_owner='dbo';

-- 3- Cree una tabla llamada "libros".
create table libros(
titulo varchar(20),
autor varchar(30),
editorial varchar(15)
);

-- 4- Intente crearla nuevamente. Aparece mensaje de error.

-- 5- Visualice las tablas existentes.
exec sp_tables @table_owner='dbo'

-- 6- Visualice la estructura de la tabla "libros".
exec sp_columns libros;

-- 7- Elimine la tabla.
drop table libros;

-- 8- Intente eliminar la tabla nuevamente.


--3 - Insertar y recuperar registros de una tabla (insert into - select) (PROBLEMAS)

--Primer problema 

--1- Elimine la tabla "agenda", si existe:

if object_id('agenda') is not null
drop table agenda;

-- 2 Cree una tabla llamada "agenda"
create table agenda(
apellido varchar(30),
nombre varchar(20),
domicilio varchar(30),
telefono varchar(11)
);

--3- Visualice las tablas existentes para verificar la creación de "agenda" 
exec sp_tables @table_owner='dbo'

--4- Visualice la estructura de la tabla "agenda"
exec sp_columns agenda

--5- Ingrese los siguientes registros:
insert into agenda(apellido,nombre,domicilio,telefono) values('Moreno','Alberto','Colon123','4234567');
insert into agenda(apellido,nombre,domicilio,telefono) values('Torres','Juan','Avellaneda123','4458787');

-- 6- Seleccione todos los registros de la tabla:
select * from agenda;

--7- Elimine la tabla "agenda":
drop table agenda;

--8- Intente eliminar la tabla nuevamente (aparece un mensaje de error):
 drop table agenda;

-- Segundo problema:
if object_id('libros') is not null
drop table libros;

create table libros(
titulo varchar(20),
autor varchar(30),
editorial varchar(15)
);

exec sp_tables @table_owner='dbo'

exec sp_columns libros

insert into libros(titulo,autor,editorial) values('El aleph', 'Borges', 'Planeta');
insert into libros(titulo,autor,editorial) values('Martin Fierro','Jose Hernandez','Emece');
insert into libros(titulo,autor,editorial) values('Aprenda PHP','Mario Molina','Emece');

select * from libros;

drop table libros;

-- 4 - Tipos de datos básicos (PROBLEMAS)

/*Tipos de campos
1- varchar() que nos permite almacenar cadenas de caracteres
2- integer nos permite almacenar valores de tipo entero
3-float nos peermite almacenar valores numericos con decimales*/

-- 1- Elimine la tabla, si existe:
if object_id('peliculas') is not null
drop table peliculas;

-- 2- Cree la tabla eligiendo el tipo de dato adecuado para cada campo:
create table peliculas(
nombre varchar(20),
actor varchar(20),
duracion integer,
cantidad integer,
);
-- 3- Vea la estructura de la tabla:
exec sp_tables @table_owner='dbo'

exec sp_columns peliculas

--4- Ingrese los siguientes registros:
insert into peliculas(nombre,actor,duracion,cantidad) values('Mision Imposible','Tom Cruise',128,3);
insert into peliculas(nombre,actor,duracion,cantidad) values('Mision Imposible 2','Tom Cruise',130,2);
insert into peliculas(nombre,actor,duracion,cantidad) values('Mujer Bonita','Julia Roberts',118,3);
insert into peliculas(nombre, actor,duracion,cantidad) values('Elsa y Fred','China Zorrilla',110,2);

--5- Muestre todos los registros.
select * from peliculas;

--Segundo problema

if object_id('empleados') is not null
drop table empleados;

create table empleados(
nombre varchar(20),
documento varchar(8),
sexo varchar(1),
domicilio varchar(30),
sueldobasico float
);

exec sp_tables @table_owner='dbo'

exec sp_columns empleados;

insert into empleados(nombre,documento,sexo,domicilio,sueldobasico) values('Juan Perez','223344','m', 'Sarmiento 123',500);
insert into empleados(nombre,documento,sexo,domicilio,sueldobasico) values('Luis Rafael','223384','m', 'Av Caonabo 123',350);
insert into empleados(nombre,documento,sexo,domicilio,sueldobasico) values('Luisanny','22554445','f', 'Av Caonabo 567',400);

select * from empleados;

drop table empleados

--   5 - Recuperar algunos campos (select) (PROBLEMAS)

--Primer problema

-- 1- Elimine la tabla, si existe:
if object_id('peliculas') is not null
drop table peliculas;

-- 2- Cree la tabla eligiendo el tipo de dato adecuado para cada campo:
create table peliculas(
nombre varchar(20),
actor varchar(20),
duracion integer,
cantidad integer,
);
-- 3- Vea la estructura de la tabla:
exec sp_tables @table_owner='dbo'

exec sp_columns peliculas

--4- Ingrese los siguientes registros:
insert into peliculas(nombre,actor,duracion,cantidad) values('Mision Imposible','Tom Cruise',128,3);
insert into peliculas(nombre,actor,duracion,cantidad) values('Mision Imposible 2','Tom Cruise',130,2);
insert into peliculas(nombre,actor,duracion,cantidad) values('Mujer Bonita','Julia Roberts',118,3);
insert into peliculas(nombre, actor,duracion,cantidad) values('Elsa y Fred','China Zorrilla',110,2);

--5- Realice un "select" mostrando solamente el título y actor de todas las películas
select nombre,actor from peliculas;

--6- Muestre el título y duración de todas las peliculas
select nombre,duracion from peliculas;

--7- Muestre el título y la cantidad de copias
select nombre,cantidad from peliculas;

--Segundo problema

if object_id('empleados') is not null
drop table empleados;

create table empleados(
nombre varchar(20),
documento varchar(8),
sexo varchar(1),
domicilio varchar(30),
sueldobasico float
);

exec sp_tables @table_owner='dbo'

exec sp_columns empleados;

insert into empleados(nombre,documento,sexo,domicilio,sueldobasico) values('Juan Perez','223344','m', 'Sarmiento 123',500);
insert into empleados(nombre,documento,sexo,domicilio,sueldobasico) values('Luis Rafael','223384','m', 'Av Caonabo 123',350);
insert into empleados(nombre,documento,sexo,domicilio,sueldobasico) values('Luisanny','22554445','f', 'Av Caonabo 567',400);

select * from empleados;

select nombre,documento,domicilio from empleados;

select documento, sexo, sueldobasico from empleados;

-- 6 -- Recuperar algunos registros (where) (PROBLEMAS)

--Primer problema

-- 1- Elimine "agenda", si existe:

if object_id('agenda') is not null
drop table agenda;

-- 2- Cree la tabla, con los siguientes campos:
create table agenda(
apellido varchar(30),
nombre varchar(20),
domicilio varchar(30),
telefono varchar(11)
);

-- 3- Visualice la estructura de la tabla "agenda".
exec sp_tables @table_owner='dbo';

exec sp_columns agenda;

--4- Ingrese los siguientes registros:
insert into agenda(apellido,nombre,domicilio,telefono) values ('Acosta','Ana','Colon 123','4234567');
insert into agenda(apellido,nombre,domicilio,telefono) values ('Bustamante','Betina','Avellana 135','4458787');
insert into agenda(apellido,nombre,domicilio,telefono) values ('Lopez','Hector','Salta 545','4887768');
insert into agenda(apellido,nombre,domicilio,telefono) values ('Baltodano','Rafael','Av Caonabo 123','20200070');
insert into agenda(apellido,nombre,domicilio,telefono) values ('Lopez','Luisa','Saltar 745','4887768');

--5- Seleccione todos los registros de la tabla
select * from agenda

--6- Seleccione el registro cuyo nombre sea "Luisa" 
select * from agenda
where nombre='Luisa';

-- 7- Seleccione los nombres y domicilios de quienes tengan apellido igual a "Lopez"
select nombre,domicilio from agenda
where apellido='Lopez';

--8- Muestre el nombre de quienes tengan el teléfono "4887768"
select nombre from agenda 
where telefono='4887768';

drop table agenda

--Segundo problema

if object_id('libros') is not null
drop table libros;

create table libros(
titulo varchar(20),
autor varchar(30),
editorial varchar(15)
);

exec sp_tables @table_owner='dbo';

exec sp_columns libros;

insert into libros(titulo,autor,editorial) values('El aleph','Borges','Emece');
insert into libros(titulo,autor,editorial) values('Martin Fierro','Jose Hernandez','Emece');
insert into libros(titulo,autor,editorial) values('Martin Fierro','Jose Hernandez','Planeta');
insert into libros(titulo,autor,editorial) values('Aprenda PHP','Mario Molina','Siglo XXI');

select * from libros
where autor='Borges';

select titulo from libros
where editorial='Emece';

select editorial from libros
where titulo='Martin Fierro';


 -- 7 -	Operadores relacionales  (PROBLEMAS)

 
/* Los operadores relacionales son los siguientes:

=	igual
<>	distinto
>	mayor
<	menor
>=	mayor o igual
<=	menor o igual
*/
-- Primer Problema
 if object_id('articulos') is not null
  drop table articulos;

 create table articulos(
  codigo integer,
  nombre varchar(20),
  descripcion varchar(30),
  precio float,
  cantidad integer
 );

 exec sp_columns articulos;

 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (1,'impresora','Epson Stylus C45',400.80,20);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (2,'impresora','Epson Stylus C85',500,30);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (3,'monitor','Samsung 14',800,10);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (4,'teclado','ingles Biswal',100,50);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (5,'teclado','español Biswal',90,50);

 select * from articulos
  where nombre='impresora';

 select * from articulos
  where precio>=400;

 select codigo,nombre
  from articulos
  where cantidad<30;

 select nombre, descripcion
  from articulos
  where precio<>100;

--Segundo problema


if object_id('peliculas') is not null
  drop table peliculas;

create table peliculas(
titulo varchar(20),
actor varchar(20),
duracion integer,
cantidad integer
 );

insert into peliculas (titulo, actor, duracion, cantidad)
values ('Mision imposible','Tom Cruise',120,3);
insert into peliculas (titulo, actor, duracion, cantidad)
values ('Mision imposible 2','Tom Cruise',180,4);
insert into peliculas (titulo, actor, duracion, cantidad)
values ('Mujer bonita','Julia R.',90,1);
insert into peliculas (titulo, actor, duracion, cantidad)
values ('Elsa y Fred','China Zorrilla',80,2);

select * from peliculas
where duracion<=90;

select * from peliculas
 where actor<>'Tom Cruise';

select titulo,actor,cantidad
from peliculas
where cantidad >2;

-- 8 - Borrar registros (delete) (PROBLEMAS)


-- 1- Elimine la tabla si existe:
if object_id('agenda') is not null
drop table agenda

-- 2- Cree la tabla con los siguientes campos:
create table agenda(
apellido varchar(30),
nombre varchar(20),
domicilio varchar(30),
telefono varchar(11),
);
go

-- 3- Ingrese los siguientes registros (insert into):
insert into agenda(apellido,nombre,domicilio,telefono) values(' Alvarez','Alberto','Colon 123','4234567');
insert into agenda (apellido,nombre,domicilio,telefono) values('Juarez','Juan','Avellaneda 135','4458787');
insert into agenda (apellido,nombre,domicilio,telefono) values('Lopez','Maria','Urquiza 333','4545454');
insert into agenda (apellido,nombre,domicilio,telefono)values('Lopez','Jose','Urquiza 333','4545454');
insert into agenda (apellido,nombre,domicilio,telefono)values('Salas','Susana','Gral. Paz 1234','4123456');

-- 4- Elimine el registro cuyo nombre sea "Juan" (1 registro afectado)
delete from agenda
where nombre <> 'Juan';

-- 5- Elimine los registros cuyo número telefónico sea igual a "4545454" (2 registros afectados):
delete from agenda
where telefono = '4545454'

-- 6- Muestre la tabla.
select * from agenda;

-- 7- Elimine todos los registros (2 registros afectados)
delete from agenda;

-- 8- Muestre la tabla.
select * from agenda;

--Segundo problema

if object_id('articulos') is not null
drop table articulos;

create table articulos(
codigo integer,
nombre varchar(20),
descripcion varchar(30),
precio float,
cantidad integer
);
go

insert into articulos (codigo, nombre, descripcion, precio,cantidad)
values (1,'impresora','Epson Stylus C45',400.80,20);
insert into articulos (codigo, nombre, descripcion, precio,cantidad)
values (2,'impresora','Epson Stylus C85',500,30);
insert into articulos (codigo, nombre, descripcion, precio,cantidad)
values (3,'monitor','Samsung 14',800,10);
insert into articulos (codigo, nombre, descripcion, precio,cantidad)
values (4,'teclado','ingles Biswal',100,50);
insert into articulos (codigo, nombre, descripcion, precio,cantidad)
values (5,'teclado','español Biswal',90,50);

exec sp_tables articulos;

select * from articulos;

delete from articulos
where precio >=500;

select * from articulos;

delete from articulos
where nombre = 'impresora';

select * from articulos

delete from articulos
where codigo <> 4;

select * from articulos;


-- 9 - Actualizar registros (update) (PROBLEMAS)

-- PRIMER PROBLEMA

-- 1- Elimine la tabla si existe
if object_id('agenda') is not null
drop table agenda;

-- 2- Cree la tabla:
create table agenda(
apellido varchar(30),
nombre varchar(20),
domicilio varchar(30),
telefono varchar(11)
);

go

-- 3- Ingrese los siguientes registros (1 registro actualizado)
insert into agenda (apellido,nombre,domicilio,telefono) values ('Acosta','Alberto','Colon 123','4234567');
insert into agenda (apellido,nombre,domicilio,telefono) values ('Juarez','Juan','Avellaneda 135','4458787');
insert into agenda (apellido,nombre,domicilio,telefono) values ('Lopez','Maria','Urquiza 333','4545454');
insert into agenda (apellido,nombre,domicilio,telefono) values ('Lopez','Jose','Urquiza 333','4545454');
insert into agenda (apellido,nombre,domicilio,telefono) values ('Suarez','Susana','Gral. Paz 1234','4123456');


select * from agenda;

-- 4- Modifique el registro cuyo nombre sea "Juan" por "Juan Jose" (1 registro afectado)
update agenda set nombre = 'Juan Jose'
where nombre='Juan';

select * from agenda;

-- 5- Actualice los registros cuyo número telefónico sea igual a "4545454" por "4445566"  (2 registros afectados)
update agenda set telefono ='4445566'
where telefono='4545454';

select * from agenda;

/* 6- Actualice los registros que tengan en el campo "nombre" el valor "Juan" por "Juan Jose" 
(ningún registro afectado porque ninguno cumple con la condición del "where")*/

update agenda set nombre='Juan Jose'
where nombre='Juan';

-- 7 - Luego de cada actualización ejecute un select que muestre todos los registros de la tabla.

select * from agenda;

--SEGUNDO PROBLEMA

if object_id('libros') is not null
drop table libros;

create table libros(
titulo varchar(30),
autor varchar(20),
editorial varchar(15),
precio float
);

insert into libros (titulo, autor, editorial, precio) values ('El aleph','Borges','Emece',25.00);
insert into libros (titulo, autor, editorial, precio) values ('Martin Fierro','Jose Hernandez','Planeta',35.50);
insert into libros (titulo, autor, editorial, precio) values ('Aprenda PHP','Mario Molina','Emece',45.50);
insert into libros (titulo, autor, editorial, precio) values ('Cervantes y el quijote','Borges','Emece',25);
insert into libros (titulo, autor, editorial, precio) values ('Matematica estas ahi','Paenza','Siglo XXI',15);

select * from libros;

update libros set autor = 'Adrian Paenza'
where autor ='Paenza';

select * from libros;

update libros set autor = 'Adrian Paenza'
where autor ='Paenza';

select * from libros;

update libros set precio = 27
where autor ='Mario Molina'

select * from libros;

update libros set editorial = 'Emece S.A'
where editorial = 'Emece'

select * from libros;

-- 10 - Comentarios 

--EJEMPLO

if object_id('libros') is not null
drop table libros;

create table libros(
titulo varchar(30),
autor varchar(20),
editorial varchar(15)
);

go

insert into libros (titulo,autor,editorial) values ('El aleph','Borges','Emece');

select * from libros --mostramos los registros de libros; 

select titulo, autor 
 /*mostramos títulos y
 nombres de los autores*/
 from libros;

-- 11 - Valores null (is null) (Problemas)

-- 1- Elimine la tabla, si existe:

if object_id('medicamentos') is not null
drop table medicamentos;

-- 2- Cree la tabla con la siguiente estructura:
create table medicamentos(
codigo integer not null,
nombre varchar(20) not null,
laboratorio varchar(20),
precio float,
cantidad integer not null
);

-- 3- Visualice la estructura de la tabla "medicamentos":
exec sp_columns medicamentos;

-- 4- Ingrese algunos registros con valores "null" para los campos que lo admitan:
insert into medicamentos(codigo,nombre,laboratorio,precio,cantidad) values(1,'Sertal gotas',null,null,100); 
insert into medicamentos(codigo,nombre,laboratorio,precio,cantidad) values(2,'Sertal compuesto',null,8.90,150);
insert into medicamentos(codigo,nombre,laboratorio,precio,cantidad) values(3,'Buscapina','Roche',null,200);

-- 5- Vea todos los registros:
select * from medicamentos;

-- 6- Ingrese un registro con valor "0" para el precio y cadena vacía para el laboratorio:
insert into medicamentos (codigo,nombre, laboratorio,precio,cantidad) values(4,'Bayaspirina','',0,150);

-- 7- Ingrese un registro con valor "0" para el código y cantidad y cadena vacía para el nombre:
insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad) values(0,'','Bayer',15.60,0);

--8- Muestre todos los registros:
select * from medicamentos;

--9- Intente ingresar un registro con valor nulo para un campo que no lo admite (aparece un mensaje de  error):
insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad) values(null,'Amoxidal jarabe','Bayer',25,120);

/* 10- Recupere los registros que contengan valor "null" en el campo "laboratorio", luego los que 
tengan una cadena vacía en el mismo campo. Note que el resultado es diferente.*/

/* 11- Recupere los registros que contengan valor "null" en el campo "precio", luego los que tengan el 
valor 0 en el mismo campo. Note que el resultado es distinto.*/

/* 12- Recupere los registros cuyo laboratorio no contenga una cadena vacía, luego los que sean 
distintos de "null".
Note que la salida de la primera sentencia no muestra los registros con cadenas vacías y tampoco los 
que tienen valor nulo; el resultado de la segunda sentencia muestra los registros con valor para el 
campo laboratorio (incluso cadena vacía).*/

/* 13- Recupere los registros cuyo precio sea distinto de 0, luego los que sean distintos de "null":
Note que la salida de la primera sentencia no muestra los registros con valor 0 y tampoco los que 
tienen valor nulo; el resultado de la segunda sentencia muestra los registros con valor para el 
campo precio (incluso el valor 0).*/

select * from medicamentos
where laboratorio is null;


select * from medicamentos
where laboratorio='';


select * from medicamentos
where precio is null;

select * from medicamentos
where precio=0;

select * from medicamentos
where laboratorio<>'';

select * from medicamentos
where laboratorio is not null;

select * from medicamentos
where precio<>0;

select * from medicamentos
where precio is not null;

--Segundo Problema

if object_id('peliculas') is not null
drop table peliculas;

create table peliculas(
codigo int not null,
titulo varchar(40) not null,
actor varchar(20),
duracion int
);

exec sp_columns peliculas;

insert into peliculas (codigo,titulo,actor,duracion) values(1,'Mision imposible','Tom Cruise',120);
insert into peliculas (codigo,titulo,actor,duracion) values(2,'Harry Potter y la piedra filosofal',null,180);
insert into peliculas (codigo,titulo,actor,duracion) values(3,'Harry Potter y la camara secreta','Daniel R.',null);
insert into peliculas (codigo,titulo,actor,duracion) values(0,'Mision imposible 2','',150);
insert into peliculas (codigo,titulo,actor,duracion) values(4,'','L. Di Caprio',220);
insert into peliculas (codigo,titulo,actor,duracion) values(5,'Mujer bonita','R. Gere-J. Roberts',0);

select * from peliculas;

insert into peliculas (codigo,titulo,actor,duracion) values(null,'Mujer bonita','R. Gere-J. Roberts',190);

select * from peliculas
where actor is null;

select * from peliculas
where actor = '';

update peliculas set duracion = 120
where duracion is null;

update peliculas set actor = 'Desconocido'
where actor = '';

select * from peliculas;

delete from peliculas
where titulo='';

select * from peliculas;


-- 12 - Clave primaria (Problemas)

--PRIMER PROBLEMA

-- 1- Elimine la tabla si existe:
if object_id('libros') is not null
drop table libros;

-- 2- Créela con los siguientes campos, estableciendo como clave primaria el campo "codigo":
create table libros(
codigo int not null,
titulo varchar(40) not null,
autor varchar(20),
editorial varchar(15),
primary key(codigo)
);

-- 3- Ingrese los siguientes registros:

insert into libros (codigo,titulo,autor,editorial) values (1,'El aleph','Borges','Emece');
insert into libros (codigo,titulo,autor,editorial) values (2,'Martin Fierro','Jose Hernandez','Planeta');
insert into libros (codigo,titulo,autor,editorial) values (3,'Aprenda PHP','Mario Molina','Nuevo Siglo');

-- 4- Ingrese un registro con código repetido (aparece un mensaje de error)
insert into libros(codigo) values (1);

-- 5- Intente ingresar el valor "null" en el campo "codigo"
insert libros(codigo) values(null);

-- 6- Intente actualizar el código del libro "Martin Fierro" a "1" (mensaje de error)
update libros set codigo = 1
where titulo = 'Martin Fierro';

--SEGUNDO PROBLEMA

if object_id('alumnos') is not null
 drop table alumnos;


 /* 2- Cree la tabla con la siguiente estructura intentando establecer 2 campos como clave primaria,
 el campo "documento" y "legajo" (no lo permite):*/

/*create table alumnos(
legajo varchar(4) not null,
documento varchar(8),
nombre varchar(30),
domicilio varchar(30),
primary key(documento),
primary key(legajo)
 );*/


create table alumnos(
legajo varchar(4) not null,
documento varchar(8),
nombre varchar(30),
domicilio varchar(30),
primary key(documento)
);

exec sp_columns alumnos;

insert into alumnos (legajo,documento,nombre,domicilio) values('A233','22345345','Perez Mariana','Colon 234');
insert into alumnos (legajo,documento,nombre,domicilio) values('A567','23545345','Morales Marcos','Avellaneda 348');

insert into alumnos (documento) values('22345345');

insert into alumnos (documento) values(null);


-- 13 - Campo con atributo Identity (Problemas)

-- 1- Elimine la tabla,si existe:
if object_id('medicamentos') is not null
 drop table medicamentos;

 -- 2- Cree la tabla con un campo "codigo" que genere valores secuenciales automáticamente

create table medicamentos(
codigo int identity, --Aumenta de manera secuencial
nombre varchar(20) not null,
laboratorio varchar(20),
precio float,
cantidad integer
);

go

/* Podemos editar campos que contengan identity con ( set identity_insert medicamentos on; ) 
 y desactivar que podamos editar esto con ( set identity_insert medicamentos off; )  */

-- 3- Visualice la estructura de la tabla "medicamentos":
exec sp_columns medicamentos;

-- 4- Ingrese los siguientes registros:
insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Sertal','Roche',5.2,100);
insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Buscapina','Roche',4.10,200); 
insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Amoxidal 500','Bayer',15.60,100);

-- 5- Verifique que SQL Server generó valores para el campo "código" de modo automático:
select * from medicamentos;

-- 6- Intente ingresar un registro con un valor para el campo "codigo"
insert into medicamentos (codigo,nombre, laboratorio,precio,cantidad) values(1,'Buscapina','Roche',4.10,200); 

-- 7- Intente actualizar un valor de código (aparece un mensaje de error)
update medicamentos set codigo = 1
where nombre ='Sertal'

-- 8 - Elimine el registro con codigo "3" (1 registro eliminado)
delete from medicamentos
where codigo = 3;

-- 9 - Ingrese un nuevo registro
insert into medicamentos (nombre, laboratorio,precio,cantidad)values('Amoxilina 500','Bayer',15.60,100);

--  10 - Seleccione todos los registros para ver qué valor guardó SQL Server en el campo código:
select * from medicamentos;

--SEGUNDO PROBLEMA

if object_id('peliculas') is not null
drop table peliculas;

create table peliculas(
codigo int identity,
titulo varchar(40),
actor varchar(20),
duracion int,
primary key(codigo)
);

exec sp_columns peliculas;

insert into peliculas (titulo,actor,duracion) values('Mision imposible','Tom Cruise',120);
insert into peliculas (titulo,actor,duracion) values('Harry Potter y la piedra filosofal','Daniel R.',180);
insert into peliculas (titulo,actor,duracion) values('Harry Potter y la camara secreta','Daniel R.',190);
insert into peliculas (titulo,actor,duracion) values('Mision imposible 2','Tom Cruise',120);
insert into peliculas (titulo,actor,duracion) values('La vida es bella','zzz',220);

select * from peliculas;

update peliculas set codigo=7
where codigo=4;

delete from peliculas
where titulo='La vida es bella';

insert into peliculas (titulo,actor,duracion)
values('Elsa y Fred','China Zorrilla',90);

select * from peliculas;

-- 14 - Otras características del atributo Identity (Problema)

-- Primer Problema

-- 1- Elimine la tabla,si existe:
if object_id('medicamentos') is not null
drop table medicamentos;

/* 2- Cree la tabla con un campo "codigo" que genere valores secuenciales automáticamente comenzando en 
10 e incrementándose en 1:*/

create table medicamentos(
codigo integer identity(10,1),
nombre varchar(20) not null,
laboratorio varchar(20),
precio float,
cantidad integer
);

-- 3- Ingrese los siguientes registros:
insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Sertal','Roche',5.2,100);
insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Buscapina','Roche',4.10,200);
insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Amoxidal 500','Bayer',15.60,100);

-- 4- Verifique que SQL Server generó valores para el campo "código" de modo automático:
select * from medicamentos;

-- 5- Intente ingresar un registro con un valor para el campo "codigo".
insert into medicamentos (codigo,nombre, laboratorio,precio,cantidad) values(4,'Amoxilina 500','Bayer',15.60,100);

-- 6- Setee la opción "identity_insert" en "on"
set identity_insert medicamentos on;

-- 7-Ingrese un nuevo registro sin valor para el campo "codigo" (no lo permite):
insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Amoxilina 500','Bayer',15.60,100);

-- 8- Ingrese un nuevo registro con valor para el campo "codigo" repetido.
insert into medicamentos (codigo,nombre, laboratorio,precio,cantidad) values(10,'Amoxilina 500','Bayer',15.60,100);

-- 9- Use la función "ident_seed()" para averiguar el valor de inicio del campo "identity" de la tabla 
select ident_seed('medicamentos');

/*10- Emplee la función "ident_incr()" para saber cuál es el valor de incremento del campo "identity" 
de "medicamentos"*/

select ident_incr('medicamentos');


--Segundo problema 

if object_id('peliculas') is not null
drop table peliculas;

create table peliculas(
codigo int identity (50,3),
titulo varchar(40),
actor varchar(20),
duracion int
);

insert into peliculas (titulo,actor,duracion) values('Mision imposible','Tom Cruise',120);
 insert into peliculas (titulo,actor,duracion) values('Harry Potter y la piedra filosofal','Daniel R.',180);
 insert into peliculas (titulo,actor,duracion) values('Harry Potter y la camara secreta','Daniel R.',190);

select * from peliculas;

set identity_insert peliculas on;

insert into peliculas (codigo,titulo,actor,duracion) values(20,'Mision imposible 2','Tom Cruise',120);

insert into peliculas (codigo, titulo,actor,duracion) values(80,'La vida es bella','zzz',220);

select ident_seed('peliculas');

select ident_incr('peliculas');

insert into peliculas (titulo,actor,duracion) values('Elsa y Fred','China Zorrilla',90);

set identity_insert peliculas off; 

insert into peliculas (titulo,actor,duracion) values('Elsa y Fred','China Zorrilla',90);
 select * from peliculas;

-- 15 - Truncate table (Problema)

--Primer Problema

-- 1- Elimine la tabla "alumnos" si existe:
if object_id('alumnos') is not null
drop table alumnos;

-- 2- Cree la tabla con la siguiente estructura:
create table alumnos(
legajo int identity, --Saber que para colocar indentity el campo tiene que ser tipo int
documento varchar(8),
nombre varchar(30),
domicilio varchar(30)
);

-- 3- Ingrese los siguientes registros y muéstrelos para ver la secuencia de códigos:
insert into alumnos (documento,nombre,domicilio) values('22345345','Perez Mariana','Colon 234');
insert into alumnos (documento,nombre,domicilio) values('23545345','Morales Marcos','Avellaneda 348');
insert into alumnos (documento,nombre,domicilio) values('24356345','Gonzalez Analia','Caseros 444');
insert into alumnos (documento,nombre,domicilio) values('25666777','Torres Ramiro','Dinamarca 209');

-- 4- Elimine todos los registros con "delete".
delete from alumnos;

-- 5- Ingrese los siguientes registros y selecciónelos para ver cómo SQL Server generó los códigos:
insert into alumnos (documento,nombre,domicilio) values('22345345','Perez Mariana','Colon 234');
insert into alumnos (documento,nombre,domicilio) values('23545345','Morales Marcos','Avellaneda 348');
insert into alumnos (documento,nombre,domicilio) values('24356345','Gonzalez Analia','Caseros 444');
insert into alumnos (documento,nombre,domicilio) values('25666777','Torres Ramiro','Dinamarca 209');

select * from alumnos;

-- 6- Elimine todos los registros con "truncate table".
truncate table alumnos; -- Vacia la tabla

 /* 7- Ingrese los siguientes registros y muestre todos los registros para ver que SQL Server reinició 
la secuencia del campo "identity":*/

insert into alumnos (documento,nombre,domicilio) values('22345345','Perez Mariana','Colon 234');
insert into alumnos (documento,nombre,domicilio) values('23545345','Morales Marcos','Avellaneda 348');
insert into alumnos (documento,nombre,domicilio) values('24356345','Gonzalez Analia','Caseros 444');
insert into alumnos (documento,nombre,domicilio) values('25666777','Torres Ramiro','Dinamarca 209');

select * from alumnos;

-- SEGUNDO PROBLEMA

if object_id('articulos') is not null
drop table articulos;

create table articulos(
codigo integer identity,
nombre varchar(20),
descripcion varchar(30),
precio float
);

insert into articulos (nombre, descripcion, precio) values ('impresora','Epson Stylus C45',400.80);
insert into articulos (nombre, descripcion, precio) values ('impresora','Epson Stylus C85',500);

truncate table articulos;

insert into articulos (nombre, descripcion, precio) values ('monitor','Samsung 14',800);
insert into articulos (nombre, descripcion, precio) values ('teclado','ingles Biswal',100);
insert into articulos (nombre, descripcion, precio) values ('teclado','español Biswal',90);
select * from articulos;

delete from articulos;

insert into articulos (nombre, descripcion, precio) values ('monitor','Samsung 14',800);
insert into articulos (nombre, descripcion, precio) values ('teclado','ingles Biswal',100);
insert into articulos (nombre, descripcion, precio) values ('teclado','español Biswal',90);
select * from articulos;


-- 16 - Otros tipos de datos en SQL Server (Explicacion)

/*TEXTO: Para almacenar texto usamos cadenas de caracteres.
Las cadenas se colocan entre comillas simples. Podemos almacenar letras, símbolos y dígitos con los que no se realizan operaciones matemáticas,
por ejemplo, códigos de identificación, números de documentos, números telefónicos.
SQL Server ofrece los siguientes tipos: char, nchar, varchar, nvarchar, text y ntext.

NUMEROS: Existe variedad de tipos numéricos para representar enteros, decimales, monedas.
Para almacenar valores enteros, por ejemplo, en campos que hacen referencia a cantidades, precios, etc., usamos el tipo integer (y sus subtipos: tinyint, smallint y bigint).
Para almacenar valores con decimales exactos, utilizamos: numeric o decimal (son equivalentes).
Para guardar valores decimales aproximados: float y real. Para almacenar valores monetarios: money y smallmoney.

FECHAS y HORAS: para guardar fechas y horas SQL Server dispone de 2 tipos: datetime y smalldatetime.
Existen otros tipos de datos que analizaremos en secciones próximas.

Entonces, cuando creamos una tabla y definir sus campos debemos elegir el tipo de dato más preciso.
Por ejemplo, si necesitamos almacenar nombres usamos texto; si un campo numérico almacenará solamente
valores enteros el tipo "integer" es más adecuado que, por ejemplo un "float"; si necesitamos almacenar precios, lo más lógico es utilizar el tipo "money".*/

-- 17 - Tipo de dato (texto) (Problemas)

-- 1- Elimine la tabla "autos" si existe:
if object_id('autos') is not null
drop table autos;

/* 2- Cree la tabla eligiendo el tipo de dato adecuado para cada campo, estableciendo el campo 
"patente" como clave primaria:*/

create table autos(
patente char(6),
marca varchar(20),
modelo char(4),
precio float,
primary key (patente)
);

-- 3- Ingrese los siguientes registros:
insert into autos values('ACD123','Fiat 128','1970',15000);
insert into autos values('ACG234','Renault 11','1990',40000);
insert into autos values('BCD333','Peugeot 505','1990',80000);
insert into autos values('GCD123','Renault Clio','1990',70000);
insert into autos values('BCC333','Renault Megane','1998',95000);
insert into autos values('BVF543','Fiat 128','1975',20000);

-- 4- Seleccione todos los autos del año 1990:
select * from autos
where modelo='1990';

--SEGUNDO PROBLEMA

if object_id('clientes') is not null
  drop table clientes;

create table clientes(
documento char(8),
apellido varchar(20),
nombre varchar(20),
domicilio varchar(30),
telefono varchar (11)
);

insert into clientes values('2233344','Perez','Juan','Sarmiento 980','4342345');
insert into clientes (documento,apellido,nombre,domicilio) values('2333344','Perez','Ana','Colon 234');
insert into clientes values('2433344','Garcia','Luis','Avellaneda 1454','4558877');
insert into clientes values('2533344','Juarez','Ana','Urquiza 444','4789900');

 select * from clientes
 where apellido='Perez';

 -- 18 - Tipo de dato (numérico) (Problema)

 -- 1- Elimine la tabla "cuentas" si existe:

if object_id('cuentas') is not null
drop table cuentas;

-- 2- Cree la tabla eligiendo el tipo de dato adecuado para almacenar los datos :
create table cuentas(
numero int not null,
documento char(8),
nombre varchar(30),
saldo money,
primary key (numero)
);

go

-- 3- Ingrese los siguientes registros:
insert into cuentas(numero,documento,nombre,saldo) values('1234','25666777','Pedro Perez',500000.60);
insert into cuentas(numero,documento,nombre,saldo) values('2234','27888999','Juan Lopez',-250000);
insert into cuentas(numero,documento,nombre,saldo) values('3344','27888999','Juan Lopez',4000.50);
insert into cuentas(numero,documento,nombre,saldo) values('3346','32111222','Susana Molina',1000);

-- 4- Seleccione todos los registros cuyo saldo sea mayor a "4000" (2 registros)
select * from cuentas
where saldo<4000;

/* 5- Muestre el número de cuenta y saldo de todas las cuentas cuyo propietario sea "Juan Lopez" (2 
registros)*/
select numero,saldo from cuentas
where nombre='Juan Lopez';

 -- 6- Muestre las cuentas con saldo negativo (1 registro)
select * from cuentas
where saldo<0;

-- 7- Muestre todas las cuentas cuyo número es igual o mayor a "3000" (2 registros):

select * from cuentas
where numero>=3000;

--SEGUNDO PROBLEMA

if object_id('empleados') is not null
drop table empleados;

create table empleados(
nombre varchar(30),
documento char(8),
sexo char(1),
domicilio varchar(30),
sueldobasico decimal(7,2),--máximo estimado 99999.99
cantidadhijos tinyint--no superará los 255
);

go

insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos) values ('Juan Perez','22333444','m','Sarmiento 123',500,2);
insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos) values ('Ana Acosta','24555666','f','Colon 134',850,0);
insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)  values ('Bartolome Barrios','27888999','m','Urquiza 479',10000.80,4);

insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)  values ('Susana Molina','29000555','f','Salta 876',800.888,3);

insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)  values ('Marta Juarez','32444555','f','Sucre 1086',5000000,2);

select * from empleados
where sueldobasico>=900;

select * from empleados
where cantidadhijos>0;

--  19 - Tipo de dato (fecha y hora) (Problemas)

--Primer Problema

-- 1- Elimine la tabla, si existe:
if object_id('alumnos') is not null
  drop table alumnos;

 -- 2- Cree la tabla eligiendo el tipo de dato adecuado para cada campo:
create table alumnos(
apellido varchar(30),
nombre varchar(30),
documento char(8),
domicilio varchar(30),
fechaingreso datetime,
fechanacimiento datetime
);


-- 3- Setee el formato para entrada de datos de tipo fecha para que acepte valores "día-mes-año": 
set dateformat 'dmy';

-- 4- Ingrese un alumno empleando distintos separadores para las fechas:
insert into alumnos(apellido,nombre,documento,domicilio,fechaingreso,fechanacimiento) values('Gonzalez','Ana','22222222','Colon 123','10-08-1990','15/02/1972');

-- 5- Ingrese otro alumno empleando solamente un dígito para día y mes y 2 para el año:
insert into alumnos(apellido,nombre,documento,domicilio,fechaingreso,fechanacimiento)  values('Juarez','Bernardo','25555555','Sucre 456','03-03-1991','15/02/1972');

/* 6- Ingrese un alumnos empleando 2 dígitos para el año de la fecha de ingreso y "null" en 
"fechanacimiento": */

insert into alumnos (apellido,nombre,documento,domicilio,fechaingreso,fechanacimiento)  values('Perez','Laura','26666666','Bulnes 345','03-03-91',null);

/* 7- Intente ingresar un alumno con fecha de ingreso correspondiente a "15 de marzo de 1990" pero en 
orden incorrecto "03-15-90": */
insert into alumnos (apellido,nombre,documento,domicilio,fechaingreso,fechanacimiento)  values('Lopez','Carlos','27777777','Sarmiento 1254','03-15-1990',null);

-- 8- Muestre todos los alumnos que ingresaron antes del '1-1-91'
select * from alumnos where fechaingreso < '1-1-91';

-- 9- Muestre todos los alumnos que tienen "null" en "fechanacimiento":
select * from alumnos where fechanacimiento is null;

-- 10- Intente ingresar una fecha de ingreso omitiendo los separadores:
insert into alumnos (apellido,nombre,documento,domicilio,fechaingreso,fechanacimiento)  values('Rosas','Romina','28888888','Avellaneda 487','03151990',null);

-- 11- Setee el formato de entrada de fechas para que acepte valores "mes-dia-año".
set dateformat 'mdy';

-- 12- Ingrese el registro del punto 7.
insert into alumnos (apellido,nombre,documento,domicilio,fechaingreso,fechanacimiento)  values('Lopez','Carlos','27777777','Sarmiento 1254','03-15-1990',null);

--20 - Ingresar algunos campos (insert into) (PROBLEMA) (Variante)

-- 1- Elimine la tabla "cuentas" si existe:
if object_id('cuentas') is not null
drop table cuentas;

-- 2- Cree la tabla :
create table cuentas(
numero int identity,
documento char(8) not null,
nombre varchar(30),
saldo money
);

go

--NOTA: -- Si ingresamos valores para todos los campos, podemos omitir la lista de campos:


/* 3- Ingrese un registro con valores para todos sus campos, inclusive el campo identity, omitiendo la 
lista de campos (error, no se debe ingresar para el campo identity):*/

insert into cuentas values (1,'25666777','Juan Perez',2500.50);


/*4- Ingrese un registro con valores para todos sus campos omitiendo la lista de campos (excepto el 
campo "identity"):*/
insert into cuentas values ('25666777','Juan Perez',2500.50);

-- 5- Ingrese un registro omitiendo algún campo que admitan valores nulos.
insert into cuentas (documento,saldo) values ('28999777',-5500);

 -- 6- Intente ingresar un registro con valor para el campo "numero" (error):
insert into cuentas (numero,documento,nombre,saldo) values (5,'28999777','Luis Lopez',34000);

-- 7- Intente ingresar un registro listando 3 campos y colocando 4 valores (error)
insert into cuentas (numero,documento,nombre) values (3344,'28999777','Luis Lopez',34000);

-- 8- Intente ingresar un registro sin valor para el campo "documento" (error)
insert into cuentas (nombre, saldo) values ('Luis Lopez',34000);

-- 9- Vea los registros ingresados:
select * from libros;

-- 21 - Valores por defecto (default) (PROBLEMA)

--PRIMER PROBLEMA

--Podemos predeterminar un campo con default

--1- Elimine la tabla "cuentas" si existe
if object_id('cuentas') is not null
drop table cuentas;

-- 2- Cree la tabla:
create table cuentas(
numero int identity,
documento char(8) not null,
nombre varchar(30),
saldo money
);

/*3- Ingrese un registro con valores para todos sus campos, inclusive el campo identity, omitiendo la 
lista de campos (error, no se debe ingresar para el campo identity):*/

insert into cuentas values (1,'25666777','Juan Perez',2500.50);

/* 4- Ingrese un registro con valores para todos sus campos omitiendo la lista de campos (excepto el 
campo "identity"):*/

insert into cuentas values ('25666777','Juan Perez',2500.50);

-- 5- Ingrese un registro omitiendo algún campo que admitan valores nulos.
insert into cuentas (documento,saldo) values ('28999777',-5500);

-- 6- Intente ingresar un registro con valor para el campo "numero" (error):
insert into cuentas (numero,documento,nombre,saldo) values (5,'28999777','Luis Lopez',34000);

-- 7- Intente ingresar un registro listando 3 campos y colocando 4 valores (error)
insert into cuentas (numero,documento,nombre) values (3344,'28999777','Luis Lopez',34000);

-- 8- Intente ingresar un registro sin valor para el campo "documento" (error) 
insert into cuentas (nombre, saldo) values ('Luis Lopez',34000);

-- 9- Vea los registros ingresados:
select * from libros;


-------------- 22 - Columnas calculadas (operadores aritméticos y de concatenación) (PROBLEMA) ----------------------------------

/* Los operadores aritméticos permiten realizar cálculos con valores numéricos.
Son: multiplicación (*), división (/) y módulo (%) (el resto de dividir números enteros), suma (+) y resta (-).*/

/* Los operadores de concatenación: permite concatenar cadenas, el más (+).

Para concatenar el título, el autor y la editorial de cada libro usamos el operador de concatenación ("+"):

select titulo+'-'+autor+'-'+editorial
from libros;*/

--PRIMER PROBLEMA

-- 1- Elimine la tabla si existe:
if object_id ('articulos') is not null
drop table articulos;

-- 2- Cree la tabla:
create table articulos(
codigo int identity,
nombre varchar(20),
descripcion varchar(30),
precio smallmoney,
cantidad tinyint default 0,
primary key (codigo)
);

-- 3- Ingrese algunos registros:
insert into articulos (nombre, descripcion, precio,cantidad) values ('impresora','Epson Stylus C45',400.80,20);
insert into articulos (nombre, descripcion, precio) values ('impresora','Epson Stylus C85',500);
insert into articulos (nombre, descripcion, precio) values ('monitor','Samsung 14',800);
insert into articulos (nombre, descripcion, precio,cantidad) values ('teclado','ingles Biswal',100,50);

/* 4- El comercio quiere aumentar los precios de todos sus artículos en un 15%. Actualice todos los 
precios empleando operadores aritméticos.*/

update articulos set precio=precio+(precio*0.15);

-- 5- Vea el resultado:
select * from articulos;

/*6- Muestre todos los artículos, concatenando el nombre y la descripción de cada uno de ellos 
separados por coma.*/
select nombre+','+descripcion
from articulos;

select * from articulos;

/* 7- Reste a la cantidad de todos los teclados, 
el valor 5, empleando el operador aritmético menos ("-")*/

update articulos set cantidad=cantidad-5
where nombre='teclado';

select * from articulos;

 -- 23 - Alias (PROBLEMA)

-- 1- Elimine la tabla si existe:

if object_id ('libros') is not null
drop table libros;

--2- Cree la tabla:

create table libros(
codigo int identity,
titulo varchar(40) not null,
autor varchar(20) default 'Desconocido',
editorial varchar(20),
precio decimal(6,2),
cantidad tinyint default 0,
primary key (codigo)
);

--3- Ingrese algunos registros:
insert into libros (titulo,autor,editorial,precio) values('El aleph','Borges','Emece',25);
insert into libros values('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100);
insert into libros (titulo,autor,editorial,precio,cantidad) values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,50);

 /* 4- Muestre todos los campos de los libros y un campo extra, con el encabezado "monto total" en la 
que calcule el monto total en dinero de cada libro (precio por cantidad)*/

select titulo, autor,editorial,precio,cantidad,
precio*cantidad as 'monto total'
from libros;

/* 5- Muestre el título, autor y precio de todos los libros de editorial "Emece" y agregue dos columnas 
extra en las cuales muestre el descuento de cada libro, con el encabezado "descuento" y el precio 
con un 10% de descuento con el encabezado "precio final".*/

select titulo,autor,precio,
precio*0.1 as descuento,
precio-(precio*0.1) as 'precio final'
from libros
where editorial='Emece';

-- 6- Muestre una columna con el título y el autor concatenados con el encabezado "Título y autor"
select titulo+'-'+autor as "Título y autor"
from libros;

--------------------------------- 24 - Funciones (TEORIA) -------------------------------------------------

/* Una función es un conjunto de sentencias que operan como una unidad lógica.

Una función tiene un nombre, retorna un parámetro de salida y opcionalmente acepta parámetros de entrada.
Las funciones de SQL Server no pueden ser modificadas,
las funciones definidas por el usuario si.*/

/* 1) de agregado: realizan operaciones que combinan varios valores y retornan un único valor. Son "count", "sum", "min" y "max".

2) escalares: toman un solo valor y retornan un único valor. 
Pueden agruparse de la siguiente manera:*/

------------------------------ 25 - Funciones para el manejo de cadenas (TEORIA Y EJEMPLO)------------------------------------
/*

Microsoft SQL Server tiene algunas funciones para trabajar con cadenas de caracteres. Estas son algunas:

- substring(cadena,inicio,longitud): devuelve una parte de la cadena especificada como primer argumento, 
empezando desde la posición especificada por el segundo argumento
y de tantos caracteres de longitud como indica el tercer argumento. Ejemplo:

 select substring('Buenas tardes',8,6);
retorna "tardes".

- str(numero,longitud,cantidaddecimales): convierte números a caracteres;
el primer parámetro indica el valor numérico a convertir, el segundo la longitud del resultado 
(debe ser mayor o igual a la parte entera del número más el signo si lo tuviese) y el tercero,
la cantidad de decimales. El segundo y tercer argumento son opcionales y deben ser positivos.
String significa cadena en inglés.

Ejemplo: se convierte el valor numérico "123.456" a cadena, especificando 7 de longitud y 3 decimales:

 select str(123.456,7,3);

 select str(-123.456,7,3);
retorna '-123.46';*/

if object_id ('libros') is not null
drop table libros;

create table libros(
codigo int identity,
titulo varchar(40) not null,
autor varchar(20) default 'Desconocido',
editorial varchar(20),
precio decimal(6,2),
cantidad tinyint default 0,
primary key (codigo)
 );

insert into libros (titulo,autor,editorial,precio) values('El aleph','Borges','Emece',25);
insert into libros values('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100);
insert into libros (titulo,autor,editorial,precio,cantidad) values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,50);

select substring(titulo,1,12) as titulo
from libros;

select left(titulo,12) as titulo
from libros;

select titulo,
str(precio,6,1)
from libros;

select titulo,
str(precio)
from libros;

select titulo, autor, upper(editorial)
 from libros;

 -- 26 - Funciones matemáticas (TEORIA Y EJEMPLO) ---------------

/* -abs(x): retorna el valor absoluto del argumento "x". Ejemplo:

select abs(-20);
retorna 20.

-ceiling(x): redondea hacia arriba el argumento "x". Ejemplo:

 select ceiling(12.34);
retorna 13.

-floor(x): redondea hacia abajo el argumento "x". Ejemplo:

 select floor(12.34);
retorna 12.

- %: %: devuelve el resto de una división. Ejemplos:

 select 10%3;
retorna 1.

 select 10%2;
retorna 0.

-power(x,y): retorna el valor de "x" elevado a la "y" potencia. Ejemplo:

 select power(2,3);
retorna 8.

-round(numero,longitud): retorna un número redondeado a la longitud especificada. "longitud" debe ser tinyint, smallint o int. Si "longitud" es positivo, el número de decimales es redondeado según "longitud"; si es negativo, el número es redondeado desde la parte entera según el valor de "longitud". Ejemplos:

 select round(123.456,1);
retorna "123.400", es decir, redondea desde el primer decimal.

-sign(x): si el argumento es un valor positivo devuelve 1;-1 si es negativo y si es 0, 0.

-square(x): retorna el cuadrado del argumento. Ejemplo:

select square(3); retorna 9.
-srqt(x): devuelve la raiz cuadrada del valor enviado como argumento.*/

--EJEMPLO 
  
if object_id ('libros') is not null
drop table libros;

create table libros(
codigo int identity,
titulo varchar(40) not null,
autor varchar(20) default 'Desconocido',
editorial varchar(20),
precio decimal(6,2),
primary key (codigo)
);

go

insert into libros (titulo,autor,editorial,precio) values('El aleph','Borges','Emece',25.33);
insert into libros values('Java en 10 minutos','Mario Molina','Siglo XXI',50.65);
insert into libros (titulo,autor,editorial,precio)  values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',19.95);

-- Vamos a mostrar los precios de los libros redondeando el valor hacia abajo y hacia arriba:
select titulo,autor,precio,
floor(precio) as abajo,
ceiling(precio) as arriba
from libros;

-----------  27 - Funciones para el uso de fechas y horas (PROBLEMA) ---------------

-- 1- Elimine la tabla si existe:
if object_id ('empleados') is not null
drop table empleados;

-- 2- Cree la tabla:
create table empleados(
nombre varchar(30) not null,
apellido varchar(20) not null,
documento char(8),
fechanacimiento datetime,
fechaingreso datetime,
sueldo decimal(6,2),
primary key(documento)
);

-- 3- Ingrese algunos registros:
insert into empleados values('Ana','Acosta','22222222','1970/10/10','1995/05/05',228.50);
insert into empleados values('Carlos','Caseres','25555555','1978/02/06','1998/05/05',309);
insert into empleados values('Francisco','Garcia','26666666','1978/10/15','1998/10/02',250.68);
insert into empleados values('Gabriela','Garcia','30000000','1985/10/25','2000/12/22',300.25);
insert into empleados values('Luis','Lopez','31111111','1987/02/10','2000/08/21',350.98);

/*4- Muestre nombre y apellido concatenados, con el apellido en letras mayúsculas, el documento 
precedido por "DNI Nº " y el sueldo precedido por "$ ".*/

select nombre+space(1)+upper(apellido) as nombre,
stuff(documento,1,0,'DNI Nº ') as documento,
stuff(sueldo,1,0,'$ ') as sueldo from empleados;

-- 5- Muestre el documento y el sueldo redondeado hacia arriba y precedido por "$ ".
select documento, stuff(ceiling(sueldo),1,0,'$ ') from empleados;

/* 6- Muestre los nombres y apellidos de los empleados que cumplen años en el mes "october" (3 
registros)*/

select nombre,apellido from empleados
where datename(month,fechanacimiento)='october';

/* 7- Muestre los nombres y apellidos de los empleados que ingresaron en un determinado año (2 
registros).*/

select nombre,apellido from empleados
where datepart(year,fechaingreso)=2000;



-------------- 28 - Ordenar registros (order by) (PROBLEMA) ---------------------

-- 1- Elimine la tabla "visitas", si existe:
if object_id('visitas') is not null
drop table visitas;

-- 2- Créela con la siguiente estructura:
create table visitas (
numero int identity,
nombre varchar(30) default 'Anonimo',
mail varchar(50),
pais varchar (20),
fecha datetime,
primary key(numero)
);

-- 3- Ingrese algunos registros:
insert into visitas (nombre,mail,pais,fecha) values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10');
insert into visitas (nombre,mail,pais,fecha) values ('Gustavo Gonzalez','GustavoGGonzalez@hotmail.com','Chile','2006-10-10 21:30');
insert into visitas (nombre,mail,pais,fecha) values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45');
insert into visitas (nombre,mail,pais,fecha) values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-10-12 08:15');
insert into visitas (nombre,mail,pais,fecha) values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-09-12 20:45');
insert into visitas (nombre,mail,pais,fecha) values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-12 16:20');
insert into visitas (nombre,mail,pais,fecha) values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-15 16:25');

-- 4- Ordene los registros por fecha, en orden descendente.
select * from visitas
order by fecha desc;

/* 5- Muestre el nombre del usuario, pais y el nombre del mes, ordenado por pais (ascendente) y nombre 
del mes (descendente) */
select nombre,pais,datename(month,fecha)
from visitas
order by pais,datename(month,fecha) desc;

/* 6- Muestre el pais, el mes, el día y la hora y ordene las visitas por nombre del mes, del día y la 
hora.*/

select nombre,mail,
datename(month,fecha) mes,
datename(day,fecha) dia,
datename(hour,fecha) hora
from visitas
order by 3,4,5;

/* 7- Muestre los mail, país, ordenado por país, de todos los que visitaron la página en octubre (4 
registros)*/

select mail, pais
from visitas
where datename(month,fecha)='October'
order by 2;

------------- 29 - Operadores lógicos ( and - or - not) -----------------------

-- 1- Elimine la tabla, si existe:
if object_id('medicamentos') is not null
 drop table medicamentos;

-- 2- Cree la tabla con la siguiente estructura
create table medicamentos(
codigo int identity,
nombre varchar(20),
laboratorio varchar(20),
precio decimal(5,2),
cantidad tinyint,
primary key(codigo)
);

-- 3- Ingrese algunos registros:
insert into medicamentos values('Sertal','Roche',5.2,100);
insert into medicamentos values('Buscapina','Roche',4.10,200);
insert into medicamentos values('Amoxidal 500','Bayer',15.60,100);
insert into medicamentos values('Paracetamol 500','Bago',1.90,200);
insert into medicamentos values('Bayaspirina','Bayer',2.10,150); 
insert into medicamentos values('Amoxidal jarabe','Bayer',5.10,250); 

/* 4- Recupere los códigos y nombres de los medicamentos cuyo laboratorio sea 'Roche' y cuyo precio sea 
menor a 5 (1 registro cumple con ambas condiciones)*/

select codigo,nombre
from medicamentos
where laboratorio='Roche' and precio<5;

-- 5- Recupere los medicamentos cuyo laboratorio sea 'Roche' o cuyo precio sea menor a 5 (4 registros):
select * from medicamentos
where laboratorio='Roche' or precio<5;

-- 6- Muestre todos los medicamentos cuyo laboratorio NO sea "Bayer" y cuya cantidad sea=100 (1 registro)
select * from medicamentos
where not laboratorio='Bayer' and cantidad=100;

-- 7- Muestre todos los medicamentos cuyo laboratorio sea "Bayer" y cuya cantidad NO sea=100 (2 registros):
select * from medicamentos
where laboratorio='Bayer' and not cantidad=100;

/* 8- Elimine todos los registros cuyo laboratorio sea igual a "Bayer" y su precio sea mayor a 10 (1 
registro eliminado)*/
delete from medicamentos
where laboratorio='Bayer' and precio>10;

/* 9- Cambie la cantidad por 200, a todos los medicamentos de "Roche" cuyo precio sea mayor a 5 (1 
registro afectado)*/

update medicamentos set cantidad=200
where laboratorio='Roche' and precio>5;

/* 10- Borre los medicamentos cuyo laboratorio sea "Bayer" o cuyo precio sea menor a 3 (3 registros 
borrados)*/

delete from medicamentos
where laboratorio='Bayer' or precio<3;


--------------------30 - Otros operadores relacionales (is null) ------------------------
--Primer Problema

--1- Elimine la tabla, si existe;
if object_id('peliculas') is not null
drop table peliculas;

-- 2- Créela con la siguiente estructura:
create table peliculas(
codigo int identity,
titulo varchar(40) not null,
actor varchar(20),
duracion tinyint,
primary key (codigo)
);

-- 3- Ingrese algunos registros:
insert into peliculas values('Mision imposible','Tom Cruise',120);
insert into peliculas values('Harry Potter y la piedra filosofal','Daniel R.',null);
insert into peliculas values('Harry Potter y la camara secreta','Daniel R.',190);
insert into peliculas values('Mision imposible 2','Tom Cruise',120);
insert into peliculas values('Mujer bonita',null,120);
insert into peliculas values('Tootsie','D. Hoffman',90);
insert into peliculas (titulo) values('Un oso rojo');

-- 4- Recupere las películas cuyo actor sea nulo (2 registros)
select * from peliculas
where actor is null;

select * from peliculas;

-- 5- Cambie la duración a 0, de las películas que tengan duración igual a "null" (2 registros)
update peliculas set duracion=0
where duracion is null;

select * from peliculas;

-- 6- Borre todas las películas donde el actor sea "null" y cuya duración sea 0 (1 registro)
delete from peliculas
where actor is null and duracion=0;

select * from peliculas;


-------------- 31 - Otros operadores relacionales (between) (PROBLEMAS)-----------------------

-- 1- Elimine la tabla "visitas", si existe:
if object_id('visitas') is not null
drop table visitas;

--2- Créela con la siguiente estructura:
create table visitas (
numero int identity,
nombre varchar(30) default 'Anonimo',
mail varchar(50),
pais varchar (20),
fechayhora datetime,
primary key(numero)
);

-- 3- Ingrese algunos registros:
insert into visitas (nombre,mail,pais,fechayhora) values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10');
insert into visitas (nombre,mail,pais,fechayhora) values ('Gustavo Gonzalez','GustavoGGonzalez@gotmail.com','Chile','2006-10-10 21:30');
insert into visitas (nombre,mail,pais,fechayhora) values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45');
insert into visitas (nombre,mail,pais,fechayhora) values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-10-12 08:15');
insert into visitas (nombre,mail,pais,fechayhora) values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-09-12 20:45');
insert into visitas (nombre,mail,pais,fechayhora) values ('Juancito','JuanJosePerez@gmail.com','Argentina','2006-09-12 16:20');
insert into visitas (nombre,mail,pais,fechayhora) values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-15 16:25');
insert into visitas (nombre,mail,pais) values ('Federico1','federicogarcia@xaxamail.com','Argentina');

/* 4- Seleccione los usuarios que visitaron la página entre el '2006-09-12' y '2006-10-11' (5 
registros)*/

select * from visitas
where fechayhora between '2006-09-12' and '2006-10-11';

/* 5- Recupere las visitas cuyo número se encuentra entre 2 y 5 (4 registros)
Note que incluye los valores límites. */

select * from visitas
where numero between 2 and 5;

----- SEGUNDO PROBLEMA-----

if object_id('autos') is not null
drop table autos;

create table autos(
patente char(6),
marca varchar(20),
modelo char(4),
precio decimal(8,2),
primary key(patente)
);

insert into autos values('ACD123','Fiat 128','1970',15000);
insert into autos values('ACG234','Renault 11','1980',40000);
insert into autos values('BCD333','Peugeot 505','1990',80000);
insert into autos values('GCD123','Renault Clio','1995',70000);
insert into autos values('BCC333','Renault Megane','1998',95000);
insert into autos values('BVF543','Fiat 128','1975',20000);

select * from autos
where modelo between '1970' and '1990'
order by modelo;

select * from autos
where precio between 50000 and 100000; 

----------------32 - Otros operadores relacionales (in)-------------------------
-- PRIMER PROBLEMA

--1- Elimine la tabla, si existe:
if object_id('medicamentos') is not null
drop table medicamentos;

--2- Cree la tabla con la siguiente estructura:
create table medicamentos(
codigo int identity,
nombre varchar(20),
laboratorio varchar(20),
precio decimal(6,2),
cantidad tinyint,
fechavencimiento datetime not null,
primary key(codigo)
);

go;

-- 3- Ingrese algunos registros:
insert into medicamentos values('Sertal','Roche',5.2,1,'2015-02-01');
insert into medicamentos values('Buscapina','Roche',4.10,3,'2016-03-01');
insert into medicamentos values('Amoxidal 500','Bayer',15.60,100,'2017-05-01');
insert into medicamentos values('Paracetamol 500','Bago',1.90,20,'2018-02-01');
insert into medicamentos values('Bayaspirina','Bayer',2.10,150,'2019-12-01'); 
insert into medicamentos  values('Amoxidal jarabe','Bayer',5.10,250,'2020-10-01'); 

/* 4- Recupere los nombres y precios de los medicamentos cuyo laboratorio sea "Bayer" o "Bago" 
empleando el operador "in" (4 registros)*/

select nombre,precio from medicamentos
where laboratorio in ('Bayer','Bago');

/* 5- Seleccione los remedios cuya cantidad se encuentre entre 1 y 5 empleando el operador "between" y 
luego el operador "in" (2 registros):*/
select * from medicamentos
where cantidad between 1 and 5;

select * from medicamentos
where cantidad in (1,2,3,4,5); -- en este caso, el operador ""between".


-------------- 33 - Búsqueda de patrones (like - not like) -----------------

--PRIMER PROBLEMA

-- 1- Elimine la tabla, si existe:
if object_id('empleados') is not null
drop table empleados;

-- 2- Cree la tabla:
create table empleados(
nombre varchar(30),
documento char(8),
domicilio varchar(30),
fechaingreso datetime,
seccion varchar(20),
sueldo decimal(6,2),
primary key(documento)
);

-- 3- Ingrese algunos registros:
insert into empleados values('Juan Perez','22333444','Colon 123','1990-10-08','Gerencia',900.50);
insert into empleados values('Ana Acosta','23444555','Caseros 987','1995-12-18','Secretaria',590.30);
insert into empleados values('Lucas Duarte','25666777','Sucre 235','2005-05-15','Sistemas',790);
insert into empleados values('Pamela Gonzalez','26777888','Sarmiento 873','1999-02-12','Secretaria',550);
insert into empleados values('Marcos Juarez','30000111','Rivadavia 801','2002-09-22','Contaduria',630.70);
insert into empleados values('Yolanda Perez','35111222','Colon 180','1990-10-08','Administracion',400);
insert into empleados values('Rodolfo Perez','35555888','Coronel Olmedo 588','1990-05-28','Sistemas',800);

-- 4- Muestre todos los empleados con apellido "Perez" empleando el operador "like" (3 registros)
select * from empleados
where nombre like '%Perez%';

-- 5- Muestre todos los empleados cuyo domicilio comience con "Co" y tengan un "8" (2 registros)
select * from empleados
where domicilio like 'Co%8%';

-- 6- Seleccione todos los empleados cuyo documento finalice en 0,2,4,6 u 8 (4 registros)
select * from empleados
where documento like '%[02468]';

/* 7- Seleccione todos los empleados cuyo documento NO comience con 1 ni 3 y cuyo nombre finalice en 
"ez" (2 registros)*/
select * from empleados
where documento like '[^13]%' and nombre like '%ez';

-- 8- Recupere todos los nombres que tengan una "y" o una "j" en su nombre o apellido (3 registros)
select nombre from empleados
where nombre like '%[yj]%';

/* 9- Muestre los nombres y sección de los empleados que pertenecen a secciones que comiencen con "S" o 
"G" y tengan 8 caracteres (3 registros)*/
select nombre,seccion from empleados
where seccion like '[SG]';

/* 10- Muestre los nombres y sección de los empleados que pertenecen a secciones que NO comiencen con 
"S" o "G" (2 registros)*/
select nombre,seccion from empleados
where seccion not like '[SG]%';

/* 11- Muestre todos los nombres y sueldos de los empleados cuyos sueldos incluyen centavos (3 
registros)*/
select nombre,sueldo from empleados
where sueldo not like '%.00';

-- 12- Muestre los empleados que hayan ingresado en "1990" (3 registros)
select * from empleados
where fechaingreso like '%1990%';

---------------- 35 - Contar registros (count_big)------------------------
--PRIMER PROBLEMA

--1- Elimine la tabla, si existe:
if object_id('medicamentos') is not null
drop table medicamentos;

-- 2- Cree la tabla con la siguiente estructura:

create table medicamentos(
codigo int identity,
nombre varchar(20),
laboratorio varchar(20),
precio decimal(6,2),
cantidad tinyint,
fechavencimiento datetime not null,
numerolote int default null,
primary key(codigo)
);

--3- Ingrese algunos registros:
insert into medicamentos values('Sertal','Roche',5.2,1,'2015-02-01',null);
insert into medicamentos values('Buscapina','Roche',4.10,3,'2016-03-01',null);
insert into medicamentos values('Amoxidal 500','Bayer',15.60,100,'2017-05-01',null);
insert into medicamentos values('Paracetamol 500','Bago',1.90,20,'2018-02-01',null);
insert into medicamentos values('Bayaspirina',null,2.10,null,'2019-12-01',null); 
insert into medicamentos values('Amoxidal jarabe','Bayer',null,250,'2019-12-15',null); 

-- 4- Muestre la cantidad de registros empleando la función "count_big(*)" (6 registros)
select count_big(*)
from medicamentos;

-- 5- Cuente la cantidad de laboratorios distintos (3 registros)
select count_big(distinct laboratorio)
from medicamentos;

-- 6- Cuente la cantidad de medicamentos que tienen precio y cantidad distinto de "null" (5 y 5)
select count_big(precio) as 'Con precio',
count_big(cantidad) as 'Con cantidad' 
from medicamentos;

-- 36 - Funciones de agrupamiento (count - sum - min - max - avg)

--PRIMER PROBLEMA

-- 1- Elimine la tabla, si existe:
if object_id('empleados') is not null
drop table empleados;

-- 2- Cree la tabla:
create table empleados(
nombre varchar(30),
documento char(8),
domicilio varchar(30),
seccion varchar(20),
sueldo decimal(6,2),
cantidadhijos tinyint,
primary key(documento)
);

-- 3- Ingrese algunos registros:
insert into empleados values('Juan Perez','22333444','Colon 123','Gerencia',5000,2);
insert into empleados values('Ana Acosta','23444555','Caseros 987','Secretaria',2000,0);
insert into empleados values('Lucas Duarte','25666777','Sucre 235','Sistemas',4000,1);
insert into empleados values('Pamela Gonzalez','26777888','Sarmiento 873','Secretaria',2200,3);
insert into empleados values('Marcos Juarez','30000111','Rivadavia 801','Contaduria',3000,0);
insert into empleados values('Yolanda Perez','35111222','Colon 180','Administracion',3200,1);
insert into empleados values('Rodolfo Perez','35555888','Coronel Olmedo 588','Sistemas',4000,3);
insert into empleados values('Martina Rodriguez','30141414','Sarmiento 1234','Administracion',3800,4);
insert into empleados values('Andres Costa','28444555',default,'Secretaria',null,null);

-- 4- Muestre la cantidad de empleados usando "count" (9 empleados)
select count(*)
from empleados;

-- 5- Muestre la cantidad de empleados con sueldo no nulo de la sección "Secretaria" (2 empleados)
select count(sueldo)
from empleados
where seccion='Secretaria';

-- 6- Muestre el sueldo más alto y el más bajo colocando un alias (5000 y 2000)
select max(sueldo) as 'Mayor sueldo',
min(sueldo) as 'Menor sueldo'
from empleados;

-- 7- Muestre el valor mayor de "cantidadhijos" de los empleados "Perez" (3 hijos)
select max(cantidadhijos)
from empleados
where nombre like '%Perez%';

/* 8- Muestre el promedio de sueldos de todo los empleados (3400. Note que hay un sueldo nulo y no es 
tenido en cuenta)*/

select avg(sueldo)
from empleados;

-- 9- Muestre el promedio de sueldos de los empleados de la sección "Secretaría" (2100)
select avg(sueldo)
from empleados
where seccion='Secretaria';

-- 10- Muestre el promedio de hijos de todos los empleados de "Sistemas" (2)
select avg(cantidadhijos)
from empleados
where seccion='Sistemas';

------------------------37 - Agrupar registros (group by)-------------------------
--PRIMER PROBLEMA

--1- Elimine la tabla "visitantes", si existe:
if object_id('visitantes') is not null
drop table visitantes;

-- 2- Cree la tabla con la siguiente estructura:
create table visitantes(
nombre varchar(30),
edad tinyint,
sexo char(1) default 'f',
domicilio varchar(30),
ciudad varchar(20) default 'Cordoba',
telefono varchar(11),
mail varchar(30) default 'no tiene',
montocompra decimal (6,2)
);

go;

-- 3- Ingrese algunos registros:
insert into visitantes values ('Susana Molina',35,default,'Colon 123',default,null,null,59.80);
insert into visitantes values ('Marcos Torres',29,'m',default,'Carlos Paz',default,'marcostorres@hotmail.com',150.50);
insert into visitantes values ('Mariana Juarez',45,default,default,'Carlos Paz',null,default,23.90);
insert into visitantes (nombre, edad,sexo,telefono, mail) values ('Fabian Perez',36,'m','4556677','fabianperez@xaxamail.com');
insert into visitantes (nombre, ciudad, montocompra) values ('Alejandra Gonzalez','La Falda',280.50);
insert into visitantes (nombre, edad,sexo, ciudad, mail,montocompra) values ('Gaston Perez',29,'m','Carlos Paz','gastonperez1@gmail.com',95.40);
insert into visitantes values ('Liliana Torres',40,default,'Sarmiento 876',default,default,default,85);
insert into visitantes values ('Gabriela Duarte',21,null,null,'Rio Tercero',default,'gabrielaltorres@hotmail.com',321.50);

-- 4- Queremos saber la cantidad de visitantes de cada ciudad utilizando la cláusula "group by" (4 filas devueltas)
select ciudad, count(*)
from visitantes
group by ciudad;

-- 5- Queremos la cantidad visitantes con teléfono no nulo, de cada ciudad (4 filas devueltas)
select ciudad, count(telefono)
from visitantes
group by ciudad;

-- 6- Necesitamos el total del monto de las compras agrupadas por sexo (3 filas)
select sexo, sum(montocompra)
from visitantes
group by sexo;

--7- Se necesita saber el máximo y mínimo valor de compra agrupados por sexo y ciudad (6 filas)
select sexo,ciudad,
max(montocompra) as mayor,
min(montocompra) as menor
from visitantes
group by sexo,ciudad;

--8- Calcule el promedio del valor de compra agrupados por ciudad (4 filas)
select ciudad,
avg(montocompra) as 'promedio de compras'
from visitantes
group by ciudad;

-- 9- Cuente y agrupe por ciudad sin tener en cuenta los visitantes que no tienen mail (3 filas):
select ciudad,
count(*) as 'cantidad con mail'
from visitantes
where mail is not null and mail<>'no tiene'
group by ciudad;

/* 10- Realice la misma consulta anterior, pero use la palabra clave "all" para mostrar todos los 
valores de ciudad, incluyendo las que devuelven cero o "null" en la columna de agregado (4 filas)*/
select ciudad,
count(*) as 'cantidad con mail'
from visitantes
where mail is not null and mail<>'no tiene'
group by all ciudad;

----------SEGUNDO PROBLEMA----------

if object_id('empleados') is not null
drop table empleados;

create table empleados(
nombre varchar(30),
documento char(8),
domicilio varchar(30),
seccion varchar(20),
sueldo decimal(6,2),
cantidadhijos tinyint,
fechaingreso datetime,
primary key(documento)
);

insert into empleados values('Juan Perez','22333444','Colon 123','Gerencia',5000,2,'1980-05-10');
insert into empleados values('Ana Acosta','23444555','Caseros 987','Secretaria',2000,0,'1980-10-12');
insert into empleados values('Lucas Duarte','25666777','Sucre 235','Sistemas',4000,1,'1985-05-25');
insert into empleados values('Pamela Gonzalez','26777888','Sarmiento 873','Secretaria',2200,3,'1990-06-25');
insert into empleados values('Marcos Juarez','30000111','Rivadavia 801','Contaduria',3000,0,'1996-05-01');
insert into empleados values('Yolanda Perez','35111222','Colon 180','Administracion',3200,1,'1996-05-01');
insert into empleados values('Rodolfo Perez','35555888','Coronel Olmedo 588','Sistemas',4000,3,'1996-05-01');
insert into empleados values('Martina Rodriguez','30141414','Sarmiento 1234','Administracion',3800,4,'2000-09-01');
insert into empleados values('Andres Costa','28444555',default,'Secretaria',null,null,null);

select seccion, count(*)
from empleados
group by seccion;

select seccion, avg(cantidadhijos) as 'promedio de hijos'
from empleados
 group by seccion;

select datepart(year,fechaingreso), count(*)
from empleados
group by datepart(year,fechaingreso);

select seccion, avg(sueldo) as 'promedio de sueldo'
from empleados
where cantidadhijos>0 and cantidadhijos is not null
group by seccion;

select seccion, avg(sueldo) as 'promedio de sueldo'
from empleados
where cantidadhijos>0 and cantidadhijos is not null
group by all seccion;

----------------38 - Seleccionar grupos (having)-------------------

--PRIMER PROBLEMA

--1- Elimine la tabla "clientes", si existe:

if object_id('clientes') is not null
drop table clientes;

-- 2- Créela con la siguiente estructura:
create table clientes (
codigo int identity,
nombre varchar(30) not null,
domicilio varchar(30),
ciudad varchar(20),
provincia varchar (20),
telefono varchar(11),
primary key(codigo)
);

-- 3- Ingrese algunos registros:
insert into clientes values ('Lopez Marcos','Colon 111','Cordoba','Cordoba','null');
insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje','Cordoba','4578585');
insert into clientes values ('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba','4578445');
insert into clientes values ('Perez Luis','Sarmiento 444','Rosario','Santa Fe',null);
insert into clientes values ('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba','4253685');
insert into clientes values ('Gomez Ines','San Martin 666','Santa Fe','Santa Fe','0345252525');
insert into clientes values ('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba','4554455');
insert into clientes values ('Lopez Carlos',null,'Cruz del Eje','Cordoba',null);
insert into clientes values ('Ramos Betina','San Martin 999','Cordoba','Cordoba','4223366');
insert into clientes values ('Lopez Lucas','San Martin 1010','Posadas','Misiones','0457858745');

-- 4- Obtenga el total de los registros agrupados por ciudad y provincia (6 filas)

select ciudad, provincia,
count(*) as cantidad
from clientes
group by ciudad,provincia;

/* 5- Obtenga el total de los registros agrupados por ciudad y provincia sin considerar los que tienen 
menos de 2 clientes (3 filas)*/
select ciudad, provincia,
count(*) as cantidad
from clientes
group by ciudad,provincia
having count(*)>1;

/*6- Obtenga el total de los clientes que viven en calle "San Martin" (where), agrupados por provincia 
(group by), teniendo en cuenta todos los valores (all), de aquellas ciudades que tengan menos de 2 
clientes (having) y omitiendo la fila correspondiente a la ciudad de "Cordoba" (having) (4 filas 
devueltas)*/

select ciudad, count(*)
from clientes
where domicilio like '%San Martin%'
group by all ciudad
having count(*)<2 and ciudad <> 'Cordoba';

--------SEGUNDO PROBLEMA---------------

if object_id('visitantes') is not null
drop table visitantes;

create table visitantes(
nombre varchar(30),
edad tinyint,
sexo char(1),
domicilio varchar(30),
ciudad varchar(20),
telefono varchar(11),
montocompra decimal(6,2) not null
);

insert into visitantes values ('Susana Molina',28,'f',null,'Cordoba',null,45.50); 
insert into visitantes values ('Marcela Mercado',36,'f','Avellaneda 345','Cordoba','4545454',22.40);
insert into visitantes values ('Alberto Garcia',35,'m','Gral. Paz 123','Alta Gracia','03547123456',25); 
insert into visitantes values ('Teresa Garcia',33,'f',default,'Alta Gracia','03547123456',120);
insert into visitantes values ('Roberto Perez',45,'m','Urquiza 335','Cordoba','4123456',33.20);
insert into visitantes values ('Marina Torres',22,'f','Colon 222','Villa Dolores','03544112233',95);
insert into visitantes values ('Julieta Gomez',24,'f','San Martin 333','Alta Gracia',null,53.50);
insert into visitantes values ('Roxana Lopez',20,'f','null','Alta Gracia',null,240);
insert into visitantes values ('Liliana Garcia',50,'f','Paso 999','Cordoba','4588778',48);
insert into visitantes values ('Juan Torres',43,'m','Sarmiento 876','Cordoba',null,15.30);

select ciudad,sexo,
sum(montocompra) as Total
from visitantes
group by ciudad,sexo
having sum(montocompra)>50;

select ciudad, sexo,
sum(montocompra) as 'total'
from visitantes
where montocompra>50 and telefono is not null
group by all ciudad,sexo
having ciudad<>'Cordoba'
order by ciudad;

select ciudad,max(montocompra) as maximo
from visitantes
where domicilio is not null and sexo='f'
group by all ciudad
having max(montocompra)>50;

select ciudad,sexo, count(*) as cantidad,
sum(montocompra) as total,
avg(montocompra) as promedio
from visitantes
group by ciudad,sexo
having avg(montocompra)>30
order by total;

-------------39 - Modificador del group by (with rollup)---------------------
--PRIMER PROBLEMA

-- 1- Elimine la tabla "clientes", si existe:
if object_id('clientes') is not null
drop table clientes;

--2- Créela con la siguiente estructura:
create table clientes (
codigo int identity,
nombre varchar(30) not null,
domicilio varchar(30),
ciudad varchar(20),
estado varchar (20),
pais varchar(20),
primary key(codigo)
);

-- 3- Ingrese algunos registros:
insert into clientes values ('Lopez Marcos','Colon 111', 'Cordoba','Cordoba','Argentina');
insert into clientes values ('Perez Ana','San Martin 222', 'Carlos Paz','Cordoba','Argentina');
insert into clientes values ('Garcia Juan','Rivadavia 333', 'Carlos Paz','Cordoba','Argentina');
insert into clientes values ('Perez Luis','Sarmiento 444', 'Rosario','Santa Fe','Argentina');
insert into clientes values ('Gomez Ines','San Martin 987', 'Santa Fe','Santa Fe','Argentina');
insert into clientes values ('Gomez Ines','San Martin 666', 'Santa Fe','Santa Fe','Argentina');
insert into clientes values ('Lopez Carlos','Irigoyen 888', 'Cordoba','Cordoba','Argentina');
insert into clientes values ('Ramos Betina','San Martin 999', 'Cordoba','Cordoba','Argentina');
insert into clientes values ('Fernando Salas','Mariano Osorio 1234', 'Santiago','Region metropolitana','Chile');
insert into clientes values ('German Rojas','Allende 345', 'Valparaiso','Region V','Chile');
insert into clientes values ('Ricardo Jara','Pablo Neruda 146', 'Santiago','Region metropolitana','Chile');
insert into clientes values ('Joaquin Robles','Diego Rivera 147', 'Guadalajara','Jalisco','Mexico');

/*4- Necesitamos la cantidad de clientes por país y la cantidad total de clientes en una sola consulta 
(4 filas)*/
select pais,count(*) as cantidad
from clientes
group by pais with rollup;

/*5- Necesitamos la cantidad de clientes agrupados por pais y estado, incluyendo resultados paciales 
(9 filas)*/
select pais,estado,
count(*) as cantidad
from clientes
group by pais,estado with rollup;

/* 6- Necesitamos la cantidad de clientes agrupados por pais, estado y ciudad, empleando "rollup" (16 
filas)*/

select pais,estado,ciudad,
count(*) as cantidad
from clientes
group by pais,estado,ciudad
with rollup;

-----------SEGUNDO PROBLEMA-------------

if object_id('notas') is not null
drop table notas;

create table notas(
documento char(8) not null,
materia varchar(30),
nota decimal(4,2)
);

insert into notas values ('22333444','Programacion',8);
insert into notas values ('22333444','Programacion',9);
insert into notas values ('22333444','Ingles',8);
insert into notas values ('22333444','Ingles',7);
insert into notas values ('22333444','Ingles',6);
insert into notas values ('22333444','Sistemas de datos',10);
insert into notas values ('22333444','Sistemas de datos',9);

insert into notas values ('23444555','Programacion',5);
insert into notas values ('23444555','Programacion',4);
insert into notas values ('23444555','Programacion',3);
insert into notas values ('23444555','Ingles',9);
insert into notas values ('23444555','Ingles',7);
insert into notas values ('23444555','Sistemas de datos',9);

insert into notas values ('24555666','Programacion',1);
insert into notas values ('24555666','Programacion',3.5);
insert into notas values ('24555666','Ingles',4.5);
insert into notas values ('24555666','Sistemas de datos',6);

select documento,materia,
avg(nota) as promedio
from notas
group by documento,materia with rollup;

select documento,
avg(nota) as promedio
from notas
group by documento with rollup;

select documento,materia,
count(nota) as cantidad
from notas
group by documento,materia;

select documento,materia,
count(nota) as cantidad
from notas
group by documento,materia with rollup;

select documento,
min(nota) as minima, max(nota)as maxima
from notas
group by documento with rollup;


--------------40 - Modificador del group by (with cube)------------------

--PRIMER PROBLEMA

--1- Elimine la tabla si existe:
if object_id('ventas') is not null
drop table ventas;

--2- Cree la tabla:
create table ventas(
numero int identity,
montocompra decimal(6,2),
tipopago char(1),--c=contado, t=tarjeta
vendedor varchar(30),
primary key (numero)
);

--3- Ingrese algunos registros:
insert into ventas
values(100.50,'c','Marisa Perez');
insert into ventas
values(200,'c','Marisa Perez');
insert into ventas
values(50,'t','Juan Lopez');
insert into ventas
values(220,'c','Juan Lopez');
insert into ventas
values(150,'t','Marisa Perez');
insert into ventas
values(550.80,'c','Marisa Perez');
insert into ventas
values(300,'t','Juan Lopez');
insert into ventas
values(25,'c','Marisa Perez');

--4- Agrupe por "tipopago" y "vendedor" y cuente la cantidad empleando "rollup".
select vendedor,tipopago,
count(*) as cantidad
from ventas
group by vendedor,tipopago
with rollup;

-- 5- Agrupe por "tipopago" y "vendedor" y cuente la cantidad empleando "cube".
select vendedor,tipopago,
count(*) as cantidad
from ventas
group by vendedor,tipopago
with cube;

------SEGUNDO PROBLEMA--------

if object_id('visitantes') is not null
drop table visitantes;

create table visitantes(
nombre varchar(30),
edad tinyint,
sexo char(1),
domicilio varchar(30),
ciudad varchar(20),
mail varchar(30) default 'no tiene',
montocompra decimal(6,2)
);

insert into visitantes values ('Susana Molina',28,'f',null,'Cordoba',null,45.50); 
insert into visitantes values ('Marcela Mercado',36,'f','Avellaneda 345','Cordoba',default,22.40);
insert into visitantes values ('Alberto Garcia',35,'m',default,'Alta Gracia','albertogarcia@hotmail.com',25); 
insert into visitantes values ('Teresa Garcia',33,'f',default,'Alta Gracia',default,120);
insert into visitantes values ('Roberto Perez',45,'m',null,'Cordoba','robertoperez@xaxamail.com',33.20);
insert into visitantes values ('Marina Torres',22,'f',null,'Villa Dolores',default,95);
insert into visitantes values ('Julieta Gomez',24,'f','San Martin 333','Alta Gracia','julietagomez@gmail.com',53.50);
insert into visitantes values ('Roxana Lopez',20,'f','null','Alta Gracia',default,240);
insert into visitantes values ('Liliana Garcia',50,'f','Paso 999','Cordoba',default,48);
insert into visitantes values ('Juan Torres',43,'m','Sarmiento 876','Cordoba',null,15.30);

select sexo,ciudad,
sum(montocompra) as total
from visitantes
group by sexo,ciudad
with rollup;

select sexo,ciudad,
sum(montocompra) as total
from visitantes
group by sexo,ciudad
with cube;

select sexo,ciudad,
 avg(edad) as 'edad promedio'
from visitantes
where mail is not null and mail <>'no tiene'
group by sexo,ciudad
with rollup;

select sexo,ciudad,
avg(edad) as 'edad promedio'
from visitantes
where mail is not null and mail <>'no tiene'
group by sexo,ciudad
with cube;


------------41 - Función grouping---------------

--PRIMER PROBLEMA

-- if object_id('empleados') is not null
if object_id('empleados') is not null
drop table empleados;

--2- Créela con la siguiente estructura:
create table empleados (
documento varchar(8) not null,
nombre varchar(30),
sexo char(1),
estadocivil char(1),
seccion varchar(20),
primary key (documento)
);

--3- Ingrese algunos registros:
insert into empleados values ('22222222','Alberto Lopez','m','c','Sistemas');
insert into empleados values ('23333333','Beatriz Garcia','f','c','Administracion');
insert into empleados values ('24444444','Carlos Fuentes','m','s','Administracion');
insert into empleados values ('25555555','Daniel Garcia','m','s','Sistemas');
insert into empleados values ('26666666','Ester Juarez',null,'c','Sistemas');
insert into empleados values ('27777777','Fabian Torres',null,'s','Sistemas');
insert into empleados values ('28888888','Gabriela Lopez','f',null,'Sistemas');
insert into empleados values ('29999999','Hector Garcia','m',null,'Administracion');

-- 4- Cuente la cantidad de empleados agrupados por sexo y estado civil, empleando "rollup".
select sexo,estadocivil,
count(*) as cantidad
from empleados
group by sexo,estadocivil
with rollup;

/*5- Realice la misma consulta anterior pero emplee la función "grouping" para los dos campos por los 
que se agrupa para distinguir los valores de resumen y de detalle.*/

select sexo,estadocivil,
count(*) as cantidad,
grouping(sexo) as 'resumen sexo',
grouping(estadocivil) as 'resumen estado civil'
from empleados
group by sexo,estadocivil
with rollup;

/* 6- Realice la misma consulta anterior pero con "cube" en lugar de "rollup", distinguiendo los 
valores de resumen y de detalle.*/
select sexo,estadocivil,
count(*) as cantidad,
grouping(sexo) as 'resumen sexo',
grouping(estadocivil) as 'resumen estado civil'
from empleados
group by sexo,estadocivil
with cube;

-- 42 - Cláusulas compute y compute by

--PRIMER PROBLEMA 

--1- Elimine la tabla si existe:

if object_id('inmuebles') is not null
drop table inmuebles;


-- 2- Créela con la siguiente estructura:
create table inmuebles (
documento varchar(8) not null,
nombre varchar(30),
domicilio varchar(20),
barrio varchar(20),
ciudad varchar(20),
tipo char(1),
superficie decimal (8,2),
monto decimal (8,2)
);

-- 3- Ingrese algunos registros:
insert into inmuebles values ('11111111','Alberto Acosta','Avellaneda 800','Centro','Cordoba','e',100,1200);
insert into inmuebles values ('11111111','Alberto Acosta','Sarmiento 245','Gral. Paz','Cordoba','e',200,2500);
insert into inmuebles values ('22222222','Beatriz Barrios','San Martin 202','Centro','Cordoba','e',250,1900);
insert into inmuebles values ('33333333','Carlos Caseres','Paso 1234','Alberdi','Cordoba','b',200,1000);
insert into inmuebles values ('33333333','Carlos Caseres','Guemes 876','Alberdi','Cordoba','b',300,1500);
insert into inmuebles values ('44444444','Diana Dominguez','Calderon 456','Matienzo','Cordoba','b',200,800);
insert into inmuebles values ('55555555','Estela Fuentes','San Martin 321','Flores','Carlos Paz','e',500,4500);
insert into inmuebles values ('55555555','Estela Fuentes','Lopez y Planes 853','Alberdi','Cordoba','e',350,2200);

--4- Muestre todos los datos y el promedio del monto empleando "compute" (1 resultado parcial)
select *from inmuebles
compute avg(monto);

/* 5- Empleando cláusulas "compute" consulte el promedio de las superficies y el total de los montos (2 
columnas extras)*/
select *from inmuebles
compute avg(superficie),sum(monto);

/* 6- Realice la misma consulta anterior pero empleando "compute by" para obtener resultados parciales 
por documento,barrio y ciudad.*/

select *from inmuebles
order by documento,barrio,ciudad
compute avg(superficie),sum(monto)
by documento,barrio,ciudad;

/*7- Realice la misma consulta anterior pero con resultados parciales por documento y barrio (6 
resultados parciales dobles)*/

select *from inmuebles
order by documento,barrio,ciudad
compute avg(superficie),sum(monto)
by documento,barrio;

/*8- Realice la misma consulta anterior pero con resultados parciales por documento (4 resultados 
parciales dobles)*/

select *from inmuebles
order by documento,barrio,ciudad
compute avg(superficie),sum(monto)
by documento;

/* 9- Intente realizar la misma consulta anterior pero con resultados parciales por documento y ciudad.
Aparece un mensaje de error indicando que el subgrupo de campos listados luego del "by" no es 
correcto.*/

select *from inmuebles
order by documento,barrio,ciudad
compute avg(superficie),sum(monto)
by documento,ciudad;

/* 10- Combine cláusulas "compute" con "compute by" para averiguar el total de monto a pagar por 
propietario y el promedio de monto de todos (4 resultados parciales y 1 general)*/
select *from inmuebles
order by documento
compute sum(monto)
compute avg(monto)
by documento;

------------ 43 - Registros duplicados (distinct)------------------

--PRIMER PROBLEMA

--1- Elimine la tabla "clientes", si existe:
if object_id('clientes') is not null
drop table clientes;

--2- Créela con la siguiente estructura:
create table clientes (
codigo int identity,
nombre varchar(30) not null,
domicilio varchar(30),
ciudad varchar(20),
provincia varchar (20),
primary key(codigo)
);

--3- Ingrese algunos registros:
insert into clientes values ('Lopez Marcos','Colon 111','Cordoba','Cordoba');
insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje','Cordoba');
insert into clientes values ('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba');
insert into clientes values ('Perez Luis','Sarmiento 444','Rosario','Santa Fe');
insert into clientes values ('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba');
insert into clientes values ('Gomez Ines','San Martin 666','Santa Fe','Santa Fe');
insert into clientes values ('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba');
insert into clientes values ('Lopez Carlos',null,'Cruz del Eje','Cordoba');
insert into clientes values ('Ramos Betina','San Martin 999','Cordoba','Cordoba');
insert into clientes values ('Lopez Lucas','San Martin 1010','Posadas','Misiones');

--4- Obtenga las provincias sin repetir (3 registros)
select distinct provincia from clientes;

--5- Cuente las distintas provincias.
select count(distinct provincia) as cantidad
from clientes;

-- 6- Se necesitan los nombres de las ciudades sin repetir (6 registros)
select distinct ciudad from clientes;

-- 7- Obtenga la cantidad de ciudades distintas.
select count(distinct ciudad) from clientes;

-- 8- Combine con "where" para obtener las distintas ciudades de la provincia de Cordoba (3 registros)
select distinct ciudad from clientes
where provincia='Cordoba';

-- 9- Contamos las distintas ciudades de cada provincia empleando "group by" (3 registros)
select provincia,count(distinct ciudad)
from clientes
group by provincia;

------------SEGUNDO PROBLEMA------------

if object_id('inmuebles') is not null
drop table inmuebles;

create table inmuebles (
documento varchar(8) not null,
apellido varchar(30),
nombre varchar(30),
domicilio varchar(20),
barrio varchar(20),
ciudad varchar(20),
tipo char(1),
superficie decimal (8,2)
);

insert into inmuebles values ('11000000','Perez','Alberto','San Martin 800','Centro','Cordoba','e',100);
insert into inmuebles values ('11000000','Perez','Alberto','Sarmiento 245','Gral. Paz','Cordoba','e',200);
insert into inmuebles values ('12222222','Lopez','Maria','San Martin 202','Centro','Cordoba','e',250);
insert into inmuebles values ('13333333','Garcia','Carlos','Paso 1234','Alberdi','Cordoba','b',200);
insert into inmuebles values ('13333333','Garcia','Carlos','Guemes 876','Alberdi','Cordoba','b',300);
insert into inmuebles values ('14444444','Perez','Mariana','Caseros 456','Flores','Cordoba','b',200);
insert into inmuebles  values ('15555555','Lopez','Luis','San Martin 321','Centro','Carlos Paz','e',500);
insert into inmuebles values ('15555555','Lopez','Luis','Lopez y Planes 853','Flores','Carlos Paz','e',350);
insert into inmuebles values ('16666666','Perez','Alberto','Sucre 1877','Flores','Cordoba','e',150);

select distinct apellido from inmuebles;

select distinct documento from inmuebles;

select count(distinct documento)
from inmuebles
where ciudad='Cordoba';

select count(ciudad)
from inmuebles
where domicilio like 'San Martin %';

select distinct apellido,nombre 
from inmuebles;

select documento,count(distinct barrio) as 'cantidad'
from inmuebles
group by documento;

----------- 44 - Cláusula top--------------------

--PRIMER PROBLEMA

--1- Elimine la tabla si existe:
if object_id('empleados') is not null
drop table empleados;

-- 2- Créela con la siguiente estructura:
create table empleados (
documento varchar(8) not null,
nombre varchar(30),
estadocivil char(1),
seccion varchar(20)
);

-- 3- Ingrese algunos registros
insert into empleados values ('22222222','Alberto Lopez','c','Sistemas');
insert into empleados values ('23333333','Beatriz Garcia','c','Administracion');
insert into empleados values ('24444444','Carlos Fuentes','s','Administracion');
insert into empleados values ('25555555','Daniel Garcia','s','Sistemas');
insert into empleados values ('26666666','Ester Juarez','c','Sistemas');
insert into empleados values ('27777777','Fabian Torres','s','Sistemas');
insert into empleados values ('28888888','Gabriela Lopez',null,'Sistemas');
insert into empleados values ('29999999','Hector Garcia',null,'Administracion');

-- 4- Muestre los 5 primeros registros (5 registros)
select top 5 * from empleados;

-- 5- Muestre nombre y seccion de los 4 primeros registros ordenados por sección (4 registros)
select top 4 nombre,seccion
from empleados
order by seccion;

/* 6- Realice la misma consulta anterior pero incluya todos los registros que tengan el mismo valor en 
"seccion" que el último (8 registros)*/

select top 4 with ties nombre,seccion
from empleados
order by seccion;

/* 7- Muestre nombre, estado civil y seccion de los primeros 4 empleados ordenados por estado civil y 
sección (4 registros)*/
select top 4 nombre,estadocivil,seccion
from empleados
order by estadocivil,seccion;

/* 8- Realice la misma consulta anterior pero incluya todos los valores iguales al último registro 
retornado (5 registros)*/
select top 4 with ties nombre,estadocivil,seccion
from empleados
order by estadocivil,seccion;

------------------45 - Clave primaria compuesta-----------------------

--PRIMER PROBLEMA

--- Elimine la tabla si existe:
if object_id('consultas') is not null
drop table consultas;

/*- Un médico sólo puede atender a un paciente en una fecha y hora determianada. En una fecha y hora 
determinada, varios médicos atienden a distintos pacientes. Cree la tabla definiendo una clave 
primaria compuesta:*/
create table consultas(
fechayhora datetime not null,
medico varchar(30) not null,
documento char(8) not null,
paciente varchar(30),
obrasocial varchar(30),
primary key(fechayhora,medico)
);

--- Ingrese varias consultas para un mismo médico en distintas horas el mismo día.
insert into consultas values ('2006/11/05 8:00','Lopez','12222222','Acosta Betina','PAMI');
insert into consultas values ('2006/11/05 8:30','Lopez','23333333','Fuentes Carlos','PAMI');

--- Ingrese varias consultas para diferentes médicos en la misma fecha y hora.

insert into consultas values ('2006/11/05 8:00','Perez','34444444','Garcia Marisa','IPAM');
insert into consultas values ('2006/11/05 8:00','Duarte','45555555','Pereyra Luis','PAMI');

-- 6- Intente ingresar una consulta para un mismo médico en la misma hora el mismo día.
insert into consultas values ('2006/11/05 8:00','Perez','23333333','Fuentes Carlos','PAMI');


-----------------SEGUNDO PROBLEMA-----------------------

if object_id('inscriptos') is not null
drop table inscriptos;

create table inscriptos(
documento char(8) not null, 
nombre varchar(30),
deporte varchar(15) not null,
año datetime,
matricula char(1),
primary key(documento,deporte,año)
);

insert into inscriptos values ('12222222','Juan Perez','tenis','2005','s');
insert into inscriptos values ('23333333','Marta Garcia','tenis','2005','s');
insert into inscriptos values ('34444444','Luis Perez','tenis','2005','n');

insert into inscriptos values ('12222222','Juan Perez','futbol','2005','s');
insert into inscriptos values ('12222222','Juan Perez','natacion','2005','s');
insert into inscriptos values ('12222222','Juan Perez','basquet','2005','n');

insert into inscriptos values ('12222222','Juan Perez','tenis','2006','s');
insert into inscriptos values ('12222222','Juan Perez','tenis','2007','s');

insert into inscriptos values ('12222222','Juan Perez','tenis','2005','s');

update inscriptos set deporte='tenis'
 where documento='12222222' and deporte='futbol' and año='2005';


 ----- 46 - Integridad de los datos (TEORIA)

 /* Es importante, al diseñar una base de datos y las tablas que contiene, tener en cuenta la integridad de los datos, esto significa que la información almacenada en las tablas debe ser válida, 
 coherente y exacta.

Comenzamos por las restricciones.

Las restricciones (constraints) son un método para mantener la integridad de los datos, asegurando que los valores ingresados sean válidos y que las relaciones entre las tablas se mantenga. Se establecen a los campos y las tablas.

Pueden definirse al crear la tabla ("create table") o agregarse a una tabla existente (empleando "alter table") y se pueden aplicar a un campo o a varios. Se aconseja crear las tablas y luego agregar las restricciones.

Se pueden crear, modificar y eliminar las restricciones sin eliminar la tabla y volver a crearla.

El procedimiento almacenado del sistema "sp_helpconstraint" junto al nombre de la tabla, nos muestra información acerca de las restricciones de dicha tabla.

Cuando se agrega una restricción a una tabla, SQL Server comprueba los datos existentes.
Hay varios tipos de restricciones.*/

------------ 47 - Restricción default ----------------

--PRIMER PROBLEMA

-- 1- Elimine la tabla "visitantes", si existe:
if object_id('visitantes') is not null
drop table visitantes;

-- 2- Cree la tabla con la siguiente estructura:
create table visitantes(
numero int identity,
nombre varchar(30),
edad tinyint,
domicilio varchar(30),
ciudad varchar(20),
montocompra decimal (6,2) not null
);

/* 3- Defina una restricción "default" para el campo "ciudad" que almacene el valor "Cordoba" en caso 
de no ingresar valor para dicho campo:*/

alter table visitantes
add constraint DF_visitantes_ciudad
default 'Cordoba'
for ciudad;

/* 4- Defina una restricción "default" para el campo "montocompra" que almacene el valor "0" en caso de 
no ingresar valor para dicho campo:*/
alter table visitantes
add constraint DF_visitantes_montocompra
default 0
for montocompra;

/* 5- Ingrese algunos registros sin valor para los campos con restricción "default":*/
insert into visitantes
values ('Susana Molina',35,'Colon 123',default,59.80);
insert into visitantes (nombre,edad,domicilio)
values ('Marcos Torres',29,'Carlos Paz');
insert into visitantes
values ('Mariana Juarez',45,'Carlos Paz',null,23.90);

-- 6- Vea cómo se almacenaron los registros:
select * from visitantes;

-- 7- Vea las restricciones creadas anteriormente. aparecen dos filas, una por cada restricción.
exec sp_helpconstraint visitantes;

/*8- Intente agregar otra restricción "default" al campo "ciudad".
Aparece un mensaje de error indicando que el campo ya tiene una restricción "default" y sabemos 
que no puede establecerse más de una restricción "default" por campo.*/
alter table visitantes
add constraint DF_visitantes_ciudad
default 'Cordoba'
for ciudad;

/*9- Intente establecer una restricción "default" al campo "identity".
No se permite.*/
alter table visitantes
add constraint DF_visitantes_numero
default 0
for numero;

-------SEGUNDO PROBLEMA------------

if object_id('vehiculos') is not null
drop table vehiculos;

create table vehiculos(
patente char(6) not null,
tipo char(1),
horallegada datetime,
horasalida datetime
 );

 alter table vehiculos
add constraint DF_vehiculos_tipo
default 'a'
for tipo;

insert into vehiculos values('BVB111',default,default,null);

select * from vehiculos;

 alter table vehiculos
add constraint DF_vehiculos_tipo2
default 'm'
for tipo;

alter table vehiculos
add constraint DF_vehiculos_horallegada
default getdate()
for horallegada;

insert into vehiculos (patente,tipo) values('CAA258','a');

select * from vehiculos;

exec sp_helpconstraint vehiculos;

------------ 48 - Restricción check----------------

--PRIMER PROBLEMA

--1- Elimine la tabla si existe:
if object_id('empleados') is not null
drop table empleados;

-- 2- Créela con la siguiente estructura:
create table empleados (
documento varchar(8),
nombre varchar(30),
fechanacimiento datetime,
cantidadhijos tinyint,
seccion varchar(20),
sueldo decimal(6,2)
);

-- 3- Agregue una restricción "check" para asegurarse que no se ingresen valores negativos para el sueldo:
alter table empleados
add constraint CK_empleados_sueldo_positivo
check (sueldo>0);

-- 4- Ingrese algunos registros válidos:
insert into empleados values ('22222222','Alberto Lopez','1965/10/05',1,'Sistemas',1000);
insert into empleados values ('33333333','Beatriz Garcia','1972/08/15',2,'Administracion',3000);
insert into empleados values ('34444444','Carlos Caseres','1980/10/05',0,'Contaduría',6000);

/*5- Intente agregar otra restricción "check" al campo sueldo para asegurar que ninguno supere el 
valor 5000:*/
alter table empleados
add constraint CK_empleados_sueldo_maximo
check (sueldo<=5000);

-- 6- Elimine el registro infractor y vuelva a crear la restricción:
delete from empleados where sueldo=6000;

/* 7- Establezca una restricción para controlar que la fecha de nacimiento que se ingresa no supere la 
fecha actual:*/

alter table empleados
add constraint CK_fechanacimiento_actual
check (fechanacimiento<getdate());

/*8- Establezca una restricción "check" para "seccion" que permita solamente los valores "Sistemas", 
"Administracion" y "Contaduría":*/

alter table empleados
add constraint CK_empleados_seccion_lista
check (seccion in ('Sistemas','Administracion','Contaduria'));

/* 9- Establezca una restricción "check" para "cantidadhijos" que permita solamente valores entre 0 y 
15.*/
alter table empleados
add constraint CK_cantidadhijos_valores
check (cantidadhijos between 0 and 15);

-- 10- Vea todas las restricciones de la tabla (5 filas):
exec sp_helpconstraint empleados;

/*11- Intente agregar un registro que vaya contra alguna de las restricciones al campo "sueldo".
Mensaje de error porque se infringe la restricción "CK_empleados_sueldo_positivo".*/
insert into empleados values ('24444444','Carlos Fuentes','1980/02/05',2,'Administracion',-1500);

/*12- Intente agregar un registro con fecha de nacimiento futura.
Mensaje de error.*/

insert into empleados values ('25555555','Daniel Garcia','2007/05/05',2,'Sistemas',1550);

/*13- Intente modificar un registro colocando en "cantidadhijos" el valor "21".
Mensaje de error.*/
update empleados set cantidadhijos=21 where documento='22222222';

/*14- Intente modificar el valor de algún registro en el campo "seccion" cambiándolo por uno que no 
esté incluido en la lista de permitidos.
Mensaje de error.*/
update empleados set seccion='Recursos' where documento='22222222';

/*15- Intente agregar una restricción al campo sección para aceptar solamente valores que comiencen 
con la letra "B":*/
alter table empleados
add constraint CK_seccion_letrainicial
check (seccion like '%B');


--------------SEGUNDO PROBLEMA--------------------

if object_id('vehiculos') is not null
drop table vehiculos;

create table vehiculos(
numero int identity,
patente char(6),
tipo char(4),
fechahoraentrada datetime,
fechahorasalida datetime
);

insert into vehiculos values('AIC124','auto','2007/01/17 8:05','2007/01/17 12:30');
insert into vehiculos values('CAA258','auto','2007/01/17 8:10',null);
insert into vehiculos values('DSE367','moto','2007/01/17 8:30','2007/01/17 18:00');

alter table vehiculos
add constraint CK_vehiculos_patente_patron
check (patente like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]');

insert into vehiculos values('AB1234','auto',getdate(),null);

alter table vehiculos
add constraint CK_vehiculos_tipo_valores
check (tipo in ('auto','moto'));

update vehiculos set tipo='bici' where patente='AIC124';

alter table vehiculos
add constraint DF_vehiculos_tipo
default 'bici'
for tipo;

insert into vehiculos values('SDF134',default,null,null);

alter table vehiculos
add constraint CK_vehiculos_fechahoraentrada_actual
check (fechahoraentrada<=getdate());

alter table vehiculos
add constraint CK_vehiculos_fechahoraentradasalida
check (fechahoraentrada<=fechahorasalida);

insert into vehiculos values('ABC123','auto','2007/05/05 10:10',null);

update vehiculos set fechahorasalida='2007/01/17 7:30'
where patente='CAA258';

exec sp_helpconstraint vehiculos;

alter table vehiculos
add constraint DF_vehiculos_fechahoraentrada
default getdate()
for fechahoraentrada;

insert into vehiculos values('DFR156','moto',default,default);

select * from vehiculos;

exec sp_helpconstraint vehiculos;


------------------49 - Deshabilitar restricciones (with check - nocheck)--------------------

--PRIMER PROBLEMA

--1- Elimine la tabla (si existe):
if object_id('empleados') is not null
drop table empleados;

-- 2- Créela con la siguiente estructura e ingrese los registros siguientes:
create table empleados (
documento varchar(8),
nombre varchar(30),
seccion varchar(20),
sueldo decimal(6,2)
);


insert into empleados values ('22222222','Alberto Acosta','Sistemas',-10);
insert into empleados values ('33333333','Beatriz Benitez','Recursos',3000);
insert into empleados values ('34444444','Carlos Caseres','Contaduria',4000);

-- 4- Intente agregar una restricción "check" para asegurarse que no se ingresen valores negativos para el sueldo:
alter table empleados
add constraint CK_empleados_sueldo_positivo
check (sueldo>=0);

-- 5- Vuelva a intentarlo agregando la opción "with nocheck":
alter table empleados
with nocheck
add constraint CK_empleados_sueldo_positivo
check (sueldo>=0);

-- 6- Intente ingresar un valor negativo para sueldo:
insert into empleados values ('35555555','Daniel Duarte','Administracion',-2000);

-- 7- Deshabilite la restricción e ingrese el registro anterior:
alter table empleados nocheck constraint CK_empleados_sueldo_positivo;
insert into empleados values ('35555555','Daniel Duarte','Administracion',2000);

/* 8- Establezca una restricción "check" para "seccion" que permita solamente los valores "Sistemas", 
"Administracion" y "Contaduría":*/

alter table empleados
add constraint CK_empleados_seccion_lista
check (seccion in ('Sistemas','Administracion','Contaduria'));

--9- Establezca la restricción anterior evitando que se controlen los datos existentes.
alter table empleados
with nocheck
add constraint CK_empleados_seccion_lista
check (seccion in ('Sistemas','Administracion','Contaduria'));

-- 10- Vea si las restricciones de la tabla están o no habilitadas:
exec sp_helpconstraint empleados;

-- 11- Habilite la restricción deshabilitada.
alter table empleados check constraint CK_empleados_sueldo_positivo;

/* 12- Intente modificar la sección del empleado "Carlos Caseres" a "Recursos".
No lo permite.*/
update empleados set seccion='Recursos' where nombre='Carlos Caseres';

-- 13- Deshabilite la restricción para poder realizar la actualización del punto precedente.
alter table empleados
nocheck constraint CK_empleados_seccion_lista;
update empleados set seccion='Recursos' where nombre='Carlos Caseres';

----------------- 50 - Restricción primary key-----------------

--PRIMER PROBLEMA

--1- Elimine la tabla si existe:
if object_id('empleados') is not null
drop table empleados;

-- 2- Créela con la siguiente estructura:
create table empleados (
documento varchar(8) not null,
nombre varchar(30),
seccion varchar(20)
);

-- 3- Ingrese algunos registros, dos de ellos con el mismo número de documento:
insert into empleados
values ('22222222','Alberto Lopez','Sistemas');
insert into empleados
values ('23333333','Beatriz Garcia','Administracion');
insert into empleados
values ('23333333','Carlos Fuentes','Administracion');

/* 4- Intente establecer una restricción "primary key" para la tabla para que el documento no se repita 
ni admita valores nulos:*/

alter table empleados
add constraint PK_empleados_documento
primary key(documento);
delete from empleados
where nombre='Carlos Fuentes';

-- 5- Establezca la restricción "primary key" del punto 4.
alter table empleados
add constraint PK_empleados_documento
primary key(documento);

/* 6- Intente actualizar un documento para que se repita.
No lo permite porque va contra la restricción.*/
update empleados set documento='22222222'
where documento='23333333';

/* 7-Intente establecer otra restricción "primary key" con el campo "nombre".
No lo permite, sólo puede haber una restricción "primary key" por tabla.*/
alter table empleados
add constraint PK_empleados_nombre
primary key(nombre);

/* 8- Intente ingresar un registro con valor nulo para el documento.
No lo permite porque la restricción no admite valores nulos.*/
insert into empleados values(null,'Marcelo Juarez','Sistemas');

/* 9- Establezca una restricción "default" para que almacene "00000000" en el documento en caso de 
omitirlo en un "insert".*/
alter table empleados
add constraint DF_empleados_documento
default '00000000'
for documento;

-- 10- Ingrese un registro sin valor para el documento.
insert into empleados (nombre,seccion) values('Luis Luque','Sistemas'); 

-- 11- Vea el registro:
select * from empleados;

/* 12- Intente ingresar otro empleado sin documento explícito.
No lo permite porque se duplicaría la clave.*/
insert into empleados (nombre,seccion) values('Ana Fuentes','Sistemas'); 

--13- Vea las restricciones de la tabla empleados (2 filas):
exec sp_helpconstraint empleados;

------------SEGUNDO PROBLEMA------------------

if object_id('remis') is not null
drop table remis;

create table remis(
numero tinyint identity,
patente char(6),
marca varchar(15),
modelo char(4)
);

insert into remis values('ABC123','Renault 12','1990');
insert into remis values('DEF456','Fiat Duna','1995');

alter table remis
add constraint PK_remis_patente
primary key(patente);

alter table remis
add constraint PK_remis_numero
primary key(numero);

exec sp_helpconstraint remis;

------------- 51 - Restricción unique--------------------

--PRIMER PROBLEMA

--1- Elimine la tabla si existe:
if object_id('remis') is not null
drop table remis;

-- 2- Cree la tabla con la siguiente estructura:
create table remis(
numero tinyint identity,
patente char(6),
marca varchar(15),
modelo char(4)
);

-- 3- Ingrese algunos registros, 2 de ellos con patente repetida y alguno con patente nula:
insert into remis values('ABC123','Renault clio','1990');
insert into remis values('DEF456','Peugeot 504','1995');
insert into remis values('DEF456','Fiat Duna','1998');
insert into remis values('GHI789','Fiat Duna','1995');
insert into remis values(null,'Fiat Duna','1995');


/*4- Intente agregar una restricción "unique" para asegurarse que la patente del remis no tomará 
valores repetidos.
No se puede porque hay valores duplicados.*/

alter table remis
add constraint UQ_remis_patente
unique(patente); 

/*5- Elimine el registro con patente duplicada y establezca la restricción.
Note que hay 1 registro con valor nulo en "patente".*/

delete from remis where numero=3;
alter table remis
add constraint UQ_remis_patente
unique(patente); 

-- 6- Intente ingresar un registro con patente repetida (no lo permite)
insert into remis values('ABC123','Renault 11','1995');

/*7- Intente ingresar un registro con valor nulo para el campo "patente".
No lo permite porque la clave estaría duplicada.*/

insert into remis values(null,'Renault 11','1995');

-- 8- Muestre la información de las restricciones:
exec sp_helpconstraint remis;

-------------- 52 - Información de restricciones (sp_helpconstraint) (EJEMPLO)-----------------------------

if object_id('alumnos') is not null
 drop table alumnos;

create table alumnos(
legajo char(4) not null,
apellido varchar(20),
nombre varchar(20),
documento char(8),
domicilio varchar(30),
ciudad varchar(30),
notafinal decimal(4,2)
);

go

-- Agregamos una restricción "primary" para el campo "legajo":
alter table alumnos
add constraint PK_alumnos_legajo
primary key(legajo);

-- Agregamos una restricción "unique" para el campo "documento"
alter table alumnos
add constraint UQ_alumnos_documento
unique (documento);

-- Agregamos una restricción "check" para que el campo "notafinal" 
-- admita solamente valores entre 0 y 10:
alter table alumnos
add constraint CK_alumnos_nota
check (notafinal>=0 and notafinal<=10);

-- Agregamos una restricción "default" para el campo "ciudad":
alter table alumnos
add constraint DF_alumnos_ciudad
default 'Cordoba'
for ciudad;

-- Veamos las restricciones:
exec sp_helpconstraint alumnos;

-- Deshabilitamos la restricción "check":
alter table alumnos
nocheck constraint CK_alumnos_nota;

 -- Veamos las restricciones:
exec sp_helpconstraint alumnos;

----------------53 - Eliminar restricciones (alter table - drop)-------------------

--PRIMER PROBLEMA

--1- Elimine la tabla, si existe:
if object_id('vehiculos') is not null
drop table vehiculos;

--2- Cree la tabla:
create table vehiculos(
patente char(6) not null,
tipo char(1),--'a'=auto, 'm'=moto
horallegada datetime not null,
horasalida datetime
);

/* 3- Establezca una restricción "check" que admita solamente los valores "a" y "m" para el campo 
"tipo":*/
alter table vehiculos
add constraint CK_vehiculos_tipo
check (tipo in ('a','m'));

/*4- Establezca una restricción "default" para el campo "tipo" que almacene el valor "a" en caso de no 
ingresarse valor para dicho campo:*/
alter table vehiculos
add constraint DF_vehiculos_tipo
default 'a'
for tipo;

/*5- Establezca una restricción "check" para el campo "patente" para que acepte 3 letras seguidas de 3 
dígitos:*/
alter table vehiculos
add constraint CK_vehiculos_patente_patron
check (patente like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]');

--6- Agregue una restricción "primary key" que incluya los campos "patente" y "horallegada":
alter table vehiculos
add constraint PK_vehiculos_patentellegada
primary key(patente,horallegada);

--7- Ingrese un vehículo:
insert into vehiculos values('SDR456','a','2005/10/10 10:10',null);

-- 8- Intente ingresar un registro repitiendo la clave primaria:
insert into vehiculos values('SDR456','m','2005/10/10 10:10',null);

-- 9- Ingrese un registro repitiendo la patente pero no la hora de llegada:
insert into vehiculos values('SDR456','m','2005/10/10 12:10',null);

-- 10- Ingrese un registro repitiendo la hora de llegada pero no la patente:
insert into vehiculos values('SDR111','m','2005/10/10 10:10',null);

-- 11- Vea todas las restricciones para la tabla "vehiculos":
exec sp_helpconstraint vehiculos;

-- 12- Elimine la restricción "default" del campo "tipo".
alter table vehiculos
drop DF_vehiculos_tipo;

-- 13- Vea si se ha eliminado:
exec sp_helpconstraint vehiculos;

-- 14- Elimine la restricción "primary key" y "check".
alter table vehiculos
drop PK_vehiculos_patentellegada, CK_vehiculos_tipo;

-- 15- Vea si se han eliminado:
exec sp_helpconstraint vehiculos;

---------54  - Trabajar con varias tablas (EJEMPLO)-----------

/*Para evitar la repetición de datos y ocupar menos espacio, se separa la información en varias tablas. 
Cada tabla almacena parte de la información que necesitamos registrar.*/
create table libros(
codigo int identity,
titulo varchar(40) not null,
autor varchar(30) not null default 'Desconocido',
codigoeditorial tinyint not null,
precio decimal(5,2),
primary key (codigo)
);

create table editoriales(
codigo tinyint identity,
nombre varchar(20) not null,
primary key(codigo)
);

---------55 - Combinación interna (inner join)------------------

--PRIMER PROBLEMA

--1- Elimine las tablas "clientes" y "provincias", si existen
if (object_id('clientes')) is not null
drop table clientes;
if (object_id('provincias')) is not null
drop table provincias;

--2- Créelas con las siguientes estructuras:
create table clientes (
codigo int identity,
nombre varchar(30),
domicilio varchar(30),
ciudad varchar(20),
codigoprovincia tinyint not null,
primary key(codigo)
);


create table provincias(
codigo tinyint identity,
nombre varchar(20),
primary key (codigo)
);

--3- Ingrese algunos registros para ambas tablas:
insert into provincias (nombre) values('Cordoba');
insert into provincias (nombre) values('Santa Fe');
insert into provincias (nombre) values('Corrientes');

insert into clientes values ('Lopez Marcos','Colon 111','Córdoba',1);
insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje',1);
insert into clientes values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
insert into clientes values ('Perez Luis','Sarmiento 444','Rosario',2);
insert into clientes values ('Pereyra Lucas','San Martin 555','Cruz del Eje',1);
insert into clientes values ('Gomez Ines','San Martin 666','Santa Fe',2);
insert into clientes values ('Torres Fabiola','Alem 777','Ibera',3);

--4- Obtenga los datos de ambas tablas, usando alias:
select c.nombre,domicilio,ciudad,p.nombre
from clientes as c
join provincias as p
on c.codigoprovincia=p.codigo;

--5- Obtenga la misma información anterior pero ordenada por nombre de provincia.
select c.nombre,domicilio,ciudad,p.nombre
from clientes as c
join provincias as p
on c.codigoprovincia=p.codigo
order by p.nombre;

--6- Recupere los clientes de la provincia "Santa Fe" (2 registros devueltos)
select c.nombre,domicilio,ciudad
from clientes as c
join provincias as p
on c.codigoprovincia=p.codigo
where p.nombre='Santa Fe';

----------SEGUNDO PROBLEMA-------------------

if (object_id('inscriptos')) is not null
drop table inscriptos;
if (object_id('inasistencias')) is not null
drop table inasistencias;

create table inscriptos(
nombre varchar(30),
documento char(8),
deporte varchar(15),
matricula char(1), --'s'=paga 'n'=impaga
primary key(documento,deporte)
);

create table inasistencias(
documento char(8),
deporte varchar(15),
fecha datetime
);

insert into inscriptos values('Juan Perez','22222222','tenis','s');
insert into inscriptos values('Maria Lopez','23333333','tenis','s');
insert into inscriptos values('Agustin Juarez','24444444','tenis','n');
insert into inscriptos values('Marta Garcia','25555555','natacion','s');
insert into inscriptos values('Juan Perez','22222222','natacion','s');
insert into inscriptos values('Maria Lopez','23333333','natacion','n');

insert into inasistencias values('22222222','tenis','2006-12-01');
insert into inasistencias values('22222222','tenis','2006-12-08');
insert into inasistencias values('23333333','tenis','2006-12-01');
insert into inasistencias values('24444444','tenis','2006-12-08');
insert into inasistencias values('22222222','natacion','2006-12-02');
insert into inasistencias values('23333333','natacion','2006-12-02');

select nombre,insc.deporte,ina.fecha
from inscriptos as insc
join inasistencias as ina
on insc.documento=ina.documento and
insc.deporte=ina.deporte
order by nombre, insc.deporte;

select nombre,insc.deporte, ina.fecha
from inscriptos as insc
join inasistencias as ina
on insc.documento=ina.documento and
insc.deporte=ina.deporte
where insc.documento='22222222';

select nombre,insc.deporte, ina.fecha
from inscriptos as insc
join inasistencias as ina
on insc.documento=ina.documento and
insc.deporte=ina.deporte
where insc.matricula='s';

--------- 56 - Combinación externa izquierda (left join)-------

--PRIMER PROBLEMA

--1- Elimine las tablas "clientes" y "provincias", si existen y cree las tablas
if (object_id('clientes')) is not null
drop table clientes;
if (object_id('provincias')) is not null
drop table provincias;

--
create table clientes (
codigo int identity,
nombre varchar(30),
domicilio varchar(30),
ciudad varchar(20),
codigoprovincia tinyint not null,
primary key(codigo)
);

create table provincias(
codigo tinyint identity,
nombre varchar(20),
primary key (codigo)
);

-- Ingrese algunos registros para ambas tablas:
insert into provincias (nombre) values('Cordoba');
insert into provincias (nombre) values('Santa Fe');
insert into provincias (nombre) values('Corrientes');

insert into clientes values ('Lopez Marcos','Colon 111','Córdoba',1);
insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje',1);
insert into clientes values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
insert into clientes values ('Perez Luis','Sarmiento 444','Rosario',2);
insert into clientes values ('Gomez Ines','San Martin 666','Santa Fe',2);
insert into clientes values ('Torres Fabiola','Alem 777','La Plata',4);
insert into clientes values ('Garcia Luis','Sucre 475','Santa Rosa',5);

--3- Muestre todos los datos de los clientes, incluido el nombre de la provincia:
select c.nombre,domicilio,ciudad, p.nombre
from clientes as c
left join provincias as p
on codigoprovincia = p.codigo;

--4- Realice la misma consulta anterior pero alterando el orden de las tablas:
select c.nombre,domicilio,ciudad, p.nombre
from provincias as p
left join clientes as c
on codigoprovincia = p.codigo;

--5- Muestre solamente los clientes de las provincias que existen en "provincias" (5 registros):
select c.nombre,domicilio,ciudad, p.nombre
from clientes as c
left join provincias as p
on codigoprovincia = p.codigo
where p.codigo is not null;

/*6- Muestre todos los clientes cuyo código de provincia NO existe en "provincias" ordenados por 
nombre del cliente (2 registros):*/
select c.nombre,domicilio,ciudad, p.nombre
from clientes as c
left join provincias as p
on codigoprovincia = p.codigo
where p.codigo is null
order by c.nombre;

--7- Obtenga todos los datos de los clientes de "Cordoba" (3 registros):
select c.nombre,domicilio,ciudad, p.nombre
from clientes as c
left join provincias as p
on codigoprovincia = p.codigo
where p.nombre='Cordoba';


--------------57 - Combinación externa derecha (right join)------------

--PRIMER PROBLEMA

--1- Elimine las tablas "clientes" y "provincias", si existen y cree las tablas:
if (object_id('clientes')) is not null
drop table clientes;
 if (object_id('provincias')) is not null
drop table provincias;


create table clientes (
codigo int identity,
nombre varchar(30),
domicilio varchar(30),
ciudad varchar(20),
codigoprovincia tinyint not null,
primary key(codigo)
);

create table provincias(
codigo tinyint identity,
nombre varchar(20),
primary key (codigo)
);

-- Ingrese algunos registros para ambas tablas:
insert into provincias (nombre) values('Cordoba');
insert into provincias (nombre) values('Santa Fe');
insert into provincias (nombre) values('Corrientes');

insert into clientes values ('Lopez Marcos','Colon 111','Córdoba',1);
insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje',1);
insert into clientes values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
insert into clientes values ('Perez Luis','Sarmiento 444','Rosario',2);
insert into clientes values ('Gomez Ines','San Martin 666','Santa Fe',2);
insert into clientes values ('Torres Fabiola','Alem 777','La Plata',4);
insert into clientes values ('Garcia Luis','Sucre 475','Santa Rosa',5);

/*3- Muestre todos los datos de los clientes, incluido el nombre de la provincia empleando un "right 
join".*/
select c.nombre,domicilio,ciudad, p.nombre
from provincias as p
right join clientes as c
on codigoprovincia = p.codigo;

--4- Obtenga la misma salida que la consulta anterior pero empleando un "left join".
select c.nombre,domicilio,ciudad, p.nombre
from clientes as c
left join provincias as p
on codigoprovincia = p.codigo;

/*5- Empleando un "right join", muestre solamente los clientes de las provincias que existen en 
"provincias" (5 registros)*/
select c.nombre,domicilio,ciudad, p.nombre
from provincias as p
right join clientes as c
on codigoprovincia = p.codigo
where p.codigo is not null;

/*6- Muestre todos los clientes cuyo código de provincia NO existe en "provincias" ordenados por 
ciudad (2 registros)*/
select c.nombre,domicilio,ciudad, p.nombre
from provincias as p
right join clientes as c
on codigoprovincia = p.codigo
where p.codigo is null
order by ciudad;


--------58 - Combinación externa completa (full join)-----------

--1- Elimine las tablas si existen y cree las tablas:
 if (object_id('deportes')) is not null
drop table deportes;
if (object_id('inscriptos')) is not null
drop table inscriptos;


create table deportes(
codigo tinyint identity,
nombre varchar(30),
profesor varchar(30),
primary key (codigo)
);

create table inscriptos(
documento char(8),
codigodeporte tinyint not null,
matricula char(1) 
);

--2- Ingrese algunos registros para ambas tablas:
insert into deportes values('tenis','Marcelo Roca');
insert into deportes values('natacion','Marta Torres');
insert into deportes values('basquet','Luis Garcia');
insert into deportes values('futbol','Marcelo Roca');
 
insert into inscriptos values('22222222',3,'s');
insert into inscriptos values('23333333',3,'s');
insert into inscriptos values('24444444',3,'n');
insert into inscriptos values('22222222',2,'s');
insert into inscriptos values('23333333',2,'s');
insert into inscriptos values('22222222',4,'n'); 
insert into inscriptos values('22222222',5,'n'); 

/*3- Muestre todos la información de la tabla "inscriptos", y consulte la tabla "deportes" para 
obtener el nombre de cada deporte (6 registros)*/
select documento,d.nombre,matricula
from inscriptos as i
join deportes as d
on codigodeporte=codigo;

--4- Empleando un "left join" con "deportes" obtenga todos los datos de los inscriptos (7 registros)
select documento,d.nombre,matricula
from inscriptos as i
left join deportes as d
on codigodeporte=codigo;

--5- Obtenga la misma salida anterior empleando un "rigth join".
select documento,d.nombre,matricula
from deportes as d
right join inscriptos as i
on codigodeporte=codigo;

--6- Muestre los deportes para los cuales no hay inscriptos, empleando un "left join" (1 registro)
select nombre
from deportes as d
left join inscriptos as i
on codigodeporte=codigo
where codigodeporte is null;

/*7- Muestre los documentos de los inscriptos a deportes que no existen en la tabla "deportes" (1 
registro)*/

select documento
from inscriptos as i
left join deportes as d
on codigodeporte=codigo
where codigo is null;

/*8- Emplee un "full join" para obtener todos los datos de ambas tablas, incluyendo las inscripciones 
a deportes inexistentes en "deportes" y los deportes que no tienen inscriptos (8 registros)*/
select documento,nombre,profesor,matricula
from inscriptos as i
full join deportes as d
on codigodeporte=codigo; 

-------59 - Combinaciones cruzadas (cross join)-------------------

--PRIMER PROBLEMA

--1- Elimine las tablas si existen y créelas:
if object_id('mujeres') is not null
drop table mujeres;
if object_id('varones') is not null
drop table varones;
create table mujeres(
nombre varchar(30),
domicilio varchar(30),
edad int
);

create table varones(
nombre varchar(30),
domicilio varchar(30),
edad int
);

--2- Ingrese los siguientes registros:
insert into mujeres values('Maria Lopez','Colon 123',45);
insert into mujeres values('Liliana Garcia','Sucre 456',35);
insert into mujeres values('Susana Lopez','Avellaneda 98',41);
insert into varones values('Juan Torres','Sarmiento 755',44);
insert into varones values('Marcelo Oliva','San Martin 874',56);
insert into varones values('Federico Pereyra','Colon 234',38);
insert into varones values('Juan Garcia','Peru 333',50);

/*3- La agencia necesita la combinación de todas las personas de sexo femenino con las de sexo 
masculino. Use un "cross join" (12 registros)*/

select m.nombre,m.edad,v.nombre,v.edad
from mujeres as m
cross join varones as v;

/*4- Realice la misma combinación pero considerando solamente las personas mayores de 40 años (6 
registros)*/
select m.nombre,m.edad,v.nombre,v.edad
from mujeres as m
cross join varones as v
where m.edad>40 and v.edad>40;

/*5- Forme las parejas pero teniendo en cuenta que no tengan una diferencia superior a 10 años (8 
registros)*/
select m.nombre,m.edad,v.nombre,v.edad
from mujeres as m
cross join varones as v
where m.edad-v.edad between -10 and 10;

--SEGUNDO PROBLEMA----------

if object_id('guardias') is not null
drop table guardias;
if object_id('tareas') is not null
drop table tareas;

create table guardias(
documento char(8),
nombre varchar(30),
sexo char(1), /* 'f' o 'm' */
domicilio varchar(30),
primary key (documento)
);

create table tareas(
codigo tinyint identity,
domicilio varchar(30),
descripcion varchar(30),
horario char(2), /* 'AM' o 'PM'*/
primary key (codigo)
);

insert into guardias values('22333444','Juan Perez','m','Colon 123');
insert into guardias values('24333444','Alberto Torres','m','San Martin 567');
insert into guardias values('25333444','Luis Ferreyra','m','Chacabuco 235');
insert into guardias values('23333444','Lorena Viale','f','Sarmiento 988');
insert into guardias values('26333444','Irma Gonzalez','f','Mariano Moreno 111');

insert into tareas values('Colon 1111','vigilancia exterior','AM');
insert into tareas values('Urquiza 234','vigilancia exterior','PM');
insert into tareas values('Peru 345','vigilancia interior','AM');
insert into tareas values('Avellaneda 890','vigilancia interior','PM');

select nombre,t.domicilio,descripcion
from guardias
cross join tareas as t;

select nombre,t.domicilio,descripcion
from guardias as g
cross join tareas as t
where (g.sexo='f' and t.descripcion='vigilancia interior') or
(g.sexo='m' and t.descripcion='vigilancia exterior');

------ 60 - Combinación de más de dos tablas------------

--PRIMER PROBLEMA

--1- Elimine las tablas si existen:
if object_id('socios') is not null
drop table socios;
if object_id('deportes') is not null
drop table deportes;
if object_id('inscriptos') is not null
drop table inscriptos;

--2- Cree las tablas con las siguientes estructuras:
create table socios(
documento char(8) not null, 
nombre varchar(30),
domicilio varchar(30),
primary key(documento)
);

create table deportes(
codigo tinyint identity,
nombre varchar(20),
profesor varchar(15),
primary key(codigo)
);
create table inscriptos(
documento char(8) not null, 
codigodeporte tinyint not null,
anio char(4),
matricula char(1),--'s'=paga, 'n'=impaga
primary key(documento,codigodeporte,anio)
);

--3- Ingrese algunos registros en "socios":
insert into socios values('22222222','Ana Acosta','Avellaneda 111');
insert into socios values('23333333','Betina Bustos','Bulnes 222');
insert into socios values('24444444','Carlos Castro','Caseros 333');
insert into socios values('25555555','Daniel Duarte','Dinamarca 44');
--4- Ingrese algunos registros en "deportes":
insert into deportes values('basquet','Juan Juarez');
insert into deportes values('futbol','Pedro Perez');
insert into deportes values('natacion','Marina Morales');
insert into deportes values('tenis','Marina Morales');
--5- Inscriba a varios socios en el mismo deporte en el mismo año:
insert into inscriptos values ('22222222',3,'2006','s');
insert into inscriptos values ('23333333',3,'2006','s');
insert into inscriptos values ('24444444',3,'2006','n');
--6- Inscriba a un mismo socio en el mismo deporte en distintos años:
insert into inscriptos values ('22222222',3,'2005','s');
insert into inscriptos values ('22222222',3,'2007','n');
--7- Inscriba a un mismo socio en distintos deportes el mismo año:
insert into inscriptos values ('24444444',1,'2006','s');
insert into inscriptos values ('24444444',2,'2006','s');
/*8- Ingrese una inscripción con un código de deporte inexistente y un documento de socio que no 
exista en "socios":*/
insert into inscriptos values ('26666666',0,'2006','s');

/*9- Muestre el nombre del socio, el nombre del deporte en que se inscribió y el año empleando 
diferentes tipos de join.*/
select s.nombre,d.nombre,anio
from deportes as d
right join inscriptos as i
on codigodeporte=d.codigo
left join socios as s
on i.documento=s.documento;

/*10- Muestre todos los datos de las inscripciones (excepto los códigos) incluyendo aquellas 
inscripciones cuyo código de deporte no existe en "deportes" y cuyo documento de socio no se 
encuentra en "socios".*/
select s.nombre,d.nombre,anio,matricula
from deportes as d
full join inscriptos as i
on codigodeporte=d.codigo
full join socios as s
on s.documento=i.documento;

--11- Muestre todas las inscripciones del socio con documento "22222222".
select s.nombre,d.nombre,anio,matricula
from deportes as d
join inscriptos as i
on codigodeporte=d.codigo
join socios as s
on s.documento=i.documento
where s.documento='22222222';

---------61 - Combinaciones con update y delete(EJEMPLO)---------------

if object_id('libros') is not null
 drop table libros;
 if object_id('editoriales') is not null
  drop table editoriales;

 create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30) default 'Desconocido',
  codigoeditorial tinyint not null,
  precio decimal(5,2)
 );
 create table editoriales(
  codigo tinyint identity,
  nombre varchar(20),
  primary key (codigo)
 );

 insert into editoriales values('Planeta');
 insert into editoriales values('Emece');
 insert into editoriales values('Siglo XXI');

 insert into libros values('El aleph','Borges',2,20);
 insert into libros values('Martin Fierro','Jose Hernandez',1,30);
 insert into libros values('Aprenda PHP','Mario Molina',3,50);
 insert into libros values('Java en 10 minutos',default,3,45);

 update libros set precio=precio+(precio*0.1)
  from libros 
  join editoriales as e
  on codigoeditorial=e.codigo
  where nombre='Planeta';

 select titulo,autor,e.nombre,precio
  from libros as l
  join editoriales as e
  on codigoeditorial=e.codigo;

 delete libros
  from libros
  join editoriales
  on codigoeditorial = editoriales.codigo
  where editoriales.nombre='Emece';

 select titulo,autor,e.nombre,precio
  from libros as l
  join editoriales as e
  on codigoeditorial=e.codigo;

-----------------62 - Clave foránea (TEORIA)-------------

/*Las claves foráneas y las claves primarias deben ser del mismo tipo para poder enlazarse. Si modificamos una, debemos modificar la otra para que los valores se correspondan.

Cuando alteramos una tabla, debemos tener cuidado con las claves foráneas. Si modificamos el tipo, longitud o atributos de una clave foránea, ésta puede quedar inhabilitada para hacer los enlaces.

Entonces, una clave foránea es un campo (o varios) empleados para enlazar datos de 2 tablas, para establecer un "join" con otra tabla en la cual es clave primaria.*/

---------------------63 - Unión-------------------------

--1- Elimine las tablas si existen:
if object_id('clientes') is not null
drop table clientes;
if object_id('proveedores') is not null
drop table proveedores;
if object_id('empleados') is not null
drop table empleados;

-- 2- Cree las tablas:
create table proveedores(
codigo int identity,
nombre varchar (30),
domicilio varchar(30),
primary key(codigo)
);

create table clientes(
codigo int identity,
nombre varchar (30),
domicilio varchar(30),
primary key(codigo)
);

create table empleados(
documento char(8) not null,
nombre varchar(20),
apellido varchar(20),
domicilio varchar(30),
primary key(documento)
);

-- 3- Ingrese algunos registros:
insert into proveedores values('Bebida cola','Colon 123');
insert into proveedores values('Carnes Unica','Caseros 222');
insert into proveedores values('Lacteos Blanca','San Martin 987');
insert into clientes values('Supermercado Lopez','Avellaneda 34');
insert into clientes values('Almacen Anita','Colon 987');
insert into clientes values('Garcia Juan','Sucre 345');
insert into empleados values('23333333','Federico','Lopez','Colon 987');
insert into empleados values('28888888','Ana','Marquez','Sucre 333');
insert into empleados values('30111111','Luis','Perez','Caseros 956');

/*4- El supermercado quiere enviar una tarjeta de salutación a todos los proveedores, clientes y 
empleados y necesita el nombre y domicilio de todos ellos. Emplee el operador "union" para obtener 
dicha información de las tres tablas.*/
select nombre, domicilio from proveedores
union
select nombre, domicilio from clientes
union
select (apellido+' '+nombre), domicilio from empleados;

/*5- Agregue una columna con un literal para indicar si es un proveedor, un cliente o un empleado y 
ordene por dicha columna.*/

select nombre, domicilio, 'proveedor' as categoria from proveedores
union
select nombre, domicilio, 'cliente' from clientes
union
select (apellido+' '+nombre), domicilio , 'empleado' from empleados
order by categoria;

----------------------64 - Agregar y eliminar campos ( alter table - add - drop)------------------------

--1- Elimine la tabla, si existe, créela y cargue un registro:
if object_id('empleados') is not null
drop table empleados;

create table empleados(
apellido varchar(20),
nombre varchar(20),
domicilio varchar(30),
fechaingreso datetime
);

insert into empleados(apellido,nombre) values ('Rodriguez','Pablo');

----2- Agregue el campo "sueldo", de tipo decimal(5,2).
alter table empleados
add sueldo decimal(5,2);

--3- Verifique que la estructura de la tabla ha cambiado.
exec sp_columns empleados;

--4- Agregue un campo "codigo", de tipo int con el atributo "identity".
alter table empleados
add codigo int identity;

/*5- Intente agregar un campo "documento" no nulo.
No es posible, porque SQL Server no permite agregar campos "not null" a menos que se especifique un 
valor por defecto.*/

alter table empleados
add documento char(8) not null;

/*6- Agregue el campo del punto anterior especificando un valor por defecto:
 alter table empleados
  add documento char(8) not null default '00000000';*/
alter table empleados
add documento char(8) not null default '00000000';

--7- Verifique que la estructura de la tabla ha cambiado.
exec sp_columns empleados;

--8- Elimine el campo "sueldo".
alter table empleados
drop column sueldo;

--9- Verifique la eliminación:
exec sp_columns empleados;

/*10- Intente eliminar el campo "documento".
no lo permite.*/
alter table empleados
drop column documento;

--11- Elimine los campos "codigo" y "fechaingreso" en una sola sentencia.
alter table empleados
drop column codigo,fechaingreso;

--12- Verifique la eliminación de los campos:
exec sp_columns empleados;


--------------65 - Alterar campos (alter table - alter)-----------------

--1- Elimine la tabla, si existe y créela:
if object_id('empleados') is not null
drop table empleados;

create table empleados(
legajo int not null,
documento char(7) not null,
nombre varchar(10),
domicilio varchar(30),
ciudad varchar(20) default 'Buenos Aires',
sueldo decimal(6,2),
cantidadhijos tinyint default 0,
primary key(legajo)
);

--2- Modifique el campo "nombre" extendiendo su longitud.
alter table empleados
alter column nombre varchar(30);

--3- Controle la modificación:
exec sp_columns empleados;

--4- Modifique el campo "sueldo" para que no admita valores nulos.
alter table empleados
alter column sueldo decimal(6,2) not null;

--4- Modifique el campo "documento" ampliando su longitud a 8 caracteres.
alter table empleados
alter column documento char(8) not null;

--5- Intente modificar el tipo de datos del campo "legajo" a "tinyint":
alter table empleados
alter column legajo tinyint not null;

--6- Ingrese algunos registros, uno con "nombre" nulo:
insert into empleados values(1,'22222222','Juan Perez','Colon 123','Cordoba',500,3);
insert into empleados values(2,'30000000',null,'Sucre 456','Cordoba',600,2);

--7- Intente modificar el campo "nombre" para que no acepte valores nulos:
alter table empleados
alter column nombre varchar(30) not null;

--8- Elimine el registro con "nombre" nulo y realice la modificación del punto 7:
delete from empleados where nombre is null;
alter table empleados
alter column nombre varchar(30) not null;

--9- Modifique el campo "ciudad" a 10 caracteres.
alter table empleados
alter column ciudad varchar(10);

--10- Intente agregar un registro con el valor por defecto para "ciudad":
insert into empleados values(3,'33333333','Juan Perez','Sarmiento 856',default,500,4);

--11- Modifique el campo "ciudad" sin que afecte la restricción dándole una longitud de 15 caracteres.
alter table empleados
alter column ciudad varchar(15);

--12- Agregue el registro que no pudo ingresar en el punto 10:
insert into empleados values(3,'33333333','Juan Perez','Sarmiento 856',default,500,4);

--13- Intente agregar el atributo identity de "legajo". No se puede agregar este atributo.
alter table empleados
alter column legajo int identity;


----------------66 - Campos calculados-----------------

--PRIMER PROBLEMA

--1- Elimine la tabla, si existe y créela nuevamente:
if object_id('articulos') is not null
 drop table articulos;

create table articulos(
codigo int identity,
descripcion varchar(30),
precio decimal(5,2) not null,
cantidad smallint not null default 0,
montototal as precio *cantidad
);

 --2- Intente ingresar un registro con valor para el campo calculado:
insert into articulos values('birome',1.5,100,150);

--3- Ingrese algunos registros:
insert into articulos values('birome',1.5,100);
insert into articulos values('cuaderno 12 hojas',4.8,150);
insert into articulos values('lapices x 12',5,200);

--4- Recupere los registros:
select * from articulos;

--5- Actualice un precio y recupere los registros:
update articulos set precio=2 where descripcion='birome';
select * from articulos;

--6- Actualice una cantidad y vea el resultado:
update articulos set cantidad=200 where descripcion='birome';
select * from articulos;

--7- Intente actualizar un campo calculado:
update articulos set montototal=300 where descripcion='birome';

----------67 - Subconsultas(TEORIA)----------------------

/*Una subconsulta (subquery) es una sentencia "select" anidada en otra sentencia "select", "insert", "update" o "delete" (o en otra subconsulta).

Las subconsultas se emplean cuando una consulta es muy compleja, entonces se la divide en varios pasos lógicos y se obtiene el resultado con una única instrucción y cuando la consulta depende de los resultados de otra consulta.

Generalmente, una subconsulta se puede reemplazar por combinaciones y estas últimas son más eficientes.

Las subconsultas se DEBEN incluir entre paréntesis.

Puede haber subconsultas dentro de subconsultas, se admiten hasta 32 niveles de anidación.

Hay tres tipos básicos de subconsultas:

las que retornan un solo valor escalar que se utiliza con un operador de comparación o en lugar de una expresión.
las que retornan una lista de valores, se combinan con "in", o los operadores "any", "some" y "all".
los que testean la existencia con "exists".*/


----------------------------68 - Subconsultas como expresión------------------------------

--PRIMER PROBLEMA

--1- Elimine la tabla, si existe:
if object_id('alumnos') is not null
drop table alumnos;

--2- Créela con los campos necesarios. Agregue una restricción "primary key" para el campo "documento" 
create table alumnos(
documento char(8),
nombre varchar(30),
nota decimal(4,2),
primary key(documento),
constraint CK_alumnos_nota_valores check (nota>=0 and nota <=10),
);

--3-Ingrese algunos registros:
insert into alumnos values('30111111','Ana Algarbe',5.1);
insert into alumnos values('30222222','Bernardo Bustamante',3.2);
insert into alumnos values('30333333','Carolina Conte',4.5);
insert into alumnos values('30444444','Diana Dominguez',9.7);
insert into alumnos values('30555555','Fabian Fuentes',8.5);
insert into alumnos values('30666666','Gaston Gonzalez',9.70);

/*4- Obtenga todos los datos de los alumnos con la nota más alta, empleando subconsulta.
2 registros.*/
select alumnos.*
from alumnos
where nota=
(select max(nota) from alumnos);

/*5- Realice la misma consulta anterior pero intente que la consulta interna retorne, además del 
máximo valor de nota, el nombre. 
Mensaje de error, porque la lista de selección de una subconsulta que va luego de un operador de 
comparación puede incluir sólo un campo o expresión (excepto si se emplea "exists" o "in").*/
select documento ,nombre, nota
from alumnos
where nota=
(select nombre,max(nota) from alumnos);

/*6- Muestre los alumnos que tienen una nota menor al promedio, su nota, y la diferencia con el 
promedio.
3 registros.*/
select alumnos.*,
(select avg(nota) from alumnos)-nota as diferencia
from alumnos
where nota< (select avg(nota) from alumnos);

/*7- Cambie la nota del alumno que tiene la menor nota por 4.
1 registro modificado.*/
update alumnos set nota=4
where nota= (select min(nota) from alumnos);

/*8- Elimine los alumnos cuya nota es menor al promedio.
3 registros eliminados.*/
delete from alumnos
where nota< (select avg(nota) from alumnos);

-------------------69 - Subconsultas con in---------------------

--PRIMER PROBLEMA

--1- Elimine las tablas "clientes" y "ciudades", si existen:
if(object_id('ciudades')) is not null
drop table ciudades;
if (object_id('clientes')) is not null
drop table clientes;

create table ciudades(
codigo tinyint identity,
nombre varchar(20),
primary key (codigo)
);

--2- Cree la tabla "clientes"
create table clientes (
codigo int identity,
nombre varchar(30),
domicilio varchar(30),
codigociudad tinyint not null,
primary key(codigo),
constraint FK_clientes_ciudad
foreign key (codigociudad)
references ciudades(codigo)
on update cascade,
);

--3- Ingrese algunos registros para ambas tablas:
insert into ciudades (nombre) values('Cordoba');
insert into ciudades (nombre) values('Cruz del Eje');
insert into ciudades (nombre) values('Carlos Paz');
insert into ciudades (nombre) values('La Falda');
insert into ciudades (nombre) values('Villa Maria');

insert into clientes values ('Lopez Marcos','Colon 111',1);
insert into clientes values ('Lopez Hector','San Martin 222',1);
insert into clientes values ('Perez Ana','San Martin 333',2);
insert into clientes values ('Garcia Juan','Rivadavia 444',3);
insert into clientes values ('Perez Luis','Sarmiento 555',3);
insert into clientes values ('Gomez Ines','San Martin 666',4);
insert into clientes values ('Torres Fabiola','Alem 777',5);
insert into clientes values ('Garcia Luis','Sucre 888',5);

/*4- Necesitamos conocer los nombres de las ciudades de aquellos clientes cuyo domicilio es en calle 
"San Martin", empleando subconsulta.
3 registros.*/
select nombre
from ciudades
where codigo in
(select codigociudad
from clientes
where domicilio like 'San Martin %');


--5- Obtenga la misma salida anterior pero empleando join.
select distinct ci.nombre
from ciudades as ci
join clientes as cl
on codigociudad=ci.codigo
where domicilio like 'San Martin%';

/*6- Obtenga los nombre de las ciudades de los clientes cuyo apellido no comienza con una letra 
específica, empleando subconsulta.
2 registros.*/

select nombre
from ciudades
where codigo not in
(select codigociudad
from clientes
where nombre like 'G%');

/*7- Pruebe la subconsulta del punto 6 separada de la consulta exterior para verificar que retorna una 
lista de valores de un solo campo.
*/
select codigociudad
from clientes
where nombre like 'G%';


-------------------70 - Subconsultas any - some - all------------------------

--PRIMER PROBLEMA

--1- Elimine las tablas si existen:

if object_id('inscriptos') is not null
drop table inscriptos;
if object_id('socios') is not null
drop table socios;

--2- Cree las tablas:
create table socios(
numero int identity,
documento char(8),
nombre varchar(30),
domicilio varchar(30),
primary key (numero)
);
 
create table inscriptos (
numerosocio int not null,
deporte varchar(20) not null,
cuotas tinyint
constraint CK_inscriptos_cuotas
check (cuotas>=0 and cuotas<=10)
constraint DF_inscriptos_cuotas default 0,
primary key(numerosocio,deporte),
constraint FK_inscriptos_socio
foreign key (numerosocio)
references socios(numero)
on update cascade
on delete cascade,
);

--3- Ingrese algunos registros:
insert into socios values('23333333','Alberto Paredes','Colon 111');
insert into socios values('24444444','Carlos Conte','Sarmiento 755');
insert into socios values('25555555','Fabian Fuentes','Caseros 987');
insert into socios values('26666666','Hector Lopez','Sucre 344');

insert into inscriptos values(1,'tenis',1);
insert into inscriptos values(1,'basquet',2);
insert into inscriptos values(1,'natacion',1);
insert into inscriptos values(2,'tenis',9);
insert into inscriptos values(2,'natacion',1);
insert into inscriptos values(2,'basquet',default);
insert into inscriptos values(2,'futbol',2);
insert into inscriptos values(3,'tenis',8);
insert into inscriptos values(3,'basquet',9);
insert into inscriptos values(3,'natacion',0);
insert into inscriptos values(4,'basquet',10);

/*4- Muestre el número de socio, el nombre del socio y el deporte en que está inscripto con un join de 
ambas tablas.*/
select numero,nombre,deporte
from socios as s
join inscriptos as i
on numerosocio=numero;

/*5- Muestre los socios que se serán compañeros en tenis y también en natación (empleando 
subconsulta)
3 filas devueltas.*/
select nombre
from socios
join inscriptos as i
on numero=numerosocio
where deporte='natacion' and 
numero= any
(select numerosocio
from inscriptos as i
 where deporte='tenis');

 /*6- vea si el socio 1 se ha inscripto en algún deporte en el cual se haya inscripto el socio 2.
3 filas.*/
select deporte
from inscriptos as i
where numerosocio=1 and
deporte= any
(select deporte
from inscriptos as i
 where numerosocio=2);

 --7- Obtenga el mismo resultado anterior pero empleando join.
select i1.deporte
from inscriptos as i1
join inscriptos as i2
on i1.deporte=i2.deporte
where i1.numerosocio=1 and
i2.numerosocio=2;

/*8- Muestre los deportes en los cuales el socio 2 pagó más cuotas que ALGUN deporte en los que se 
inscribió el socio 1.
2 registros.*/
select deporte
from inscriptos as i
where numerosocio=2 and
cuotas>any
(select cuotas
from inscriptos
where numerosocio=1);

/*9- Muestre los deportes en los cuales el socio 2 pagó más cuotas que TODOS los deportes en que se 
inscribió el socio 1.
1 registro.*/
select deporte
from inscriptos as i
where numerosocio=2 and
cuotas>all
(select cuotas
from inscriptos
where numerosocio=1);

/*10- Cuando un socio no ha pagado la matrícula de alguno de los deportes en que se ha inscripto, se 
lo borra de la inscripción de todos los deportes. Elimine todos los socios que no pagaron ninguna 
cuota en algún deporte.*/
delete from inscriptos
where numerosocio=any
(select numerosocio 
from inscriptos
where cuotas=0);

----------------------71 - Subconsultas correlacionadas------------------------

--PRIMER PROBLEMA

--1- Elimine las tablas si existen:
if object_id('inscriptos') is not null
drop table inscriptos;
if object_id('socios') is not null
drop table socios;

--2- Cree las tablas:
create table socios(
numero int identity,
documento char(8),
nombre varchar(30),
domicilio varchar(30),
primary key (numero)
);
 
create table inscriptos (
numerosocio int not null,
deporte varchar(20) not null,
cuotas tinyint
constraint CK_inscriptos_cuotas
check (cuotas>=0 and cuotas<=10)
constraint DF_inscriptos_cuotas default 0,
primary key(numerosocio,deporte),
constraint FK_inscriptos_socio
foreign key (numerosocio)
references socios(numero)
on update cascade
on delete cascade,
);

--3- Ingrese algunos registros:
insert into socios values('23333333','Alberto Paredes','Colon 111');
insert into socios values('24444444','Carlos Conte','Sarmiento 755');
insert into socios values('25555555','Fabian Fuentes','Caseros 987');
insert into socios values('26666666','Hector Lopez','Sucre 344');

insert into inscriptos values(1,'tenis',1);
insert into inscriptos values(1,'basquet',2);
insert into inscriptos values(1,'natacion',1);
insert into inscriptos values(2,'tenis',9);
insert into inscriptos values(2,'natacion',1);
insert into inscriptos values(2,'basquet',default);
insert into inscriptos values(2,'futbol',2);
insert into inscriptos values(3,'tenis',8);
insert into inscriptos values(3,'basquet',9);
insert into inscriptos values(3,'natacion',0);
insert into inscriptos values(4,'basquet',10);

/*4- Se necesita un listado de todos los socios que incluya nombre y domicilio, la cantidad de 
deportes a los cuales se ha inscripto, empleando subconsulta.*/

select nombre,domicilio,
(select count(*)
from inscriptos as i
where s.numero=i.numerosocio) as 'deportes'
from socios as s;

/*5- Se necesita el nombre de todos los socios, el total de cuotas que debe pagar (10 por cada 
deporte) y el total de cuotas pagas, empleando subconsulta.*/
select nombre,
(select (count(*)*10)
from inscriptos as i
where s.numero=i.numerosocio) as total,
(select sum(i.cuotas)
from inscriptos as i
where s.numero=i.numerosocio) as pagas
from socios as s;

--6- Obtenga la misma salida anterior empleando join.
select nombre,
count(i.deporte)*10 as total,
sum(i.cuotas) as pagas
from socios as s
join inscriptos as i
on numero=numerosocio
group by nombre;

--------------72 - Subconsulta - Exists y Not Exists------------------------

--1- Elimine las tablas si existen:
if object_id('inscriptos') is not null
drop table inscriptos;
if object_id('socios') is not null
drop table socios;

--2- Cree las tablas:
create table socios(
numero int identity,
documento char(8),
nombre varchar(30),
domicilio varchar(30),
primary key (numero)
);
 
create table inscriptos (
numerosocio int not null,
deporte varchar(20) not null,
cuotas tinyint
constraint CK_inscriptos_cuotas
check (cuotas>=0 and cuotas<=10)
constraint DF_inscriptos_cuotas default 0,
primary key(numerosocio,deporte),
constraint FK_inscriptos_socio
foreign key (numerosocio)
references socios(numero)
on update cascade
on delete cascade,
);

--3- Ingrese algunos registros:
insert into socios values('23333333','Alberto Paredes','Colon 111');
insert into socios values('24444444','Carlos Conte','Sarmiento 755');
insert into socios values('25555555','Fabian Fuentes','Caseros 987');
insert into socios values('26666666','Hector Lopez','Sucre 344');

insert into inscriptos values(1,'tenis',1);
insert into inscriptos values(1,'basquet',2);
insert into inscriptos values(1,'natacion',1);
insert into inscriptos values(2,'tenis',9);
insert into inscriptos values(2,'natacion',1);
insert into inscriptos values(2,'basquet',default);
insert into inscriptos values(2,'futbol',2);
insert into inscriptos values(3,'tenis',8);
insert into inscriptos values(3,'basquet',9);
insert into inscriptos values(3,'natacion',0);
insert into inscriptos values(4,'basquet',10);

/*4- Emplee una subconsulta con el operador "exists" para devolver la lista de socios que se 
inscribieron en un determinado deporte.*/
select nombre
from socios as s
where exists
(select *from inscriptos as i
where s.numero=i.numerosocio and i.deporte='natacion');

--5- Busque los socios que NO se han inscripto en un deporte determinado empleando "not exists".
select nombre
from socios as s
where not exists
(select *from inscriptos as i
where s.numero=i.numerosocio and i.deporte='natacion');

--6- Muestre todos los datos de los socios que han pagado todas las cuotas.
select s.*
from socios as s
where exists
(select *from inscriptos as i
where s.numero=i.numerosocio and i.cuotas=10);

--------------------73 - Subconsulta en lugar de una tabla------------------------

--1- Elimine las tablas si existen:
if object_id('inscriptos') is not null
drop table inscriptos;
if object_id('socios') is not null
drop table socios;
if object_id('deportes') is not null
drop table deportes;

--2- Cree las tablas con las siguientes estructuras:
create table socios(
documento char(8) not null, 
nombre varchar(30),
domicilio varchar(30),
primary key(documento)
);

create table deportes(
codigo tinyint identity,
nombre varchar(20),
profesor varchar(15),
primary key(codigo)
);

create table inscriptos(
documento char(8) not null, 
codigodeporte tinyint not null,
año char(4),
matricula char(1),--'s'=paga, 'n'=impaga
primary key(documento,codigodeporte,año),
constraint FK_inscriptos_socio
foreign key (documento)
references socios(documento)
on update cascade
on delete cascade
);

--3- Ingrese algunos registros en las 3 tablas:
insert into socios values('22222222','Ana Acosta','Avellaneda 111');
insert into socios values('23333333','Betina Bustos','Bulnes 222');
insert into socios values('24444444','Carlos Castro','Caseros 333');
insert into socios values('25555555','Daniel Duarte','Dinamarca 44');

insert into deportes values('basquet','Juan Juarez');
insert into deportes values('futbol','Pedro Perez');
insert into deportes values('natacion','Marina Morales');
insert into deportes values('tenis','Marina Morales');

insert into inscriptos values ('22222222',3,'2006','s');
insert into inscriptos values ('23333333',3,'2006','s');
insert into inscriptos values ('24444444',3,'2006','n');
insert into inscriptos values ('22222222',3,'2005','s');
insert into inscriptos values ('22222222',3,'2007','n');
insert into inscriptos values ('24444444',1,'2006','s');
insert into inscriptos values ('24444444',2,'2006','s');

/*4- Realice una consulta en la cual muestre todos los datos de las inscripciones, incluyendo el 
nombre del deporte y del profesor.
Esta consulta es un join.*/
select i.documento,i.codigodeporte,d.nombre as deporte, año, matricula, d.profesor
from deportes as d
join inscriptos as i
on d.codigo=i.codigodeporte;

/*5- Utilice el resultado de la consulta anterior como una tabla derivada para emplear en lugar de una 
tabla para realizar un "join" y recuperar el nombre del socio, el deporte en el cual está inscripto, 
el año, el nombre del profesor y la matrícula.*/
select s.nombre,td.deporte,td.profesor,td.año,td.matricula
from socios as s
join (select i.documento,i.codigodeporte,d.nombre as deporte, año, matricula, d.profesor
from deportes as d
join inscriptos as i
on d.codigo=i.codigodeporte) as td
on td.documento=s.documento;


--------------------74 - Subconsulta (update - delete)----------------------

--1- Elimine las tablas si existen:
if object_id('inscriptos') is not null
drop table inscriptos;
if object_id('socios') is not null
drop table socios;

--2- Cree las tablas:
create table socios(
numero int identity,
documento char(8),
nombre varchar(30),
domicilio varchar(30),
primary key (numero)
);
 

create table inscriptos (
numerosocio int not null,
deporte varchar(20) not null,
matricula char(1),-- 'n' o 's'
primary key(numerosocio,deporte),
constraint FK_inscriptos_socio
foreign key (numerosocio)
 references socios(numero)
);

 --3- Ingrese algunos registros:
insert into socios values('23333333','Alberto Paredes','Colon 111');
insert into socios values('24444444','Carlos Conte','Sarmiento 755');
insert into socios values('25555555','Fabian Fuentes','Caseros 987');
insert into socios values('26666666','Hector Lopez','Sucre 344');

insert into inscriptos values(1,'tenis','s');
insert into inscriptos values(1,'basquet','s');
insert into inscriptos values(1,'natacion','s');
insert into inscriptos values(2,'tenis','s');
insert into inscriptos values(2,'natacion','s');
insert into inscriptos values(2,'basquet','n');
insert into inscriptos values(2,'futbol','n');
insert into inscriptos values(3,'tenis','s');
insert into inscriptos values(3,'basquet','s');
insert into inscriptos values(3,'natacion','n');
insert into inscriptos values(4,'basquet','n');

/*4- Actualizamos la cuota ('s') de todas las inscripciones de un socio determinado (por documento) 
empleando subconsulta.
*/
update inscriptos set matricula='s'
where numerosocio=
(select numero
from socios
where documento='25555555');

--5- Elimine todas las inscripciones de los socios que deben alguna matrícula (5 registros eliminados)
delete from inscriptos
where numerosocio in
(select numero
from socios as s
join inscriptos
on numerosocio=numero
where matricula='n');


--------------------75 - Subconsulta (insert)-------------------------

--1- Elimine las tablas si existen:
if object_id('facturas') is not null
drop table facturas;
if object_id('clientes') is not null
drop table clientes;

--2-Créelas:
create table clientes(
codigo int identity,
nombre varchar(30),
domicilio varchar(30),
primary key(codigo)
);

create table facturas(
numero int not null,
fecha datetime,
codigocliente int not null,
total decimal(6,2),
primary key(numero),
constraint FK_facturas_cliente
foreign key (codigocliente)
references clientes(codigo)
on update cascade
);

--3-Ingrese algunos registros:
insert into clientes values('Juan Lopez','Colon 123');
insert into clientes values('Luis Torres','Sucre 987');
insert into clientes values('Ana Garcia','Sarmiento 576');
insert into clientes values('Susana Molina','San Martin 555');

insert into facturas values(1200,'2007-01-15',1,300);
insert into facturas values(1201,'2007-01-15',2,550);
insert into facturas values(1202,'2007-01-15',3,150);
insert into facturas values(1300,'2007-01-20',1,350);
insert into facturas values(1310,'2007-01-22',3,100);

/*4- El comercio necesita una tabla llamada "clientespref" en la cual quiere almacenar el nombre y 
domicilio de aquellos clientes que han comprado hasta el momento más de 500 pesos en mercaderías. 
Elimine la tabla si existe y créela con esos 2 campos:*/
if object_id ('clientespref') is not null
drop table clientespref;
create table clientespref(
nombre varchar(30),
domicilio varchar(30)
);

/*5- Ingrese los registros en la tabla "clientespref" seleccionando registros de la tabla "clientes" y 
"facturas".*/

insert into clientespref
select nombre,domicilio
from clientes 
where codigo in 
(select codigocliente
from clientes as c
join facturas as f
on codigocliente=codigo
group by codigocliente
having sum(total)>500);

--6- Vea los registros de "clientespref":
 select * from clientespref;

 ------------------76 - Crear tabla a partir de otra (select - into)------------------------

 --1- Elimine las tablas "empleados" y "sucursales" si existen:
 if object_id('empleados')is not null
drop table empleados;
if object_id('sucursales')is not null
drop table sucursales;

--2- Cree la tabla "sucursales":
create table sucursales( 
codigo int identity,
ciudad varchar(30) not null,
primary key(codigo)
); 

--3- Cree la tabla "empleados":
create table empleados( 
documento char(8) not null,
nombre varchar(30) not null,
domicilio varchar(30),
seccion varchar(20),
sueldo decimal(6,2),
codigosucursal int,
primary key(documento),
constraint FK_empleados_sucursal
foreign key (codigosucursal)
references sucursales(codigo)
on update cascade
); 

--4- Ingrese algunos registros para ambas tablas:
insert into sucursales values('Cordoba');
insert into sucursales values('Villa Maria');
insert into sucursales values('Carlos Paz');
insert into sucursales values('Cruz del Eje');

insert into empleados values('22222222','Ana Acosta','Avellaneda 111','Secretaria',500,1);
insert into empleados values('23333333','Carlos Caseros','Colon 222','Sistemas',800,1);
insert into empleados values('24444444','Diana Dominguez','Dinamarca 333','Secretaria',550,2);
insert into empleados values('25555555','Fabiola Fuentes','Francia 444','Sistemas',750,2);
insert into empleados values('26666666','Gabriela Gonzalez','Guemes 555','Secretaria',580,3);
insert into empleados values('27777777','Juan Juarez','Jujuy 777','Secretaria',500,4);
insert into empleados values('28888888','Luis Lopez','Lules 888','Sistemas',780,4);
insert into empleados values('29999999','Maria Morales','Marina 999','Contaduria',670,4);

--5- Realice un join para mostrar todos los datos de "empleados" incluyendo la ciudad de la sucursal:
select documento,nombre,domicilio,seccion,sueldo,ciudad
from empleados
join sucursales on codigosucursal=codigo;

/*6-Cree una tabla llamada "secciones" que contenga las secciones de la empresa (primero elimínela, si 
existe):*/
if object_id('secciones') is not null
drop table secciones;

 select distinct seccion as nombre
into secciones
from empleados;

--7- Recupere la información de "secciones":
select *from secciones;

/*8- Se necesita una nueva tabla llamada "sueldosxseccion" que contenga la suma de los sueldos de los 
empleados por sección. Primero elimine la tabla, si existe:*/

if object_id('sueldosxseccion') is not null
drop table sueldosxseccion;

select seccion, sum(sueldo) as total
into sueldosxseccion
from empleados
group by seccion;

--9- Recupere los registros de la nueva tabla:
select *from sueldosxseccion;

/*10- Se necesita una tabla llamada "maximossueldos" que contenga los mismos campos que "empleados" y 
guarde los 3 empleados con sueldos más altos. Primero eliminamos, si existe, la tabla */
if object_id('maximossueldos') is not null
drop table maximossueldos;

select top 3 *
into maximossueldos
from empleados
order by sueldo;

--11- Vea los registros de la nueva tabla:
select *from maximossueldos;

/*12- Se necesita una nueva tabla llamada "sucursalCordoba" que contenga los nombres y sección de los 
empleados de la ciudad de Córdoba. En primer lugar, eliminamos la tabla, si existe. Luego, consulte 
las tablas "empleados" y "sucursales" y guarde el resultado en la nueva tabla:*/
if object_id('sucursalCordoba') is not null
drop table sucursalCordoba;

select nombre,ciudad
into sucursalCordoba
from empleados
join sucursales
on codigosucursal=codigo
where ciudad='Cordoba';

--13- Consulte la nueva tabla:
select *from sucursalCordoba;


-----------------------77 - go(TEORIA)--------------------------------

/*"go" es un signo de finalización de un lote de sentencias SQL. No es una sentencia, es un comando.
El lote de sentencias está compuesto por todas las sentencias antes de "go" o todas las sentencias entre dos "go".

Las sentencias no deben ocupar la misma linea en la que está "go".

Habrá notado que no se puede ejecutar un procedimiento almacenado luego de otras sentencias a menos que se incluya "execute" (o "exec").*/



-------------------------78 - Vistas---------------------

--1- Elimine las tablas y créelas nuevamente:
if object_id('inscriptos') is not null  
drop table inscriptos;
if object_id('socios') is not null  
drop table socios;
if object_id('profesores') is not null  
drop table profesores; 
if object_id('cursos') is not null  
 drop table cursos;

create table socios(
documento char(8) not null,
nombre varchar(40),
domicilio varchar(30),
constraint PK_socios_documento
primary key (documento)
);

create table profesores(
documento char(8) not null,
nombre varchar(40),
domicilio varchar(30),
constraint PK_profesores_documento
primary key (documento)
);

create table cursos(
numero tinyint identity,
deporte varchar(20),
dia varchar(15),
constraint CK_inscriptos_dia check (dia in('lunes','martes','miercoles','jueves','viernes','sabado')),
documentoprofesor char(8),
constraint PK_cursos_numero
primary key (numero),
);

create table inscriptos(
documentosocio char(8) not null,
numero tinyint not null,
matricula char(1),
constraint CK_inscriptos_matricula check (matricula in('s','n')),
constraint PK_inscriptos_documento_numero
primary key (documentosocio,numero)
);

--2- Ingrese algunos registros para todas las tablas:
insert into socios values('30000000','Fabian Fuentes','Caseros 987');
insert into socios values('31111111','Gaston Garcia','Guemes 65');
insert into socios values('32222222','Hector Huerta','Sucre 534');
insert into socios values('33333333','Ines Irala','Bulnes 345');

insert into profesores values('22222222','Ana Acosta','Avellaneda 231');
insert into profesores values('23333333','Carlos Caseres','Colon 245');
insert into profesores values('24444444','Daniel Duarte','Sarmiento 987');
insert into profesores values('25555555','Esteban Lopez','Sucre 1204');

insert into cursos values('tenis','lunes','22222222');
insert into cursos values('tenis','martes','22222222');
insert into cursos values('natacion','miercoles','22222222');
insert into cursos values('natacion','jueves','23333333');
insert into cursos values('natacion','viernes','23333333');
insert into cursos values('futbol','sabado','24444444');
insert into cursos values('futbol','lunes','24444444');
insert into cursos values('basquet','martes','24444444');

insert into inscriptos values('30000000',1,'s');
insert into inscriptos values('30000000',3,'n');
insert into inscriptos values('30000000',6,null);
insert into inscriptos values('31111111',1,'s');
insert into inscriptos values('31111111',4,'s');
insert into inscriptos values('32222222',8,'s');

--3- Elimine la vista "vista_club" si existe:
if object_id('vista_club') is not null drop view vista_club;

/*4- Cree una vista en la que aparezca el nombre y documento del socio, el deporte, el día y el nombre 
del profesor.*/
create view vista_club as
select s.nombre as socio,s.documento as docsocio,s.domicilio as domsocio,c.deporte,dia,
p.nombre as profesor, matricula
from socios as s
full join inscriptos as i
on s.documento=i.documentosocio
full join cursos as c
on i.numero=c.numero
full join profesores as p
on c.documentoprofesor=p.documento;

--5- Muestre la información contenida en la vista.
select *from vista_club;

/*6- Realice una consulta a la vista donde muestre la cantidad de socios inscriptos en cada deporte 
ordenados por cantidad.*/
select deporte,dia,count(socio) as cantidad
from vista_club
where deporte is not null
group by deporte,dia
order by cantidad;

--7- Muestre (consultando la vista) los cursos (deporte y día) para los cuales no hay inscriptos.
select deporte,dia from vista_club
where socio is null and deporte is not null;

--8- Muestre los nombres de los socios que no se han inscripto en ningún curso (consultando la vista)
select socio from vista_club
where deporte is null and socio is not null;

--9- Muestre (consultando la vista) los profesores que no tienen asignado ningún deporte aún.
select profesor from vista_club where deporte is null and profesor is not null;

--10- Muestre (consultando la vista) el nombre y documento de los socios que deben matrículas.
select socio, docsocio from vista_club where deporte is not null and matricula <> 's';

/*11- Consulte la vista y muestre los nombres de los profesores y los días en que asisten al club para 
dictar sus clases.*/
select distinct profesor,dia
from vista_club where profesor is not null;

--12- Muestre la misma información anterior pero ordenada por día.
select distinct profesor,dia
from vista_club where profesor is not null
order by dia;

--13- Muestre todos los socios que son compañeros en tenis los lunes.
select socio from vista_club
where deporte='tenis' and dia='lunes';


/*/*14- Elimine la vista "vista_inscriptos" si existe y créela para que muestre la cantidad de 
inscriptos por curso, incluyendo el número del curso, el nombre del deporte y el día.*/*/
 if object_id('vista_inscriptos') is not null
drop view vista_inscriptos;

create view vista_inscriptos as
select deporte,dia,
(select count(*)
from inscriptos as i
where i.numero=c.numero) as cantidad
from cursos as c;

--15- Consulte la vista:
select *from vista_inscriptos;


----------------79 - Lenguaje de control de flujo (case)------------------

--1- Elimine la tabla "empleados" si existe:
if object_id('empleados') is not null
drop table empleados;

--2- Cree la tabla:
create table empleados(
documento char(8) not null,
nombre varchar(30) not null,
sexo char(1),
fechanacimiento datetime,
fechaingreso datetime,
cantidadhijos tinyint,
sueldo decimal(5,2),
primary key(documento)
);

--3- Ingrese algunos registros:
insert into empleados values ('22333111','Juan Perez','m','1970-05-10','1987-04-05',2,550);
insert into empleados values ('25444444','Susana Morales','f','1975-11-06','1990-04-06',0,650);
insert into empleados values ('20111222','Hector Pereyra','m','1965-03-25','1997-04-12',3,510);
insert into empleados values ('30000222','Luis LUque','m','1980-03-29','1999-11-06',1,700);
insert into empleados values ('20555444','Laura Torres','f','1965-12-22','2003-11-06',3,400);
insert into empleados values ('30000234','Alberto Soto','m','1989-10-10','1999-11-06',2,420);
insert into empleados values ('20125478','Ana Gomez','f','1976-09-21','1998-11-06',3,350);
insert into empleados values ('24154269','Ofelia Garcia','f','1974-05-12','1990-11-06',0,390);
insert into empleados values ('30415426','Oscar Torres','m','1978-05-02','1997-11-06',1,400);

/*4- Es política de la empresa festejar cada fin de mes, los cumpleaños de todos los empleados que 
cumplen ese mes.*/
select sexo, count(*) as cantidad, obsequio=
case 
when sexo='f' then 'rosas'
else 'corbata'
end
from empleados
where datepart(month,fechanacimiento)=5
group by sexo;

/*5- Además, si el empleado cumple 10,20,30,40... años de servicio, se le regala una placa 
recordatoria.*/
select nombre,datepart(year,fechaingreso) as añoingreso,
datepart(year,getdate())-datepart(year,fechaingreso) as AñosdeServicio, placa=
case (datepart(year,getdate())-datepart(year,fechaingreso)) %10
when 0 then 'Si'  --si la cantidad de años es divisible por 10
else 'No'
end
from empleados
where datepart(month,fechaingreso)=4;

/*6- La empresa paga un sueldo adicional por hijos a cargos. Para un sueldo menor o igual a $500 el 
salario familiar por hijo es de $200, para un sueldo superior, el monto es de $100 por hijo. Muestre 
el nombre del empleado, el sueldo básico, la cantidad de hijos a cargo, el valor del salario por 
hijo, el valor total del salario familiar y el sueldo final con el salario familiar incluido de 
todos los empleados.*/
select nombre,sueldo,cantidadhijos,porhijo=
case 
when sueldo<=500 then 200
else 100
end,
salariofamilar=
case
when sueldo<=500 then 200*cantidadhijos
else 100*cantidadhijos
end,
sueldototal=
case
when sueldo<=500 then sueldo+(200*cantidadhijos)
else sueldo+(100*cantidadhijos)
end
from empleados
order by sueldototal;

-----------------------80 - Lenguaje de control de flujo (if)-------------------------

--1- Elimine la tabla "empleados" si existe:
if object_id('empleados') is not null
drop table empleados;

--2- Cree la tabla:
create table empleados(
documento char(8) not null,
nombre varchar(30) not null,
sexo char(1),
fechanacimiento datetime,
sueldo decimal(5,2),
primary key(documento)
);

--3- Ingrese algunos registros:
insert into empleados values ('22333111','Juan Perez','m','1970-05-10',550);
insert into empleados values ('25444444','Susana Morales','f','1975-11-06',650);
insert into empleados values ('20111222','Hector Pereyra','m','1965-03-25',510);
insert into empleados values ('30000222','Luis LUque','m','1980-03-29',700);
insert into empleados values ('20555444','Laura Torres','f','1965-12-22',400);
insert into empleados values ('30000234','Alberto Soto','m','1989-10-10',420);
insert into empleados values ('20125478','Ana Gomez','f','1976-09-21',350);
insert into empleados values ('24154269','Ofelia Garcia','f','1974-05-12',390);
insert into empleados values ('30415426','Oscar Torres','m','1978-05-02',400);

/*4- Es política de la empresa festejar cada fin de mes, los cumpleaños de todos los empleados que 
cumplen ese mes. Si los empleados son de sexo femenino, se les regala un ramo de rosas, si son de 
sexo masculino, una corbata. La secretaria de la Gerencia necesita saber cuántos ramos de rosas y 
cuántas corbatas debe comprar para el mes de mayo.
*/
if exists(select * from empleados
where datepart(month,fechanacimiento)=5)--si hay empleados que cumplan en mayo
(select sexo,count(*) as cantidad 
from empleados
where datepart(month,fechanacimiento)=5
group by sexo)
else select 'no hay empleados que cumplan en mayo';

--SEGUNDO PROBLEMA---

if object_id('entradas') is not null
drop table entradas;

create table entradas(
sala tinyint,
fechahora datetime,
capacidad smallint,
entradasvendidas smallint,
primary key(sala,fechahora)
);

insert into entradas values(1,'2006-05-10 20:00',300,50);
insert into entradas values(1,'2006-05-10 23:00',300,250);
insert into entradas values(2,'2006-05-10 20:00',400,350);
insert into entradas values(2,'2006-05-11 20:00',400,380);
insert into entradas values(2,'2006-05-11 23:00',400,400);
insert into entradas values(3,'2006-05-12 20:00',350,350);
insert into entradas values(3,'2006-05-12 22:30',350,100);
insert into entradas values(4,'2006-05-12 20:00',250,0);

if exists
(select * from entradas where capacidad>entradasvendidas)
select sala,fechahora,capacidad-entradasvendidas as disponibles
from entradas
where capacidad>entradasvendidas
else select 'Todas las entradas estan agotadas';


--------- 81 - Procedimientos almacenados(TEORIA)--------------

/*SQL Server permite los siguientes tipos de procedimientos almacenados:

1) del sistema: están almacenados en la base de datos "master" y llevan el prefijo "sp_"; permiten recuperar información de las tablas del sistema y pueden ejecutarse en cualquier base de datos.

2) locales: los crea el usuario (próximo tema).

3) temporales: pueden ser locales, cuyos nombres comienzan con un signo numeral (#), o globales, cuyos nombres comienzan con 2 signos numeral (##). Los procedimientos almacenados temporales locales están disponibles en la sesión de un solo usuario y se eliminan automáticamente al finalizar la sesión; los globales están disponibles en las sesiones de todos los usuarios.

4) extendidos: se implementan como bibliotecas de vínculos dinámicos (DLL, Dynamic-Link Libraries), se ejecutan fuera del entorno de SQL Server.

Ventajas:

- comparten la lógica de la aplicación con las otras aplicaciones, con lo cual el acceso y las modificaciones de los datos se hacen en un solo sitio.

- permiten realizar todas las operaciones que los usuarios necesitan evitando que tengan acceso directo a las tablas.

- reducen el tráfico de red; en vez de enviar muchas instrucciones, los usuarios realizan operaciones enviando una única instrucción, lo cual disminuye el número de solicitudes entre el cliente y el servidor.*/



---------------82 - Procedimientos almacenados (crear - ejecutar)-------------------

--1- Eliminamos la tabla, si existe y la creamos:
if object_id('empleados') is not null
drop table empleados;


create table empleados(
documento char(8),
nombre varchar(20),
apellido varchar(20),
sueldo decimal(6,2),
cantidadhijos tinyint,
seccion varchar(20),
primary key(documento)
);

--2- Ingrese algunos registros:
insert into empleados values('22222222','Juan','Perez',300,2,'Contaduria');
insert into empleados values('22333333','Luis','Lopez',300,0,'Contaduria');
insert into empleados values ('22444444','Marta','Perez',500,1,'Sistemas');
insert into empleados values('22555555','Susana','Garcia',400,2,'Secretaria');
insert into empleados values('22666666','Jose Maria','Morales',400,3,'Secretaria');

--3- Elimine el procedimiento llamado "pa_empleados_sueldo" si existe:
if object_id('pa_empleados_sueldo') is not null
drop procedure pa_empleados_sueldo;

/*4- Cree un procedimiento almacenado llamado "pa_empleados_sueldo" que seleccione los nombres, 
apellidos y sueldos de los empleados.*/
create procedure pa_empleados_sueldo
as
select nombre,apellido,sueldo
from empleados;

--5- Ejecute el procedimiento creado anteriormente.
exec pa_empleados_sueldo;

--6- Elimine el procedimiento llamado "pa_empleados_hijos" si existe:
if object_id('pa_empleados_hijos') is not null
drop procedure pa_empleados_hijos;

/*7- Cree un procedimiento almacenado llamado "pa_empleados_hijos" que seleccione los nombres, 
apellidos y cantidad de hijos de los empleados con hijos.*/
create procedure pa_empleados_hijos
as
select nombre,apellido,cantidadhijos
from empleados
where cantidadhijos>0;

--8- Ejecute el procedimiento creado anteriormente.
exec pa_empleados_hijos;

/*9- Actualice la cantidad de hijos de algún empleado sin hijos y vuelva a ejecutar el procedimiento 
para verificar que ahora si aparece en la lista.*/

update empleados set cantidadhijos=1 where documento='22333333';
exec pa_empleados_hijos;


----------------83 - Tablas temporales(TEORIA)-----------------

/*Las tablas temporales son visibles solamente en la sesión actual.

Las tablas temporales se eliminan automáticamente al acabar la sesión o la función o procedimiento almacenado en el cual fueron definidas. Se pueden eliminar con "drop table".

Pueden ser locales (son visibles sólo en la sesión actual) o globales (visibles por todas las sesiones).

Para crear tablas temporales locales se emplea la misma sintaxis que para crear cualquier tabla, excepto que se coloca un signo numeral (#) precediendo el nombre.*/



----------------84 - Funciones(TEORIA)------------------

/*SQL Server ofrece varios tipos de funciones para realizar distintas operaciones. Hemos visto y empleado varias de ellas.

Se pueden emplear las funciones del sistema en cualquier lugar en el que se permita una expresión en una sentencia "select".

Las funciones pueden clasificarse en:

- deterministicas: siempre retornan el mismo resultado si se las invoca enviando el mismo valor de entrada. Todas las funciones de agregado y string son deterministicas, excepto "charindex" y "patindex".

- no deterministicas: pueden retornar distintos resultados cada vez que se invocan con el mismo valor de entrada. 
Las siguientes son algunas de las funciones no deterministicas: getdate, datename, textptr, textvalid, rand. Todas las funciones de configuración, cursor, meta data, seguridad y estadísticas del sistema son no deterministicas.

SQL Server admite 3 tipos de funciones definidas por el usuario clasificadas según el valor retornado:

1) escalares: retornan un valor escalar;

2) de tabla de varias instrucciones (retornan una tabla) y

3) de tabla en línea (retornan una tabla).*/

---------------------85 - Funciones escalares (crear y llamar)------------------------

--1- Elimine las tablas si existen:
 if object_id('consultas') is not null
 drop table consultas;
 if object_id('medicos') is not null
 drop table medicos;

 --2- Cree las tablas con las siguientes estructuras:
create table medicos (
documento char(8) not null,
nombre varchar(30),
constraint PK_medicos 
primary key clustered (documento)
);

create table consultas(
fecha datetime,
medico char(8) not null,
paciente varchar(30),
constraint PK_consultas
primary key (fecha,medico),
constraint FK_consultas_medico
foreign key (medico)
references medicos(documento)
on update cascade
on delete cascade
);

--3- Ingrese algunos registros:
insert into medicos values('22222222','Alfredo Acosta');
insert into medicos values('23333333','Pedro Perez');
insert into medicos values('24444444','Marcela Morales');

insert into consultas values('2007/03/26 8:00','22222222','Juan Juarez');
insert into consultas values('2007/03/26 8:00','23333333','Gaston Gomez');
insert into consultas values('2007/03/26 8:30','22222222','Nora Norte');
insert into consultas values('2007/03/28 9:00','22222222','Juan Juarez');
insert into consultas values('2007/03/29 8:00','24444444','Nora Norte');
insert into consultas values('2007/03/24 8:30','22222222','Hector Huerta'); 
insert into consultas values('2007/03/24 9:30','23333333','Hector Huerta');

--4- Elimine la función "f_nombreDia" si existe:
if object_id('f_nombreDia') is not null
drop function f_nombreDia;

/*5- Cree la función "f_nombreDia" que recibe una fecha (tipo string) y nos retorne el nombre del día 
en español.*/
create function f_nombreDia
(@fecha varchar(30))
returns varchar(10)
as
begin
declare @nombre varchar(10)
set @nombre='Fecha inválida'   
if (isdate(@fecha)=1)
begin
set @fecha=cast(@fecha as datetime)
set @nombre=
case datename(weekday,@fecha)
when 'Monday' then 'lunes'
when 'Tuesday' then 'martes'
when 'Wednesday' then 'miércoles'
when 'Thursday' then 'jueves'
when 'Friday' then 'viernes'
when 'Saturday' then 'sábado'
when 'Sunday' then 'domingo'
end
end
return @nombre
end;
 
 --6- Elimine la función "f_horario" si existe:
if object_id('f_horario') is not null
drop function f_horario;

--7- Cree la función "f_horario" que recibe una fecha (tipo string) y nos retorne la hora y minutos.
create function f_horario
(@fecha varchar(30))
returns varchar(5)
as
begin
declare @nombre varchar(5)
set @nombre='Fecha inválida'   
if (isdate(@fecha)=1)
begin
set @fecha=cast(@fecha as datetime)
set @nombre=rtrim(cast(datepart(hour,@fecha) as char(2)))+':'
set @nombre=@nombre+rtrim(cast(datepart(minute,@fecha) as char(2)))
end--si es una fecha válida
return @nombre
end;

--8- Elimine la función "f_fecha" si existe:
if object_id('f_fecha') is not null
drop function f_fecha;

/*9- Cree la función "f_fecha" que recibe una fecha (tipo string) y nos retorne la fecha (sin hora ni 
minutos)*/
create function f_fecha
(@fecha varchar(30))
returns varchar(12)
as
begin
declare @nombre varchar(12)
set @nombre='Fecha inválida'   
if (isdate(@fecha)=1)
begin
set @fecha=cast(@fecha as datetime)
set @nombre=rtrim(cast(datepart(day,@fecha) as char(2)))+'/'
set @nombre=@nombre+rtrim(cast(datepart(month,@fecha) as char(2)))+'/'
set @nombre=@nombre+rtrim(cast(datepart(year,@fecha) as char(4)))
end
return @nombre
end;

/*10- Muestre todas las consultas del médico llamado 'Alfredo Acosta', incluyendo el día (emplee la 
función "f_nombreDia", la fecha (emplee la función "f_fecha"), el horario (emplee la función 
"f_horario") y el nombre del paciente.*/
select dbo.f_nombredia(fecha) as dia,
dbo.f_fecha(fecha) as fecha,
dbo.f_horario(fecha) as horario,
paciente
from consultas as c
join medicos as m
on m.documento=c.medico
where m.nombre='Alfredo Acosta';

--11- Muestre todos los turnos para el día sábado, junto con la fecha, de todos los médicos.
select fecha, m.nombre
from consultas as c
join medicos as m
on m.documento=c.medico
where dbo.f_nombredia(fecha)='sábado';

--12- Envíe a la función "f_nombreDia" una fecha y muestre el valor retornado:
declare @valor char(30)
set @valor='2007/04/09'
select dbo.f_nombreDia(@valor);


 ------SEGUNDO PROBLEMA--------

if object_id('empleados') is not null
drop table empleados;
create table empleados(
documento char(8) not null,
nombre varchar(30),
fechanacimiento datetime,
fechaingreso datetime,
telefono char(12),
mail varchar(50)
 );

insert into empleados values('22222222', 'Ana Acosta', '1970/10/02', '1995/10/10', '4556677', 'anitaacosta@hotmail.com');
insert into empleados values('25555555', 'Bernardo Bustos', '1973/01/15', '1999/02/15', '4789012', null);
insert into empleados values('30000000', 'Carlos Caseros', '1980/5/25', '2001/05/05', null, null);
insert into empleados values('32222222', 'Estela Esper', '1985/02/20', '2006/12/12', null, 'estelaesper@gmail.com');

if object_id('f_edad') is not null
  drop function f_edad;

create function f_edad
(@fechaactual datetime,
@fecha datetime='2007/01/01'
)
returns tinyint
as
begin
declare @edad tinyint
set @edad=null
if (@fechaactual>=@fecha)
begin
set @edad=datepart(year,@fechaactual)-datepart(year,@fecha)
if (datepart(month,@fecha)>datepart(month,@fechaactual))
set @edad=@edad-1
else 
if (datepart(month,@fecha)=datepart(month,@fechaactual)) and 
(datepart(day,@fecha)>datepart(day,@fechaactual))
set @edad=@edad-1
end--es mayor la actual
return @edad
end;

select nombre, dbo.f_edad(getdate(),fechanacimiento) as edad
from empleados;

select nombre, dbo.f_edad(fechaingreso,fechanacimiento) as 'edad al ingresar',
dbo.f_edad(getdate(),fechaingreso) as 'años de servicio'
from empleados;

select dbo.f_edad(getdate(),'1971/05/25');

select dbo.f_edad();

select dbo.f_edad(getdate(),default);

if object_id('f_valorNulo') is not null
drop function f_valorNulo;

create function f_valorNulo
(@valor varchar(50))
returns varchar(50)
begin
if @valor is null
set @valor='No tiene'
return @valor
end;

select documento,nombre,fechanacimiento,
dbo.f_valorNulo(telefono) as telefono,
dbo.f_valorNulo(mail) as mail
from empleados;


 ------------86 - Funciones de tabla de varias instrucciones--------------

 --1- Elimine la tabvla si existe:
 if object_id('empleados') is not null
 drop table empleados;

 --2- Cree la tabla con la siguiente estructura:
create table empleados(
documento char(8) not null,
apellido varchar(30) not null,
nombre varchar(30) not null,
domicilio varchar(30),
ciudad varchar(30),
fechanacimiento datetime,
constraint PK_empleados
primary key(documento)
);

--3- Ingrese algunos registros:
insert into empleados values('22222222','Acosta','Ana','Avellaneda 123','Cordoba','1970/10/10');
insert into empleados values('23333333','Bustos','Bernardo','Bulnes 234','Cordoba','1972/05/15');
insert into empleados values('24444444','Caseros','Carlos','Colon 356','Carlos Paz','1980/02/25');
insert into empleados values('25555555','Fuentes','Fabiola','Fragueiro 987','Jesus Maria','1984/06/12');

--4- Elimine la función "f_empleados" si existe:
if object_id('f_empleados') is not null
drop function f_empleados;

/*5- Cree una función que reciba como parámetro el texto "total" o "parcial" y muestre, en el primer 
caso, todos los datos de los empleados y en el segundo caso (si recibe el valor "parcial"): el 
documento, apellido, ciudad y año de nacimiento.*/
create function f_empleados
(@opcion varchar(10)
)
returns @listado table
(documento char(8),
nombre varchar(60),
domicilio varchar(60),
nacimiento varchar(12))
as 
begin
if @opcion not in ('total','parcial')
set @opcion='parcial'
if @opcion='total'
insert @listado 
select documento,
(apellido+' '+nombre),
(domicilio+' ('+ciudad+')'), 
cast(fechanacimiento as varchar(12))
from empleados
else
insert @listado
select documento,apellido,ciudad,cast(datepart(year,fechanacimiento) as char(4))
from empleados
return
end;

--6- Llame a la función creada anteriormente enviándole "total".
select *from dbo.f_empleados('total');

--7- Llame a la función anteriormente creada sin enviar argumento.
select *from dbo.f_empleados();

--8- Llame a la función enviándole una cadena vacía.
select *from dbo.f_empleados('');

/*9- Ejecute la función "f_empleados" enviando "parcial" como argumento y recupere solamente los 
registros cuyo domicilio es "Cordoba".*/
select *from dbo.f_empleados('parcial')
 where domicilio='Cordoba';


 ----------87 - Funciones con valores de tabla en línea(EJEMPLO)---------

if object_id('libros') is not null
drop table libros;

create table libros(
codigo int identity,
titulo varchar(40),
autor varchar(30),
editorial varchar(20)
);

insert into libros values('Uno','Richard Bach','Planeta');
insert into libros values('El aleph','Borges','Emece');
insert into libros values('Ilusiones','Richard Bach','Planeta');
insert into libros values('Aprenda PHP','Mario Molina','Nuevo siglo');
insert into libros values('Matematica estas ahi','Paenza','Nuevo siglo');

if object_id('f_libros') is not null
drop function f_libros;

create function f_libros
(@autor varchar(30)='Borges')
returns table
as
return (
select titulo,editorial
from libros
where autor like '%'+@autor+'%'
);

select *from f_libros('Bach');

if object_id('f_libros_autoreditorial') is not null
drop function f_libros_autoreditorial;

create function f_libros_autoreditorial
(@autor varchar(30)='Borges',
@editorial varchar(20)='Emece')
returns table
as
return (
select titulo,autor,editorial
from libros
where autor like '%'+@autor+'%' and
editorial like '%'+@editorial+'%'
);

select *from f_libros_autoreditorial('','Nuevo siglo');

select *from f_libros_autoreditorial(default,default);
