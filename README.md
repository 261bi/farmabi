# farmabi

Laboratorio BI para construir un pipeline completo desde una base transaccional hasta un modelo analitico consumible en Power BI.

## Flujo general

```text
MySQL OLTP -> Airbyte o Debezium -> PostgreSQL RAW -> dbt -> PostgreSQL DW -> Power BI
```

## Estructura

```text
farmabi/
├── oltp-mysql/        - origen transaccional MySQL
├── dw-pg/             - PostgreSQL analitico
├── ingesta-airbyte/   - replica con Airbyte
├── ingesta-debezium/  - CDC con Debezium y Kafka
├── dw-dbt/            - transformacion con dbt
├── powerbi/           - consumo y visualizacion (Power BI)
└── docs/              - libro digital MkDocs
```

## Orden de ejecucion

Levanta los modulos en este orden; revisa el `README.md` de cada carpeta para detalles:

1. **`oltp-mysql/`** - base transaccional
2. **`dw-pg/`** - PostgreSQL analitico
3. **`ingesta-airbyte/`** o **`ingesta-debezium/`** - ingesta de datos
4. **`dw-dbt/`** - transformacion con dbt
5. **`powerbi/`** - visualizacion Power BI

## Inicio rapido

```powershell
# 1. MySQL OLTP
cd oltp-mysql
docker compose up -d

# 2. PostgreSQL DW
cd ../dw-pg
docker compose up -d

# 3. Ingesta (elegir una via)
# Opcion A: Airbyte
cd ../ingesta-airbyte
# seguir README.md

# Opcion B: Debezium CDC
cd ../ingesta-debezium
docker compose up -d
# Si es primera vez, seguir README.md de cd ../ingesta-debezium

# 4. dbt
cd ../dw-dbt
docker compose up -d --build
docker exec -it farmabi-dw-dbt bash
# dentro del contenedor:
# cd /usr/app/farmabi
# dbt run --select staging
# dbt run --select +marts
```

## Documentacion

Libro digital: [`docs/`](docs/) (MkDocs, sirve en `http://localhost:8002` con Docker):

```powershell
cd docs
docker compose up -d
```

## .gitignore

El proyecto incluye reglas para ignorar:

- Artefactos compilados (`*.class`, `*.jar`, `*.war`)
- Directorios de build (`target/`, `build/`, `out/`, `bin/`)
- Entornos virtuales (`venv/`, `.venv/`, `.env/`)
- Caches de Python y IDE (`__pycache__/`, `.vscode/`, `.idea/`)
- Archivos temporales y de datos locales (`*.log`, `data/`, `volumes/`)
