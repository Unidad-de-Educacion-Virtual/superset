-- Crear usuario superset_admin si no existe
CREATE USER IF NOT EXISTS 'superset_admin'@'%' IDENTIFIED BY 'mJWbmUcCpnQ@RT@udEe';

-- Otorgar todos los privilegios en la base de datos superset
GRANT ALL PRIVILEGES ON superset.* TO 'superset_admin'@'%';

-- Aplicar cambios
FLUSH PRIVILEGES;
