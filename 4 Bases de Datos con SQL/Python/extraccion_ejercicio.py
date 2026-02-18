'''
This code connects to a MySQL database, executes a Query to retrieve data from "sales" table included in "clase2" database.
'''

# pip install mysql-connector-python
import mysql.connector

#Creates or gets a MySQL connection object.
conexion = mysql.connector.connect(
    host="127.0.0.1",       # usar esta IP en lugar de localhost, ver en: http://localhost/phpmyadmin/
    port = 3306,            # se puede ver en DBeaver: localhost -> right click -> Server -> Port
    user="root",            # se puede ver en DBeaver: localhost -> right click -> Authentication -> Username
    password="",            # En XAMPP, el usuario no tiene contrasena por defecto
    database="clase2"       # esta es la base de datos en donde se encuentran las tablas
)

# Instantiates and returns an SQL cursor.
# Crear Cursor
cursor = conexion.cursor()

# Query:
# Esta es la Query que probamos en DBeaver para Obtener Informacion
query = """
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
"""

# Ejecutar y Extraer datos
cursor.execute(query)
resultados = cursor.fetchall()

# Imprimir datos
for fila in resultados:
    print(fila)

# Cerrar Conexion
cursor.close()
conexion.close()