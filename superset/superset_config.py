import os

# Configuración de la base de datos MySQL
MYSQL_USER = os.getenv('MYSQL_USER', 'superset')
MYSQL_PASSWORD = os.getenv('MYSQL_PASSWORD', 'superset')
MYSQL_HOST = os.getenv('MYSQL_HOST', 'db')
MYSQL_PORT = os.getenv('MYSQL_PORT', '3306')
MYSQL_DATABASE = os.getenv('MYSQL_DATABASE', 'superset')

# SQLAlchemy URI para MySQL
SQLALCHEMY_DATABASE_URI = f'mysql+mysqldb://{MYSQL_USER}:{MYSQL_PASSWORD}@{MYSQL_HOST}:{MYSQL_PORT}/{MYSQL_DATABASE}'

# Configuración de Superset
SECRET_KEY = os.getenv('SUPERSET_SECRET_KEY', 'adiazc')