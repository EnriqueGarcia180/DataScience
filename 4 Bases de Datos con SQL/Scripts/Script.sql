# SELECT

# Mandar a llamar cada una de nuestras tablas.

select * from clase1.clientes c ;

select * from clase1.detalles d ;

select * from clase1.ordenes o ;

select * from clase1.productos p ;

# Mandar a llamar tabla clientes, pero con su columna nombre_cliente

select 
c.nombre_cliente
from clase1.clientes c ;

# Seleccionando dos columnas

select
c.nombre_cliente ,
c.telefono_cliente
from clase1.clientes c ;


# FILTROS CON "WHERE"

# De la tabla productos filtrar todos los precios que sean > $500

select * from clase1.productos p where p.precio > 500 ;

# De la tabla productos filtrar todos los precios que sean < $300

select * from clase1.productos p where p.precio < 300 ;

# De la tabla productos filtrar todos los precios que sean = $120

select * from clase1.productos p where p.precio = 120 ;

# De la tabla productos filtrar todos los precios que sean >= $120

select * from clase1.productos p where p.precio >= 120 ;

# De la tabla productos filtrar todos los precios que sean <= $120

select * from clase1.productos p where p.precio <= 120 ;

# De la tabla productos filtrar todos los precios que sean <> $120 (diferente)

select * from clase1.productos p where p.precio <> 120 ;


# AND, OR, WHERE

# Filtrar cliente cuyo nombre sea "Juan Perez" y tenga un correo electronico que contenga "gmail". 
# AND debe cumplir ambas condiciones.


select * 
from clase1.clientes c 
where c.nombre_cliente = "Juan Perez" 
and c.email_cliente like ('%gmail%');

# Filtrar los productos cuyo precio sea mayor a 50 o el stock sea inferior a 10.

select * 
from clase1.productos p
where p.precio > 50
or p.stock < 10 ;

# Filtrar los productos cuyo precio sea igual a 40 o el stock sea superior a 10 y menor a 60.

select * 
from clase1.productos p 
where p.precio = 40
or p.stock > 10 
and p.stock < 60 ;


# NOT

# Niega la operacion, llamar la tabla clientes pero negando el id_cliente = 4

select *
from clase1.clientes c 
where not c.id_clientes = 4 ;

# NOT and AND. De la Tabla clientes quiero negar al cliente con id 4 y al cliente con id 6

select *
from clase1.clientes c 
where not c.id_clientes = 4
and c.id_clientes = 6 ;


# WHERE con IN ()

# Llamar a la tabla cliente y queremos observar nuestros clientes que contengan el 
# id_cliente (2, 1, 8, 16, 18)

select *
from clase1.clientes c 
where c.id_clientes in (2, 1, 8, 16, 18) ;

# WHERE con BETWEEN 

# Llamar tabla clientes, queremos observar a nuestros id_clientes que esten dentro del rango 4 al 10.

select *
from clase1.clientes c 
where c.id_clientes between 4 and 10 ;

# De la tabla clientes devolver todos los nombres que Empiezan con "Juan" (el % va al final)

select *
from clase1.clientes c 
where c.nombre_cliente like ('Juan%') ;

# De la tabla clientes devolver todos los nombres que contangan "Gomez" 
# (el % va al inicio y final para que busque el Gomez por ambos lados)


select *
from clase1.clientes c 
where c.nombre_cliente  like ('%Gomez%') ;

# LIKE 

# Desplegar Nombres con longitud de 12 espacios en el nombre_cliente

select *
from clase1.clientes c 
where c.nombre_cliente  like ('____________') ;

# LIMIT, ASC, DESC

# mostrar los primeros 5 elementos de la tabla productos

select *
from clase1.productos p 
limit 5 ;

# Ordenar de forma Ascendente y Descendente todas las fechas de ordenes de nuestras ordenes

select *
from clase1.ordenes o 
order by o.fecha_orden asc ;

select *
from clase1.ordenes o 
order by o.fecha_orden desc ;


# COUNT, SUM, AVG, MIN, MAX, GROUP BY, HAVING

# Contar el numero de productos disponibles en la tabla de productos

select 
count(*) as total_productos # Agregar una columna nueva
from clase1.productos p ;

# Sumar el total de todas las ordenes

