############
# clase2
############

# Primero, creamos una base de datos, "clase2"
create database clase2;
# o por medio de right click en Databases -> Create New Database


# Va a contener 3 tablas:

# products:
# id_producto tipo entero y que sea la llave primaria, nombre tipo varchar(100), precio decimal(10,2), stock entero
create table clase2.products (
	id_producto INT primary key,
	nombre varchar(100),
	precio decimal (10,2),
	stock int
);

# clients: 
# id_cliente tipo entero y que sea la llave primaria, nombre varchar(100), email varchar(100)
create table clase2.clients(
	id_cliente int primary key,
	nombre varchar(100),
	email varchar(100)
);

# sales: 
# id_venta tipo entero y sera la llave primaria, id_cliente tipo entero, id_producto tipo entero, cantidad tipo entero, fecha tipo date
# llave foranea: id_cliente hace referencia a la tabla clients(id_cliente)
# llave foranea: id_producto hace referencia a la tabla products(id_producto)
create table clase2.sales(
	id_venta int primary key,
	id_cliente int,
	id_producto int,
	cantidad int,
	fecha date,
	foreign key (id_cliente) references clients(id_cliente),
	foreign key (id_producto) references products(id_producto)
);


#insertar los siguientes datos. 
#Tabla products
insert into clase2.products 
	(id_producto, nombre, precio, stock)
values
	(1, 'Laptop', 1200.00, 10),
	(2, 'Mouse', 25.00, 50),
	(3, 'Teclado', 45.00, 30),
	(4, 'Monitor', 250.00, 20),
	(5, 'Impresora', 150.00, 15),
	(6, 'Tablet', 300.00, 25),
	(7, 'Auriculares', 60.00, 40),
	(8, 'Webcam', 80.00, 18),
	(9, 'Silla Ergonómica', 200.00, 12),
	(10, 'Router WiFi', 100.00, 22);

#clients 
insert into clase2.clients 
	(id_cliente, nombre, email)
values
	(1, 'Ana López', 'ana@example.com'),
	(2, 'Juan Pérez', 'juan@example.com'),
	(3, 'Lucía Martínez', 'lucia@example.com'),
	(4, 'Carlos Gómez', 'carlos@example.com'),
	(5, 'Laura Díaz', 'laura@example.com'),
	(6, 'Miguel Torres', 'miguel@example.com'),
	(7, 'Sofía Herrera', 'sofia@example.com');
#sales
insert into clase2.sales 
	(id_venta, id_cliente, id_producto, cantidad, fecha)
values
	(1, 1, 1, 1, '2024-06-01'),
	(2, 2, 2, 2, '2024-06-03'),
	(3, 1, 3, 1, '2024-06-04'),
	(4, 3, 4, 1, '2024-06-05'),
	(5, 4, 5, 1, '2024-06-05'),
	(6, 5, 2, 3, '2024-06-06'),
	(7, 1, 6, 1, '2024-06-07'),
	(8, 2, 7, 2, '2024-06-07'),
	(9, 6, 3, 2, '2024-06-08'),
	(10, 7, 1, 1, '2024-06-08'),
	(11, 3, 8, 1, '2024-06-09'),
	(12, 5, 9, 1, '2024-06-10'),
	(13, 4, 10, 1, '2024-06-10'),
	(14, 2, 2, 1, '2024-06-10'),
	(15, 1, 5, 1, '2024-06-11');


# Ejercicio:

# de la tabla products observar todos los productos
select * from clase2.products;

# de la tabla de ventas y la tabla de prodcutos sacar el total general de ventas.
select 
SUM(s.cantidad * p.precio) as total_ventas
from clase2.sales s
join clase2.products p on s.id_producto = p.id_producto;

# cantidad de ventas realizadas por día.
select 
fecha, 
COUNT(*) AS cantidad_ventas
from clase2.sales
group by fecha
order by fecha ;

# reporte de stock disponible, observar todo el el producto y la cantidad.
select 
p.nombre, 
p.stock 
from clase2.products p ;

# ver productos con precio mayor a 100
select 
p.nombre, 
p.precio 
from clase2.products p 
where p.precio > 100 ;

# ver todos los clientes
select 
c.nombre
from clase2.clients c ;

# ver todas las ventas ordenadas por fecha en forma ascendente.
select *
from clase2.sales
order by fecha asc;

# contar cuantos productos hay registrados
select
count(*) as total_productos
from clase2.products;

