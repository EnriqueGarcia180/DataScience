# Actividad 1: Crea dos objetos de cada tipo

objeto1 <- 5

# Forma alternativa para asignar nombre a un objeto

assign("objeto2", 7)

# Para imprimir el valor de un objeto se utiliza la función print()

print(objeto1)

# Comprobamos el tipo de objeto

mode(objeto1); mode(objeto2)

#Verificamos el longitud de cada objeto

length(objeto1); length(objeto2)

#Verificamos la clase de cada objeto

class(objeto1); class(objeto2)

#Verificamos la dimension de cada objeto

dim(objeto1); dim(objeto2)

# Objetos de tipo character
objeto3 <- "Hola Mundo"
objeto4 <- "Mi nombre es Enrique"

print(objeto3); print(objeto4)
mode(objeto3); mode(objeto4)
length(objeto3); length(objeto4)
class(objeto3); class(objeto4)
dim(objeto3); dim(objeto4)



# Objetos de tipo objeto4
# Objetos de tipo complex
objeto5 <- 5 + 3i
objeto6 <- 1i

print(objeto5); print(objeto6)
mode(objeto5); mode(objeto6)
length(objeto5); length(objeto6)
class(objeto5); class(objeto6)
dim(objeto5); dim(objeto6)


# Objetos de tipo Logical
objeto7 <- TRUE
objeto8 <- FALSE

print(objeto7); print(objeto8)
mode(objeto7); mode(objeto8)
length(objeto7); length(objeto8)
class(objeto7); class(objeto8)
dim(objeto7); dim(objeto8)


# Constantes y Variables

    #Una constante es un valor que no podemos cambiar, en contraste, una variable es un objeto que puede cambiar.

    #Las constantes y las variables en R tienen nombres que nos permiten hacer referencia a ellas en operaciones.

    #Las constantes ya están establecidas en R, mientras que nosotros podemos crear variables, asignándoles valores. 

# Actividad 2: Calcula el área de un círculo de radio 5.

radio <- 5
print(pi)
area_circulo <- round(pi * radio ^ 2, 2)
print(area_circulo)



# Actividad 3: Future Value (monto Acumulado)

  # 1. Define una variable llamada “tasa” y asígnale una tasa de interés compuesto del 5% anual.
  # 2. Define una variable llamada “capital” y asígnale un monto de $10,000
  # 3. Define una variable llamada “tiempo” y asígnale un valor de 5 años.
  # 4. Calcula el monto acumulado de esa operación financiera redondeado a un decimal.

tasa <- 0.05
capital <- 10000
tiempo <- 5
monto_acumulado <- round(capital * (1 + tasa) ^ tiempo, 1)
print(monto_acumulado)
# Concatenar texto con variables:
cat("El monto acumulado de la operacion financiera es:", monto_acumulado, "pesos")




# Actividad 4: Anualidad Vencida

  # 1. Define una variable llamada “tasa” y asígnale una tasa de interés mensual del 12%. 
  # 2. Crea una variable llamada “prestamo” y asígnale un valor de $100,000.
  # 3. Crea una variable llamada “periodos” y asígnale un valor de 6 meses. 
  # 4. Calcula el monto de los pagos mensuales de esta anualidad suponiendo que es una anualidad vencida.   
  # 5. Imprime el resultado usando la función cat()

tasa <- 0.12
prestamo <- 100000
periodos <- 6
pagos_mensuales <- (prestamo*tasa)/(1-(1+tasa)^-periodos)    # R = (VP * i) / (1 - (1 + i)^-n) Formula Anualidad Vencida
cat("Pagos mensuales:", pagos_mensuales)