select 
sum(o.total) as total
from clase1.ordenes o ;

# Promedio del precio de los productos

select 
avg(p.precio) as promedio
from clase1.productos p ;

# Precio minimo y maximo de los precios de los productos

select min(p.precio) as precio_minimo
from clase1.productos p ;

select max(p.precio) as precio_maximo
from clase1.productos p ;

# min y max

select
min(p.precio) as precio_minimo,
max(p.precio) as precio_maximo
from clase1.productos p ;


# GROUP BY

# Quiero mostrar el total de ventas por cada cliente

select
o.id_cliente,
sum(o.total) as total_ventas
from clase1.ordenes o 
group by o.id_cliente ;

# Total de stock por producto de nuestra tabla productos y que contenga el nombre del producto y su id

select 
p.nombre_producto ,
p.id_producto ,
sum(p.stock) as total_stock
from clase1.productos p 
group by p.nombre_producto ;

# HAVING

# Filtrar las ventas que sean mayores a 200 para cada cliente

select 
o.id_cliente,
sum(o.total) as total_ventas
from clase1.ordenes o 
group by o.id_cliente
having total_ventas > 200 ; # el having se usa como Filtro, despues del group by

# WHERE

# otro metodo, mismo resultado de arriba. 
# Where va antes de group by
select 
o.id_cliente,
sum(o.total) as total_ventas
from clase1.ordenes o 
where o.total > 200  # el where se usa como Filtro, antes del group by
group by o.id_cliente ;


# INNER JOIN

# Mostrar los detalles de las ordenes con los productos que se han vendido, 
# incluyendo solo los registros donde exista una relacion entre "ordenes" y "detalles"
# Observar la cantidad de productos que se llevo el cliente.

select
o.id_cliente,
c.nombre_cliente,
p.nombre_producto,
d.cantidad,
d.precio_unitario
from clase1.ordenes o 
inner join clase1.clientes c on o.id_cliente = c.id_clientes 
inner join clase1.detalles d on o.id_orden = d.id_orden
inner join clase1.productos p on d.id_producto = d.id_producto ;


# Agrupar por id_orden y nombre_cliente mostrando las columnas id_orden y nombre_cliente 
# y crear la columna de total_orden.
# Crear un reporte donde te diga id_orden, el nombre del cliente y el total que pago por la compra que hizo.

select 
o.id_orden,
c.nombre_cliente,
sum(d.cantidad * d.precio_unitario) as total_orden
from clase1.ordenes o 
inner join clase1.clientes c on o.id_cliente = c.id_clientes
inner join clase1.detalles d on o.id_orden = d.id_orden 
group by o.id_orden, c.nombre_cliente ;

# LEFT JOIN

# Mostrar todas las ordenes y productos y los productos vendidos incluyendo aquellas ordenes que
# no tienen productos asociados.

select 
o.id_cliente,
c.nombre_cliente,
p.nombre_producto,
d.cantidad,
d.precio_unitario
from clase1.ordenes o 
left join clase1.clientes c on o.id_cliente = c.id_clientes
left join clase1.detalles d on o.id_orden = d.id_orden
left join clase1.productos p on d.id_producto = p.id_producto ;



# RIGHT JOIN

# Mostrar todas las ordenes y productos y los productos vendidos incluyendo aquellas ordenes que
# no tienen productos asociados. (mismo que arriba)

select
p.nombre_producto,
c.nombre_cliente,
o.id_orden,
d.cantidad
from clase1.productos p 
right join clase1.detalles d on p.id_producto = d.id_producto 
right join clase1.ordenes o on d.id_orden = o.id_orden
right join clase1.clientes c on o.id_cliente = c.id_clientes ;

# ejercicio: Mostrar la consulta anterior para que solo muestre las ordenes donde el 
# nombre del producto este vacio (null) es decir, aquellas donde el producto 
# no se registro correctamente.

select 
o.id_orden ,
c.nombre_cliente ,
d.cantidad ,
p.nombre_producto
from clase1.productos p 
right join clase1.detalles d on p.id_producto = d.id_producto
right join clase1.ordenes o on d.id_orden = o.id_orden
right join clase1.clientes c on o.id_cliente = c.id_clientes
where p.nombre_producto is null ;