# contar cuantos clientes hay.
select
count(*) as total_clientes
from clase2.clients;

# Mostrar todas las ventas del cliente con id 1
select *
from clase2.sales s 
where s.id_cliente = 1 ;
# o sin incluir la columna de id_cliente
select 
s.id_venta, 
s.id_producto, 
s.cantidad, 
s.fecha
from clase2.sales s 
where s.id_cliente = 1 ;

# ver el precio promedio de los productos
select avg(p.precio) as precio_promedio
from clase2.products p ; 

# sumar todo el stock disponible
select sum(p.stock) as total_stock
from clase2.products p ;

# producto mas caro
select p.nombre, p.precio
from clase2.products p 
order by p.precio desc
limit 1;

# producto mas barato
select p.nombre, p.precio
from clase2.products p 
order by p.precio asc
limit 1;




### ACTUALIZAR

# UPDATE

# Actualizar el correo electronico de un cliente
# 1, Ana López, por 'ana@gmail.com'

update clase2.clients c 
set email = 'ana@gmail.com'
where nombre = 'Ana López' ;
#or
update clase2.clients c 
set email = 'ana@gmail.com'
where id_cliente = 1;

# verificamos el cambio
select * 
from clase2.clients c 
where c.nombre = 'Ana López';


# cambiar el precio de la Impresora por $180
update clase2.products p 
set precio = 180
where nombre = 'Impresora' ;

# consultamos que haya cambiado el precio
select *
from clase2.products p 
where p.nombre = 'Impresora';


# actualizar el precio de la "Tablet" (id 6) a $320
update clase2.products p 
set precio = 320
where id_producto = 6 ;

select *
from clase2.products p 
where p.id_producto = 6;

# actualizar el precio del "Teclado" (id 3) a $50
update clase2.products p 
set precio = 50
where id_producto = 3 ;

select *
from clase2.products p 
where p.id_producto = 3 ;



# AGREGAR

# Agregar un cliente
# 8, Diego Ramírez, diego.ramirez@gamil.com
insert into clase2.clients values
(8, 'Diego Ramírez', 'diego.ramirez@gamil.com');
#or
insert into clase2.clients (id_cliente, nombre, email)
values (9, 'Diego Ramírez', 'diego.ramirez@gamil.com');

# confirmar que se agrego el cliente
select *
from clase2.clients c 
where c.id_cliente > 7 ;

# Agregar un producto
# 11, Impresora Láser, 250, 10
insert into clase2.products values
(11, 'Impresora Láser', 250, 10);
#or
insert into clase2.products (id_producto, nombre, precio, stock)
values (12, 'Impresora Láser', 250, 10);

# verificamos
select *
from clase2.products p 
where p.id_producto > 10 ;

# Agregamos una Venta
insert into clase2.sales values
(16,2,11,1,'2024-06-15');
#or
insert into clase2.sales (id_venta, id_cliente, id_producto, cantidad, fecha)
values (17,2,11,1,'2024-06-15');

select *
from clase2.sales s 
where s.id_venta > 15;


######################################################
# Pendiente... 

# ELIMINAR

# Eliminar el cliente con ID 7

delete from clase2.clients c
where c.id_cliente = 7 ;	#<- no se pudo porque id_cliente es a su vez foreign key en tabla ordenes


# verificar


# Eliminar el producto con ID 4 de la tabla productos

# verificar

# Eliminar la venta con ID 12 de tabla ventas

# verificamos

###################################################




# JOINTS

# Total gastado por cada cliente
select 
c.nombre AS cliente,
SUM(s.cantidad * p.precio) as total_gastado
from clase2.sales s
inner join clase2.clients c  on s.id_cliente = c.id_cliente
inner join clase2.products p  on s.id_producto = p.id_producto
group by c.nombre
order by total_gastado desc;


# Cantidad total de productos vendidos (por producto), 
# incluye a los clientes aunque no hayan hecho ninguna venta (tip por eso usamos LEFT join).
select 
p.nombre as Producto,
c.nombre as Cliente,
sum(s.cantidad * p.precio) as Total_Vendido
from clase2.clients c 
left join clase2.sales s on c.id_cliente = s.id_cliente
left join clase2.products p on s.id_producto = p.id_producto
group by c.nombre
order by total_vendido desc ;


