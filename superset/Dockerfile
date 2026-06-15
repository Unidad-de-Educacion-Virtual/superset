FROM apache/superset:4.1.2

USER root

# Instalar dependencias necesarias
RUN apt-get update && apt-get install -y \
    build-essential \
    default-libmysqlclient-dev \
    pkg-config \
    netcat-openbsd \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Instalar drivers de bases de datos (MySQL y PostgreSQL)
RUN pip install mysqlclient pymysql psycopg2-binary

# Crear directorio pythonpath
RUN mkdir -p /app/pythonpath

# Copiar archivos
COPY superset_config.py /app/pythonpath/superset_config.py
COPY init_superset.sh /app/docker/init_superset.sh

# Dar permisos de ejecución
RUN chmod +x /app/docker/init_superset.sh

USER superset

ENTRYPOINT ["/app/docker/init_superset.sh"]