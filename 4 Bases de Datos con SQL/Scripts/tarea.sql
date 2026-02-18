#Ejercicios

# 1.Obtener todos los registros de la tabla envios.
select * from clase1.envios;

# 2. Objetivo: Obtener todos los envíos cuyo estado_envio sea "En tránsito".
select * from clase1.envios
where estado_envio = 'En tránsito';

# 3. Consulta con Condiciones (AND/OR)
# Objetivo: Obtener los envíos cuya empresa_envio sea "DHL" y cuyo estado_envio sea "Entregado".
select * from clase1.envios
where empresa_envio = 'DHL' and estado_envio = 'Entregado';

# 4. Objetivo: Obtener todos los envíos ordenados por fecha_envio de manera descendente (más reciente primero).
select * from clase1.envios
order by fecha_envio desc;

#5. Limitar Resultados (LIMIT)
# Objetivo: Obtener los primeros 5 envíos más recientes.

select * from clase1.envios
order by fecha_envio desc
limit 5;

# 6. Contar Registros (COUNT)
# Objetivo: Contar cuántos envíos están actualmente en estado "Pendiente".
select 
count(e.id_envio) as envios_pendientes
from clase1.envios e 
where e.estado_envio = 'Pendiente' ;


# 7. Actualizar un Registro (UPDATE)
# Objetivo: Cambiar el estado_envio de un envío con id_envio igual a 1, a "Entregado".
update clase1.envios e
set estado_envio = 'Entregado'
where e.id_envio = 1 ;

# 8. Eliminar un Registro (DELETE)
# Objetivo: Eliminar el envío con id_envio igual a 10.
delete from clase1.envios
where id_envio = 10;

# 9. Insertar un Nuevo Registro (INSERT INTO)
# Objetivo: Insertar un nuevo envío con los siguientes datos:

# id_orden: 2001
# direccion_envio: "Calle Ficticia 123, Ciudad Ejemplo"
# empresa_envio: "FedEx"
# numero_guia: "FX-123456"
# fecha_envio: "2025-05-12"
# fecha_entrega_estimada: "2025-05-15"
# estado_envio: "En tránsito"

insert into clase1.envios 
	(id_envio, id_orden, direccion_envio, empresa_envio, numero_guia, fecha_envio, fecha_entrega_estimada, estado_envio)
values
	(23, 2001, 'Calle Ficticia 123, Ciudad Ejemplo', 'FedEx', 'FX-123456', '2025-05-12', '2025-05-15', 'En tránsito');


# 10. Actualizar varios registros (UPDATE)
# Objetivo: Cambiar el estado_envio de todos los envíos que tienen estado_envio igual a "En tránsito", a "Entregado".

update clase1.envios
set estado_envio = 'Entregado'
where estado_envio = 'En tránsito';

#observar si hay nulos en  fecha_entrega_estimada, fecha_envio,  estado_envio
select
e.fecha_entrega_estimada,
e.fecha_envio,
e.estado_envio
from clase1.envios e 
where e.fecha_entrega_estimada is null 
or e.fecha_envio is null
or e.estado_envio is null ;