# ver todas las ventas con nombre de cliente y producto
select
s.id_venta ,
c.nombre as Cliente,
p.nombre as Producto,
s.cantidad,
s.fecha
from clase2.sales s
inner join clase2.clients c on s.id_cliente = c.id_cliente
inner join clase2.products p on s.id_producto = p.id_producto
order by s.fecha asc ;


# calcular el total vendido por cliente
select 
c.nombre as Cliente,
sum(s.cantidad * p.precio) as Total_Vendido
from clase2.clients c 
inner join clase2.sales s on c.id_cliente = s.id_cliente
inner join clase2.products p on s.id_producto = p.id_producto
group by c.nombre
order by total_vendido desc ;
# or
select 
c.nombre as Cliente,
sum(s.cantidad * p.precio) as Total_Vendido
from clase2.sales s 
inner join clase2.clients c on s.id_cliente = c.id_cliente
inner join clase2.products p on s.id_producto = p.id_producto
group by c.nombre
order by total_vendido desc ;


# Productos mas vendidos
select 
p.nombre as Producto,
sum(s.cantidad) as cantidas_vendidos
from clase2.sales s
inner join clase2.products p on s.id_producto = p.id_producto
group by p.nombre
order by cantidas_vendidos desc ;




# SUBCONSULTAS


# Ventas con detalle de cliente y producto
# mostrar todas las ventas con el nombre del cliente y producto
# usar with()
with ventas_con_detalle as (
	select
	s.id_venta ,
	c.nombre as nombre_cliente,
	p.nombre as nombre_producto,
	s.cantidad,
	s.fecha,
	p.precio,
	(s.cantidad * p.precio) as total
	from clase2.sales s 
	inner join clase2.clients c on s.id_cliente = c.id_cliente
	inner join clase2.products p on s.id_producto = p.id_producto 
	)
select * from ventas_con_detalle ;

# Clientes que han comprado mas de un producto distinto
# lista de clientes con la cantidad de productos diferentes que han comprado
with productos_por_cliente as (
	select
	s.id_cliente,
	count(distinct s.id_producto) as productos_distintos
	from clase2.sales s 
	group by s.id_cliente
)
select 
c.nombre,
c.email,
ppc.productos_distintos
from productos_por_cliente ppc
inner join clase2.clients c on ppc.id_cliente = c.id_cliente
where ppc.productos_distintos > 1 ;

# Obtener el Total Vendido por producto
# total de ingresos generados por cada producto (el "por cada" nos da una pista de que hay que usar "group by")
with ventas_por_producto as (
	select
	s.id_producto,
	(s.cantidad * p.precio) as total_vendido
	from clase2.sales s 
	inner join clase2.products p on s.id_producto = p.id_producto
	group by s.id_producto
)
select
p.id_producto ,
p.nombre as nombre_producto,
vpp.total_vendido
from ventas_por_producto vpp
inner join clase2.products p on vpp.id_producto = p.id_producto ;

# Clientes que no han hecho compras
# clientes que no aparecen en la tabla de Sales
select 
	c.nombre,
	c.email
from clase2.clients c 
left join clase2.sales s on s.id_cliente = c.id_cliente
where s.id_venta is null;


# la misma consulta de arriba, pero con with
with clientes_sin_venta as (
	select 
		c.nombre,
		c.email
	from clase2.clients c 
	left join clase2.sales s on s.id_cliente = c.id_cliente
	where s.id_venta is null
)
select * from clientes_sin_venta ;

# Clientes que han comprado mas de un producto diferente 
# usando "where - in"
select
c.nombre,
c.email
from clase2.clients c 
where c.id_cliente in(
	select
	s.id_cliente
	from clase2.sales s
	group by s.id_cliente
	having count(distinct s.id_producto) > 1
);

# join + subconsulta
# Porducto mas vendido por cantidad total
select 
p.nombre
from clase2.products p 
join (
	select
	s.id_producto,
	sum(s.cantidad) as total_vendido
	from clase2.sales s 
	group by s.id_producto
	order by total_vendido desc
	limit 1
) as ventas on p.id_producto = ventas.id_producto ;




# SUBCONSULTA CORRELACIONADA (select - select)

# Productos con su stock y total vendido
select 
	p.nombre,
	p.stock,
	(select sum(s.cantidad)
	from clase2.sales s
	where s.id_producto  = p.id_producto) as total_vendido
from clase2.products p ;

