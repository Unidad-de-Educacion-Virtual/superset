FROM apache/superset

USER root

# Instalar dependencias necesarias
RUN apt-get update && apt-get install -y \
    build-essential \
    default-libmysqlclient-dev \
    pkg-config \
    netcat-openbsd \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Instalar mysqlclient
RUN pip install mysqlclient

# Añadir script de inicialización
COPY init_superset.sh /app/docker/init_superset.sh
RUN chmod +x /app/docker/init_superset.sh

USER superset

# Ejecutar script de inicialización
ENTRYPOINT ["/app/docker/init_superset.sh"]