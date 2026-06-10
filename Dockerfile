# 1. Imagen base ligera oficial de Python
FROM python:3.11-slim

# 2. Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# 3. Copiar primero solo los requerimientos para aprovechar el almacenamiento en caché de Docker
COPY app/requirements.txt .

# 4. Instalar las dependencias de Python sin cachear descargas (reduce tamaño de imagen)
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copiar el resto del código fuente de la aplicación hacia el contenedor
COPY app/ .

# 6. Exponer el puerto interno en el que corre la app Flask
EXPOSE 5000

# 7. Comando por defecto para arrancar la aplicación
CMD ["python", "app.py"]