# Productos que NO han sido vendidos nunca.
select
p.id_producto,
p.nombre as nombre_producto
from clase2.products p 
where p.id_producto not in(
	select
	distinct s.id_producto 
	from clase2.sales s 	
);

# Extraer el mes y mostrar su nombre
select
year(s.fecha) as anio,
MONTHNAME(s.fecha) as mes,
count(*) as total_ventas
from clase2.sales s 
group by anio , mes 
order by anio, month(s.fecha) ;

# para cambiar el mes a Espaniol
set lc_time_names = 'es_ES';


# Clasificar las ventas segun la cantidad comprada
	# cantidad = 1 'Baja'
	# cantidad entre 2 y 5 'Media'
	# cantidad > 5 'Alta'
select
s.id_venta,
s.cantidad,
case
	when s.cantidad = 1 then 'Baja'
	when s.cantidad between 2 and 5 then 'Media'
	when s.cantidad > 5 then 'Alta'
	else 'Sin clasificar'
end as categoria_venta
from clase2.sales s ;

# Supongamos que de Junio a Agosto es temporada alta, Etiquetar meses como "Temporada Alta" o "Temporada Baja"
select
s.fecha,
month(s.fecha) as mes,
case
	when month(s.fecha) in (6, 7, 8) then 'Temporada Alta'
	else 'Temporada Baja'
end tipo_temporada
from clase2.sales s ;


# Clasificar clientes segun total de compras (usando subconsulta o CTE) 3-cliente_premium, 1-2-cliente_frequente, 0-cliente_Ocasional
select
s.id_cliente,
sum(s.cantidad) as total_comprado,
case
	when sum(s.cantidad) > 3 then 'Cliente Premium'
	when sum(s.cantidad) between 1 and 2 then 'Cliente Frecuente'
	else 'Cliente Ocasional'
end as categoria_cliente
from clase2.sales s 
group by s.id_cliente ;

# Usan JOIN para obtener el listado de Ventas con nombres de cliente y producto
select
s.id_venta,
c.nombre as nombre_cliente,
p.nombre as nombre_producto,
s.cantidad,
s.fecha 
from clase2.sales s 
join clase2.clients c on s.id_cliente = c.id_cliente
join clase2.products p on s.id_producto = p.id_producto ;

# Clientes que han comprado mas de $500 pesos
select
c.nombre as nombre_cliente,
sum(s.cantidad * p.precio) as total_comprado
from clase2.sales s 
join clase2.clients c on s.id_cliente = c.id_cliente
join clase2.products p on s.id_producto = p.id_producto
group by c.id_cliente, c.nombre
having sum(s.cantidad * p.precio) > 500;

# Stock Restante despues de todas las ventas
select
p.nombre,
p.stock - coalesce((  # coalesce: combine (elements) in a mass or whole.
	select sum(s.cantidad)
	from clase2.sales s 
	where s.id_producto = p.id_producto
	), 0) as stock_restante
from clase2.products p ;

# Extraer el anio
select
year(s.fecha) as anio
from clase2.sales s ;

# Contar Ventas por anio
select
year(s.fecha) as anio,
count(*) as total_ventas
from clase2.sales s 
group by year(s.fecha)
order by anio ;

# Usar JOIN para obtener el total gastado por cliente
select
c.id_cliente,
c.nombre as nombre_cliente,
sum(s.cantidad * p.precio) as total_gastado
from clase2.sales s 
join clase2.clients c on s.id_cliente = c.id_cliente
join clase2.products p on s.id_producto = p.id_producto
group by c.id_cliente, c.nombre
order by total_gastado desc ;

# Ventas entre dos fechas especificadas
select
s.id_venta,
c.nombre as nombre_cliente,
p.nombre as producto,
s.cantidad,
s.fecha
from clase2.sales s 
join clase2.clients c on s.id_cliente = c.id_cliente
join clase2.products p on s.id_producto = p.id_producto
where s.fecha between '2024-06-05' and '2024-06-10' 
order by s.fecha;

# Agregar datos a la tabla de historia_clientes
insert into clase1.historial_clientes(id_cliente, fecha_historial, detalle_historial)
values
	(1, '2024-03-01', 'Cliente registrado en el sistema'),
	(2, '2024-03-05', 'Cliente realizo su primera compra'),
	(10, '2024-03-10', 'Cliente solicito cambio de direccion'),
	(1, '2024-04-01', 'Cliente actualizo metodo de pago'),
	(4, '2024-04-07', 'Cliente dejo una resenia positiva'),
	(5, '2024-04-10', 'Cliente reporto un problema con su pedido'),
	(2, '2024-04-15', 'Cliente solicito reembolso'),
	(11, '2024-04-20', 'Cliente realizo segunda compra'),
	(1, '2024-05-01', 'Cliente participo en campania promocional'),
	(5, '2024-05-15', 'Cliente eliminado por inactividad') ;

