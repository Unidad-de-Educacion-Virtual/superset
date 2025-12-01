#!/bin/bash
set -e

echo "Esperando a que MySQL esté disponible..."
while ! nc -z db 3306; do
  echo "MySQL no está listo - esperando..."
  sleep 2
done

echo "MySQL está listo!"

# Actualizar la base de datos
echo "Actualizando base de datos..."
superset db upgrade

# Crear usuario administrador (solo si no existe)
echo "Creando usuario administrador..."
superset fab create-admin \
    --username admin \
    --firstname Superset \
    --lastname Admin \
    --email admin@superset.com \
    --password admin || echo "Admin ya existe"

# Cargar ejemplos si está habilitado
if [ "$SUPERSET_LOAD_EXAMPLES" = "yes" ]; then
    echo "Cargando datos de ejemplo..."
    superset load_examples
fi

# Inicializar Superset
echo "Inicializando Superset..."
superset init

# Iniciar Superset
echo "Iniciando servidor Superset..."
exec superset run -h 0.0.0.0 -p 8088 --with-threads --reload