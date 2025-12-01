import os
from urllib.parse import quote_plus

# Obtener credenciales de las variables de entorno
mysql_user = os.getenv('MYSQL_USER', 'superset')
mysql_password = os.getenv('MYSQL_PASSWORD', 'superset')
mysql_host = 'db'
mysql_port = '3306'
mysql_database = os.getenv('MYSQL_DATABASE', 'superset')

# Codificar la contraseña para manejar caracteres especiales
encoded_password = quote_plus(mysql_password)

# Construir la URI de conexión (usando pymysql driver)
SQLALCHEMY_DATABASE_URI = f"mysql+pymysql://{mysql_user}:{encoded_password}@{mysql_host}:{mysql_port}/{mysql_database}"

# Secret key
SECRET_KEY = os.getenv('SUPERSET_SECRET_KEY', 'change-this-secret-key')

# Configuración de caché
CACHE_CONFIG = {
    'CACHE_TYPE': 'SimpleCache',
    'CACHE_DEFAULT_TIMEOUT': 300
}

# Configuración adicional
SQLALCHEMY_TRACK_MODIFICATIONS = False
SQLALCHEMY_ENGINE_OPTIONS = {
    'pool_pre_ping': True,
    'pool_recycle': 3600,
}