# Unir historial_clientes con clientes
select
hc.id_historial,
hc.fecha_historial,
hc.detalle_historial,
c.id_clientes,
c.nombre_cliente,
c.email_cliente,
c.direccion_cliente,
c.telefono_cliente
from clase1.historial_clientes hc 
join clase1.clientes c on hc.id_cliente = c.id_clientes
order by hc.fecha_historial;

# Join con condicional, detalle del historial de "Juan Perez"
select 
hc.id_historial,
hc.fecha_historial,
hc.detalle_historial,
c.nombre_cliente
from clase1.historial_clientes hc 
join clase1.clientes c on hc.id_cliente = c.id_clientes 
where c.nombre_cliente = "Juan Perez" ;

# Join con condicional filtrado por fecha
select 
hc.id_historial,
hc.fecha_historial,
hc.detalle_historial,
c.nombre_cliente
from clase1.historial_clientes hc 
join clase1.clientes c on hc.id_cliente = c.id_clientes 
where hc.fecha_historial between '2024-04-01' and '2024-05-01' ;

# Cantidad de eventos por cliente
select
c.nombre_cliente,
count(hc.id_historial) as cantidad_eventos
from clase1.historial_clientes hc 
join clase1.clientes c on hc.id_cliente = c.id_clientes 
group by c.id_clientes , c.nombre_cliente
order by cantidad_eventos desc ;

# Ultimo evento de cada cliente
select
hc.id_cliente ,
c.nombre_cliente,
hc.fecha_historial ,
hc.detalle_historial 
from clase1.historial_clientes hc 
join clase1.clientes c on hc.id_cliente = c.id_clientes 
where hc.fecha_historial = (
	select max(hc2.fecha_historial)
	from clase1.historial_clientes hc2 
	where hc2.id_cliente = hc.id_cliente 
) ;




############
#   TRIGGERS

-- 	CREATE TRIGGER trigger_name
-- 	[BEFORE | AFTER] [INSERT | UPDATE | DELETE]
-- 	ON table_name
-- 	FOR EACH ROW
-- 	BEGIN
-- 	    -- SQL statements
-- 	END;

############

# Paso 1: Primero tenemos que crear una tabla donde se guardaran todos los cambios de Auditorias
create table clase2.historial_cambios(
	id_historial int auto_increment primary key,
	id_venta int,
	cantidad_antes int,
	cantidad_despues int,
	fecha_cambio timestamp default current_timestamp()
) ;

# Paso 2: Crear el Trigger
delimiter $$
create trigger trigger_cantidad_update
after update on sales
for each row
begin
	if old.cantidad <> new.cantidad then
		insert into historial_cambios(id_venta, cantidad_antes, cantidad_despues)
		values (old.id_venta, old.cantidad, new.cantidad);
	end if ;
end ;
$$
delimiter ;


# Ejercicio: Trigger para prevenir que se inserten ventas con cantidades Negativas
delimiter $$
create trigger validar_cantidad_venta
after update on sales
for each row
begin
	if new.cantidad < 0 then
	signal sqlstate '45000' # codigo de error "unhandled user-defined exception"
	set message_text = 'La cantidad no puede ser negativa' ;
	end if;
end ;
$$
delimiter ;


############
# PYTHON
############

# Extraccion de informacion de tablas desde Python usando MYSQL
# Esta es la query que copiamos al codigo de python de Extraccion de Informacion: "extraccion_ejercicio.py"
select
s.id_venta,
c.nombre as cliente,
p.nombre as producto,
s.cantidad,
s.fecha
from clase2.sales s 
join clase2.clients c on s.id_cliente = c.id_cliente
join clase2.products p on s.id_producto = p.id_producto
where s.fecha between '2024-06-05' and '2024-06-10' ;

# Insertar informacion desde Python
# Creamos una tabla donde se insertara la informacion desde Python
create table clase2.empleados(
	id_producto int auto_increment primary key,
	nombre varchar(100),
	edad int,
	puesto varchar(100)
);