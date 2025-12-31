# Usa la imagen oficial de n8n
FROM docker.n8n.io/n8nio/n8n:latest

# Establece la zona horaria
ENV GENERIC_TIMEZONE=America/Guayaquil
ENV TZ=America/Guayaquil

# Configuración de base de datos PostgreSQL
ENV DB_TYPE=postgresdb

# Define el puerto
EXPOSE 5678
