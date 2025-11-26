FROM apache/superset

USER root

# Instalar dependencias del sistema necesarias para los drivers
RUN apt-get update && apt-get install -y \
    build-essential \
    default-libmysqlclient-dev \
    libpq-dev \
    pkg-config \
    netcat-openbsd \
    freetds-dev \
    libsasl2-dev \
    libldap2-dev \
    libssl-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copiar archivo de requirements personalizados
COPY requirements-local.txt /app/docker/requirements-local.txt

# Instalar todos los drivers de bases de datos
RUN pip install --no-cache-dir -r /app/docker/requirements-local.txt

# Añadir script de inicialización y configuración
COPY init_superset.sh /app/docker/init_superset.sh
COPY superset_config.py /app/pythonpath/superset_config.py

RUN chmod +x /app/docker/init_superset.sh

USER superset

# Ejecutar script de inicialización
ENTRYPOINT ["/app/docker/init_superset.sh"]