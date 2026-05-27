# Libro Digital farmabi - Business Intelligence

Este directorio publica la documentacion del proyecto `farmabi` como libro digital en Markdown usando MkDocs Material.

## Que encontrara el estudiante

- Sesiones de BI end-to-end.
- Guias para OLTP, ingesta, DW, dbt y Power BI.
- Material historico conservado como referencia.
- Diagramas Mermaid renderizables en GitHub y MkDocs.

## Enfoque del proyecto

El proyecto construye un pipeline BI educativo desde MySQL OLTP hacia PostgreSQL, dbt y Power BI.

## Ruta de aprendizaje

| Bloque | Contenido | Producto esperado |
|---|---|---|
| Origen y DW | MySQL OLTP, PostgreSQL DW | Bases operativas para BI |
| Ingesta y transformacion | Airbyte, Debezium, dbt | Modelo analitico en `staging` y `marts` |
| Consumo BI | Power BI, DAX, gobierno del dato | Dashboard y entregable final |

## Ejecucion local

### Con Docker (recomendado)

```powershell
cd docs
docker compose up -d
```

Luego abra:

```text
http://127.0.0.1:8002/
```

### Con Python local

```powershell
python -m pip install mkdocs mkdocs-material pymdown-extensions
cd ..
mkdocs serve
```

## Generacion del sitio

```powershell
docker compose run --rm mkdocs mkdocs build -f mkdocs.yml
```

o bien:

```powershell
mkdocs build
```

## Estructura del libro

- `sesiones/`: documentacion de clase.
- `guias/`: plantillas y guias complementarias.
- `historico/`: material conservado como referencia.
