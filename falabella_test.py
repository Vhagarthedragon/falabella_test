import pandas as pd
import matplotlib.pyplot as plt

# Cargar los datos de los archivos CSV
archivo1 = "StudentsPerformance_inf (1).csv"
archivo2 = "StudentsPerformance_score.csv"

datos1 = pd.read_csv(archivo1, delimiter=";")
datos2 = pd.read_csv(archivo2, delimiter=";")

# Fusionar los datos en función del ID
datos_fusionados = pd.merge(datos1, datos2, on="id")

# Guardar los datos fusionados en un nuevo archivo CSV
archivo_final = "archivo_final.csv"
datos_fusionados.to_csv(archivo_final, index=False)

# Mostrar un gráfico o tabla dinámica con la información relevante
# Por ejemplo, podrías mostrar un histograma de las calificaciones de matemáticas
plt.hist(datos_fusionados["math score"], bins=10)
plt.title("Histograma de Calificaciones de Matemáticas")
plt.xlabel("Calificación")
plt.ylabel("Frecuencia")
plt.show()



# Crear un gráfico de dispersión de las calificaciones de matemáticas vs. lectura
plt.scatter(datos_fusionados["math score"], datos_fusionados["reading score"])
plt.title("Calificaciones de Matemáticas vs. Lectura")
plt.xlabel("Calificación de Matemáticas")
plt.ylabel("Calificación de Lectura")
plt.grid(True)
plt.show()



# Calcular las calificaciones promedio en matemáticas por grupo étnico/racial
calificaciones_promedio = datos_fusionados.groupby("race/ethnicity")["math score"].mean().reset_index()

# Crear un gráfico de barras de las calificaciones promedio en matemáticas por grupo étnico/racial
plt.bar(calificaciones_promedio["race/ethnicity"], calificaciones_promedio["math score"])
plt.title("Calificaciones Promedio en Matemáticas por Grupo Étnico/Racial")
plt.xlabel("Grupo Étnico/Racial")
plt.ylabel("Calificación Promedio de Matemáticas")
plt.xticks(rotation=45)
plt.grid(axis="y")
plt.show()