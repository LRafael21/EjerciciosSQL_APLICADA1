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

--------- 65 - Trabajar con varias tablas (EJEMPLO)-----------

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

---------66 - Combinación interna (inner join)------------------

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

--------- 67 - Combinación externa izquierda (left join)-------

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


--68 - Combinación externa derecha (right join)

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


-------69 - Combinación externa completa (full join)-----------

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

-------70 - Combinaciones cruzadas (cross join)-------------------

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

------ 73 - Combinación de más de dos tablas------------

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

---------74 - Combinaciones con update y delete(EJEMPLO)---------------

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

-----------------75 - Clave foránea (TEORIA)-------------

/*Las claves foráneas y las claves primarias deben ser del mismo tipo para poder enlazarse. Si modificamos una, debemos modificar la otra para que los valores se correspondan.

Cuando alteramos una tabla, debemos tener cuidado con las claves foráneas. Si modificamos el tipo, longitud o atributos de una clave foránea, ésta puede quedar inhabilitada para hacer los enlaces.

Entonces, una clave foránea es un campo (o varios) empleados para enlazar datos de 2 tablas, para establecer un "join" con otra tabla en la cual es clave primaria.*/





