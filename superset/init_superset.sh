#!/bin/bash

# Esperar a que la base de datos esté lista
while ! nc -z db 3306; do
  sleep 1
done

# Crear usuario administrador
superset fab create-admin --username admin --firstname Superset --lastname Admin --email admin@superset.com --password admin

# Restablecer la contraseña del usuario admin
#superset fab reset-password --username admin --password newpassword

# Ejecutar migraciones de la base de datos
superset db upgrade


echo "Cargando datos de ejemplo..."
superset load_examples

# Inicializar Superset
echo "Inicializando Superset..."
superset init

# Iniciar Superset
exec superset run -h 0.0.0.0 -p 8088 --with-threads --reload --debugger