# FULL JOIN

# Mostrar todos los registros de productos y ordenes, incluso si no hay una coincidencia en "detalles"

# Sintaxis para todos excepto MySQL
select 
p.descripcion_producto,
d.cantidad,
d.precio_unitario,
o.id_orden,
c.nombre_cliente 
from clase1.productos p 
full join clase1.detalles d on p.id_producto = d.id_producto # Error esperado porque MySQL no funciona con full JOIN
full join clase1.ordenes o on d.id_orden = o.id_orden
full join clase1.clientes c on o.id_cliente = c.id_clientes ;

# UNION

# ver como une las dos tablas, al inicio son nombres y despues son productos en la misma columna.
select
c.nombre_cliente 
from clase1.clientes c 
union
select 
p.nombre_producto
from clase1.productos p ;


# Sintaxis para MySQL mediante el uso de UNION para full join
select 
p.nombre_producto ,
d.cantidad,
d.precio_unitario,
o.id_orden,
c.nombre_cliente 
from clase1.productos p 
left join clase1.detalles d on p.id_producto = d.id_producto
left join clase1.ordenes o on d.id_orden = o.id_orden
left join clase1.clientes c on o.id_cliente = c.id_clientes 
union
select 
p.nombre_producto,
d.cantidad,
d.precio_unitario,
o.id_orden,
c.nombre_cliente 
from clase1.productos p 
right join clase1.detalles d on p.id_producto = d.id_producto
right join clase1.ordenes o on d.id_orden = o.id_orden
right join clase1.clientes c on o.id_cliente = c.id_clientes ;


# SAVE TO *.CSV

# nota este export no incluye los nombres de las columnas
select *
from clase1.productos p 
into outfile 'C:/Users/egarcia/Desktop/AXM_Courses/Data Science/4 Bases de Datos con SQL/productos.csv'
Fields terminated by ','
enclosed by '"'
lines terminated by '\n' ;

# Metodo agregando Nombres de Columnas Columnas
(
	select 'id_producto', 'nombre_producto', 'descripcion_producto', 'pecio', 'stock'
)
union all
(
	select p.id_producto, p.nombre_producto, p.descripcion_producto, p.precio, p.stock 
	from clase1.productos p
)
into outfile 'C:/Users/egarcia/Desktop/AXM_Courses/Data Science/4 Bases de Datos con SQL/productos2.csv'
Fields terminated by ','
enclosed by '"'
lines terminated by '\n' ;



# INSERTAR, CREAR Y ELIMINAR

# Insertar un nuevo cliente en la tabla clientes.

# INSERT INTO

insert into clase1.clientes (id_clientes, nombre_cliente, email_cliente, direccion_cliente, telefono_cliente)
values 
	(31, 'Enrique Garcia', 'garcia.enrique.mas@gmail.com', 'casa numero 1000', '123123234') ;

# confirmar
select * 
from clase1.clientes c
where c.id_clientes = 31 ;

# insertar varios registros
insert into clase1.clientes (id_clientes, nombre_cliente, email_cliente, direccion_cliente, telefono_cliente)
values 
	(32, 'Josefina Garcia', 'garcia.enrique.mas@gmail.com', 'casa numero 1000', '123123234') ,
	(33, 'Enrique Perez', 'garcia.enrique.mas@gmail.com', 'casa numero 1000', '123123234') ,
	(34, 'Bertha Garcia', 'garcia.enrique.mas@gmail.com', 'casa numero 1000', '123123234') ,
	(35, 'Enrique Pirita', 'garcia.enrique.mas@gmail.com', 'casa numero 1000', '123123234') ,
	(36, 'Ana Gomez' , 'ana.gomez@gamil.com', 'calle falsa 456', '612345678'),
	(37, 'Luis Martinez' , 'luismartinez@gamil.com', 'calle falsa 859', '612345677'),
	(38, 'Carlos Perez' , 'carlos.perez@gamil.com', 'calle falsa 789', '612345675'),
	(39, 'Marta Lopez' , 'marta.lopez@gamil.com', 'calle falsa 568', '612345673') ;

# confirmar
select * from clase1.clientes c
where c.id_clientes > 31 ;

