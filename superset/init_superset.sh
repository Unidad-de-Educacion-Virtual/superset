#!/bin/bash

# Esperar a que MySQL esté listo
echo "Esperando a que MySQL esté listo..."
while ! nc -z db 3306; do
  sleep 1
done
echo "MySQL está listo!"

# Ejecutar migraciones de la base de datos
echo "Ejecutando migraciones de la base de datos..."
superset db upgrade

# Crear usuario administrador (solo si no existe)
echo "Creando usuario administrador..."
superset fab create-admin \
    --username admin \
    --firstname Superset \
    --lastname Admin \
    --email admin@superset.com \
    --password admin || echo "El usuario admin ya existe"

# Cargar datos de ejemplo si está configurado
if [ "$SUPERSET_LOAD_EXAMPLES" = "yes" ]; then
    echo "Cargando datos de ejemplo..."
    superset load_examples
fi

# Inicializar Superset
echo "Inicializando Superset..."
superset init

# Iniciar Superset
exec superset run -h 0.0.0.0 -p 8088 --with-threads --reload --debugger