<!-- README generado automáticamente. Revísalo y completa los placeholders. -->
# UFPS Superset - Laboratorio Virtual de Analítica de Datos

[![](https://img.shields.io/badge/Apache%20Superset-4.1.2-blue)](https://superset.apache.org/) [![](https://img.shields.io/badge/Docker-20.10%2B-blue)](https://www.docker.com/) [![](https://img.shields.io/badge/License-Proyecto%20acad%C3%A9mico-lightgrey)]()

Breve descripción
---
UFPS Superset es un Laboratorio Virtual de Analítica de Datos para la Universidad Francisco de Paula Santander (UFPS). Implementa Apache Superset 4.1.2 containerizado con Docker y Docker Compose para facilitar despliegue, gestión de usuarios y prácticas de análisis y visualización de datos.

Tabla de contenidos
---
- [📋 Características principales](#-características-principales)
- [🚀 Arquitectura / Stack tecnológico](#-arquitectura--stack-tecnológico)
- [⚙️ Prerrequisitos](#️-prerrequisitos)
- [⚡ Instalación rápida](#-instalación-rápida)
- [🔑 Variables de entorno](#-variables-de-entorno)
- [🗂 Estructura del proyecto](#-estructura-del-proyecto)
- [📚 Documentación](#-documentación)
- [🔰 Uso básico](#-uso-básico)
- [🛠 Comandos útiles](#-comandosútiles)
- [🐞 Solución de problemas](#-solución-de-problemas)
- [🤝 Contribuir](#-contribuir)
- [📄 Licencia](#-licencia)
- [✍️ Autores / Créditos](#️-autores--créditos)

**📋 Características principales**
- Dashboards interactivos y visualizaciones ricas.
- SQL Lab para consultas ad-hoc.
- Conexión a múltiples bases de datos (MySQL, Postgres, etc.).
- Gestión de roles y usuarios (FAB - Flask AppBuilder).
- Carga y exploración de CSVs desde la interfaz.
- Soporte para datos de ejemplo (se cargan por defecto en este despliegue).

**🚀 Arquitectura / Stack tecnológico**

| Componente | Versión / Nota |
|---|---:|
| Apache Superset | 4.1.2 |
| Base de datos | MySQL 8.0 (imagen: `mysql:8.0`) |
| Contenedores | Docker, Docker Compose v2 (`docker compose`) |
| Driver BD instalado | `mysqlclient` (instalado en `Dockerfile`) |

**⚙️ Prerrequisitos**
- Docker v20.10+
- Docker Compose v2 (uso de `docker compose` en lugar de `docker-compose`)
- RAM y almacenamiento recomendados: <!-- TODO: completar: memoria mínima y espacio en disco recomendado (ej. 4GB RAM, 10GB disco) -->

**⚡ Instalación rápida**
1. Clona el repositorio:

```bash
git clone https://github.com/alfreddiazc/ufps_superset.git
cd ufps_superset
```

2. Crea un archivo de entorno `.env` (ver sección Variables de entorno).
3. Levanta los servicios:

```bash
docker compose up -d --build
```

4. Accede en el navegador en `http://localhost:8088`.

**🔑 Variables de entorno**

Este proyecto no contiene un `.env` por seguridad; `docker-compose.yml` referencia variables que debes definir. A continuación hay un ejemplo de `.env` y la descripción de cada variable.

Ejemplo de `.env` (crear en la raíz del repo):

```env
# Superset
SUPERSET_LOAD_EXAMPLES=yes
SUPERSET_SECRET_KEY=<!-- TODO: cambiar por una clave segura -->

# MySQL
MYSQL_ROOT_PASSWORD=supersecretroot
MYSQL_DATABASE=superset
MYSQL_USER=superset
MYSQL_PASSWORD=superset
```

| Variable | Descripción | Valor por defecto / Ejemplo |
|---|---|---|
| `SUPERSET_LOAD_EXAMPLES` | Indica si se cargan los ejemplos al iniciar | `yes` / `no` |
| `SUPERSET_SECRET_KEY` | Clave secreta para Flask / Superset | `<!-- TODO: completar -->` |
| `MYSQL_ROOT_PASSWORD` | Contraseña del usuario root de MySQL | `<!-- TODO: completar -->` |
| `MYSQL_DATABASE` | Nombre de la base de datos creada para Superset | `superset` |
| `MYSQL_USER` | Usuario de la base de datos | `superset` |
| `MYSQL_PASSWORD` | Contraseña del usuario de la base de datos | `superset` |

Nota de seguridad: no subas tu archivo `.env` real al repositorio ni incluyas credenciales en commits públicos.

**🗂 Estructura del proyecto**

```
.
├─ docker-compose.yml            # Orquesta servicios (superset + mysql)
├─ README.md                     # <-- Este archivo
├─ index.html                    # Manual interactivo local (Carga Semestral Superset)
├─ docs/                         # Manuales y documentación (PDF / HTML)
│  ├─ 001 Manual de implementacion v2.pdf
│  ├─ 001 Manual_Usuario_Superset v2.pdf
│  └─ Manual_Interactivo_Carga_Superset.html
└─ superset/
   ├─ Dockerfile                 # Imagen personalizada basada en apache/superset
   ├─ init_superset.sh           # Script de inicialización (crea admin, migraciones, carga ejemplos)
   └─ requirements-local.txt     # Requerimientos locales (mysqlclient)
```

Breve descripción de archivos principales:
- `docker-compose.yml`: define servicios `superset` y `db` (MySQL 8.0), puertos y volúmenes.
- `superset/Dockerfile`: instala dependencias del sistema y `mysqlclient`, copia `init_superset.sh` y arranca Superset.
- `superset/init_superset.sh`: espera MySQL, crea el usuario `admin`, ejecuta migraciones, carga ejemplos e inicia el servidor Superset.
- `docs/`: contiene manuales disponibles (PDF y manual interactivo HTML).

**📚 Documentación**
- Manual de implementación: `docs/001 Manual de implementacion v2.pdf` (instalación, drivers BD, mantenimiento).
- Manual de usuario / carga de usuarios: `docs/001 Manual_Usuario_Superset v2.pdf`.
- Manual interactivo de carga semestral de usuarios (versión local): `index.html` — "Manual Interactivo — Carga Semestral Superset" (archivo `index.html` en la raíz).
- Manual interactivo en `docs`: `docs/Manual_Interactivo_Carga_Superset.html` — también publicado en GitHub Pages: [https://unidad-de-educacion-virtual.github.io/superset/](https://unidad-de-educacion-virtual.github.io/superset/).
- Aplicación pública (instancia desplegada): [https://superset.applab.ufps.edu.co/superset/welcome/](https://superset.applab.ufps.edu.co/superset/welcome/)

**🔰 Uso básico**

- Inicio de sesión por defecto (creado por `init_superset.sh`):

```
Usuario: admin
Contraseña: admin
```

Advertencia: cambia la contraseña de `admin` inmediatamente en la interfaz o mediante CLI (`superset fab reset-password --username admin --password <nueva>`).

- Conectar una nueva base de datos:
  1. En Superset, ve a `Data -> Databases -> + Database`.
  2. Rellena la URI de SQLAlchemy (ej. `mysql://user:password@host:3306/dbname`).
  3. Testea la conexión y guarda.

- Cargar un CSV:
  1. `Data -> Datasets -> + Dataset` o `Sources -> Upload a CSV` (según interfaz).
  2. Sube el archivo CSV, configura el separador, tipos de columna y guarda.

**🛠 Comandos útiles**

| Propósito | Comando |
|---|---|
| Levantar los servicios | `docker compose up -d --build` |
| Ver estado de contenedores | `docker compose ps` |
| Ver logs del servicio Superset | `docker compose logs -f superset` |
| Reiniciar Superset | `docker compose restart superset` |
| Entrar a la shell del contenedor Superset | `docker compose exec superset /bin/bash` |
| Resetear contraseña admin (desde el contenedor) | `superset fab reset-password --username admin --password <nueva>` |
| Backup de la base de datos MySQL | `docker exec mysql sh -c 'exec mysqldump -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE' > backup.sql` |

**🐞 Solución de problemas**

1. Contenedor `superset` no inicia
   - Síntoma: el contenedor se reinicia o sale inmediatamente.
   - Solución: ver logs `docker compose logs superset` y revisar errores de dependencias o rutas. Asegúrate de que MySQL esté accesible (ver `depends_on` y que la variable `MYSQL_*` esté configurada).

2. Error de conexión a MySQL
   - Síntoma: `OperationalError: (2003, "Can't connect to MySQL server")` u otros errores de conexión.
   - Solución: comprueba que el contenedor MySQL esté sano `docker compose logs db`, verifica puertos y credenciales en `.env`. En este compose MySQL expone el puerto `33061` en host y el servicio se llama `db` dentro de la red.

3. Error de driver faltante al instalar dependencias (`mysqlclient`)
   - Síntoma: `mysqlclient` falla al compilar o importar.
   - Solución: el `Dockerfile` incluye instalación de `default-libmysqlclient-dev` y `build-essential` antes de `pip install mysqlclient`. Si trabajas localmente, instala dependencias del sistema para compilar el driver (por ejemplo `libmysqlclient-dev` en Debian/Ubuntu).

4. Error al subir CSV (DML / permisos)
   - Síntoma: operaciones de escritura fallan o aparecen errores SQL al subir un CSV.
   - Solución: verifica que el usuario de la base de datos tenga permisos de INSERT/CREATE según corresponda; revisa la URI de conexión y que el esquema/tabla destino sea accesible.

**🤝 Contribuir**

Si quieres proponer cambios:

1. Haz fork del repositorio.
2. Crea una branch descriptiva: `git checkout -b feat/mi-mejora`.
3. Añade commits claros y tests/documentación si aplica.
4. Abre un Pull Request contra `main` y describe brevemente tu cambio.

**📄 Licencia**

No se encontró un archivo `LICENSE` en el repositorio. Este repositorio se entrega como:

> Proyecto académico — Universidad Francisco de Paula Santander (UFPS)

Si deseas aplicar una licencia OSS, añade un archivo `LICENSE` y actualiza este README.

**✍️ Autores / Créditos**

- Autor principal / equipo: `<!-- TODO: agregar nombres de los desarrolladores -->`
- Repositorio original: `alfreddiazc/ufps_superset` (branch `main`)

---

Si quieres, puedo:
- Añadir un archivo `.env.example` automáticamente con los valores base.
- Publicar la URL de GitHub Pages si está disponible.
- Añadir instrucciones para backing up y restauración más detalladas.

*** Fin del README generado automáticamente. Revisa y completa los placeholders marcados. ***