# Actividad: agregar un producto
insert into clase1.productos (id_producto, nombre_producto, descripcion_producto, precio, stock)
values
	(31, 'Laptop', 'Laptop de 15 pulgadas', 500.00, 20) ;
# confirmar
select * from clase1.productos p
where id_producto > 30;


# UPDATE

# Actualizar el correo electronico de un cliente
# juan.perez@gmail -> juan.perez@outlook.com
update clase1.clientes c 
set email_cliente = 'juan.perez@outlook.com'
where id_clientes = 1 ;      # porque juan perez tiene id_clientes = 1

# confirmar
select * from clase1.clientes c
where id_clientes = 1 ;



# DELETE

# Eliminar un cliente 
delete from clase1.clientes 
where id_clientes = 3;

# confirmar
select * from clase1.clientes c;



# ALTER TABLE

# Agregar una columna a una tabla

# Agregar una columna "fecha_nacimiento" a nuestra tabla "clientes"
alter table clase1.clientes 
add fecha_nacimiento Date ;

# confirmar
select * from clase1.clientes c;



# DISTINCT

# Mostrar valores Distintos
select distinct 
p.nombre_producto 
from clase1.productos p ;


# DESCRIBE
# Descripcion de la tabla clientes

describe clase1.clientes ;


# PRIMARY KEY

# Convertir id_clientes a primary key en la tabla clientes 

# Cambiamos el tipo a - not null -
alter table clase1.clientes modify id_clientes int(11) not null ;

# confirmar
describe clase1.clientes ;

show create table clase1.clientes ;

# Convertir la columna de id_clientes como llave primaria

alter table clase1.clientes add primary key (id_clientes);

# confirmar
describe clase1.clientes ;

# si sale un ERROR quiere decir que por el ejercicio de arriba que agregamos id duplicados 
# no deja crear la columna id_clientes como llave primaria por lo mismo de los duplicados.
# entonces borrar las filas duplicadas, ejemplo el id 31:
		## Eliminar un cliente 
		# 	delete from clase1.clientes 
		# 	where id_clientes = 31;
		## confirmar
		# 	select * from clase1.clientes c;
# o porque ya hay una columna definida como llave primaria.


# CREATE TABLE
# Crear tabla historial_clientes

create table clase1.historial_clientes (
	id_historial INT primary key auto_increment, # La primera columna es la llave primaria
	id_cliente INT not null, # Esta sera la llave secundaria que usaremos para relacionar con la tabla clientes
	fecha_historial date not null,
	detalle_historial text,
	foreign key (id_cliente) references clase1.clientes(id_clientes) # Vamos a definir la relacion de la tabla historial_clientes con la tabla clientes	
);

# Confirmar creacion de la tabla
select * from  clase1.historial_clientes hc ;

describe clase1.historial_clientes ;


#DROP
# Para borrar tablas:

# como cree muchas tablas de historial_clientes: historial_clientes1, historial_clientes2, historial_clientes3
# ahora hay que borrarlas.
	-- drop table clase1.historial_clientes1 ;
	-- drop table clase1.historial_clientes2 ;
	-- drop table clase1.historial_clientes3 ;
	-- 
	-- # Confirmar eliminacion de las tablas
	-- select * from  clase1.historial_clientes1 ;
	-- select * from  clase1.historial_clientes2 ;
	-- select * from  clase1.historial_clientes3 ;





# Ejercicios:

# de la tabla clientes vamos a seleccionar las columnas de nombre_cliente, observamos todos nuestros clientes
select 
c.nombre_cliente 
from clase1.clientes c ;

# observamos si no hay datos nulos en nuestra tabla clientes y la columna nombre_cliente
select *
from clase1.clientes c
where c.nombre_cliente is null ;

select 
c.nombre_cliente 
from clase1.clientes c
where c.nombre_cliente is null ;

# contar cuantos clientes tenemos
select 
count(*) as total_clientes
from clase1.clientes c ;

# de la tabla detalles vamos a observar nuestro precio_unitario maximo
select 
max(d.precio_unitario) as precio_unitario_maximo
from clase1.detalles d ;

# hacemos lo mismo pero con el precio_unitario minimo
select 
min(precio) as precio_unitario_minimo, 
nombre_producto
from clase1.productos p ;

