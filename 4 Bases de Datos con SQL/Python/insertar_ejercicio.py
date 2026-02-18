'''
This code connects to a MySQL database, executes a Query to Insert data to "empleados" table included in "clase2" database.
'''

# pip install mysql-connector-python
import mysql.connector

# Creates or gets a MySQL connection object.
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
# Consulta SQL para insertar datos
sql = "insert into clase2.empleados (nombre, edad, puesto) values (%s, %s, %s)"
valores = ("Ana Perez", 30, "Desarrolladora")

# Ejecutar e Insertar
cursor.execute(sql, valores)

 # Confirmar los cambios
conexion.commit()

# Imprimir para confirmar, i.e. "1 registro(s) insertado(s)."
print(f"{cursor.rowcount} registro(s) insertado(s).")

# Cerrar Conexion
cursor.close()
conexion.close()