# que producto es el mas caro?
select 
max(precio) as precio_unitario_maximo, 
nombre_producto
from clase1.productos p ;

# cuanto stock tenemos del id_producto 6
select 
sum(p.stock) as stock_total
from clase1.productos p
where p.id_producto = 6 ;





# PRIMARY KEY

# Convertir id_orden a primary key en la tabla ordenes 

# Descripcion de la tabla clientes
describe clase1.ordenes ;

# Cambiamos el tipo de not null
alter table clase1.ordenes modify id_orden int(11) not null ;

# confirmar
describe clase1.ordenes ;

show create table clase1.ordenes ;

# Convertir la columna de id_clientes como llave primaria

alter table clase1.ordenes add primary key (id_orden);

# confirmar
describe clase1.ordenes ;

# Crear una tabla de envios

create table clase1.envios (
	id_envio int primary key auto_increment,
	id_orden int not null,
	direccion_envio varchar(225) not null,
	empresa_envio varchar(100),
	numero_guia varchar(100),
	fecha_envio date,
	fecha_entrega_estimada date,
	estado_envio varchar(50),
	# Vamos a definir la relacion de la tabla envios con la tabla ordenes
	foreign key (id_orden) references clase1.ordenes(id_orden) 
);

# confirmar
select * from clase1.envios;


# 1

insert into clase1.envios 
	# id_envio, no lo agregamos porque ya tiene el auto_increment	
	(id_orden,direccion_envio,empresa_envio,numero_guia, fecha_envio,fecha_entrega_estimada,estado_envio)
values
	(1, 'Avenida siempre viva 742, sringfield','Fedex','FX-123456789',null,'2025-05-12','En transito') ;

insert into clase1.envios 
	# id_envio, no lo agregamos porque ya tiene el auto_increment	
	(id_orden,direccion_envio,empresa_envio,numero_guia, fecha_envio,fecha_entrega_estimada,estado_envio)
values
	(2,'Calle Luna 456, Ciudad de México','DHL','DHL-20250508','2025-05-08','2025-05-10','Entregado'),
	(3,'Boulevard Central 999, Bogotá','ups','ups-00112233',null,null,'Pendiente'),
	(4,'carrera 7 #85-52, Medellín','Servientrega','SENT-548712365','2025-05-05','2025-05-08','Retrasado'),
	(5,'Calle Libertad 456, Buenos Aires','DHL','DHL-987654321','2025-05-06','2025-05-09','En tránsito'),
	(6,'Avenida 9 de Julio 1234, Ciudad de México','FedEx','FX-11223344','2025-05-04','2025-05-06','Entregado'),
	(7,'Calle Falsa 789, Lima','UPS','UPS-33445566','2025-05-07','2025-05-10','Pendiente'),
	(8,'Calle del Sol 101, Quito','DHL','DHL-9988776655',null,null,'Retrasado'),
	(9,'Avenida del Parque 234, Santiago','Correos Chile','CC-123456789','2025-05-05','2025-05-08','En tránsito'),
	(10,'Calle Río Amazonas 56, Bogotá','Cargamos','CG-678945321',null,null,'Pendiente'),
	(11,'Calle del Lago 24, Caracas','Amazon Logistics',null,'2025-05-01','2025-05-04','Entregado') ;


select * from clase1.envios ;

# como cree muchas tablas de envios: envios1, envios2, envios3
# ahora hay que borrarlas.
	-- drop table clase1.envios1 ;
	-- drop table clase1.envios2 ;
	-- drop table clase1.envios3 ;
	-- 
	-- # Confirmar eliminacion de las tablas
	-- select * from  clase1.envios1 ;
	-- select * from  clase1.envios2 ;
	-- select * from  clase1.envios3 ;


# IS NULL

# observar si hay un null en fecha_entrega_estimada

select * 
from clase1.envios e
where e.fecha_entrega_estimada is null ;

# observar si hay un null en fecha_envio
select *
from clase1.envios e
where e.fecha_envio is null ;

# observar si hay un null en estado_envio
select *
from clase1.envios e
where e.estado_envio is null ;

# observar si hay un null en empresa_envio
select *
from clase1.envios e 
where e.empresa_envio is null ;

# observar si hay un null en numero_guia
select *
from clase1.envios e 
where e.numero_guia is null ;



# LIMPIAR NULLs

# Si los null representan <= 10% de los datos los podemos eliminar, si no si debemos completar la informacion.

# UPDATE 

# Opcion 1 - (Reemplazar NULL con algun dato)

update clase1.envios e 
set numero_guia = 'Desconocido'
where e.numero_guia is null ;

# confirmar
select e.numero_guia from clase1.envios e ;


# Reemplazar NULL en fecha_envio, colocar 2025-01-01
update clase1.envios e 
set fecha_envio = '2025-01-01'
where e.fecha_envio is null ;

# confirmar
select e.fecha_envio 
from clase1.envios e 
where e.fecha_envio = '2025-01-01';

# Reemplazar NULL en fecha_entrega_estimada, colocar 2025-01-01
update clase1.envios e 
set fecha_entrega_estimada = '2025-01-01'
where e.fecha_entrega_estimada is null ;

# confirmar
select e.fecha_entrega_estimada
from clase1.envios e 
where e.fecha_entrega_estimada = '2025-01-01' ;


# Opcion 2 (Eliminar todas las filas que contengan NULL en cualquier campo clave)
# como ya eliminamos arriba los NULLs no veremos cambio aqui pero se puede probar
# agregando un registro con NULL.

delete from clase1.envios 
where fecha_entrega_estimada is null
	or fecha_envio is null 
	or numero_guia is null ;

# confirmar
select * from clase1.envios e ;




# SUBCONSULTAS

# mostrar los productos cuyo precio sea mayor al precio promedio

# Opcion 1: SELECT - SELECT

select 
p.nombre_producto, 
p.precio
from clase1.productos p 
where p.precio > (
	select avg(precio)
	from clase1.productos p2 ) ;

# Opcion 2: Inner JOIN

select 
p.nombre_producto,
p.precio
from clase1.productos p 
join (    					# <- inner join por default
	select avg(precio) as precio_promedio
	from clase1.productos p 
	) avg_resultado    		# <- nombramos el objeto
	on p.precio > avg_resultado.precio_promedio ;

# Opcion 3: WITH

with promedio_precio as (			# <- with nos ayuda a poder tener mas de una operacion
	select avg(precio) as precio_promedio 
	from clase1.productos p 
)
select 
p.nombre_producto,
p.precio
from clase1.productos p 
join promedio_precio
on p.precio > promedio_precio.precio_promedio ;




# CASE - WHEN - ELSE (condicionales en select)

# mostrar el estado del stock en palabras.
select
p.nombre_producto,
p.stock,
case 
	when p.stock = 0 then 'Sin Stock'
	when p.stock < 60 then 'Bajo Stock'
	else 'Stock Suficiente'
end as estado_stock
from clase1.productos p ;



 # VIEWS

# crear una vista con las ventas por cliente
create view clase1.ventas_por_cliente as 
select
	o.id_orden,
	c.nombre_cliente,
	sum(o.total) as total_ventas
from clase1.ordenes o 
join clase1.clientes c on o.id_cliente = c.id_clientes
group by o.id_cliente, c.nombre_cliente ;


# para Llamarla
select * from clase1.ventas_por_cliente vpc ; #<- llamar a la VIEW como si fuera una tabla

# para obtener algun dato en particular i.e. ventas del id_orden = 1
select * from clase1.ventas_por_cliente vpc
where vpc.id_orden = 1 ;




# Ejercicio usando JOIN, GROUP BY, ORDER BY, LIMIT


# Top productos mas vendidos, el producto que mas se vende y ordenado descendentemente.
# ver unicamente la sprimeras 5 filas
# donde se observe la columna de nombre_producto y el total vendido
select
p.nombre_producto,
sum(d.cantidad) as total_vendido
from clase1.detalles d 
join clase1.productos p on d.id_producto = p.id_producto
group by p.nombre_producto
order by total_vendido desc
limit 5 ;

# Clientes con mas compras, ordenando desc y viendo las primeras 5 filas.
# nombre_cliente, total_compras
select
c.nombre_cliente,
count(o.id_orden) as total_compras
from clase1.ordenes o 
join clase1.clientes c on o.id_cliente = c.id_clientes
group by c.nombre_cliente
order by total_compras desc 
limit 5 ;
